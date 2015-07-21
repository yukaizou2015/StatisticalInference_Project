BuildPDF <- function(x) {
        # Set working directory manually first
        
        # Load packages
        require(knitr)
        require(markdown)
        
        # Create .md, .html, and .pdf files
        xRmd <- paste(x, ".Rmd", sep = "")
        xmd <- paste(x, ".md", sep = "")
        xhtml <- paste(x, ".html", sep = "")
        xpdf <- paste(x, ".pdf", sep = "")
        knit(xRmd)
        markdownToHTML(xmd, xhtml, options=c("use_xhml"))
        system(paste("pandoc -V geometry:margin=1in -s ", xmd, " -o ", xpdf, sep = ""))
}