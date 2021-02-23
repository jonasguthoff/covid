
** Daily reports from the US

  * Import data by year:

  * 2020
  foreach month of numlist 4(1)9 {
      if `month' == 4 {
        foreach day of numlist 12/30 {
        import delimited "${Data}/csse_covid_19_daily_reports_us/0`month'-`day'-2020.csv", clear
        save             "${Data}/csse_covid_19_daily_reports_us/M0`month'-`day'-2020.dta", replace
      }

      if inlist(`month',5,7,8,10,12) {
        foreach day of numlist 1/9 {
        import delimited "${Data}/csse_covid_19_daily_reports_us/0`month'-`day'-2020.csv", clear
        save             "${Data}/csse_covid_19_daily_reports_us/M0`month'-`day'-2020.dta", replace
        }

        foreach day of numlist 10/31 {
        import delimited "${Data}/csse_covid_19_daily_reports_us/`month'-`day'-2020.csv", clear
        save             "${Data}/csse_covid_19_daily_reports_us/M`month'-`day'-2020.dta", replace
        }
      }

    if inlist(`month',6,9,11) {
        foreach day of numlist 1/9 {
        import delimited "${Data}/csse_covid_19_daily_reports_us/0`month'-`day'-2020.csv", clear
        save             "${Data}/csse_covid_19_daily_reports_us/M0`month'-`day'-2020.dta", replace
        }

        foreach day of numlist 1/30 {
        import delimited "${Data}/csse_covid_19_daily_reports_us/0`month'-`day'-2020.csv", clear
        save             "${Data}/csse_covid_19_daily_reports_us/M0`month'-`day'-2020.dta", replace
        }
      }
    }








    if _rc == 0 {
      import delimited "${Data}/csse_covid_19_daily_reports_us/0`month'-0`day'-2020.csv"
      save                     "${Data}/csse_covid_19_daily_reports_us/M0`month'-0`day'-2020.dta", replace
    }


      if `month' > 4 {
      foreach day of numlist 1/9 {
    	cap capture confirm file "${Data}/csse_covid_19_daily_reports_us/0`month'-0`day'-2020.csv"
      if _rc == 0 {
        import delimited "${Data}/csse_covid_19_daily_reports_us/0`month'-0`day'-2020.csv"
      save                     "${Data}/csse_covid_19_daily_reports_us/M0`month'-0`day'-2020.dta", replace
    }
      }
      }
    }




stop



  foreach year of numlist 2020,2021 {
  foreach month of numlist 1(1)9 {
    foreach day of numlist 1/9 {


      cap capture confirm file "${Data}/csse_covid_19_daily_reports_us/0`month'-`day'-`year'.csv"
    	if _rc import delimited   "${Data}/csse_covid_19_daily_reports_us/0`month'-`day'-`year'.csv"

      save                     "${Data}/csse_covid_19_daily_reports_us/M0`month'-`day'-`year'.dta", replace
      }
    }
  }


  foreach year of numlist 2020,2021 {
  foreach month of numlist 1(1)9 {
    foreach day of numlist 1/9 {

      cap capture confirm file "${Data}/csse_covid_19_daily_reports_us/`month'-0`day'-`year'.csv"
    	if _rc import delimited   "${Data}/csse_covid_19_daily_reports_us/`month'-0`day'-`year'.csv"


      save                     "${Data}/csse_covid_19_daily_reports_us/M`month'-0`day'-`year'.dta", replace
      }
    }
  }


  foreach year of numlist 2020,2021 {
  foreach month of numlist 1(1)9 {
    foreach day of numlist 1/9 {

      cap capture confirm file "${Data}/csse_covid_19_daily_reports_us/`month'-`day'-`year'.csv"
    	if _rc import delimited   "${Data}/csse_covid_19_daily_reports_us/`month'-`day'-`year'.csv"

      save                     "${Data}/csse_covid_19_daily_reports_us/M`month'-`day'-`year'.dta", replace
      }
    }
  }


  * Append all data:
stop


    use "${Data}/csse_covid_19_daily_reports_us/M04-12-2020.dta", clear




  foreach month of numlist 1(1)12 {
    foreach day of numlist 1/31 {

    cap capture confirm file  "${Data}/csse_covid_19_daily_reports_us/0`month'-0`day'-2021.csv"
  	if _rc import delimited   "${Data}/csse_covid_19_daily_reports_us/0`month'-0`day'-2021.csv"

    save                      "${Data}/csse_covid_19_daily_reports_us/0`month'-0`day'-2021.dta", replace


    cap capture confirm file "${Data}/csse_covid_19_daily_reports_us/0`month'-0`day'-2021.csv"
  	if _rc import delimited  "${Data}/csse_covid_19_daily_reports_us/0`month'-0`day'-2021.csv"

    save                     "${Data}/csse_covid_19_daily_reports_us/0`month'-0`day'-2021.dta", replace


    }
  }















********************************************************************************
** End of the Dofile !!!
********************************************************************************
