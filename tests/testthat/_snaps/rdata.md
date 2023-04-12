# r<data> functions work

    Code
      radpp(adsl, seed = 1)[1, ]
    Output
        STUDYID            USUBJID SUBJID SITEID AGE  AGEU SEX  RACE
      1 AB12345 AB12345-JPN-4-id-7   id-7  JPN-4  30 YEARS   F ASIAN
                        ETHNIC COUNTRY DTHFL        INVID        INVNAM       ARM
      1 NOT HISPANIC OR LATINO     JPN     N INV ID JPN-4 Dr. JPN-4 Doe A: Drug X
        ARMCD    ACTARM ACTARMCD    TRT01P    TRT01A         TRT02P     TRT02A
      1 ARM A A: Drug X    ARM A A: Drug X A: Drug X C: Combination B: Placebo
        REGION1 STRATA1 STRATA2  BMRKR1 BMRKR2 ITTFL SAFFL BMEASIFL BEP01FL AEWITHFL
      1    Asia       B      S1 7.45942 MEDIUM     Y     Y        Y       N        N
            RANDDT             TRTSDTM             TRTEDTM           TRT01SDTM
      1 2019-09-22 2019-09-22 02:25:18 2022-09-21 20:25:18 2019-09-22 02:25:18
                  TRT01EDTM           TRT02SDTM           TRT02EDTM
      1 2021-09-21 14:25:18 2021-09-21 14:25:18 2022-09-21 20:25:18
                   AP01SDTM            AP01EDTM            AP02SDTM
      1 2019-09-22 02:25:18 2021-09-21 14:25:18 2021-09-21 14:25:18
                   AP02EDTM    EOSSTT    EOTSTT      EOSDT EOSDY DCSREAS DTHDT
      1 2022-09-21 20:25:18 COMPLETED COMPLETED 2022-09-21  1096    <NA>  <NA>
        DTHCAUS DTHCAT LDDTHELD LDDTHGR1   LSTALVDT DTHADY ADTHAUT         PPCAT
      1    <NA>   <NA>       NA     <NA> 2022-10-09     NA    <NA> Plasma Drug X
        PPSPEC            PARAM PARAMCD PPSTINT PPENINT    AVISIT AVISITN     AVAL
      1 Plasma AUC Infinity Obs  AUCIFO    <NA>    <NA> SCREENING       0 207.3457
                   AVALC     AVALU REGIMEN PKARMCD
      1 207.345732968883 day*ug/mL     BID  Drug A

---

    Code
      radqlqc(adsl, percent = 80, number = 2, seed = 1)[1, ]
    Output
      # A tibble: 1 x 50
        STUDYID USUBJID    SUBJID SITEID   AGE AGEU  SEX   RACE  ETHNIC COUNTRY TRT01P
        <chr>   <chr>      <chr>  <chr>  <int> <fct> <fct> <fct> <fct>  <fct>   <fct> 
      1 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     C: Co~
      # i 39 more variables: TRT01A <fct>, REGION1 <fct>, ITTFL <fct>, SAFFL <fct>,
      #   TRTSDTM <dttm>, TRTEDTM <dttm>, QSSEQ <int>, QSCAT <fct>, QSSCAT <fct>,
      #   QSDTC <dttm>, QSSTAT <fct>, QSSTRESC <fct>, QSSTRESU <fct>, QSORRES <fct>,
      #   QSORRESU <fct>, QSTEST <fct>, QSTESTCD <fct>, QSREASND <fct>,
      #   QSEVLINT <fct>, VISIT <fct>, VISITNUM <int>, ASEQ <int>, PARAM <fct>,
      #   PARAMCD <fct>, PARCAT1 <fct>, PARCAT1N <dbl>, PARCAT2 <fct>, AVAL <dbl>,
      #   AVALC <fct>, BASE <dbl>, ABLFL <fct>, CHG <dbl>, PCHG <dbl>, ...

