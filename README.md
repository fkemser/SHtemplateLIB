<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a name="readme-top"></a>
<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![GNU GPL v3.0 License][license-shield]][license-url]
<!-- [![LinkedIn][linkedin-shield]][linkedin-url] -->



<!-- PROJECT LOGO -->
<br />
<div align="center">
  <!-- <a href="https://github.com/fkemser/SHtemplateLIB">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a> -->

<h3 align="center">SHtemplateLIB</h3>

  <p align="center">
    A library containing constants and functions for <a href="https://github.com/fkemser/SHtemplate">SHtemplate</a> repository.
    <br />
    <a href="https://github.com/fkemser/SHtemplateLIB"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/fkemser/SHtemplateLIB">View Demo</a>
    ·
    <a href="https://github.com/fkemser/SHtemplateLIB/issues">Report Bug</a>
    ·
    <a href="https://github.com/fkemser/SHtemplateLIB/issues">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a></li>
    <li>
      <a href="#documentation">Documentation</a>
      <ul>
        <li><a href="#shtpl0libsh">shtpl.0.lib.sh</a></li>
        <li><a href="#shtpllllibsh">shtpl.&ltll&gt.lib.sh</a></li>
      </ul>
    </li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

This repository provides constants and functions that are **exclusively used within the shell template repository [SHtemplate][SHtemplate-url]** such as

* language-specific text snippets (help texts, interactive dialogues, terminal/log messages, etc.), and
* functions, e.g. the semi-automatic creation of the script's help.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- DOCUMENTATION -->
## Documentation

For better code readability and maintenance the library is divided into multiple files:

| /lib/                                | /           | Description                                                                              |
|--------------------------------------|-------------|------------------------------------------------------------------------------------------|
| licenses                             |             |                                                                                          |
| ...                                  | `<lic>.txt` | License header files where `<lic>` is the license's [`SPDX-License-Identifier`][SPDX-License-List]. Used by `lib_shtpl_about()`, see below.                                                                                                                                      |
| [`shtpl.0.lib.sh`](#shtpl0libsh)     |             | Language-**independent** strings and all the library's **functions**                     |
| [`shtpl.<ll>.lib.sh`](#shtpllllibsh) |             | Language-**specific** strings (translations), e.g. `shtpl.en.lib.sh` for English strings |

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- /lib/shtpl.0.lib.sh -->
### `shtpl.0.lib.sh`
This file contains **language-independent strings** and all the library's **functions**.

> :warning: The following table only gives a brief overview. Before using any of these functions please have a look at the comments in the source file.

Function | Description
:--- | :---
`lib_shtpl_about`       | Print about message (project, author, copyright, license, etc.).
`lib_shtpl_arg`         | Generate/Format script's **help**. Only **for script parameters** (help's `SYNOPSIS` section), for other help sections see `lib_shtpl_genhelp()` instead.
`lib_shtpl_arg_is_set`  | Check if one or more arguments are set (not empty) and log/print an error message if not
`lib_shtpl_error_arg`   | Log/Print an error message for a certain argument
`lib_shtpl_genhelp`     | Generate/Format script's **help**. For all help sections **except** script parameters (see `lib_shtpl_arg()` instead).
`lib_shtpl_help`        | Print help message using `less` utility
`lib_shtpl_message`     | Log/Print **error/info/warning message** and optionally exit

<p align="right">(<a href="#documentation">back to overview</a>)</p>


<!-- /lib/shtpl.<ll>.lib.sh -->
### `shtpl.<ll>.lib.sh`
These files contain **language-specific** strings. **For each supported language there is one (separate) file** where `<ll>` in the filename is the language's [ISO 639-1][iso639-1-url] ID in lowercase letters, e.g. `shtpl.en.lib.sh` contains English strings, `shtpl.de.lib.sh` German strings, etc.

> :information_source: In case your language is not supported yet: Please have a look [below](#adding-support-for-other-languages).

<p align="right">(<a href="#documentation">back to overview</a>)</p>


### Adding support for other languages
In case your language is not supported yet please follow these steps:

1. Just copy the English translation file `/lib/shtpl.en.lib.sh` and rename the copy by replacing **`en`** with your language's [ISO 639-1][iso639-1-url] two-letter code (lowercase), e.g. to `shtpl.`**`es`**`.lib.sh` for a **`Spanish`** translation file.

2. Open the renamed file and use your editor's `Search & Replace` feature to replace each constant's `LIB_SHTPL`**`_EN_`** prefix by your language's [ISO 639-1][iso639-1-url] two-letter code (uppercase), e.g. to `LIB_SHTPL`**`_ES_`** for **`Spanish`**.

3. After renaming just translate constant by constant into your own language.

4. Finally have a look at [SHtemplate's readme](https://github.com/fkemser/SHtemplate#adding-support-for-other-languages) for further project-specific instructions.

> :information_source: To contribute your translation to this project, please have a look at the [Contributing](#contributing) section.

<p align="right">(<a href="#documentation">back to overview</a>)</p>



<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/fkemser/SHtemplateLIB/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the **GNU Lesser General Public License v3.0 (or later)**. See [`LICENSE`][license-url] for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Project Link: [https://github.com/fkemser/SHtemplateLIB](https://github.com/fkemser/SHtemplateLIB)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments
###
* [othneildrew/Best-README-Template](https://github.com/othneildrew/Best-README-Template)
* [Ileriayo/markdown-badges](https://github.com/Ileriayo/markdown-badges)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/fkemser/SHtemplateLIB.svg?style=for-the-badge
[contributors-url]: https://github.com/fkemser/SHtemplateLIB/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/fkemser/SHtemplateLIB.svg?style=for-the-badge
[forks-url]: https://github.com/fkemser/SHtemplateLIB/network/members
[stars-shield]: https://img.shields.io/github/stars/fkemser/SHtemplateLIB.svg?style=for-the-badge
[stars-url]: https://github.com/fkemser/SHtemplateLIB/stargazers
[issues-shield]: https://img.shields.io/github/issues/fkemser/SHtemplateLIB.svg?style=for-the-badge
[issues-url]: https://github.com/fkemser/SHtemplateLIB/issues
[license-shield]: https://img.shields.io/github/license/fkemser/SHtemplateLIB.svg?style=for-the-badge
[license-url]: https://github.com/fkemser/SHtemplateLIB/blob/main/LICENSE
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/linkedin_username
[screenshot1]: res/screenshot1.gif
[screenshot2]: res/screenshot2.gif
[screenshot3]: res/screenshot3.gif
[screenshot4]: res/screenshot4.gif

[SHtemplate-url]: https://github.com/fkemser/SHtemplate

[iso639-1-url]: https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes
[SPDX-License-List]: https://spdx.org/licenses/

[LaTeX-shield]: https://img.shields.io/badge/latex-%23008080.svg?style=for-the-badge&logo=latex&logoColor=white
[LaTeX-url]: https://www.latex-project.org/
[Shell Script-shield]: https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white
[Shell Script-url]: https://pubs.opengroup.org/onlinepubs/9699919799/