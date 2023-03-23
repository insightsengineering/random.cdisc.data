# radsl produces expected values

    Code
      first_pt_rows
    Output
      # A tibble: 1 x 55
        STUDYID USUBJID     SUBJID SITEID   AGE AGEU  SEX   RACE  ETHNIC COUNTRY DTHFL
        <chr>   <chr>       <chr>  <chr>  <int> <fct> <fct> <fct> <fct>  <fct>   <fct>
      1 AB12345 AB12345-CH~ id-10  CHN-3     35 YEARS M     ASIAN NOT H~ CHN     N    
      # ... with 44 more variables: INVID <chr>, INVNAM <chr>, ARM <fct>,
      #   ARMCD <fct>, ACTARM <fct>, ACTARMCD <fct>, TRT01P <fct>, TRT01A <fct>,
      #   TRT02P <fct>, TRT02A <fct>, REGION1 <fct>, STRATA1 <fct>, STRATA2 <fct>,
      #   BMRKR1 <dbl>, BMRKR2 <fct>, ITTFL <fct>, SAFFL <fct>, BMEASIFL <fct>,
      #   BEP01FL <fct>, AEWITHFL <fct>, RANDDT <date>, TRTSDTM <dttm>,
      #   TRTEDTM <dttm>, TRT01SDTM <dttm>, TRT01EDTM <dttm>, TRT02SDTM <dttm>,
      #   TRT02EDTM <dttm>, AP01SDTM <dttm>, AP01EDTM <dttm>, AP02SDTM <dttm>, ...

---

    Code
      rand_rows
    Output
      # A tibble: 5 x 55
        STUDYID USUBJID     SUBJID SITEID   AGE AGEU  SEX   RACE  ETHNIC COUNTRY DTHFL
        <chr>   <chr>       <chr>  <chr>  <int> <fct> <fct> <fct> <fct>  <fct>   <fct>
      1 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      2 AB12345 AB12345-CH~ id-1   CHN-11    35 YEARS F     WHITE NOT H~ CHN     Y    
      3 AB12345 AB12345-CH~ id-5   CHN-3     36 YEARS F     ASIAN NOT H~ CHN     N    
      4 AB12345 AB12345-BR~ id-8   BRA-9     31 YEARS F     ASIAN NOT H~ BRA     Y    
      5 AB12345 AB12345-RU~ id-4   RUS-1     36 YEARS M     BLAC~ NOT H~ RUS     N    
      # ... with 44 more variables: INVID <chr>, INVNAM <chr>, ARM <fct>,
      #   ARMCD <fct>, ACTARM <fct>, ACTARMCD <fct>, TRT01P <fct>, TRT01A <fct>,
      #   TRT02P <fct>, TRT02A <fct>, REGION1 <fct>, STRATA1 <fct>, STRATA2 <fct>,
      #   BMRKR1 <dbl>, BMRKR2 <fct>, ITTFL <fct>, SAFFL <fct>, BMEASIFL <fct>,
      #   BEP01FL <fct>, AEWITHFL <fct>, RANDDT <date>, TRTSDTM <dttm>,
      #   TRTEDTM <dttm>, TRT01SDTM <dttm>, TRT01EDTM <dttm>, TRT02SDTM <dttm>,
      #   TRT02EDTM <dttm>, AP01SDTM <dttm>, AP01EDTM <dttm>, AP02SDTM <dttm>, ...

# radae produces expected values

    Code
      first_pt_rows
    Output
      # A tibble: 7 x 92
        STUDYID USUBJID     SUBJID SITEID   AGE AGEU  SEX   RACE  ETHNIC COUNTRY DTHFL
        <chr>   <chr>       <chr>  <chr>  <int> <fct> <fct> <fct> <fct>  <fct>   <fct>
      1 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      2 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      3 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      4 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      5 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      6 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      7 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      # ... with 81 more variables: INVID <chr>, INVNAM <chr>, ARM <fct>,
      #   ARMCD <fct>, ACTARM <fct>, ACTARMCD <fct>, TRT01P <fct>, TRT01A <fct>,
      #   TRT02P <fct>, TRT02A <fct>, REGION1 <fct>, STRATA1 <fct>, STRATA2 <fct>,
      #   BMRKR1 <dbl>, BMRKR2 <fct>, ITTFL <fct>, SAFFL <fct>, BMEASIFL <fct>,
      #   BEP01FL <fct>, AEWITHFL <fct>, RANDDT <date>, TRTSDTM <dttm>,
      #   TRTEDTM <dttm>, TRT01SDTM <dttm>, TRT01EDTM <dttm>, TRT02SDTM <dttm>,
      #   TRT02EDTM <dttm>, AP01SDTM <dttm>, AP01EDTM <dttm>, AP02SDTM <dttm>, ...

---

    Code
      rand_rows
    Output
      # A tibble: 10 x 92
         STUDYID USUBJID    SUBJID SITEID   AGE AGEU  SEX   RACE  ETHNIC COUNTRY DTHFL
         <chr>   <chr>      <chr>  <chr>  <int> <fct> <fct> <fct> <fct>  <fct>   <fct>
       1 AB12345 AB12345-C~ id-1   CHN-11    35 YEARS F     WHITE NOT H~ CHN     Y    
       2 AB12345 AB12345-C~ id-1   CHN-11    35 YEARS F     WHITE NOT H~ CHN     Y    
       3 AB12345 AB12345-C~ id-1   CHN-11    35 YEARS F     WHITE NOT H~ CHN     Y    
       4 AB12345 AB12345-R~ id-6   RUS-1     36 YEARS F     ASIAN NOT H~ RUS     N    
       5 AB12345 AB12345-C~ id-2   CHN-11    35 YEARS M     BLAC~ NOT H~ CHN     N    
       6 AB12345 AB12345-U~ id-3   USA-13    35 YEARS F     AMER~ NOT H~ USA     N    
       7 AB12345 AB12345-R~ id-4   RUS-1     36 YEARS M     BLAC~ NOT H~ RUS     N    
       8 AB12345 AB12345-R~ id-4   RUS-1     36 YEARS M     BLAC~ NOT H~ RUS     N    
       9 AB12345 AB12345-C~ id-10  CHN-3     35 YEARS M     ASIAN NOT H~ CHN     N    
      10 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      # ... with 81 more variables: INVID <chr>, INVNAM <chr>, ARM <fct>,
      #   ARMCD <fct>, ACTARM <fct>, ACTARMCD <fct>, TRT01P <fct>, TRT01A <fct>,
      #   TRT02P <fct>, TRT02A <fct>, REGION1 <fct>, STRATA1 <fct>, STRATA2 <fct>,
      #   BMRKR1 <dbl>, BMRKR2 <fct>, ITTFL <fct>, SAFFL <fct>, BMEASIFL <fct>,
      #   BEP01FL <fct>, AEWITHFL <fct>, RANDDT <date>, TRTSDTM <dttm>,
      #   TRTEDTM <dttm>, TRT01SDTM <dttm>, TRT01EDTM <dttm>, TRT02SDTM <dttm>,
      #   TRT02EDTM <dttm>, AP01SDTM <dttm>, AP01EDTM <dttm>, AP02SDTM <dttm>, ...

# radaette produces expected values

    Code
      first_pt_rows
    Output
      # A tibble: 9 x 66
        STUDYID USUBJID     SUBJID SITEID   AGE AGEU  SEX   RACE  ETHNIC COUNTRY DTHFL
        <chr>   <chr>       <chr>  <chr>  <int> <fct> <fct> <fct> <fct>  <fct>   <fct>
      1 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      2 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      3 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      4 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      5 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      6 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      7 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      8 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      9 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      # ... with 55 more variables: INVID <chr>, INVNAM <chr>, ARM <fct>,
      #   ARMCD <fct>, ACTARM <fct>, ACTARMCD <fct>, TRT01P <fct>, TRT01A <fct>,
      #   TRT02P <fct>, TRT02A <fct>, REGION1 <fct>, STRATA1 <fct>, STRATA2 <fct>,
      #   BMRKR1 <dbl>, BMRKR2 <fct>, ITTFL <fct>, SAFFL <fct>, BMEASIFL <fct>,
      #   BEP01FL <fct>, AEWITHFL <fct>, RANDDT <date>, TRTSDTM <dttm>,
      #   TRTEDTM <dttm>, TRT01SDTM <dttm>, TRT01EDTM <dttm>, TRT02SDTM <dttm>,
      #   TRT02EDTM <dttm>, AP01SDTM <dttm>, AP01EDTM <dttm>, AP02SDTM <dttm>, ...

---

    Code
      rand_rows
    Output
      # A tibble: 10 x 66
         STUDYID USUBJID    SUBJID SITEID   AGE AGEU  SEX   RACE  ETHNIC COUNTRY DTHFL
         <chr>   <chr>      <chr>  <chr>  <int> <fct> <fct> <fct> <fct>  <fct>   <fct>
       1 AB12345 AB12345-C~ id-5   CHN-3     36 YEARS F     ASIAN NOT H~ CHN     N    
       2 AB12345 AB12345-B~ id-8   BRA-9     31 YEARS F     ASIAN NOT H~ BRA     Y    
       3 AB12345 AB12345-U~ id-3   USA-13    35 YEARS F     AMER~ NOT H~ USA     N    
       4 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       5 AB12345 AB12345-C~ id-5   CHN-3     36 YEARS F     ASIAN NOT H~ CHN     N    
       6 AB12345 AB12345-R~ id-4   RUS-1     36 YEARS M     BLAC~ NOT H~ RUS     N    
       7 AB12345 AB12345-C~ id-10  CHN-3     35 YEARS M     ASIAN NOT H~ CHN     N    
       8 AB12345 AB12345-R~ id-6   RUS-1     36 YEARS F     ASIAN NOT H~ RUS     N    
       9 AB12345 AB12345-R~ id-4   RUS-1     36 YEARS M     BLAC~ NOT H~ RUS     N    
      10 AB12345 AB12345-C~ id-1   CHN-11    35 YEARS F     WHITE NOT H~ CHN     Y    
      # ... with 55 more variables: INVID <chr>, INVNAM <chr>, ARM <fct>,
      #   ARMCD <fct>, ACTARM <fct>, ACTARMCD <fct>, TRT01P <fct>, TRT01A <fct>,
      #   TRT02P <fct>, TRT02A <fct>, REGION1 <fct>, STRATA1 <fct>, STRATA2 <fct>,
      #   BMRKR1 <dbl>, BMRKR2 <fct>, ITTFL <fct>, SAFFL <fct>, BMEASIFL <fct>,
      #   BEP01FL <fct>, AEWITHFL <fct>, RANDDT <date>, TRTSDTM <dttm>,
      #   TRTEDTM <dttm>, TRT01SDTM <dttm>, TRT01EDTM <dttm>, TRT02SDTM <dttm>,
      #   TRT02EDTM <dttm>, AP01SDTM <dttm>, AP01EDTM <dttm>, AP02SDTM <dttm>, ...

# radcm produces expected values

    Code
      first_pt_rows
    Output
      # A tibble: 5 x 83
        STUDYID USUBJID     SUBJID SITEID   AGE AGEU  SEX   RACE  ETHNIC COUNTRY DTHFL
        <chr>   <chr>       <chr>  <chr>  <int> <fct> <fct> <fct> <fct>  <fct>   <fct>
      1 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      2 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      3 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      4 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      5 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      # ... with 72 more variables: INVID <chr>, INVNAM <chr>, ARM <fct>,
      #   ARMCD <fct>, ACTARM <fct>, ACTARMCD <fct>, TRT01P <fct>, TRT01A <fct>,
      #   TRT02P <fct>, TRT02A <fct>, REGION1 <fct>, STRATA1 <fct>, STRATA2 <fct>,
      #   BMRKR1 <dbl>, BMRKR2 <fct>, ITTFL <fct>, SAFFL <fct>, BMEASIFL <fct>,
      #   BEP01FL <fct>, AEWITHFL <fct>, RANDDT <date>, TRTSDTM <dttm>,
      #   TRTEDTM <dttm>, TRT01SDTM <dttm>, TRT01EDTM <dttm>, TRT02SDTM <dttm>,
      #   TRT02EDTM <dttm>, AP01SDTM <dttm>, AP01EDTM <dttm>, AP02SDTM <dttm>, ...

---

    Code
      rand_rows
    Output
      # A tibble: 10 x 83
         STUDYID USUBJID    SUBJID SITEID   AGE AGEU  SEX   RACE  ETHNIC COUNTRY DTHFL
         <chr>   <chr>      <chr>  <chr>  <int> <fct> <fct> <fct> <fct>  <fct>   <fct>
       1 AB12345 AB12345-C~ id-10  CHN-3     35 YEARS M     ASIAN NOT H~ CHN     N    
       2 AB12345 AB12345-R~ id-6   RUS-1     36 YEARS F     ASIAN NOT H~ RUS     N    
       3 AB12345 AB12345-C~ id-5   CHN-3     36 YEARS F     ASIAN NOT H~ CHN     N    
       4 AB12345 AB12345-C~ id-2   CHN-11    35 YEARS M     BLAC~ NOT H~ CHN     N    
       5 AB12345 AB12345-B~ id-8   BRA-9     31 YEARS F     ASIAN NOT H~ BRA     Y    
       6 AB12345 AB12345-C~ id-5   CHN-3     36 YEARS F     ASIAN NOT H~ CHN     N    
       7 AB12345 AB12345-C~ id-5   CHN-3     36 YEARS F     ASIAN NOT H~ CHN     N    
       8 AB12345 AB12345-J~ id-7   JPN-4     30 YEARS F     ASIAN NOT H~ JPN     N    
       9 AB12345 AB12345-U~ id-3   USA-13    35 YEARS F     AMER~ NOT H~ USA     N    
      10 AB12345 AB12345-C~ id-10  CHN-3     35 YEARS M     ASIAN NOT H~ CHN     N    
      # ... with 72 more variables: INVID <chr>, INVNAM <chr>, ARM <fct>,
      #   ARMCD <fct>, ACTARM <fct>, ACTARMCD <fct>, TRT01P <fct>, TRT01A <fct>,
      #   TRT02P <fct>, TRT02A <fct>, REGION1 <fct>, STRATA1 <fct>, STRATA2 <fct>,
      #   BMRKR1 <dbl>, BMRKR2 <fct>, ITTFL <fct>, SAFFL <fct>, BMEASIFL <fct>,
      #   BEP01FL <fct>, AEWITHFL <fct>, RANDDT <date>, TRTSDTM <dttm>,
      #   TRTEDTM <dttm>, TRT01SDTM <dttm>, TRT01EDTM <dttm>, TRT02SDTM <dttm>,
      #   TRT02EDTM <dttm>, AP01SDTM <dttm>, AP01EDTM <dttm>, AP02SDTM <dttm>, ...

