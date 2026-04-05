# team  ![build](https://github.com/royfrancis/quarto-team/workflows/deploy/badge.svg)

A quarto shortcode extension to add team profile layouts for html and revealjs formats.

![](preview.jpg)

## Install

- Requires Quarto >= 1.4.0
- In the root of the quarto project, run in terminal:

```
quarto add royfrancis/quarto-team
```

This will install the extension under the `_extensions` subdirectory.

## Usage

```
---
title: Team
team:
  - team-1:
    - name: Zaria West
      name_url: https://quarto.org/
      image: image.jpg
      image_url: https://quarto.org/
      description: Description
filters:
  - team
---

{{< team team-1 >}}
```

Inline configuration is also supported.

```
{{< team items='[{"name":"Koa Amin","image":"https://images.generated.photos/kBmZ3-ZV_H_siHy0kJoPMXxO90it5palMqarwVB07Xc/rs:fit:256:256/czM6Ly9pY29uczgu/Z3Bob3Rvcy1wcm9k/LnBob3Rvcy92M18w/NTk0MDA0LmpwZw.jpg","description":"President"}]' >}}
```

`name` and `description` accept markdown and raw HTML in YAML metadata and inline configuration. Team item ids are generated automatically unless an explicit `id` is supplied.

For more examples and usage guide, see [here](https://royfrancis.github.io/quarto-team).

---

2026 • Roy Francis
