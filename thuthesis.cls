%%
%% This is file `thuthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% thuthesis.dtx  (with options: `cls')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2005-2020 by Ruini Xue <xueruini@gmail.com>
%% 
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%% 
%% To produce the documentation run the original source files ending with `.dtx'
%% through LaTeX.
%% 
\NeedsTeXFormat{LaTeX2e}[2017/04/15]
\ProvidesClass{thuthesis}
[2020/06/14 6.1.2 Tsinghua University Thesis Template]
\newcommand\thu@error[1]{%
  \ClassError{thuthesis}{#1}{}%
}
\@ifl@t@r\fmtversion{2017/04/15}{}{
  \thu@error{%
    TeX Live 2017 or later version is required to compile this document%
  }
}
\RequirePackage{iftex}
\ifXeTeX\else
  \thu@error{XeLaTeX is required to compile this document}
\fi
\hyphenation{Thu-Thesis}
\def\thuthesis{ThuThesis}
\def\version{6.1.2}
\RequirePackage{kvdefinekeys}
\RequirePackage{kvsetkeys}
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=thu,
  prefix=thu@,
  setkeys=\kvsetkeys}
\newcommand\thusetup[1]{%
  \kvsetkeys{thu}{#1}%
}
\newcommand\thu@define@key[1]{%
  \kvsetkeys{thu@key}{#1}%
}
\kv@set@family@handler{thu@key}{%
  \@namedef{thu@#1@@name}{#1}%
  \def\thu@@default{}%
  \def\thu@@choices{}%
  \kv@define@key{thu@value}{name}{%
    \@namedef{thu@#1@@name}{##1}%
  }%
  \@namedef{thu@#1@@check}{}%
  \@namedef{thu@#1@@code}{}%
  \kv@define@key{thu@value}{choices}{%
    \def\thu@@choices{##1}%
    \@namedef{thu@#1@@reset}{}%
    \@namedef{thu@#1@@check}{%
      \@ifundefined{%
        ifthu@\@nameuse{thu@#1@@name}@\@nameuse{thu@\@nameuse{thu@#1@@name}}%
      }{%
        \thu@error{Invalid value "#1 = \@nameuse{thu@\@nameuse{thu@#1@@name}}"}%
      }%
      \@nameuse{thu@#1@@reset}%
      \@nameuse{thu@\@nameuse{thu@#1@@name}@\@nameuse{thu@\@nameuse{thu@#1@@name}}true}%
    }%
  }%
  \kv@define@key{thu@value}{default}{%
    \def\thu@@default{##1}%
  }%
  \kvsetkeys{thu@value}{#2}%
  \@namedef{thu@\@nameuse{thu@#1@@name}}{}%
  \kv@set@family@handler{thu@choice}{%
    \ifx\thu@@default\@empty
      \def\thu@@default{##1}%
    \fi
    \expandafter\newif\csname ifthu@\@nameuse{thu@#1@@name}@##1\endcsname
    \expandafter\g@addto@macro\csname thu@#1@@reset\endcsname{%
      \@nameuse{thu@\@nameuse{thu@#1@@name}@##1false}%
    }%
  }%
  \kvsetkeys@expandafter{thu@choice}{\thu@@choices}%
  \expandafter\let\csname thu@\@nameuse{thu@#1@@name}\endcsname\thu@@default
  \expandafter\ifx\csname thu@\@nameuse{thu@#1@@name}\endcsname\@empty\else
    \@nameuse{thu@#1@@check}%
  \fi
  \kv@define@key{thu}{#1}{%
    \@namedef{thu@\@nameuse{thu@#1@@name}}{##1}%
    \@nameuse{thu@#1@@check}%
    \@nameuse{thu@#1@@code}%
  }%
}
\newcommand\thu@option@hook[2]{%
  \expandafter\g@addto@macro\csname thu@#1@@code\endcsname{#2}%
}
\thu@define@key{
  degree = {
    choices = {
      bachelor,
      master,
      doctor,
      postdoc,
    },
    default = doctor,
  },
  degree-type = {
    choices = {
      academic,
      professional,
    },
    name = degree@type,
  },
  language = {
    choices = {
      chinese,
      english,
    },
  },
  fontset = {
    choices = {
      windows,
      mac,
      ubuntu,
      fandol,
      none,
    },
    default = none,
  },
  system = {
    choices = {
      mac,
      unix,
      windows,
      auto,
    },
    default = auto,
  },
  font = {
    choices = {
      times,
      termes,
      xits,
      libertinus,
      lm,
      auto,
      none,
    },
    default = auto,
  },
  cjk-font = {
    name = cjk@font,
    choices = {
      windows,
      mac,
      noto,
      fandol,
      auto,
      none,
    },
    default = auto,
  },
  math-font = {
    name = math@font,
    choices = {
      xits,
      stix,
      libertinus,
      lm,
      none,
    },
    default = xits,
  },
  output = {
    choices = {
      print,
      electronic,
    },
    default = print,
  },
}
\newif\ifthu@degree@graduate
\newcommand\thu@set@graduate{%
  \thu@degree@graduatefalse
  \ifthu@degree@doctor
    \thu@degree@graduatetrue
  \fi
  \ifthu@degree@master
    \thu@degree@graduatetrue
  \fi
}
\thu@set@graduate
\thu@option@hook{degree}{%
  \thu@set@graduate
}
\DeclareBoolOption[false]{openright}
\DeclareComplementaryOption{openany}{openright}
\DeclareBoolOption[true]{raggedbottom}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessKeyvalOptions*
\ifthu@openright
  \PassOptionsToClass{openright}{book}
\else
  \PassOptionsToClass{openany}{book}
\fi
\PassOptionsToPackage{quiet}{fontspec}
\LoadClass[a4paper,UTF8,zihao=-4,scheme=plain,fontset=none]{ctexbook}[2017/04/01]
\RequirePackage{etoolbox}
\RequirePackage{xparse}
\RequirePackage{geometry}%
\RequirePackage{fancyhdr}
\RequirePackage{titletoc}
\RequirePackage{notoccite}
\RequirePackage{amsmath}
\RequirePackage{unicode-math}
\RequirePackage{graphicx}
\RequirePackage[labelformat=simple]{subcaption}
\RequirePackage{pdfpages}
\includepdfset{fitpaper=true}
\RequirePackage[shortlabels]{enumitem}
\RequirePackage{environ}
\ifthu@raggedbottom
  \RequirePackage[bottom,perpage,hang]{footmisc}
  \raggedbottom
\else
  \RequirePackage[perpage,hang]{footmisc}
\fi
\RequirePackage{xeCJKfntef}
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage[sort&compress]{natbib}
\RequirePackage{bibunits}
\RequirePackage{url}
\RequirePackage{filehook}
\newcommand\thu@package@conflict[2]{
  \AtBeginOfPackageFile*{#2}{
    \thu@error{The "#2" package is incompatible with required "#1"}
  }
}
\thu@package@conflict{unicode-math}{amscd}
\thu@package@conflict{unicode-math}{amsfonts}
\thu@package@conflict{unicode-math}{amssymb}
\thu@package@conflict{unicode-math}{bbm}
\thu@package@conflict{unicode-math}{bm}
\thu@package@conflict{unicode-math}{eucal}
\thu@package@conflict{unicode-math}{eufrak}
\thu@package@conflict{unicode-math}{mathrsfs}
\geometry{
  a4paper, % 210 * 297mm
  marginparwidth = 2cm,
  marginparsep = 0.5cm
}
\newcommand\thu@set@geometry{%
  \ifthu@degree@bachelor
    \geometry{
      top        = 3.8cm,
      bottom     = 3.2cm,
      left       = 3.2cm,
      right      = 3cm,
      headheight = 0.5cm,
      headsep    = 1.8cm,
      footskip   = 1.45cm,
    }%
    \ifthu@output@print
      \geometry{
        left       = 3.2cm,
        right      = 3cm,
      }%
    \else
      \geometry{
        hmargin    = 3cm,
      }%
    \fi
  \else
    \geometry{
      margin     = 3cm,
      headheight = 0.5cm,
      headsep    = 0.3cm,
      footskip   = 0.8cm,
    }%
  \fi
}
\thu@set@geometry
\thu@option@hook{degree}{\thu@set@geometry}
\thu@option@hook{output}{\thu@set@geometry}
\def\cleardoublepage{%
  \clearpage
  \if@twoside
    \ifthu@output@print
      \ifodd\c@page
      \else
        \thispagestyle{empty}%
        \hbox{}%
        \newpage
        \if@twocolumn
          \hbox{}\newpage
        \fi
      \fi
    \fi
  \fi
}
\renewcommand\frontmatter{%
  \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{Roman}%
  \let\@tabular\thu@tabular
}
\renewcommand\mainmatter{%
  \cleardoublepage
  \@mainmattertrue
  \pagenumbering{arabic}%
}
\renewcommand\backmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \@mainmattertrue}
\ifthu@fontset@mac
  \thusetup{
    font     = times,
    cjk-font = mac,
  }
\else
  \ifthu@fontset@windows
    \thusetup{
      font     = times,
      cjk-font = windows,
    }
  \else
    \ifthu@fontset@fandol
      \thusetup{
        % font     = times,
        font     = termes,
        cjk-font = fandol,
      }
    \else
      \ifthu@fontset@ubuntu
        \thusetup{
          % font     = times,
          font     = termes,
          cjk-font = noto,
        }
      \fi
    \fi
  \fi
\fi
\ifthu@system@auto
  \IfFileExists{/System/Library/Fonts/Menlo.ttc}{
    \thusetup{system = mac}
  }{
    \IfFileExists{/dev/null}{
      \IfFileExists{null:}{
        \thusetup{system = windows}
      }{
        \thusetup{system = unix}
      }
    }{
      \thusetup{system = windows}
    }
  }
\fi
\let\thu@font@family@xits\@empty
\newcommand\thu@set@xits@names{%
  \ifx\thu@font@family@xits\@empty
    \IfFontExistsTF{XITSMath-Regular.otf}{%
      \gdef\thu@font@family@xits{XITS}%
      \gdef\thu@font@style@xits@rm{Regular}%
      \gdef\thu@font@style@xits@bf{Bold}%
      \gdef\thu@font@style@xits@it{Italic}%
      \gdef\thu@font@style@xits@bfit{BoldItalic}%
      \gdef\thu@font@name@xits@math@rm{XITSMath-Regular}%
      \gdef\thu@font@name@xits@math@bf{XITSMath-Bold}%
    }{%
      \gdef\thu@font@family@xits{xits}%
      \gdef\thu@font@style@xits@rm{regular}%
      \gdef\thu@font@style@xits@bf{bold}%
      \gdef\thu@font@style@xits@it{italic}%
      \gdef\thu@font@style@xits@bfit{bolditalic}%
      \gdef\thu@font@name@xits@math@rm{xits-math}%
      \gdef\thu@font@name@xits@math@bf{xits-mathbold}%
    }%
  \fi
}
\let\thu@font@family@libertinus\@empty
\newcommand\thu@set@libertinus@names{%
  \ifx\thu@font@family@libertinus\@empty
    \IfFontExistsTF{LibertinusSerif-Regular.otf}{%
      \gdef\thu@font@family@libertinus@serif{LibertinusSerif}%
      \gdef\thu@font@family@libertinus@sans{LibertinusSans}%
      \gdef\thu@font@name@libertinus@math{LibertinusMath-Regular}%
      \gdef\thu@font@style@libertinus@rm{Regular}%
      \gdef\thu@font@style@libertinus@bf{Bold}%
      \gdef\thu@font@style@libertinus@it{Italic}%
      \gdef\thu@font@style@libertinus@bfit{BoldItalic}%
    }{%
      \gdef\thu@font@family@libertinus@serif{libertinusserif}%
      \gdef\thu@font@family@libertinus@sans{libertinussans}%
      \gdef\thu@font@name@libertinus@math{libertinusmath-regular}%
      \gdef\thu@font@style@libertinus@rm{regular}%
      \gdef\thu@font@style@libertinus@bf{bold}%
      \gdef\thu@font@style@libertinus@it{italic}%
      \gdef\thu@font@style@libertinus@bfit{bolditalic}%
    }%
  \fi
}
\ifthu@font@auto
  \ifthu@system@unix
    % \thusetup{font=times}
    \thusetup{font=termes}
  \else
    \thusetup{font=times}
  \fi
\fi
\newcommand\thu@load@font@times{%
  \setmainfont{Times New Roman}%
  \setsansfont{Arial}%
  \ifthu@system@mac
    \setmonofont{Menlo}[Scale = MatchLowercase]%
  \else
    \setmonofont{Courier New}[Scale = MatchLowercase]%
  \fi
}
\newcommand\thu@load@font@termes{%
  \setmainfont{texgyretermes}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
  ]%
  \thu@load@texgyre@sans@mono
}
\newcommand\thu@load@texgyre@sans@mono{%
  \setsansfont{texgyreheros}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
  ]%
  \setmonofont{texgyrecursor}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
  ]%
}
\newcommand\thu@load@font@xits{%
  \thu@set@xits@names
  \setmainfont{\thu@font@family@xits}[
    Extension      = .otf,
    UprightFont    = *-\thu@font@style@xits@rm,
    BoldFont       = *-\thu@font@style@xits@bf,
    ItalicFont     = *-\thu@font@style@xits@it,
    BoldItalicFont = *-\thu@font@style@xits@bfit,
  ]%
  \thu@load@texgyre@sans@mono
}
\newcommand\thu@load@font@libertinus{%
  \thu@set@libertinus@names
  \setmainfont{\thu@font@family@libertinus@serif}[
    Extension      = .otf,
    UprightFont    = *-\thu@font@style@libertinus@rm,
    BoldFont       = *-\thu@font@style@libertinus@bf,
    ItalicFont     = *-\thu@font@style@libertinus@it,
    BoldItalicFont = *-\thu@font@style@libertinus@bfit,
  ]%
  \setsansfont{\thu@font@family@libertinus@sans}[
    Extension      = .otf,
    UprightFont    = *-\thu@font@style@libertinus@rm,
    BoldFont       = *-\thu@font@style@libertinus@bf,
    ItalicFont     = *-\thu@font@style@libertinus@it,
  ]%
  \setmonofont{lmmonolt10}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-oblique,
    BoldItalicFont = *-boldoblique,
  ]%
}
\@namedef{thu@load@font@lm}{%
  \setmainfont{lmroman10}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
  ]%
  \setsansfont{lmsans10}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-oblique,
    BoldItalicFont = *-boldoblique,
  ]%
  \setmonofont{lmmonolt10}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-oblique,
    BoldItalicFont = *-boldoblique,
  ]%
}
\newcommand\thu@load@font{%
  \@nameuse{thu@load@font@\thu@font}%
}
\thu@load@font
\thu@option@hook{font}{\thu@load@font}
\unimathsetup{
  math-style = ISO,
  bold-style = ISO,
  nabla      = upright,
  partial    = upright,
}
\newcommand\thu@load@math@font@xits{%
  \thu@set@xits@names
  \setmathfont{\thu@font@name@xits@math@rm}[
    Extension    = .otf,
    BoldFont     = \thu@font@name@xits@math@bf,
    StylisticSet = 8,
  ]%
  \setmathfont{\thu@font@name@xits@math@rm}[
    Extension    = .otf,
    StylisticSet = 1,
    range        = {cal,bfcal},
  ]%
}
\newcommand\thu@load@math@font@stix{%
  \setmathfont{STIX2Math}[
    Extension    = .otf,
    StylisticSet = 8,
  ]%
  \setmathfont{STIX2Math}[
    Extension    = .otf,
    StylisticSet = 1,
    range        = {cal,bfcal},
  ]%
}
\newcommand\thu@load@math@font@libertinus{%
  \thu@set@libertinus@names
  \setmathfont{\thu@font@name@libertinus@math .otf}%
}
\newcommand\thu@load@math@font@lm{%
  \setmathfont{latinmodern-math.otf}%
}
\newcommand\thu@load@math@font{%
  \@nameuse{thu@load@math@font@\thu@math@font}
}
\thu@load@math@font
\thu@option@hook{math-font}{\thu@load@math@font}
\ifthu@cjk@font@auto
  \ifthu@system@mac
    \thusetup{cjk-font = mac}
  \else
    \ifthu@system@windows
      \thusetup{cjk-font = windows}
    \else
      \IfFontExistsTF{Noto Serif CJK SC}{
        \thusetup{cjk-font = noto}
      }{
        % \thusetup{cjk-font = windows}
        \thusetup{cjk-font = fandol}
      }
    \fi
  \fi
\fi
\newcommand\thu@load@cjk@font@windows{%
  \xeCJKsetup{EmboldenFactor=2}
  \setCJKmainfont{SimSun}[
    AutoFakeBold = true,
    ItalicFont   = KaiTi,
  ]%
  \setCJKsansfont{SimHei}[AutoFakeBold]%
  \setCJKmonofont{FangSong}%
  \setCJKfamilyfont{zhsong}{SimSun}[AutoFakeBold]%
  \setCJKfamilyfont{zhhei}{SimHei}[AutoFakeBold]%
  \setCJKfamilyfont{zhkai}{KaiTi}%
  \setCJKfamilyfont{zhfs}{FangSong}%
  \setCJKfamilyfont{zhyy}{YouYuan}%
}
\newcommand\thu@load@cjk@font@mac{%
  \setCJKmainfont{Songti SC}[
    UprightFont    = * Light,
    BoldFont       = * Bold,
    ItalicFont     = Kaiti SC,
    BoldItalicFont = Kaiti SC Bold,
  ]%
  \setCJKsansfont{Heiti SC}[BoldFont=* Medium]%
  \setCJKmonofont{STFangsong}
  \setCJKfamilyfont{zhsong}{Songti SC}[
    UprightFont = * Light,
      BoldFont  = * Bold,
  ]%
  \setCJKfamilyfont{zhhei}{Heiti SC}[
    UprightFont = * Light,
    BoldFont    = * Medium,
  ]%
  \setCJKfamilyfont{zhfs}{STFangsong}%
  \setCJKfamilyfont{zhkai}{Kaiti SC}[BoldFont = * Bold]%
  \setCJKfamilyfont{zhli}{Baoli SC}%
  \setCJKfamilyfont{zhyuan}{Yuanyi SC}[
    UprightFont = * Light,
    BoldFont    = * Bold,
  ]%
  \xeCJKsetwidth{‘’“”}{1em}%
}
\newcommand\thu@load@cjk@font@noto{%
  \setCJKmainfont{Noto Serif CJK SC}[
    UprightFont    = * Light,
    BoldFont       = * Bold,
    ItalicFont     = FandolKai-Regular,
    ItalicFeatures = {Extension = .otf},
  ]%
  \setCJKsansfont{Noto Sans CJK SC}[
    BoldFont    = * Medium,
  ]%
  \setCJKmonofont{Noto Sans Mono CJK SC}%
  \setCJKfamilyfont{zhsong}{Noto Serif CJK SC}[
    UprightFont = * Light,
    UprightFont = * Bold,
  ]%
  \setCJKfamilyfont{zhhei}{Noto Sans CJK SC}[
    BoldFont    = * Medium,
  ]%
  \setCJKfamilyfont{zhfs}{FandolFang}[
    Extension   = .otf,
    UprightFont = *-Regular,
  ]%
  \setCJKfamilyfont{zhkai}{FandolKai}[
    Extension   = .otf,
    UprightFont = *-Regular,
  ]%
}
\newcommand\thu@load@cjk@font@fandol{%
  \setCJKmainfont{FandolSong}[
    Extension   = .otf,
    UprightFont = *-Regular,
    BoldFont    = *-Bold,
    ItalicFont  = FandolKai-Regular,
  ]%
  \setCJKsansfont{FandolHei}[
    Extension   = .otf,
    UprightFont = *-Regular,
    BoldFont    = *-Bold,
  ]%
  \setCJKmonofont{FandolFang}[
    Extension   = .otf,
    UprightFont = *-Regular,
  ]%
  \setCJKfamilyfont{zhsong}{FandolSong}[
    Extension   = .otf,
    UprightFont = *-Regular,
    BoldFont    = *-Bold,
  ]%
  \setCJKfamilyfont{zhhei}{FandolHei}[
    Extension   = .otf,
    UprightFont = *-Regular,
    BoldFont    = *-Bold,
  ]%
  \setCJKfamilyfont{zhfs}{FandolFang}[
    Extension   = .otf,
    UprightFont = *-Regular,
  ]%
  \setCJKfamilyfont{zhkai}{FandolKai}[
    Extension   = .otf,
    UprightFont = *-Regular,
  ]%
}
\ifthu@cjk@font@none\else
  \providecommand\songti{\CJKfamily{zhsong}}
  \providecommand\heiti{\CJKfamily{zhhei}}
  \providecommand\fangsong{\CJKfamily{zhfs}}
  \providecommand\kaishu{\CJKfamily{zhkai}}
  \providecommand\youyuan{\CJKfamily{zhyy}}
\fi
\newcommand\thu@load@cjk@font{%
  \@nameuse{thu@load@cjk@font@\thu@cjk@font}%
}
\thu@load@cjk@font
\thu@option@hook{cjk-font}{\thu@load@cjk@font}
\renewcommand\normalsize{%
  \@setfontsize\normalsize{12bp}{20bp}%
  \abovedisplayskip=12bp \@plus 2bp \@minus 2bp
  \abovedisplayshortskip=12bp \@plus 2bp \@minus 2bp
  \belowdisplayskip=\abovedisplayskip
  \belowdisplayshortskip=\abovedisplayshortskip}
\def\thu@def@fontsize#1#2{%
  \expandafter\newcommand\csname #1\endcsname[1][1.3]{%
    \fontsize{#2}{##1\dimexpr #2}\selectfont}}
\thu@def@fontsize{chuhao}{42bp}
\thu@def@fontsize{xiaochu}{36bp}
\thu@def@fontsize{yihao}{26bp}
\thu@def@fontsize{xiaoyi}{24bp}
\thu@def@fontsize{erhao}{22bp}
\thu@def@fontsize{xiaoer}{18bp}
\thu@def@fontsize{sanhao}{16bp}
\thu@def@fontsize{xiaosan}{15bp}
\thu@def@fontsize{sihao}{14bp}
\thu@def@fontsize{banxiaosi}{13bp}
\thu@def@fontsize{xiaosi}{12bp}
\thu@def@fontsize{dawu}{11bp}
\thu@def@fontsize{wuhao}{10.5bp}
\thu@def@fontsize{xiaowu}{9bp}
\thu@def@fontsize{liuhao}{7.5bp}
\thu@def@fontsize{xiaoliu}{6.5bp}
\thu@def@fontsize{qihao}{5.5bp}
\thu@def@fontsize{bahao}{5bp}
\let\thu@main@language\thu@language
\thu@option@hook{language}{%
  \ifx\@begindocumenthook\@undefined
    \let\thu@main@language\thu@language
  \fi
}
\newcommand\thu@reset@main@language{
  \thusetup{language = \thu@main@language}
}
\newcommand\thu@set@chapter@names{%
  \ifthu@language@chinese
    \ctexset{
      chapter/name   = {第,章},
      appendixname   = 附录,
      contentsname   = 目\hspace{\ccwd}录,
      listfigurename = 插图索引,
      listtablename  = 表格索引,
      bibname        = 参考文献,
      indexname      = 索引,
    }%
    \def\thu@denotation@name{主要符号对照表}%
    \def\thu@list@algorithm@name{算法索引}%
    \def\listequationname{公式索引}%
    \def\thu@acknowledgements@name{致\hspace{\ccwd}谢}%
    \ifthu@degree@bachelor
      \def\thu@resume@name{在学期间参加课题的研究成果}%
    \else
      \ifthu@degree@postdoc
        \def\thu@resume@name{个人简历、发表的学术论文与科研成果}%
      \else
        % \def\thu@resume@name{个人简历、在学期间发表的学术论文与研究成果}%
        \def\thu@resume@name{攻读硕士学位期间论文发表及科研情况}%
      \fi
    \fi
  \else
    \ifthu@language@english
      \ctexset{
        chapter/name   = \chaptername\space,
        appendixname   = Appendix,
        contentsname   = Contents,
        listfigurename = List of Figures,
        listtablename  = List of Tables,
        bibname        = Bibliography,
        indexname      = Index,
      }%
      \def\thu@denotation@name{Nomenclature}%
      \def\thu@list@algorithm@name{List of Algorithms}%
      \def\listequationname{List of Equations}%
      \def\thu@acknowledgements@name{Acknowledgements}%
      \ifthu@degree@bachelor
        \def\thu@resume@name{Research Achievements}%
      \else
        \def\thu@resume@name{Resume, Publications and Research Achievements}%
      \fi
    \fi
  \fi
}
\thu@set@chapter@names
\thu@option@hook{degree}{\thu@set@chapter@names}
\thu@option@hook{language}{%
  \ifx\@begindocumenthook\@undefined
    \thu@set@chapter@names
  \fi
}
\newcommand\thu@set@names{%
  \ifthu@language@chinese
    \ctexset{
      figurename = 图,
      tablename  = 表,
    }%
    \def\thu@algorithm@name{算法}%
    \def\thu@equation@name{公式}%
    \def\thu@assumption@name{假设}%
    \def\thu@definition@name{定义}%
    \def\thu@proposition@name{命题}%
    \def\thu@lemma@name{引理}%
    \def\thu@theorem@name{定理}%
    \def\thu@axiom@name{公理}%
    \def\thu@corollary@name{推论}%
    \def\thu@exercise@name{练习}%
    \def\thu@example@name{例}%
    \def\thu@remark@name{注释}%
    \def\thu@problem@name{问题}%
    \def\thu@conjecture@name{猜想}%
    \def\thu@proof@name{证明}%
    \def\thu@theorem@separator{：}%
  \else
    \ifthu@language@english
      \ctexset{
        figurename = {Figure},
        tablename  = {Table},
      }%
      \def\thu@algorithm@name{Algorithm}%
      \def\thu@equation@name{Equation}%
      \def\thu@assumption@name{Assumption}%
      \def\thu@definition@name{Definition}%
      \def\thu@proposition@name{Proposition}%
      \def\thu@lemma@name{Lemma}%
      \def\thu@theorem@name{Theorem}%
      \def\thu@axiom@name{Axiom}%
      \def\thu@corollary@name{Corollary}%
      \def\thu@exercise@name{Exercise}%
      \def\thu@example@name{Example}%
      \def\thu@remark@name{Remark}%
      \def\thu@problem@name{Problem}%
      \def\thu@conjecture@name{Conjecture}%
      \def\thu@proof@name{Proof}%
      \def\thu@theorem@separator{: }%
    \fi
  \fi
}
\thu@set@names
\thu@option@hook{language}{\thu@set@names}
\newcommand\thu@set@punctuations{%
  \ifthu@language@chinese
    \xeCJKDeclareCharClass{FullLeft}{"2018, "201C}%
    \xeCJKDeclareCharClass{FullRight}{
      "00B7, "2019, "201D, "2013, "2014, "2025, "2026, "2E3A,
    }%
  \else
    \ifthu@language@english
      \xeCJKDeclareCharClass{HalfLeft}{"2018, "201C}%
      \xeCJKDeclareCharClass{HalfRight}{
        "00B7, "2019, "201D, "2013, "2014, "2025, "2026, "2E3A,
      }%
    \fi
  \fi
}
\thu@set@punctuations
\thu@option@hook{language}{\thu@set@punctuations}
\pagestyle{fancy}
\fancypagestyle{plain}{%
  \fancyhf{}%
  \renewcommand\footrulewidth{0pt}%
  \ifthu@degree@bachelor
    \renewcommand\headrulewidth{0pt}%
    \fancyfoot[C]{\xiaowu\thepage}%
    \let\@mkboth\@gobbletwo
  \else
    \renewcommand\headrulewidth{0bp}%
    \fancyhead[C]{\parbox{\textwidth}{\centering \youyuan\xiaowu 青\hspace{2pt}岛\hspace{2pt}理\hspace{2pt}工\hspace{2pt}大\hspace{2pt}学\hspace{2pt}工\hspace{2pt}学\hspace{2pt}硕\hspace{2pt}士\hspace{2pt}学\hspace{2pt}位\hspace{2pt}论\hspace{2pt}文 \vspace{2pt} \hrule height 1.6pt \relax \vspace{0.8pt} \hrule height 0.8pt \relax}}%
    % \fancyhead[C]{\parbox{\textwidth}{\centering \youyuan\xiaowu 青\hspace{2pt}岛\hspace{2pt}理\hspace{2pt}工\hspace{2pt}大\hspace{2pt}学\hspace{2pt}工\hspace{2pt}程\hspace{2pt}硕\hspace{2pt}士\hspace{2pt}学\hspace{2pt}位\hspace{2pt}论\hspace{2pt}文 \vspace{2pt} \hrule height 1.6pt \relax \vspace{0.8pt} \hrule height 0.8pt \relax}}%
    \fancyfoot[C]{\wuhao\thepage}%
    \let\@mkboth\markboth
  \fi
  \def\chaptermark##1{%
    \markboth{\CTEXifname{\CTEXthechapter\hskip\ccwd}{}##1}{}%
  }%
}
\pagestyle{plain}
\fancypagestyle{nofooter}{%
  \fancyfoot{}%
}
\ctexset{chapter/pagestyle = plain}
\ctexset{%
  punct=quanjiao,
  space=auto,
  autoindent=true}
\setlist{nosep}
\def\thu@textcircled#1{%
  \ifnum\value{#1} >10\relax
    \thu@error{%
      Too many footnotes in this page.
      Keep footnote less than 10%
    }%
  \fi
  {\CJKfamily+{}\symbol{\the\numexpr\value{#1}+"245F\relax}}%
}
\renewcommand{\thefootnote}{\thu@textcircled{footnote}}
\renewcommand{\thempfootnote}{\thu@textcircled{mpfootnote}}
\def\footnoterule{\vskip-3\p@\hrule\@width0.3\textwidth\@height0.4\p@\vskip2.6\p@}
\let\thu@footnotesize\footnotesize
\renewcommand\footnotesize{\thu@footnotesize\xiaowu[1.5]}
\footnotemargin1.5em\relax
\let\thu@makefnmark\@makefnmark
\def\thu@@makefnmark{\hbox{{\normalfont\@thefnmark}}}
\pretocmd{\@makefntext}{\let\@makefnmark\thu@@makefnmark}{}{}
\apptocmd{\@makefntext}{\let\@makefnmark\thu@makefnmark}{}{}
\urlstyle{same}
\g@addto@macro\UrlBreaks{%
  \do0\do1\do2\do3\do4\do5\do6\do7\do8\do9%
  \do\A\do\B\do\C\do\D\do\E\do\F\do\G\do\H\do\I\do\J\do\K\do\L\do\M
  \do\N\do\O\do\P\do\Q\do\R\do\S\do\T\do\U\do\V\do\W\do\X\do\Y\do\Z
  \do\a\do\b\do\c\do\d\do\e\do\f\do\g\do\h\do\i\do\j\do\k\do\l\do\m
  \do\n\do\o\do\p\do\q\do\r\do\s\do\t\do\u\do\v\do\w\do\x\do\y\do\z
}
\Urlmuskip=0mu plus 0.1mu
\newcommand\thu@set@math@ellipsis{%
  \ifthu@language@chinese
    \DeclareRobustCommand\mathellipsis{\mathinner{\unicodecdots}}%
  \else
    \ifthu@language@english
      \DeclareRobustCommand\mathellipsis{\mathinner{\unicodeellipsis}}%
    \fi
  \fi
}
\thu@set@math@ellipsis
\thu@option@hook{language}{\thu@set@math@ellipsis}
\protected\def\le{\leqslant}
\protected\def\ge{\geqslant}
\AtBeginDocument{%
  \renewcommand\leq{\leqslant}%
  \renewcommand\geq{\geqslant}%
}
\removenolimits{%
  \int\iint\iiint\iiiint\oint\oiint\oiiint
  \intclockwise\varointclockwise\ointctrclockwise\sumint
  \intbar\intBar\fint\cirfnint\awint\rppolint
  \scpolint\npolint\pointint\sqint\intlarhk\intx
  \intcap\intcup\upint\lowint
}
\AtBeginDocument{%
  \renewcommand{\Re}{\operatorname{Re}}%
  \renewcommand{\Im}{\operatorname{Im}}%
}
\AtBeginDocument{%
  \renewcommand\nabla{\mbfnabla}%
}
\DeclareRobustCommand\bm[1]{{\symbf{#1}}}
\DeclareRobustCommand\boldsymbol[1]{{\symbf{#1}}}
\newcommand\square{\mdlgwhtsquare}
\AtBeginDocument{%
  \renewcommand\checkmark{\ensuremath{✓}}%
}
\allowdisplaybreaks[4]
\renewcommand\theequation{\ifnum \c@chapter>\z@ \thechapter-\fi\@arabic\c@equation}
\def\make@df@tag{\@ifstar\thu@make@df@tag@@\make@df@tag@@@}
\def\thu@make@df@tag@@#1{\gdef\df@tag{\thu@maketag{#1}\def\@currentlabel{#1}}}
\iffalse
\ifthu@degree@bachelor
  \def\thu@maketag#1{\maketag@@@{%
    (\ignorespaces\text{\thu@equation@name\hskip0.5em}#1\unskip\@@italiccorr)}}
  \def\tagform@#1{\maketag@@@{%
    (\ignorespaces\text{\thu@equation@name\hskip0.5em}#1\unskip\@@italiccorr)\equcaption{#1}}}
\fi
\fi
\def\thu@maketag#1{\maketag@@@{(\ignorespaces #1\unskip\@@italiccorr)}}
\def\tagform@#1{\maketag@@@{(\ignorespaces #1\unskip\@@italiccorr)\equcaption{#1}}}
\renewcommand{\eqref}[1]{\textup{(\ref{#1})}}
\setlength{\floatsep}{6bp}
\setlength{\textfloatsep}{6bp}
\setlength{\intextsep}{6bp}
\setlength{\@fptop}{0bp \@plus1.0fil}
\setlength{\@fpsep}{12bp \@plus2.0fil}
\setlength{\@fpbot}{0bp \@plus1.0fil}
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}
\ifthu@degree@bachelor
  \AtBeginDocument{% delay the check until all packages are loaded
    \g@addto@macro\appendix{\renewcommand*{\thefigure}{\thechapter-\arabic{figure}}}
    \g@addto@macro\appendix{\renewcommand*{\thetable}{\thechapter-\arabic{table}}}
  }
\fi
\let\old@tabular\@tabular
\def\thu@tabular{\dawu[1.5]\old@tabular}
\DeclareCaptionFont{thu}{\kaishu\wuhao}
\DeclareCaptionLabelSeparator{thu}{\hspace{\ccwd}}
\captionsetup{
  format         = hang,
  font           = thu,
  labelsep       = thu,
  aboveskip      = 6bp,
  belowskip      = 6bp,
  figureposition = bottom,
  tableposition  = top,
}
\captionsetup[sub]{font=thu}
\renewcommand{\thesubfigure}{(\alph{subfigure})}
\renewcommand{\thesubtable}{(\alph{subtable})}
\heavyrulewidth=1.5bp
\lightrulewidth=1bp
\def\hlinewd#1{%
  \noalign{\ifnum0=`}\fi\hrule \@height #1 \futurelet
    \reserved@a\@xhline}
