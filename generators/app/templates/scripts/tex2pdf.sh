#! /bin/bash
latex=$1
target=$2
shift 2
flags=$@

# 相互参照を示すlog message
warningAboutReference="^LaTeX Warning: Label(s) may have changed."

if [ -e ${target}.bbl ]
then
    ${latex} ${target} ${flags}
fi

while grep "${warningAboutReference}" ${target}.log
do
  ${latex} ${target} ${flags}
done


if [ ${latex} != "pdftex" -a ${latex} != "pdflatex" -a ${latex} != "lualatex" ]
then
	# Convert dvi to pdf (when the LaTeX engine is not pdftex, pdflatex, and lualatex)
	dvipdfmx ${target}.dvi
fi
