# Set working directory
setwd("~/Desktop/Coursera/StatisticalInference")

# Load packages
require(knitr)
require(markdown)

# Create .md, .html, and .pdf files
knit("ProjectReport_ToothGrowth.Rmd")
markdownToHTML('ProjectReport_ToothGrowth.md', 'ProjectReport_ToothGrowth.html', options=c("use_xhml"))
system("pandoc -V geometry:margin=1in -s ProjectReport_ToothGrowth.md -o ProjectReport_ToothGrowth.pdf")