# raddv produces expected values

    Code
      first_pt_rows
    Output
      # A tibble: 2 x 66
        STUDYID USUBJID     SUBJID SITEID   AGE AGEU  SEX   RACE  ETHNIC COUNTRY DTHFL
        <chr>   <chr>       <chr>  <chr>  <int> <fct> <fct> <fct> <fct>  <fct>   <fct>
      1 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      2 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      # ... with 55 more variables: INVID <chr>, INVNAM <chr>, ARM <fct>,
      #   ARMCD <fct>, ACTARM <fct>, ACTARMCD <fct>, TRT01P <fct>, TRT01A <fct>,
      #   TRT02P <fct>, TRT02A <fct>, REGION1 <fct>, STRATA1 <fct>, STRATA2 <fct>,
      #   BMRKR1 <dbl>, BMRKR2 <fct>, ITTFL <fct>, SAFFL <fct>, BMEASIFL <fct>,
      #   BEP01FL <fct>, AEWITHFL <fct>, RANDDT <date>, TRTSDTM <dttm>,
      #   TRTEDTM <dttm>, TRT01SDTM <dttm>, TRT01EDTM <dttm>, TRT02SDTM <dttm>,
      #   TRT02EDTM <dttm>, AP01SDTM <dttm>, AP01EDTM <dttm>, AP02SDTM <dttm>, ...

---

    Code
      rand_rows
    Output
      # A tibble: 2 x 66
        STUDYID USUBJID     SUBJID SITEID   AGE AGEU  SEX   RACE  ETHNIC COUNTRY DTHFL
        <chr>   <chr>       <chr>  <chr>  <int> <fct> <fct> <fct> <fct>  <fct>   <fct>
      1 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      2 AB12345 AB12345-BR~ id-8   BRA-9     31 YEARS F     ASIAN NOT H~ BRA     Y    
      # ... with 55 more variables: INVID <chr>, INVNAM <chr>, ARM <fct>,
      #   ARMCD <fct>, ACTARM <fct>, ACTARMCD <fct>, TRT01P <fct>, TRT01A <fct>,
      #   TRT02P <fct>, TRT02A <fct>, REGION1 <fct>, STRATA1 <fct>, STRATA2 <fct>,
      #   BMRKR1 <dbl>, BMRKR2 <fct>, ITTFL <fct>, SAFFL <fct>, BMEASIFL <fct>,
      #   BEP01FL <fct>, AEWITHFL <fct>, RANDDT <date>, TRTSDTM <dttm>,
      #   TRTEDTM <dttm>, TRT01SDTM <dttm>, TRT01EDTM <dttm>, TRT02SDTM <dttm>,
      #   TRT02EDTM <dttm>, AP01SDTM <dttm>, AP01EDTM <dttm>, AP02SDTM <dttm>, ...

# radeg produces expected values

    Code
      first_pt_rows
    Output
      # A tibble: 34 x 88
         STUDYID USUBJID    SUBJID SITEID   AGE AGEU  SEX   RACE  ETHNIC COUNTRY DTHFL
         <chr>   <chr>      <chr>  <chr>  <int> <fct> <fct> <fct> <fct>  <fct>   <fct>
       1 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       2 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       3 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       4 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       5 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       6 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       7 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       8 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       9 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      10 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      # ... with 24 more rows, and 77 more variables: INVID <chr>, INVNAM <chr>,
      #   ARM <fct>, ARMCD <fct>, ACTARM <fct>, ACTARMCD <fct>, TRT01P <fct>,
      #   TRT01A <fct>, TRT02P <fct>, TRT02A <fct>, REGION1 <fct>, STRATA1 <fct>,
      #   STRATA2 <fct>, BMRKR1 <dbl>, BMRKR2 <fct>, ITTFL <fct>, SAFFL <fct>,
      #   BMEASIFL <fct>, BEP01FL <fct>, AEWITHFL <fct>, RANDDT <date>,
      #   TRTSDTM <dttm>, TRTEDTM <dttm>, TRT01SDTM <dttm>, TRT01EDTM <dttm>,
      #   TRT02SDTM <dttm>, TRT02EDTM <dttm>, AP01SDTM <dttm>, AP01EDTM <dttm>, ...

---

    Code
      rand_rows
    Output
      # A tibble: 10 x 88
         STUDYID USUBJID    SUBJID SITEID   AGE AGEU  SEX   RACE  ETHNIC COUNTRY DTHFL
         <chr>   <chr>      <chr>  <chr>  <int> <fct> <fct> <fct> <fct>  <fct>   <fct>
       1 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       2 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       3 AB12345 AB12345-U~ id-3   USA-13    35 YEARS F     AMER~ NOT H~ USA     N    
       4 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       5 AB12345 AB12345-R~ id-4   RUS-1     36 YEARS M     BLAC~ NOT H~ RUS     N    
       6 AB12345 AB12345-C~ id-10  CHN-3     35 YEARS M     ASIAN NOT H~ CHN     N    
       7 AB12345 AB12345-U~ id-3   USA-13    35 YEARS F     AMER~ NOT H~ USA     N    
       8 AB12345 AB12345-C~ id-10  CHN-3     35 YEARS M     ASIAN NOT H~ CHN     N    
       9 AB12345 AB12345-C~ id-5   CHN-3     36 YEARS F     ASIAN NOT H~ CHN     N    
      10 AB12345 AB12345-R~ id-4   RUS-1     36 YEARS M     BLAC~ NOT H~ RUS     N    
      # ... with 77 more variables: INVID <chr>, INVNAM <chr>, ARM <fct>,
      #   ARMCD <fct>, ACTARM <fct>, ACTARMCD <fct>, TRT01P <fct>, TRT01A <fct>,
      #   TRT02P <fct>, TRT02A <fct>, REGION1 <fct>, STRATA1 <fct>, STRATA2 <fct>,
      #   BMRKR1 <dbl>, BMRKR2 <fct>, ITTFL <fct>, SAFFL <fct>, BMEASIFL <fct>,
      #   BEP01FL <fct>, AEWITHFL <fct>, RANDDT <date>, TRTSDTM <dttm>,
      #   TRTEDTM <dttm>, TRT01SDTM <dttm>, TRT01EDTM <dttm>, TRT02SDTM <dttm>,
      #   TRT02EDTM <dttm>, AP01SDTM <dttm>, AP01EDTM <dttm>, AP02SDTM <dttm>, ...

# radex produces expected values

    Code
      first_pt_rows
    Output
      # A tibble: 16 x 79
         STUDYID USUBJID    SUBJID SITEID   AGE AGEU  SEX   RACE  ETHNIC COUNTRY DTHFL
         <chr>   <chr>      <chr>  <chr>  <int> <fct> <fct> <fct> <fct>  <fct>   <fct>
       1 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       2 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       3 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       4 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       5 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       6 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       7 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       8 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       9 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      10 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      11 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      12 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      13 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      14 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      15 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      16 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      # ... with 68 more variables: INVID <chr>, INVNAM <chr>, ARM <fct>,
      #   ARMCD <fct>, ACTARM <fct>, ACTARMCD <fct>, TRT01P <fct>, TRT01A <fct>,
      #   TRT02P <fct>, TRT02A <fct>, REGION1 <fct>, STRATA1 <fct>, STRATA2 <fct>,
      #   BMRKR1 <dbl>, BMRKR2 <fct>, ITTFL <fct>, SAFFL <fct>, BMEASIFL <fct>,
      #   BEP01FL <fct>, AEWITHFL <fct>, RANDDT <date>, TRTSDTM <dttm>,
      #   TRTEDTM <dttm>, TRT01SDTM <dttm>, TRT01EDTM <dttm>, TRT02SDTM <dttm>,
      #   TRT02EDTM <dttm>, AP01SDTM <dttm>, AP01EDTM <dttm>, AP02SDTM <dttm>, ...

---

    Code
      rand_rows
    Output
      # A tibble: 10 x 79
         STUDYID USUBJID    SUBJID SITEID   AGE AGEU  SEX   RACE  ETHNIC COUNTRY DTHFL
         <chr>   <chr>      <chr>  <chr>  <int> <fct> <fct> <fct> <fct>  <fct>   <fct>
       1 AB12345 AB12345-R~ id-4   RUS-1     36 YEARS M     BLAC~ NOT H~ RUS     N    
       2 AB12345 AB12345-U~ id-3   USA-13    35 YEARS F     AMER~ NOT H~ USA     N    
       3 AB12345 AB12345-B~ id-8   BRA-9     31 YEARS F     ASIAN NOT H~ BRA     Y    
       4 AB12345 AB12345-C~ id-1   CHN-11    35 YEARS F     WHITE NOT H~ CHN     Y    
       5 AB12345 AB12345-R~ id-4   RUS-1     36 YEARS M     BLAC~ NOT H~ RUS     N    
       6 AB12345 AB12345-C~ id-1   CHN-11    35 YEARS F     WHITE NOT H~ CHN     Y    
       7 AB12345 AB12345-U~ id-3   USA-13    35 YEARS F     AMER~ NOT H~ USA     N    
       8 AB12345 AB12345-C~ id-5   CHN-3     36 YEARS F     ASIAN NOT H~ CHN     N    
       9 AB12345 AB12345-B~ id-8   BRA-9     31 YEARS F     ASIAN NOT H~ BRA     Y    
      10 AB12345 AB12345-J~ id-7   JPN-4     30 YEARS F     ASIAN NOT H~ JPN     N    
      # ... with 68 more variables: INVID <chr>, INVNAM <chr>, ARM <fct>,
      #   ARMCD <fct>, ACTARM <fct>, ACTARMCD <fct>, TRT01P <fct>, TRT01A <fct>,
      #   TRT02P <fct>, TRT02A <fct>, REGION1 <fct>, STRATA1 <fct>, STRATA2 <fct>,
      #   BMRKR1 <dbl>, BMRKR2 <fct>, ITTFL <fct>, SAFFL <fct>, BMEASIFL <fct>,
      #   BEP01FL <fct>, AEWITHFL <fct>, RANDDT <date>, TRTSDTM <dttm>,
      #   TRTEDTM <dttm>, TRT01SDTM <dttm>, TRT01EDTM <dttm>, TRT02SDTM <dttm>,
      #   TRT02EDTM <dttm>, AP01SDTM <dttm>, AP01EDTM <dttm>, AP02SDTM <dttm>, ...

# radhy produces expected values

    Code
      first_pt_rows
    Output
      # A tibble: 50 x 71
         STUDYID USUBJID    SUBJID SITEID   AGE AGEU  SEX   RACE  ETHNIC COUNTRY DTHFL
         <chr>   <chr>      <chr>  <chr>  <int> <fct> <fct> <fct> <fct>  <fct>   <fct>
       1 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       2 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       3 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       4 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       5 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       6 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       7 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       8 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       9 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      10 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      # ... with 40 more rows, and 60 more variables: INVID <chr>, INVNAM <chr>,
      #   ARM <fct>, ARMCD <fct>, ACTARM <fct>, ACTARMCD <fct>, TRT01P <fct>,
      #   TRT01A <fct>, TRT02P <fct>, TRT02A <fct>, REGION1 <fct>, STRATA1 <fct>,
      #   STRATA2 <fct>, BMRKR1 <dbl>, BMRKR2 <fct>, ITTFL <fct>, SAFFL <fct>,
      #   BMEASIFL <fct>, BEP01FL <fct>, AEWITHFL <fct>, RANDDT <date>,
      #   TRTSDTM <dttm>, TRTEDTM <dttm>, TRT01SDTM <dttm>, TRT01EDTM <dttm>,
      #   TRT02SDTM <dttm>, TRT02EDTM <dttm>, AP01SDTM <dttm>, AP01EDTM <dttm>, ...

---

    Code
      rand_rows
    Output
      # A tibble: 10 x 71
         STUDYID USUBJID    SUBJID SITEID   AGE AGEU  SEX   RACE  ETHNIC COUNTRY DTHFL
         <chr>   <chr>      <chr>  <chr>  <int> <fct> <fct> <fct> <fct>  <fct>   <fct>
       1 AB12345 AB12345-C~ id-10  CHN-3     35 YEARS M     ASIAN NOT H~ CHN     N    
       2 AB12345 AB12345-C~ id-1   CHN-11    35 YEARS F     WHITE NOT H~ CHN     Y    
       3 AB12345 AB12345-R~ id-6   RUS-1     36 YEARS F     ASIAN NOT H~ RUS     N    
       4 AB12345 AB12345-R~ id-6   RUS-1     36 YEARS F     ASIAN NOT H~ RUS     N    
       5 AB12345 AB12345-R~ id-4   RUS-1     36 YEARS M     BLAC~ NOT H~ RUS     N    
       6 AB12345 AB12345-C~ id-5   CHN-3     36 YEARS F     ASIAN NOT H~ CHN     N    
       7 AB12345 AB12345-B~ id-8   BRA-9     31 YEARS F     ASIAN NOT H~ BRA     Y    
       8 AB12345 AB12345-C~ id-2   CHN-11    35 YEARS M     BLAC~ NOT H~ CHN     N    
       9 AB12345 AB12345-U~ id-3   USA-13    35 YEARS F     AMER~ NOT H~ USA     N    
      10 AB12345 AB12345-C~ id-10  CHN-3     35 YEARS M     ASIAN NOT H~ CHN     N    
      # ... with 60 more variables: INVID <chr>, INVNAM <chr>, ARM <fct>,
      #   ARMCD <fct>, ACTARM <fct>, ACTARMCD <fct>, TRT01P <fct>, TRT01A <fct>,
      #   TRT02P <fct>, TRT02A <fct>, REGION1 <fct>, STRATA1 <fct>, STRATA2 <fct>,
      #   BMRKR1 <dbl>, BMRKR2 <fct>, ITTFL <fct>, SAFFL <fct>, BMEASIFL <fct>,
      #   BEP01FL <fct>, AEWITHFL <fct>, RANDDT <date>, TRTSDTM <dttm>,
      #   TRTEDTM <dttm>, TRT01SDTM <dttm>, TRT01EDTM <dttm>, TRT02SDTM <dttm>,
      #   TRT02EDTM <dttm>, AP01SDTM <dttm>, AP01EDTM <dttm>, AP02SDTM <dttm>, ...

# radlb produces expected values

    Code
      first_pt_rows
    Output
      # A tibble: 21 x 102
         STUDYID USUBJID    SUBJID SITEID   AGE AGEU  SEX   RACE  ETHNIC COUNTRY DTHFL
         <chr>   <chr>      <chr>  <chr>  <int> <fct> <fct> <fct> <fct>  <fct>   <fct>
       1 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       2 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       3 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       4 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       5 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       6 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       7 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       8 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       9 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      10 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      # ... with 11 more rows, and 91 more variables: INVID <chr>, INVNAM <chr>,
      #   ARM <fct>, ARMCD <fct>, ACTARM <fct>, ACTARMCD <fct>, TRT01P <fct>,
      #   TRT01A <fct>, TRT02P <fct>, TRT02A <fct>, REGION1 <fct>, STRATA1 <fct>,
      #   STRATA2 <fct>, BMRKR1 <dbl>, BMRKR2 <fct>, ITTFL <fct>, SAFFL <fct>,
      #   BMEASIFL <fct>, BEP01FL <fct>, AEWITHFL <fct>, RANDDT <date>,
      #   TRTSDTM <dttm>, TRTEDTM <dttm>, TRT01SDTM <dttm>, TRT01EDTM <dttm>,
      #   TRT02SDTM <dttm>, TRT02EDTM <dttm>, AP01SDTM <dttm>, AP01EDTM <dttm>, ...

