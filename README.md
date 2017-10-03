# Template files for generating beamer presentations with markdown and pandoc

## Usage

Clone the repository, create a markdown file in the same directory and run make.

```
git clone git@github.com:bjvanderweij/talk-template.git
cd talk-template
make
```

See [talk.md](https://raw.githubusercontent.com/bjvanderweij/talk-template/master/talk.md) for an example. 

The makefile does the following:

Find all markdown (`*.md`) files in the current directory, [dia](http://dia-installer.de/) diagram (`*.dia`) and svg (`*.svg`) files in illustrations directory.
Convert the diagrams and svg files to encapsulated postscript (eps) files using respectively dia and [inkscape](https://inkscape.org/en/).
Convert the markdown files to tex and pdf using [pandoc](http://pandoc.org/).

The example makes use of [Beamer Color Theme Solarized](https://github.com/jrnold/beamercolorthemesolarized).
