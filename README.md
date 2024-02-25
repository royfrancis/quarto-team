# team

A quarto shortcode extension to add team profile layout for html format.

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

For more examples and usage guide, see [here](https://royfrancis.github.io/quarto-team).

---

2024 • Roy Francis