---

    Code
      rand_rows
    Output
      # A tibble: 10 x 102
         STUDYID USUBJID    SUBJID SITEID   AGE AGEU  SEX   RACE  ETHNIC COUNTRY DTHFL
         <chr>   <chr>      <chr>  <chr>  <int> <fct> <fct> <fct> <fct>  <fct>   <fct>
       1 AB12345 AB12345-C~ id-10  CHN-3     35 YEARS M     ASIAN NOT H~ CHN     N    
       2 AB12345 AB12345-C~ id-10  CHN-3     35 YEARS M     ASIAN NOT H~ CHN     N    
       3 AB12345 AB12345-U~ id-3   USA-13    35 YEARS F     AMER~ NOT H~ USA     N    
       4 AB12345 AB12345-J~ id-7   JPN-4     30 YEARS F     ASIAN NOT H~ JPN     N    
       5 AB12345 AB12345-R~ id-4   RUS-1     36 YEARS M     BLAC~ NOT H~ RUS     N    
       6 AB12345 AB12345-C~ id-5   CHN-3     36 YEARS F     ASIAN NOT H~ CHN     N    
       7 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       8 AB12345 AB12345-B~ id-8   BRA-9     31 YEARS F     ASIAN NOT H~ BRA     Y    
       9 AB12345 AB12345-C~ id-5   CHN-3     36 YEARS F     ASIAN NOT H~ CHN     N    
      10 AB12345 AB12345-C~ id-2   CHN-11    35 YEARS M     BLAC~ NOT H~ CHN     N    
      # ... with 91 more variables: INVID <chr>, INVNAM <chr>, ARM <fct>,
      #   ARMCD <fct>, ACTARM <fct>, ACTARMCD <fct>, TRT01P <fct>, TRT01A <fct>,
      #   TRT02P <fct>, TRT02A <fct>, REGION1 <fct>, STRATA1 <fct>, STRATA2 <fct>,
      #   BMRKR1 <dbl>, BMRKR2 <fct>, ITTFL <fct>, SAFFL <fct>, BMEASIFL <fct>,
      #   BEP01FL <fct>, AEWITHFL <fct>, RANDDT <date>, TRTSDTM <dttm>,
      #   TRTEDTM <dttm>, TRT01SDTM <dttm>, TRT01EDTM <dttm>, TRT02SDTM <dttm>,
      #   TRT02EDTM <dttm>, AP01SDTM <dttm>, AP01EDTM <dttm>, AP02SDTM <dttm>, ...

# radmh produces expected values

    Code
      first_pt_rows
    Output
      # A tibble: 7 x 67
        STUDYID USUBJID     SUBJID SITEID   AGE AGEU  SEX   RACE  ETHNIC COUNTRY DTHFL
        <chr>   <chr>       <chr>  <chr>  <int> <fct> <fct> <fct> <fct>  <fct>   <fct>
      1 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      2 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      3 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      4 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      5 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      6 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      7 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      # ... with 56 more variables: INVID <chr>, INVNAM <chr>, ARM <fct>,
      #   ARMCD <fct>, ACTARM <fct>, ACTARMCD <fct>, TRT01P <fct>, TRT01A <fct>,
      #   TRT02P <fct>, TRT02A <fct>, REGION1 <fct>, STRATA1 <fct>, STRATA2 <fct>,
      #   BMRKR1 <dbl>, BMRKR2 <fct>, ITTFL <fct>, SAFFL <fct>, BMEASIFL <fct>,
      #   BEP01FL <fct>, AEWITHFL <fct>, RANDDT <date>, TRTSDTM <dttm>,
      #   TRTEDTM <dttm>, TRT01SDTM <dttm>, TRT01EDTM <dttm>, TRT02SDTM <dttm>,
      #   TRT02EDTM <dttm>, AP01SDTM <dttm>, AP01EDTM <dttm>, AP02SDTM <dttm>, ...

---

    Code
      rand_rows
    Output
      # A tibble: 10 x 67
         STUDYID USUBJID    SUBJID SITEID   AGE AGEU  SEX   RACE  ETHNIC COUNTRY DTHFL
         <chr>   <chr>      <chr>  <chr>  <int> <fct> <fct> <fct> <fct>  <fct>   <fct>
       1 AB12345 AB12345-C~ id-1   CHN-11    35 YEARS F     WHITE NOT H~ CHN     Y    
       2 AB12345 AB12345-R~ id-4   RUS-1     36 YEARS M     BLAC~ NOT H~ RUS     N    
       3 AB12345 AB12345-C~ id-1   CHN-11    35 YEARS F     WHITE NOT H~ CHN     Y    
       4 AB12345 AB12345-C~ id-5   CHN-3     36 YEARS F     ASIAN NOT H~ CHN     N    
       5 AB12345 AB12345-C~ id-5   CHN-3     36 YEARS F     ASIAN NOT H~ CHN     N    
       6 AB12345 AB12345-B~ id-8   BRA-9     31 YEARS F     ASIAN NOT H~ BRA     Y    
       7 AB12345 AB12345-R~ id-6   RUS-1     36 YEARS F     ASIAN NOT H~ RUS     N    
       8 AB12345 AB12345-R~ id-6   RUS-1     36 YEARS F     ASIAN NOT H~ RUS     N    
       9 AB12345 AB12345-J~ id-7   JPN-4     30 YEARS F     ASIAN NOT H~ JPN     N    
      10 AB12345 AB12345-C~ id-5   CHN-3     36 YEARS F     ASIAN NOT H~ CHN     N    
      # ... with 56 more variables: INVID <chr>, INVNAM <chr>, ARM <fct>,
      #   ARMCD <fct>, ACTARM <fct>, ACTARMCD <fct>, TRT01P <fct>, TRT01A <fct>,
      #   TRT02P <fct>, TRT02A <fct>, REGION1 <fct>, STRATA1 <fct>, STRATA2 <fct>,
      #   BMRKR1 <dbl>, BMRKR2 <fct>, ITTFL <fct>, SAFFL <fct>, BMEASIFL <fct>,
      #   BEP01FL <fct>, AEWITHFL <fct>, RANDDT <date>, TRTSDTM <dttm>,
      #   TRTEDTM <dttm>, TRT01SDTM <dttm>, TRT01EDTM <dttm>, TRT02SDTM <dttm>,
      #   TRT02EDTM <dttm>, AP01SDTM <dttm>, AP01EDTM <dttm>, AP02SDTM <dttm>, ...

# radpc produces expected values

    Code
      first_pt_rows
    Output
      # A tibble: 30 x 71
         STUDYID USUBJID    SUBJID SITEID   AGE AGEU  SEX   RACE  ETHNIC COUNTRY DTHFL
         <chr>   <chr>      <chr>  <chr>  <int> <fct> <fct> <fct> <fct>  <fct>   <fct>
       1 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       2 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       3 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       4 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       5 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       6 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       7 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       8 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       9 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      10 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      # ... with 20 more rows, and 60 more variables: INVID <chr>, INVNAM <chr>,
      #   ARM <fct>, ARMCD <fct>, ACTARM <fct>, ACTARMCD <fct>, TRT01P <fct>,
      #   TRT01A <fct>, TRT02P <fct>, TRT02A <fct>, REGION1 <fct>, STRATA1 <fct>,
      #   STRATA2 <fct>, BMRKR1 <dbl>, BMRKR2 <fct>, ITTFL <fct>, SAFFL <fct>,
      #   BMEASIFL <fct>, BEP01FL <fct>, AEWITHFL <fct>, RANDDT <date>,
      #   TRTSDTM <dttm>, TRTEDTM <dttm>, TRT01SDTM <dttm>, TRT01EDTM <dttm>,
      #   TRT02SDTM <dttm>, TRT02EDTM <dttm>, AP01SDTM <dttm>, AP01EDTM <dttm>, ...

---

    Code
      rand_rows
    Output
      # A tibble: 10 x 71
         STUDYID USUBJID    SUBJID SITEID   AGE AGEU  SEX   RACE  ETHNIC COUNTRY DTHFL
         <chr>   <chr>      <chr>  <chr>  <int> <fct> <fct> <fct> <fct>  <fct>   <fct>
       1 AB12345 AB12345-U~ id-3   USA-13    35 YEARS F     AMER~ NOT H~ USA     N    
       2 AB12345 AB12345-U~ id-3   USA-13    35 YEARS F     AMER~ NOT H~ USA     N    
       3 AB12345 AB12345-C~ id-5   CHN-3     36 YEARS F     ASIAN NOT H~ CHN     N    
       4 AB12345 AB12345-C~ id-5   CHN-3     36 YEARS F     ASIAN NOT H~ CHN     N    
       5 AB12345 AB12345-C~ id-5   CHN-3     36 YEARS F     ASIAN NOT H~ CHN     N    
       6 AB12345 AB12345-C~ id-2   CHN-11    35 YEARS M     BLAC~ NOT H~ CHN     N    
       7 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       8 AB12345 AB12345-J~ id-7   JPN-4     30 YEARS F     ASIAN NOT H~ JPN     N    
       9 AB12345 AB12345-R~ id-6   RUS-1     36 YEARS F     ASIAN NOT H~ RUS     N    
      10 AB12345 AB12345-J~ id-7   JPN-4     30 YEARS F     ASIAN NOT H~ JPN     N    
      # ... with 60 more variables: INVID <chr>, INVNAM <chr>, ARM <fct>,
      #   ARMCD <fct>, ACTARM <fct>, ACTARMCD <fct>, TRT01P <fct>, TRT01A <fct>,
      #   TRT02P <fct>, TRT02A <fct>, REGION1 <fct>, STRATA1 <fct>, STRATA2 <fct>,
      #   BMRKR1 <dbl>, BMRKR2 <fct>, ITTFL <fct>, SAFFL <fct>, BMEASIFL <fct>,
      #   BEP01FL <fct>, AEWITHFL <fct>, RANDDT <date>, TRTSDTM <dttm>,
      #   TRTEDTM <dttm>, TRT01SDTM <dttm>, TRT01EDTM <dttm>, TRT02SDTM <dttm>,
      #   TRT02EDTM <dttm>, AP01SDTM <dttm>, AP01EDTM <dttm>, AP02SDTM <dttm>, ...

# radab produces expected values

    Code
      first_pt_rows
    Output
      # A tibble: 220 x 22
         STUDYID USUBJID      ARM   ACTARM ISTPT  AVAL AVALC AVALU PARAM PARAMCD VISIT
         <chr>   <chr>        <fct> <fct>  <fct> <dbl> <chr> <fct> <fct> <fct>   <fct>
       1 AB12345 AB12345-JPN~ A: D~ A: Dr~ Pred~  1.04 POSI~ "tit~ Anti~ R18000~ Day 1
       2 AB12345 AB12345-JPN~ A: D~ A: Dr~ Pred~  1    POSI~ ""    ADA ~ RESULT1 Day 1
       3 AB12345 AB12345-JPN~ A: D~ A: Dr~ Pred~  1.04 POSI~ "tit~ Neut~ R18000~ Day 1
       4 AB12345 AB12345-JPN~ A: D~ A: Dr~ Pred~  1    POSI~ ""    NAB ~ RESULT2 Day 1
       5 AB12345 AB12345-JPN~ A: D~ A: Dr~ Pred~  1    POSI~ ""    ADA ~ ADASTA~ Day 1
       6 AB12345 AB12345-JPN~ A: D~ A: Dr~ Pred~  0    N     ""    Trea~ INDUCD1 Day 1
       7 AB12345 AB12345-JPN~ A: D~ A: Dr~ Pred~  0    N     ""    Trea~ ENHANC1 Day 1
       8 AB12345 AB12345-JPN~ A: D~ A: Dr~ Pred~  1    Y     ""    Trea~ TRUNAF~ Day 1
       9 AB12345 AB12345-JPN~ A: D~ A: Dr~ Pred~  1    Y     ""    Trea~ EMERNE~ Day 1
      10 AB12345 AB12345-JPN~ A: D~ A: Dr~ Pred~  0    N     ""    Trea~ EMERPO~ Day 1
      # ... with 210 more rows, and 11 more variables: VISITDY <int>, PARCAT1 <fct>,
      #   ADABLFL <fct>, ADAPBLFL <fct>, ABLFL <fct>, RELTMU <fct>, ATACHAR <fct>,
      #   NRELTM1 <dbl>, ARELTM1 <dbl>, NRELTM2 <dbl>, ARELTM2 <dbl>

---

    Code
      rand_rows
    Output
      # A tibble: 10 x 22
         STUDYID USUBJID      ARM   ACTARM ISTPT  AVAL AVALC AVALU PARAM PARAMCD VISIT
         <chr>   <chr>        <fct> <fct>  <fct> <dbl> <chr> <fct> <fct> <fct>   <fct>
       1 AB12345 AB12345-USA~ A: D~ A: Dr~ ""     0    NEGA~ ""    NAB ~ RESULT2 Day 1
       2 AB12345 AB12345-CHN~ A: D~ A: Dr~ ""     1    POSI~ ""    ADA ~ ADASTA~ Day 1
       3 AB12345 AB12345-RUS~ A: D~ A: Dr~ "Pre~  0    0     "wee~ Time~ TIMADA1 Day 1
       4 AB12345 AB12345-CHN~ A: D~ A: Dr~ ""     1.07 POSI~ "tit~ Neut~ R18000~ Day 1
       5 AB12345 AB12345-CHN~ A: D~ A: Dr~ ""     1.07 POSI~ "tit~ Anti~ R18000~ Day 1
       6 AB12345 AB12345-USA~ A: D~ A: Dr~ ""     0    NEGA~ ""    NAB ~ ADASTA~ Day 1
       7 AB12345 AB12345-CHN~ A: D~ A: Dr~ ""     1    POSI~ ""    NAB ~ RESULT2 Day 1
       8 AB12345 AB12345-JPN~ A: D~ A: Dr~ ""     1    POSI~ ""    ADA ~ RESULT1 Day 1
       9 AB12345 AB12345-RUS~ A: D~ A: Dr~ ""     1    POSI~ ""    Base~ BFLAG2  Day 1
      10 AB12345 AB12345-CHN~ A: D~ A: Dr~ ""     0    N     ""    Trea~ ENHANC1 Day 1
      # ... with 11 more variables: VISITDY <int>, PARCAT1 <fct>, ADABLFL <fct>,
      #   ADAPBLFL <fct>, ABLFL <fct>, RELTMU <fct>, ATACHAR <fct>, NRELTM1 <dbl>,
      #   ARELTM1 <dbl>, NRELTM2 <dbl>, ARELTM2 <dbl>

