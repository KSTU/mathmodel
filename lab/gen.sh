#!/bin/bash
#octave regression.m $1 $2
#pdflatex main.tex

#erise old data
cd results
echo "" > filelist.tex
cd ..

#base lab
cd results
rm base.tex
cd ..
octave base.m $1 $2

#regression lab
cd results
rm regression.tex
cd ..
octave regression.m $1 $2

#regression lab
cd results
rm diffeq.tex
cd ..
octave diffeq.m $1 $2

#programm lab
cd results
rm prog.tex
cd ..
octave prog.m $1 $2

#phase lab
cd results
rm phase_ideal.tex
cd ..
octave phase_ideal.m $1 $2

#reaction lab
cd results
rm reactions.tex
cd ..
octave reactions.m $1 $2



#get pdf
cd results
pdflatex main.tex
