
** US daily confirmed cases:

    import delimited "${Data}/time_series_covid19_confirmed_US.csv", clear

    collapse (sum) v12 - v409

    reshape long v, i(iso3) j(date)










********************************************************************************
** End of the Dofile !!!
********************************************************************************
