/*
This file produces a confidence interval for the noncentrality
parameter of the noncentral F distribution.
The required input rows must contain the F-ratio value, df1, df2,
and desired confidence level. 
An example input row is given in the line below "cards;".
The last five parameters in the output are the lower limit (ncplow)
and upper limit (ncpupp) of the noncentrality parameter, 
plus r-squared and its lower and upper CI limits.  
*/
SYNTAX:
data x;
 input  F df1 df2 conf;
  prlow = 1-(1-conf)/2;
  prupp = (1-conf)/2;
   ncplow = MAX(0,fnonct (F,df1,df2,prlow));
   ncpupp = MAX(0,fnonct (F,df1,df2,prupp));
    rsq = df1 * F / (df2 + df1 * F);
    rsqlow = ncplow / (ncplow + df1 + df2 + 1);
    rsqupp = ncpupp / (ncpupp + df1 + df2 + 1);
    cards;
15.233 2 18 .95
14.533 2 18 .95
23.433 4 18 .95
;
proc print;

run;

/*
Output looks like this:
Obs    F   df1 df2 conf prlow prupp  ncplow  ncpupp   rsq    rsqlow  rsqupp
 1  92.901  3  461  0.9  0.95  0.05 217.414 342.520 0.37678 0.31860 0.42416
*/
