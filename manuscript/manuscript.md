---
title: "Morality, politics, and cooperation"
output:
  bookdown::html_document2:
    keep_md: yes
date: '16 December, 2021'
bibliography: references.bib
knit: worcs::cite_all
---






## Necessary deviations from preregistration

When attempting to conduct the preregistered analyses,
the model did not converge in one of the datasets (NL).
We examined individual CFAs for the included scales to determine potential
sources of misspecification.
These analyses indicated that the scale `secs_eco` in that dataset
had no factors with Eigenvalues greater than would be expected by random chance (see column 'Factors', which is based on Horn's parallel analysis, 1965),
and had poor reliability (estimated using McDonald's Omega, which is calculated from the factor loadings and does not assume that all factor loadings are identical as Cronbach's alpha does).
After deleting this scale, the CFA model converged.
It was therefore deemed necessary to remove this scale. 

<table class="table table-striped table-hover" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:tabscale)Scale reliability dk</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:left;"> Subscale </th>
   <th style="text-align:left;"> Items </th>
   <th style="text-align:left;"> n </th>
   <th style="text-align:left;"> chisq </th>
   <th style="text-align:left;"> cfi </th>
   <th style="text-align:left;"> tli </th>
   <th style="text-align:left;"> rmsea </th>
   <th style="text-align:left;"> srmr </th>
   <th style="text-align:left;"> min_load </th>
   <th style="text-align:left;"> max_load </th>
   <th style="text-align:left;"> min_r2 </th>
   <th style="text-align:left;"> max_r2 </th>
   <th style="text-align:left;"> omega </th>
   <th style="text-align:left;"> Reliability </th>
   <th style="text-align:left;"> Factors </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> sepa_soc </td>
   <td style="text-align:left;"> sepa_soc </td>
   <td style="text-align:left;"> 5 </td>
   <td style="text-align:left;"> 552 </td>
   <td style="text-align:left;"> 7.163 </td>
   <td style="text-align:left;"> 0.997 </td>
   <td style="text-align:left;"> 0.995 </td>
   <td style="text-align:left;"> 0.028 </td>
   <td style="text-align:left;"> 0.016 </td>
   <td style="text-align:left;"> 0.456 </td>
   <td style="text-align:left;"> 0.837 </td>
   <td style="text-align:left;"> 0.208 </td>
   <td style="text-align:left;"> 0.700 </td>
   <td style="text-align:left;"> 0.801 </td>
   <td style="text-align:left;"> Good </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> sepa_eco </td>
   <td style="text-align:left;"> sepa_eco </td>
   <td style="text-align:left;"> 5 </td>
   <td style="text-align:left;"> 552 </td>
   <td style="text-align:left;"> 306.531 </td>
   <td style="text-align:left;"> 0.695 </td>
   <td style="text-align:left;"> 0.389 </td>
   <td style="text-align:left;"> 0.331 </td>
   <td style="text-align:left;"> 0.121 </td>
   <td style="text-align:left;"> 0.554 </td>
   <td style="text-align:left;"> 0.724 </td>
   <td style="text-align:left;"> 0.307 </td>
   <td style="text-align:left;"> 0.524 </td>
   <td style="text-align:left;"> 0.790 </td>
   <td style="text-align:left;"> Acceptable </td>
   <td style="text-align:left;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> fam </td>
   <td style="text-align:left;"> fam </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 552 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.748 </td>
   <td style="text-align:left;"> 0.763 </td>
   <td style="text-align:left;"> 0.560 </td>
   <td style="text-align:left;"> 0.581 </td>
   <td style="text-align:left;"> 0.799 </td>
   <td style="text-align:left;"> Acceptable </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> grp </td>
   <td style="text-align:left;"> grp </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 552 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.600 </td>
   <td style="text-align:left;"> 0.732 </td>
   <td style="text-align:left;"> 0.360 </td>
   <td style="text-align:left;"> 0.536 </td>
   <td style="text-align:left;"> 0.710 </td>
   <td style="text-align:left;"> Acceptable </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> rec </td>
   <td style="text-align:left;"> rec </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 552 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.550 </td>
   <td style="text-align:left;"> 0.732 </td>
   <td style="text-align:left;"> 0.302 </td>
   <td style="text-align:left;"> 0.535 </td>
   <td style="text-align:left;"> 0.703 </td>
   <td style="text-align:left;"> Acceptable </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> her </td>
   <td style="text-align:left;"> her </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 552 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.579 </td>
   <td style="text-align:left;"> 0.814 </td>
   <td style="text-align:left;"> 0.335 </td>
   <td style="text-align:left;"> 0.662 </td>
   <td style="text-align:left;"> 0.698 </td>
   <td style="text-align:left;"> Questionable </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> def </td>
   <td style="text-align:left;"> def </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 552 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.372 </td>
   <td style="text-align:left;"> 0.769 </td>
   <td style="text-align:left;"> 0.138 </td>
   <td style="text-align:left;"> 0.592 </td>
   <td style="text-align:left;"> 0.660 </td>
   <td style="text-align:left;"> Questionable </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> fai </td>
   <td style="text-align:left;"> fai </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 552 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.542 </td>
   <td style="text-align:left;"> 0.788 </td>
   <td style="text-align:left;"> 0.294 </td>
   <td style="text-align:left;"> 0.620 </td>
   <td style="text-align:left;"> 0.691 </td>
   <td style="text-align:left;"> Questionable </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> pro </td>
   <td style="text-align:left;"> pro </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 552 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.332 </td>
   <td style="text-align:left;"> 0.693 </td>
   <td style="text-align:left;"> 0.110 </td>
   <td style="text-align:left;"> 0.481 </td>
   <td style="text-align:left;"> 0.514 </td>
   <td style="text-align:left;"> Poor </td>
   <td style="text-align:left;"> 0 </td>
  </tr>
</tbody>
</table><table class="table table-striped table-hover" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:tabscale)Scale reliability us</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:left;"> Subscale </th>
   <th style="text-align:left;"> Items </th>
   <th style="text-align:left;"> n </th>
   <th style="text-align:left;"> chisq </th>
   <th style="text-align:left;"> cfi </th>
   <th style="text-align:left;"> tli </th>
   <th style="text-align:left;"> rmsea </th>
   <th style="text-align:left;"> srmr </th>
   <th style="text-align:left;"> min_load </th>
   <th style="text-align:left;"> max_load </th>
   <th style="text-align:left;"> min_r2 </th>
   <th style="text-align:left;"> max_r2 </th>
   <th style="text-align:left;"> omega </th>
   <th style="text-align:left;"> Reliability </th>
   <th style="text-align:left;"> Factors </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> secs_soc </td>
   <td style="text-align:left;"> secs_soc </td>
   <td style="text-align:left;"> 7 </td>
   <td style="text-align:left;"> 518 </td>
   <td style="text-align:left;"> 253.328 </td>
   <td style="text-align:left;"> 0.857 </td>
   <td style="text-align:left;"> 0.786 </td>
   <td style="text-align:left;"> 0.182 </td>
   <td style="text-align:left;"> 0.072 </td>
   <td style="text-align:left;"> 0.227 </td>
   <td style="text-align:left;"> 0.882 </td>
   <td style="text-align:left;"> 0.051 </td>
   <td style="text-align:left;"> 0.779 </td>
   <td style="text-align:left;"> 0.838 </td>
   <td style="text-align:left;"> Good </td>
   <td style="text-align:left;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> secs_eco </td>
   <td style="text-align:left;"> secs_eco </td>
   <td style="text-align:left;"> 5 </td>
   <td style="text-align:left;"> 518 </td>
   <td style="text-align:left;"> 91.387 </td>
   <td style="text-align:left;"> 0.754 </td>
   <td style="text-align:left;"> 0.507 </td>
   <td style="text-align:left;"> 0.183 </td>
   <td style="text-align:left;"> 0.092 </td>
   <td style="text-align:left;"> 0.054 </td>
   <td style="text-align:left;"> 0.773 </td>
   <td style="text-align:left;"> 0.003 </td>
   <td style="text-align:left;"> 0.597 </td>
   <td style="text-align:left;"> 0.589 </td>
   <td style="text-align:left;"> Poor </td>
   <td style="text-align:left;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> fam </td>
   <td style="text-align:left;"> fam </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 518 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.800 </td>
   <td style="text-align:left;"> 0.891 </td>
   <td style="text-align:left;"> 0.639 </td>
   <td style="text-align:left;"> 0.794 </td>
   <td style="text-align:left;"> 0.871 </td>
   <td style="text-align:left;"> Good </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> grp </td>
   <td style="text-align:left;"> grp </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 518 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.549 </td>
   <td style="text-align:left;"> 0.871 </td>
   <td style="text-align:left;"> 0.301 </td>
   <td style="text-align:left;"> 0.759 </td>
   <td style="text-align:left;"> 0.769 </td>
   <td style="text-align:left;"> Acceptable </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> rec </td>
   <td style="text-align:left;"> rec </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 518 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.599 </td>
   <td style="text-align:left;"> 0.801 </td>
   <td style="text-align:left;"> 0.358 </td>
   <td style="text-align:left;"> 0.641 </td>
   <td style="text-align:left;"> 0.715 </td>
   <td style="text-align:left;"> Acceptable </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> her </td>
   <td style="text-align:left;"> her </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 518 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.660 </td>
   <td style="text-align:left;"> 0.784 </td>
   <td style="text-align:left;"> 0.435 </td>
   <td style="text-align:left;"> 0.615 </td>
   <td style="text-align:left;"> 0.792 </td>
   <td style="text-align:left;"> Acceptable </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> def </td>
   <td style="text-align:left;"> def </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 518 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.633 </td>
   <td style="text-align:left;"> 0.742 </td>
   <td style="text-align:left;"> 0.400 </td>
   <td style="text-align:left;"> 0.551 </td>
   <td style="text-align:left;"> 0.716 </td>
   <td style="text-align:left;"> Acceptable </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> fai </td>
   <td style="text-align:left;"> fai </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 518 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.441 </td>
   <td style="text-align:left;"> 0.799 </td>
   <td style="text-align:left;"> 0.194 </td>
   <td style="text-align:left;"> 0.639 </td>
   <td style="text-align:left;"> 0.668 </td>
   <td style="text-align:left;"> Questionable </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> pro </td>
   <td style="text-align:left;"> pro </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 518 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.525 </td>
   <td style="text-align:left;"> 0.825 </td>
   <td style="text-align:left;"> 0.276 </td>
   <td style="text-align:left;"> 0.681 </td>
   <td style="text-align:left;"> 0.721 </td>
   <td style="text-align:left;"> Acceptable </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
