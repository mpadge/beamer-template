LL=latex
PDF=dvipdfm
LFLAGS=-interaction=nonstopmode -shell-escape
PFLAGS=-dAutoRotatePages=/None
FILE1 = 1Intro
FILE2 = 2FirstPart
FILE3 = 3SecondPart

all: one two three

one: latex1 latex1 dvi1 tk clean
two: latex2 latex2 dvi2 tk clean
three: latex3 latex3 dvi3 tk clean

latex1: 
	$(LL) $(FILE1).tex $(LFLAGS) 
latex2: 
	$(LL) $(FILE2).tex $(LFLAGS) 
latex3: 
	$(LL) $(FILE3).tex $(LFLAGS) 

pdf1:
	$(PDF) $(FILE1).dvi
pdf2:
	$(PDF) $(FILE2).dvi
pdf3:
	$(PDF) $(FILE3).dvi

dvi1:
	dvips -P pdf -q $(FILE1).dvi
	ps2pdf $(PFLAGS) $(FILE1).ps
dvi2:
	dvips -P pdf -q $(FILE2).dvi
	ps2pdf $(PFLAGS) $(FILE2).ps
dvi3:
	dvips -P pdf -q $(FILE3).dvi
	ps2pdf $(PFLAGS) $(FILE3).ps

tk:
	pdftk $(FILE1).pdf $(FILE2).pdf $(FILE3).pdf \
		output final.pdf

fig1:
	Rscript figures/fig1.R
fig2:
	Rscript figures/fig2.R
eps:
	bash eps-convert.bash
figs: fig1 fig2 eps

open:
	xdg-open final.pdf &

clean:
	rm -f *.dvi *.ps *.log *.nav *.snm *.toc *.out *.aux

cleaneps:
	rm figures/*.eps images/*.eps

cleanall: clean cleaneps
