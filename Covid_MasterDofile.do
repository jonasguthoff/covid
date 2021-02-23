

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





********************************************************************************
** End of the Dofile !!!
********************************************************************************