</tbody>
</table><table class="table table-striped table-hover" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:tabscale)Scale reliability nl</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:left;"> Subscale </th>
   <th style="text-align:left;"> Items </th>
   <th style="text-align:left;"> n </th>
   <th style="text-align:left;"> chisq </th>
   <th style="text-align:left;"> cfi </th>
   <th style="text-align:left;"> tli </th>
   <th style="text-align:left;"> rmsea </th>
   <th style="text-align:left;"> srmr </th>
   <th style="text-align:left;"> min_load </th>
   <th style="text-align:left;"> max_load </th>
   <th style="text-align:left;"> min_r2 </th>
   <th style="text-align:left;"> max_r2 </th>
   <th style="text-align:left;"> omega </th>
   <th style="text-align:left;"> Reliability </th>
   <th style="text-align:left;"> Factors </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> sepa_soc </td>
   <td style="text-align:left;"> sepa_soc </td>
   <td style="text-align:left;"> 5 </td>
   <td style="text-align:left;"> 353 </td>
   <td style="text-align:left;"> 38.249 </td>
   <td style="text-align:left;"> 0.858 </td>
   <td style="text-align:left;"> 0.715 </td>
   <td style="text-align:left;"> 0.137 </td>
   <td style="text-align:left;"> 0.067 </td>
   <td style="text-align:left;"> 0.242 </td>
   <td style="text-align:left;"> 0.673 </td>
   <td style="text-align:left;"> 0.059 </td>
   <td style="text-align:left;"> 0.452 </td>
   <td style="text-align:left;"> 0.649 </td>
   <td style="text-align:left;"> Questionable </td>
   <td style="text-align:left;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> sepa_eco </td>
   <td style="text-align:left;"> sepa_eco </td>
   <td style="text-align:left;"> 5 </td>
   <td style="text-align:left;"> 353 </td>
   <td style="text-align:left;"> 26.922 </td>
   <td style="text-align:left;"> 0.948 </td>
   <td style="text-align:left;"> 0.896 </td>
   <td style="text-align:left;"> 0.111 </td>
   <td style="text-align:left;"> 0.047 </td>
   <td style="text-align:left;"> 0.517 </td>
   <td style="text-align:left;"> 0.799 </td>
   <td style="text-align:left;"> 0.267 </td>
   <td style="text-align:left;"> 0.639 </td>
   <td style="text-align:left;"> 0.768 </td>
   <td style="text-align:left;"> Acceptable </td>
   <td style="text-align:left;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> secs_soc </td>
   <td style="text-align:left;"> secs_soc </td>
   <td style="text-align:left;"> 7 </td>
   <td style="text-align:left;"> 348 </td>
   <td style="text-align:left;"> 76.927 </td>
   <td style="text-align:left;"> 0.871 </td>
   <td style="text-align:left;"> 0.807 </td>
   <td style="text-align:left;"> 0.114 </td>
   <td style="text-align:left;"> 0.067 </td>
   <td style="text-align:left;"> 0.373 </td>
   <td style="text-align:left;"> 0.861 </td>
   <td style="text-align:left;"> 0.139 </td>
   <td style="text-align:left;"> 0.741 </td>
   <td style="text-align:left;"> 0.741 </td>
   <td style="text-align:left;"> Acceptable </td>
   <td style="text-align:left;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> secs_eco </td>
   <td style="text-align:left;"> secs_eco </td>
   <td style="text-align:left;"> 5 </td>
   <td style="text-align:left;"> 345 </td>
   <td style="text-align:left;"> 28.186 </td>
   <td style="text-align:left;"> 0.539 </td>
   <td style="text-align:left;"> 0.078 </td>
   <td style="text-align:left;"> 0.116 </td>
   <td style="text-align:left;"> 0.069 </td>
   <td style="text-align:left;"> -0.603 </td>
   <td style="text-align:left;"> -0.081 </td>
   <td style="text-align:left;"> 0.007 </td>
   <td style="text-align:left;"> 0.364 </td>
   <td style="text-align:left;"> 0.306 </td>
   <td style="text-align:left;"> Unacceptable </td>
   <td style="text-align:left;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> fam </td>
   <td style="text-align:left;"> fam </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 350 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.789 </td>
   <td style="text-align:left;"> 0.858 </td>
   <td style="text-align:left;"> 0.623 </td>
   <td style="text-align:left;"> 0.737 </td>
   <td style="text-align:left;"> 0.856 </td>
   <td style="text-align:left;"> Good </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> grp </td>
   <td style="text-align:left;"> grp </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 350 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.540 </td>
   <td style="text-align:left;"> 0.921 </td>
   <td style="text-align:left;"> 0.291 </td>
   <td style="text-align:left;"> 0.848 </td>
   <td style="text-align:left;"> 0.744 </td>
   <td style="text-align:left;"> Acceptable </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> rec </td>
   <td style="text-align:left;"> rec </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 350 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.404 </td>
   <td style="text-align:left;"> 0.829 </td>
   <td style="text-align:left;"> 0.163 </td>
   <td style="text-align:left;"> 0.688 </td>
   <td style="text-align:left;"> 0.687 </td>
   <td style="text-align:left;"> Questionable </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> her </td>
   <td style="text-align:left;"> her </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 350 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.339 </td>
   <td style="text-align:left;"> 0.630 </td>
   <td style="text-align:left;"> 0.115 </td>
   <td style="text-align:left;"> 0.397 </td>
   <td style="text-align:left;"> 0.484 </td>
   <td style="text-align:left;"> Unacceptable </td>
   <td style="text-align:left;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> def </td>
   <td style="text-align:left;"> def </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 350 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.359 </td>
   <td style="text-align:left;"> 0.783 </td>
   <td style="text-align:left;"> 0.129 </td>
   <td style="text-align:left;"> 0.613 </td>
   <td style="text-align:left;"> 0.560 </td>
   <td style="text-align:left;"> Poor </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> fai </td>
   <td style="text-align:left;"> fai </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 351 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.426 </td>
   <td style="text-align:left;"> 0.736 </td>
   <td style="text-align:left;"> 0.182 </td>
   <td style="text-align:left;"> 0.542 </td>
   <td style="text-align:left;"> 0.592 </td>
   <td style="text-align:left;"> Poor </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> pro </td>
   <td style="text-align:left;"> pro </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 349 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.453 </td>
   <td style="text-align:left;"> 0.870 </td>
   <td style="text-align:left;"> 0.205 </td>
   <td style="text-align:left;"> 0.756 </td>
   <td style="text-align:left;"> 0.622 </td>
   <td style="text-align:left;"> Questionable </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
</tbody>
</table>

<!-- To understand these issues better, we performed exploratory factor analysis on scales that showed indications of being non-unidimensional in at least one country. -->



<!-- These factor analyses suggest that items 3-5 of sepa_soc loaded most consistently on the same factor. -->
<!-- Similarly, items 1-3 of sepa_eco loaded most consistently on the same factor. -->
<!-- For secs_soc, only items 4-5 loaded consistently high on the same factor. -->
<!-- For secs_eco, no items loaded consistently high on the same factor. -->
<!-- We removed items not consistently loading on one factor, -->
<!-- and dropped secs_eco entirely. -->
<!-- We applied these changes consistently across countries. -->





<table class="table table-striped table-hover" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:tabscaleuse)Scale reliability dk</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:left;"> Subscale </th>
   <th style="text-align:left;"> Items </th>
   <th style="text-align:left;"> n </th>
   <th style="text-align:left;"> chisq </th>
   <th style="text-align:left;"> cfi </th>
   <th style="text-align:left;"> tli </th>
   <th style="text-align:left;"> rmsea </th>
   <th style="text-align:left;"> srmr </th>
   <th style="text-align:left;"> min_load </th>
   <th style="text-align:left;"> max_load </th>
   <th style="text-align:left;"> min_r2 </th>
   <th style="text-align:left;"> max_r2 </th>
   <th style="text-align:left;"> omega </th>
   <th style="text-align:left;"> Reliability </th>
   <th style="text-align:left;"> Factors </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> sepa_soc </td>
   <td style="text-align:left;"> sepa_soc </td>
   <td style="text-align:left;"> 5 </td>
   <td style="text-align:left;"> 552 </td>
   <td style="text-align:left;"> 7.163 </td>
   <td style="text-align:left;"> 0.997 </td>
   <td style="text-align:left;"> 0.995 </td>
   <td style="text-align:left;"> 0.028 </td>
   <td style="text-align:left;"> 0.016 </td>
   <td style="text-align:left;"> 0.456 </td>
   <td style="text-align:left;"> 0.837 </td>
   <td style="text-align:left;"> 0.208 </td>
   <td style="text-align:left;"> 0.700 </td>
   <td style="text-align:left;"> 0.801 </td>
   <td style="text-align:left;"> Good </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> sepa_eco </td>
   <td style="text-align:left;"> sepa_eco </td>
   <td style="text-align:left;"> 5 </td>
   <td style="text-align:left;"> 552 </td>
   <td style="text-align:left;"> 306.531 </td>
   <td style="text-align:left;"> 0.695 </td>
   <td style="text-align:left;"> 0.389 </td>
   <td style="text-align:left;"> 0.331 </td>
   <td style="text-align:left;"> 0.121 </td>
   <td style="text-align:left;"> 0.554 </td>
   <td style="text-align:left;"> 0.724 </td>
   <td style="text-align:left;"> 0.307 </td>
   <td style="text-align:left;"> 0.524 </td>
   <td style="text-align:left;"> 0.790 </td>
   <td style="text-align:left;"> Acceptable </td>
   <td style="text-align:left;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> fam </td>
   <td style="text-align:left;"> fam </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 552 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.748 </td>
   <td style="text-align:left;"> 0.763 </td>
   <td style="text-align:left;"> 0.560 </td>
   <td style="text-align:left;"> 0.581 </td>
   <td style="text-align:left;"> 0.799 </td>
   <td style="text-align:left;"> Acceptable </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> grp </td>
   <td style="text-align:left;"> grp </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 552 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.600 </td>
   <td style="text-align:left;"> 0.732 </td>
   <td style="text-align:left;"> 0.360 </td>
   <td style="text-align:left;"> 0.536 </td>
   <td style="text-align:left;"> 0.710 </td>
   <td style="text-align:left;"> Acceptable </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> rec </td>
   <td style="text-align:left;"> rec </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 552 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.550 </td>
   <td style="text-align:left;"> 0.732 </td>
   <td style="text-align:left;"> 0.302 </td>
   <td style="text-align:left;"> 0.535 </td>
   <td style="text-align:left;"> 0.703 </td>
   <td style="text-align:left;"> Acceptable </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> her </td>
   <td style="text-align:left;"> her </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 552 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.579 </td>
   <td style="text-align:left;"> 0.814 </td>
   <td style="text-align:left;"> 0.335 </td>
   <td style="text-align:left;"> 0.662 </td>
   <td style="text-align:left;"> 0.698 </td>
   <td style="text-align:left;"> Questionable </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> def </td>
   <td style="text-align:left;"> def </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 552 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.372 </td>
   <td style="text-align:left;"> 0.769 </td>
   <td style="text-align:left;"> 0.138 </td>
   <td style="text-align:left;"> 0.592 </td>
   <td style="text-align:left;"> 0.660 </td>
   <td style="text-align:left;"> Questionable </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> fai </td>
   <td style="text-align:left;"> fai </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 552 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.542 </td>
   <td style="text-align:left;"> 0.788 </td>
   <td style="text-align:left;"> 0.294 </td>
   <td style="text-align:left;"> 0.620 </td>
   <td style="text-align:left;"> 0.691 </td>
   <td style="text-align:left;"> Questionable </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> pro </td>
   <td style="text-align:left;"> pro </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 552 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.332 </td>
   <td style="text-align:left;"> 0.693 </td>
   <td style="text-align:left;"> 0.110 </td>
   <td style="text-align:left;"> 0.481 </td>
   <td style="text-align:left;"> 0.514 </td>
   <td style="text-align:left;"> Poor </td>
   <td style="text-align:left;"> 0 </td>
  </tr>
