#-------------------------------------
# SET UP THE REQUIRED PACKAGES
#-------------------------------------

install.packages("devtools") # Install the devtools package
install.packages("tidyverse") # Install the tidyverse family of packages (dplyr etc)

library(devtools) # Load the devtools package.

# install RapidRicker from Github
install_github("SOLV-Code/RapidRicker", dependencies = TRUE,
               build_vignettes = FALSE)

library(tidyverse)
library(RapidRicker)

#-------------------------------------
# READ IN THE DATA SET
#-------------------------------------


write_csv(SR_Sample,"DATA/RapidRicker_DemoData.csv")


#-------------------------------------
# APPLY THE MAIN SUMMARY FUNCTION
# (does all the data checks for all the stocks)
#-------------------------------------

# look at the default criteria for the data check
flags_default

# run the wrapper function
# there will be warnings about the Sgen calculation for some stocks and data subsets
rapid.ricker.out <- RapidRicker(sr_obj_m = SR_Sample, min.obs = 10,  trace=TRUE)

# check the components of the output
names(rapid.ricker.out)

# look at the data check outputs
names(rapid.ricker.out$DataCheck)
rapid.ricker.out$DataCheck$TabSeriesVal
rapid.ricker.out$DataCheck$TabSeriesFlags
rapid.ricker.out$DataCheck$TabObsFLags
head(rapid.ricker.out$DataCheck$Summary)
head(rapid.ricker.out$DataCheck$Data)

# look at the BM outputs
names(rapid.ricker.out$BM)
head(rapid.ricker.out$BM$Retro)

# look at the PercDiff outputs (sensitivity test vs. base case)
head(rapid.ricker.out$PercDiff$RetroPercDiffMin)
head(rapid.ricker.out$PercDiff$RetroPercDiffMax)


#-------------------------------------
# GENERATE SUMMARY REPORT
#-------------------------------------


# Generate report tables


# Generate report plot



# Generate



