# radsl produces expected values with change of sex percentage

    Code
      first_pt_rows
    Output
      # A tibble: 1 x 55
        STUDYID USUBJID                SUBJID   SITEID   AGE AGEU  SEX   RACE 
        <chr>   <chr>                  <chr>    <chr>  <int> <fct> <fct> <fct>
      1 AB12345 AB12345-NGA-1-id-14775 id-14775 NGA-1     28 YEARS F     WHITE
        ETHNIC                 COUNTRY DTHFL INVID        INVNAM        ARM      
        <fct>                  <fct>   <fct> <chr>        <chr>         <fct>    
      1 NOT HISPANIC OR LATINO NGA     N     INV ID NGA-1 Dr. NGA-1 Doe A: Drug X
        ARMCD ACTARM    ACTARMCD TRT01P    TRT01A    TRT02P         TRT02A        
        <fct> <fct>     <fct>    <fct>     <fct>     <fct>          <fct>         
      1 ARM A A: Drug X ARM A    A: Drug X A: Drug X C: Combination C: Combination
        REGION1 STRATA1 STRATA2 BMRKR1 BMRKR2 ITTFL SAFFL BMEASIFL BEP01FL AEWITHFL
        <fct>   <fct>   <fct>    <dbl> <fct>  <fct> <fct> <fct>    <fct>   <fct>   
      1 Africa  A       S1        3.11 HIGH   Y     Y     N        Y       N       
        RANDDT     TRTSDTM             TRTEDTM             TRT01SDTM          
        <date>     <dttm>              <dttm>              <dttm>             
      1 2019-02-18 2019-02-20 11:27:50 2022-02-20 05:27:50 2019-02-20 11:27:50
        TRT01EDTM           TRT02SDTM           TRT02EDTM          
        <dttm>              <dttm>              <dttm>             
      1 2021-02-19 23:27:50 2021-02-19 23:27:50 2022-02-20 05:27:50
        AP01SDTM            AP01EDTM            AP02SDTM           
        <dttm>              <dttm>              <dttm>             
      1 2019-02-20 11:27:50 2021-02-19 23:27:50 2021-02-19 23:27:50
        AP02EDTM            EOSSTT    EOTSTT    EOSDT      EOSDY DCSREAS DTHDT 
        <dttm>              <fct>     <fct>     <date>     <int> <fct>   <date>
      1 2022-02-20 05:27:50 COMPLETED COMPLETED 2022-02-20  1096 <NA>    NA    
        DTHCAUS DTHCAT LDDTHELD LDDTHGR1 LSTALVDT   DTHADY ADTHAUT
        <fct>   <fct>     <int> <fct>    <date>      <int> <fct>  
      1 <NA>    <NA>         NA <NA>     2022-03-09     NA <NA>   

