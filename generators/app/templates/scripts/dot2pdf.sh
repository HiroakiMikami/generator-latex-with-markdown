#! /bin/bash

inkscape=$1
dot=$2
input=$3
output=$4
shift 4
dotFlags=$@

echo ${dot} ${input} ${dotFlags}
${inkscape} -f <(${dot} ${input} ${dotFlags}) -A ${output}
