

** Master Do file:

	* Users
	* -----------

	dis "`c(username)'"

	* Jonas
	if c(username)=="jonasguthoff"  {
	global github "/Users/jonasguthoff/Github/covid"
	}

	* Set globals for filepaths

	global Data               "$github/Data"
	global DataOurWorld       "$github/Data/OurWorldinData"
	global DataOurWorld_ECDC  "$DataOurWorld/ecdc"
	global DataOurWorld_Vacc  "$DataOurWorld/vaccinations"





********************************************************************************
** End of the Dofile !!!
********************************************************************************
