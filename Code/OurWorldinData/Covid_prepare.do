

*** Prepare data set on covid cases and vaccinations for the US and UK


  * For the US:
  use  "${ProcessedData}/DailyCases_US_UK.dta", clear

  keep if location == "United States"

  gen    date_td = date(date,"YMD")
  format date_td %td

  local  KeepVars = "location date date_td new_cases new_deaths total_cases total_deaths"
  order `KeepVars'
  keep  `KeepVars'


  save  "${ProcessedData}/DailyCasesDeaths_US_constructed.dta", replace






  * Vaccinations
  use  "${ProcessedData}/Vaccinations_US.dta", clear

  gen    date_td = date(date,"YMD")
  format date_td %td

  * total_vaccinations      = received first OR second dose
  * people_fully_vaccinated = received second dose

  gen     second_dose = .
  replace second_dose = people_fully_vaccinated[_n]  - people_fully_vaccinated[_n-1]

  gen     first_dose  = .
  replace first_dose  = total_vaccinations - second_dose
  format  first_dose %12.0g


  local  KeepVars = "location date date_td first_dose second_dose"
  order `KeepVars'
  keep  `KeepVars'


  save  "${ProcessedData}/Vaccinations_US_constructed.dta", replace


  *** Merge the two data sets

  use "${ProcessedData}/DailyCasesDeaths_US_constructed.dta", clear

  merge 1:1 date_td using  "${ProcessedData}/Vaccinations_US_constructed.dta", gen(MergeVaccines)


  * add number of weeks since vaccines were approvaed:




  save  "${ProcessedData}/CovidCasesVaccines_US_constructed.dta", replace




  * ----------------------------------------------------------------------------
  * For the UK:

  use  "${ProcessedData}/DailyCases_US_UK.dta", clear

  keep if location == "United Kingdom"

  gen    date_td = date(date,"YMD")
  format date_td %td

  local  KeepVars = "location date date_td new_cases new_deaths total_cases total_deaths"
  order `KeepVars'
  keep  `KeepVars'


  save  "${ProcessedData}/DailyCasesDeaths_UK.dta", replace



  * Vaccinations UK:
  use  "${ProcessedData}/Vaccinations_UK.dta", clear

  gen    date_td = date(date,"YMD")
  format date_td %td

  * total_vaccinations      = received first OR second dose
  * people_fully_vaccinated = received second dose

  gen     second_dose = .
  replace second_dose = people_fully_vaccinated[_n]  - people_fully_vaccinated[_n-1]

  gen     first_dose  = .
  replace first_dose  = total_vaccinations - second_dose
  format  first_dose %12.0g


  local   KeepVars = "location date date_td first_dose second_dose"
  order  `KeepVars'
  keep   `KeepVars'


  save  "${ProcessedData}/Vaccinations_UK_constructed.dta", replace



  ******************************************************************************
  * Pull data sets again and label, clean them:

* Date
* Number of weeks since vaccine approved in the country
* Number of 1st doses given in that day
* Number of 2nd doses given in that day
* Number of confirmed cases on that day
* Number of confirmed deaths on that day

* Then R values added















********************************************************************************
** End of the Dofile !!!
********************************************************************************