</tbody>
</table><table class="table table-striped table-hover" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:tabscaleuse)Scale reliability us</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:left;"> Subscale </th>
   <th style="text-align:left;"> Items </th>
   <th style="text-align:left;"> n </th>
   <th style="text-align:left;"> chisq </th>
   <th style="text-align:left;"> cfi </th>
   <th style="text-align:left;"> tli </th>
   <th style="text-align:left;"> rmsea </th>
   <th style="text-align:left;"> srmr </th>
   <th style="text-align:left;"> min_load </th>
   <th style="text-align:left;"> max_load </th>
   <th style="text-align:left;"> min_r2 </th>
   <th style="text-align:left;"> max_r2 </th>
   <th style="text-align:left;"> omega </th>
   <th style="text-align:left;"> Reliability </th>
   <th style="text-align:left;"> Factors </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> secs_soc </td>
   <td style="text-align:left;"> secs_soc </td>
   <td style="text-align:left;"> 7 </td>
   <td style="text-align:left;"> 518 </td>
   <td style="text-align:left;"> 253.328 </td>
   <td style="text-align:left;"> 0.857 </td>
   <td style="text-align:left;"> 0.786 </td>
   <td style="text-align:left;"> 0.182 </td>
   <td style="text-align:left;"> 0.072 </td>
   <td style="text-align:left;"> 0.227 </td>
   <td style="text-align:left;"> 0.882 </td>
   <td style="text-align:left;"> 0.051 </td>
   <td style="text-align:left;"> 0.779 </td>
   <td style="text-align:left;"> 0.838 </td>
   <td style="text-align:left;"> Good </td>
   <td style="text-align:left;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> secs_eco </td>
   <td style="text-align:left;"> secs_eco </td>
   <td style="text-align:left;"> 5 </td>
   <td style="text-align:left;"> 518 </td>
   <td style="text-align:left;"> 91.387 </td>
   <td style="text-align:left;"> 0.754 </td>
   <td style="text-align:left;"> 0.507 </td>
   <td style="text-align:left;"> 0.183 </td>
   <td style="text-align:left;"> 0.092 </td>
   <td style="text-align:left;"> 0.054 </td>
   <td style="text-align:left;"> 0.773 </td>
   <td style="text-align:left;"> 0.003 </td>
   <td style="text-align:left;"> 0.597 </td>
   <td style="text-align:left;"> 0.589 </td>
   <td style="text-align:left;"> Poor </td>
   <td style="text-align:left;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> fam </td>
   <td style="text-align:left;"> fam </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 518 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.800 </td>
   <td style="text-align:left;"> 0.891 </td>
   <td style="text-align:left;"> 0.639 </td>
   <td style="text-align:left;"> 0.794 </td>
   <td style="text-align:left;"> 0.871 </td>
   <td style="text-align:left;"> Good </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> grp </td>
   <td style="text-align:left;"> grp </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 518 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.549 </td>
   <td style="text-align:left;"> 0.871 </td>
   <td style="text-align:left;"> 0.301 </td>
   <td style="text-align:left;"> 0.759 </td>
   <td style="text-align:left;"> 0.769 </td>
   <td style="text-align:left;"> Acceptable </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> rec </td>
   <td style="text-align:left;"> rec </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 518 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.599 </td>
   <td style="text-align:left;"> 0.801 </td>
   <td style="text-align:left;"> 0.358 </td>
   <td style="text-align:left;"> 0.641 </td>
   <td style="text-align:left;"> 0.715 </td>
   <td style="text-align:left;"> Acceptable </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> her </td>
   <td style="text-align:left;"> her </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 518 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.660 </td>
   <td style="text-align:left;"> 0.784 </td>
   <td style="text-align:left;"> 0.435 </td>
   <td style="text-align:left;"> 0.615 </td>
   <td style="text-align:left;"> 0.792 </td>
   <td style="text-align:left;"> Acceptable </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> def </td>
   <td style="text-align:left;"> def </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 518 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.633 </td>
   <td style="text-align:left;"> 0.742 </td>
   <td style="text-align:left;"> 0.400 </td>
   <td style="text-align:left;"> 0.551 </td>
   <td style="text-align:left;"> 0.716 </td>
   <td style="text-align:left;"> Acceptable </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> fai </td>
   <td style="text-align:left;"> fai </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 518 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.441 </td>
   <td style="text-align:left;"> 0.799 </td>
   <td style="text-align:left;"> 0.194 </td>
   <td style="text-align:left;"> 0.639 </td>
   <td style="text-align:left;"> 0.668 </td>
   <td style="text-align:left;"> Questionable </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> pro </td>
   <td style="text-align:left;"> pro </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 518 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.525 </td>
   <td style="text-align:left;"> 0.825 </td>
   <td style="text-align:left;"> 0.276 </td>
   <td style="text-align:left;"> 0.681 </td>
   <td style="text-align:left;"> 0.721 </td>
   <td style="text-align:left;"> Acceptable </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
</tbody>
</table><table class="table table-striped table-hover" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:tabscaleuse)Scale reliability nl</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:left;"> Subscale </th>
   <th style="text-align:left;"> Items </th>
   <th style="text-align:left;"> n </th>
   <th style="text-align:left;"> chisq </th>
   <th style="text-align:left;"> cfi </th>
   <th style="text-align:left;"> tli </th>
   <th style="text-align:left;"> rmsea </th>
   <th style="text-align:left;"> srmr </th>
   <th style="text-align:left;"> min_load </th>
   <th style="text-align:left;"> max_load </th>
   <th style="text-align:left;"> min_r2 </th>
   <th style="text-align:left;"> max_r2 </th>
   <th style="text-align:left;"> omega </th>
   <th style="text-align:left;"> Reliability </th>
   <th style="text-align:left;"> Factors </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> sepa_soc </td>
   <td style="text-align:left;"> sepa_soc </td>
   <td style="text-align:left;"> 5 </td>
   <td style="text-align:left;"> 353 </td>
   <td style="text-align:left;"> 38.249 </td>
   <td style="text-align:left;"> 0.858 </td>
   <td style="text-align:left;"> 0.715 </td>
   <td style="text-align:left;"> 0.137 </td>
   <td style="text-align:left;"> 0.067 </td>
   <td style="text-align:left;"> 0.242 </td>
   <td style="text-align:left;"> 0.673 </td>
   <td style="text-align:left;"> 0.059 </td>
   <td style="text-align:left;"> 0.452 </td>
   <td style="text-align:left;"> 0.649 </td>
   <td style="text-align:left;"> Questionable </td>
   <td style="text-align:left;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> sepa_eco </td>
   <td style="text-align:left;"> sepa_eco </td>
   <td style="text-align:left;"> 5 </td>
   <td style="text-align:left;"> 353 </td>
   <td style="text-align:left;"> 26.922 </td>
   <td style="text-align:left;"> 0.948 </td>
   <td style="text-align:left;"> 0.896 </td>
   <td style="text-align:left;"> 0.111 </td>
   <td style="text-align:left;"> 0.047 </td>
   <td style="text-align:left;"> 0.517 </td>
   <td style="text-align:left;"> 0.799 </td>
   <td style="text-align:left;"> 0.267 </td>
   <td style="text-align:left;"> 0.639 </td>
   <td style="text-align:left;"> 0.768 </td>
   <td style="text-align:left;"> Acceptable </td>
   <td style="text-align:left;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> secs_soc </td>
   <td style="text-align:left;"> secs_soc </td>
   <td style="text-align:left;"> 7 </td>
   <td style="text-align:left;"> 348 </td>
   <td style="text-align:left;"> 76.927 </td>
   <td style="text-align:left;"> 0.871 </td>
   <td style="text-align:left;"> 0.807 </td>
   <td style="text-align:left;"> 0.114 </td>
   <td style="text-align:left;"> 0.067 </td>
   <td style="text-align:left;"> 0.373 </td>
   <td style="text-align:left;"> 0.861 </td>
   <td style="text-align:left;"> 0.139 </td>
   <td style="text-align:left;"> 0.741 </td>
   <td style="text-align:left;"> 0.741 </td>
   <td style="text-align:left;"> Acceptable </td>
   <td style="text-align:left;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> fam </td>
   <td style="text-align:left;"> fam </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 350 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.789 </td>
   <td style="text-align:left;"> 0.858 </td>
   <td style="text-align:left;"> 0.623 </td>
   <td style="text-align:left;"> 0.737 </td>
   <td style="text-align:left;"> 0.856 </td>
   <td style="text-align:left;"> Good </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> grp </td>
   <td style="text-align:left;"> grp </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 350 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.540 </td>
   <td style="text-align:left;"> 0.921 </td>
   <td style="text-align:left;"> 0.291 </td>
   <td style="text-align:left;"> 0.848 </td>
   <td style="text-align:left;"> 0.744 </td>
   <td style="text-align:left;"> Acceptable </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> rec </td>
   <td style="text-align:left;"> rec </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 350 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.404 </td>
   <td style="text-align:left;"> 0.829 </td>
   <td style="text-align:left;"> 0.163 </td>
   <td style="text-align:left;"> 0.688 </td>
   <td style="text-align:left;"> 0.687 </td>
   <td style="text-align:left;"> Questionable </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> her </td>
   <td style="text-align:left;"> her </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 350 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.339 </td>
   <td style="text-align:left;"> 0.630 </td>
   <td style="text-align:left;"> 0.115 </td>
   <td style="text-align:left;"> 0.397 </td>
   <td style="text-align:left;"> 0.484 </td>
   <td style="text-align:left;"> Unacceptable </td>
   <td style="text-align:left;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> def </td>
   <td style="text-align:left;"> def </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 350 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.359 </td>
   <td style="text-align:left;"> 0.783 </td>
   <td style="text-align:left;"> 0.129 </td>
   <td style="text-align:left;"> 0.613 </td>
   <td style="text-align:left;"> 0.560 </td>
   <td style="text-align:left;"> Poor </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> fai </td>
   <td style="text-align:left;"> fai </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 351 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.426 </td>
   <td style="text-align:left;"> 0.736 </td>
   <td style="text-align:left;"> 0.182 </td>
   <td style="text-align:left;"> 0.542 </td>
   <td style="text-align:left;"> 0.592 </td>
   <td style="text-align:left;"> Poor </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> pro </td>
   <td style="text-align:left;"> pro </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 349 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 1.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.000 </td>
   <td style="text-align:left;"> 0.453 </td>
   <td style="text-align:left;"> 0.870 </td>
   <td style="text-align:left;"> 0.205 </td>
   <td style="text-align:left;"> 0.756 </td>
   <td style="text-align:left;"> 0.622 </td>
   <td style="text-align:left;"> Questionable </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
