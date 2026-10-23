---
layout: single
title: "Sitemap"
permalink: /sitemap/
author_profile: true
---

<ul>
  <li><a href="{{ '/' | relative_url }}">Home</a></li>
  {% for link in site.data.navigation.main %}
  <li><a href="{{ link.url | relative_url }}">{{ link.title }}</a></li>
  {% endfor %}
</ul>

An <a href="{{ '/sitemap.xml' | relative_url }}">XML sitemap</a> is also available.
