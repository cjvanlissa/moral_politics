mod8 <- list(nl = "sepa_soc =~ sepa_soc_1
sepa_soc =~ sepa_soc_2
sepa_soc =~ sepa_soc_3
sepa_soc =~ sepa_soc_4
sepa_soc =~ sepa_soc_5
sepa_eco =~ sepa_eco_1
sepa_eco =~ sepa_eco_2
sepa_eco =~ sepa_eco_3
sepa_eco =~ sepa_eco_4
sepa_eco =~ sepa_eco_5
secs_soc =~ secs_soc_1
secs_soc =~ secs_soc_2
secs_soc =~ secs_soc_3
secs_soc =~ secs_soc_4
secs_soc =~ secs_soc_5
secs_soc =~ secs_soc_6
secs_soc =~ secs_soc_7
fam =~ fam_1
fam =~ fam_2
fam =~ fam_3
grp =~ grp_1
grp =~ grp_2
grp =~ grp_3
rec =~ rec_1
rec =~ rec_2
rec =~ rec_3
def =~ def_1
def =~ def_2
def =~ def_3
fai =~ fai_1
fai =~ fai_2
fai =~ fai_3
pro =~ pro_1
pro =~ pro_2
pro =~ pro_3
sepa_soc ~ sepa_soc_fam * fam
sepa_soc ~ sepa_soc_grp * grp
sepa_eco ~ sepa_eco_fam * fam
sepa_eco ~ sepa_eco_grp * grp
secs_soc ~ secs_soc_fam * fam
secs_soc ~ secs_soc_grp * grp
d_secs_soc := secs_soc_fam-secs_soc_grp",
dk =
"sepa_soc =~ sepa_soc_1
sepa_soc =~ sepa_soc_2
sepa_soc =~ sepa_soc_3
sepa_soc =~ sepa_soc_4
sepa_soc =~ sepa_soc_5
sepa_eco =~ sepa_eco_1
sepa_eco =~ sepa_eco_2
sepa_eco =~ sepa_eco_3
sepa_eco =~ sepa_eco_4
sepa_eco =~ sepa_eco_5
fam =~ fam_1
fam =~ fam_2
fam =~ fam_3
grp =~ grp_1
grp =~ grp_2
grp =~ grp_3
rec =~ rec_1
rec =~ rec_2
rec =~ rec_3
her =~ her_1
her =~ her_2
her =~ her_3
def =~ def_1
def =~ def_2
def =~ def_3
fai =~ fai_1
fai =~ fai_2
fai =~ fai_3
sepa_soc ~ sepa_soc_fam * fam
sepa_soc ~ sepa_soc_grp * grp
sepa_eco ~ sepa_eco_fam * fam
sepa_eco ~ sepa_eco_grp * grp
d_sepa_eco := sepa_eco_fam-sepa_eco_grp
d_sepa_soc := sepa_soc_fam-sepa_soc_grp",
us = 
"secs_soc =~ secs_soc_1
secs_soc =~ secs_soc_2
secs_soc =~ secs_soc_3
secs_soc =~ secs_soc_4
secs_soc =~ secs_soc_5
secs_soc =~ secs_soc_6
secs_soc =~ secs_soc_7
secs_eco =~ secs_eco_1
secs_eco =~ secs_eco_2
secs_eco =~ secs_eco_3
secs_eco =~ secs_eco_4
secs_eco =~ secs_eco_5
fam =~ fam_1
fam =~ fam_2
fam =~ fam_3
grp =~ grp_1
grp =~ grp_2
grp =~ grp_3
rec =~ rec_1
rec =~ rec_2
rec =~ rec_3
her =~ her_1
her =~ her_2
her =~ her_3
def =~ def_1
def =~ def_2
def =~ def_3
fai =~ fai_1
fai =~ fai_2
fai =~ fai_3
pro =~ pro_1
pro =~ pro_2
pro =~ pro_3
secs_soc ~ secs_soc_fam * fam
secs_soc ~ secs_soc_grp * grp
secs_eco ~ secs_eco_fam * fam
secs_eco ~ secs_eco_grp * grp
d_secs_eco := secs_eco_fam-secs_eco_grp
d_secs_soc := secs_soc_fam-secs_soc_grp")
