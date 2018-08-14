##  Moz site level TX_NET_NEW analysis
##  8.8.18
##  J Davis
##  Purpose: TX_NET_NEW at site level
##  Description: create a site level, wide format file for analysis that includes:
##    TX_NEW, TX_CURR, TX_NET_NEW, PSNU, IM, site, siteUID

## genie export conver to MSD for...things
  ## extra column trimming, var renames


install_github("ICPI/ICPIutilities")
install_github("achafetz/PartnerProgress")
install.packages("data.table")

library(tidyverse)
library("devtools")
library(writexl)
library(ICPIutilities)
library(dplyr)
library(data.table)

# define paths
  # site path is where the site by IM genie extract is

site_path <- "C:/Users/GHFP/Documents/data/6.22 refresh/genie/PEPFAR-Data-Genie-SiteByIMs-2018-08-10"
#psnu_path <- "C:/Users/GHFP/Documents/data/6.22 refresh/genie/PEPFAR-Data-Genie-PSNUByIMs-2018-08-10"

# you only need to run 'read_msd' once, once it's been run read_rds is faster
#gen_site_im <- read_msd(file.path(site_path, ("PEPFAR-Data-Genie-SiteByIMs-2018-08-10.txt")))

##  create some lists for the vars you want to keep

indc <- c("TX_NEW", "TX_NET_NEW", "TX_CURR")

keep <- c("countryname",
          "snu1",
          "psnu",
          "mechanismid",
          "indicator",
          "facility",
          "fy2018_targets",
          "fy2018q1",
          "fy2018q2",
          "fy2018q3",
          "fy2019_targets"
)

##  trim dataset to required vars, gather and spread for wide format

gen_site_im <- read_rds(file.path(site_path, "PEPFAR-Data-Genie-SiteByIMs-2018-08-10.rds")) %>% 
  filter(indicator %in% indc) %>% 
  filter(disaggregate == "Total Numerator") %>%
  filter(sitetype =="Facility") %>% 
  combine_netnew() %>% 
  ICPIutilities::add_cumulative() %>% 
  select(c(keep)) %>% 
  gather(codes, value, starts_with("fy")) %>% 
  drop_na(value) %>% 
  group_by(countryname, snu1, psnu, mechanismid, facility, indicator, codes) %>% 
  summarise(value = sum(value)) %>% 
  unite(period, indicator, codes, sep = "_") %>% 
  spread(key = period, value = value) %>% 
  write_csv(file.path(site_path, "moz_tx_net_new_sites.csv"))



