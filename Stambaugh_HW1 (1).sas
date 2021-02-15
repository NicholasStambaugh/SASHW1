/* Nicholas Stambaugh, STA 216 04 */
/* Homework #1 */

/* Item #1*/
PROC IMPORT 
DATAFILE='/home/u56440190/STA 216/mindless eating (1).xlsx'
DBMS=XLSX REPLACE OUT=MMS;
GETNAMES=YES;
RUN;

/* Item #2 */
PROC CONTENTS data=MMS;
Run;

/* Item #3 */
PROC FORMAT;
VALUE  sexname 1 = "Male"
	  		   2 = "Female"
;
RUN;

/* Item #4 */
data MMS;
set MMS;
If 0 < MMS < 36 then MMsQuantity = 'A little';
else if MMS > 50 then MMSQuantity = 'A lot';

/* Item #6 */

else if 36 < MMS < 50 then MMSQuantity = 'Modest';

/* Item #8 */

MMSError = MMS - 50.2;

LABEL Gender = 'Gender of subject'
MMs = 'Number of MMs candies eaten by subject'; 		
RUN;

PROC PRINT DATA=MMS LABEL;
var MMs;
RUN;

PROC PRINT DATA=MMS LABEL;
var MMS;
WHERE MMS > 50;
RUN;

PROC PRINT DATA=MMS;
		
			
/* Item #5 */
PROC SGPLOT 
DATA = MMS;
HISTOGRAM MMS / SHOWBINS;
TITLE "Histogram of MMs Eaten";
TITLE2 "Nicholas Stambaugh";
RUN;

PROC SGPLOT DATA = MMS;
VBOX MMS;
TITLE "Boxplot of MMs Eaten";
TITLE2 "Nicholas Stambaugh";
RUN;

PROC MEANS data=MMS	n min max mean std median skewness kurtosis maxdec=1;
var MMs;
TITLE 'Summary of MMs eaten';
TITLE2 'Nicholas Stambaugh';
RUN;	


PROC MEANS data=MMS	n min max mean std median skewness kurtosis maxdec=1;
var MMSError;
RUN;

/* Item #7 */
PROC FREQ data=MMS;
table MMSQuantity;
title 'Frequency of MMs taken';
title2 'Nicholas Stambaugh';
RUN;

PROC FREQ DATA=MMS;
table MMSError;
RUN;