\ifthu@degree@bachelor
  \newcommand{\thu@abstract@name}{中文摘要}
  \newcommand{\thu@abstract@name@en}{ABSTRACT}
\else
  \newcommand{\thu@abstract@name}{摘\hspace{\ccwd}要}
  \newcommand{\thu@abstract@name@en}{Abstract}
\fi
\newcommand\thu@chapter@titleformat[1]{%
  \ifthu@degree@bachelor #1\else%
    \ifthenelse%
      {\equal{#1}{\thu@abstract@name@en}}%
      {\bfseries #1}%
      {#1}%
  \fi}
\ctexset{%
  chapter={
    afterindent=true,
    beforeskip={\ifthu@degree@bachelor 15bp\else 9bp\fi},
    aftername=\hskip\ccwd,
    afterskip={\ifthu@degree@bachelor 20bp\else 24bp\fi},
    % format={\centering\sffamily\ifthu@degree@bachelor\xiaosan[1.333]\else\sanhao[1]\fi},
    format={\centering\sffamily\ifthu@degree@bachelor\xiaosan[1.333]\else\xiaoer[1]\fi},
    nameformat=\relax,
    numberformat=\relax,
    titleformat=\thu@chapter@titleformat,
    lofskip=0pt,
    lotskip=0pt,
  },
  section={
    afterindent=true,
    beforeskip={\ifthu@degree@bachelor 25bp\else 18bp\fi\@plus 1ex \@minus .2ex},
    afterskip={\ifthu@degree@bachelor 12bp\else 6bp\fi \@plus .2ex},
    format={\sffamily\ifthu@degree@bachelor\sihao[1.286]\else\xiaosan[1.5]\fi},
  },
  subsection={
    afterindent=true,
    beforeskip={\ifthu@degree@bachelor 12bp\else 16bp\fi\@plus 1ex \@minus .2ex},
    afterskip={6bp \@plus .2ex},
    format={\sffamily\ifthu@degree@bachelor\xiaosi[1.25]\else\sihao[1.5]\fi},
    numberformat={\sffamily\ifthu@degree@bachelor\banxiaosi[1.154]\else\sihao[1.5]\fi},
  },
  subsubsection={
    afterindent=true,
    beforeskip={\ifthu@degree@bachelor 12bp\else 16bp\fi\@plus 1ex \@minus .2ex},
    afterskip={6bp \@plus .2ex},
    format={\sffamily\ifthu@degree@bachelor\xiaosi[1.25]\else\xiaosi[1.667]\fi},
  },
  paragraph/afterindent=true,
  subparagraph/afterindent=true}
\newcommand\thu@pdfbookmark[2]{}
\newcommand\thu@phantomsection{}
\NewDocumentCommand\thu@chapter{s o m o}{
  \IfBooleanF{#1}{%
    \thu@error{You have to use the star form: \string\thu@chapter*}%
  }%
  \if@openright\cleardoublepage\else\clearpage\fi%
  \IfValueTF{#2}{%
    \ifthenelse{\equal{#2}{}}{%
      \thu@pdfbookmark{0}{#3}%
    }{%
      \thu@phantomsection
      \addcontentsline{toc}{chapter}{#3}%
    }%
  }{%
    \thu@phantomsection
    \addcontentsline{toc}{chapter}{#3}%
  }%
  \ifthu@degree@bachelor\ctexset{chapter/beforeskip=25bp}\fi
  \chapter*{#3}%
  \ifthu@degree@bachelor\ctexset{chapter/beforeskip=15bp}\fi
  \IfValueTF{#4}{%
    \ifthenelse{\equal{#4}{}}{%
      \@mkboth{}{}%
    }{%
      \@mkboth{#4}{#4}%
    }%
  }{%
    \@mkboth{#3}{#3}%
  }%
}
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}
\renewcommand\tableofcontents{%
  \thu@chapter*[]{\contentsname}%
  \@starttoc{toc}%
}
\thu@define@key{
  toc-chapter-style = {
    name = toc@chapter@style,
    choices = {
      arial,
      times,
    },
    default = arial,
  },
}
% \newcommand\thu@leaders{\titlerule*[4bp]{.}}
\newcommand\thu@leaders{\titlerule*[4bp]{$\cdots$}}
\newcommand\thu@set@toc@format{%
  \contentsmargin{\z@}%
  \ifthu@degree@bachelor
    \titlecontents{chapter}
      [\z@]{\addvspace{6bp}
        \ifthu@toc@chapter@style@arial
          \sffamily
        \else
          \heiti
        \fi
      }
      {\contentspush{\thecontentslabel\hspace{\ccwd}}}{}
      {\rmfamily\thu@leaders\thecontentspage}%
    \titlecontents{section}
      [1\ccwd]{}
      {\contentspush{\thecontentslabel\hspace{\ccwd}}}{}
      {\thu@leaders\thecontentspage}%
    \titlecontents{subsection}
      [1.5\ccwd]{}
      {\contentspush{\thecontentslabel\hspace{\ccwd}}}{}
      {\thu@leaders\thecontentspage}%
  \else
    \titlecontents{chapter}
      % [\z@]{\addvspace{6bp}\sffamily}
      [\z@]{\addvspace{2.5bp}\sffamily}
      {\contentspush{\thecontentslabel\hspace{\ccwd}}}{}
      {\rmfamily\thu@leaders\thecontentspage}%
    \titlecontents{section}
      [1\ccwd]{}
      {\contentspush{\thecontentslabel\hspace{\ccwd}}}{}
      {\thu@leaders\thecontentspage}%
    \titlecontents{subsection}
      [2\ccwd]{}
      {\contentspush{\thecontentslabel\hspace{\ccwd}}}{}
      {\thu@leaders\thecontentspage}%
  \fi
}
\thu@set@toc@format
\thu@option@hook{degree}{\thu@set@toc@format}
\thu@define@key{
  secret-level = {
    name = secret@level,
  },
  secret-year = {
    name = secret@year,
  },
  title = {
    default = {标题},
  },
  title* = {
    default = {Title},
    name    = title@en,
  },
  author = {
    default = {姓名},
  },
  author* = {
    default = {Name of author},
    name    = author@en,
  },
  supervisor = {
    default = {导师姓名},
  },
  supervisor* = {
    default = {Name of supervisor},
    name    = supervisor@en,
  },
  associate-supervisor = {
    name = associate@supervisor,
  },
  associate-supervisor* = {
    name = associate@supervisor@en,
  },
  joint-supervisor = {
    name = joint@supervisor,
  },
  joint-supervisor* = {
    name = joint@supervisor@en,
  },
  degree-name = {
    default = {工学博士},
    name    = degree@name,
  },
  degree-name* = {
    default = {Doctor of Philosophy},
    name    = degree@name@en,
  },
  department = {
    default = {计算机科学与技术系},
  },
  discipline = {
    % default = {计算机科学与技术},
  },
  discipline* = {
    % default = {Computer Science and Technology},
    name    = discipline@en,
  },
  date = {
    default = {\the\year-\two@digits{\month}-\two@digits{\day}},
  },
  clc,
  udc,
  id,
  discipline-level-1 = {
    default = {一级学科名称},
    name    = discipline@level@i,
  },
  discipline-level-2 = {
    default = {二级学科名称},
    name    = discipline@level@ii,
  },
  start-date = {
    name    = start@date,
    default = {\the\year-\two@digits{\month}-\two@digits{\day}},
  },
  end-date = {
    name    = end@date,
    default = {\the\year-\two@digits{\month}-\two@digits{\day}},
  },
  include-spine = {
    name = include@spine,
    choices = {
      false,
      true,
    },
    default = false,
  },
}
\newcommand\thu@format@date[2]{%
  \edef\thu@@date{#2}%
  \def\thu@@process@date##1-##2-##3\@nil{%
    #1{##1}{##2}{##3}%
  }%
  \expandafter\thu@@process@date\thu@@date\@nil
}
\newcommand\thu@date@zh@digit[3]{#1 年 \number#2 月 \number#3 日}
\newcommand\thu@date@zh@digit@short[3]{#1 年 \number#2 月}
\newcommand\thu@date@zh@short[3]{\zhdigits{#1}年\zhnumber{#2}月}
\newcommand\thu@date@month[1]{%
  \ifcase\number#1\or
    January\or February\or March\or April\or May\or June\or
    July\or August\or September\or October\or November\or December%
  \fi
}
\newcommand\thu@date@en@short[3]{\thu@date@month{#2}, #1}
\newcommand\thu@underline[2][6em]{\hskip1pt\underline{\hb@xt@ #1{\hss#2\hss}}\hskip3pt}
\newcommand\thu@CJKunderline[2][6em]{\CJKunderline*{\hb@xt@ #1{\hss#2\hss}}}
\newcommand\thu@fixed@box[2]{%
  \begingroup
    \def\CJKglue{\hskip 0pt plus 2filll minus 1filll}%
    \makebox[#1][l]{#2}%
  \endgroup
}
\newbox\thu@stretch@box
\newcommand\thu@stretch[2]{%
  \sbox\thu@stretch@box{#2}%
  \ifdim \wd\thu@stretch@box < #1\relax
    \begingroup
      \def\CJKglue{\hskip 0pt plus 2filll}%
      \makebox[#1][l]{#2}%
    \endgroup
  \else
    \box\thu@stretch@box
  \fi
}
\newbox\thu@pad@box
\newcommand\thu@pad[2]{%
  \sbox\thu@pad@box{#2}%
  \ifdim \wd\thu@pad@box < #1\relax
    \makebox[#1][l]{\box\thu@pad@box}%
  \else
    \box\thu@pad@box
  \fi
}
\newcounter{thu@csl@count}
\newcommand\thu@name@title@process[1]{%
  \ifcase\c@thu@csl@count  % == 0
    \gdef\thu@@name{#1}%
  \or  % == 1
    \gdef\thu@@title{#1}%
  \fi
  \stepcounter{thu@csl@count}%
}
\newcommand\thu@name@title@format[2]{%
  \thu@pad{3cm}{\thu@stretch{4em}{#1}}%
  \thu@stretch{3em}{#2}%
}
\newcommand\thu@name@title[1]{%
  \setcounter{thu@csl@count}{0}%
  \gdef\thu@@name{}%
  \gdef\thu@@title{}%
  \expandafter\comma@parse\expandafter{#1}{\thu@name@title@process}%
  \thu@name@title@format{\thu@@name}{\thu@@title}%
}
\renewcommand\maketitle{%
  \cleardoublepage
  \pagenumbering{Alph}%
  \thu@pdfbookmark{-1}{\thu@title}%
  \thu@titlepage
  \ifthu@include@spine@true
    \thu@spine
  \fi
  \ifthu@degree@graduate
    \cleardoublepage
    \thu@titlepage@en
  \fi
  \clearpage
}
\newcommand\thu@titlepage{%
  \ifthu@degree@graduate
    \ifthu@degree@type@academic
      \thu@titlepage@graduate@academic
    \else
      \ifx\thu@discipline\@empty
        \thu@titlepage@graduate@professional
      \else
        \thu@titlepage@graduate@academic
      \fi
    \fi
  \else
    \ifthu@degree@bachelor
      \thu@titlepage@bachelor
    \else
      \ifthu@degree@postdoc
        \thu@cover@postdoc
        \cleardoublepage
        \thu@titlepage@postdoc
      \fi
    \fi
  \fi
}
\newcommand\thu@titlepage@graduate@academic{%
  \newgeometry{
    top     = 2.5cm,
    bottom  = 2.5cm,
    hmargin = 3.5cm,
  }%
  \thispagestyle{empty}%
  \null
  \begingroup
    % \parbox[t][2cm][t]{\textwidth}{%
    %   \hskip -0.69cm%
    %   \thu@titlepage@bookindex
    % }\par
    \thu@titlepage@bookindex
    \centering
    \vskip 1.5cm%
    \thu@titlepage@degree
    \vskip 0.85cm%
    {\thu@titlepage@title}%
    \vfill
    \parbox[t][7.25cm][t]{\textwidth}{\centering\thu@titlepage@info}\par
    % \parbox[t][1.03cm][t]{\textwidth}{\centering\thu@titlepage@date}\par
  \endgroup
  \clearpage
  \restoregeometry
}
\newcommand\thu@titlepage@graduate@professional{%
  \newgeometry{
    top     = 2cm,
    bottom  = 6cm,
    hmargin = 3.5cm,
  }%
  \thispagestyle{empty}%
  \null\vskip 0.45cm%
  \begingroup
    \centering
    \parbox[t][1.52cm][t]{\textwidth}{%
      \hskip -0.69cm%
      \thu@titlepage@secret
    }\par
    \vskip 1.5cm%
    {\sffamily\yihao[1.575]\thu@title\par}%
    \vskip 0.9cm%
    \thu@titlepage@degree
    \vfill
    \parbox[t][5.28cm][t]{\textwidth}{\centering\thu@titlepage@info}\par
    \parbox[t][1.25cm][t]{\textwidth}{\centering\thu@titlepage@date}\par
  \endgroup
  \clearpage
  \restoregeometry
}
\newcommand\thu@titlepage@secret{%
  \sffamily\CJKfamily+{}\sanhao
  \ifx\thu@secret@level\@empty
    \phantom{秘密}%
  \else
    \thu@secret@level★\makebox[3em][c]{\thu@secret@year}年%
  \fi\par
}
\newcommand\thu@titlepage@degree{%
  \begingroup
    \def\CJKglue{\hskip 2bp}%
    \sffamily\erhao
    硕士学位论文\par
  \endgroup
}
\newcommand\thu@titlepage@title{%
  \sffamily\bfseries\erhao[1.8]\thu@title\par
}
\newcommand\thu@titlepage@info{%
  \ifthu@degree@doctor
    \ifthu@degree@type@academic
      \thu@titlepage@info@doctor@academic
    \else
      \thu@titlepage@info@doctor@professional
    \fi
  \else
    \ifthu@degree@type@academic
      \thu@titlepage@info@master@academic
    \else
      \ifx\thu@discipline\@empty
        \thu@titlepage@info@master@other
      \else
        \thu@titlepage@info@master@engineer
      \fi
    \fi
  \fi
}
\newcommand\thu@titlepage@info@tabular[4]{%
  \def\thu@info@item##1##2##3{%
    \ifx##3\@empty\else
      \thu@pad{#1}{\thu@fixed@box{#2}{##1}}%
      \thu@pad{#3}{：}%
      ##2{##3}\\
    \fi
  }%
  \sffamily\sihao[1.95]%
  \begin{tabular}{l}%
    #4%
  \end{tabular}%
}
\newcommand\thu@titlepage@info@doctor@academic{%
  \thu@titlepage@info@tabular{2.8cm}{2.8cm}{0.82cm}{%
    \thu@info@item{培养单位}{}{\thu@department}%
    \thu@info@item{学科}{}{\thu@discipline}%
    \thu@info@item{研究生}{\thu@name@title}{\thu@author}%
    \thu@info@item{指导教师}{\thu@name@title}{\thu@supervisor}%
    \thu@info@item{副指导教师}{\thu@name@title}{\thu@associate@supervisor}%
    \thu@info@item{联合导师}{\thu@name@title}{\thu@joint@supervisor}%
  }\par
}
\newcommand\thu@titlepage@info@doctor@professional{%
  \thu@titlepage@info@tabular{3.03cm}{5em}{1.52cm}{%
    \thu@info@item{培养单位}{}{\thu@department}%
    \thu@info@item{申请人}{\thu@name@title}{\thu@author}%
    \thu@info@item{指导教师}{\thu@name@title}{\thu@supervisor}%
    \thu@info@item{副指导教师}{\thu@name@title}{\thu@associate@supervisor}%
    \thu@info@item{联合导师}{\thu@name@title}{\thu@joint@supervisor}%
  }\par
}
\newcommand\thu@titlepage@info@master@academic{%
  \thu@titlepage@info@tabular{2.97cm}{5.5em}{0.82cm}{%
    \thu@info@item{硕士研究生}{\thu@name@title}{\thu@underline[8em]\thu@author}%    
    \thu@info@item{导师姓名}{\thu@name@title}{\thu@underline[8em]\thu@supervisor}%
    \thu@info@item{申请学位级别}{\thu@name@title}{\thu@underline[8em]\thu@degree@name}%
    \thu@info@item{学科、专业}{}{\thu@underline[8em]\thu@discipline}%

    \thu@info@item{所在单位}{}{\thu@underline[8em]\thu@department}%
    \thu@info@item{答辩日期}{\thu@name@title}{\thu@underline[8em]{\thu@format@date{\thu@date@zh@digit@short}{\thu@date}}}%
    %\thu@info@item{答辩日期}{\thu@name@title}{\thu@format@date{\thu@date@zh@short}{\thu@date}}%
    \thu@info@item{学位授予单位}{\thu@name@title}{\thu@underline[8em]{青岛理工大学}}%
  }\par
}
\newcommand\thu@titlepage@bookindex{%
  \begingroup
    \def\CJKglue{\hskip 2bp}%
    \sffamily\xiaosi[1.5]%
    \leftline{国内图书分类号:\thu@underline[8em]{TU746.1}}
    
    \leftline{国际图书分类号:\thu@underline[8em]{}}\par
  \endgroup
}
\newcommand\thu@titlepage@info@master@engineer{%
  \thu@titlepage@info@tabular{2.8cm}{2.8cm}{1.34cm}{%
    \thu@info@item{培养单位}{}{\thu@department}%
    \thu@info@item{工程领域}{}{\thu@discipline}%
    \thu@info@item{申请人}{\thu@name@title}{\thu@author}%
    \thu@info@item{指导教师}{\thu@name@title}{\thu@supervisor}%
    \thu@info@item{副指导教师}{\thu@name@title}{\thu@associate@supervisor}%
    \thu@info@item{联合指导教师}{\thu@name@title}{\thu@joint@supervisor}%
  }\par
}
\newcommand\thu@titlepage@info@master@other{%
  \thu@titlepage@info@tabular{3.28cm}{5em}{1.52cm}{%
    \thu@info@item{培养单位}{}{\thu@department}%
    \thu@info@item{申请人}{\thu@name@title}{\thu@author}%
    \thu@info@item{指导教师}{\thu@name@title}{\thu@supervisor}%
    \thu@info@item{副指导教师}{\thu@name@title}{\thu@associate@supervisor}%
    \thu@info@item{联合指导教师}{\thu@name@title}{\thu@joint@supervisor}%
  }\par
}
\newcommand\thu@titlepage@date{%
  \begingroup
    \def\CJKglue{\hskip 1bp}%
    \sanhao\thu@format@date{\thu@date@zh@short}{\thu@date}\par
  \endgroup
}
\newcommand{\thu@titlepage@en}{%
  \newgeometry{
    top     = 2.5cm,
    bottom  = 2.5cm,
    hmargin = 3.5cm,
  }%
  \thispagestyle{empty}%
  \ifthu@degree@type@academic
    \thu@titlepage@en@graduate@academic
  \else
    \thu@titlepage@en@graduate@professional
  \fi
  \clearpage
  \restoregeometry
}
\newcommand\thu@titlepage@en@graduate@academic{%
  \begingroup
    \thu@titlepage@en@bookindex
    \centering
    \vskip 1.5cm%
    \thu@titlepage@en@degree
    \vskip 0.85cm%
    {\thu@titlepage@en@title}%
    \vfill
    \parbox[t][7.25cm][t]{\textwidth}{\centering\thu@titlepage@en@info}\par
    % \parbox[t][1.03cm][t]{\textwidth}{\centering\thu@titlepage@date}\par
  \endgroup
}
\newcommand\thu@titlepage@en@graduate@professional{%
  \begingroup
    \centering
    \null\vskip -0.7cm%
    \thu@titlepage@en@title
    \vfill
    \sanhao[1.725]%
    \thu@titlepage@en@degree
    \vskip 1.1cm%
    {\sffamily by\par}
    \vskip 0.24cm%
    {\sffamily\bfseries\thu@author@en\par}%
    \ifx\thu@discipline@en\empty
      \vskip 1.95cm%
    \else
      \vskip -0.1cm%
      {\sffamily\bfseries(\thu@discipline@en)\par}%
      \vskip 1.1cm%
    \fi
    \parbox[t][3.37cm][t]{\textwidth}{%
      \centering\xiaosan[1.82]%
      \thu@titlepage@en@supervisor
    }\par
    \thu@titlepage@en@date
    \vskip 0.3cm%
  \endgroup
}
\newcommand\thu@titlepage@en@title{%
  \begingroup
    \rmfamily\bfseries\fontsize{22bp}{24bp}\selectfont
    \thu@title@en\par
  \endgroup
}
\newcommand\thu@thesis@name@en{%
  \ifthu@degree@master
    Thesis%
  \else
    Dissertation%
  \fi
}
\newcommand\thu@titlepage@en@degree{%
  \begingroup
    % \def\CJKglue{\hskip 2bp}%
    \sffamily\xiaoer
    Dissertation for the Master Degree in Engineering\par
  \endgroup
}
\newcommand\thu@titlepage@en@supervisor{%
  \begin{tabular}{r@{\makebox[0.71cm][l]{:}}l}%
    \thu@thesis@name@en{} Supervisor & \thu@supervisor@en     \\
    \ifx\thu@associate@supervisor@en\@empty\else
      Associate Supervisor            & \thu@associate@supervisor@en \\
    \fi
    \ifx\thu@joint@supervisor@en\@empty\else
      Cooperate Supervisor            & \thu@joint@supervisor@en   \\
    \fi
  \end{tabular}%
}
\newcommand\thu@titlepage@en@date{%
  \begingroup
    \sffamily\bfseries\sanhao
    \thu@format@date{\thu@date@en@short}{\thu@date}\par
  \endgroup
}
\newcommand\thu@titlepage@en@bookindex{%
  \begingroup
    \def\CJKglue{\hskip 2bp}%
    \sffamily\xiaosi[1.5]%
    \leftline{Classified Index:\thu@underline[8em]{TU746.1}}
    
    \leftline{U.D.C:\thu@underline[12.5em]{}}\par
  \endgroup
}
\newcommand\thu@titlepage@en@info{%
%   \thu@titlepage@info@tabular{6.61cm}{7.54em}{0.82cm}{%
  \thu@titlepage@en@info@tabular{6.61cm}{6.61em}{0.5cm}{%
    \thu@info@item{\bfseries Candidate}{\thu@name@title}{\thu@author@en}%    
    \thu@info@item{\bfseries Supervisor}{\thu@name@title}{\thu@supervisor@en}%
    \thu@info@item{\bfseries Academic Degree Applied for}{\thu@name@title}{\thu@degree@name@en}%
    \thu@info@item{\bfseries Specialty}{}{\thu@discipline@en}%
    \thu@info@item{\bfseries Date of Oral Examination}{\thu@name@title}{{\thu@format@date{\thu@date@en@short}{\thu@date}}}%
    \thu@info@item{\bfseries University}{\thu@name@title}{{Qingdao University of Technology}}%
  }\par
}
\newcommand\thu@titlepage@en@info@tabular[4]{%
  \def\thu@info@item##1##2##3{%
    \ifx##3\@empty\else
      \thu@pad{#1}{\thu@fixed@box{#2}{##1}}%
      \thu@pad{#3}{：}%
      ##2{##3}\\
    \fi
  }%
  \rmfamily\sihao[1.95]%
  \begin{tabular}{l}%
    #4%
  \end{tabular}%
}
\newcommand\thu@titlepage@bachelor{%
  \newgeometry{
    vmargin = 2.54cm,
    hmargin = 3.17cm,
  }%
  \thispagestyle{empty}%
  \null\vskip 0.44cm%
  \begingroup
    \centering
    \parbox[t][2cm][t]{\textwidth}{%
      \hfill
      \sffamily\CJKfamily+{}\xiaosi
      \ifx\thu@secret@level\@empty
        \phantom{秘密}%
      \else
        \thu@secret@level\makebox[3em][c]{\thu@secret@year}年%
      \fi\par
    }\par
    \begingroup
      \includegraphics{tsinghua-name-bachelor.pdf}%
      \par
    \endgroup
    \vskip 0.94cm%
    {\sffamily\bfseries\xiaochu\ziju{0.5}综合论文训练\par}%
    \vskip 2.3cm%
    \parbox[t][2.4cm][t]{\textwidth}{%
      \heiti\xiaoer[1.56]%
      \parindent=2em%
      \hangindent=5em%
      \makebox[3em][l]{题目：}%
      \yihao[1.56]%
      \CJKunderline[skip=false, thickness=0.05em, depth=0.12em]{\thu@title}\par
    }\par
    \vskip 2.5cm%
    \begingroup
      \fangsong\sanhao[2.3]%
      \leftskip=2.5cm%
      \parindent=\z@
      \def\thu@info@item##1##2##3{%
        \ifx##3\@empty\else
          \thu@fixed@box{%
            \ifx\thu@joint@supervisor\@empty
              4em%
            \else
              5.5em%
            \fi
          }{##1}：##2{##3}\\
        \fi
      }%
      \def\thu@name@title@format##1##2{%
        \thu@stretch{3em}{##1}\quad ##2%
      }
      \thu@info@item{系别}{}{\thu@department}%
      \thu@info@item{专业}{}{\thu@discipline}%
      \thu@info@item{姓名}{\thu@name@title}{\thu@author}%
      \thu@info@item{指导教师}{\thu@name@title}{\thu@supervisor}%
      \thu@info@item{辅导教师}{\thu@name@title}{\thu@associate@supervisor}%
      \thu@info@item{联合指导教师}{\thu@name@title}{\thu@joint@supervisor}%
      \par
    \endgroup
    \vskip 1.5cm%
    {\CJKfamily+{}\xiaosi\thu@format@date{\thu@date@zh@digit}{\thu@date}\par}%
  \endgroup
  \clearpage
  \restoregeometry
}
\newcommand\thu@cover@postdoc{%
  \thispagestyle{empty}%
  \begin{center}%
    \renewcommand\ULthickness{0.7pt}%
    \vspace*{0.35cm}%
    {\sihao[2.6]%
      \thu@stretch{3.1em}{分类号}\thu@underline[3.7cm]{\thu@clc}\hfill
      密级\thu@underline[3.7cm]{\thu@secret@level}\par
      \thu@stretch{3.1em}{U D C}\thu@underline[3.7cm]{\thu@udc}\hfill
      编号\thu@underline[3.7cm]{\thu@id}\par
    }%
    \vskip 3.15cm%
    {\sffamily\bfseries\xiaoer[2.6]%
      {\ziju{1.5}清华大学\par}%
      {\ziju{0.5}博士后研究工作报告\par}%
    }%
    \vskip 0.2cm%
    \parbox[t][4.0cm][c]{\textwidth}{%
      \centering\sihao[3.46]\CJKunderline*[depth=1em]{\thu@title}\par
    }\par
    \vskip 0.4cm%
    {\xiaosi\thu@author\par}%
    \vskip 1.4cm%
    {\xiaosi[1.58]\xeCJKsetup{underline/depth=0.9em}%
      工作完成日期\quad
      \thu@CJKunderline[5.9cm]{%
        \thu@format@date{\thu@date@zh@digit@short}{\thu@start@date}—%
        \thu@format@date{\thu@date@zh@digit@short}{\thu@end@date}
      }\par
      \vskip 0.55cm%
      报告提交日期\quad
      \thu@CJKunderline[5.9cm]{\thu@format@date{\thu@date@zh@digit@short}{\thu@date}}\par
    }%
    \vskip 0.45cm%
    {\xiaosi[2]{\ziju{1}清华大学}\quad （北京）\par}%
    \vskip 0.25cm%
    {\xiaosi[2]\thu@format@date{\thu@date@zh@digit@short}{\thu@date}\par}%
  \end{center}%
}
\newcommand\thu@titlepage@postdoc{%
  \thispagestyle{empty}%
  \begin{center}%
    \vspace*{1.5cm}%
    \parbox[t][3cm][c]{\textwidth}{%
      \centering\sanhao[1.95]\thu@title\par
    }\par
    \vskip 0.15cm%
    \parbox[t][3cm][c]{\textwidth}{%
      \centering\sihao[1.36]\thu@title@en\par
    }\par
    \vskip 0.4cm%
    {\xiaosi[2.6]%
      \begin{tabular}{l@{\quad}l}%
        \thu@stretch{11em}{博士后姓名}                  & \thu@author           \\
        \thu@stretch{11em}{流动站（一级学科）名称}      & \thu@discipline@level@i  \\
        \thu@stretch{11em}{专\quad{}业（二级学科）名称} & \thu@discipline@level@ii \\
      \end{tabular}\par
    }%
    \vskip 2.7cm%
    {\xiaosi[2.6]%
      研究工作起始时间\quad\thu@format@date{\thu@date@zh@digit}{\thu@start@date}\par
      \vskip 0.1cm%
      研究工作期满时间\quad\thu@format@date{\thu@date@zh@digit}{\thu@end@date}\par
    }%
    \vskip 2.1cm%
    {\xiaosi[2.6]清华大学人事部（北京）\par}%
    \vskip 0.6cm%
    {\wuhao\thu@format@date{\thu@date@zh@digit@short}{\thu@date}\par}%
  \end{center}%
}
\newcommand{\thu@authorization@title}{关于学位论文使用授权的说明}
\newcommand{\thu@authorization@content}{%
\ifthu@degree@bachelor
本人完全了解青岛理工大学有关保留、使用学位论文的规定，即：学校有权保留学位
论文的复印件，允许该论文被查阅和借阅；学校可以公布该论文的全部或部分内
容，可以采用影印、缩印或其他复制手段保存该论文。
\else
本人完全了解青岛理工大学有关保留、使用学位论文的规定，即：

青岛理工大学拥有在著作权法规定范围内学位论文的使用权，其中包括：（1）已获学位的研究生
必须按学校规定提交学位论文，学校可以采用影印、缩印或其他复制手段保存研究生上交的
学位论文；（2）为教学和科研目的，学校可以将公开的学位论文作为资料在图书馆、资料
室等场所供校内师生阅读，或在校园网上供校内师生浏览部分内容\ifthu@degree@master 。\else ；
（3）根据《中华人民共和国学位条例暂行实施办法》，向国家图书馆报送可以公开的学位
论文。\fi

本人保证遵守上述规定。
\fi}
\newcommand{\thu@authorization@addon}{%
  \ifthu@degree@bachelor(涉密的学位论文在解密后应遵守此规定)\else （保密的论文在解密后应遵守此规定）\fi}
\newcommand{\thu@authorization@authorsig}{\ifthu@degree@bachelor 签\hskip1em名：\else 作者签名：\fi}
\newcommand{\thu@authorization@teachersig}{导师签名：}
\newcommand{\thu@authorization@frontdate}{%
  日\ifthu@degree@bachelor\hspace{1em}\else\hspace{2em}\fi 期：}
\newcommand\copyrightpage[1][]{%
  \ifthu@degree@postdoc\relax\else
    \cleardoublepage
    \thispagestyle{empty}%
    \thu@pdfbookmark{0}{\thu@authorization@title}%
    \def\thu@@tmp{#1}
    \ifx\thu@@tmp\@empty
      \ifthu@degree@bachelor\thu@authorization@mk\else%
        \begin{list}{}{%
          \topsep\z@%
          \listparindent\parindent%
          \parsep\parskip%
          \setlength{\leftmargin}{0.9mm}%
          \setlength{\rightmargin}{0.9mm}}%
        \item[]\thu@authorization@mk%
        \end{list}%
      \fi%
    \else
      \thu@phantomsection
      \includepdf{#1}%
    \fi
  \fi
}
\newcommand{\thu@authorization@mk}{%
  \ifthu@degree@bachelor\vspace*{0.2cm}\else\vspace*{0.42cm}\fi % shit code!
  \begin{center}\erhao\heiti \thu@authorization@title\end{center}
  \ifthu@degree@bachelor\vskip5pt\else\vskip40pt\sihao[2.03]\fi\par
  \thu@authorization@content\par
  \textbf{\thu@authorization@addon}\par
  \ifthu@degree@bachelor\vskip0.7cm\else\vskip1.0cm\fi
  \ifthu@degree@bachelor
    \indent\mbox{\thu@authorization@authorsig\thu@underline\relax%
    \thu@authorization@teachersig\thu@underline\relax\thu@authorization@frontdate\thu@underline\relax}
  \else
    \begingroup
      \parindent0pt\xiaosi
      \hspace*{1.5cm}\thu@authorization@authorsig\thu@underline[7em]\relax\hfill%
                     \thu@authorization@teachersig\thu@underline[7em]\relax\hspace*{1cm}\\[3pt]
      \hspace*{1.5cm}\thu@authorization@frontdate\thu@underline[7em]\relax\hfill%
                     \thu@authorization@frontdate\thu@underline[7em]\relax\hspace*{1cm}
    \endgroup
  \fi}
\thu@define@key{
  keywords,
  keywords* = {
    name = keywords@en,
  },
}
\newcommand\thu@clist@use[2]{%
  \def\thu@@tmp{}%
  \def\thu@clist@processor##1{%
    \ifx\thu@@tmp\@empty
      \def\thu@@tmp{#2}%
    \else
      #2%
    \fi
    ##1%
  }%
  \expandafter\comma@parse\expandafter{#1}{\thu@clist@processor}%
}
\newbox\thu@kw
\newcommand\thu@put@keywords[2]{%
  \begingroup
    \setbox\thu@kw=\hbox{#1}
    \ifthu@degree@bachelor\indent\else\noindent\hangindent\wd\thu@kw\hangafter1\fi%
    \box\thu@kw#2\par
  \endgroup}
\newenvironment{abstract}{%
  \ifthu@degree@bachelor
    \cleardoublepage
  \fi
  \thusetup{language = chinese}%
  \thu@chapter*[]{\thu@abstract@name}%  %no tocline
}{%
  \ifthu@degree@doctor\vfill\else\vskip12bp\fi
  % \thu@put@keywords{\textbf{关键词：}}{%
  \thu@put@keywords{\sffamily 关键词：}{%
    \thu@clist@use{\thu@keywords}{；}%
  }%
  \ifthu@degree@bachelor
    \cleardoublepage
  \fi
  \thu@reset@main@language % switch back to main language
}
\newenvironment{abstract*}{%
  \ifthu@degree@bachelor
    \cleardoublepage
  \fi
  \thusetup{language = english}%
  \thu@chapter*[]{\thu@abstract@name@en}%  no tocline
}{%
  \ifthu@degree@doctor\vfill\else\vskip12bp\fi
  \thu@put@keywords{%
    \textbf{\ifthu@degree@bachelor Keywords:\else Key Words:\fi\enskip}%
  }{%
    \thu@clist@use{\thu@keywords@en}{; }%
  }%
  \ifthu@degree@bachelor
    \cleardoublepage
  \fi
  \thu@reset@main@language % switch back to main language
}
\newenvironment{denotation}[1][2.5cm]{%
  \ifthu@degree@bachelor
    \cleardoublepage
  \fi
  \thu@chapter*[]{\thu@denotation@name} % no tocline
  \vskip-30bp\xiaosi[1.6]\begin{thu@denotation}[labelwidth=#1]
}{%
  \end{thu@denotation}
}
\newlist{thu@denotation}{description}{1}
\setlist[thu@denotation]{%
  nosep,
  font=\normalfont,
  align=left,
  leftmargin=!, % sum of the following 3 lengths
  labelindent=0pt,
  labelwidth=2.5cm,
  labelsep*=0.5cm,
  itemindent=0pt,
}
\newcommand\thu@statement@name{声\hspace{\ccwd}明}
\newcommand{\thu@statement@text}{本人郑重声明：所呈交的学位论文，是本人在导师指导下
  ，独立进行研究工作所取得的成果。尽我所知，除文中已经注明引用的内容外，本学位论
  文的研究成果不包含任何他人享有著作权的内容。对本论文所涉及的研究工作做出贡献的
  其他个人和集体，均已在文中以明确方式标明。}
\newcommand{\thu@signature}{签\hspace{1em}名：}
\newcommand{\thu@backdate}{日\hspace{1em}期：}
\newenvironment{acknowledgements}{%
  \ifthu@degree@bachelor
    \cleardoublepage
  \fi
  \thu@chapter*{\thu@acknowledgements@name}%
}{%
  \ifthu@degree@bachelor
    \cleardoublepage
  \fi
}
\thu@define@key{
  statement-page-number = {
    name = statement@page@number,
    choices = {
      false,
      true,
    },
    default = false,
  },
}
\newcommand\statement[1][]{%
  \ifthu@degree@bachelor
    \cleardoublepage
  \fi
  \def\thu@@tmp{#1}%
  \ifx\thu@@tmp\@empty
    \thu@chapter*{\thu@statement@name}%
    \ifthu@statement@page@number@false
      \thispagestyle{nofooter}%
    \fi
    \thu@statement@text\par
    \ifthu@degree@graduate
      \vskip 2cm%
    \else
      \null\par
    \fi
    {\hfill\thu@signature\thu@underline[2.5cm]\relax
      \thu@backdate\thu@underline[2.5cm]\relax}%
  \else
    \includepdf[pagecommand={%
      \thu@phantomsection
      \addcontentsline{toc}{chapter}{\thu@statement@name}%
    }]{#1}%
  \fi
  \ifthu@degree@bachelor
    \cleardoublepage
  \fi
}
\let\acknowledgement\acknowledgements
\let\endacknowledgement\endacknowledgements
\def\thu@listof#1{% #1: float type
  \setcounter{tocdepth}{2} % restore tocdepth in case being modified
  \@ifstar
    {\thu@chapter*[]{\csname list#1name\endcsname}\@starttoc{\csname ext@#1\endcsname}}
    {\thu@chapter*{\csname list#1name\endcsname}\@starttoc{\csname ext@#1\endcsname}}%
}
\renewcommand\listoffigures{%
  \thu@set@list@label@width{\figurename}%
  \thu@listof{figure}%
}
\newlength{\thu@list@label@width}
\newcommand\thu@set@list@label@width[1]{%
  \settowidth{\thu@list@label@width}{#1~8.8}%
  \addtolength{\thu@list@label@width}{1em}%
}
\titlecontents{figure}
  [\thu@list@label@width]{\addvspace{6bp}}
  {\contentslabel[\figurename~\thecontentslabel]{\thu@list@label@width}}{}
  {\thu@leaders\thecontentspage}
\renewcommand\listoftables{%
  \thu@set@list@label@width{\tablename}%
  \thu@listof{table}%
}
\titlecontents{table}
  [\thu@list@label@width]{\addvspace{6bp}}
  {\contentslabel[\tablename~\thecontentslabel]{\thu@list@label@width}}{}
  {\thu@leaders\thecontentspage}
\def\ext@equation{loe}
\def\equcaption#1{%
  \addcontentsline{\ext@equation}{equation}%
                  {\protect\numberline{#1}}}
\newcommand\listofequations{\thu@listof{equation}}
\titlecontents{equation}
  [0pt]{\addvspace{6bp}}
  {\thu@equation@name~\thecontentslabel}{}
  {\thu@leaders\thecontentspage}
\contentsuse{equation}{loe}
\DeclareRobustCommand\inlinecite{\@inlinecite}
\def\@inlinecite#1{\begingroup\let\@cite\NAT@citenum\citep{#1}\endgroup}
\let\onlinecite\inlinecite
\renewcommand\bibsection{\thu@chapter*{\bibname}}
\renewcommand\bibfont{\ifthu@degree@bachelor\wuhao[1.619]\else\wuhao[1.5]\fi}
\setlength\bibhang{2\ccwd}
\addtolength{\bibsep}{-0.7em}
\setlength{\labelsep}{0.4em}
\def\@biblabel#1{[#1]\hfill}
\expandafter\newcommand\csname bibstyle@thuthesis-numeric\endcsname{%
  \bibpunct{[}{]}{,}{s}{,}{\textsuperscript{,}}}
\expandafter\newcommand\csname bibstyle@thuthesis-author-year\endcsname{%
  \bibpunct{(}{)}{;}{a}{,}{,}}
\expandafter\newcommand\csname bibstyle@thuthesis-bachelor\endcsname{%
  \bibpunct{[}{]}{,}{s}{,}{\textsuperscript{,}}}
\@namedef{bibstyle@thuthesis-inline}{\bibpunct{[}{]}{,}{n}{,}{,}}
\thu@define@key{
  cite-style = {
    name = cite@style,
  }
}
\thu@option@hook{cite-style}{\@nameuse{bibstyle@thuthesis-\thu@cite@style}}
\patchcmd\NAT@citexnum{%
  \@ifnum{\NAT@ctype=\z@}{%
    \if*#2*\else\NAT@cmt#2\fi
  }{}%
  \NAT@mbox{\NAT@@close}%
}{%
  \NAT@mbox{\NAT@@close}%
  \@ifnum{\NAT@ctype=\z@}{%
    \if*#2*\else\textsuperscript{#2}\fi
  }{}%
}{}{}
\renewcommand\NAT@citesuper[3]{\ifNAT@swa
  \if*#2*\else#2\NAT@spacechar\fi
\unskip\kern\p@\textsuperscript{\NAT@@open#1\NAT@@close\if*#3*\else#3\fi}%
   \else #1\fi\endgroup}
\patchcmd{\NAT@citex}{%
  \if*#2*\else\NAT@cmt#2\fi
  \if\relax\NAT@date\relax\else\NAT@@close\fi
}{%
  \if\relax\NAT@date\relax\else\NAT@@close\fi
  \if*#2*\else\textsuperscript{#2}\fi
}{}{}
\renewcommand\NAT@cite%
    [3]{\ifNAT@swa\NAT@@open\if*#2*\else#2\NAT@spacechar\fi
        #1\NAT@@close\if*#3*\else\textsuperscript{#3}\fi\else#1\fi\endgroup}
\patchcmd{\NAT@citexnum}{%
  \ifx\NAT@last@yr\relax
    \def@NAT@last@yr{\@citea}%
  \else
    \def@NAT@last@yr{--\NAT@penalty}%
  \fi
}{%
  \def@NAT@last@yr{-\NAT@penalty}%
}{}{}
\thu@define@key{
  toc-depth = {
    name = toc@depth,
  },
}
\thu@option@hook{toc-depth}{%
  \protected@write\@auxout{}{%
    \string\ttl@writefile{toc}{%
      \protect\setcounter{tocdepth}{\thu@toc@depth}%
    }%
  }%
  \addtocontents{lof}{\string\let\string\contentsline\string\ttl@gobblecontents}
  \addtocontents{lot}{\string\let\string\contentsline\string\ttl@gobblecontents}
  \addtocontents{loe}{\string\let\string\contentsline\string\ttl@gobblecontents}
}
\g@addto@macro\appendix{%
  \thusetup{
    toc-depth = 0,
  }%
}
\newenvironment{survey}{%
  \chapter{外文资料的调研阅读报告}%
  \thusetup{language = english}%
  \let\title\thu@appendix@title
  \let\maketitle\thu@appendix@maketitle
  \thu@set@partial@toc@format
  \renewcommand\tableofcontents{%
    \section*{Contents}%
    \thu@pdfbookmark{1}{Contents}%
    \printcontents[survey]{l}{1}[2]{}%
  }%
  \renewcommand\bibname{参考文献}%
  \let\bibsection\thu@appendix@bibsection
  \renewcommand\@bibunitname{main-survey}%
  \let\bibliographystyle\defaultbibliographystyle
  \let\bibliography\thu@appendix@bibliography
  \begin{bibunit}%
  \startcontents[survey]%
}{%
  \stopcontents[survey]%
  \end{bibunit}%
  \thu@reset@main@language % restore language
}
\newenvironment{translation}{%
  \chapter{外文资料的书面翻译}%
  \thusetup{language = chinese}%
  \let\title\thu@appendix@title
  \let\maketitle\thu@appendix@maketitle
  \thu@set@partial@toc@format
  \renewcommand\tableofcontents{%
    \section*{目录}%
    \thu@pdfbookmark{1}{目录}%
    \printcontents[translation]{l}{1}[2]{}%
  }%
  \def\bibsection{%
    \begingroup
      \ctexset{section/numbering=false}%
      \section{\bibname}%
    \endgroup
  }%
  \renewcommand\@bibunitname{main-translation}%
  \let\bibliographystyle\defaultbibliographystyle
  \let\bibliography\thu@appendix@bibliography
  \begin{bibunit}%
  \startcontents[translation]%
}{%
  \stopcontents[translation]%
  \end{bibunit}%
  \thu@reset@main@language % restore language
}
\newenvironment{translation-index}{%
  \begin{bibunit}%
    \renewcommand\@bibunitname{main-index}%
    \renewcommand\bibname{书面翻译对应的原文索引}%
    \let\bibsection\thu@appendix@bibsection
}{%
  \end{bibunit}%
}
\DeclareRobustCommand\thu@appendix@title[1]{\gdef\thu@appendix@@title{#1}}
\newcommand\thu@appendix@maketitle{%
  \par
  \begin{center}%
    \xiaosi[1.667]\thu@appendix@@title
  \end{center}%
  \par
}
\newcommand\thu@set@partial@toc@format{%
  \titlecontents{section}
    [\z@]{}
    {\contentspush{\thecontentslabel\hspace{\ccwd}}}{}
    {\thu@leaders\thecontentspage}%
  \titlecontents{subsection}
    [1\ccwd]{}
    {\contentspush{\thecontentslabel\hspace{\ccwd}}}{}
    {\thu@leaders\thecontentspage}%
  \titlecontents{subsubsection}
    [2\ccwd]{}
    {\contentspush{\thecontentslabel\hspace{\ccwd}}}{}
    {\thu@leaders\thecontentspage}%
}
\newcommand\thu@appendix@bibsection{%
  \par
  \vskip 20bp%
  \thu@pdfbookmark{1}{\bibname}%
  \begingroup
    \centering
    \xiaosi[1.667]\bibname\par
  \endgroup
  \vskip 6bp%
}%
\newcommand\thu@appendix@bibliography[1]{\putbib[#1]}
\newenvironment{resume}[1][\thu@resume@name]{%
  \thu@chapter*{#1}}{}
\newcommand{\resumeitem}[1]{%
  \vspace{24bp}{\sihao\heiti\centerline{#1}}\par\vspace{6bp}}
\newcommand{\researchitem}[1]{%
  \vspace{32bp}{\sihao\heiti\centerline{#1}}\par\vspace{14bp}}
\newlist{publications}{enumerate}{1}
\setlist[publications]{label=[\arabic*],align=left,nosep,itemsep=8bp,
  leftmargin=10mm,labelsep=!,before=\xiaosi[1.26],resume}
\newlist{achievements}{enumerate}{1}
\setlist[achievements]{label=[\arabic*],align=left,nosep,itemsep=8bp,
  leftmargin=10mm,labelsep=!,before=\xiaosi[1.26]}
\def\publicationskip{\bigskip\bigskip}
\newcommand{\record}[1]{%
  \clearpage
  \thu@pdfbookmark{0}{综合论文训练记录表}%
  \includepdf[pages=-]{#1}%
}
\AtEndOfPackageFile*{hyperref}{
  \hypersetup{
    linktoc            = all,
    bookmarksdepth     = 2,
    bookmarksnumbered  = true,
    bookmarksopen      = true,
    bookmarksopenlevel = 1,
    bookmarksdepth     = 3,
    unicode            = true,
    psdextra           = true,
    breaklinks         = true,
    plainpages         = false,
    pdfdisplaydoctitle = true,
    hidelinks,
  }%
  \newcounter{thu@bookmark}
  \renewcommand\thu@pdfbookmark[2]{%
    \phantomsection
    \stepcounter{thu@bookmark}%
    \pdfbookmark[#1]{#2}{thuchapter.\thethu@bookmark}%
  }
  \renewcommand\thu@phantomsection{%
    \phantomsection
  }
  \pdfstringdefDisableCommands{
    \let\\\@empty
    \let\hspace\@gobble
  }%
  \@ifpackagelater{hyperref}{2019/04/27}{}{%
    \g@addto@macro\psdmapshortnames{\let\mu\textmu}
  }%
  \ifthu@language@chinese
    \hypersetup{
      pdflang = zh-CN,
    }%
  \else
    \hypersetup{
      pdflang = en-US,
    }%
  \fi
  \AtBeginDocument{%
    \ifthu@language@chinese
      \hypersetup{
        pdftitle    = \thu@title,
        pdfauthor   = \thu@author,
        pdfsubject  = \thu@degree@name,
        pdfkeywords = \thu@keywords,
      }%
    \else
      \hypersetup{
        pdftitle    = \thu@title@en,
        pdfauthor   = \thu@author@en,
        pdfsubject  = \thu@degree@name@en,
        pdfkeywords = \thu@keywords@en,
      }%
    \fi
    \hypersetup{
      pdfcreator={\thuthesis-v\version}}
  }%
}
\AtEndOfPackageFile*{nomencl}{
  \let\nomname\thu@denotation@name
  \def\thenomenclature{\begin{denotation}[\nom@tempdim]}
  \def\endthenomenclature{\end{denotation}}
}
\AtBeginDocument{%
  \let\thu@LT@array\LT@array
  \def\LT@array{\dawu[1.5]\thu@LT@array} % set default font size
}
\AtEndOfPackageFile*{siunitx}{%
  \sisetup{
    group-minimum-digits = 4,
    separate-uncertainty = true,
    inter-unit-product   = \ensuremath{{}\cdot{}},
  }
  \newcommand\thu@set@siunitx@language{%
    \ifthu@language@chinese
      \sisetup{
        list-final-separator = { 和 },
        list-pair-separator  = { 和 },
        range-phrase         = {～},
      }%
    \else
      \ifthu@language@english
        \sisetup{
          list-final-separator = { and },
          list-pair-separator  = { and },
          range-phrase         = { to },
        }%
      \fi
    \fi
  }
  \thu@set@siunitx@language
  \thu@option@hook{language}{\thu@set@siunitx@language}
}
\AtEndOfPackageFile*{amsthm}{%
  \newtheoremstyle{thu}
    {\z@}{\z@}
    {\normalfont}{\z@}
    {\normalfont\sffamily}{\thu@theorem@separator}
    {0.5em}{}
  \theoremstyle{thu}
  \newtheorem{assumption}{\thu@assumption@name}[chapter]%
  \newtheorem{definition}{\thu@definition@name}[chapter]%
  \newtheorem{proposition}{\thu@proposition@name}[chapter]%
  \newtheorem{lemma}{\thu@lemma@name}[chapter]%
  \newtheorem{theorem}{\thu@theorem@name}[chapter]%
  \newtheorem{axiom}{\thu@axiom@name}[chapter]%
  \newtheorem{corollary}{\thu@corollary@name}[chapter]%
  \newtheorem{exercise}{\thu@exercise@name}[chapter]%
  \newtheorem{example}{\thu@example@name}[chapter]%
  \newtheorem{remark}{\thu@remark@name}[chapter]%
  \newtheorem{problem}{\thu@problem@name}[chapter]%
  \newtheorem{conjecture}{\thu@conjecture@name}[chapter]%
  \renewenvironment{proof}[1][\thu@proof@name]{\par
    \pushQED{\qed}%
    % \normalfont \topsep6\p@\@plus6\p@\relax
    \normalfont \topsep\z@\relax
    \trivlist
    \item[\hskip\labelsep
      %     \itshape
      % #1\@addpunct{.}]\ignorespaces
      \sffamily
      #1\@addpunct{\thu@theorem@separator}]\ignorespaces
  }{%
    \popQED\endtrivlist\@endpefalse
  }
  \renewcommand\qedsymbol{\ensuremath{\QED}}
}
\AtEndOfPackageFile*{ntheorem}{%
  \theorembodyfont{\normalfont}%
  \theoremheaderfont{\normalfont\sffamily}%
  \theoremsymbol{\ensuremath{\QED}}%
  \newtheorem*{proof}{\thu@proof@name}%
  \theoremstyle{plain}%
  \theoremsymbol{}%
  \theoremseparator{\thu@theorem@separator}%
  \newtheorem{assumption}{\thu@assumption@name}[chapter]%
  \newtheorem{definition}{\thu@definition@name}[chapter]%
  \newtheorem{proposition}{\thu@proposition@name}[chapter]%
  \newtheorem{lemma}{\thu@lemma@name}[chapter]%
  \newtheorem{theorem}{\thu@theorem@name}[chapter]%
  \newtheorem{axiom}{\thu@axiom@name}[chapter]%
  \newtheorem{corollary}{\thu@corollary@name}[chapter]%
  \newtheorem{exercise}{\thu@exercise@name}[chapter]%
  \newtheorem{example}{\thu@example@name}[chapter]%
  \newtheorem{remark}{\thu@remark@name}[chapter]%
  \newtheorem{problem}{\thu@problem@name}[chapter]%
  \newtheorem{conjecture}{\thu@conjecture@name}[chapter]%
}
\PassOptionsToPackage{chapter}{algorithm}
\AtEndOfPackageFile*{algorithm}{
  \floatname{algorithm}{\thu@algorithm@name}
  \g@addto@macro\appendix{\renewcommand*{\thealgorithm}{\thechapter-\arabic{algorithm}}}
  \renewcommand\listofalgorithms{%
    \thu@set@list@label@width{\fname@algorithm}%
    \thu@listof{algorithm}%
  }
  \renewcommand\listalgorithmname{\thu@list@algorithm@name}
  \def\ext@algorithm{loa}
  \contentsuse{algorithm}{loa}
  \titlecontents{algorithm}
    [\thu@list@label@width]{\addvspace{6bp}}
    {\contentslabel[\fname@algorithm~\thecontentslabel]{\thu@list@label@width}}{}
    {\thu@leaders\thecontentspage}
}
\PassOptionsToPackage{algochapter}{algorithm2e}
\AtEndOfPackageFile*{algorithm2e}{
  \renewcommand\algorithmcfname{\thu@algorithm@name}
  \SetAlgoCaptionLayout{dawu}
  \SetAlCapSty{relax}
  \SetAlgoCaptionSeparator{\hspace*{1em}}
  \SetAlFnt{\dawu}
  \renewcommand\listofalgorithms{%
    \thu@set@list@label@width{\algorithmcfname}%
    \thu@listof{algorithmcf}%
  }
  \renewcommand\listalgorithmcfname{\thu@list@algorithm@name}
  \def\ext@algorithmcf{loa}
  \contentsuse{algocf}{loa}
  \titlecontents{algocf}
    [\thu@list@label@width]{\addvspace{6bp}}
    {\contentslabel[\algorithmcfname~\thecontentslabel]{\thu@list@label@width}}{}
    {\thu@leaders\thecontentspage}
}
\AtEndOfPackageFile*{minted}{
  \g@addto@macro\appendix{\renewcommand*{\thelisting}{\thechapter-\arabic{listing}}}%
  \newcommand\thu@set@listing@language{%
    \ifthu@language@chinese
      \floatname{listing}{代码}%
    \else
      \floatname{listing}{Listing}%
    \fi
  }
  \thu@set@listing@language
  \thu@option@hook{language}{\thu@set@listing@language}
}
\thu@define@key{
  spine-font = {
    name = spine@font,
    default = {\sanhao},
  },
  spine-title = {
    name = spine@title,
  },
  spine-author = {
    name = spine@author,
  },
}
\newcommand*\CJKmovesymbol[1]{\raise.3em\hbox{#1}}
\newcommand*\CJKmove{%
  \punctstyle{plain}%
  \let\CJKsymbol\CJKmovesymbol
  \let\CJKpunctsymbol\CJKsymbol
}
\NewDocumentCommand{\spine}{
    O{
      \ifx\thu@spine@title\@empty
        \thu@title
      \else
        \thu@spine@title
      \fi
    }
    O{
      \ifx\thu@spine@author\@empty
        \thu@author
      \else
        \thu@spine@author
      \fi
    }}{%
  \clearpage
  \ifthu@degree@bachelor
    \newgeometry{
      vmargin = 3cm,
      hmargin = 1cm,
    }%
  \else
    \newgeometry{
      vmargin = 5.5cm,
      hmargin = 1cm,
    }%
  \fi
  \thispagestyle{empty}%
  \ifthu@language@chinese
    \thu@pdfbookmark{0}{书脊}%
  \else
    \thu@pdfbookmark{0}{Spine}%
  \fi
  \begingroup
    \noindent\hfill
    \rotatebox[origin=lt]{-90}{%
      \makebox[\textheight]{%
        \fangsong
        \addCJKfontfeatures*{RawFeature={vertical}}%
        \thu@spine@font
        \CJKmove
        #1\hfill
        \thu@stretch{4.5em}{#2}%
      }%
    }%
  \endgroup
  \clearpage
  \restoregeometry
}
\newcommand\thu@input@spine{%
  \IfFileExists{spine.pdf}{}{%
    \immediate\write18{xelatex spine.tex}%
    \IfFileExists{spine.pdf}{}{%
      \thu@error{Cannot find file "spine.pdf". Compile "spine.tex" first, or enable shell escape}%
    }%
  }%
  \includepdf[pages=1]{spine.pdf}%
}
\newcommand\thu@spine{%
  \ifthu@cjk@font@fandol
    \thu@input@spine
  \else
    \ifthu@cjk@font@noto
      \thu@input@spine
    \else
      \spine
    \fi
  \fi
}
\AtEndOfClass{\sloppy}
\endinput
%%
%% End of file `thuthesis.cls'.
