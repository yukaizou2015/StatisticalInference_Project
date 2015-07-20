# Set working directory
setwd("~/Desktop/Coursera/StatisticalInference")

# Load packages
require(knitr)
require(markdown)

# Create .md, .html, and .pdf files
knit("ProjectReport_Simulation.Rmd")
markdownToHTML('ProjectReport_Simulation.md', 'ProjectReport_Simulation.html', options=c("use_xhml"))
system("pandoc -V geometry:margin=1in -s ProjectReport_Simulation.md -o ProjectReport_Simulation.pdf")