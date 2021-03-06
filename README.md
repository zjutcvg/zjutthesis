# 浙江工业大学计算机学院本科毕业设计模板(非官方)

本 $\LaTeX$ 模板以
[2018年本科毕业设计说明书（论文）格式模板](http://www.cs.zjut.edu.cn/html/n6092.html)、
[计算机学院本科毕业设计相关材料模板](http://www.cs.zjut.edu.cn/html/n4388.html)
等官方模板格式为基础设计。
基于 `ctex` 宏集，根据各个模板格式，将毕业设计所需文档格式分为两大类，`zjutbook` 和 `zjutreport`。
本模板具体层次结构如下：
- `zjutbase.sty`: 统一样式
  - `zjutbook`: 书籍文档类（包含目录、章前分页等）
    - `毕设论文.tex`
  - `zjutreport`: 报告文档类（无目录、章节紧凑等）
    - `文献综述.tex`
    - `外文翻译.tex`
    - `开题报告.tex`

## 快速开始

### 前提准备

* 选择一个 $\LaTeX$ 环境
  * TeX Live (推荐)
    > + Arch Linux / Manjaro: `pacman -S texlive-most`
    > + Ubuntu: `apt-get install texlive-full`
  * MiKTeX
  * MacTeX (只针对 Mac OSX)
* 确保你的 $\LaTeX$ 环境包含中文环境以及 `ctex` 等宏集
  > + Arch Linux / Manjaro: `pacman -S texlive-langchinese`
  > + Ubuntu: `apt-get install texlive-lang-chinese`

### 使用模板

本模板默认使用 `latexmk` 工具自动生成。
使用该命令即可在 `./build` 目录下生成 PDF 文件，
本模板默认持续检测变更、持续生成最新数据。
默认配置参数可在 `latexmkrc` 中进行修改。

1. 在 `latexmkrc` 修改入口 TeX 文件，以及输出文件名称

   例如对于以下配置，表示对 `毕设论文.tex` 编译且最终输出 `./build/毕设论文.pdf`。
   ```
   @default_files = ('毕设论文.tex');
   $out_dir = "build";
   $jobname = '毕设论文';
   ```
2. 在入口 TeX 文件中
   1. 选择具体的文档类 `zjutbook` 或 `zjutreport`。
      ```
      \documentclass[12pt]{zjutbook}
      ```
   2. 指定文档信息
      ```
      \zjuttype{本科毕业设计说明书（论文）}
      \zjutyear{2022}
      \zjuttitle{不得超过30个汉字，论文题目过长可分两行书写}
      \zjutauthor{作者姓名}
      \zjutmentor{教师姓名}
      \zjutcollege{计算机科学与技术学院、软件学院}
      \zjutmajor{软件工程}
      \zjutdate{\number\year 年 \number\month 月 \number\day 日}
      ```
   3. 开始写作
      ```
      \begin{document}
      \chapter{绪论}
      .....
      \end{document}
      ```
3. 在 `bib.bib` 中添加 bibtex 格式的引用
4. 使用 `latexmk` 命令生成 PDF 文件

## FAQ

1. 本模板与 [zjutjh/zjutthesis](https://github.com/zjutjh/zjutthesis) 有何区别？

   `zjutjh/zjutthesis` 有许多值得借鉴的地方，但年久失修，使用 `xeCJK` 宏集；
   本模板使用 `ctex` 宏集，其进一步封装了 `xeCJK`，更便于使用。

2. 本模板与官方模板有什么差异？

   官方模板是本模板的参考依据。相比官方模板作出合理修改如下：
   + 去除封面页眉线
   + 添加第二面为空白面，以便于双面打印需要
   + 按照[浙江工业大学标识使用规范](https://www.zjut.edu.cn/4518/list.htm)更新标志
   + 没有官方模板参考文献的详细介绍，因为模板使用 `gbt7714` 宏包自动生成符合标准的参考文献

3. 官方模板要求使用 1.5 倍行距，为什么本模板使用 `\doublespacing`？

   官方模板使用正文字体为小四（12磅），行高固定为 16 磅，
   因此“1.5 倍行距”即是 $16\times 1.5 = 12\times 2$，
   即相当于 $\LaTeX$ 中的 `\doublespacing`。
