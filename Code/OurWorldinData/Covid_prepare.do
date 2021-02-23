

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

  * generate days since approval of the first vaccine:
  gen     apprvl_vaccine = td(11dec2020)
  format  apprvl_vaccine %td

  gen     days_apprvl    = date_td - apprvl_vaccine


  local  KeepVars = "location date date_td first_dose second_dose apprvl_vaccine days_apprvl"
  order `KeepVars'
  keep  `KeepVars'


  save  "${ProcessedData}/Vaccinations_US_constructed.dta", replace






  *** Merge the two data sets

  use "${ProcessedData}/DailyCasesDeaths_US_constructed.dta", clear

  merge 1:1 date_td using  "${ProcessedData}/Vaccinations_US_constructed.dta", gen(MergeVaccines)



  * Date
  * Number of weeks since vaccine approved in the country
  * Number of 1st doses given in that day
  * Number of 2nd doses given in that day
  * Number of confirmed cases on that day
  * Number of confirmed deaths on that day

  rename  location country
  rename  date     date_str

  lab var country         "Country"
  lab var date_td         "Date"
  lab var new_cases       "Daily new cases"
  lab var new_deaths      "Daily new deaths"
  lab var first_dose      "Number of 1st doses"
  lab var second_dose     "Number of 1st doses"
  lab var apprvl_vaccine  "Approval of 1st vaccine"
  lab var days_apprvl     "Days since approval of first vaccine"

  * Then R values added


  * keep only those variables that are needed:
  local  VarList = "country date_td new_cases new_deaths first_dose second_dose apprvl_vaccine days_apprvl"
  order `VarList'
  keep  `VarList'


  save  "${FinalData}/CovidData_US_final.dta", replace
  export delimited "${FinalData}/CovidData_US_final.csv", replace





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

  * generate days since approval of the first vaccine:
  gen     apprvl_vaccine = td(02dec2020)
  format  apprvl_vaccine %td

  gen     days_apprvl    = date_td - apprvl_vaccine


  local   KeepVars = "location date date_td first_dose second_dose apprvl_vaccine days_apprvl"
  order  `KeepVars'
  keep   `KeepVars'


  save  "${ProcessedData}/Vaccinations_UK_constructed.dta", replace




  *** Merge the two data sets

  use "${ProcessedData}/DailyCasesDeaths_UK.dta", clear

  merge 1:1 date_td using  "${ProcessedData}/Vaccinations_UK_constructed.dta", gen(MergeVaccines)


  * Date
  * Number of weeks since vaccine approved in the country
  * Number of 1st doses given in that day
  * Number of 2nd doses given in that day
  * Number of confirmed cases on that day
  * Number of confirmed deaths on that day

  rename  location country
  rename  date     date_str

  lab var country         "Country"
  lab var date_td         "Date"
  lab var new_cases       "Daily new cases"
  lab var new_deaths      "Daily new deaths"
  lab var first_dose      "Number of 1st doses"
  lab var second_dose     "Number of 1st doses"
  lab var apprvl_vaccine  "Approval of 1st vaccine"
  lab var days_apprvl     "Days since approval of first vaccine"

  * Then R values added


  * keep only those variables that are needed:
  local  VarList = "country date_td new_cases new_deaths first_dose second_dose apprvl_vaccine days_apprvl"
  order `VarList'
  keep  `VarList'


  save  "${FinalData}/CovidData_UK_final.dta", replace
  export delimited "${FinalData}/CovidData_UK_final.csv", replace




********************************************************************************
** End of the Dofile !!!
********************************************************************************
