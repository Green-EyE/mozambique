install.packages("tidyverse")
library(tidyverse)

SITE_IM_FY17_18 <- read_tsv(file = "C:/Users/cnhantumbo/Documents/ICPI/MER FY2018 Q4 Post-Cleaning/MER_Structured_Dataset_SITE_IM.txt", 
                    col_types = cols(orgUnitUID        = "c",
                                     SiteName          = "c",            
                                     Region            = "c",     
                                     RegionUID         = "c",    
                                     OperatingUnit     = "c",      
                                     OperatingUnitUID  = "c",     
                                     CountryName       = "c",     
                                     SNU1              = "c",     
                                     SNU1Uid           = "c",     
                                     PSNU              = "c", 
                                     PSNUuid           = "c",
                                     SNUPrioritization = "c",
                                     typeMilitary      = "c",
                                     mechanismUID      = "c", 
                                     PrimePartner      = "c",
                                     FundingAgency     = "c",
                                     MechanismID       = "c",
                                     ImplementingMechanismName ="c",
                                     CommunityUID      ="c",
                                     Community         ="c",
                                     CommunityPrioritization ="c",
                                     FacilityUID       = "c",
                                     Facility ="c",
                                     FacilityPrioritization ="c", 
                                     SiteType ="c",
                                     indicator ="c",
                                     numeratorDenom ="c",
                                     indicatorType ="c",
                                     disaggregate ="c",
                                     standardizedDisaggregate ="c",
                                     categoryOptionComboName ="c",
                                     AgeAsEntered ="c",
                                     AgeFine ="c",
                                     AgeSemiFine ="c",
                                     AgeCoarse ="c",
                                     Sex ="c",
                                     resultStatus ="c",
                                     otherDisaggregate ="c",
                                     coarseDisaggregate ="c",
                                     modality ="c",
                                     isMCAD ="c",
                                     FY2017_TARGETS     = "d",
                                     FY2017Q1           = "d",      
                                     FY2017Q2           = "d",      
                                     FY2017Q3           = "d",      
                                     FY2017Q4           = "d",      
                                     FY2017APR          = "d",
                                     FY2018_TARGETS     = "d",
                                     FY2018Q1           = "d",
                                     FY2018Q2           = "d",
                                     FY2018Q3           = "d",
                                     FY2018Q4           = "d",
                                     FY2018APR          = "d",
                                     FY2019_TARGETS     = "d"))



# Extracting EMR_SITE indicator
EMR_SITE <- filter(SITE_IM_FY17_18, indicator == "EMR_SITE")
View (select (EMR_SITE, indicator))
View (count(EMR_SITE, indicator)) 




# Exporting data
write.csv(EMR_SITE, "MER_Structured_Dataset_SITE_IM_EMR_SITE.csv")