# radpp produces expected values

    Code
      first_pt_some_rows
    Output
          STUDYID            USUBJID SUBJID SITEID AGE  AGEU SEX  RACE
      441 AB12345 AB12345-JPN-4-id-7   id-7  JPN-4  30 YEARS   F ASIAN
      402 AB12345 AB12345-JPN-4-id-7   id-7  JPN-4  30 YEARS   F ASIAN
      641 AB12345 AB12345-JPN-4-id-7   id-7  JPN-4  30 YEARS   F ASIAN
      131 AB12345 AB12345-JPN-4-id-7   id-7  JPN-4  30 YEARS   F ASIAN
      341 AB12345 AB12345-JPN-4-id-7   id-7  JPN-4  30 YEARS   F ASIAN
      531 AB12345 AB12345-JPN-4-id-7   id-7  JPN-4  30 YEARS   F ASIAN
      601 AB12345 AB12345-JPN-4-id-7   id-7  JPN-4  30 YEARS   F ASIAN
      451 AB12345 AB12345-JPN-4-id-7   id-7  JPN-4  30 YEARS   F ASIAN
      382 AB12345 AB12345-JPN-4-id-7   id-7  JPN-4  30 YEARS   F ASIAN
      642 AB12345 AB12345-JPN-4-id-7   id-7  JPN-4  30 YEARS   F ASIAN
                          ETHNIC COUNTRY DTHFL        INVID        INVNAM       ARM
      441 NOT HISPANIC OR LATINO     JPN     N INV ID JPN-4 Dr. JPN-4 Doe A: Drug X
      402 NOT HISPANIC OR LATINO     JPN     N INV ID JPN-4 Dr. JPN-4 Doe A: Drug X
      641 NOT HISPANIC OR LATINO     JPN     N INV ID JPN-4 Dr. JPN-4 Doe A: Drug X
      131 NOT HISPANIC OR LATINO     JPN     N INV ID JPN-4 Dr. JPN-4 Doe A: Drug X
      341 NOT HISPANIC OR LATINO     JPN     N INV ID JPN-4 Dr. JPN-4 Doe A: Drug X
      531 NOT HISPANIC OR LATINO     JPN     N INV ID JPN-4 Dr. JPN-4 Doe A: Drug X
      601 NOT HISPANIC OR LATINO     JPN     N INV ID JPN-4 Dr. JPN-4 Doe A: Drug X
      451 NOT HISPANIC OR LATINO     JPN     N INV ID JPN-4 Dr. JPN-4 Doe A: Drug X
      382 NOT HISPANIC OR LATINO     JPN     N INV ID JPN-4 Dr. JPN-4 Doe A: Drug X
      642 NOT HISPANIC OR LATINO     JPN     N INV ID JPN-4 Dr. JPN-4 Doe A: Drug X
          ARMCD    ACTARM ACTARMCD    TRT01P    TRT01A         TRT02P     TRT02A
      441 ARM A A: Drug X    ARM A A: Drug X A: Drug X C: Combination B: Placebo
      402 ARM A A: Drug X    ARM A A: Drug X A: Drug X C: Combination B: Placebo
      641 ARM A A: Drug X    ARM A A: Drug X A: Drug X C: Combination B: Placebo
      131 ARM A A: Drug X    ARM A A: Drug X A: Drug X C: Combination B: Placebo
      341 ARM A A: Drug X    ARM A A: Drug X A: Drug X C: Combination B: Placebo
      531 ARM A A: Drug X    ARM A A: Drug X A: Drug X C: Combination B: Placebo
      601 ARM A A: Drug X    ARM A A: Drug X A: Drug X C: Combination B: Placebo
      451 ARM A A: Drug X    ARM A A: Drug X A: Drug X C: Combination B: Placebo
      382 ARM A A: Drug X    ARM A A: Drug X A: Drug X C: Combination B: Placebo
      642 ARM A A: Drug X    ARM A A: Drug X A: Drug X C: Combination B: Placebo
          REGION1 STRATA1 STRATA2  BMRKR1 BMRKR2 ITTFL SAFFL BMEASIFL BEP01FL
      441    Asia       B      S1 7.45942 MEDIUM     Y     Y        Y       N
      402    Asia       B      S1 7.45942 MEDIUM     Y     Y        Y       N
      641    Asia       B      S1 7.45942 MEDIUM     Y     Y        Y       N
      131    Asia       B      S1 7.45942 MEDIUM     Y     Y        Y       N
      341    Asia       B      S1 7.45942 MEDIUM     Y     Y        Y       N
      531    Asia       B      S1 7.45942 MEDIUM     Y     Y        Y       N
      601    Asia       B      S1 7.45942 MEDIUM     Y     Y        Y       N
      451    Asia       B      S1 7.45942 MEDIUM     Y     Y        Y       N
      382    Asia       B      S1 7.45942 MEDIUM     Y     Y        Y       N
      642    Asia       B      S1 7.45942 MEDIUM     Y     Y        Y       N
          AEWITHFL     RANDDT             TRTSDTM             TRTEDTM
      441        N 2019-09-22 2019-09-22 02:25:18 2022-09-21 20:25:18
      402        N 2019-09-22 2019-09-22 02:25:18 2022-09-21 20:25:18
      641        N 2019-09-22 2019-09-22 02:25:18 2022-09-21 20:25:18
      131        N 2019-09-22 2019-09-22 02:25:18 2022-09-21 20:25:18
      341        N 2019-09-22 2019-09-22 02:25:18 2022-09-21 20:25:18
      531        N 2019-09-22 2019-09-22 02:25:18 2022-09-21 20:25:18
      601        N 2019-09-22 2019-09-22 02:25:18 2022-09-21 20:25:18
      451        N 2019-09-22 2019-09-22 02:25:18 2022-09-21 20:25:18
      382        N 2019-09-22 2019-09-22 02:25:18 2022-09-21 20:25:18
      642        N 2019-09-22 2019-09-22 02:25:18 2022-09-21 20:25:18
                    TRT01SDTM           TRT01EDTM           TRT02SDTM
      441 2019-09-22 02:25:18 2021-09-21 14:25:18 2021-09-21 14:25:18
      402 2019-09-22 02:25:18 2021-09-21 14:25:18 2021-09-21 14:25:18
      641 2019-09-22 02:25:18 2021-09-21 14:25:18 2021-09-21 14:25:18
      131 2019-09-22 02:25:18 2021-09-21 14:25:18 2021-09-21 14:25:18
      341 2019-09-22 02:25:18 2021-09-21 14:25:18 2021-09-21 14:25:18
      531 2019-09-22 02:25:18 2021-09-21 14:25:18 2021-09-21 14:25:18
      601 2019-09-22 02:25:18 2021-09-21 14:25:18 2021-09-21 14:25:18
      451 2019-09-22 02:25:18 2021-09-21 14:25:18 2021-09-21 14:25:18
      382 2019-09-22 02:25:18 2021-09-21 14:25:18 2021-09-21 14:25:18
      642 2019-09-22 02:25:18 2021-09-21 14:25:18 2021-09-21 14:25:18
                    TRT02EDTM            AP01SDTM            AP01EDTM
      441 2022-09-21 20:25:18 2019-09-22 02:25:18 2021-09-21 14:25:18
      402 2022-09-21 20:25:18 2019-09-22 02:25:18 2021-09-21 14:25:18
      641 2022-09-21 20:25:18 2019-09-22 02:25:18 2021-09-21 14:25:18
      131 2022-09-21 20:25:18 2019-09-22 02:25:18 2021-09-21 14:25:18
      341 2022-09-21 20:25:18 2019-09-22 02:25:18 2021-09-21 14:25:18
      531 2022-09-21 20:25:18 2019-09-22 02:25:18 2021-09-21 14:25:18
      601 2022-09-21 20:25:18 2019-09-22 02:25:18 2021-09-21 14:25:18
      451 2022-09-21 20:25:18 2019-09-22 02:25:18 2021-09-21 14:25:18
      382 2022-09-21 20:25:18 2019-09-22 02:25:18 2021-09-21 14:25:18
      642 2022-09-21 20:25:18 2019-09-22 02:25:18 2021-09-21 14:25:18
                     AP02SDTM            AP02EDTM    EOSSTT    EOTSTT      EOSDT
      441 2021-09-21 14:25:18 2022-09-21 20:25:18 COMPLETED COMPLETED 2022-09-21
      402 2021-09-21 14:25:18 2022-09-21 20:25:18 COMPLETED COMPLETED 2022-09-21
      641 2021-09-21 14:25:18 2022-09-21 20:25:18 COMPLETED COMPLETED 2022-09-21
      131 2021-09-21 14:25:18 2022-09-21 20:25:18 COMPLETED COMPLETED 2022-09-21
      341 2021-09-21 14:25:18 2022-09-21 20:25:18 COMPLETED COMPLETED 2022-09-21
      531 2021-09-21 14:25:18 2022-09-21 20:25:18 COMPLETED COMPLETED 2022-09-21
      601 2021-09-21 14:25:18 2022-09-21 20:25:18 COMPLETED COMPLETED 2022-09-21
      451 2021-09-21 14:25:18 2022-09-21 20:25:18 COMPLETED COMPLETED 2022-09-21
      382 2021-09-21 14:25:18 2022-09-21 20:25:18 COMPLETED COMPLETED 2022-09-21
      642 2021-09-21 14:25:18 2022-09-21 20:25:18 COMPLETED COMPLETED 2022-09-21
          EOSDY DCSREAS DTHDT DTHCAUS DTHCAT LDDTHELD LDDTHGR1   LSTALVDT DTHADY
      441  1096    <NA>  <NA>    <NA>   <NA>       NA     <NA> 2022-10-09     NA
      402  1096    <NA>  <NA>    <NA>   <NA>       NA     <NA> 2022-10-09     NA
      641  1096    <NA>  <NA>    <NA>   <NA>       NA     <NA> 2022-10-09     NA
      131  1096    <NA>  <NA>    <NA>   <NA>       NA     <NA> 2022-10-09     NA
      341  1096    <NA>  <NA>    <NA>   <NA>       NA     <NA> 2022-10-09     NA
      531  1096    <NA>  <NA>    <NA>   <NA>       NA     <NA> 2022-10-09     NA
      601  1096    <NA>  <NA>    <NA>   <NA>       NA     <NA> 2022-10-09     NA
      451  1096    <NA>  <NA>    <NA>   <NA>       NA     <NA> 2022-10-09     NA
      382  1096    <NA>  <NA>    <NA>   <NA>       NA     <NA> 2022-10-09     NA
      642  1096    <NA>  <NA>    <NA>   <NA>       NA     <NA> 2022-10-09     NA
          ADTHAUT             PPCAT       PPSPEC                 PARAM  PARAMCD
      441    <NA>     Plasma Drug X       Plasma      AUC Infinity Obs   AUCIFO
      402    <NA>     Plasma Drug X        Urine Pct Rec from T1 to T2  RCPCINT
      641    <NA> Metabolite Drug X        Urine Pct Rec from T1 to T2  RCPCINT
      131    <NA> Metabolite Drug X        Urine Renal CL Norm by Dose RENALCLD
      341    <NA>     Plasma Drug X        Urine Renal CL Norm by Dose RENALCLD
      531    <NA> Metabolite Drug X Matrix of PD         Time to Onset      TON
      601    <NA> Metabolite Drug X        Urine Amt Rec from T1 to T2  RCAMINT
      451    <NA> Metabolite Drug X       Plasma      AUC Infinity Obs   AUCIFO
      382    <NA> Metabolite Drug X        Urine Amt Rec from T1 to T2  RCAMINT
      642    <NA> Metabolite Drug X        Urine Pct Rec from T1 to T2  RCPCINT
          PPSTINT PPENINT        AVISIT AVISITN         AVAL               AVALC
      441    <NA>    <NA> CYCLE 1 DAY 2       2 1.688436e+02    168.843588182054
      402     P0H    P24H CYCLE 1 DAY 1       1 1.189721e+01    11.8972101827504
      641     P0H    P12H CYCLE 1 DAY 2       2 1.991969e+01    19.9196930816007
      131    <NA>    <NA>     SCREENING       0 4.610763e-03 0.00461076281828162
      341    <NA>    <NA> CYCLE 1 DAY 1       1 6.502425e-03 0.00650242453423459
      531    <NA>    <NA> CYCLE 1 DAY 2       2 3.116593e+00    3.11659264194076
      601     P0H    P12H CYCLE 1 DAY 2       2 1.802991e+00    1.80299086750583
      451    <NA>    <NA> CYCLE 1 DAY 2       2 1.465851e+02    146.585145583271
      382     P0H    P24H CYCLE 1 DAY 1       1 1.866168e+00     1.8661680167116
      642     P0H    P24H CYCLE 1 DAY 2       2 1.991969e+01    19.9196930816007
              AVALU REGIMEN PKARMCD
      441 day*ug/mL     BID  Drug G
      402         %     BID  Drug G
      641         %     BID  Drug J
      131   L/hr/mg     BID  Drug B
      341   L/hr/mg     BID  Drug F
      531        hr     BID  Drug I
      601        mg     BID  Drug J
      451 day*ug/mL     BID  Drug G
      382        mg     BID  Drug F
      642         %     BID  Drug J