</tbody>
</table>

We further examined measurement invariance across countries,
and found that metric invariance did not hold for these scales: sepa_soc, grp, her, def.
This lack of measurement invariance must be taken into account when aggregating evidence across countries.

<table class="table table-striped table-hover" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:tabinvar)Measurement invariance tests for the difference between a configural and metrically invariant model.</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> sepa_soc </th>
   <th style="text-align:right;"> sepa_eco </th>
   <th style="text-align:right;"> fam </th>
   <th style="text-align:right;"> grp </th>
   <th style="text-align:right;"> rec </th>
   <th style="text-align:right;"> her </th>
   <th style="text-align:right;"> def </th>
   <th style="text-align:right;"> fai </th>
   <th style="text-align:right;"> pro </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Chisq diff </td>
   <td style="text-align:right;"> 10.219 </td>
   <td style="text-align:right;"> 8.579 </td>
   <td style="text-align:right;"> 5.536 </td>
   <td style="text-align:right;"> 30.549 </td>
   <td style="text-align:right;"> 9.306 </td>
   <td style="text-align:right;"> 9.986 </td>
   <td style="text-align:right;"> 14.183 </td>
   <td style="text-align:right;"> 2.767 </td>
   <td style="text-align:right;"> 7.77 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Df diff </td>
   <td style="text-align:right;"> 4.000 </td>
   <td style="text-align:right;"> 4.000 </td>
   <td style="text-align:right;"> 4.000 </td>
   <td style="text-align:right;"> 4.000 </td>
   <td style="text-align:right;"> 4.000 </td>
   <td style="text-align:right;"> 4.000 </td>
   <td style="text-align:right;"> 4.000 </td>
   <td style="text-align:right;"> 4.000 </td>
   <td style="text-align:right;"> 4.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Pr(&gt;Chisq) </td>
   <td style="text-align:right;"> 0.037 </td>
   <td style="text-align:right;"> 0.073 </td>
   <td style="text-align:right;"> 0.237 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 0.054 </td>
   <td style="text-align:right;"> 0.041 </td>
   <td style="text-align:right;"> 0.007 </td>
   <td style="text-align:right;"> 0.598 </td>
   <td style="text-align:right;"> 0.10 </td>
  </tr>
</tbody>
</table>

## Planned analyses



First, we provide an overview of the latent variable correlations for each country.
These are the model parameters evaluated using the informative hypothesis tests below:



<table class="table table-striped table-hover" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:tabcors1)Latent variable correlations for nl</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:left;"> def </th>
   <th style="text-align:left;"> fai </th>
   <th style="text-align:left;"> fam </th>
   <th style="text-align:left;"> grp </th>
   <th style="text-align:left;"> her </th>
   <th style="text-align:left;"> pro </th>
   <th style="text-align:left;"> rec </th>
   <th style="text-align:left;"> secs_soc </th>
   <th style="text-align:left;"> sepa_eco </th>
   <th style="text-align:left;"> sepa_soc </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> def </td>
   <td style="text-align:left;"> 1.00 </td>
   <td style="text-align:left;"> -0.09 </td>
   <td style="text-align:left;"> 0.70*** </td>
   <td style="text-align:left;"> 0.44*** </td>
   <td style="text-align:left;"> 0.65*** </td>
   <td style="text-align:left;"> 0.10 </td>
   <td style="text-align:left;"> 0.35*** </td>
   <td style="text-align:left;"> 0.58*** </td>
   <td style="text-align:left;"> 0.25** </td>
   <td style="text-align:left;"> 0.45*** </td>
  </tr>
  <tr>
   <td style="text-align:left;"> fai </td>
   <td style="text-align:left;"> -0.09 </td>
   <td style="text-align:left;"> 1.00 </td>
   <td style="text-align:left;"> 0.03 </td>
   <td style="text-align:left;"> 0.23** </td>
   <td style="text-align:left;"> 0.04 </td>
   <td style="text-align:left;"> 0.15 </td>
   <td style="text-align:left;"> 0.31*** </td>
   <td style="text-align:left;"> -0.10 </td>
   <td style="text-align:left;"> -0.70*** </td>
   <td style="text-align:left;"> -0.61*** </td>
  </tr>
  <tr>
   <td style="text-align:left;"> fam </td>
   <td style="text-align:left;"> 0.70*** </td>
   <td style="text-align:left;"> 0.03 </td>
   <td style="text-align:left;"> 1.00 </td>
   <td style="text-align:left;"> 0.47*** </td>
   <td style="text-align:left;"> 0.40*** </td>
   <td style="text-align:left;"> 0.02 </td>
   <td style="text-align:left;"> 0.39*** </td>
   <td style="text-align:left;"> 0.44*** </td>
   <td style="text-align:left;"> 0.09 </td>
   <td style="text-align:left;"> 0.23*** </td>
  </tr>
  <tr>
   <td style="text-align:left;"> grp </td>
   <td style="text-align:left;"> 0.44*** </td>
   <td style="text-align:left;"> 0.23** </td>
   <td style="text-align:left;"> 0.47*** </td>
   <td style="text-align:left;"> 1.00 </td>
   <td style="text-align:left;"> 0.50*** </td>
   <td style="text-align:left;"> -0.23** </td>
   <td style="text-align:left;"> 0.56*** </td>
   <td style="text-align:left;"> 0.28*** </td>
   <td style="text-align:left;"> -0.05 </td>
   <td style="text-align:left;"> -0.03 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> her </td>
   <td style="text-align:left;"> 0.65*** </td>
   <td style="text-align:left;"> 0.04 </td>
   <td style="text-align:left;"> 0.40*** </td>
   <td style="text-align:left;"> 0.50*** </td>
   <td style="text-align:left;"> 1.00 </td>
   <td style="text-align:left;"> -0.31*** </td>
   <td style="text-align:left;"> 0.62*** </td>
   <td style="text-align:left;"> 0.38*** </td>
   <td style="text-align:left;"> 0.04 </td>
   <td style="text-align:left;"> 0.28** </td>
  </tr>
  <tr>
   <td style="text-align:left;"> pro </td>
   <td style="text-align:left;"> 0.10 </td>
   <td style="text-align:left;"> 0.15 </td>
   <td style="text-align:left;"> 0.02 </td>
   <td style="text-align:left;"> -0.23** </td>
   <td style="text-align:left;"> -0.31*** </td>
   <td style="text-align:left;"> 1.00 </td>
   <td style="text-align:left;"> -0.00 </td>
   <td style="text-align:left;"> 0.13 </td>
   <td style="text-align:left;"> 0.15* </td>
   <td style="text-align:left;"> 0.07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> rec </td>
   <td style="text-align:left;"> 0.35*** </td>
   <td style="text-align:left;"> 0.31*** </td>
   <td style="text-align:left;"> 0.39*** </td>
   <td style="text-align:left;"> 0.56*** </td>
   <td style="text-align:left;"> 0.62*** </td>
   <td style="text-align:left;"> -0.00 </td>
   <td style="text-align:left;"> 1.00 </td>
   <td style="text-align:left;"> 0.20** </td>
   <td style="text-align:left;"> -0.11 </td>
   <td style="text-align:left;"> 0.14 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> secs_soc </td>
   <td style="text-align:left;"> 0.58*** </td>
   <td style="text-align:left;"> -0.10 </td>
   <td style="text-align:left;"> 0.44*** </td>
   <td style="text-align:left;"> 0.28*** </td>
   <td style="text-align:left;"> 0.38*** </td>
   <td style="text-align:left;"> 0.13 </td>
   <td style="text-align:left;"> 0.20** </td>
   <td style="text-align:left;"> 1.00 </td>
   <td style="text-align:left;"> 0.26*** </td>
   <td style="text-align:left;"> 0.45*** </td>
  </tr>
  <tr>
   <td style="text-align:left;"> sepa_eco </td>
   <td style="text-align:left;"> 0.25** </td>
   <td style="text-align:left;"> -0.70*** </td>
   <td style="text-align:left;"> 0.09 </td>
   <td style="text-align:left;"> -0.05 </td>
   <td style="text-align:left;"> 0.04 </td>
   <td style="text-align:left;"> 0.15* </td>
   <td style="text-align:left;"> -0.11 </td>
   <td style="text-align:left;"> 0.26*** </td>
   <td style="text-align:left;"> 1.00 </td>
   <td style="text-align:left;"> 0.47*** </td>
  </tr>
  <tr>
   <td style="text-align:left;"> sepa_soc </td>
   <td style="text-align:left;"> 0.45*** </td>
   <td style="text-align:left;"> -0.61*** </td>
   <td style="text-align:left;"> 0.23*** </td>
   <td style="text-align:left;"> -0.03 </td>
   <td style="text-align:left;"> 0.28** </td>
   <td style="text-align:left;"> 0.07 </td>
   <td style="text-align:left;"> 0.14 </td>
   <td style="text-align:left;"> 0.45*** </td>
   <td style="text-align:left;"> 0.47*** </td>
   <td style="text-align:left;"> 1.00 </td>
  </tr>