---

    Code
      rand_rows
    Output
      # A tibble: 5 x 55
        STUDYID USUBJID                 SUBJID   SITEID   AGE AGEU  SEX  
        <chr>   <chr>                   <chr>    <chr>  <int> <fct> <fct>
      1 AB12345 AB12345-CHN-11-id-67895 id-67895 CHN-11    42 YEARS F    
      2 AB12345 AB12345-CHN-11-id-91993 id-91993 CHN-11    37 YEARS M    
      3 AB12345 AB12345-CHN-1-id-27580  id-27580 CHN-1     26 YEARS F    
      4 AB12345 AB12345-NGA-15-id-6403  id-6403  NGA-15    30 YEARS M    
      5 AB12345 AB12345-CHN-11-id-62140 id-62140 CHN-11    29 YEARS M    
        RACE                      ETHNIC                 COUNTRY DTHFL INVID        
        <fct>                     <fct>                  <fct>   <fct> <chr>        
      1 ASIAN                     NOT HISPANIC OR LATINO CHN     N     INV ID CHN-11
      2 ASIAN                     HISPANIC OR LATINO     CHN     N     INV ID CHN-11
      3 ASIAN                     NOT HISPANIC OR LATINO CHN     N     INV ID CHN-1 
      4 BLACK OR AFRICAN AMERICAN NOT HISPANIC OR LATINO NGA     N     INV ID NGA-15
      5 BLACK OR AFRICAN AMERICAN NOT HISPANIC OR LATINO CHN     N     INV ID CHN-11
        INVNAM         ARM            ARMCD ACTARM         ACTARMCD TRT01P        
        <chr>          <fct>          <fct> <fct>          <fct>    <fct>         
      1 Dr. CHN-11 Doe B: Placebo     ARM B B: Placebo     ARM B    B: Placebo    
      2 Dr. CHN-11 Doe A: Drug X      ARM A A: Drug X      ARM A    A: Drug X     
      3 Dr. CHN-1 Doe  C: Combination ARM C C: Combination ARM C    C: Combination
      4 Dr. NGA-15 Doe C: Combination ARM C C: Combination ARM C    C: Combination
      5 Dr. CHN-11 Doe A: Drug X      ARM A A: Drug X      ARM A    A: Drug X     
        TRT01A         TRT02P         TRT02A         REGION1 STRATA1 STRATA2 BMRKR1
        <fct>          <fct>          <fct>          <fct>   <fct>   <fct>    <dbl>
      1 B: Placebo     C: Combination A: Drug X      Asia    B       S2        9.62
      2 A: Drug X      C: Combination C: Combination Asia    B       S2        1.85
      3 C: Combination B: Placebo     A: Drug X      Asia    B       S1        8.67
      4 C: Combination C: Combination B: Placebo     Africa  A       S1        8.72
      5 A: Drug X      C: Combination A: Drug X      Asia    A       S2        6.51
        BMRKR2 ITTFL SAFFL BMEASIFL BEP01FL AEWITHFL RANDDT     TRTSDTM            
        <fct>  <fct> <fct> <fct>    <fct>   <fct>    <date>     <dttm>             
      1 LOW    Y     Y     N        Y       N        2020-04-19 2020-04-21 08:02:16
      2 MEDIUM Y     Y     Y        N       N        2019-04-18 2019-04-20 21:03:45
      3 MEDIUM Y     Y     Y        Y       N        2019-07-03 2019-07-05 21:27:44
      4 MEDIUM Y     Y     Y        N       N        2020-03-17 2020-03-20 06:18:30
      5 HIGH   Y     Y     Y        N       N        2020-04-24 2020-04-28 07:50:48
        TRTEDTM             TRT01SDTM           TRT01EDTM          
        <dttm>              <dttm>              <dttm>             
      1 2022-02-20 05:08:31 2020-04-21 08:02:16 2021-02-19 23:08:31
      2 2022-04-20 15:03:45 2019-04-20 21:03:45 2021-04-20 09:03:45
      3 2022-07-05 15:27:44 2019-07-05 21:27:44 2021-07-05 09:27:44
      4 2023-03-21 00:18:30 2020-03-20 06:18:30 2022-03-20 18:18:30
      5 2023-04-29 01:50:48 2020-04-28 07:50:48 2022-04-28 19:50:48
        TRT02SDTM           TRT02EDTM           AP01SDTM           
        <dttm>              <dttm>              <dttm>             
      1 2021-02-19 23:08:31 2022-02-20 05:08:31 2020-04-21 08:02:16
      2 2021-04-20 09:03:45 2022-04-20 15:03:45 2019-04-20 21:03:45
      3 2021-07-05 09:27:44 2022-07-05 15:27:44 2019-07-05 21:27:44
      4 2022-03-20 18:18:30 2023-03-21 00:18:30 2020-03-20 06:18:30
      5 2022-04-28 19:50:48 2023-04-29 01:50:48 2020-04-28 07:50:48
        AP01EDTM            AP02SDTM            AP02EDTM            EOSSTT      
        <dttm>              <dttm>              <dttm>              <fct>       
      1 2021-02-19 23:08:31 2021-02-19 23:08:31 2022-02-20 05:08:31 DISCONTINUED
      2 2021-04-20 09:03:45 2021-04-20 09:03:45 2022-04-20 15:03:45 COMPLETED   
      3 2021-07-05 09:27:44 2021-07-05 09:27:44 2022-07-05 15:27:44 COMPLETED   
      4 2022-03-20 18:18:30 2022-03-20 18:18:30 2023-03-21 00:18:30 COMPLETED   
      5 2022-04-28 19:50:48 2022-04-28 19:50:48 2023-04-29 01:50:48 COMPLETED   
        EOTSTT       EOSDT      EOSDY DCSREAS                       DTHDT  DTHCAUS
        <fct>        <date>     <int> <fct>                         <date> <fct>  
      1 DISCONTINUED 2022-02-20   670 WITHDRAWAL BY PARENT/GUARDIAN NA     <NA>   
      2 COMPLETED    2022-04-20  1096 <NA>                          NA     <NA>   
      3 COMPLETED    2022-07-05  1096 <NA>                          NA     <NA>   
      4 COMPLETED    2023-03-21  1096 <NA>                          NA     <NA>   
      5 COMPLETED    2023-04-29  1096 <NA>                          NA     <NA>   
        DTHCAT LDDTHELD LDDTHGR1 LSTALVDT   DTHADY ADTHAUT
        <fct>     <int> <fct>    <date>      <int> <fct>  
      1 <NA>         NA <NA>     2022-03-02     NA <NA>   
      2 <NA>         NA <NA>     2022-04-30     NA <NA>   
      3 <NA>         NA <NA>     2022-07-19     NA <NA>   
      4 <NA>         NA <NA>     2023-04-12     NA <NA>   
      5 <NA>         NA <NA>     2023-05-23     NA <NA>   