---

    Code
      rand_rows
    Output
          STUDYID             USUBJID SUBJID SITEID AGE  AGEU SEX
      68  AB12345  AB12345-BRA-1-id-9   id-9  BRA-1  35 YEARS   F
      128 AB12345  AB12345-BRA-1-id-9   id-9  BRA-1  35 YEARS   F
      387 AB12345 AB12345-CHN-11-id-2   id-2 CHN-11  35 YEARS   M
      163 AB12345 AB12345-USA-13-id-3   id-3 USA-13  35 YEARS   F
      23  AB12345  AB12345-BRA-9-id-8   id-8  BRA-9  31 YEARS   F
      190 AB12345 AB12345-CHN-11-id-1   id-1 CHN-11  35 YEARS   F
      547 AB12345  AB12345-RUS-1-id-6   id-6  RUS-1  36 YEARS   F
      621 AB12345  AB12345-JPN-4-id-7   id-7  JPN-4  30 YEARS   F
      218 AB12345 AB12345-CHN-11-id-1   id-1 CHN-11  35 YEARS   F
      553 AB12345  AB12345-BRA-9-id-8   id-8  BRA-9  31 YEARS   F
                                      RACE                 ETHNIC COUNTRY DTHFL
      68         BLACK OR AFRICAN AMERICAN                UNKNOWN     BRA     N
      128        BLACK OR AFRICAN AMERICAN                UNKNOWN     BRA     N
      387        BLACK OR AFRICAN AMERICAN NOT HISPANIC OR LATINO     CHN     N
      163 AMERICAN INDIAN OR ALASKA NATIVE NOT HISPANIC OR LATINO     USA     N
      23                             ASIAN NOT HISPANIC OR LATINO     BRA     Y
      190                            WHITE NOT HISPANIC OR LATINO     CHN     Y
      547                            ASIAN NOT HISPANIC OR LATINO     RUS     N
      621                            ASIAN NOT HISPANIC OR LATINO     JPN     N
      218                            WHITE NOT HISPANIC OR LATINO     CHN     Y
      553                            ASIAN NOT HISPANIC OR LATINO     BRA     Y
                  INVID         INVNAM            ARM ARMCD         ACTARM ACTARMCD
      68   INV ID BRA-1  Dr. BRA-1 Doe C: Combination ARM C C: Combination    ARM C
      128  INV ID BRA-1  Dr. BRA-1 Doe C: Combination ARM C C: Combination    ARM C
      387 INV ID CHN-11 Dr. CHN-11 Doe      A: Drug X ARM A      A: Drug X    ARM A
      163 INV ID USA-13 Dr. USA-13 Doe      A: Drug X ARM A      A: Drug X    ARM A
      23   INV ID BRA-9  Dr. BRA-9 Doe      A: Drug X ARM A      A: Drug X    ARM A
      190 INV ID CHN-11 Dr. CHN-11 Doe C: Combination ARM C C: Combination    ARM C
      547  INV ID RUS-1  Dr. RUS-1 Doe      A: Drug X ARM A      A: Drug X    ARM A
      621  INV ID JPN-4  Dr. JPN-4 Doe      A: Drug X ARM A      A: Drug X    ARM A
      218 INV ID CHN-11 Dr. CHN-11 Doe C: Combination ARM C C: Combination    ARM C
      553  INV ID BRA-9  Dr. BRA-9 Doe      A: Drug X ARM A      A: Drug X    ARM A
                  TRT01P         TRT01A         TRT02P         TRT02A       REGION1
      68  C: Combination C: Combination      A: Drug X C: Combination South America
      128 C: Combination C: Combination      A: Drug X C: Combination South America
      387      A: Drug X      A: Drug X      A: Drug X      A: Drug X          Asia
      163      A: Drug X      A: Drug X     B: Placebo      A: Drug X North America
      23       A: Drug X      A: Drug X      A: Drug X      A: Drug X South America
      190 C: Combination C: Combination     B: Placebo     B: Placebo          Asia
      547      A: Drug X      A: Drug X C: Combination      A: Drug X       Eurasia
      621      A: Drug X      A: Drug X C: Combination     B: Placebo          Asia
      218 C: Combination C: Combination     B: Placebo     B: Placebo          Asia
      553      A: Drug X      A: Drug X      A: Drug X      A: Drug X South America
          STRATA1 STRATA2    BMRKR1 BMRKR2 ITTFL SAFFL BMEASIFL BEP01FL AEWITHFL
      68        A      S1  6.922043   HIGH     Y     Y        Y       N        N
      128       A      S1  6.922043   HIGH     Y     Y        Y       N        N
      387       C      S2  4.084350   HIGH     Y     Y        Y       Y        N
      163       C      S1  7.254058    LOW     Y     Y        Y       N        N
      23        B      S2 11.277028 MEDIUM     Y     Y        Y       Y        N
      190       B      S1  8.926907    LOW     Y     Y        N       N        N
      547       B      S1  9.342782 MEDIUM     Y     Y        N       N        N
      621       B      S1  7.459420 MEDIUM     Y     Y        Y       N        N
      218       B      S1  8.926907    LOW     Y     Y        N       N        N
      553       B      S2 11.277028 MEDIUM     Y     Y        Y       Y        N
              RANDDT             TRTSDTM             TRTEDTM           TRT01SDTM
      68  2021-01-17 2021-01-17 22:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      128 2021-01-17 2021-01-17 22:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      387 2020-02-23 2020-02-26 18:15:59                <NA> 2020-02-26 18:15:59
      163 2019-10-16 2019-10-17 17:56:02 2022-10-17 11:56:02 2019-10-17 17:56:02
      23  2020-01-18 2020-01-21 10:19:08 2021-10-16 19:37:36 2020-01-21 10:19:08
      190 2020-04-29 2020-05-02 02:28:45 2021-09-08 20:09:38 2020-05-02 02:28:45
      547 2020-10-24 2020-10-26 22:16:26 2023-10-27 16:16:26 2020-10-26 22:16:26
      621 2019-09-22 2019-09-22 02:25:18 2022-09-21 20:25:18 2019-09-22 02:25:18
      218 2020-04-29 2020-05-02 02:28:45 2021-09-08 20:09:38 2020-05-02 02:28:45
      553 2020-01-18 2020-01-21 10:19:08 2021-10-16 19:37:36 2020-01-21 10:19:08
                    TRT01EDTM           TRT02SDTM           TRT02EDTM
      68  2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53
      128 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53
      387                <NA>                <NA>                <NA>
      163 2021-10-17 05:56:02 2021-10-17 05:56:02 2022-10-17 11:56:02
      23  2020-10-16 13:37:36 2020-10-16 13:37:36 2021-10-16 19:37:36
      190 2020-09-08 14:09:38 2020-09-08 14:09:38 2021-09-08 20:09:38
      547 2022-10-27 10:16:26 2022-10-27 10:16:26 2023-10-27 16:16:26
      621 2021-09-21 14:25:18 2021-09-21 14:25:18 2022-09-21 20:25:18
      218 2020-09-08 14:09:38 2020-09-08 14:09:38 2021-09-08 20:09:38
      553 2020-10-16 13:37:36 2020-10-16 13:37:36 2021-10-16 19:37:36
                     AP01SDTM            AP01EDTM            AP02SDTM
      68  2021-01-17 22:43:53 2023-01-18 10:43:53 2023-01-18 10:43:53
      128 2021-01-17 22:43:53 2023-01-18 10:43:53 2023-01-18 10:43:53
      387 2020-02-26 18:15:59                <NA>                <NA>
      163 2019-10-17 17:56:02 2021-10-17 05:56:02 2021-10-17 05:56:02
      23  2020-01-21 10:19:08 2020-10-16 13:37:36 2020-10-16 13:37:36
      190 2020-05-02 02:28:45 2020-09-08 14:09:38 2020-09-08 14:09:38
      547 2020-10-26 22:16:26 2022-10-27 10:16:26 2022-10-27 10:16:26
      621 2019-09-22 02:25:18 2021-09-21 14:25:18 2021-09-21 14:25:18
      218 2020-05-02 02:28:45 2020-09-08 14:09:38 2020-09-08 14:09:38
      553 2020-01-21 10:19:08 2020-10-16 13:37:36 2020-10-16 13:37:36
                     AP02EDTM       EOSSTT       EOTSTT      EOSDT EOSDY DCSREAS
      68  2024-01-18 16:43:53    COMPLETED    COMPLETED 2024-01-18  1096    <NA>
      128 2024-01-18 16:43:53    COMPLETED    COMPLETED 2024-01-18  1096    <NA>
      387                <NA>      ONGOING      ONGOING       <NA>    NA    <NA>
      163 2022-10-17 11:56:02    COMPLETED    COMPLETED 2022-10-17  1096    <NA>
      23  2021-10-16 19:37:36 DISCONTINUED DISCONTINUED 2021-10-16   635   DEATH
      190 2021-09-08 20:09:38 DISCONTINUED DISCONTINUED 2021-09-08   495   DEATH
      547 2023-10-27 16:16:26    COMPLETED    COMPLETED 2023-10-27  1096    <NA>
      621 2022-09-21 20:25:18    COMPLETED    COMPLETED 2022-09-21  1096    <NA>
      218 2021-09-08 20:09:38 DISCONTINUED DISCONTINUED 2021-09-08   495   DEATH
      553 2021-10-16 19:37:36 DISCONTINUED DISCONTINUED 2021-10-16   635   DEATH
               DTHDT             DTHCAUS              DTHCAT LDDTHELD LDDTHGR1
      68        <NA>                <NA>                <NA>       NA     <NA>
      128       <NA>                <NA>                <NA>       NA     <NA>
      387       <NA>                <NA>                <NA>       NA     <NA>
      163       <NA>                <NA>                <NA>       NA     <NA>
      23  2021-11-23 DISEASE PROGRESSION PROGRESSIVE DISEASE       38      >30
      190 2021-09-27       ADVERSE EVENT       ADVERSE EVENT       19     <=30
      547       <NA>                <NA>                <NA>       NA     <NA>
      621       <NA>                <NA>                <NA>       NA     <NA>
      218 2021-09-27       ADVERSE EVENT       ADVERSE EVENT       19     <=30
      553 2021-11-23 DISEASE PROGRESSION PROGRESSIVE DISEASE       38      >30
            LSTALVDT DTHADY ADTHAUT             PPCAT       PPSPEC
      68  2024-02-10     NA    <NA>     Plasma Drug X Matrix of PD
      128 2024-02-10     NA    <NA>     Plasma Drug X        Urine
      387       <NA>     NA    <NA> Metabolite Drug X        Urine
      163 2022-10-30     NA    <NA> Metabolite Drug X        Urine
      23  2021-11-23    671     Yes     Plasma Drug X       Plasma
      190 2021-09-27    512     Yes     Plasma Drug X        Urine
      547 2023-11-13     NA    <NA>     Plasma Drug X        Urine
      621 2022-10-09     NA    <NA>     Plasma Drug X        Urine
      218 2021-09-27    512     Yes Metabolite Drug Y        Urine
      553 2021-11-23    671     Yes Metabolite Drug X        Urine
                             PARAM  PARAMCD PPSTINT PPENINT        AVISIT AVISITN
      68  Time of Maximum Response     RMAX    <NA>    <NA>     SCREENING       0
      128    Renal CL Norm by Dose RENALCLD    <NA>    <NA>     SCREENING       0
      387    Amt Rec from T1 to T2  RCAMINT     P0H    P12H CYCLE 1 DAY 1       1
      163    Amt Rec from T1 to T2  RCAMINT     P0H    P12H     SCREENING       0
      23                  Max Conc     CMAX    <NA>    <NA>     SCREENING       0
      190    Pct Rec from T1 to T2  RCPCINT     P0H    P24H     SCREENING       0
      547                 Renal CL  RENALCL    <NA>    <NA> CYCLE 1 DAY 2       2
      621    Pct Rec from T1 to T2  RCPCINT     P0H    P12H CYCLE 1 DAY 2       2
      218    Pct Rec from T1 to T2  RCPCINT     P0H    P24H     SCREENING       0
      553                 Renal CL  RENALCL    <NA>    <NA> CYCLE 1 DAY 2       2
                  AVAL               AVALC   AVALU REGIMEN PKARMCD
      68   9.351459456    9.35145945550736      hr     BID  Drug B
      128  0.006020464 0.00602046390878411 L/hr/mg     BID  Drug B
      387  1.008121621    1.00812162107276      mg     BID  Drug F
      163  2.176869812    2.17686981222235      mg     BID  Drug C
      23  33.339979192    33.3399791920419   ug/mL     BID  Drug A
      190 17.077704438    17.0777044383328       %     BID  Drug C
      547  0.059339167   0.059339167001786    L/hr     BID  Drug I
      621 16.520824372    16.5208243715726       %     BID  Drug J
      218 17.516212762    17.5162127621668       %     BID  Drug D
      553  0.052351750  0.0523517502481331    L/hr     BID  Drug I

# radqlqc produces expected values

    Code
      first_pt_rows
    Output
      # A tibble: 288 x 50
         STUDYID USUBJID   SUBJID SITEID   AGE AGEU  SEX   RACE  ETHNIC COUNTRY TRT01P
         <chr>   <chr>     <chr>  <chr>  <int> <fct> <fct> <fct> <fct>  <fct>   <fct> 
       1 AB12345 AB12345-~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     C: Co~
       2 AB12345 AB12345-~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     C: Co~
       3 AB12345 AB12345-~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     C: Co~
       4 AB12345 AB12345-~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     C: Co~
       5 AB12345 AB12345-~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     C: Co~
       6 AB12345 AB12345-~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     C: Co~
       7 AB12345 AB12345-~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     C: Co~
       8 AB12345 AB12345-~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     C: Co~
       9 AB12345 AB12345-~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     C: Co~
      10 AB12345 AB12345-~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     C: Co~
      # ... with 278 more rows, and 39 more variables: TRT01A <fct>, REGION1 <fct>,
      #   ITTFL <fct>, SAFFL <fct>, TRTSDTM <dttm>, TRTEDTM <dttm>, QSSEQ <int>,
      #   QSCAT <fct>, QSSCAT <fct>, QSDTC <dttm>, QSSTAT <fct>, QSSTRESC <fct>,
      #   QSSTRESU <fct>, QSORRES <fct>, QSORRESU <fct>, QSTEST <fct>,
      #   QSTESTCD <fct>, QSREASND <fct>, QSEVLINT <fct>, VISIT <fct>,
      #   VISITNUM <int>, ASEQ <int>, PARAM <fct>, PARAMCD <fct>, PARCAT1 <fct>,
      #   PARCAT1N <dbl>, PARCAT2 <fct>, AVAL <dbl>, AVALC <fct>, BASE <dbl>, ...

---

    Code
      rand_rows
    Output
      # A tibble: 10 x 50
         STUDYID USUBJID   SUBJID SITEID   AGE AGEU  SEX   RACE  ETHNIC COUNTRY TRT01P
         <chr>   <chr>     <chr>  <chr>  <int> <fct> <fct> <fct> <fct>  <fct>   <fct> 
       1 AB12345 AB12345-~ id-1   CHN-11    35 YEARS F     WHITE NOT H~ CHN     C: Co~
       2 AB12345 AB12345-~ id-3   USA-13    35 YEARS F     AMER~ NOT H~ USA     A: Dr~
       3 AB12345 AB12345-~ id-4   RUS-1     36 YEARS M     BLAC~ NOT H~ RUS     B: Pl~
       4 AB12345 AB12345-~ id-6   RUS-1     36 YEARS F     ASIAN NOT H~ RUS     A: Dr~
       5 AB12345 AB12345-~ id-2   CHN-11    35 YEARS M     BLAC~ NOT H~ CHN     A: Dr~
       6 AB12345 AB12345-~ id-10  CHN-3     35 YEARS M     ASIAN NOT H~ CHN     B: Pl~
       7 AB12345 AB12345-~ id-5   CHN-3     36 YEARS F     ASIAN NOT H~ CHN     A: Dr~
       8 AB12345 AB12345-~ id-7   JPN-4     30 YEARS F     ASIAN NOT H~ JPN     A: Dr~
       9 AB12345 AB12345-~ id-8   BRA-9     31 YEARS F     ASIAN NOT H~ BRA     A: Dr~
      10 AB12345 AB12345-~ id-2   CHN-11    35 YEARS M     BLAC~ NOT H~ CHN     A: Dr~
      # ... with 39 more variables: TRT01A <fct>, REGION1 <fct>, ITTFL <fct>,
      #   SAFFL <fct>, TRTSDTM <dttm>, TRTEDTM <dttm>, QSSEQ <int>, QSCAT <fct>,
      #   QSSCAT <fct>, QSDTC <dttm>, QSSTAT <fct>, QSSTRESC <fct>, QSSTRESU <fct>,
      #   QSORRES <fct>, QSORRESU <fct>, QSTEST <fct>, QSTESTCD <fct>,
      #   QSREASND <fct>, QSEVLINT <fct>, VISIT <fct>, VISITNUM <int>, ASEQ <int>,
      #   PARAM <fct>, PARAMCD <fct>, PARCAT1 <fct>, PARCAT1N <dbl>, PARCAT2 <fct>,
      #   AVAL <dbl>, AVALC <fct>, BASE <dbl>, ABLFL <fct>, CHG <dbl>, ...