</tbody>
</table>
<table class="table table-striped table-hover" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:tabcors2)Latent variable correlations for dk</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:left;"> def </th>
   <th style="text-align:left;"> fai </th>
   <th style="text-align:left;"> fam </th>
   <th style="text-align:left;"> grp </th>
   <th style="text-align:left;"> her </th>
   <th style="text-align:left;"> pro </th>
   <th style="text-align:left;"> rec </th>
   <th style="text-align:left;"> sepa_eco </th>
   <th style="text-align:left;"> sepa_soc </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> def </td>
   <td style="text-align:left;"> 1.00 </td>
   <td style="text-align:left;"> 0.16** </td>
   <td style="text-align:left;"> 0.59*** </td>
   <td style="text-align:left;"> 0.35*** </td>
   <td style="text-align:left;"> 0.59*** </td>
   <td style="text-align:left;"> 0.04 </td>
   <td style="text-align:left;"> 0.45*** </td>
   <td style="text-align:left;"> 0.03 </td>
   <td style="text-align:left;"> 0.47*** </td>
  </tr>
  <tr>
   <td style="text-align:left;"> fai </td>
   <td style="text-align:left;"> 0.16** </td>
   <td style="text-align:left;"> 1.00 </td>
   <td style="text-align:left;"> 0.29*** </td>
   <td style="text-align:left;"> 0.56*** </td>
   <td style="text-align:left;"> 0.31*** </td>
   <td style="text-align:left;"> 0.21** </td>
   <td style="text-align:left;"> 0.45*** </td>
   <td style="text-align:left;"> -0.81*** </td>
   <td style="text-align:left;"> -0.19*** </td>
  </tr>
  <tr>
   <td style="text-align:left;"> fam </td>
   <td style="text-align:left;"> 0.59*** </td>
   <td style="text-align:left;"> 0.29*** </td>
   <td style="text-align:left;"> 1.00 </td>
   <td style="text-align:left;"> 0.38*** </td>
   <td style="text-align:left;"> 0.53*** </td>
   <td style="text-align:left;"> 0.06 </td>
   <td style="text-align:left;"> 0.52*** </td>
   <td style="text-align:left;"> -0.09 </td>
   <td style="text-align:left;"> 0.39*** </td>
  </tr>
  <tr>
   <td style="text-align:left;"> grp </td>
   <td style="text-align:left;"> 0.35*** </td>
   <td style="text-align:left;"> 0.56*** </td>
   <td style="text-align:left;"> 0.38*** </td>
   <td style="text-align:left;"> 1.00 </td>
   <td style="text-align:left;"> 0.60*** </td>
   <td style="text-align:left;"> 0.23*** </td>
   <td style="text-align:left;"> 0.62*** </td>
   <td style="text-align:left;"> -0.30*** </td>
   <td style="text-align:left;"> -0.07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> her </td>
   <td style="text-align:left;"> 0.59*** </td>
   <td style="text-align:left;"> 0.31*** </td>
   <td style="text-align:left;"> 0.53*** </td>
   <td style="text-align:left;"> 0.60*** </td>
   <td style="text-align:left;"> 1.00 </td>
   <td style="text-align:left;"> 0.06 </td>
   <td style="text-align:left;"> 0.54*** </td>
   <td style="text-align:left;"> -0.12* </td>
   <td style="text-align:left;"> 0.41*** </td>
  </tr>
  <tr>
   <td style="text-align:left;"> pro </td>
   <td style="text-align:left;"> 0.04 </td>
   <td style="text-align:left;"> 0.21** </td>
   <td style="text-align:left;"> 0.06 </td>
   <td style="text-align:left;"> 0.23*** </td>
   <td style="text-align:left;"> 0.06 </td>
   <td style="text-align:left;"> 1.00 </td>
   <td style="text-align:left;"> 0.21** </td>
   <td style="text-align:left;"> 0.05 </td>
   <td style="text-align:left;"> -0.09 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> rec </td>
   <td style="text-align:left;"> 0.45*** </td>
   <td style="text-align:left;"> 0.45*** </td>
   <td style="text-align:left;"> 0.52*** </td>
   <td style="text-align:left;"> 0.62*** </td>
   <td style="text-align:left;"> 0.54*** </td>
   <td style="text-align:left;"> 0.21** </td>
   <td style="text-align:left;"> 1.00 </td>
   <td style="text-align:left;"> -0.22*** </td>
   <td style="text-align:left;"> 0.17** </td>
  </tr>
  <tr>
   <td style="text-align:left;"> sepa_eco </td>
   <td style="text-align:left;"> 0.03 </td>
   <td style="text-align:left;"> -0.81*** </td>
   <td style="text-align:left;"> -0.09 </td>
   <td style="text-align:left;"> -0.30*** </td>
   <td style="text-align:left;"> -0.12* </td>
   <td style="text-align:left;"> 0.05 </td>
   <td style="text-align:left;"> -0.22*** </td>
   <td style="text-align:left;"> 1.00 </td>
   <td style="text-align:left;"> 0.11* </td>
  </tr>
  <tr>
   <td style="text-align:left;"> sepa_soc </td>
   <td style="text-align:left;"> 0.47*** </td>
   <td style="text-align:left;"> -0.19*** </td>
   <td style="text-align:left;"> 0.39*** </td>
   <td style="text-align:left;"> -0.07 </td>
   <td style="text-align:left;"> 0.41*** </td>
   <td style="text-align:left;"> -0.09 </td>
   <td style="text-align:left;"> 0.17** </td>
   <td style="text-align:left;"> 0.11* </td>
   <td style="text-align:left;"> 1.00 </td>
  </tr>
</tbody>
</table>
<table class="table table-striped table-hover" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:tabcors3)Latent variable correlations for us</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:left;"> def </th>
   <th style="text-align:left;"> fai </th>
   <th style="text-align:left;"> fam </th>
   <th style="text-align:left;"> grp </th>
   <th style="text-align:left;"> her </th>
   <th style="text-align:left;"> pro </th>
   <th style="text-align:left;"> rec </th>
   <th style="text-align:left;"> secs_eco </th>
   <th style="text-align:left;"> secs_soc </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> def </td>
   <td style="text-align:left;"> 1.00 </td>
   <td style="text-align:left;"> 0.39*** </td>
   <td style="text-align:left;"> 0.81*** </td>
   <td style="text-align:left;"> 0.66*** </td>
   <td style="text-align:left;"> 0.80*** </td>
   <td style="text-align:left;"> -0.04 </td>
   <td style="text-align:left;"> 0.65*** </td>
   <td style="text-align:left;"> 0.45*** </td>
   <td style="text-align:left;"> 0.73*** </td>
  </tr>
  <tr>
   <td style="text-align:left;"> fai </td>
   <td style="text-align:left;"> 0.39*** </td>
   <td style="text-align:left;"> 1.00 </td>
   <td style="text-align:left;"> 0.40*** </td>
   <td style="text-align:left;"> 0.57*** </td>
   <td style="text-align:left;"> 0.48*** </td>
   <td style="text-align:left;"> 0.11* </td>
   <td style="text-align:left;"> 0.65*** </td>
   <td style="text-align:left;"> 0.01 </td>
   <td style="text-align:left;"> 0.17** </td>
  </tr>
  <tr>
   <td style="text-align:left;"> fam </td>
   <td style="text-align:left;"> 0.81*** </td>
   <td style="text-align:left;"> 0.40*** </td>
   <td style="text-align:left;"> 1.00 </td>
   <td style="text-align:left;"> 0.60*** </td>
   <td style="text-align:left;"> 0.68*** </td>
   <td style="text-align:left;"> -0.04 </td>
   <td style="text-align:left;"> 0.67*** </td>
   <td style="text-align:left;"> 0.39*** </td>
   <td style="text-align:left;"> 0.63*** </td>
  </tr>
  <tr>
   <td style="text-align:left;"> grp </td>
   <td style="text-align:left;"> 0.66*** </td>
   <td style="text-align:left;"> 0.57*** </td>
   <td style="text-align:left;"> 0.60*** </td>
   <td style="text-align:left;"> 1.00 </td>
   <td style="text-align:left;"> 0.74*** </td>
   <td style="text-align:left;"> -0.12* </td>
   <td style="text-align:left;"> 0.81*** </td>
   <td style="text-align:left;"> 0.35*** </td>
   <td style="text-align:left;"> 0.47*** </td>
  </tr>
  <tr>
   <td style="text-align:left;"> her </td>
   <td style="text-align:left;"> 0.80*** </td>
   <td style="text-align:left;"> 0.48*** </td>
   <td style="text-align:left;"> 0.68*** </td>
   <td style="text-align:left;"> 0.74*** </td>
   <td style="text-align:left;"> 1.00 </td>
   <td style="text-align:left;"> 0.10 </td>
   <td style="text-align:left;"> 0.76*** </td>
   <td style="text-align:left;"> 0.52*** </td>
   <td style="text-align:left;"> 0.69*** </td>
  </tr>
  <tr>
   <td style="text-align:left;"> pro </td>
   <td style="text-align:left;"> -0.04 </td>
   <td style="text-align:left;"> 0.11* </td>
   <td style="text-align:left;"> -0.04 </td>
   <td style="text-align:left;"> -0.12* </td>
   <td style="text-align:left;"> 0.10 </td>
   <td style="text-align:left;"> 1.00 </td>
   <td style="text-align:left;"> 0.16** </td>
   <td style="text-align:left;"> 0.04 </td>
   <td style="text-align:left;"> 0.20*** </td>
  </tr>
  <tr>
   <td style="text-align:left;"> rec </td>
   <td style="text-align:left;"> 0.65*** </td>
   <td style="text-align:left;"> 0.65*** </td>
   <td style="text-align:left;"> 0.67*** </td>
   <td style="text-align:left;"> 0.81*** </td>
   <td style="text-align:left;"> 0.76*** </td>
   <td style="text-align:left;"> 0.16** </td>
   <td style="text-align:left;"> 1.00 </td>
   <td style="text-align:left;"> 0.41*** </td>
   <td style="text-align:left;"> 0.51*** </td>
  </tr>
  <tr>
   <td style="text-align:left;"> secs_eco </td>
   <td style="text-align:left;"> 0.45*** </td>
   <td style="text-align:left;"> 0.01 </td>
   <td style="text-align:left;"> 0.39*** </td>
   <td style="text-align:left;"> 0.35*** </td>
   <td style="text-align:left;"> 0.52*** </td>
   <td style="text-align:left;"> 0.04 </td>
   <td style="text-align:left;"> 0.41*** </td>
   <td style="text-align:left;"> 1.00 </td>
   <td style="text-align:left;"> 0.82*** </td>
  </tr>
  <tr>
   <td style="text-align:left;"> secs_soc </td>
   <td style="text-align:left;"> 0.73*** </td>
   <td style="text-align:left;"> 0.17** </td>
   <td style="text-align:left;"> 0.63*** </td>
   <td style="text-align:left;"> 0.47*** </td>
   <td style="text-align:left;"> 0.69*** </td>
   <td style="text-align:left;"> 0.20*** </td>
   <td style="text-align:left;"> 0.51*** </td>
   <td style="text-align:left;"> 0.82*** </td>
   <td style="text-align:left;"> 1.00 </td>
  </tr>
</tbody>
</table>

Next, we examine evidence for the preregistered hypotheses:

