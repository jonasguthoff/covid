
*** Pull covid data for the US and UK


** Daily reported cases and vaccinations from the US

  import delimited "${DataOurWorld_JHU}/full_data.csv", clear


  keep if location == "United States"|location == "United Kingdom"


  save "${ProcessedData}/DailyCases_US_UK.dta", replace





** Vaccinations
  import delimited "${DataOurWorld}/vaccinations/country_data/United Kingdom.csv", clear


  save "${ProcessedData}/Vaccinations_UK.dta", replace


  import delimited "${DataOurWorld}/vaccinations/country_data/United States.csv", clear


  save "${ProcessedData}/Vaccinations_US.dta", replace



  save "${ProcessedData}/DailyCases_US_UK.dta", replace
save "${ProcessedData}/Vaccinations_UK.dta", replace
  save "${ProcessedData}/Vaccinations_US.dta", replace



********************************************************************************
** End of the Dofile !!!
********************************************************************************
