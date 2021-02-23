*** Pull R number

    import delimited "${DataHarvard}/growth_rate.csv", clear

    keep if (country == "United States"|country =="United Kingdom")

    * reformat the date variable:
    gen    date_td = date(date,"YMD")
    format date_td %td


    rename type rNumbertype

    * drop vars that are not needed:
    drop strat date

    rename country location

    save  "${ProcessedData}/RNumbers_UK_US.dta", replace








********************************************************************************
** End of the Dofile !!!
********************************************************************************