<table class="table table-striped table-hover" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:tabresults)Parameters used to test hypothesis 1. Evidence in favor of the hypothesis: BF = 0.004 (rejected).</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Country </th>
   <th style="text-align:right;"> fam_sepa_soc </th>
   <th style="text-align:right;"> fam_sepa_eco </th>
   <th style="text-align:right;"> fam_secs_soc </th>
   <th style="text-align:right;"> fam_secs_eco </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> nl </td>
   <td style="text-align:right;"> 0.233 </td>
   <td style="text-align:right;"> 0.095 </td>
   <td style="text-align:right;"> 0.439 </td>
   <td style="text-align:right;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> dk </td>
   <td style="text-align:right;"> 0.391 </td>
   <td style="text-align:right;"> -0.092 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> us </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 0.627 </td>
   <td style="text-align:right;"> 0.393 </td>
  </tr>
</tbody>
</table><table class="table table-striped table-hover" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:tabresults)Parameters used to test hypothesis 2. Evidence in favor of the hypothesis: BF = 0.000 (rejected).</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Country </th>
   <th style="text-align:right;"> grp_sepa_soc </th>
   <th style="text-align:right;"> grp_sepa_eco </th>
   <th style="text-align:right;"> grp_secs_soc </th>
   <th style="text-align:right;"> grp_secs_eco </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> nl </td>
   <td style="text-align:right;"> -0.035 </td>
   <td style="text-align:right;"> -0.046 </td>
   <td style="text-align:right;"> 0.277 </td>
   <td style="text-align:right;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> dk </td>
   <td style="text-align:right;"> -0.075 </td>
   <td style="text-align:right;"> -0.297 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> us </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 0.474 </td>
   <td style="text-align:right;"> 0.349 </td>
  </tr>
</tbody>
</table><table class="table table-striped table-hover" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:tabresults)Parameters used to test hypothesis 3. Evidence in favor of the hypothesis: BF = 0.000 (rejected).</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Country </th>
   <th style="text-align:right;"> rec_sepa_soc </th>
   <th style="text-align:right;"> rec_sepa_eco </th>
   <th style="text-align:right;"> rec_secs_soc </th>
   <th style="text-align:right;"> rec_secs_eco </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> nl </td>
   <td style="text-align:right;"> 0.136 </td>
   <td style="text-align:right;"> -0.107 </td>
   <td style="text-align:right;"> 0.196 </td>
   <td style="text-align:right;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> dk </td>
   <td style="text-align:right;"> 0.170 </td>
   <td style="text-align:right;"> -0.217 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> us </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 0.508 </td>
   <td style="text-align:right;"> 0.409 </td>
  </tr>
</tbody>
</table><table class="table table-striped table-hover" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:tabresults)Parameters used to test hypothesis 4. Evidence in favor of the hypothesis: BF = 0.000 (rejected).</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Country </th>
   <th style="text-align:right;"> her_sepa_soc </th>
   <th style="text-align:right;"> her_sepa_eco </th>
   <th style="text-align:right;"> her_secs_soc </th>
   <th style="text-align:right;"> her_secs_eco </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> nl </td>
   <td style="text-align:right;"> 0.281 </td>
   <td style="text-align:right;"> 0.037 </td>
   <td style="text-align:right;"> 0.377 </td>
   <td style="text-align:right;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> dk </td>
   <td style="text-align:right;"> 0.407 </td>
   <td style="text-align:right;"> -0.123 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> us </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 0.692 </td>
   <td style="text-align:right;"> 0.516 </td>
  </tr>
</tbody>
</table><table class="table table-striped table-hover" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:tabresults)Parameters used to test hypothesis 5. Evidence in favor of the hypothesis: BF = 7.176 (supported).</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Country </th>
   <th style="text-align:right;"> def_sepa_soc </th>
   <th style="text-align:right;"> def_sepa_eco </th>
   <th style="text-align:right;"> def_secs_soc </th>
   <th style="text-align:right;"> def_secs_eco </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> nl </td>
   <td style="text-align:right;"> 0.451 </td>
   <td style="text-align:right;"> 0.248 </td>
   <td style="text-align:right;"> 0.579 </td>
   <td style="text-align:right;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> dk </td>
   <td style="text-align:right;"> 0.466 </td>
   <td style="text-align:right;"> 0.033 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> us </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 0.726 </td>
   <td style="text-align:right;"> 0.451 </td>
  </tr>
</tbody>
</table><table class="table table-striped table-hover" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:tabresults)Parameters used to test hypothesis 6. Evidence in favor of the hypothesis: BF = 0.000 (rejected).</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Country </th>
   <th style="text-align:right;"> fai_sepa_soc </th>
   <th style="text-align:right;"> fai_sepa_eco </th>
   <th style="text-align:right;"> fai_secs_soc </th>
   <th style="text-align:right;"> fai_secs_eco </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> nl </td>
   <td style="text-align:right;"> -0.614 </td>
   <td style="text-align:right;"> -0.704 </td>
   <td style="text-align:right;"> -0.099 </td>
   <td style="text-align:right;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> dk </td>
   <td style="text-align:right;"> -0.185 </td>
   <td style="text-align:right;"> -0.810 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> us </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 0.169 </td>
   <td style="text-align:right;"> 0.013 </td>
  </tr>
</tbody>
</table><table class="table table-striped table-hover" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:tabresults)Parameters used to test hypothesis 7. Evidence in favor of the hypothesis: BF = 0.000 (rejected).</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Country </th>
   <th style="text-align:right;"> pro_sepa_soc </th>
   <th style="text-align:right;"> pro_sepa_eco </th>
   <th style="text-align:right;"> pro_secs_soc </th>
   <th style="text-align:right;"> pro_secs_eco </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> nl </td>
   <td style="text-align:right;"> 0.069 </td>
   <td style="text-align:right;"> 0.154 </td>
   <td style="text-align:right;"> 0.127 </td>
   <td style="text-align:right;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> dk </td>
   <td style="text-align:right;"> -0.094 </td>
   <td style="text-align:right;"> 0.048 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> us </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 0.197 </td>
   <td style="text-align:right;"> 0.036 </td>
  </tr>
</tbody>
</table><table class="table table-striped table-hover" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:tabresults)Parameters used to test hypothesis 8. Evidence in favor of the hypothesis: BF = 1986137340131735261026262482644480444022626068824642626060666002426882442446284684248282004886666004426882608888622686464860.000 (supported).</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Country </th>
   <th style="text-align:right;"> sepa_socONfam </th>
   <th style="text-align:right;"> sepa_socONgrp </th>
   <th style="text-align:right;"> sepa_ecoONfam </th>
   <th style="text-align:right;"> sepa_ecoONgrp </th>
   <th style="text-align:right;"> secs_socONfam </th>
   <th style="text-align:right;"> secs_socONgrp </th>
   <th style="text-align:right;"> secs_ecoONfam </th>
   <th style="text-align:right;"> secs_ecoONgrp </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> nl </td>
   <td style="text-align:right;"> 0.319 </td>
   <td style="text-align:right;"> -0.184 </td>
   <td style="text-align:right;"> 0.149 </td>
   <td style="text-align:right;"> -0.116 </td>
   <td style="text-align:right;"> 0.396 </td>
   <td style="text-align:right;"> 0.091 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> dk </td>
   <td style="text-align:right;"> 0.493 </td>
   <td style="text-align:right;"> -0.265 </td>
   <td style="text-align:right;"> 0.027 </td>
   <td style="text-align:right;"> -0.307 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> us </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 0.536 </td>
   <td style="text-align:right;"> 0.150 </td>
   <td style="text-align:right;"> 0.287 </td>
   <td style="text-align:right;"> 0.176 </td>
  </tr>
</tbody>
</table><table class="table table-striped table-hover" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:tabresults)Parameters used to test hypothesis 9. Evidence in favor of the hypothesis: BF = 113978763439999426510860206620620088084626604008004640020888686662264864648086428026280406622646808208044288088820244406406246280608424602462266006426040624866060828446406400480.000 (supported).</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Country </th>
   <th style="text-align:right;"> sepa_socONrec </th>
   <th style="text-align:right;"> sepa_socONfai </th>
   <th style="text-align:right;"> sepa_ecoONrec </th>
   <th style="text-align:right;"> sepa_ecoONfai </th>
   <th style="text-align:right;"> secs_socONrec </th>
   <th style="text-align:right;"> secs_socONfai </th>
   <th style="text-align:right;"> secs_ecoONrec </th>
   <th style="text-align:right;"> secs_ecoONfai </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> nl </td>
   <td style="text-align:right;"> 0.363 </td>
   <td style="text-align:right;"> -0.727 </td>
   <td style="text-align:right;"> 0.124 </td>
   <td style="text-align:right;"> -0.743 </td>
   <td style="text-align:right;"> 0.251 </td>
   <td style="text-align:right;"> -0.177 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> dk </td>
   <td style="text-align:right;"> 0.320 </td>
   <td style="text-align:right;"> -0.331 </td>
   <td style="text-align:right;"> 0.190 </td>
   <td style="text-align:right;"> -0.897 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> us </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 0.892 </td>
   <td style="text-align:right;"> 0.527 </td>
   <td style="text-align:right;"> 0.868 </td>
   <td style="text-align:right;"> 0.633 </td>
  </tr>
</tbody>
</table>

According to these analyses, hypotheses 5, 8, 9 were supported.

These results are qualified by the relatively poor psychometric properties of some scales,
the lack of measurement invariance for some scales,
and the poor model fit of the CFA estimated in the three countries (see below).
Inspection of the modification indices suggested that adding cross-loadings might improve model fit,
but with the low number of indicators per factor this might compromise interpretability.
A likely explanation for the relatively poor model fit is the low explained variance in some items (see Table 3).

<table class="table table-striped table-hover" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:tabfits)Fit of models used to test hypotheses 1-7.</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> npar </th>
   <th style="text-align:right;"> chisq </th>
   <th style="text-align:right;"> df </th>
   <th style="text-align:right;"> cfi </th>
   <th style="text-align:right;"> tli </th>
   <th style="text-align:right;"> rmsea </th>
   <th style="text-align:right;"> srmr </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> nl </td>
   <td style="text-align:right;"> 159 </td>
   <td style="text-align:right;"> 1423.488 </td>
   <td style="text-align:right;"> 620 </td>
   <td style="text-align:right;"> 0.781 </td>
   <td style="text-align:right;"> 0.752 </td>
   <td style="text-align:right;"> 0.061 </td>
   <td style="text-align:right;"> 0.072 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> dk </td>
   <td style="text-align:right;"> 129 </td>
   <td style="text-align:right;"> 1489.987 </td>
   <td style="text-align:right;"> 398 </td>
   <td style="text-align:right;"> 0.807 </td>
   <td style="text-align:right;"> 0.774 </td>
   <td style="text-align:right;"> 0.071 </td>
   <td style="text-align:right;"> 0.074 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> us </td>
   <td style="text-align:right;"> 135 </td>
   <td style="text-align:right;"> 1944.203 </td>
   <td style="text-align:right;"> 459 </td>
   <td style="text-align:right;"> 0.812 </td>
   <td style="text-align:right;"> 0.784 </td>
   <td style="text-align:right;"> 0.079 </td>
   <td style="text-align:right;"> 0.080 </td>
  </tr>
