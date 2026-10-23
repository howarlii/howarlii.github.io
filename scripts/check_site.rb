# Check the entire generated site, including pages outside the main navigation.
# Nokogiri is declared in Gemfile so this also works outside github-pages.
require "nokogiri"
require "pathname"
require "uri"

root = Pathname.new(ARGV.fetch(0, "_site")).expand_path
errors = []
required_pages = %w[index.html publications/index.html teaching/index.html cv/index.html sitemap/index.html 404.html]
pages = root.glob("**/*.html").map { |file| file.relative_path_from(root).to_s }
local_hosts = %w[howarlii.github.io localhost 127.0.0.1]

resolve = lambda do |page, link|
  uri = URI.parse(link)
  next if uri.scheme && !%w[http https].include?(uri.scheme)
  next if uri.host && !local_hosts.include?(uri.host)
  route = page.sub(/index\.html\z/, "")
  target_uri = URI.join("https://site.local/#{route}", link)
  target = root.join(URI::DEFAULT_PARSER.unescape(target_uri.path).delete_prefix("/")).cleanpath
  target = target.join("index.html") if target.directory?
  [target, target_uri.fragment]
end

required_pages.each do |name|
  errors << "missing page: #{name}" unless root.join(name).file?
end

pages.each do |name|
  file = root.join(name)
  document = Nokogiri::HTML(file.read)
  errors << "#{name}: missing page title" if document.at_css("title")&.text.to_s.strip.empty?
  if required_pages.include?(name) && !document.at_css("#main")
    errors << "#{name}: missing original page container"
  end
  selectors = "body a[href], img[src], iframe[src], script[src], link[rel~='stylesheet'][href], link[rel~='icon'][href], link[rel~='apple-touch-icon'][href], link[rel~='manifest'][href]"
  document.css(selectors).each do |element|
    link = element["src"] || element["href"]
    next if link.nil? || link.empty?
    begin
      result = resolve.call(name, link)
      next unless result
      target, fragment = result
      if !target.file?
        errors << "#{name}: missing local resource #{link}"
      elsif fragment && !fragment.empty? && target.extname == ".html"
        target_document = Nokogiri::HTML(target.read)
        decoded_fragment = URI::DEFAULT_PARSER.unescape(fragment)
        unless target_document.xpath('//*[@id]').any? { |node| node["id"] == decoded_fragment }
          errors << "#{name}: missing anchor #{link}"
        end
      end
    rescue URI::InvalidURIError => error
      errors << "#{name}: invalid URL #{link.inspect}: #{error.message}"
    end
  end
end

root.glob("assets/css/**/*.css").each do |stylesheet|
  name = stylesheet.relative_path_from(root).to_s
  stylesheet.read.scan(/url\(\s*['"]?([^'"\)\s]+)['"]?\s*\)/).flatten.each do |link|
    result = resolve.call(name, link)
    errors << "#{name}: missing font or CSS resource #{link}" if result && !result.first.file?
  end
end

%w[docs scripts README.md CONTRIBUTING.md Gemfile Gemfile.lock package.json package-lock.json node_modules .bundle markdown_generator talkmap talkmap.py talkmap.ipynb].each do |name|
  errors << "source-only path published: #{name}" if root.join(name).exist?
end

%w[sitemap.xml feed.xml].each do |name|
  file = root.join(name)
  unless file.file?
    errors << "missing XML: #{name}"
    next
  end
  document = Nokogiri::XML(file.read) { |config| config.strict.nonet }
  if name == "sitemap.xml"
    document.remove_namespaces!
    document.xpath("//loc").each do |node|
      result = resolve.call(name, node.text)
      errors << "sitemap: missing page #{node.text}" if result && !result.first.file?
    end
  end
end

placeholder = /Paper Title Number \d|Blog Post number \d|Teaching experience \d|Portfolio item number \d|Name2? Name2?/
root.glob("**/*.{html,xml}").each do |file|
  errors << "template sample content published: #{file.relative_path_from(root)}" if file.read.match?(placeholder)
end

abort errors.join("\n") unless errors.empty?
puts "Site OK: all #{pages.length} HTML pages; sitemap, feed, local links and assets checked."
