# Hui Li · Personal Homepage

个人主页：[howarlii.github.io](https://howarlii.github.io)。使用 [AcademicPages](https://github.com/academicpages/academicpages.github.io) 的 Jekyll 模板，托管于 GitHub Pages。

2026-10-23 已同步官方提交 [`7b958332`](https://github.com/academicpages/academicpages.github.io/commit/7b958332ce9970cfb6987a049d7684ac615397e8)（2026-10-18）。使用新版布局、明暗主题切换、Jekyll 4.4.1 和前端脚本；保留个人介绍、论文、竞赛、教育、荣誉、工作经历和附件路径。CV 页使用已有简历 PDF。上游基准和本地适配记录见 [`docs/academicpages-upgrade.md`](docs/academicpages-upgrade.md)。

## 日常维护位置

| 修改什么 | 文件 |
| --- | --- |
| 首页栏目顺序、页面标题 | `_pages/about.md` |
| 首页个人介绍、CV 下载链接 | `_pages/home/intro.html` |
| 首页论文及缩略图 | `_pages/home/research.html` |
| 竞赛标识、奖牌和奖项 | `_pages/home/competitions.html` |
| 教育经历 | `_pages/home/education.html` |
| 荣誉与奖学金 | `_pages/home/honors.html` |
| 工作经历 | `_pages/home/work.html` |
| 访客地图地址 | `_config.yml` 中的 `visitor_map` |
| 页脚访客地图布局 | `_includes/visitor-map.html`、`_includes/footer.html` 和 `assets/css/custom.css` |
| 照片、侧栏简介、邮箱和社交账号 | `_config.yml` 中的 `author` |
| 顶部导航 | `_data/navigation.yml` |
| 完整论文列表 | `_pages/publications.md` |
| 助教课程列表 | `_pages/teaching.md` |
| CV 页面 | `_pages/cv.md` |
| 首页/论文页/CV 页样式 | `assets/css/pages/about.css`、`publications.css`、`cv.css` |
| 页面通用颜色与暗色适配 | `assets/css/custom.css` |
| AcademicPages 配色方案 | `_config.yml` 中的 `site_theme` |

完整论文列表已与首页论文对齐，包括顺序、标题、作者、会议信息及 Paper/Code 链接。更新论文时同步维护两处，避免内容或链接不一致。

页面保留旧版 15px 基准字号、正文宽度、顶部菜单字体和圆角矩形头像；首页紫色线条位于标题下方。访客地图使用站主提供的 MapMyVisitors 官方图片嵌入码，显示在各页页脚右侧，桌面宽 160px、窄屏宽 140px。修改地图账号时，同时更新 `visitor_map` 下的图片地址和统计页地址。

图片放在 `images/`，PDF 等附件放在 `files/`。保留已公开的附件路径，避免旧链接失效。

## 源码结构

- `_pages/`：页面入口和固定网址。
- `_pages/home/`：首页的六个内容栏目，由 `about.md` 使用 `include_relative` 引入，不单独发布为页面。
- `assets/css/pages/`：个人页面的布局和组件样式，通过 CSS 变量适配明暗模式。
- `_layouts/`、`_includes/`、`_sass/`：新版 AcademicPages 的布局、组件和主题样式；日常内容更新通常不需要修改。
- `assets/js/`、`assets/webfonts/`、`assets/fonts/`：新版主题脚本和图标字体。
- `scripts/`：构建后的基础检查；不发布到网站。

已清理模板示例论文、博客、课程、演讲、占位作者和评论，以及未使用的演讲地图、生成器、演示页面和旧素材。公开页面保留主页、论文、Teaching、CV、Sitemap 和 404；Sitemap 只列出实际导航页面。清理范围见 [`docs/academicpages-upgrade.md`](docs/academicpages-upgrade.md)。新版主题组件及 `LICENSE` 中的原版权与 MIT 许可保留。

## 本地预览

使用 `.ruby-version` 指定的 Ruby **3.3.12** 和 `Gemfile.lock` 对应的 Bundler **2.5.6**。不要使用 macOS 自带的 Ruby 2.6。

使用 Node.js **22**；`package-lock.json` 锁定前端构建依赖。

```sh
gem install bundler -v 2.5.6
bundle config set --local path vendor/bundle
bundle install
npm ci --ignore-scripts --no-audit --no-fund
npm run build:js
bundle exec jekyll serve --config _config.yml,_config.dev.yml --host 127.0.0.1
```

打开 <http://localhost:4000>。修改配置后重启服务。日常文字和 CSS 更新不需要重建 JavaScript；修改 `assets/js/_main.js`、`theme.js` 或导航脚本后运行 `npm run build:js`。

## 验证与发布

```sh
npm run build:js
JEKYLL_ENV=production bundle exec jekyll build --strict_front_matter --trace
bundle exec ruby scripts/check_site.rb
git diff --check
```

检查覆盖全部生成的 HTML（含重定向），以及 Sitemap、Feed、站内链接、图片、图标、样式、脚本、内嵌 PDF 和字体；同时阻止示例占位内容和源码工具误发布。不联网检查外部网址。

`.github/workflows/pages.yml` 在 `main` 推送、PR 和手动触发时重建脚本、构建并检查。仅 `main` 的推送和手动运行会部署；PR 只验证。

首次发布新版时，在仓库 **Settings → Pages → Build and deployment → Source** 选择 **GitHub Actions**。新版使用 Dart Sass 和 Jekyll 4.4，需由此工作流构建，不能沿用 GitHub Pages 的内置 Jekyll 3 构建。提交源码和两个锁文件，不提交 `vendor/`、`node_modules/`、`.bundle/` 或 `_site/`。

## 模板来源

当前代码来自 [Academic Pages](https://github.com/academicpages/academicpages.github.io)，其底层是 [Minimal Mistakes](https://github.com/mmistakes/minimal-mistakes)。

2026-10-23 查询 [GitHub 仓库元数据](https://api.github.com/repos/howarlii/howarlii.github.io)时，`fork` 为 `false`；创建时的 `template_repository` 指向 HugoBlox Academic CV。本地历史则从 2025-09-16 的 Academic Pages 代码导入开始，因此最初创建仓库时的模板与当前实际使用的模板不同。
