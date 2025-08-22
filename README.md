| <img src="docs/logo.svg" width="128"> |
| - |

# [Course_Name], [BSC_MSC] Course @ [Your_University]

This repository contains my personal notes for the [Course_Name] course at the [Your_University], part of the [BSC_MSC] in [Faculty_Name].

## Overview

You can download my personal notes using the link below. To create your own notes, simply fork this repository and start editing using markdown.

## Prerequisites

> [!IMPORTANT]
>
> - Docker

## Notes

| <a href="dist/Notes.pdf"><img src="docs/cover.png" alt="cover" height="256"></a> |
| - |

## Instructions

Usage:

```sh
bash cmd.sh {setup|notes}
```

### `setup`

If you haven't built the project yet, you can do so by running:

```sh
bash cmd.sh setup
```

> [!WARNING]
>
> `pandoc` installation might take a while, as it needs to download several dependencies.

### `notes`

The script will automatically generate the `content.pdf` file from the markdown files located in the `docs/md` directory and merge it with your `front.pdf` to create the final `Notes.pdf`:

```sh
bash cmd.sh notes
```

> [!IMPORTANT]
>
> Before running this command, ensure to upload your own `front.pdf` into the `dist` directory.
> You can even let `pandoc` generate a title page for you by modifying the `titlepage` field in the `docs/md/__metadata__.yml` file, and removing the `front.pdf` reference from the `cmd.sh` script.

## License

This project is distributed under [GNU General Public License version 3](https://opensource.org/license/gpl-3-0). You can find the complete text of the license in the project repository.
