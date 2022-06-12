#### Input ####
@default_files = ('论文模板.tex');
# 多文件
# @default_files = ('file-one.tex', 'file-two.tex');

#### Output ####
$out_dir = "build";
$jobname = '论文模板';

#### Engine ####
$pdflatex = 'pdflatex -interaction=nonstopmode -shell-escape';
$xelatex = 'xelatex -file-line-error --shell-escape -src-specials -synctex=1 -interaction=nonstopmode';

#### Produce ####
$pdf_mode = 5;          # 默认使用 xelatex 引擎
# $postscript_mode = 1; # tex -> ps
# $pdf_mode = 2;        # tex -> ps -> pdf
$bibtex_use = 2;        # bibliography

#### 连续生成 ####
$preview_continuous_mode = 1;

## Previewer

$pdf_previewer = 'start evince'; # Linux
# $pdf_previewer = 'open -a Skim'; # macOS
# $pdf_previewer = 'Start C://SumatraPDF.exe'; # Windows