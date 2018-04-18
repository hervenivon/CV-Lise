# CV

This is the repository that hosts my CV in `TeX` format.

## Prerequisites

A full `TeX` distribution is required. Various distributions are available for different operating systems (Windows, Mac, Linux, Unix).

Here is the procedure for Mac on which `brew` is available:

Install `MacTex`: `$> brew cask install mactex`

This should install everything you need.

Configure your path:

`$> open /Applications/TeX/What\ Is\ Installed.pdf`

In this `pdf` you will find the folder where the binaries are installed. In my case it is `/usr/local/texlive/2017`.

Add the binary directory to your `PATH`: `$> export PATH="/usr/local/texlive/2017/bin/x86_64-darwin/:$PATH"`

## Credits

- [LaTeX FontAwesome](https://github.com/plorcupine/latex-fontawesome) is a binding that allow use of [FontAwesome](http://fontawesome.io/) into your `TeX`documents.
- [`Awesome-CV`](https://github.com/posquit0/Awesome-CV) on which I based my `TeX` CV
- [AltaCV](https://github.com/liantze/AltaCV)


## TODO

- [ ] Upgrade FontAwesome:
  - https://github.com/xdanaux/fontawesome-latex,
  - https://github.com/plorcupine/latex-fontawesome,
  - https://coderwall.com/p/r67dyq/using-font-awesome-with-xe-latex,
- [ ] Automatic pdf comparison ([here](https://github.com/vslavik/diff-pdf))
- [ ] Continuous integration with circleci:
  - https://gist.github.com/retrage/dc0980ec4c79b33cd522c4f4f4b82900
  - https://github.com/deeptrain/latex-circleci
  - https://discuss.circleci.com/t/latex-pdf-building/668/3
- [ ] Add preview in png format
  - https://www.snip2code.com/Snippet/238182/Get-pngs-from-a-multipage-pdf

## Documents

- Color management: http://www.tuteurs.ens.fr/noncvs/docs/xcolor/xcolor.pdf
- `\chronology` command: http://ctan.localhost.net.ar/macros/latex/contrib/chronology/chronology.pdf