# radqs produces expected values

    Code
      first_pt_rows
    Output
      # A tibble: 35 x 73
         STUDYID USUBJID    SUBJID SITEID   AGE AGEU  SEX   RACE  ETHNIC COUNTRY DTHFL
         <chr>   <chr>      <chr>  <chr>  <int> <fct> <fct> <fct> <fct>  <fct>   <fct>
       1 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       2 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       3 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       4 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       5 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       6 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       7 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       8 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       9 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      10 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      # ... with 25 more rows, and 62 more variables: INVID <chr>, INVNAM <chr>,
      #   ARM <fct>, ARMCD <fct>, ACTARM <fct>, ACTARMCD <fct>, TRT01P <fct>,
      #   TRT01A <fct>, TRT02P <fct>, TRT02A <fct>, REGION1 <fct>, STRATA1 <fct>,
      #   STRATA2 <fct>, BMRKR1 <dbl>, BMRKR2 <fct>, ITTFL <fct>, SAFFL <fct>,
      #   BMEASIFL <fct>, BEP01FL <fct>, AEWITHFL <fct>, RANDDT <date>,
      #   TRTSDTM <dttm>, TRTEDTM <dttm>, TRT01SDTM <dttm>, TRT01EDTM <dttm>,
      #   TRT02SDTM <dttm>, TRT02EDTM <dttm>, AP01SDTM <dttm>, AP01EDTM <dttm>, ...

---

    Code
      rand_rows
    Output
      # A tibble: 10 x 73
         STUDYID USUBJID    SUBJID SITEID   AGE AGEU  SEX   RACE  ETHNIC COUNTRY DTHFL
         <chr>   <chr>      <chr>  <chr>  <int> <fct> <fct> <fct> <fct>  <fct>   <fct>
       1 AB12345 AB12345-J~ id-7   JPN-4     30 YEARS F     ASIAN NOT H~ JPN     N    
       2 AB12345 AB12345-U~ id-3   USA-13    35 YEARS F     AMER~ NOT H~ USA     N    
       3 AB12345 AB12345-J~ id-7   JPN-4     30 YEARS F     ASIAN NOT H~ JPN     N    
       4 AB12345 AB12345-R~ id-6   RUS-1     36 YEARS F     ASIAN NOT H~ RUS     N    
       5 AB12345 AB12345-U~ id-3   USA-13    35 YEARS F     AMER~ NOT H~ USA     N    
       6 AB12345 AB12345-B~ id-8   BRA-9     31 YEARS F     ASIAN NOT H~ BRA     Y    
       7 AB12345 AB12345-C~ id-2   CHN-11    35 YEARS M     BLAC~ NOT H~ CHN     N    
       8 AB12345 AB12345-C~ id-10  CHN-3     35 YEARS M     ASIAN NOT H~ CHN     N    
       9 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      10 AB12345 AB12345-C~ id-2   CHN-11    35 YEARS M     BLAC~ NOT H~ CHN     N    
      # ... with 62 more variables: INVID <chr>, INVNAM <chr>, ARM <fct>,
      #   ARMCD <fct>, ACTARM <fct>, ACTARMCD <fct>, TRT01P <fct>, TRT01A <fct>,
      #   TRT02P <fct>, TRT02A <fct>, REGION1 <fct>, STRATA1 <fct>, STRATA2 <fct>,
      #   BMRKR1 <dbl>, BMRKR2 <fct>, ITTFL <fct>, SAFFL <fct>, BMEASIFL <fct>,
      #   BEP01FL <fct>, AEWITHFL <fct>, RANDDT <date>, TRTSDTM <dttm>,
      #   TRTEDTM <dttm>, TRT01SDTM <dttm>, TRT01EDTM <dttm>, TRT02SDTM <dttm>,
      #   TRT02EDTM <dttm>, AP01SDTM <dttm>, AP01EDTM <dttm>, AP02SDTM <dttm>, ...

# radrs produces expected values

    Code
      first_pt_rows
    Output
      # A tibble: 8 x 65
        STUDYID USUBJID     SUBJID SITEID   AGE AGEU  SEX   RACE  ETHNIC COUNTRY DTHFL
        <chr>   <chr>       <chr>  <chr>  <int> <fct> <fct> <fct> <fct>  <fct>   <fct>
      1 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      2 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      3 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      4 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      5 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      6 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      7 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      8 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      # ... with 54 more variables: INVID <chr>, INVNAM <chr>, ARM <fct>,
      #   ARMCD <fct>, ACTARM <fct>, ACTARMCD <fct>, TRT01P <fct>, TRT01A <fct>,
      #   TRT02P <fct>, TRT02A <fct>, REGION1 <fct>, STRATA1 <fct>, STRATA2 <fct>,
      #   BMRKR1 <dbl>, BMRKR2 <fct>, ITTFL <fct>, SAFFL <fct>, BMEASIFL <fct>,
      #   BEP01FL <fct>, AEWITHFL <fct>, RANDDT <date>, TRTSDTM <dttm>,
      #   TRTEDTM <dttm>, TRT01SDTM <dttm>, TRT01EDTM <dttm>, TRT02SDTM <dttm>,
      #   TRT02EDTM <dttm>, AP01SDTM <dttm>, AP01EDTM <dttm>, AP02SDTM <dttm>, ...

---

    Code
      rand_rows
    Output
      # A tibble: 10 x 65
         STUDYID USUBJID    SUBJID SITEID   AGE AGEU  SEX   RACE  ETHNIC COUNTRY DTHFL
         <chr>   <chr>      <chr>  <chr>  <int> <fct> <fct> <fct> <fct>  <fct>   <fct>
       1 AB12345 AB12345-C~ id-1   CHN-11    35 YEARS F     WHITE NOT H~ CHN     Y    
       2 AB12345 AB12345-U~ id-3   USA-13    35 YEARS F     AMER~ NOT H~ USA     N    
       3 AB12345 AB12345-C~ id-5   CHN-3     36 YEARS F     ASIAN NOT H~ CHN     N    
       4 AB12345 AB12345-R~ id-4   RUS-1     36 YEARS M     BLAC~ NOT H~ RUS     N    
       5 AB12345 AB12345-R~ id-4   RUS-1     36 YEARS M     BLAC~ NOT H~ RUS     N    
       6 AB12345 AB12345-J~ id-7   JPN-4     30 YEARS F     ASIAN NOT H~ JPN     N    
       7 AB12345 AB12345-C~ id-10  CHN-3     35 YEARS M     ASIAN NOT H~ CHN     N    
       8 AB12345 AB12345-B~ id-8   BRA-9     31 YEARS F     ASIAN NOT H~ BRA     Y    
       9 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      10 AB12345 AB12345-C~ id-5   CHN-3     36 YEARS F     ASIAN NOT H~ CHN     N    
      # ... with 54 more variables: INVID <chr>, INVNAM <chr>, ARM <fct>,
      #   ARMCD <fct>, ACTARM <fct>, ACTARMCD <fct>, TRT01P <fct>, TRT01A <fct>,
      #   TRT02P <fct>, TRT02A <fct>, REGION1 <fct>, STRATA1 <fct>, STRATA2 <fct>,
      #   BMRKR1 <dbl>, BMRKR2 <fct>, ITTFL <fct>, SAFFL <fct>, BMEASIFL <fct>,
      #   BEP01FL <fct>, AEWITHFL <fct>, RANDDT <date>, TRTSDTM <dttm>,
      #   TRTEDTM <dttm>, TRT01SDTM <dttm>, TRT01EDTM <dttm>, TRT02SDTM <dttm>,
      #   TRT02EDTM <dttm>, AP01SDTM <dttm>, AP01EDTM <dttm>, AP02SDTM <dttm>, ...

# radsaftte produces expected values

    Code
      first_pt_rows
    Output
      # A tibble: 9 x 66
        STUDYID USUBJID     SUBJID SITEID   AGE AGEU  SEX   RACE  ETHNIC COUNTRY DTHFL
        <chr>   <chr>       <chr>  <chr>  <int> <fct> <fct> <fct> <fct>  <fct>   <fct>
      1 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      2 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      3 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      4 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      5 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      6 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      7 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      8 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      9 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      # ... with 55 more variables: INVID <chr>, INVNAM <chr>, ARM <fct>,
      #   ARMCD <fct>, ACTARM <fct>, ACTARMCD <fct>, TRT01P <fct>, TRT01A <fct>,
      #   TRT02P <fct>, TRT02A <fct>, REGION1 <fct>, STRATA1 <fct>, STRATA2 <fct>,
      #   BMRKR1 <dbl>, BMRKR2 <fct>, ITTFL <fct>, SAFFL <fct>, BMEASIFL <fct>,
      #   BEP01FL <fct>, AEWITHFL <fct>, RANDDT <date>, TRTSDTM <dttm>,
      #   TRTEDTM <dttm>, TRT01SDTM <dttm>, TRT01EDTM <dttm>, TRT02SDTM <dttm>,
      #   TRT02EDTM <dttm>, AP01SDTM <dttm>, AP01EDTM <dttm>, AP02SDTM <dttm>, ...

---

    Code
      rand_rows
    Output
      # A tibble: 10 x 66
         STUDYID USUBJID    SUBJID SITEID   AGE AGEU  SEX   RACE  ETHNIC COUNTRY DTHFL
         <chr>   <chr>      <chr>  <chr>  <int> <fct> <fct> <fct> <fct>  <fct>   <fct>
       1 AB12345 AB12345-C~ id-5   CHN-3     36 YEARS F     ASIAN NOT H~ CHN     N    
       2 AB12345 AB12345-B~ id-8   BRA-9     31 YEARS F     ASIAN NOT H~ BRA     Y    
       3 AB12345 AB12345-U~ id-3   USA-13    35 YEARS F     AMER~ NOT H~ USA     N    
       4 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       5 AB12345 AB12345-C~ id-5   CHN-3     36 YEARS F     ASIAN NOT H~ CHN     N    
       6 AB12345 AB12345-R~ id-4   RUS-1     36 YEARS M     BLAC~ NOT H~ RUS     N    
       7 AB12345 AB12345-C~ id-10  CHN-3     35 YEARS M     ASIAN NOT H~ CHN     N    
       8 AB12345 AB12345-R~ id-6   RUS-1     36 YEARS F     ASIAN NOT H~ RUS     N    
       9 AB12345 AB12345-R~ id-4   RUS-1     36 YEARS M     BLAC~ NOT H~ RUS     N    
      10 AB12345 AB12345-C~ id-1   CHN-11    35 YEARS F     WHITE NOT H~ CHN     Y    
      # ... with 55 more variables: INVID <chr>, INVNAM <chr>, ARM <fct>,
      #   ARMCD <fct>, ACTARM <fct>, ACTARMCD <fct>, TRT01P <fct>, TRT01A <fct>,
      #   TRT02P <fct>, TRT02A <fct>, REGION1 <fct>, STRATA1 <fct>, STRATA2 <fct>,
      #   BMRKR1 <dbl>, BMRKR2 <fct>, ITTFL <fct>, SAFFL <fct>, BMEASIFL <fct>,
      #   BEP01FL <fct>, AEWITHFL <fct>, RANDDT <date>, TRTSDTM <dttm>,
      #   TRTEDTM <dttm>, TRT01SDTM <dttm>, TRT01EDTM <dttm>, TRT02SDTM <dttm>,
      #   TRT02EDTM <dttm>, AP01SDTM <dttm>, AP01EDTM <dttm>, AP02SDTM <dttm>, ...

# radsub produces expected values

    Code
      first_pt_rows
    Output
      # A tibble: 5 x 65
        STUDYID USUBJID     SUBJID SITEID   AGE AGEU  SEX   RACE  ETHNIC COUNTRY DTHFL
        <chr>   <chr>       <chr>  <chr>  <int> <fct> <fct> <fct> <fct>  <fct>   <fct>
      1 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      2 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      3 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      4 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      5 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      # ... with 54 more variables: INVID <chr>, INVNAM <chr>, ARM <fct>,
      #   ARMCD <fct>, ACTARM <fct>, ACTARMCD <fct>, TRT01P <fct>, TRT01A <fct>,
      #   TRT02P <fct>, TRT02A <fct>, REGION1 <fct>, STRATA1 <fct>, STRATA2 <fct>,
      #   BMRKR1 <dbl>, BMRKR2 <fct>, ITTFL <fct>, SAFFL <fct>, BMEASIFL <fct>,
      #   BEP01FL <fct>, AEWITHFL <fct>, RANDDT <date>, TRTSDTM <dttm>,
      #   TRTEDTM <dttm>, TRT01SDTM <dttm>, TRT01EDTM <dttm>, TRT02SDTM <dttm>,
      #   TRT02EDTM <dttm>, AP01SDTM <dttm>, AP01EDTM <dttm>, AP02SDTM <dttm>, ...

---

    Code
      rand_rows
    Output
      # A tibble: 10 x 65
         STUDYID USUBJID    SUBJID SITEID   AGE AGEU  SEX   RACE  ETHNIC COUNTRY DTHFL
         <chr>   <chr>      <chr>  <chr>  <int> <fct> <fct> <fct> <fct>  <fct>   <fct>
       1 AB12345 AB12345-J~ id-7   JPN-4     30 YEARS F     ASIAN NOT H~ JPN     N    
       2 AB12345 AB12345-R~ id-6   RUS-1     36 YEARS F     ASIAN NOT H~ RUS     N    
       3 AB12345 AB12345-C~ id-10  CHN-3     35 YEARS M     ASIAN NOT H~ CHN     N    
       4 AB12345 AB12345-J~ id-7   JPN-4     30 YEARS F     ASIAN NOT H~ JPN     N    
       5 AB12345 AB12345-R~ id-4   RUS-1     36 YEARS M     BLAC~ NOT H~ RUS     N    
       6 AB12345 AB12345-C~ id-2   CHN-11    35 YEARS M     BLAC~ NOT H~ CHN     N    
       7 AB12345 AB12345-B~ id-8   BRA-9     31 YEARS F     ASIAN NOT H~ BRA     Y    
       8 AB12345 AB12345-R~ id-4   RUS-1     36 YEARS M     BLAC~ NOT H~ RUS     N    
       9 AB12345 AB12345-C~ id-10  CHN-3     35 YEARS M     ASIAN NOT H~ CHN     N    
      10 AB12345 AB12345-C~ id-2   CHN-11    35 YEARS M     BLAC~ NOT H~ CHN     N    
      # ... with 54 more variables: INVID <chr>, INVNAM <chr>, ARM <fct>,
      #   ARMCD <fct>, ACTARM <fct>, ACTARMCD <fct>, TRT01P <fct>, TRT01A <fct>,
      #   TRT02P <fct>, TRT02A <fct>, REGION1 <fct>, STRATA1 <fct>, STRATA2 <fct>,
      #   BMRKR1 <dbl>, BMRKR2 <fct>, ITTFL <fct>, SAFFL <fct>, BMEASIFL <fct>,
      #   BEP01FL <fct>, AEWITHFL <fct>, RANDDT <date>, TRTSDTM <dttm>,
      #   TRTEDTM <dttm>, TRT01SDTM <dttm>, TRT01EDTM <dttm>, TRT02SDTM <dttm>,
      #   TRT02EDTM <dttm>, AP01SDTM <dttm>, AP01EDTM <dttm>, AP02SDTM <dttm>, ...

