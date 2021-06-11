---
title: "{{ replace (slicestr .Name 11) "-" " " | humanize }}"
description: ""
date: {{ slicestr .Name 0 10 }}

slug: "{{ slicestr .Name 11 }}"
---

