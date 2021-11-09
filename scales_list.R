scales_list <-
  list(
    dk = list(
      sepa_soc = c("q9_1", "q9_2", "q9_3", "q9_4", "q9_5"),
      sepa_eco = c("q10_1", "q10_2", "q10_3", "q10_4", "q10_5"),
      fam = c("q5_1", "q5_8", "q5_15"),
      grp = c("q5_2", "q5_9", "q5_16"),
      rec = c("q5_3", "q5_10", "q5_17"),
      her = c("q5_4", "q5_11", "q5_18"),
      def = c("q5_5", "q5_12", "q5_19"),
      fai = c("q5_6", "q5_13", "q5_20"),
      pro = c("q5_7", "q5_14", "q5_21")
    ),
    us = list(
      secs_soc = c("sec1", "sec3", "sec4", "sec7", "sec8", "sec11", "sec12"),
      secs_eco = c("sec2", "sec5", "sec6", "sec9", "sec10"),
      fam = c("mj1", "mj2", "mj3"),
      grp = c("mj4", "mj5", "mj6"),
      rec = c("mj7", "mj8", "mj9"),
      her = c("mj10", "mj11", "mj12"),
      def = c("mj13", "mj14", "mj15"),
      fai = c("mj16", "mj17", "mj18"),
      prop = c("mj19", "mj20", "mj21")
    ),
    nl = list(
      sepa_soc = c("dsc_1", "dsc_2", "dsc_3", "dsc_4", "dsc_5"),
      sepa_eco = c("silwrw_1", "silwrw_2", "silwrw_3", "silwrw_4", "silwrw_5"),
      secs_soc = c("secs_1", "secs_3", "secs_4", "secs_7", "secs_8", "secs_11", "secs_12"),
      secs_eco = c("secs_2", "secs_5", "secs_6", "secs_9", "secs_10"),
      fam = c("mac_q_1j", "mac_q_8j", "mac_q_15j"),
      grp = c("mac_q_2j", "mac_q_9j", "mac_q_16j"),
      rec = c("mac_q_3j", "mac_q_10j", "mac_q_17j"),
      her = c("mac_q_4j", "mac_q_11j", "mac_q_18j"),
      def = c("mac_q_5j", "mac_q_12j", "mac_q_19j"),
      fai = c("mac_q_6j", "mac_q_13j", "mac_q_20j"),
      pro = c("mac_q_7j", "mac_q_14j", "mac_q_21j")
    )
  )

reverse_coded <-
  list(
    dk = list(
      sepa_soc = c(FALSE, FALSE, FALSE, FALSE, FALSE),
      sepa_eco = c(TRUE, TRUE, TRUE, FALSE, FALSE),
      fam = c(FALSE,
              FALSE, FALSE),
      grp = c(FALSE, FALSE, FALSE),
      rec = c(FALSE, FALSE,
              FALSE),
      her = c(FALSE, FALSE, FALSE),
      def = c(FALSE, FALSE, FALSE),
      fai = c(FALSE, FALSE, FALSE),
      pro = c(TRUE, TRUE, TRUE)
    ),
    us = list(
      secs_soc = c(TRUE, FALSE, FALSE, FALSE, FALSE,
                   FALSE, FALSE),
      secs_eco = c(FALSE, TRUE, FALSE, FALSE, FALSE),
      fam = c(FALSE, FALSE, FALSE),
      grp = c(FALSE, FALSE, FALSE),
      rec = c(FALSE, FALSE, FALSE),
      her = c(FALSE, FALSE, FALSE),
      def = c(FALSE, FALSE, FALSE),
      fai = c(FALSE, FALSE, FALSE),
      prop = c(TRUE, TRUE, TRUE)
    ),
    nl = list(
      sepa_soc = c(FALSE,
                   FALSE, FALSE, FALSE, FALSE),
      sepa_eco = c(TRUE, TRUE, TRUE,
                   FALSE, FALSE),
      secs_soc = c(TRUE, FALSE, FALSE, FALSE, FALSE,
                   FALSE, FALSE),
      secs_eco = c(FALSE, TRUE, FALSE, FALSE, FALSE),
      fam = c(FALSE, FALSE, FALSE),
      grp = c(FALSE, FALSE, FALSE),
      rec = c(FALSE, FALSE, FALSE),
      her = c(FALSE, FALSE, FALSE),
      def = c(FALSE, FALSE, FALSE),
      fai = c(FALSE, FALSE, FALSE),
      pro = c(TRUE, TRUE, TRUE)
    )
  )