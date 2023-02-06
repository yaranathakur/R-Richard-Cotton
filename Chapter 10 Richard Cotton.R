# Packages

# To load a package we use library() function
# Package: A collection of R functions and datasets
# Library : A folder on our machine in which files of a package is stored.

# We can load lattice function by library function
library(lattice)
# Now we can use all the functions provided by lattice 
# Example: A fancy dot plot of the famous immer's barley dataset
dotplot(barley$variety~barley$yield|barley$site)

# We can include lots of library at a same time
pkgs <- c("lattice", "utils", "rpart")
for(pkg in pkgs){
  library(pkg, character.only = TRUE)
}


# If you use library to try to load a package that isn’t installed, then it will throw an error
# We can use require to load a package ; it tells as TRUE OR FALSE depending on package is availbale or not


#------------------- The Search Path
# We can search the the packages that are loaded using search function
search()
# The search() throws out some lists
# Global Environment is always comes first followed by most recently loaded packages
# The Last 2 values are always special  called Autoloads and the base package

# If we define a variable called var in global environment R will find that before
# it finds the usual variance function in the stats package beacsue the gloabal environment comes first

# If we craete any environments they will also appear in search lists



#------------ Library And Installed Packages

# We can use installed.packages() function to see all the packages installed on our machine
installed.packages()
# It will be better if we use 
View(installed.packages())        # It Will Show Every PAckage In Data Frame
# installed.packages() shows 
# [1] Version of each package 
# [2] Path of each package 
# [3] which other packages depend on this packages
# And many other things



# We can retrieve the location of package using R.home("library") or .Library
R.home("library")
.Library


# We can also have user defined library where we can install our packages and accessible by only us
# The location is OS dependent
# We can find home directory using
path.expand("~") # Or
Sys.getenv("HOME")

# You can see a character vector of all the libraries that R knows about using the function below
.libPaths()
# The 2nd output is very important as it is default location of packages installed
# [1] "C:/Users/YaranaThakurHindu/AppData/Local/R/win-library/4.2"
# [2] "C:/Program Files/R/R-4.2.0/library"


#------------ Installing Packages


# A factory fresh installed R are set up to access the CRAN package repository and CRANextra(for windows)
# To access additional repositories, type setRepositories()
setRepositories()
# 1: + CRAN                     
# 2:   BioC software
# 3:   BioC annotation
# 4:   BioC experiment
# 5:   CRAN (extras)
# 6:   R-Forge
# 7:   rforge.net

# Bioconductor contains packages related to genomics and molecular biology
# R-Forge and RForge.net mostly contain development versions of packages that eventually appear on CRAN.

# We use available.packages() function to check  packages available in repository
View(available.packages())

# There are many R packages in online repositories such as GitHub, Bitbucket, and Google Code.
# Accessing from github is very easy

# In R GUI, the Packages menu has the option “Install package(s) from where we can install any package
# We can also install a package using a command install.packages()

install.packages()

setInternet2()
Defunct
help("Defunct")
# When a function is removed from R it should be replaced by a function which calls .Defunct.
# To install a package directly from GitHub, you first need to install the devtools package:
install.packages("devtools")

# The install_github function accepts the name of the GitHub repository that contains the package 
library(devtools)
install_github("knitr", "yihui")                   # Not working




#------------ Maintaining Packages

# After packages are installed we can keep them updated using packages.update() function
# Directly passing the function will always prompt to ask update or not for every package
# Therefore we can pass an argument ask = FASLE to refrain from that
update.packages(ask = FALSE)

# We can also delete the installed packages
# We can use remove.packages()
remove.packages("Name of package")

#######################################
QUESSTIONS


# 1. What are the names of some R package repositories?
# 1: + CRAN                     
# 2:   BioC software
# 3:   BioC annotation
# 4:   BioC experiment
# 5:   CRAN (extras)
# 6:   R-Forge
# 7:   rforge.net
# Many packages are available on Github, Bitbucket and Google code.

# 2. What is the difference between the library and require functions?
# Both function load packages. in which library throws error if it fails while require returns logical value


# 3. What is a package library?
# Library package is just a folder which contains R packages on our machine.

# 4. How might you find the locations of package libraries on your machine?
# Using .libPaths() Function
.libPaths()
# We an also use R.home("library") function and  .Library function
R.home("library")
.Library



# 5. How do you get R to pretend that it is Internet Explorer?
# R doesn't do a great impression of internet explorer, But we can use it as Internet Explorer using the package
install.packages(internet2.dll)

# 6. Using R GUI, install the Hmisc package.
# Go to package menu
# There is option install
# When we click on install a prompt window is opened
# We Select Repository
# Then Enter The name of package Hmisc
# Choose Path where to install
# Then Click on the install button in the prompt window

# 7. Using the install.packages function, install the lubridate package. [10]
install.packages(lubridate)

# 8. Count the number of packages that are installed on your machine in each library.
pkgs <- installed.packages()
table(pkgs[, "LibPath"])
