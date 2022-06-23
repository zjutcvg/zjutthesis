\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{zjutthesis}[2022/06/22 ZJUT Book]

\ProcessOptions\relax
\LoadClass[12pt,twoside,openany,fontset=windows]{ctexbook}


%%%%%%%% A4纸页边距 %%%%%%%%
%% ISO-3116 A4 = 210 * 297 (mm)
\RequirePackage[a4paper,
  right=30mm,
  left=30mm,
  top=30mm,
  bottom=30mm,
]{geometry}


%%%%%%%% 版式 %%%%%%%%
% \RequirePackage{ragged2e}
% \RequirePackage{showframe}          % 测试框架
\RequirePackage{ulem}               % 下划线pt
\RequirePackage{lipsum, zhlipsum}   % 乱数假文
% \RequirePackage{color}            % 支持彩色
\RequirePackage{xcolor}             % 代码高亮、文本颜色

%% 断行容忍度、行末分词
% \tolerance=10000
% \hyphenpenalty=100
% \emergencystretch=\maxdimen
% \hbadness=10000


%%%%%%%% 默认字体 %%%%%%%%
\setmainfont[Mapping=tex-text]{Times New Roman}
\setsansfont{Arial}


%%%%%%%% 正文行距 %%%%%%%%
\RequirePackage{setspace}
\linespread{1.25}       % 1.25 倍行距


%%%%%%%% 页眉页脚 %%%%%%%%
\RequirePackage{fancyhdr}                       % 页眉和页脚
\pagestyle{fancy}
\fancyhf{}
\fancyhead[CO]{\zihao{5}\songti{\fillTitleCn}}
\fancyhead[CE]{\zihao{5}\songti{\fillType}}
\fancyfoot[CO,CE]{\zihao{-5}\thepage}
\renewcommand{\headrulewidth}{0.75pt}
% \renewcommand{\headheight}{13pt}
\setlength{\headwidth}{\textwidth}


%%%%%%%% 标题 %%%%%%%%
\RequirePackage{titlesec}           % 控制标题的宏包
% \setcounter{secnumdepth}{3}       % 自动编号最大深度到 subsubsection
% \setcounter{tocdepth}{2}          % 目录显示深度到 subsection
\ctexset{
  % 1级标题，中文黑体，英文 Arial，居中，1.25 倍行距，段前段后各 0 磅，上面空 1 行，下面空 2 行
  % 原模板：上空一行小四1.5倍，下空第一行五号1.25倍，下空第二行小四1.25倍
  chapter = {
    % break = \Needspace{0.5\textheight},
    format = \zihao{3}\heiti\centering\linespread{1.25},
    beforeskip = {24pt},
    afterskip = {64pt},
    fixskip = true,
    pagestyle = fancy
  },
  % 2级标题，四号，中文黑体，英文 Times New Roman，两端对齐，1.25 倍行距，段前 24 磅段后 12 磅
  section = {
    format = \zihao{4}\heiti\linespread{1.25},
    beforeskip = {24pt},
    afterskip = {12pt},
    fixskip = true
  },
  % 3级标题，小四，中文黑体，英文 Times New Roman，两端对齐，1.25 倍行距，段前段后各 0 磅
  subsection = {
    format = \zihao{-4}\heiti\linespread{1.25},
    beforeskip = {0pt},
    afterskip = {0pt},
    fixskip = true
  }
}


%%%%%%%% 文档信息 %%%%%%%%
\RequirePackage{xstring}      % 正文标题中替换换行
\RequirePackage{datetime}     % 日期

