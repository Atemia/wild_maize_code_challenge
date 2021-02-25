#!/usr/bin/env R

# Installation of packages
print("Checking and installing required packages...")

list.of.packages <- c("gridExtra","gtable","label.switching","ggplot2","tidyr","devtools")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages, repos = "https://www.stats.bris.ac.uk/R/")

print("Installing pophelper package from github ...")
print("This might take a while...")

devtools::install_github('royfrancis/pophelper')

print("Done !")

# install.packages(c("devtools","ggplot2","gridExtra","gtable","label.switching","tidyr"),dependencies=T)

## **install pophelper package from GitHub**
# library(devtools)
# devtools::install_github('royfrancis/pophelper')

library("pophelper")
library("gridExtra")
library("gtable")
library("label.switching")
library("tidyr")
library("ggplot2")


# import metadata files
meta_data <- read.delim("../data/maize_samples.txt", header=T, stringsAsFactors=F)

# filter data to include only maize samples
#View(meta_data) # inspecting to allow for subsetting using dplyr 

# read the admixture run file into a ‘qlist’ object
qlist <- readQ("../data/maize.3.Q",indlabfromfile = F)

# Adding group lables
onelabset <- meta_data[,2,drop=F]
twolabset <- meta_data[,1:2]

# Adding a new column by combining the sample ids with respective altitudes for plotting. Some individuals were sampled from the same altitude
meta_data$sampleID_altitude <- paste(meta_data$sample_id, meta_data$altitude, sep="_")

# Adding labels
rownames(qlist[[1]]) <- meta_data$sampleID_altitude

# Ploting the admixture results
p1 <- plotQ(qlist[1],exportplot=T,returnplot=T, showyaxis=T, showgrplab = F,
            ordergrp=TRUE, grplab = onelabset, basesize=11, useindlab = T, # Ordering by spp.
            showindlab = T, subsetgrp="Zea mays ssp. mays", sortind = "all", # Selecting only maize samples
            showtitle=T,showsubtitle=T,titlelab="Admixture plot", titlesize = 14, # Adding title and subtitle
            subtitlelab="Population structure of Zea mays ssp. mays.",
            subtitlesize = 12, showlegend=T,legendkeysize=8,legendtextsize=10,
            legendlab=c("Cluster 1", "Cluster 2","Cluster 3"), indlabsize = 4,
            imgtype = "pdf",
            exportpath= "../results",
            outputfilename = "../results/admixture_plot",
            height = 4,
            width = 8,
            dpi = 300,
            units = "inches",
            theme = "theme_grey") # labeling the sub populations

# Visualizing the plot using a different method

# p1$plot[[1]]
# grid.arrange(p1$plot[[1]])

# Exporting file to pdf
# pdf("../results/admixture_plot.pdf",         # File name
#     width = 8, height = 4, # Width and height in inches
#     bg = "white",          # Background color
#     colormodel = "cmyk",    # Color model (cmyk is required for most publications)
#     paper = "A4")          # Paper size
# 
# # Creating a plot
# grid.arrange(p1$plot[[1]])
# 
# # Closing the graphical device
# dev.off() 


# Performing a Multiline Plot. It is the same as the previous plot but more clearer
p <- plotQMultiline(qlist,exportplot=T,returnplot=T, spl = 55, showyaxis=T, 
                    ordergrp=TRUE, grplab = onelabset, basesize=11, useindlab = T, # Ordering by spp.
                    showindlab = T, subsetgrp="Zea mays ssp. mays", sortind = "all", # Selecting only maize samples
                    showtitle=T,showsubtitle=T,titlelab="Admixture plot", titlesize = 14, # Adding title and subtitle
                    subtitlelab="Population structure of Zea mays ssp. mays.",
                    subtitlesize = 12, showlegend=T,legendkeysize=8,legendtextsize=10,
                    legendlab=c("Cluster 1", "Cluster 2","Cluster 3"), indlabsize = 7,
                    imgtype = "pdf", # plotting
                    exportpath= "../results",
                    outputfilename = "../results/multiline_admixture_plot",
                    height = 10,
                    width = 8,
                    dpi = 300,
                    units = "in",
                    theme = "theme_grey") # labeling the sub populations

# Visualizing the plot using a different method
# grid.arrange(p$plot[[1]][[1]]) # plotting the Multiline Plot

# # Exporting file to pdf
# pdf("../results/multiline_admixture_plot.pdf",         # File name
#     width = 8, height = 7, # Width and height in inches
#     bg = "white",          # Background color
#     colormodel = "cmyk",    # Color model (cmyk is required for most publications)
#     paper = "A4")          # Paper size
# 
# # Creating a plot
# grid.arrange(p$plot[[1]][[1]])
# 
# # Closing the graphical device
# dev.off()