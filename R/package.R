#' `random.cdisc.data` Package
#'
#' Package to create random SDTM and ADAM datasets.
#'
"_PACKAGE"

#' @import dplyr
#' @importFrom magrittr %>%
#' @importFrom lifecycle badge
#' @importFrom rlang .data := !!
#' @importFrom stringr str_detect
NULL

# to avoid NOTEs from R CMD CHECK
utils::globalVariables(c(
  ".", "A0", "ABLFL", "ACTARM", "ADJUST", "ADTM", "ADTM.y", "ADY", "ADY.y", "ADY_der", "ADY_int",
  "AEDECOD", "AENDTM", "AESEQ", "AES_FLAG", "AETERM", "AETOXGR", "AGE", "ANL01FL", "ANRIND", "APERIODC",
  "ARELTM1", "ARELTM2", "ARM", "ARMCD", "ASEQ", "ASMED", "ASPID", "ASTDT", "ASTDTM", "ATC1", "ATC2",
  "ATC3", "ATC4", "ATOXGR", "ATPTN", "AVAL", "AVAL1", "AVAL2", "AVALC", "AVALU", "AVISIT", "AVISITN",
  "BASE", "BASE2", "BASETYPE", "BNRIND", "CHG", "CHG2", "CMCLAS", "CMDECOD", "CMSEQ", "CNSR", "CNSR_P",
  "COUNTRY", "DCSREAS", "DTHDT", "DTYPE", "DVCAT", "DVEPRELI", "DVSEQ", "DVTERM", "EGSEQ", "EOSSTT",
  "EXENDTC", "EXENDY", "EXSEQ", "EXSTDTC", "EXSTDY", "HEIGHT", "LAMBDA", "LBSEQ", "LBSTRESC",
  "LDOSEDTM", "MHDECOD", "MHSEQ", "MHTERM", "NRELTM1", "NRELTM2", "ONTRTFL", "PARAM", "PARAMCD",
  "PARCAT1", "PARCAT1N", "PARCAT2", "PARCAT_ind", "PCHG", "PCTPT", "PCTPTNUM", "PPCAT", "QSCAT",
  "QSDTC", "QSEVLINT", "QSORRES", "QSORRESU", "QSREASND", "QSSCAT", "QSSEQ", "QSSTAT", "QSSTRESC",
  "QSSTRESU", "QSTEST", "QSTESTCD", "RELTMU", "RSSEQ", "SITEID", "SRCSEQ", "STUDYID", "SUBJID",
  "TRT01EDTM", "TRT01SDTM", "TRT02EDTM", "TRT02SDTM", "TRTEDTM", "TRTEDTM_discon",
  "TRTEMFL", "TRTENDT", "TRTSDTM", "TTESEQ", "USUBJID", "VISIT", "VISITDY", "VISITNUM", "VSSEQ",
  "VSSTRESC", "WEIGHT", "WORS01FL", "ada_bl", "any_pos_postbl", "any_pos_postbl_nab",
  "changeind", "comp_count", "first_date", "inc_postbl", "inc_postbl_nab", "ka", "ke",
  "last_ada", "n_pos", "nab_bl", "onset_ada", "pos_bl", "pos_bl_nab", "pos_last_postbl",
  "publication_name", "row_check", "AFRLT", "ARRLT", "NFRLT", "NRRLT",
  "eortc_qlq_c30", "expect", "gdsr_param_adqlqc"
))
