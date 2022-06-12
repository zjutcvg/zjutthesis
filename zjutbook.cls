\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{zjutbook}[2022/03/01 ZJUT Book]

\ProcessOptions\relax
\LoadClass[12pt,oneside]{ctexbook}


%%%%%%%% A4 纸张 %%%%%%%%
%% ISO-3116 A4 = 210 * 297 (mm)
\RequirePackage[a4paper,
  right=31mm,
  left=31mm,
  top=37mm,
  bottom=37mm,
]{geometry}

\RequirePackage{zjutbase}

%%%%%%%% 标题 %%%%%%%%
% \setcounter{secnumdepth}{3} % 自动编号最大深度 到subsubsection
% \setcounter{tocdepth}{2} % 目录显示深度到 subsection
\ctexset{
  % 1级标题，小二，黑体，居中，加粗，段前段后18磅，1.5倍行距
  chapter = {
    % break = \Needspace{0.5\textheight},
    format = \zihao{-2}\heiti\bfseries\centering\linespread{1.5},
    beforeskip = {18pt},
    afterskip = {18pt},
    fixskip = true
  },
  % 2级标题，小三，宋体，加粗，段前12磅，段后6磅，1.5倍行距
  section = {
    format = \zihao{-3}\songti\bfseries\linespread{1.5},
    beforeskip = {12pt},
    afterskip = {6pt},
    fixskip = true
  },
  % 3级标题，四号，宋体，加粗，段前６磅，1.5倍行距
  subsection = {
    format = \zihao{4}\songti\bfseries\linespread{1.5},
    beforeskip = {6pt},
    afterskip = {0pt},
    fixskip = true
  }
}


%%%%%%%% 中文摘要关键词 %%%%%%%%
\newenvironment{abstractcn}{%
  \singlespacing
  \ctexset{ chapter = { beforeskip = {24pt}, numbering = false, fixskip = false } }
  \chapter{摘要}
  \doublespacing
}{\clearpage}

\newcommand\keywordscn[1]{\vspace{1em}\noindent%
  {\songti\zihao{-4}\bfseries{关键词：}}\songti\zihao{-4}{#1}%
}

%%%%%%%% Abstract Keywords %%%%%%%%
\newenvironment{abstracten}{%
  \singlespacing
  \ctexset{ chapter = { beforeskip = {24pt}, numbering = false, fixskip = false } }
  \chapter{Abstract}
  \doublespacing
}{\clearpage}

\newcommand\keywordsen[1]{\vspace{1em}\noindent%
  {\zihao{-4}\bfseries{Keywords: }}\songti\zihao{-4}{#1}%
}