# radtr produces expected values

    Code
      first_pt_rows
    Output
        STUDYID            USUBJID SUBJID SITEID AGE  AGEU SEX
      1 AB12345 AB12345-BRA-1-id-9   id-9  BRA-1  35 YEARS   F
      2 AB12345 AB12345-BRA-1-id-9   id-9  BRA-1  35 YEARS   F
      3 AB12345 AB12345-BRA-1-id-9   id-9  BRA-1  35 YEARS   F
      4 AB12345 AB12345-BRA-1-id-9   id-9  BRA-1  35 YEARS   F
      5 AB12345 AB12345-BRA-1-id-9   id-9  BRA-1  35 YEARS   F
      6 AB12345 AB12345-BRA-1-id-9   id-9  BRA-1  35 YEARS   F
      7 AB12345 AB12345-BRA-1-id-9   id-9  BRA-1  35 YEARS   F
                             RACE  ETHNIC COUNTRY DTHFL        INVID        INVNAM
      1 BLACK OR AFRICAN AMERICAN UNKNOWN     BRA     N INV ID BRA-1 Dr. BRA-1 Doe
      2 BLACK OR AFRICAN AMERICAN UNKNOWN     BRA     N INV ID BRA-1 Dr. BRA-1 Doe
      3 BLACK OR AFRICAN AMERICAN UNKNOWN     BRA     N INV ID BRA-1 Dr. BRA-1 Doe
      4 BLACK OR AFRICAN AMERICAN UNKNOWN     BRA     N INV ID BRA-1 Dr. BRA-1 Doe
      5 BLACK OR AFRICAN AMERICAN UNKNOWN     BRA     N INV ID BRA-1 Dr. BRA-1 Doe
      6 BLACK OR AFRICAN AMERICAN UNKNOWN     BRA     N INV ID BRA-1 Dr. BRA-1 Doe
      7 BLACK OR AFRICAN AMERICAN UNKNOWN     BRA     N INV ID BRA-1 Dr. BRA-1 Doe
                   ARM ARMCD         ACTARM ACTARMCD         TRT01P         TRT01A
      1 C: Combination ARM C C: Combination    ARM C C: Combination C: Combination
      2 C: Combination ARM C C: Combination    ARM C C: Combination C: Combination
      3 C: Combination ARM C C: Combination    ARM C C: Combination C: Combination
      4 C: Combination ARM C C: Combination    ARM C C: Combination C: Combination
      5 C: Combination ARM C C: Combination    ARM C C: Combination C: Combination
      6 C: Combination ARM C C: Combination    ARM C C: Combination C: Combination
      7 C: Combination ARM C C: Combination    ARM C C: Combination C: Combination
           TRT02P         TRT02A       REGION1 STRATA1 STRATA2   BMRKR1 BMRKR2 ITTFL
      1 A: Drug X C: Combination South America       A      S1 6.922043   HIGH     Y
      2 A: Drug X C: Combination South America       A      S1 6.922043   HIGH     Y
      3 A: Drug X C: Combination South America       A      S1 6.922043   HIGH     Y
      4 A: Drug X C: Combination South America       A      S1 6.922043   HIGH     Y
      5 A: Drug X C: Combination South America       A      S1 6.922043   HIGH     Y
      6 A: Drug X C: Combination South America       A      S1 6.922043   HIGH     Y
      7 A: Drug X C: Combination South America       A      S1 6.922043   HIGH     Y
        SAFFL BMEASIFL BEP01FL AEWITHFL     RANDDT             TRTSDTM
      1     Y        Y       N        N 2021-01-17 2021-01-17 22:43:53
      2     Y        Y       N        N 2021-01-17 2021-01-17 22:43:53
      3     Y        Y       N        N 2021-01-17 2021-01-17 22:43:53
      4     Y        Y       N        N 2021-01-17 2021-01-17 22:43:53
      5     Y        Y       N        N 2021-01-17 2021-01-17 22:43:53
      6     Y        Y       N        N 2021-01-17 2021-01-17 22:43:53
      7     Y        Y       N        N 2021-01-17 2021-01-17 22:43:53
                    TRTEDTM           TRT01SDTM           TRT01EDTM
      1 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      2 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      3 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      4 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      5 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      6 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      7 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
                  TRT02SDTM           TRT02EDTM            AP01SDTM
      1 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      2 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      3 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      4 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      5 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      6 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      7 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
                   AP01EDTM            AP02SDTM            AP02EDTM    EOSSTT
      1 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      2 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      3 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      4 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      5 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      6 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      7 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
           EOTSTT      EOSDT EOSDY DCSREAS DTHDT DTHCAUS DTHCAT LDDTHELD LDDTHGR1
      1 COMPLETED 2024-01-18  1096    <NA>  <NA>    <NA>   <NA>       NA     <NA>
      2 COMPLETED 2024-01-18  1096    <NA>  <NA>    <NA>   <NA>       NA     <NA>
      3 COMPLETED 2024-01-18  1096    <NA>  <NA>    <NA>   <NA>       NA     <NA>
      4 COMPLETED 2024-01-18  1096    <NA>  <NA>    <NA>   <NA>       NA     <NA>
      5 COMPLETED 2024-01-18  1096    <NA>  <NA>    <NA>   <NA>       NA     <NA>
      6 COMPLETED 2024-01-18  1096    <NA>  <NA>    <NA>   <NA>       NA     <NA>
      7 COMPLETED 2024-01-18  1096    <NA>  <NA>    <NA>   <NA>       NA     <NA>
          LSTALVDT DTHADY ADTHAUT AGEGR1 TRTDURD DCSREAS_GRP
      1 2024-02-10     NA    <NA>    <65 1094.75        <NA>
      2 2024-02-10     NA    <NA>    <65 1094.75        <NA>
      3 2024-02-10     NA    <NA>    <65 1094.75        <NA>
      4 2024-02-10     NA    <NA>    <65 1094.75        <NA>
      5 2024-02-10     NA    <NA>    <65 1094.75        <NA>
      6 2024-02-10     NA    <NA>    <65 1094.75        <NA>
      7 2024-02-10     NA    <NA>    <65 1094.75        <NA>
                                          PARAM PARAMCD                AVISIT AVISITN
      1 Sum of Longest Diameter by Investigator  SLDINV             FOLLOW UP     999
      2 Sum of Longest Diameter by Investigator  SLDINV POST-BASELINE MINIMUM       4
      3 Sum of Longest Diameter by Investigator  SLDINV             SCREENING      -1
      4 Sum of Longest Diameter by Investigator  SLDINV              BASELINE       0
      5 Sum of Longest Diameter by Investigator  SLDINV         CYCLE 2 DAY 1       2
      6 Sum of Longest Diameter by Investigator  SLDINV         CYCLE 4 DAY 1       4
      7 Sum of Longest Diameter by Investigator  SLDINV      END OF INDUCTION     999
                       ADTM  ADY   DTYPE     AVAL            AVALC AVALU    BASE
      1 2022-05-01 20:00:00  470         145.9484 145.948361883575    mm 209.412
      2 2021-12-11 19:00:00  329 MINIMUM 118.6760 118.675961210504    mm 209.412
      3 2020-10-08 20:00:00 -100         192.9907 192.990711051031    mm 209.412
      4 2021-01-16 19:00:00    0               NA             <NA>    mm 209.412
      5 2021-10-12 20:00:00  269         138.9834 138.983355706005    mm 209.412
      6 2021-12-11 19:00:00  329         118.6760 118.675961210504    mm 209.412
      7 2021-11-10 19:00:00  298         167.0916 167.091588823272    mm 209.412
        ABLFL       CHG      PCHG ONTRTFL ANL01FL ANL02FL ANL03FL
      1       -63.46364 -30.30563               Y       Y        
      2       -90.73604 -43.32896       Y                       Y
      3              NA        NA                                
      4     Y        NA        NA                       Y       Y
      5       -70.42864 -33.63162       Y       Y                
      6       -90.73604 -43.32896       Y       Y                
      7       -42.32041 -20.20916       Y       Y                

