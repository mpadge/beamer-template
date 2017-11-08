library (extrafont)
#fonttable <- fonts ()
loadfonts (device="postscript")

graphics.off ()

x <- -100:100 / 10
y <- exp (-x ^ 2)

fname <- "figures/fig1.eps"
postscript (fname, horizontal = FALSE, width=7, height=7,
            onefile = FALSE, paper = "special", family = "Sawasdee")

par (bg="transparent", col="gray95", col.axis="gray95", col.lab="gray95", 
     col.main="gray95", col.sub="gray95")
par (ps=12, mar=c(4.5,4.5,1,1), mgp=c(3,1,0))

plot (x, y, "l", col="gray95", xaxt="n", yaxt="n", xlab="", ylab="")
Axis (x, side=1, col="gray95", col.ticks="gray95")
Axis (y, side=2, col="gray95", col.ticks="gray95")
par (ps=16)
title (xlab="the-x-label", ylab="the-y-label")

graphics.off ()
