`getPreferredSGP` <- function(tmp.data, state) {

	YEAR <- SGP_NORM_GROUP <- VALID_CASE <- CONTENT_AREA <- ID <- PREFERENCE <- NULL

	if (!is.null(SGPstateData[[state]][['SGP_Norm_Group_Preference']])) {
		message(paste("\tNOTE: Multiple SGPs exist for individual students. Unique SGPs will be created using SGP Norm Group Preference Table for ", state, ".", sep=""))
	} else {
		stop("\tNOTE: Multiple SGPs exist for individual students. Please examine results in @SGP[['SGPercentiles']].")
	}
	setkey(tmp.data, YEAR, SGP_NORM_GROUP)
	tmp.data <- data.table(SGPstateData[[state]][['SGP_Norm_Group_Preference']][tmp.data], key=c("VALID_CASE", "CONTENT_AREA", "YEAR", "ID", "PREFERENCE"))
	setkey(tmp.data, VALID_CASE, CONTENT_AREA, YEAR, ID)
	tmp.data[!duplicated(tmp.data)][,PREFERENCE:=NULL]
} ### END getPreferredSGP