</tbody>
</table>


# Exploratory analyses

The preceding analyses were conceptually replicated in a fourth sample.
Note that this sample used moral relevance scales instead of moral judgment scales.





This replication offered no support for any hypothesis except H8:

* $BF_{h1} = 0.076$, based on parameters fam_secs_soc (0.274), fam_secs_eco (0.026).  
* $BF_{h2} = 0.000$, based on parameters grp_secs_soc (-0.054), grp_secs_eco (-0.289).  
* $BF_{h3} = 0.860$, based on parameters rec_secs_soc (0.094), rec_secs_eco (0.097).  
* $BF_{h4} = 0.004$, based on parameters her_secs_soc (0.071), her_secs_eco (-0.008).  
* $BF_{h5} = 2.961$, based on parameters def_secs_soc (0.494), def_secs_eco (0.383).  
* $BF_{h6} = 0.022$, based on parameters fai_secs_soc (-0.024), fai_secs_eco (-0.034).  
* $BF_{h7} = 2.906$, based on parameters pro_secs_soc (0.227), pro_secs_eco (0.338).  
* $BF_{h8} = 238841586981143475466042068842026284622.000$, based on parameters secs_socONfam (0.510), secs_socONgrp (-0.376), secs_ecoONfam (0.344), secs_ecoONgrp (-0.507).  
* $BF_{h9} = 0.007$, based on parameters secs_socONrec (0.140), secs_socONfai (-0.094), secs_ecoONrec (0.150), secs_ecoONfai (-0.109).  

The fit of this model was also poor, though somewhat better than for the confirmatory analyses; chisq = 2090.634, cfi = 0.892, tli = 0.876, rmsea = 0.052, srmr = 0.050.


# Meta-analyses

Whereas the preregistered hypotheses test the hypothesis that *all* correlations between *all* moral domains and *all* conservatism scales will be > .1 in *all* countries,
we can also examine the *average* correlation between moral domains and conservatism scales across countries.

For this purpose, we conducted three-level meta-analyses.
We estimated two separate models for each moral domain:
One with an average correlation (intercept) across all conservatism scales (Model: Overall),
and one multi-group analysis with separate intercepts for social and economic conservatism scales (Model: Multigroup).
To account for the dependent data, we used a three-level meta-analysis.
Note that each model provides an estimate of variance between effect sizes within each country (tau$^2$w) and variance between the countries (tau$^2$b).

<table class="table table-striped table-hover" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:unnamed-chunk-8)Average correlations according to three-level meta-analysis</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Parameter </th>
   <th style="text-align:right;"> Estimate </th>
   <th style="text-align:right;"> p </th>
   <th style="text-align:left;"> sig </th>
   <th style="text-align:left;"> Model </th>
   <th style="text-align:left;"> CI </th>
   <th style="text-align:left;"> Domain </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> intrcpt </td>
   <td style="text-align:right;"> 0.317 </td>
   <td style="text-align:right;"> 0.004 </td>
   <td style="text-align:left;"> * </td>
   <td style="text-align:left;"> Overall </td>
   <td style="text-align:left;"> [0.10, 0.50] </td>
   <td style="text-align:left;"> fam </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2b </td>
   <td style="text-align:right;"> 0.011 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Overall </td>
   <td style="text-align:left;"> [0.00, 0.73] </td>
   <td style="text-align:left;"> fam </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2w </td>
   <td style="text-align:right;"> 0.063 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;"> * </td>
   <td style="text-align:left;"> Overall </td>
   <td style="text-align:left;"> [0.02, 0.29] </td>
   <td style="text-align:left;"> fam </td>
  </tr>
  <tr>
   <td style="text-align:left;"> social </td>
   <td style="text-align:right;"> 0.454 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:left;"> * </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [0.22, 0.64] </td>
   <td style="text-align:left;"> fam </td>
  </tr>
  <tr>
   <td style="text-align:left;"> eco </td>
   <td style="text-align:right;"> 0.137 </td>
   <td style="text-align:right;"> 0.324 </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [-0.14, 0.39] </td>
   <td style="text-align:left;"> fam </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2b </td>
   <td style="text-align:right;"> 0.044 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [0.00, 0.89] </td>
   <td style="text-align:left;"> fam </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2w </td>
   <td style="text-align:right;"> 0.012 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;"> * </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [0.00, 0.13] </td>
   <td style="text-align:left;"> fam </td>
  </tr>
  <tr>
   <td style="text-align:left;"> intrcpt </td>
   <td style="text-align:right;"> 0.105 </td>
   <td style="text-align:right;"> 0.560 </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Overall </td>
   <td style="text-align:left;"> [-0.24, 0.43] </td>
   <td style="text-align:left;"> grp </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2b </td>
   <td style="text-align:right;"> 0.086 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Overall </td>
   <td style="text-align:left;"> [0.00, 1.73] </td>
   <td style="text-align:left;"> grp </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2w </td>
   <td style="text-align:right;"> 0.025 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;"> * </td>
   <td style="text-align:left;"> Overall </td>
   <td style="text-align:left;"> [0.01, 0.17] </td>
   <td style="text-align:left;"> grp </td>
  </tr>
  <tr>
   <td style="text-align:left;"> social </td>
   <td style="text-align:right;"> 0.184 </td>
   <td style="text-align:right;"> 0.322 </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [-0.18, 0.50] </td>
   <td style="text-align:left;"> grp </td>
  </tr>
  <tr>
   <td style="text-align:left;"> eco </td>
   <td style="text-align:right;"> 0.004 </td>
   <td style="text-align:right;"> 0.983 </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [-0.35, 0.36] </td>
   <td style="text-align:left;"> grp </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2b </td>
   <td style="text-align:right;"> 0.093 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [0.00, 1.77] </td>
   <td style="text-align:left;"> grp </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2w </td>
   <td style="text-align:right;"> 0.014 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;"> * </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [0.00, 0.15] </td>
   <td style="text-align:left;"> grp </td>
  </tr>
  <tr>
   <td style="text-align:left;"> intrcpt </td>
   <td style="text-align:right;"> 0.178 </td>
   <td style="text-align:right;"> 0.251 </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Overall </td>
   <td style="text-align:left;"> [-0.13, 0.45] </td>
   <td style="text-align:left;"> rec </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2b </td>
   <td style="text-align:right;"> 0.058 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Overall </td>
   <td style="text-align:left;"> [0.00, 1.30] </td>
   <td style="text-align:left;"> rec </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2w </td>
   <td style="text-align:right;"> 0.033 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;"> * </td>
   <td style="text-align:left;"> Overall </td>
   <td style="text-align:left;"> [0.01, 0.21] </td>
   <td style="text-align:left;"> rec </td>
  </tr>
  <tr>
   <td style="text-align:left;"> social </td>
   <td style="text-align:right;"> 0.291 </td>
   <td style="text-align:right;"> 0.073 </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [-0.03, 0.56] </td>
   <td style="text-align:left;"> rec </td>
  </tr>
  <tr>
   <td style="text-align:left;"> eco </td>
   <td style="text-align:right;"> 0.035 </td>
   <td style="text-align:right;"> 0.835 </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [-0.29, 0.35] </td>
   <td style="text-align:left;"> rec </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2b </td>
   <td style="text-align:right;"> 0.078 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;"> * </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [0.01, 1.43] </td>
   <td style="text-align:left;"> rec </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2w </td>
   <td style="text-align:right;"> 0.005 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [0.00, 0.06] </td>
   <td style="text-align:left;"> rec </td>
  </tr>
  <tr>
   <td style="text-align:left;"> intrcpt </td>
   <td style="text-align:right;"> 0.348 </td>
   <td style="text-align:right;"> 0.030 </td>
   <td style="text-align:left;"> * </td>
   <td style="text-align:left;"> Overall </td>
   <td style="text-align:left;"> [0.03, 0.60] </td>
   <td style="text-align:left;"> her </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2b </td>
   <td style="text-align:right;"> 0.055 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Overall </td>
   <td style="text-align:left;"> [0.00, 1.50] </td>
   <td style="text-align:left;"> her </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2w </td>
   <td style="text-align:right;"> 0.065 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;"> * </td>
   <td style="text-align:left;"> Overall </td>
   <td style="text-align:left;"> [0.02, 0.36] </td>
   <td style="text-align:left;"> her </td>
  </tr>
  <tr>
   <td style="text-align:left;"> social </td>
   <td style="text-align:right;"> 0.489 </td>
   <td style="text-align:right;"> 0.004 </td>
   <td style="text-align:left;"> * </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [0.17, 0.71] </td>
   <td style="text-align:left;"> her </td>
  </tr>
  <tr>
   <td style="text-align:left;"> eco </td>
   <td style="text-align:right;"> 0.159 </td>
   <td style="text-align:right;"> 0.391 </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [-0.20, 0.48] </td>
   <td style="text-align:left;"> her </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2b </td>
   <td style="text-align:right;"> 0.094 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;"> * </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [0.01, 1.73] </td>
   <td style="text-align:left;"> her </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2w </td>
   <td style="text-align:right;"> 0.008 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;"> * </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [0.00, 0.09] </td>
   <td style="text-align:left;"> her </td>
  </tr>
  <tr>
   <td style="text-align:left;"> intrcpt </td>
   <td style="text-align:right;"> 0.445 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:left;"> * </td>
   <td style="text-align:left;"> Overall </td>
   <td style="text-align:left;"> [0.26, 0.60] </td>
   <td style="text-align:left;"> def </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2b </td>
   <td style="text-align:right;"> 0.003 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Overall </td>
   <td style="text-align:left;"> [0.00, 0.71] </td>
   <td style="text-align:left;"> def </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2w </td>
   <td style="text-align:right;"> 0.076 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;"> * </td>
   <td style="text-align:left;"> Overall </td>
   <td style="text-align:left;"> [0.02, 0.32] </td>
   <td style="text-align:left;"> def </td>
  </tr>
  <tr>
   <td style="text-align:left;"> social </td>
   <td style="text-align:right;"> 0.578 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:left;"> * </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [0.38, 0.72] </td>
   <td style="text-align:left;"> def </td>
  </tr>
  <tr>
   <td style="text-align:left;"> eco </td>
   <td style="text-align:right;"> 0.249 </td>
   <td style="text-align:right;"> 0.056 </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [-0.01, 0.47] </td>
   <td style="text-align:left;"> def </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2b </td>
   <td style="text-align:right;"> 0.046 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [0.00, 0.86] </td>
   <td style="text-align:left;"> def </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2w </td>
   <td style="text-align:right;"> 0.005 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [0.00, 0.06] </td>
   <td style="text-align:left;"> def </td>
  </tr>
  <tr>
   <td style="text-align:left;"> intrcpt </td>
   <td style="text-align:right;"> -0.372 </td>
   <td style="text-align:right;"> 0.080 </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Overall </td>
   <td style="text-align:left;"> [-0.68, 0.05] </td>
   <td style="text-align:left;"> fai </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2b </td>
   <td style="text-align:right;"> 0.061 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Overall </td>
   <td style="text-align:left;"> [0.00, 2.69] </td>
   <td style="text-align:left;"> fai </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2w </td>
   <td style="text-align:right;"> 0.201 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;"> * </td>
   <td style="text-align:left;"> Overall </td>
   <td style="text-align:left;"> [0.06, 0.96] </td>
   <td style="text-align:left;"> fai </td>
  </tr>
  <tr>
   <td style="text-align:left;"> social </td>
   <td style="text-align:right;"> -0.162 </td>
   <td style="text-align:right;"> 0.546 </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [-0.60, 0.35] </td>
   <td style="text-align:left;"> fai </td>
  </tr>
  <tr>
   <td style="text-align:left;"> eco </td>
   <td style="text-align:right;"> -0.581 </td>
   <td style="text-align:right;"> 0.020 </td>
   <td style="text-align:left;"> * </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [-0.84, -0.10] </td>
   <td style="text-align:left;"> fai </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2b </td>
   <td style="text-align:right;"> 0.127 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [0.00, 3.14] </td>
   <td style="text-align:left;"> fai </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2w </td>
   <td style="text-align:right;"> 0.114 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;"> * </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [0.03, 0.86] </td>
   <td style="text-align:left;"> fai </td>
  </tr>
  <tr>
   <td style="text-align:left;"> intrcpt </td>
   <td style="text-align:right;"> 0.072 </td>
   <td style="text-align:right;"> 0.113 </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Overall </td>
   <td style="text-align:left;"> [-0.02, 0.16] </td>
   <td style="text-align:left;"> pro </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2b </td>
   <td style="text-align:right;"> 0.003 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Overall </td>
   <td style="text-align:left;"> [0.00, 0.11] </td>
   <td style="text-align:left;"> pro </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2w </td>
   <td style="text-align:right;"> 0.005 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;"> * </td>
   <td style="text-align:left;"> Overall </td>
   <td style="text-align:left;"> [0.00, 0.03] </td>
   <td style="text-align:left;"> pro </td>
  </tr>
  <tr>
   <td style="text-align:left;"> social </td>
   <td style="text-align:right;"> 0.070 </td>
   <td style="text-align:right;"> 0.215 </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [-0.04, 0.18] </td>
   <td style="text-align:left;"> pro </td>
  </tr>
  <tr>
   <td style="text-align:left;"> eco </td>
   <td style="text-align:right;"> 0.078 </td>
   <td style="text-align:right;"> 0.215 </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [-0.05, 0.20] </td>
   <td style="text-align:left;"> pro </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2b </td>
   <td style="text-align:right;"> 0.002 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [0.00, 0.11] </td>
   <td style="text-align:left;"> pro </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2w </td>
   <td style="text-align:right;"> 0.008 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;"> * </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [0.00, 0.05] </td>
   <td style="text-align:left;"> pro </td>
  </tr>
