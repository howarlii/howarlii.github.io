---
# Leave the homepage title empty to use the site title
title: ""
date: 2022-10-24
type: landing

design:
  # Default section spacing
  spacing: "2rem"

sections:
  - block: resume-biography-3
    content:
      # Choose a user profile to display (a folder name within `content/authors/`)
      username: admin
      text: ""
      # Show a call-to-action button under your biography? (optional)
      # button:
      #   text: Download CV
      #   url: uploads/resume.pdf
    design:
      # css_class: dark
      background:
        # color: gray
        # color: black
        # image:
    #       # Add your image background to `assets/media/`.
          # filename: stacked-peaks.svg
          # filters:
          #   brightness: 1.0
    #       size: cover
    #       position: center
    #       parallax: false

  # - block: markdown
  #   content:
  #     title: '📚 My Research'
  #     subtitle: ''
  #     text: |-
  #       Use this area to speak to your mission. I'm a research scientist in the Moonshot team at DeepMind. I blog about machine learning, deep learning, and moonshots.

  #       I apply a range of qualitative and quantitative methods to comprehensively investigate the role of science and technology in the economy.

  #       Please reach out to collaborate 😃
  #   design:
  #     columns: '1'

  # - block: collection
  #   id: papers
  #   content:
  #     title: Featured Publications
  #     filters:
  #       folders:
  #         - publication
  #       featured_only: true
  #   design:
  #     view: article-grid
  #     columns: 2

  - block: collection
    id: publications
    content:
      title: Publications
      # text: "12"
      filters:
        folders:
          - publication
        exclude_featured: false
    design:
      view: citation
      css_class: "bg-adaptive"


  - block: lf-experience
    id: experience
    content:
      title: Intership
      # Choose a user profile to display (a folder name within `content/authors/`)
      username: admin
      # Show a call-to-action button under your biography? (optional)
      # button:
      #   text: Download CV
      #   url: uploads/resume.pdf
    # design:
    #   css_class: dark

  # - block: collection
  #   id: talks
  #   content:
  #     title: Recent & Upcoming Talks
  #     filters:
  #       folders:
  #         - event
  #   design:
  #     view: article-grid
  #     columns: 1
  # # - block: collection
  #   id: news
  #   content:
  #     title: Recent News
  #     subtitle: ''
  #     text: ''
  #     # Page type to display. E.g. post, talk, publication...
  #     page_type: post
  #     # Choose how many pages you would like to display (0 = all pages)
  #     count: 5
  #     # Filter on criteria
  #     filters:
  #       author: ""
  #       category: ""
  #       tag: ""
  #       exclude_featured: false
  #       exclude_future: false
  #       exclude_past: false
  #       publication_type: ""
  #     # Choose how many pages you would like to offset by
  #     offset: 0
  #     # Page order: descending (desc) or ascending (asc) date.
  #     order: desc
  #   design:
  #     # Choose a layout view
  #     view: date-title-summary
  #     # Reduce spacing
  #     spacing:
  #       padding: [0, 0, 0, 0]

  - block: markdown
    id: competition
    content:
      title: Competition Medals
      text: |-
        <div style="display: grid; grid-template-columns: 1fr 1fr; grid-template-rows: auto auto; gap: 1.5rem; max-width: 1000px; margin: 2rem auto; align-items: start;">
          <!-- Top Left: ICPC Logo -->
          <div style="grid-column: 1; grid-row: 1; display: flex; flex-direction: column; align-items: center; justify-content: center; background: none; box-shadow: none; border-radius: 0; margin-top: -3.5rem;">
            <img src="https://icpc.foundation/wp-content/uploads/2024/07/icpc_foundation.png" alt="ICPC Logo" style="width: 240px; height: auto; border-radius: 12px; margin-bottom: 0rem;" />
            <div style="display: flex; align-items: center; margin-top: -1.5rem;">
              <img src="https://gw.alicdn.com/tfs/TB1T9YCeVYqK1RjSZLeXXbXppXa-189-189.png" alt="CCPC Logo" style="width: 70px; height: auto; border-radius: 12px;" />
              <div style="margin-left: 0.3rem; display: flex; flex-direction: column;">
                <span style="font-size: 1.1rem; font-weight: bold; color: #1a237e;">中国大学生程序设计竞赛</span>
                <span style="font-size: 0.66rem; color: #333;">China Collegiate Programming Contest</span>
              </div>
            </div>
          </div>
          <!-- Top Right: Gold Medal Card -->
          <div style="grid-column: 2; grid-row: 1; background: linear-gradient(135deg, #FFD700 60%, #FFF8DC 100%); border-radius: 16px; box-shadow: 0 2px 8px rgba(0,0,0,0.08); padding: 1.2rem 1.2rem; min-width: 220px; display: flex; flex-direction: column; justify-content: flex-start; gap: 0.2rem; align-self: start; position: relative;">
            <div style="position: absolute; top: 0.4rem; right: 0.4rem; font-size: 1.1rem; font-weight: bold; color: #fff; background: #8C7000; padding: 0.1em 0.7em; border-radius: 1em; letter-spacing: 0.05em;">×9</div>
            <div style="font-size: 1.4rem; font-weight: bold; color: #8C7000; margin-bottom: 0rem; margin-left: -0.5rem; margin-top: -0.7rem;">🥇 Gold Medal</div>
            <div style="font-size: 1.0rem; color: #333;">
              <ul style="margin: 0; padding-left: 0.3em; line-height: 1;">
                <li><b>2021 ICPC Asia East Continent Final</b></li>
                <li>2022 ICPC Nanjing Region</li>
                <li>2022 ICPC Xi'an region</li>
                <li>2021 ICPC Macau Region</li>
                <li>2021 ICPC Jinan Region</li>
                <li>2020 ICPC Kunming Region</li>
                <li>2020 ICPC Jinan Region</li>
                <li>2021 CCPC Haerbin Region</li>
                <li>2020 CCPC Weihai Region</li>
              </ul>
            </div>
          </div>
          <!-- Bottom Left: Silver Medal Card -->
          <div style="grid-column: 1; grid-row: 2; background: linear-gradient(135deg, #C0C0C0 60%, #F5F5F5 100%); border-radius: 16px; box-shadow: 0 2px 8px rgba(0,0,0,0.08); padding: 1.2rem 1.2rem; min-width: 220px; display: flex; flex-direction: column; justify-content: flex-start; gap: 0.2rem; height: 100%; position: relative;">
            <div style="position: absolute; top: 0.4rem; right: 0.4rem; font-size: 1.1rem; font-weight: bold; color: #fff; background: #888; padding: 0.1em 0.7em; border-radius: 1em; letter-spacing: 0.05em;">×2</div>
            <div style="font-size: 1.2rem; font-weight: bold; color: #555555; margin-bottom: 0rem; margin-left: -0.5rem; margin-top: -0.7rem;">🥈 Silver Medal</div>
            <div style="font-size: 1.0rem; color: #333;">
              <ul style="margin: 0; padding-left: 0.6em; line-height: 1;">
                <li><b>2021 CCPC Final (Silver First Place)</b></li>
                <li>2021 CCPC Weihai Region</li>
              </ul>
            </div>
          </div>
          <!-- Bottom Right: Bronze Medal Card -->
          <div style="grid-column: 2; grid-row: 2; background: linear-gradient(135deg, #CD7F32 60%, #FFE4C4 100%); border-radius: 16px; box-shadow: 0 2px 8px rgba(0,0,0,0.08); padding: 1.2rem 1.2rem; min-width: 220px; display: flex; flex-direction: column; justify-content: flex-start; gap: 0.2rem; height: 100%; position: relative;">
            <div style="position: absolute; top: 0.4rem; right: 0.4rem; font-size: 1.1rem; font-weight: bold; color: #fff; background: #6B3A00; padding: 0.1em 0.7em; border-radius: 1em; letter-spacing: 0.05em;">×2</div>
            <div style="font-size: 1.2rem; font-weight: bold; color: #6B3A00; margin-bottom: 0rem; margin-left: -0.5rem; margin-top: -0.7rem;">🥉 Bronze Medal</div>
            <div style="font-size: 1.0rem; color: #333;">
              <ul style="margin: 0; padding-left: 0.6em; line-height: 1;">
                <li>2019 NOI</li>
                <li>2019 CTSC</li>
              </ul>
            </div>
          </div>
        </div>

        Other competition awards:
        - CCF Big Data and Computing Intelligence Contest (BDCI 2022), Track Champion
        - Huawei ICT Algorithm Diamond Contest 2022,  Champion
        - GDCPC (广东省大学生程序设计竞赛) 2024,  Second Place
        - GDCPC (广东省大学生程序设计竞赛) 2021,  Second Place
    design:
      css_class: "bg-adaptive"

  - block: markdown
    id: honors
    content:
      title: Honor and Scholarship
      text: |-
        - SCUT Pacemaker to Merit Student, Nomination (2021) (top 0.1%)
        - National Scholarship (2021 & 2022)
        - SCUT-Tencent Scholarship (2022)
        - SCUT-Huawei Scholarship (2022)


  - block: cta-card
    demo: true # Only display this section in the Hugo Blox Builder demo site
    content:
      title: 👉 Build your own academic website like this
      text: |-
        This site is generated by Hugo Blox Builder - the FREE, Hugo-based open source website builder trusted by 250,000+ academics like you.

        <a class="github-button" href="https://github.com/HugoBlox/hugo-blox-builder" data-color-scheme="no-preference: light; light: light; dark: dark;" data-icon="octicon-star" data-size="large" data-show-count="true" aria-label="Star HugoBlox/hugo-blox-builder on GitHub">Star</a>

        Easily build anything with blocks - no-code required!

        From landing pages, second brains, and courses to academic resumés, conferences, and tech blogs.
      button:
        text: Get Started
        url: https://hugoblox.com/templates/
    design:
      card:
        # Card background color (CSS class)
        css_class: "bg-primary-700"
        css_style: ""
      css_class: "bg-adaptive"
---