\DeclareRobustCommand{\fillType}{浙江工业大学硕士学位论文}
\DeclareRobustCommand{\zjutType}[1]{\renewcommand{\fillType}{#1}}

\DeclareRobustCommand{\fillTitleCn}{论文中文题目}
\DeclareRobustCommand{\fillTitleEn}{Title of Thesis}
\DeclareRobustCommand{\zjutTitle}[2]{%
  \renewcommand{\fillTitleCn}{#1}%
  \renewcommand{\fillTitleEn}{#2}%
  \title{\StrSubstitute{#1}{\\}{}}%
}

\DeclareRobustCommand{\fillMentorNameCn}{指导教师}
\DeclareRobustCommand{\fillMentorTitleCn}{教  授}
\DeclareRobustCommand{\fillMentorNameEn}{English Name}
\DeclareRobustCommand{\fillMentorTitleEn}{Prof.}
\DeclareRobustCommand{\zjutMentor}[4]{
  \renewcommand{\fillMentorNameCn}{#1}
  \renewcommand{\fillMentorTitleCn}{#2}
  \renewcommand{\fillMentorNameEn}{#3}
  \renewcommand{\fillMentorTitleEn}{#4}
}

\DeclareRobustCommand{\fillAuthorCn}{作者姓名}
\DeclareRobustCommand{\fillAuthorEn}{作者姓名}
\DeclareRobustCommand{\zjutAuthor}[2]{%
\renewcommand{\fillAuthorCn}{#1}%
\renewcommand{\fillAuthorEn}{#2}%
}
\DeclareRobustCommand{\fillMajor}{软件工程}
\DeclareRobustCommand{\zjutMajor}[1]{\renewcommand{\fillMajor}{#1}}
\DeclareRobustCommand{\fillAcademic}{工程硕士}
\DeclareRobustCommand{\zjutAcademic}[1]{\renewcommand{\fillAcademic}{#1}}
\DeclareRobustCommand{\fillCultiviate}{全日制专业学位硕士}
\DeclareRobustCommand{\zjutCultiviate}[1]{\renewcommand{\fillCultiviate}{#1}}
\DeclareRobustCommand{\fillCollege}{计算机科学与技术学院}
\DeclareRobustCommand{\zjutCollege}[1]{\renewcommand{\fillCollege}{#1}}
\DeclareRobustCommand{\fillYear}{2022}
\DeclareRobustCommand{\fillMonth}{06}
\DeclareRobustCommand{\zjutDate}[2]{%
  \renewcommand{\fillYear}{#1}%
  \renewcommand{\fillMonth}{#2}%
}


%%%%%%%% 封面 %%%%%%%%
\RequirePackage{makebox}            % 文本框
\newcommand\zjutpreface{%
\begin{titlepage}
  \pagestyle{empty}
  {\centering
    {
      \includegraphics[width=25mm]{zjutlogo}
      \includegraphics[width=90mm]{zjutname}
    }\\
    \heiti
    {\zihao{0}硕士学位论文}\\
    \vspace*{\fill}
    \begin{tabular}{rc}
      \zihao{-2}论文题目： & \zihao{3}\fillTitleCn \\
    \end{tabular}\\
    \vspace*{\fill}
    \kaishu\bfseries
    \begin{tabular}{rc}
      \zihao{4}作者姓名 & \zihao{4}\fillAuthorCn \\
      \zihao{4}指导教师 & \zihao{4}\fillMentorNameCn\qquad\fillMentorTitleCn \\
      \zihao{4}学科专业 & \zihao{4}\fillMajor \\
      \zihao{4}学位类型 & \zihao{4}\fillAcademic \\
      \zihao{4}培养类型 & \zihao{4}\fillCultiviate \\
      \zihao{4}所在学院 & \zihao{4}\fillCollege \\
    \end{tabular}\\
    \vspace*{\fill}
    {提交日期：\fillYear 年\fillMonth 月}\\
    \vspace*{\fill}
  }
  \clearpage
  {\centering
    \vspace*{1cm}
    {\zihao{1}\sffamily\fillTitleEn}\\
    \vspace*{0.5cm}
    \zihao{3}
    Dissertation Submitted to\\
    \textbf{Zhejiang University of Technology}\\
    in partial fulfillment of the requirement\\
    for the degree of\\
    \textbf{Master of Engineering}\\
    \includegraphics[width=3cm]{zjutlogo}\\
    by\\
    \fillAuthorEn\\
    \vspace*{\fill}
    Dissertation Supervisor: \fillMentorTitleEn\,\fillMentorNameEn\\
    \vspace*{\fill}
    \monthname[\fillMonth], \fillYear\\
    \vspace*{\fill}
  }
  \clearpage
  {
    \vspace*{24bp}
    \begin{center}
      \zihao{3}\heiti\textbf{浙江工业大学学位论文原创性声明}
    \end{center}

    \doublespacing\zihao{-4}
    本人郑重声明：所提交的学位论文是本人在导师的指导下，独立进行研究工作所取得的研究成果。
    除文中已经加以标注引用的内容外，本论文不包含其他个人或集体已经发表或撰写过的研究成果，
    也不含为获得浙江工业大学或其它教育机构的学位证书而使用过的材料。
    对本文的研究作出重要贡献的个人和集体，均已在文中以明确方式标明。
    本人承担本声明的法律责任。

    作者签名：\hfill 日期：\fillYear 年\fillMonth 月 \hspace*{6em}

  \vspace*{24bp}
  \begin{center}
    \zihao{3}\heiti\textbf{学位论文版权使用授权书}
  \end{center}

    \doublespacing\zihao{-4}
    本学位论文作者完全了解学校有关保留、使用学位论文的规定，
    同意学校保留并向国家有关部门或机构送交论文的复印件和电子版，允许论文被查阅和借阅。
    本人授权浙江工业大学可以将本学位论文的全部或部分内容编入有关数据库进行检索，
    可以采用影印、缩印或扫描等复制手段保存和汇编本学位论文。

    \begin{table}[!h]
      \renewcommand\arraystretch{1.5}
      \begin{tabular}{ll}
        \hspace{1.5em}本学位论文属于 & 1、保密$\square$，在一年解密后适用本授权书。\\
        & 2、保密$\square$，在二年解密后适用本授权书。 \\
        & 3、保密$\square$，在三年解密后适用本授权书。 \\
        & 4、不保密$\square$。 \\
        & （请在以上相应方框内打“√”） \\
      \end{tabular}
    \end{table}

    作者签名：\hfill 日期：\fillYear 年\fillMonth 月 \hspace*{6em}

    导师签名：\hfill 日期：\fillYear 年\fillMonth 月 \hspace*{6em}

  }
\end{titlepage}
% \null
% \thispagestyle{empty}%
% \addtocounter{page}{-1}%
% \newpage
}


%%%%%%%% 中文摘要关键词 %%%%%%%%
\newenvironment{AbstractCn}{%
  \vspace*{0pt}
  {
    \centering
    \zihao{3}\heiti\fillTitleCn \\
  }
  \ctexset{
    chapter = {
      beforeskip = {33pt},
      afterskip = {36pt},
      numbering = false,
      fixskip = true,
      break = {},
      format = \zihao{3}\centering\heiti
    }
  }
  \chapter{摘\quad 要}
  \doublespacing\zihao{-4}
}{\clearpage}

\newcommand\KeywordsCn[1]{\vspace{2em}\noindent%
  {\heiti\zihao{-4}\textbf{关键词：}}\songti\zihao{-4}{#1}%
}

%%%%%%%% Abstract Keywords %%%%%%%%
\newenvironment{AbstractEn}{%
  \vspace*{0pt}
  {
    \centering
    \zihao{3}\heiti\bfseries\fillTitleEn \\
  }
  \ctexset{
    chapter = {
      beforeskip = {46pt},
      afterskip = {52pt},
      numbering = false,
      fixskip = true,
      break = {},
      format = \zihao{3}\centering\heiti
    }
  }
  \chapter{ABSTRACT}
  \doublespacing\zihao{-4}
}{\clearpage}

\newcommand\KeywordsEn[1]{\vspace{1em}\noindent%
  {\zihao{-4}\textbf{KEY WORDS:\quad}}\songti\zihao{-4}{#1}%
}


%%%%%%%% 表格 %%%%%%%%
% \RequirePackage{tabularx}         % 自动设置表格的列宽
\RequirePackage{diagbox}            %加载 diagbox 宏包之后可以绘制斜线表头
\RequirePackage{multirow}           % 表格单元实现合并与分割
\RequirePackage{makecell}           % 表格内换行 "\\"
\RequirePackage{longtable}          % 支持跨页长表格

% 三线表，首末线 1.5 磅，第二线 0.5 磅
\RequirePackage{booktabs}           % 表格上下粗横线
\heavyrulewidth=1.5pt
\lightrulewidth=0.5pt


%%%%%%%% 图片 %%%%%%%%
\RequirePackage{graphicx}               % 支持插图处理
\graphicspath{{figures/}}  % 定义所有的eps文件在 figures 子目录下


%%%%%%%% 图表标题 %%%%%%%%
%% 五号=10.5pt，宋体，段前段后6磅，行间距1.5
\RequirePackage{caption}                % 图表标题
\RequirePackage{bicaption}              % 双语标题
\RequirePackage{subcaption}             % 图表子标题
% \RequirePackage[subfigure]{ccaption}   % 支持子图的中文标题
\captionsetup[figure]{font=bf}
\captionsetup[table]{font=bf}
% \captionsetup{font={footnotesize}}
% \captionsetup{font={doublespacing}}
% \captionsetup{skip=6pt}
\renewcommand{\thetable}{~\thechapter-\arabic{table}~}
\renewcommand{\thefigure}{~\thechapter-\arabic{figure}~}
\renewcommand{\footnotesize}{\zihao{5}}


%%%%%%%% 目录 %%%%%%%%
\RequirePackage{titletoc}               % 控制目录的宏包
\RequirePackage[hidelinks]{hyperref}    % 超链接，如目录
%%% 双语图表目录
\captionsetup[figure][bi-first]{name=图}
\captionsetup[figure][bi-second]{name=Figure}
\captionsetup[table][bi-first]{name=表}
\captionsetup[table][bi-second]{name=Table}
\captionsetup[bi-second]{listtype+=Eng}
\RequirePackage{newfloat}
\DeclareFloatingEnvironment[fileext=lof2]{figureEng}[Figure][List of Figures]
\DeclareFloatingEnvironment[fileext=lot2]{tableEng}[Table][List of Tables]
%%% 图目录
\ctexset{ listfigurename = {插图清单}, figurename = {图} }
%%% 表目录
\ctexset{ listtablename = {附表清单}, tablename = {表} }
%%% 目录样式
\RequirePackage[titles]{tocloft}        % 目录格式
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}} % 章节虚线
\renewcommand{\cftdotsep}{1.5}
\addtolength{\cfttabnumwidth}{1em}
\addtolength{\cftfignumwidth}{1em}
% \renewcommand{\cftfigpresnum}{图}
% \renewcommand{\cfttabpresnum}{表}


%%%%%%%% 引用格式 %%%%%%%%
\def\equationautorefname{公式}%
\def\footnoteautorefname{脚注}%
\def\itemautorefname{项}%
\def\figureautorefname{图}%
\def\tableautorefname{表}%
\def\partautorefname{篇}%
\def\appendixautorefname{附录}%
\def\chapterautorefname{章}%
\def\sectionautorefname{节}%
\def\subsectionautorefname{小小节}%
\def\subsubsectionautorefname{subsubsection}%
\def\paragraphautorefname{段落}%
\def\subparagraphautorefname{子段落}%
\def\FancyVerbLineautorefname{行}%
\def\theoremautorefname{定理}%
% \renewcommand{\algorithmcfname}{\zjut@label@algname}
% \setlength{\belowcaptionskip}{2mm}


%%%%%%%% 公式 %%%%%%%%
\RequirePackage{amsmath}                % AMSLaTeX宏包 用来排出更加漂亮的公式
\RequirePackage{amssymb}
%% 公式编号格式，按照章节编号
\numberwithin{equation}{chapter}
\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}


%%%%%%%% 列表 %%%%%%%%
\RequirePackage[inline]{enumitem} % 使用enumitem宏包,改变列表项的格式
\newcounter{descriptcount}
\newlist{enumdescript}{description}{2}
\setlist[enumdescript,1]{%
  before={\setcounter{descriptcount}{0}%
    \renewcommand*\thedescriptcount{\arabic{descriptcount})}},
  font=\itshape\stepcounter{descriptcount}\thedescriptcount~,
  style=nextline,
  leftmargin=1em
}
% 项目符号
\RequirePackage{pifont}
\newcommand{\whiteding}[1]{\ding{\numexpr171+#1\relax}} % 带圈数字


%%%%%%%% 代码 %%%%%%%%
\RequirePackage{listings} % 插入代码
\lstset{
  basicstyle=\zihao{5}\ttfamily,
  breaklines, %自动折行
  numbers=left, %设置行号位置
  keywordstyle=\bfseries, % 设置关键字
  commentstyle=\songti, %设置注释
  % columns=l,
% numberstyle=\tiny, %设置行号大小
% frame=single, %设置边框格式
% escapeinside=``, %逃逸字符，用于显示中文
% extendedchars=false,
% xleftmargin=2em,xrightmargin=2em, aboveskip=1em, %设置边距
% tabsize=4, %设置tab空格数
  showspaces=false %不显示空格
}


%%%%%%%% 参考文献 %%%%%%%%
\RequirePackage{gbt7714}        % GB/T 7714-2015 信息与文献 参考文献著录规则
\bibliographystyle{gbt7714-numerical}
%% 在目录中显示
\renewcommand\bibsection{%
  \ctexset{ chapter = { numbering = false } }
  \chapter{\bibname}
}


%%%%%%%% 附录 %%%%%%%%
\RequirePackage{appendix}        % 附录