</tbody>
</table>

For Hypotheses 8 and 9, it is instructive to examine the average partial regression coefficients for the two moral domains mentioned in the hypotheses:

<table class="table table-striped table-hover" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:meta8)Average partial regression coefficients according to three-level meta-analysis</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Parameter </th>
   <th style="text-align:right;"> Estimate </th>
   <th style="text-align:right;"> p </th>
   <th style="text-align:left;"> sig </th>
   <th style="text-align:left;"> Model </th>
   <th style="text-align:left;"> CI </th>
   <th style="text-align:left;"> Domain </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> intrcpt </td>
   <td style="text-align:right;"> 0.408 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:left;"> * </td>
   <td style="text-align:left;"> Overall </td>
   <td style="text-align:left;"> [0.25, 0.54] </td>
   <td style="text-align:left;"> fam </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2b </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Overall </td>
   <td style="text-align:left;"> [0.00, 0.23] </td>
   <td style="text-align:left;"> fam </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2w </td>
   <td style="text-align:right;"> 0.048 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;"> * </td>
   <td style="text-align:left;"> Overall </td>
   <td style="text-align:left;"> [0.01, 0.21] </td>
   <td style="text-align:left;"> fam </td>
  </tr>
  <tr>
   <td style="text-align:left;"> social </td>
   <td style="text-align:right;"> 0.545 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:left;"> * </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [0.42, 0.65] </td>
   <td style="text-align:left;"> fam </td>
  </tr>
  <tr>
   <td style="text-align:left;"> eco </td>
   <td style="text-align:right;"> 0.224 </td>
   <td style="text-align:right;"> 0.007 </td>
   <td style="text-align:left;"> * </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [0.06, 0.37] </td>
   <td style="text-align:left;"> fam </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2b </td>
   <td style="text-align:right;"> 0.010 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [0.00, 0.27] </td>
   <td style="text-align:left;"> fam </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2w </td>
   <td style="text-align:right;"> 0.005 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [0.00, 0.08] </td>
   <td style="text-align:left;"> fam </td>
  </tr>
  <tr>
   <td style="text-align:left;"> intrcpt </td>
   <td style="text-align:right;"> -0.117 </td>
   <td style="text-align:right;"> 0.523 </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Overall </td>
   <td style="text-align:left;"> [-0.45, 0.24] </td>
   <td style="text-align:left;"> grp </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2b </td>
   <td style="text-align:right;"> 0.095 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;"> * </td>
   <td style="text-align:left;"> Overall </td>
   <td style="text-align:left;"> [0.00, 1.79] </td>
   <td style="text-align:left;"> grp </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2w </td>
   <td style="text-align:right;"> 0.010 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Overall </td>
   <td style="text-align:left;"> [0.00, 0.10] </td>
   <td style="text-align:left;"> grp </td>
  </tr>
  <tr>
   <td style="text-align:left;"> social </td>
   <td style="text-align:right;"> -0.081 </td>
   <td style="text-align:right;"> 0.668 </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [-0.42, 0.28] </td>
   <td style="text-align:left;"> grp </td>
  </tr>
  <tr>
   <td style="text-align:left;"> eco </td>
   <td style="text-align:right;"> -0.164 </td>
   <td style="text-align:right;"> 0.394 </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [-0.50, 0.21] </td>
   <td style="text-align:left;"> grp </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2b </td>
   <td style="text-align:right;"> 0.094 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [0.00, 1.79] </td>
   <td style="text-align:left;"> grp </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2w </td>
   <td style="text-align:right;"> 0.012 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [0.00, 0.18] </td>
   <td style="text-align:left;"> grp </td>
  </tr>
</tbody>
</table>

<table class="table table-striped table-hover" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:meta9)Average partial regression coefficients according to three-level meta-analysis</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Parameter </th>
   <th style="text-align:right;"> Estimate </th>
   <th style="text-align:right;"> p </th>
   <th style="text-align:left;"> sig </th>
   <th style="text-align:left;"> Model </th>
   <th style="text-align:left;"> CI </th>
   <th style="text-align:left;"> Domain </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> intrcpt </td>
   <td style="text-align:right;"> 0.714 </td>
   <td style="text-align:right;"> 0.009 </td>
   <td style="text-align:left;"> * </td>
   <td style="text-align:left;"> Overall </td>
   <td style="text-align:left;"> [0.22, 0.92] </td>
   <td style="text-align:left;"> rec </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2b </td>
   <td style="text-align:right;"> 0.309 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Overall </td>
   <td style="text-align:left;"> [0.00, 6.31] </td>
   <td style="text-align:left;"> rec </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2w </td>
   <td style="text-align:right;"> 0.077 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Overall </td>
   <td style="text-align:left;"> [0.00, 0.72] </td>
   <td style="text-align:left;"> rec </td>
  </tr>
  <tr>
   <td style="text-align:left;"> social </td>
   <td style="text-align:right;"> 0.784 </td>
   <td style="text-align:right;"> 0.004 </td>
   <td style="text-align:left;"> * </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [0.32, 0.94] </td>
   <td style="text-align:left;"> rec </td>
  </tr>
  <tr>
   <td style="text-align:left;"> eco </td>
   <td style="text-align:right;"> 0.593 </td>
   <td style="text-align:right;"> 0.068 </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [-0.05, 0.89] </td>
   <td style="text-align:left;"> rec </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2b </td>
   <td style="text-align:right;"> 0.369 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;"> * </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [0.03, 6.99] </td>
   <td style="text-align:left;"> rec </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2w </td>
   <td style="text-align:right;"> 0.025 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [0.00, 0.50] </td>
   <td style="text-align:left;"> rec </td>
  </tr>
  <tr>
   <td style="text-align:left;"> intrcpt </td>
   <td style="text-align:right;"> -0.787 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:left;"> * </td>
   <td style="text-align:left;"> Overall </td>
   <td style="text-align:left;"> [-0.89, -0.60] </td>
   <td style="text-align:left;"> fai </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2b </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Overall </td>
   <td style="text-align:left;"> [0.00, 1.00] </td>
   <td style="text-align:left;"> fai </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2w </td>
   <td style="text-align:right;"> 0.203 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;"> * </td>
   <td style="text-align:left;"> Overall </td>
   <td style="text-align:left;"> [0.06, 0.93] </td>
   <td style="text-align:left;"> fai </td>
  </tr>
  <tr>
   <td style="text-align:left;"> social </td>
   <td style="text-align:right;"> -0.724 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:left;"> * </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [-0.88, -0.41] </td>
   <td style="text-align:left;"> fai </td>
  </tr>
  <tr>
   <td style="text-align:left;"> eco </td>
   <td style="text-align:right;"> -0.855 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:left;"> * </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [-0.95, -0.61] </td>
   <td style="text-align:left;"> fai </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2b </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [0.00, 0.96] </td>
   <td style="text-align:left;"> fai </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tau2w </td>
   <td style="text-align:right;"> 0.205 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:left;"> * </td>
   <td style="text-align:left;"> Multigroup </td>
   <td style="text-align:left;"> [0.05, 1.13] </td>
   <td style="text-align:left;"> fai </td>
  </tr>
</tbody>
</table>
