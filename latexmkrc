#### Input ####
@default_files = ('thesis_example.tex');
# 多文件
# @default_files = ('file-one.tex', 'file-two.tex');

#### Output ####
$out_dir = "build";
$jobname = 'thesis_example';

#### Engine ####
$pdflatex = 'pdflatex -interaction=nonstopmode -shell-escape';
$xelatex = 'xelatex -file-line-error --shell-escape -src-specials -synctex=1 -interaction=nonstopmode -quiet';

#### Produce ####
$pdf_mode = 5;          # 默认使用 xelatex 引擎
$bibtex_use = 2;        # bibliography

#### 连续生成 ####
$preview_continuous_mode = 1;

## Previewer
# $pdf_previewer = 'start evince'; # Linux
# $pdf_previewer = 'open -a Skim'; # macOS
# $pdf_previewer = 'Start C://Program Files/SumatraPDF/SumatraPDF.exe'; # Windows