---

    Code
      rand_rows
    Output
         STUDYID             USUBJID SUBJID SITEID AGE  AGEU SEX
      32 AB12345 AB12345-CHN-3-id-10  id-10  CHN-3  35 YEARS   M
      39 AB12345  AB12345-CHN-3-id-5   id-5  CHN-3  36 YEARS   F
      37 AB12345  AB12345-CHN-3-id-5   id-5  CHN-3  36 YEARS   F
      12 AB12345  AB12345-BRA-9-id-8   id-8  BRA-9  31 YEARS   F
      14 AB12345  AB12345-BRA-9-id-8   id-8  BRA-9  31 YEARS   F
      16 AB12345 AB12345-CHN-11-id-1   id-1 CHN-11  35 YEARS   F
      15 AB12345 AB12345-CHN-11-id-1   id-1 CHN-11  35 YEARS   F
      2  AB12345  AB12345-BRA-1-id-9   id-9  BRA-1  35 YEARS   F
      1  AB12345  AB12345-BRA-1-id-9   id-9  BRA-1  35 YEARS   F
      3  AB12345  AB12345-BRA-1-id-9   id-9  BRA-1  35 YEARS   F
                              RACE                 ETHNIC COUNTRY DTHFL         INVID
      32                     ASIAN NOT HISPANIC OR LATINO     CHN     N  INV ID CHN-3
      39                     ASIAN NOT HISPANIC OR LATINO     CHN     N  INV ID CHN-3
      37                     ASIAN NOT HISPANIC OR LATINO     CHN     N  INV ID CHN-3
      12                     ASIAN NOT HISPANIC OR LATINO     BRA     Y  INV ID BRA-9
      14                     ASIAN NOT HISPANIC OR LATINO     BRA     Y  INV ID BRA-9
      16                     WHITE NOT HISPANIC OR LATINO     CHN     Y INV ID CHN-11
      15                     WHITE NOT HISPANIC OR LATINO     CHN     Y INV ID CHN-11
      2  BLACK OR AFRICAN AMERICAN                UNKNOWN     BRA     N  INV ID BRA-1
      1  BLACK OR AFRICAN AMERICAN                UNKNOWN     BRA     N  INV ID BRA-1
      3  BLACK OR AFRICAN AMERICAN                UNKNOWN     BRA     N  INV ID BRA-1
                 INVNAM            ARM ARMCD         ACTARM ACTARMCD         TRT01P
      32  Dr. CHN-3 Doe     B: Placebo ARM B     B: Placebo    ARM B     B: Placebo
      39  Dr. CHN-3 Doe      A: Drug X ARM A      A: Drug X    ARM A      A: Drug X
      37  Dr. CHN-3 Doe      A: Drug X ARM A      A: Drug X    ARM A      A: Drug X
      12  Dr. BRA-9 Doe      A: Drug X ARM A      A: Drug X    ARM A      A: Drug X
      14  Dr. BRA-9 Doe      A: Drug X ARM A      A: Drug X    ARM A      A: Drug X
      16 Dr. CHN-11 Doe C: Combination ARM C C: Combination    ARM C C: Combination
      15 Dr. CHN-11 Doe C: Combination ARM C C: Combination    ARM C C: Combination
      2   Dr. BRA-1 Doe C: Combination ARM C C: Combination    ARM C C: Combination
      1   Dr. BRA-1 Doe C: Combination ARM C C: Combination    ARM C C: Combination
      3   Dr. BRA-1 Doe C: Combination ARM C C: Combination    ARM C C: Combination
                 TRT01A     TRT02P         TRT02A       REGION1 STRATA1 STRATA2
      32     B: Placebo  A: Drug X      A: Drug X          Asia       A      S1
      39      A: Drug X  A: Drug X C: Combination          Asia       A      S2
      37      A: Drug X  A: Drug X C: Combination          Asia       A      S2
      12      A: Drug X  A: Drug X      A: Drug X South America       B      S2
      14      A: Drug X  A: Drug X      A: Drug X South America       B      S2
      16 C: Combination B: Placebo     B: Placebo          Asia       B      S1
      15 C: Combination B: Placebo     B: Placebo          Asia       B      S1
      2  C: Combination  A: Drug X C: Combination South America       A      S1
      1  C: Combination  A: Drug X C: Combination South America       A      S1
      3  C: Combination  A: Drug X C: Combination South America       A      S1
            BMRKR1 BMRKR2 ITTFL SAFFL BMEASIFL BEP01FL AEWITHFL     RANDDT
      32  1.777905    LOW     Y     Y        N       Y        N 2019-03-24
      39  2.619796    LOW     Y     Y        Y       N        N 2020-06-24
      37  2.619796    LOW     Y     Y        Y       N        N 2020-06-24
      12 11.277028 MEDIUM     Y     Y        Y       Y        N 2020-01-18
      14 11.277028 MEDIUM     Y     Y        Y       Y        N 2020-01-18
      16  8.926907    LOW     Y     Y        N       N        N 2020-04-29
      15  8.926907    LOW     Y     Y        N       N        N 2020-04-29
      2   6.922043   HIGH     Y     Y        Y       N        N 2021-01-17
      1   6.922043   HIGH     Y     Y        Y       N        N 2021-01-17
      3   6.922043   HIGH     Y     Y        Y       N        N 2021-01-17
                     TRTSDTM             TRTEDTM           TRT01SDTM
      32 2019-03-28 12:07:16 2022-03-28 06:07:16 2019-03-28 12:07:16
      39 2020-06-27 04:48:00 2023-06-27 22:48:00 2020-06-27 04:48:00
      37 2020-06-27 04:48:00 2023-06-27 22:48:00 2020-06-27 04:48:00
      12 2020-01-21 10:19:08 2021-10-16 19:37:36 2020-01-21 10:19:08
      14 2020-01-21 10:19:08 2021-10-16 19:37:36 2020-01-21 10:19:08
      16 2020-05-02 02:28:45 2021-09-08 20:09:38 2020-05-02 02:28:45
      15 2020-05-02 02:28:45 2021-09-08 20:09:38 2020-05-02 02:28:45
      2  2021-01-17 22:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      1  2021-01-17 22:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      3  2021-01-17 22:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
                   TRT01EDTM           TRT02SDTM           TRT02EDTM
      32 2021-03-28 00:07:16 2021-03-28 00:07:16 2022-03-28 06:07:16
      39 2022-06-27 16:48:00 2022-06-27 16:48:00 2023-06-27 22:48:00
      37 2022-06-27 16:48:00 2022-06-27 16:48:00 2023-06-27 22:48:00
      12 2020-10-16 13:37:36 2020-10-16 13:37:36 2021-10-16 19:37:36
      14 2020-10-16 13:37:36 2020-10-16 13:37:36 2021-10-16 19:37:36
      16 2020-09-08 14:09:38 2020-09-08 14:09:38 2021-09-08 20:09:38
      15 2020-09-08 14:09:38 2020-09-08 14:09:38 2021-09-08 20:09:38
      2  2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53
      1  2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53
      3  2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53
                    AP01SDTM            AP01EDTM            AP02SDTM
      32 2019-03-28 12:07:16 2021-03-28 00:07:16 2021-03-28 00:07:16
      39 2020-06-27 04:48:00 2022-06-27 16:48:00 2022-06-27 16:48:00
      37 2020-06-27 04:48:00 2022-06-27 16:48:00 2022-06-27 16:48:00
      12 2020-01-21 10:19:08 2020-10-16 13:37:36 2020-10-16 13:37:36
      14 2020-01-21 10:19:08 2020-10-16 13:37:36 2020-10-16 13:37:36
      16 2020-05-02 02:28:45 2020-09-08 14:09:38 2020-09-08 14:09:38
      15 2020-05-02 02:28:45 2020-09-08 14:09:38 2020-09-08 14:09:38
      2  2021-01-17 22:43:53 2023-01-18 10:43:53 2023-01-18 10:43:53
      1  2021-01-17 22:43:53 2023-01-18 10:43:53 2023-01-18 10:43:53
      3  2021-01-17 22:43:53 2023-01-18 10:43:53 2023-01-18 10:43:53
                    AP02EDTM       EOSSTT       EOTSTT      EOSDT EOSDY DCSREAS
      32 2022-03-28 06:07:16    COMPLETED    COMPLETED 2022-03-28  1096    <NA>
      39 2023-06-27 22:48:00    COMPLETED    COMPLETED 2023-06-27  1096    <NA>
      37 2023-06-27 22:48:00    COMPLETED    COMPLETED 2023-06-27  1096    <NA>
      12 2021-10-16 19:37:36 DISCONTINUED DISCONTINUED 2021-10-16   635   DEATH
      14 2021-10-16 19:37:36 DISCONTINUED DISCONTINUED 2021-10-16   635   DEATH
      16 2021-09-08 20:09:38 DISCONTINUED DISCONTINUED 2021-09-08   495   DEATH
      15 2021-09-08 20:09:38 DISCONTINUED DISCONTINUED 2021-09-08   495   DEATH
      2  2024-01-18 16:43:53    COMPLETED    COMPLETED 2024-01-18  1096    <NA>
      1  2024-01-18 16:43:53    COMPLETED    COMPLETED 2024-01-18  1096    <NA>
      3  2024-01-18 16:43:53    COMPLETED    COMPLETED 2024-01-18  1096    <NA>
              DTHDT             DTHCAUS              DTHCAT LDDTHELD LDDTHGR1
      32       <NA>                <NA>                <NA>       NA     <NA>
      39       <NA>                <NA>                <NA>       NA     <NA>
      37       <NA>                <NA>                <NA>       NA     <NA>
      12 2021-11-23 DISEASE PROGRESSION PROGRESSIVE DISEASE       38      >30
      14 2021-11-23 DISEASE PROGRESSION PROGRESSIVE DISEASE       38      >30
      16 2021-09-27       ADVERSE EVENT       ADVERSE EVENT       19     <=30
      15 2021-09-27       ADVERSE EVENT       ADVERSE EVENT       19     <=30
      2        <NA>                <NA>                <NA>       NA     <NA>
      1        <NA>                <NA>                <NA>       NA     <NA>
      3        <NA>                <NA>                <NA>       NA     <NA>
           LSTALVDT DTHADY ADTHAUT AGEGR1   TRTDURD DCSREAS_GRP
      32 2022-04-14     NA    <NA>    <65 1094.7500        <NA>
      39 2023-07-10     NA    <NA>    <65 1094.7500        <NA>
      37 2023-07-10     NA    <NA>    <65 1094.7500        <NA>
      12 2021-11-23    671     Yes    <65  633.3878  Non-Safety
      14 2021-11-23    671     Yes    <65  633.3878  Non-Safety
      16 2021-09-27    512     Yes    <65  493.7367  Non-Safety
      15 2021-09-27    512     Yes    <65  493.7367  Non-Safety
      2  2024-02-10     NA    <NA>    <65 1094.7500        <NA>
      1  2024-02-10     NA    <NA>    <65 1094.7500        <NA>
      3  2024-02-10     NA    <NA>    <65 1094.7500        <NA>
                                           PARAM PARAMCD                AVISIT
      32 Sum of Longest Diameter by Investigator  SLDINV      END OF INDUCTION
      39 Sum of Longest Diameter by Investigator  SLDINV              BASELINE
      37 Sum of Longest Diameter by Investigator  SLDINV      END OF INDUCTION
      12 Sum of Longest Diameter by Investigator  SLDINV              BASELINE
      14 Sum of Longest Diameter by Investigator  SLDINV             SCREENING
      16 Sum of Longest Diameter by Investigator  SLDINV POST-BASELINE MINIMUM
      15 Sum of Longest Diameter by Investigator  SLDINV         CYCLE 4 DAY 1
      2  Sum of Longest Diameter by Investigator  SLDINV POST-BASELINE MINIMUM
      1  Sum of Longest Diameter by Investigator  SLDINV             FOLLOW UP
      3  Sum of Longest Diameter by Investigator  SLDINV             SCREENING
         AVISITN                ADTM  ADY   DTYPE     AVAL            AVALC AVALU
      32     999 2021-08-31 20:00:00  888         104.2930 104.292995987107    mm
      39       0 2020-06-26 20:00:00    0               NA             <NA>    mm
      37     999 2021-07-08 20:00:00  377         158.0130 158.012963723167    mm
      12       0 2020-01-20 19:00:00    0               NA             <NA>    mm
      14      -1 2019-10-12 20:00:00 -100         222.0485 222.048532815143    mm
      16     999 2021-02-14 19:00:00  289 MINIMUM 128.7016 128.701607072346    mm
      15       4 2021-06-26 20:00:00  421         215.1784 215.178350110865    mm
      2        4 2021-12-11 19:00:00  329 MINIMUM 118.6760 118.675961210504    mm
      1      999 2022-05-01 20:00:00  470         145.9484 145.948361883575    mm
      3       -1 2020-10-08 20:00:00 -100         192.9907 192.990711051031    mm
             BASE ABLFL        CHG       PCHG ONTRTFL ANL01FL ANL02FL ANL03FL
      32 132.3144       -28.021376 -21.177878       Y       Y       Y        
      39 159.9885     Y         NA         NA                       Y       Y
      37 159.9885        -1.975547  -1.234806       Y       Y       Y        
      12 148.8228     Y         NA         NA                       Y       Y
      14 148.8228               NA         NA                                
      16 193.9666       -65.265039 -33.647558       Y                       Y
      15 193.9666        21.211704  10.935748       Y       Y       Y        
      2  209.4120       -90.736036 -43.328958       Y                       Y
      1  209.4120       -63.463635 -30.305635               Y       Y        
      3  209.4120               NA         NA                                

# radtte produces expected values

    Code
      first_pt_rows
    Output
      # A tibble: 5 x 67
        STUDYID USUBJID     SUBJID SITEID   AGE AGEU  SEX   RACE  ETHNIC COUNTRY DTHFL
        <chr>   <chr>       <chr>  <chr>  <int> <fct> <fct> <fct> <fct>  <fct>   <fct>
      1 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      2 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      3 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      4 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      5 AB12345 AB12345-BR~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      # ... with 56 more variables: INVID <chr>, INVNAM <chr>, ARM <fct>,
      #   ARMCD <fct>, ACTARM <fct>, ACTARMCD <fct>, TRT01P <fct>, TRT01A <fct>,
      #   TRT02P <fct>, TRT02A <fct>, REGION1 <fct>, STRATA1 <fct>, STRATA2 <fct>,
      #   BMRKR1 <dbl>, BMRKR2 <fct>, ITTFL <fct>, SAFFL <fct>, BMEASIFL <fct>,
      #   BEP01FL <fct>, AEWITHFL <fct>, RANDDT <date>, TRTSDTM <dttm>,
      #   TRTEDTM <dttm>, TRT01SDTM <dttm>, TRT01EDTM <dttm>, TRT02SDTM <dttm>,
      #   TRT02EDTM <dttm>, AP01SDTM <dttm>, AP01EDTM <dttm>, AP02SDTM <dttm>, ...

---

    Code
      rand_rows
    Output
      # A tibble: 10 x 67
         STUDYID USUBJID    SUBJID SITEID   AGE AGEU  SEX   RACE  ETHNIC COUNTRY DTHFL
         <chr>   <chr>      <chr>  <chr>  <int> <fct> <fct> <fct> <fct>  <fct>   <fct>
       1 AB12345 AB12345-R~ id-6   RUS-1     36 YEARS F     ASIAN NOT H~ RUS     N    
       2 AB12345 AB12345-U~ id-3   USA-13    35 YEARS F     AMER~ NOT H~ USA     N    
       3 AB12345 AB12345-U~ id-3   USA-13    35 YEARS F     AMER~ NOT H~ USA     N    
       4 AB12345 AB12345-C~ id-10  CHN-3     35 YEARS M     ASIAN NOT H~ CHN     N    
       5 AB12345 AB12345-C~ id-10  CHN-3     35 YEARS M     ASIAN NOT H~ CHN     N    
       6 AB12345 AB12345-R~ id-4   RUS-1     36 YEARS M     BLAC~ NOT H~ RUS     N    
       7 AB12345 AB12345-C~ id-2   CHN-11    35 YEARS M     BLAC~ NOT H~ CHN     N    
       8 AB12345 AB12345-C~ id-5   CHN-3     36 YEARS F     ASIAN NOT H~ CHN     N    
       9 AB12345 AB12345-C~ id-5   CHN-3     36 YEARS F     ASIAN NOT H~ CHN     N    
      10 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      # ... with 56 more variables: INVID <chr>, INVNAM <chr>, ARM <fct>,
      #   ARMCD <fct>, ACTARM <fct>, ACTARMCD <fct>, TRT01P <fct>, TRT01A <fct>,
      #   TRT02P <fct>, TRT02A <fct>, REGION1 <fct>, STRATA1 <fct>, STRATA2 <fct>,
      #   BMRKR1 <dbl>, BMRKR2 <fct>, ITTFL <fct>, SAFFL <fct>, BMEASIFL <fct>,
      #   BEP01FL <fct>, AEWITHFL <fct>, RANDDT <date>, TRTSDTM <dttm>,
      #   TRTEDTM <dttm>, TRT01SDTM <dttm>, TRT01EDTM <dttm>, TRT02SDTM <dttm>,
      #   TRT02EDTM <dttm>, AP01SDTM <dttm>, AP01EDTM <dttm>, AP02SDTM <dttm>, ...

# radvs produces expected values

    Code
      first_pt_rows
    Output
      # A tibble: 42 x 87
         STUDYID USUBJID    SUBJID SITEID   AGE AGEU  SEX   RACE  ETHNIC COUNTRY DTHFL
         <chr>   <chr>      <chr>  <chr>  <int> <fct> <fct> <fct> <fct>  <fct>   <fct>
       1 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       2 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       3 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       4 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       5 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       6 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       7 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       8 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       9 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      10 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      # ... with 32 more rows, and 76 more variables: INVID <chr>, INVNAM <chr>,
      #   ARM <fct>, ARMCD <fct>, ACTARM <fct>, ACTARMCD <fct>, TRT01P <fct>,
      #   TRT01A <fct>, TRT02P <fct>, TRT02A <fct>, REGION1 <fct>, STRATA1 <fct>,
      #   STRATA2 <fct>, BMRKR1 <dbl>, BMRKR2 <fct>, ITTFL <fct>, SAFFL <fct>,
      #   BMEASIFL <fct>, BEP01FL <fct>, AEWITHFL <fct>, RANDDT <date>,
      #   TRTSDTM <dttm>, TRTEDTM <dttm>, TRT01SDTM <dttm>, TRT01EDTM <dttm>,
      #   TRT02SDTM <dttm>, TRT02EDTM <dttm>, AP01SDTM <dttm>, AP01EDTM <dttm>, ...

---

    Code
      rand_rows
    Output
      # A tibble: 10 x 87
         STUDYID USUBJID    SUBJID SITEID   AGE AGEU  SEX   RACE  ETHNIC COUNTRY DTHFL
         <chr>   <chr>      <chr>  <chr>  <int> <fct> <fct> <fct> <fct>  <fct>   <fct>
       1 AB12345 AB12345-R~ id-6   RUS-1     36 YEARS F     ASIAN NOT H~ RUS     N    
       2 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
       3 AB12345 AB12345-C~ id-1   CHN-11    35 YEARS F     WHITE NOT H~ CHN     Y    
       4 AB12345 AB12345-R~ id-6   RUS-1     36 YEARS F     ASIAN NOT H~ RUS     N    
       5 AB12345 AB12345-C~ id-2   CHN-11    35 YEARS M     BLAC~ NOT H~ CHN     N    
       6 AB12345 AB12345-R~ id-6   RUS-1     36 YEARS F     ASIAN NOT H~ RUS     N    
       7 AB12345 AB12345-R~ id-4   RUS-1     36 YEARS M     BLAC~ NOT H~ RUS     N    
       8 AB12345 AB12345-C~ id-2   CHN-11    35 YEARS M     BLAC~ NOT H~ CHN     N    
       9 AB12345 AB12345-B~ id-8   BRA-9     31 YEARS F     ASIAN NOT H~ BRA     Y    
      10 AB12345 AB12345-B~ id-9   BRA-1     35 YEARS F     BLAC~ UNKNO~ BRA     N    
      # ... with 76 more variables: INVID <chr>, INVNAM <chr>, ARM <fct>,
      #   ARMCD <fct>, ACTARM <fct>, ACTARMCD <fct>, TRT01P <fct>, TRT01A <fct>,
      #   TRT02P <fct>, TRT02A <fct>, REGION1 <fct>, STRATA1 <fct>, STRATA2 <fct>,
      #   BMRKR1 <dbl>, BMRKR2 <fct>, ITTFL <fct>, SAFFL <fct>, BMEASIFL <fct>,
      #   BEP01FL <fct>, AEWITHFL <fct>, RANDDT <date>, TRTSDTM <dttm>,
      #   TRTEDTM <dttm>, TRT01SDTM <dttm>, TRT01EDTM <dttm>, TRT02SDTM <dttm>,
      #   TRT02EDTM <dttm>, AP01SDTM <dttm>, AP01EDTM <dttm>, AP02SDTM <dttm>, ...

