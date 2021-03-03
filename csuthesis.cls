%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Lewis Xu
% Email: <xuwei3893@csu.edu.cn>
% Date: 21 Nov 2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\def\csuthesis{CSUThesis}
\def\version{1.0.0}

\NeedsTeXFormat{LaTeX2e}[2017/04/15]
\ProvidesClass{csuthesis}[2020/11/21 1.0.0 Central South University Thesis Template]

\newcommand\csu@error[1]{%
    \ClassError{csuthesis}{#1}{}%
}

\newcommand\csu@warning[1]{%
    \ClassWarning{csuthesis}{#1}%
}

\@ifl@t@r\fmtversion{2020/01/01}{}{
    \csu@error{%
        TeX Live 2020 or later version is required!%
    }
}

\RequirePackage{iftex}
\ifXeTeX\else
\csu@error{XeLaTeX is required to compile with "csuthesis.cls"}
\fi

\LoadClass[a4paper,zihao=-4,twoside]{ctexrep}

\ctexset{
    chapter={
        number=\arabic{chapter},
    },
    contentsname={目 \quad 录}
}

\renewcommand{\appendixname}{Appendix~\Alph{chapter}}
\renewcommand\appendixname{附录}

\RequirePackage{setspace}
%\linespread{1.5}
\renewcommand{\baselinestretch}{1.5}
%\setlength{\baselineskip}{1.6em} % 行间距
\def\floatpagefraction{.9}
\def\topfraction{.9}
\def\bottomfraction{.9}
\def\textfraction{.05}
\setcounter{totalnumber}{50}
\setcounter{topnumber}{50}
\setcounter{bottomnumber}{50}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% margin
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[top=3cm, bottom=3cm, left=3cm, right=3cm]{geometry}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Redefine the color of hyperlink
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{xcolor}
\definecolor{bg}{rgb}{0.95,0.95,0.95}
\definecolor{myblue}{RGB}{33,77,160}
\definecolor{myred}{RGB}{228,0,127}
\definecolor{mypurple}{RGB}{25,63,128}

\RequirePackage[pdfstartview=FitH,
bookmarks=true,
bookmarksnumbered=true,
bookmarksopen=true,
colorlinks, %注释掉此项则交叉引用为彩色边框(将colorlinks和pdfborder同时注释掉)
pdfborder=001,   %注释掉此项则交叉引用为彩色边框
linkcolor=black,
anchorcolor=myblue,
citecolor=myblue,
]{hyperref}

\hypersetup{pdfcreator={\csuthesis-v\version\ by 徐巍 <xuwei3893@csu.edu.cn>}}

%\RequirePackage[perpage]{footmisc}
%\RequirePackage{xeCJKfntef}
\RequirePackage{xpatch}
\makeatletter
\renewcommand\thefootnote{\footnotesize\textcircled{\tiny\@arabic\c@footnote}}
\def\@makefnmark@nosuperscript{\hbox{\normalfont\@thefnmark}}
\xpatchcmd\@makefntext
{{\hss\@makefnmark}}
{{\hss\@makefnmark@nosuperscript}\space}
{}{\fail}
\makeatother

\RequirePackage{scrextend}
\deffootnote[1.5em]{1.5em}{1em}{\thefootnotemark\space}
% Reset the footnote numbering by page/section/chapter/etc.
\makeatletter
\@addtoreset{footnote}{page}
\makeatother


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Redefine the caption of equation/table/figure
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{amsmath,amssymb,amsfonts}
\RequirePackage{float}
\RequirePackage{graphicx}
\usepackage{subfigure}
\RequirePackage{caption}
\RequirePackage{array}		%支持定宽度
\RequirePackage{booktabs}	%三线表
\RequirePackage{threeparttablex}
\RequirePackage{multirow}	%跨多行
\RequirePackage{multicol}   %跨多栏
\RequirePackage{colortbl}	%彩色表格
\RequirePackage{longtable}
\RequirePackage{paralist}
\RequirePackage{awesomebox}
\RequirePackage{tcolorbox}
\RequirePackage{lscape}
\RequirePackage[figuresright]{rotating}
\RequirePackage[vlined,ruled,linesnumbered]{algorithm2e}
\renewcommand{\algorithmcfname}{算法}
\SetKwInOut{KwIn}{Input}
\SetKwInOut{KwOut}{Output}

\RequirePackage{minted}
\renewcommand\listoflistingscaption{代码清单}
\renewcommand{\listingscaption}{源码}
\usemintedstyle{xcode}

\graphicspath{{./figure/}{./figures/}{./image/}{./images/}{./graphics/}{./graphic/}{./pictures/}{./picture/}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Redefine the caption
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{caption}
\captionsetup{labelsep=quad}
\renewcommand{\captionfont}{\zihao{5}\kaishu}
\renewcommand{\thefigure}{\thechapter--\arabic{figure}}
\renewcommand{\thetable}{\thechapter--\arabic{table}}
\renewcommand{\theequation}{\thechapter--\arabic{equation}}
\renewcommand{\thelisting}{\thechapter--\arabic{listing}}

\newcommand{\tblref}[1]{\hypersetup{linkcolor=myblue}表~{\rm\ref{#1}}}
\newcommand{\figref}[1]{图~{\rm\ref{#1}}}
\newcommand{\algref}[1]{\hypersetup{linkcolor=myblue}算法~{\rm\ref{#1}}}
\renewcommand{\eqref}[1]{\hypersetup{linkcolor=myblue}公式~{\rm(\ref{#1})}}
\newcommand{\eqsref}[2]{\hypersetup{linkcolor=myblue}公式~{\rm(\ref{#1})}—公式{\rm(\ref{#2})}}
\newcommand{\conref}[1]{\hypersetup{linkcolor=myblue}约束~{\rm(\ref{#1})}}
\newcommand{\consref}[2]{\hypersetup{linkcolor=myblue}约束~{\rm(\ref{#1})}—约束{\rm(\ref{#2})}}
\newcommand{\srcref}[1]{\hypersetup{linkcolor=myblue}源码~{\rm\ref{#1}}}

\setlength{\abovecaptionskip}{0.2em}
\setlength{\belowcaptionskip}{0.2em}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% define the font-style
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{fontspec}
\RequirePackage[T1]{fontenc}
%\usepackage{mathpazo,tgpagella}
\usepackage{mathptmx} %for TImes new roman

\RequirePackage{xeCJK}
\newCJKfontfamily{\weiti}{STXinwei.ttf}[Path=./fonts/]


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Redefine the style of pages' header
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{lastpage}
\RequirePackage{emptypage}
\RequirePackage{fancyhdr}
\RequirePackage{ifthen}
\RequirePackage{etoolbox}

\pagestyle{fancy}
\fancyhf{}
\fancyhead[RO]{\zihao{-5}\leftmark}
\fancyhead[LO]{\zihao{-5} \CollegeName\ThesisType}
\fancyhead[RE]{\zihao{-5} \CollegeName\ThesisType}
\fancyhead[LE]{\zihao{-5}\rightmark}
\fancyfoot[C]{\zihao{-5}\thepage}
\renewcommand{\headrulewidth}{0.5pt}
%\renewcommand{\footrulewidth}{0.5pt}

\makeatletter
\newbool{isfront}
%\setbool{isfront}{true}
\newcommand{\frontpart}{
    \setbool{isfront}{true}%
    \pagestyle{plain}
    \pagenumbering{Roman}}

\newcommand{\mainpart}{
    \setbool{isfront}{false}%
    \pagenumbering{arabic}}

\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
    \ifbool{isfront}{\pagestyle{plain}}{\pagestyle{fancy}}%
    \global\@topnum\z@
    \@afterindentfalse
    \secdef\@chapter\@schapter}
\makeatother

\makeatletter
\let\stdchapter\chapter
\renewcommand*\chapter{%
    \@ifstar{\starchapter}{\@dblarg\nostarchapter}}
\newcommand*\starchapter[1]{\titlespacing{\chapter}{0cm}{1em}{18pt}\stdchapter*{#1}
}
\def\nostarchapter[#1]#2{\titlespacing{\chapter}{0cm}{-1em}{18pt}\stdchapter[{#1}]{#2}}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Redefine the style of title of chapter/section/subsection
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{titlesec}
\titleformat{\chapter}{\centerlast\zihao{3}\heiti}{第\,\thechapter\,章}{0.5em}{}[]
\titleformat{\section}{\flushleft\zihao{4}\heiti}{\thesection}{0.5em}{}[]
\titleformat{\subsection}{\flushleft\zihao{-4}\heiti}{\thesubsection}{0.5em}{}[]
\titleformat{\subsubsection}{\flushleft\zihao{-4}\heiti}{\thesubsubsection}{0.5em}{}
%\titlespacing{\chapter}{0cm}{-1em}{18pt}	%标题的边距
%\titlespacing*{\chapter}{0cm}{-1cm}{18pt} %标题的边距

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Redefine the style of the tableofcontents
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{titletoc}
\titlecontents{chapter}[0cm]{\vspace{0.2em}\filright\heiti\zihao{-4}}
{\contentspush{\thecontentslabel \hspace{0.5em}}}
{}{\titlerule*[8pt]{$\cdot$}\contentspage}

\titlecontents{section}[0cm]{\vspace{0mm}\filright\zihao{-4}}
{\contentspush{\hspace{2em}\thecontentslabel\hspace{0.5em}}}
{}{\titlerule*[8pt]{$\cdot$}\contentspage}

\titlecontents{subsection}[0cm]{\vspace{0mm}\addvspace{0pt}\filright\zihao{-4}}
{\contentspush{\hspace{4em}\thecontentslabel\hspace{0.5em}}}
{}{\titlerule*[8pt]{$\cdot$}\contentspage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Redefine the style of bibliography
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[sort&compress]{gbt7714}
\bibliographystyle{gbt7714-numerical}
\RequirePackage{bibentry}
\RequirePackage{doi}
\renewcommand{\doitext}{}
\def\citeauthoryear#1{%
    \citeauthor{#1} (\citeyear{#1})\cite{#1}
}

\setlength{\bibsep}{0.em}
\nobibliography*
\RequirePackage[figure,table]{totalcount}
\RequirePackage{totcount}
\newtotcounter{citenum}
\def\oldcite{}
\let\oldcite=\bibcite
\def\bibcite{\stepcounter{citenum}\oldcite}
\providecommand\totalcitations{\total{citenum}}

\RequirePackage[title]{appendix}
\RequirePackage{makeidx}
\makeatletter
\newcommand{\appendixs}{
    \appendix
    \titlespacing{\chapter}{0cm}{1em}{18pt}
    \titleformat{\chapter}{\centering\zihao{3}\heiti}{附录\ \thechapter}{0.5em}{}[]
}
\makeatother


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% define the \csusetup{}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\gdef\DebateDate{\zhdigits{\the\year} 年 \zhnumber{\the\month} 月} %define default format of date

\RequirePackage{options}
\options{%
    /csu/.new family,%
    /csu/udc/.new cmd = {\gdef\Udc{#1}},%
    /csu/classification/.new cmd = {\gdef\Classification{#1}},%
    /csu/secret/.new cmd = {\gdef\Secret{#1}},%
    /csu/titlezh/.new cmd = {\gdef\TitleZh{#1}},%
    /csu/titleen/.new cmd = {\gdef\TitleEn{#1}},%
    /csu/thesistype/.new cmd = {\gdef\ThesisType{#1}},%
    /csu/degreetype/.new cmd = {\gdef\DegreeType{#1}},%
    /csu/author/.new cmd = {\gdef\Author{#1}},%
    /csu/major/.new cmd = {\gdef\Major{#1}},%
    /csu/direction/.new cmd = {\gdef\Direction{#1}},%
    /csu/supervisor/.new cmd = {\gdef\Supervisor{#1}},%
    /csu/collegename/.new cmd = {\gdef\CollegeName{#1}},%
    /csu/collegeid/.new cmd = {\gdef\CollegeId{#1}},%
    /csu/schoolname/.new cmd = {\gdef\SchoolName{#1}},%
    /csu/debatedate/.new cmd = {\gdef\DebateDate{#1}},%
    /csu/printstyle/.new cmd = {\gdef\PrintStyle{#1}},%
}

\newcommand{\csusetup}[1]{%
    {%
        \options{/csu, #1}%parse the key-val setup
    }
}

\def\printstyle{print}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% redefine the \maketitle{}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{pdfpages}
\def\maketitle{
    \def\csu@print@maketitle{
        \begin{titlepage}
            \begin{center}
                \ 
                \vspace{3cm}
                
                \parbox{\textwidth}{\centering\heiti{\zihao{-2}\ThesisType}}\\[1cm]
                \parbox{\textwidth}{\centering\heiti{\zihao{2}\TitleZh}}\\[1cm]
                \parbox{\textwidth}{\centering{\zihao{-2}\TitleEn}}\\[3cm]
                
                \begin{tabular}{m{4cm}<{\raggedright} m{3cm}<{\centering} m{3cm}<{\centering}}
                    \zihao{3}{学科专业：}&\multicolumn{2}{c}{\zihao{3}{\Major}}\\[1.5em]
                    \zihao{3}{专业领域：}&\multicolumn{2}{c}{\zihao{3}{\Direction}}\\[1.5em]
                    \zihao{3}{作者姓名：}&\multicolumn{2}{c}{\zihao{3}{\Author}}\\[1.5em]
                    \zihao{3}{指导教师：}&\multicolumn{2}{c}{\zihao{3}{\Supervisor}}\\
                    
                \end{tabular}
                
                \vspace{2cm}
                \zihao{-3}{\CollegeName\\\DebateDate}
                
            \end{center}
            
        \end{titlepage}
        \cleardoublepage
    }
    
    \pdfbookmark[-1]{\TitleZh}{}	%生成论文书签
    \ifx\PrintStyle\printstyle%
        \csu@print@maketitle
    \else
        \IfFileExists{./bookcover.pdf}{
            \includepdf[fitpaper=true]{./bookcover.pdf}
        }{
            \csu@error{"Please run previously: make bookcover.pdf"}
        }
    \fi 
    \pagestyle{empty}
}


\makeatletter
\newcommand\centerfloat{%
    \parindent \z@
    \leftskip \z@ \@plus 1fil \@minus \marginparwidth
    \rightskip \leftskip
    \parfillskip \z@skip}
\makeatother


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% define the abstract env
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\sep{；}
\newcommand{\KeywordsZh}[1]{
    \par\hangafter 1%
    \hangindent 4em%
    \noindent{\heiti{关键词：}}#1
}

\newenvironment{AbstractZh}{
    \chapter*{\TitleZh}
    \addcontentsline{toc}{chapter}{摘要}
    \noindent\zihao{4}{\heiti{摘要：}}
}{
    \par%
    \noindent{\heiti{分类号：}}\Classification
}

\newcommand{\KeywordsEn}[1]{
    \par\hangafter 1%
    \hangindent 5em%
    \noindent{\bf{Keywords：}}#1
}

\newenvironment{AbstractEn}{
    \chapter*{\bfseries\TitleEn}
    \addcontentsline{toc}{chapter}{\textbf{Abstract}}
    \noindent\zihao{4}{\bf{Abstract：}}
}{
    \par\noindent{\bf{Classification：}}\Classification
}
