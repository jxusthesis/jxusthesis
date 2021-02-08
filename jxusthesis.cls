%%
%% This is file `jxusthesis.cls'.
%%
%% Copyright (C) 2021 by Qu Yi <texeasybook@foxmail.com>
%%
%% This work may be distributed and/or modified under the
%% conditions of the CC-BY-NC 4.0 License.
%% The latest version of this license is in
%%   https://creativecommons.org/licenses/by-nc/4.0/legalcode
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jxusthesis}[
  2021/02/08 v1.0
  Bachelor thesis template for
  Jiangxi University of Science and Technology.
  ]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{easybook}}
\ProcessOptions\relax
\LoadClass[font = none,zihao = -4,oneside]{easybook}

\RequirePackage
  {
    hologo,
    changepage,
    fancybox,
    longtable,
    lipsum,
    newtxmath,
    bm
  }
\newcommand\checkpackage[3]
  {
    \@ifpackagelater{#1}{#2}{}
      {
        \ClassError{jxusthesis}
          {
            Package "#1" has been out of date.\MessageBreak
            The jxusthesis class only supports "#1" with a version
            higher than v#3\MessageBreak
            and "easybook" with a version higher than v1.23a.\MessageBreak\MessageBreak
            Please download the latest TeX distribution\MessageBreak
            and update your macro package with the image of CTAN
          }{}
      }
  }
\checkpackage{ctex}{2020/10/19}{2.5.5}
\checkpackage{tcolorbox}{2020/10/09}{4.42}

\setmainfont{Times New Roman}
\setsansfont{Arial}[AutoFakeBold = 1.5]
\setmonofont{Times New Roman}
\setCJKmainfont{SimSun}[BoldFont = SimHei,ItalicFont = KaiTi]
\setCJKsansfont{SimHei}[AutoFakeBold = 1.5]
\setCJKmonofont{FangSong}
\newCJKfontfamily[songti]\songti{SimSun}[AutoFakeBold = 1.5]
\newCJKfontfamily[heiti]\heiti{SimHei}
\let\kaishu\relax
\newCJKfontfamily[kaishu]\kaishu{KaiTi}
\newCJKfontfamily[fangsong]\fangsong{FangSong}

\newcommand\header[1]{\def\@header{#1}}	
\renewcommand\thetable{\thechapter\textendash\arabic{table}}
\renewcommand\backmatter
  {
    \ctexset
      {
        chapter/format+ = \zihao{4},
        appendix/numbering = false
      }
    \appendix
    \addtocounter{chapter}{1}
  }
\renewcommand\tableofcontents
  {
    \chapter*{\zihao{3}目\hspace{1em}录}
    \addvspace{-0.45pc}
    \@starttoc{toc}
    \clearpage
    \ctexset{chapter/pagestyle = fancy}
    \pagestyle{fancy}
  }

\ctexset
  {
    tocdepth = 2,
    style/notomath = false,
    spread/linespread = 1.356,
    elfont/tabfont = \zihao{5},
    chapter =
      {
        format = {\centering\sffamily\zihao{-3}},
        aftername = {\hspace{1em}},
        beforeskip = {-1.75ex},
        afterskip = {1.5ex},
        tocline = {\CTEXifname{\CTEXthechapter\hspace{1em}}{}#2}
      },
    section =
      {
        format = {\sffamily\zihao{4}},
        aftername = {\hspace{0.5em}},
        beforeskip = {1.5ex plus .2ex minus .2ex},
        afterskip = {1.5ex plus .2ex minus .2ex},
        tocline = {\CTEXifname{\CTEXthesection\hspace{0.5em}}{}#2}
      },
    subsection =
      {
        format = {\sffamily\zihao{4}},
        aftername = {\hspace{0.5em}},
        beforeskip = {1.3ex plus .2ex minus .2ex},
        afterskip = {1.3ex plus .2ex minus .2ex},
        tocline = {\CTEXifname{\CTEXthesubsection\hspace{0.5em}}{}#2}
      },
    subsubsection =
      {
        format = {\sffamily},
        aftername = {\hspace{0.5em}},
        beforeskip = {\parskip},
        afterskip = {\parskip}
      },
    hdrset =
      {
        \fancyhead[C]{\ifcsname @header\endcsname\zihao{5}\@header\fi}
        \fancyfoot[C]{\zihao{-5}\thepage}
      },
    tocset =
      {
        chapter =
          {
            format = \addvspace{0.45pc}\songti\bfseries\zihao{-3},
            indent = 2em,
            rule = \tocrule[0.5pc][1.3]{$\cdot$}[\bfseries]
          },
        section =
          {
            format = \addvspace{0.45pc}\zihao{4},
            indent = 3em,
            rule = \tocrule[0.5pc][1.3]{$\cdot$}
          },
        subsection =
          {
            format = \addvspace{0.45pc}\zihao{4},
            indent = 4em,
            rule = \tocrule[0.5pc][1.3]{$\cdot$}
          }
      }
  }

\ExplSyntaxOn
\newenvironment{cnabstract}[1]
  {
    \clist_set:Nn \l__keyword_clist{#1}
    \clearpage
    \pagestyle{empty}
    \chapter*{\zihao{3}摘\hspace{1em}要}
    \baselineskip = 20pt
  }{
    \vskip 12bp
    \noindent{\heiti\zihao{-4}关键词：}
    \clist_use:Nn \l__keyword_clist{；}
  }
\newenvironment{enabstract}[1]
  {
    \clist_clear:N \l__keyword_clist
    \clist_put_right:Nn \l__keyword_clist{#1}
    \clearpage
    \chapter*{\rmfamily\zihao{3}\textbf{ABSTRACT}}
    \baselineskip = 20pt
  }{
    \vskip 12bp
    \noindent{\bfseries\zihao{-4}Key words:~}
    \clist_use:Nn \l__keyword_clist{;~}
  }
\ExplSyntaxOff

\global\let\title\relax
\global\let\author\relax
\global\let\date\relax
\newcommand\title[1]{\def\@title{#1}}
\newcommand\subtitle[1]{\def\@subtitle{#1}}
\newcommand\college[1]{\def\@college{#1}}
\newcommand\major[1]{\def\@major{#1}}
\newcommand\class[1]{\def\@class{#1}}
\newcommand\stunum[1]{\def\@stunum{#1}}
\newcommand\author[1]{\def\@author{#1}}
\newcommand\teacheri[2]{\def\@teacheri{#1}\def\@posi{#2}}
\newcommand\teacherii[2]{\def\@teacherii{#1}\def\@posii{#2}}
\newcommand\date[1]{\def\@date{#1}}

\setlength\ULdepth{4.5pt}
\newcommand\infolinei{\specialrule{0pt}{-2.5pt}{0pt}\Xcline{2-2}{0.75pt}}
\newcommand\infolineii[2][7.5em]{\uline{\hb@xt@#1{\hss#2\hss}}\hskip 3\p@}
\newcommand\teacherinfo
  {
    \parbox{\linewidth}
      {
        指导教师：\infolineii{\ifcsname @teacheri\endcsname\@teacheri\fi}
        职称：\infolineii{\ifcsname @posi\endcsname\@posi\fi} \\[.8ex]
        指导教师：\infolineii{\ifcsname @teacherii\endcsname\@teacherii\fi}
        职称：\infolineii{\ifcsname @posii\endcsname\@posii\fi}
      }
  }
\renewcommand\frontmatter
  {
    \@mainmatterfalse
    \thispagestyle{empty}
    \thisfancypage
      {
        \hskip -9.7pt
        \setlength{\fboxsep}{0pt}
        \setlength{\fboxrule}{0.75pt}
        \fbox
      }{}

    \vspace*{8mm}
    \begin{center}
      {\songti\bfseries\zihao{3}\ziju{0.4}江西理工大学} \\[10mm]
      {\songti\bfseries\zihao{2}\ziju{0.4}本科毕业设计（论文）\par}
    \end{center}

    \vskip 1.7cm
    \begin{adjustwidth}{3em}{}
      \songti\bfseries\zihao{4}
      \setlength{\extrarowheight}{1.25pc}
      \begin{tabularx}{.67\textwidth}{Lp{6.7cm}<{\centering}}
        题\hspace{2em}目：& \@title \\[4.5ex]
        专题题目：&\ifcsname @subtitle\endcsname\@subtitle\fi \\[4ex]
        学\hspace{2em}部：& \ifcsname @college\endcsname\@college\fi \\
        \infolinei
        专\hspace{2em}业：& \ifcsname @major\endcsname\@major\fi \\
        \infolinei
        班\hspace{2em}级：& \ifcsname @class\endcsname\@class\fi \\
        \infolinei
        学\hspace{2em}号：& \ifcsname @stunum\endcsname\@stunum\fi \\
        \infolinei
        学\hspace{2em}生：& \@author \\
        \infolinei
        \end{tabularx}
    \end{adjustwidth}
    
    \vskip 2.6cm
    \begin{adjustwidth}{3.5em}{}
      \songti\bfseries\zihao{4}
      \teacherinfo
    \end{adjustwidth}

    \vskip 2.4cm
    \begin{center}
      \songti\bfseries\zihao{4}
        时间:\hskip 1em\ifcsname @date\endcsname\@date\fi
    \end{center}
  }
%%
%% End of file `jxuthesis.cls'.