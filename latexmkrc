# enable forward search
$pdflatex = 'pdflatex -synctex=1 %O %S';

# required by plotting packages such as pgfplots
$pdflatex = 'pdflatex --shell-escape';
