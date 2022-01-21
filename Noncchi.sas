/*
This file produces a confidence interval for the noncentrality
parameter of a noncentral chi-square distribution.
The required input rows must contain the chi-square value, df, 
and desired confidence level. 
An example input row is given in the line below "cards;".
The last two parameters in the output are the lower limit (ncplow)
and upper limit (ncpupp) of the noncentrality parameter. 
*/
SYNTAX:
data x;
 input  chi df conf;
  prlow = 1-(1-conf)/2;
  prupp = (1-conf)/2;
   ncplow = MAX(0,cnonct (chi,df,prlow));
   ncpupp = MAX(0,cnonct (chi,df,prupp));
    cards;
17.3	3	.95
;
proc print;

run;

/*Output looks like this:
     Obs     chi    df    conf    prlow    prupp     ncplow     ncpupp
      1     17.3     3    0.95    0.975    0.025    3.39170    35.0140
*/