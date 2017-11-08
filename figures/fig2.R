library (extrafont)
fonttable <- fonts ()
#loadfonts (device="postscript")

x <- 1:10
y <- runif (10)
graphics.off ()

for (i in 1:5)
{
    fname <- paste0 ("figures/fig2", letters [i], ".eps")
    postscript (fname, horizontal = FALSE, width=7, height=7,
                    onefile = FALSE, paper = "special", family = "Sawasdee")
    par (bg="transparent", col="gray95", col.axis="gray95", col.lab="gray95", 
         col.main="gray95", col.sub="gray95")
    par (ps=12, mar=c(4.5,4.5,1,1), mgp=c(3,1,0))
    plot (x, y, pch=19, col="gray95", xlab="", ylab="", xaxt="n", yaxt="n")
    Axis (x, side=1, col="gray95", col.ticks="gray95")
    yps <- pretty (y) # or manual values
    ylabs <- paste0 (pretty (y)) # or manual values
    Axis (y, at=yps, labels=ylabs, side=2, col="gray95", col.ticks="gray95")
    par (ps=16)
    title (xlab=expression (paste ("Some kind of distance (", 
                                  Delta, d, ", km)", sep="")), 
            ylab=expression (paste ("Something else (", 
                                  Delta, Y, ")", sep="")))
    if (i > 1)
    {
        mod <- lm (y ~ x)
        xfit <- seq (min (x), max(x), length.out=10)
        yfit <- predict (mod, new=data.frame (x=xfit))
        lines (xfit, yfit, lwd=2, col="gray95")

        if (i > 2)
        {
            points (x [i], y [i], pch = 1,
                    col="dodgerblue2", cex=4, lwd=4)
        }
    }
    graphics.off ()
} # end for i
