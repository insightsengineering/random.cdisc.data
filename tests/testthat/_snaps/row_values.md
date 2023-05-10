# radsl produces expected values

    Code
      first_pt_rows
    Output
      # A tibble: 1 x 55
        STUDYID USUBJID             SUBJID SITEID   AGE AGEU  SEX   RACE 
        <chr>   <chr>               <chr>  <chr>  <int> <fct> <fct> <fct>
      1 AB12345 AB12345-CHN-3-id-10 id-10  CHN-3     35 YEARS M     ASIAN
        ETHNIC                 COUNTRY DTHFL INVID        INVNAM        ARM       
        <fct>                  <fct>   <fct> <chr>        <chr>         <fct>     
      1 NOT HISPANIC OR LATINO CHN     N     INV ID CHN-3 Dr. CHN-3 Doe B: Placebo
        ARMCD ACTARM     ACTARMCD TRT01P     TRT01A     TRT02P    TRT02A    REGION1
        <fct> <fct>      <fct>    <fct>      <fct>      <fct>     <fct>     <fct>  
      1 ARM B B: Placebo ARM B    B: Placebo B: Placebo A: Drug X A: Drug X Asia   
        STRATA1 STRATA2 BMRKR1 BMRKR2 ITTFL SAFFL BMEASIFL BEP01FL AEWITHFL RANDDT    
        <fct>   <fct>    <dbl> <fct>  <fct> <fct> <fct>    <fct>   <fct>    <date>    
      1 A       S1        1.78 LOW    Y     Y     N        Y       N        2019-03-24
        TRTSDTM             TRTEDTM             TRT01SDTM          
        <dttm>              <dttm>              <dttm>             
      1 2019-03-28 12:07:16 2022-03-28 06:07:16 2019-03-28 12:07:16
        TRT01EDTM           TRT02SDTM           TRT02EDTM          
        <dttm>              <dttm>              <dttm>             
      1 2021-03-28 00:07:16 2021-03-28 00:07:16 2022-03-28 06:07:16
        AP01SDTM            AP01EDTM            AP02SDTM           
        <dttm>              <dttm>              <dttm>             
      1 2019-03-28 12:07:16 2021-03-28 00:07:16 2021-03-28 00:07:16
        AP02EDTM            EOSSTT    EOTSTT    EOSDT      EOSDY DCSREAS DTHDT 
        <dttm>              <fct>     <fct>     <date>     <int> <fct>   <date>
      1 2022-03-28 06:07:16 COMPLETED COMPLETED 2022-03-28  1096 <NA>    NA    
        DTHCAUS DTHCAT LDDTHELD LDDTHGR1 LSTALVDT   DTHADY ADTHAUT
        <fct>   <fct>     <int> <fct>    <date>      <int> <fct>  
      1 <NA>    <NA>         NA <NA>     2022-04-14     NA <NA>   

---

    Code
      rand_rows
    Output
      # A tibble: 5 x 55
        STUDYID USUBJID             SUBJID SITEID   AGE AGEU  SEX  
        <chr>   <chr>               <chr>  <chr>  <int> <fct> <fct>
      1 AB12345 AB12345-BRA-1-id-9  id-9   BRA-1     35 YEARS F    
      2 AB12345 AB12345-CHN-11-id-1 id-1   CHN-11    35 YEARS F    
      3 AB12345 AB12345-CHN-3-id-5  id-5   CHN-3     36 YEARS F    
      4 AB12345 AB12345-BRA-9-id-8  id-8   BRA-9     31 YEARS F    
      5 AB12345 AB12345-RUS-1-id-4  id-4   RUS-1     36 YEARS M    
        RACE                      ETHNIC                 COUNTRY DTHFL INVID        
        <fct>                     <fct>                  <fct>   <fct> <chr>        
      1 BLACK OR AFRICAN AMERICAN UNKNOWN                BRA     N     INV ID BRA-1 
      2 WHITE                     NOT HISPANIC OR LATINO CHN     Y     INV ID CHN-11
      3 ASIAN                     NOT HISPANIC OR LATINO CHN     N     INV ID CHN-3 
      4 ASIAN                     NOT HISPANIC OR LATINO BRA     Y     INV ID BRA-9 
      5 BLACK OR AFRICAN AMERICAN NOT HISPANIC OR LATINO RUS     N     INV ID RUS-1 
        INVNAM         ARM            ARMCD ACTARM         ACTARMCD TRT01P        
        <chr>          <fct>          <fct> <fct>          <fct>    <fct>         
      1 Dr. BRA-1 Doe  C: Combination ARM C C: Combination ARM C    C: Combination
      2 Dr. CHN-11 Doe C: Combination ARM C C: Combination ARM C    C: Combination
      3 Dr. CHN-3 Doe  A: Drug X      ARM A A: Drug X      ARM A    A: Drug X     
      4 Dr. BRA-9 Doe  A: Drug X      ARM A A: Drug X      ARM A    A: Drug X     
      5 Dr. RUS-1 Doe  B: Placebo     ARM B B: Placebo     ARM B    B: Placebo    
        TRT01A         TRT02P     TRT02A         REGION1       STRATA1 STRATA2 BMRKR1
        <fct>          <fct>      <fct>          <fct>         <fct>   <fct>    <dbl>
      1 C: Combination A: Drug X  C: Combination South America A       S1        6.92
      2 C: Combination B: Placebo B: Placebo     Asia          B       S1        8.93
      3 A: Drug X      A: Drug X  C: Combination Asia          A       S2        2.62
      4 A: Drug X      A: Drug X  A: Drug X      South America B       S2       11.3 
      5 B: Placebo     A: Drug X  A: Drug X      Eurasia       A       S1        9.95
        BMRKR2 ITTFL SAFFL BMEASIFL BEP01FL AEWITHFL RANDDT     TRTSDTM            
        <fct>  <fct> <fct> <fct>    <fct>   <fct>    <date>     <dttm>             
      1 HIGH   Y     Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      2 LOW    Y     Y     N        N       N        2020-04-29 2020-05-02 02:28:45
      3 LOW    Y     Y     Y        N       N        2020-06-24 2020-06-27 04:48:00
      4 MEDIUM Y     Y     Y        Y       N        2020-01-18 2020-01-21 10:19:08
      5 MEDIUM Y     Y     Y        N       N        2020-08-27 2020-08-28 20:42:09
        TRTEDTM             TRT01SDTM           TRT01EDTM          
        <dttm>              <dttm>              <dttm>             
      1 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      2 2021-09-08 20:09:38 2020-05-02 02:28:45 2020-09-08 14:09:38
      3 2023-06-27 22:48:00 2020-06-27 04:48:00 2022-06-27 16:48:00
      4 2021-10-16 19:37:36 2020-01-21 10:19:08 2020-10-16 13:37:36
      5 2022-01-23 08:46:48 2020-08-28 20:42:09 2021-01-23 02:46:48
        TRT02SDTM           TRT02EDTM           AP01SDTM           
        <dttm>              <dttm>              <dttm>             
      1 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      2 2020-09-08 14:09:38 2021-09-08 20:09:38 2020-05-02 02:28:45
      3 2022-06-27 16:48:00 2023-06-27 22:48:00 2020-06-27 04:48:00
      4 2020-10-16 13:37:36 2021-10-16 19:37:36 2020-01-21 10:19:08
      5 2021-01-23 02:46:48 2022-01-23 08:46:48 2020-08-28 20:42:09
        AP01EDTM            AP02SDTM            AP02EDTM            EOSSTT      
        <dttm>              <dttm>              <dttm>              <fct>       
      1 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED   
      2 2020-09-08 14:09:38 2020-09-08 14:09:38 2021-09-08 20:09:38 DISCONTINUED
      3 2022-06-27 16:48:00 2022-06-27 16:48:00 2023-06-27 22:48:00 COMPLETED   
      4 2020-10-16 13:37:36 2020-10-16 13:37:36 2021-10-16 19:37:36 DISCONTINUED
      5 2021-01-23 02:46:48 2021-01-23 02:46:48 2022-01-23 08:46:48 DISCONTINUED
        EOTSTT       EOSDT      EOSDY DCSREAS       DTHDT      DTHCAUS            
        <fct>        <date>     <int> <fct>         <date>     <fct>              
      1 COMPLETED    2024-01-18  1096 <NA>          NA         <NA>               
      2 DISCONTINUED 2021-09-08   495 DEATH         2021-09-27 ADVERSE EVENT      
      3 COMPLETED    2023-06-27  1096 <NA>          NA         <NA>               
      4 DISCONTINUED 2021-10-16   635 DEATH         2021-11-23 DISEASE PROGRESSION
      5 DISCONTINUED 2022-01-23   513 ADVERSE EVENT NA         <NA>               
        DTHCAT              LDDTHELD LDDTHGR1 LSTALVDT   DTHADY ADTHAUT
        <fct>                  <int> <fct>    <date>      <int> <fct>  
      1 <NA>                      NA <NA>     2024-02-10     NA <NA>   
      2 ADVERSE EVENT             19 <=30     2021-09-27    512 Yes    
      3 <NA>                      NA <NA>     2023-07-10     NA <NA>   
      4 PROGRESSIVE DISEASE       38 >30      2021-11-23    671 Yes    
      5 <NA>                      NA <NA>     2022-02-12     NA <NA>   

# radae produces expected values

    Code
      first_pt_rows
    Output
      # A tibble: 7 x 92
        STUDYID USUBJID            SUBJID SITEID   AGE AGEU  SEX  
        <chr>   <chr>              <chr>  <chr>  <int> <fct> <fct>
      1 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      2 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      3 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      4 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      5 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      6 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      7 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
        RACE                      ETHNIC  COUNTRY DTHFL INVID        INVNAM       
        <fct>                     <fct>   <fct>   <fct> <chr>        <chr>        
      1 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      2 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      3 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      4 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      5 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      6 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      7 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
        ARM            ARMCD ACTARM         ACTARMCD TRT01P         TRT01A        
        <fct>          <fct> <fct>          <fct>    <fct>          <fct>         
      1 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      2 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      3 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      4 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      5 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      6 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      7 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
        TRT02P    TRT02A         REGION1       STRATA1 STRATA2 BMRKR1 BMRKR2 ITTFL
        <fct>     <fct>          <fct>         <fct>   <fct>    <dbl> <fct>  <fct>
      1 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      2 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      3 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      4 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      5 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      6 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      7 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
        SAFFL BMEASIFL BEP01FL AEWITHFL RANDDT     TRTSDTM            
        <fct> <fct>    <fct>   <fct>    <date>     <dttm>             
      1 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      2 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      3 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      4 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      5 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      6 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      7 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
        TRTEDTM             TRT01SDTM           TRT01EDTM          
        <dttm>              <dttm>              <dttm>             
      1 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      2 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      3 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      4 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      5 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      6 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      7 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
        TRT02SDTM           TRT02EDTM           AP01SDTM           
        <dttm>              <dttm>              <dttm>             
      1 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      2 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      3 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      4 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      5 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      6 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      7 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
        AP01EDTM            AP02SDTM            AP02EDTM            EOSSTT   
        <dttm>              <dttm>              <dttm>              <fct>    
      1 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      2 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      3 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      4 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      5 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      6 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      7 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
        EOTSTT    EOSDT      EOSDY DCSREAS DTHDT  DTHCAUS DTHCAT LDDTHELD LDDTHGR1
        <fct>     <date>     <int> <fct>   <date> <fct>   <fct>     <int> <fct>   
      1 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      2 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      3 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      4 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      5 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      6 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      7 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
        LSTALVDT   DTHADY ADTHAUT  ASEQ AESEQ AETERM        AELLT        
        <date>      <int> <fct>   <int> <int> <fct>         <fct>        
      1 2024-02-10     NA <NA>        1     1 trm A.1.1.1.1 llt A.1.1.1.1
      2 2024-02-10     NA <NA>        2     2 trm D.1.1.4.2 llt D.1.1.4.2
      3 2024-02-10     NA <NA>        3     3 trm C.2.1.2.1 llt C.2.1.2.1
      4 2024-02-10     NA <NA>        4     4 trm C.1.1.1.3 llt C.1.1.1.3
      5 2024-02-10     NA <NA>        5     5 trm D.1.1.4.2 llt D.1.1.4.2
      6 2024-02-10     NA <NA>        6     6 trm C.2.1.2.1 llt C.2.1.2.1
      7 2024-02-10     NA <NA>        7     7 trm B.2.1.2.1 llt B.2.1.2.1
        AEDECOD       AEHLT       AEHLGT     AEBODSYS AESOC AESEV    AESER
        <fct>         <fct>       <fct>      <fct>    <fct> <fct>    <fct>
      1 dcd A.1.1.1.1 hlt A.1.1.1 hlgt A.1.1 cl A.1   cl A  MILD     N    
      2 dcd D.1.1.4.2 hlt D.1.1.4 hlgt D.1.1 cl D.1   cl D  MODERATE N    
      3 dcd C.2.1.2.1 hlt C.2.1.2 hlgt C.2.1 cl C.2   cl C  MODERATE N    
      4 dcd C.1.1.1.3 hlt C.1.1.1 hlgt C.1.1 cl C.1   cl C  SEVERE   N    
      5 dcd D.1.1.4.2 hlt D.1.1.4 hlgt D.1.1 cl D.1   cl D  MODERATE N    
      6 dcd C.2.1.2.1 hlt C.2.1.2 hlgt C.2.1 cl C.2   cl C  MODERATE N    
      7 dcd B.2.1.2.1 hlt B.2.1.2 hlgt B.2.1 cl B.2   cl B  MODERATE N    
        AEACN             AEREL AEOUT                            AESDTH AESCONG
        <chr>             <fct> <chr>                            <fct>  <fct>  
      1 DOSE REDUCED      N     RECOVERED/RESOLVED               N      N      
      2 DOSE NOT CHANGED  N     RECOVERING/RESOLVING             N      N      
      3 DOSE NOT CHANGED  Y     RECOVERED/RESOLVED               N      N      
      4 DOSE NOT CHANGED  Y     RECOVERED/RESOLVED WITH SEQUELAE N      N      
      5 DOSE NOT CHANGED  N     RECOVERING/RESOLVING             N      Y      
      6 DOSE RATE REDUCED Y     RECOVERED/RESOLVED               N      Y      
      7 UNKNOWN           N     RECOVERED/RESOLVED WITH SEQUELAE N      N      
        AESDISAB AESHOSP AESLIFE AESMIE TRTEMFL AECONTRT ASTDTM             
        <fct>    <fct>   <fct>   <fct>  <fct>   <fct>    <dttm>             
      1 N        Y       N       N      Y       N        2021-05-26 22:43:53
      2 N        N       N       Y      Y       N        2022-01-28 22:43:53
      3 N        N       N       Y      Y       N        2022-02-28 22:43:53
      4 Y        N       N       N      Y       Y        2022-04-28 22:43:53
      5 N        N       N       N      Y       N        2022-07-02 22:43:53
      6 N        N       N       N      Y       N        2023-07-17 22:43:53
      7 N        N       N       Y      Y       Y        2023-12-27 22:43:53
        AENDTM              ASTDY AENDY LDOSEDTM             LDRELTM AETOXGR
        <dttm>              <int> <int> <dttm>                 <dbl> <fct>  
      1 2023-02-12 22:43:53   129   756 2021-05-12 07:12:28   21091. 1      
      2 2023-09-09 22:43:53   376   965 2021-06-24 05:39:57  314944. 3      
      3 2023-06-16 22:43:53   407   880 2022-02-21 05:18:58   11125. 2      
      4 2023-07-26 22:43:53   466   920 2021-02-25 06:29:42  615854. 4      
      5 2022-09-11 22:43:53   531   602 2022-03-10 12:59:19  164745. 3      
      6 2023-12-28 22:43:53   911  1075 2023-03-01 08:49:36  199554. 2      
      7 2024-01-03 22:43:53  1074  1081 2021-11-17 18:20:54 1109063. 3      
        SMQ01NAM                 SMQ02NAM SMQ01SC SMQ02SC CQ01NAM                 
        <chr>                    <chr>    <chr>   <chr>   <chr>                   
      1 <NA>                     <NA>     <NA>    <NA>    D.2.1.5.3/A.1.1.1.1 AESI
      2 <NA>                     <NA>     <NA>    <NA>    <NA>                    
      3 <NA>                     <NA>     <NA>    <NA>    <NA>                    
      4 C.1.1.1.3/B.2.2.3.1 AESI <NA>     BROAD   <NA>    <NA>                    
      5 <NA>                     <NA>     <NA>    <NA>    <NA>                    
      6 <NA>                     <NA>     <NA>    <NA>    <NA>                    
      7 <NA>                     <NA>     <NA>    <NA>    <NA>                    
        ANL01FL AERELNST            AEACNOTH                       
        <fct>   <fct>               <fct>                          
      1 Y       DISEASE UNDER STUDY PROCEDURE/SURGERY              
      2 Y       DISEASE UNDER STUDY SUBJECT DISCONTINUED FROM STUDY
      3 Y       DISEASE UNDER STUDY SUBJECT DISCONTINUED FROM STUDY
      4 Y       CONCURRENT ILLNESS  NONE                           
      5 Y       CONCURRENT ILLNESS  SUBJECT DISCONTINUED FROM STUDY
      6 Y       CONCURRENT ILLNESS  PROCEDURE/SURGERY              
      7 Y       OTHER               PROCEDURE/SURGERY              

---

    Code
      rand_rows
    Output
      # A tibble: 10 x 92
         STUDYID USUBJID             SUBJID SITEID   AGE AGEU  SEX  
         <chr>   <chr>               <chr>  <chr>  <int> <fct> <fct>
       1 AB12345 AB12345-CHN-11-id-1 id-1   CHN-11    35 YEARS F    
       2 AB12345 AB12345-CHN-11-id-1 id-1   CHN-11    35 YEARS F    
       3 AB12345 AB12345-CHN-11-id-1 id-1   CHN-11    35 YEARS F    
       4 AB12345 AB12345-RUS-1-id-6  id-6   RUS-1     36 YEARS F    
       5 AB12345 AB12345-CHN-11-id-2 id-2   CHN-11    35 YEARS M    
       6 AB12345 AB12345-USA-13-id-3 id-3   USA-13    35 YEARS F    
       7 AB12345 AB12345-RUS-1-id-4  id-4   RUS-1     36 YEARS M    
       8 AB12345 AB12345-RUS-1-id-4  id-4   RUS-1     36 YEARS M    
       9 AB12345 AB12345-CHN-3-id-10 id-10  CHN-3     35 YEARS M    
      10 AB12345 AB12345-BRA-1-id-9  id-9   BRA-1     35 YEARS F    
         RACE                             ETHNIC                 COUNTRY DTHFL
         <fct>                            <fct>                  <fct>   <fct>
       1 WHITE                            NOT HISPANIC OR LATINO CHN     Y    
       2 WHITE                            NOT HISPANIC OR LATINO CHN     Y    
       3 WHITE                            NOT HISPANIC OR LATINO CHN     Y    
       4 ASIAN                            NOT HISPANIC OR LATINO RUS     N    
       5 BLACK OR AFRICAN AMERICAN        NOT HISPANIC OR LATINO CHN     N    
       6 AMERICAN INDIAN OR ALASKA NATIVE NOT HISPANIC OR LATINO USA     N    
       7 BLACK OR AFRICAN AMERICAN        NOT HISPANIC OR LATINO RUS     N    
       8 BLACK OR AFRICAN AMERICAN        NOT HISPANIC OR LATINO RUS     N    
       9 ASIAN                            NOT HISPANIC OR LATINO CHN     N    
      10 BLACK OR AFRICAN AMERICAN        UNKNOWN                BRA     N    
         INVID         INVNAM         ARM            ARMCD ACTARM         ACTARMCD
         <chr>         <chr>          <fct>          <fct> <fct>          <fct>   
       1 INV ID CHN-11 Dr. CHN-11 Doe C: Combination ARM C C: Combination ARM C   
       2 INV ID CHN-11 Dr. CHN-11 Doe C: Combination ARM C C: Combination ARM C   
       3 INV ID CHN-11 Dr. CHN-11 Doe C: Combination ARM C C: Combination ARM C   
       4 INV ID RUS-1  Dr. RUS-1 Doe  A: Drug X      ARM A A: Drug X      ARM A   
       5 INV ID CHN-11 Dr. CHN-11 Doe A: Drug X      ARM A A: Drug X      ARM A   
       6 INV ID USA-13 Dr. USA-13 Doe A: Drug X      ARM A A: Drug X      ARM A   
       7 INV ID RUS-1  Dr. RUS-1 Doe  B: Placebo     ARM B B: Placebo     ARM B   
       8 INV ID RUS-1  Dr. RUS-1 Doe  B: Placebo     ARM B B: Placebo     ARM B   
       9 INV ID CHN-3  Dr. CHN-3 Doe  B: Placebo     ARM B B: Placebo     ARM B   
      10 INV ID BRA-1  Dr. BRA-1 Doe  C: Combination ARM C C: Combination ARM C   
         TRT01P         TRT01A         TRT02P         TRT02A         REGION1      
         <fct>          <fct>          <fct>          <fct>          <fct>        
       1 C: Combination C: Combination B: Placebo     B: Placebo     Asia         
       2 C: Combination C: Combination B: Placebo     B: Placebo     Asia         
       3 C: Combination C: Combination B: Placebo     B: Placebo     Asia         
       4 A: Drug X      A: Drug X      C: Combination A: Drug X      Eurasia      
       5 A: Drug X      A: Drug X      A: Drug X      A: Drug X      Asia         
       6 A: Drug X      A: Drug X      B: Placebo     A: Drug X      North America
       7 B: Placebo     B: Placebo     A: Drug X      A: Drug X      Eurasia      
       8 B: Placebo     B: Placebo     A: Drug X      A: Drug X      Eurasia      
       9 B: Placebo     B: Placebo     A: Drug X      A: Drug X      Asia         
      10 C: Combination C: Combination A: Drug X      C: Combination South America
         STRATA1 STRATA2 BMRKR1 BMRKR2 ITTFL SAFFL BMEASIFL BEP01FL AEWITHFL
         <fct>   <fct>    <dbl> <fct>  <fct> <fct> <fct>    <fct>   <fct>   
       1 B       S1        8.93 LOW    Y     Y     N        N       N       
       2 B       S1        8.93 LOW    Y     Y     N        N       N       
       3 B       S1        8.93 LOW    Y     Y     N        N       N       
       4 B       S1        9.34 MEDIUM Y     Y     N        N       N       
       5 C       S2        4.08 HIGH   Y     Y     Y        Y       N       
       6 C       S1        7.25 LOW    Y     Y     Y        N       N       
       7 A       S1        9.95 MEDIUM Y     Y     Y        N       N       
       8 A       S1        9.95 MEDIUM Y     Y     Y        N       N       
       9 A       S1        1.78 LOW    Y     Y     N        Y       N       
      10 A       S1        6.92 HIGH   Y     Y     Y        N       N       
         RANDDT     TRTSDTM             TRTEDTM             TRT01SDTM          
         <date>     <dttm>              <dttm>              <dttm>             
       1 2020-04-29 2020-05-02 02:28:45 2021-09-08 20:09:38 2020-05-02 02:28:45
       2 2020-04-29 2020-05-02 02:28:45 2021-09-08 20:09:38 2020-05-02 02:28:45
       3 2020-04-29 2020-05-02 02:28:45 2021-09-08 20:09:38 2020-05-02 02:28:45
       4 2020-10-24 2020-10-26 22:16:26 2023-10-27 16:16:26 2020-10-26 22:16:26
       5 2020-02-23 2020-02-26 18:15:59 NA                  2020-02-26 18:15:59
       6 2019-10-16 2019-10-17 17:56:02 2022-10-17 11:56:02 2019-10-17 17:56:02
       7 2020-08-27 2020-08-28 20:42:09 2022-01-23 08:46:48 2020-08-28 20:42:09
       8 2020-08-27 2020-08-28 20:42:09 2022-01-23 08:46:48 2020-08-28 20:42:09
       9 2019-03-24 2019-03-28 12:07:16 2022-03-28 06:07:16 2019-03-28 12:07:16
      10 2021-01-17 2021-01-17 22:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
         TRT01EDTM           TRT02SDTM           TRT02EDTM          
         <dttm>              <dttm>              <dttm>             
       1 2020-09-08 14:09:38 2020-09-08 14:09:38 2021-09-08 20:09:38
       2 2020-09-08 14:09:38 2020-09-08 14:09:38 2021-09-08 20:09:38
       3 2020-09-08 14:09:38 2020-09-08 14:09:38 2021-09-08 20:09:38
       4 2022-10-27 10:16:26 2022-10-27 10:16:26 2023-10-27 16:16:26
       5 NA                  NA                  NA                 
       6 2021-10-17 05:56:02 2021-10-17 05:56:02 2022-10-17 11:56:02
       7 2021-01-23 02:46:48 2021-01-23 02:46:48 2022-01-23 08:46:48
       8 2021-01-23 02:46:48 2021-01-23 02:46:48 2022-01-23 08:46:48
       9 2021-03-28 00:07:16 2021-03-28 00:07:16 2022-03-28 06:07:16
      10 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53
         AP01SDTM            AP01EDTM            AP02SDTM           
         <dttm>              <dttm>              <dttm>             
       1 2020-05-02 02:28:45 2020-09-08 14:09:38 2020-09-08 14:09:38
       2 2020-05-02 02:28:45 2020-09-08 14:09:38 2020-09-08 14:09:38
       3 2020-05-02 02:28:45 2020-09-08 14:09:38 2020-09-08 14:09:38
       4 2020-10-26 22:16:26 2022-10-27 10:16:26 2022-10-27 10:16:26
       5 2020-02-26 18:15:59 NA                  NA                 
       6 2019-10-17 17:56:02 2021-10-17 05:56:02 2021-10-17 05:56:02
       7 2020-08-28 20:42:09 2021-01-23 02:46:48 2021-01-23 02:46:48
       8 2020-08-28 20:42:09 2021-01-23 02:46:48 2021-01-23 02:46:48
       9 2019-03-28 12:07:16 2021-03-28 00:07:16 2021-03-28 00:07:16
      10 2021-01-17 22:43:53 2023-01-18 10:43:53 2023-01-18 10:43:53
         AP02EDTM            EOSSTT       EOTSTT       EOSDT      EOSDY DCSREAS      
         <dttm>              <fct>        <fct>        <date>     <int> <fct>        
       1 2021-09-08 20:09:38 DISCONTINUED DISCONTINUED 2021-09-08   495 DEATH        
       2 2021-09-08 20:09:38 DISCONTINUED DISCONTINUED 2021-09-08   495 DEATH        
       3 2021-09-08 20:09:38 DISCONTINUED DISCONTINUED 2021-09-08   495 DEATH        
       4 2023-10-27 16:16:26 COMPLETED    COMPLETED    2023-10-27  1096 <NA>         
       5 NA                  ONGOING      ONGOING      NA            NA <NA>         
       6 2022-10-17 11:56:02 COMPLETED    COMPLETED    2022-10-17  1096 <NA>         
       7 2022-01-23 08:46:48 DISCONTINUED DISCONTINUED 2022-01-23   513 ADVERSE EVENT
       8 2022-01-23 08:46:48 DISCONTINUED DISCONTINUED 2022-01-23   513 ADVERSE EVENT
       9 2022-03-28 06:07:16 COMPLETED    COMPLETED    2022-03-28  1096 <NA>         
      10 2024-01-18 16:43:53 COMPLETED    COMPLETED    2024-01-18  1096 <NA>         
         DTHDT      DTHCAUS       DTHCAT        LDDTHELD LDDTHGR1 LSTALVDT   DTHADY
         <date>     <fct>         <fct>            <int> <fct>    <date>      <int>
       1 2021-09-27 ADVERSE EVENT ADVERSE EVENT       19 <=30     2021-09-27    512
       2 2021-09-27 ADVERSE EVENT ADVERSE EVENT       19 <=30     2021-09-27    512
       3 2021-09-27 ADVERSE EVENT ADVERSE EVENT       19 <=30     2021-09-27    512
       4 NA         <NA>          <NA>                NA <NA>     2023-11-13     NA
       5 NA         <NA>          <NA>                NA <NA>     NA             NA
       6 NA         <NA>          <NA>                NA <NA>     2022-10-30     NA
       7 NA         <NA>          <NA>                NA <NA>     2022-02-12     NA
       8 NA         <NA>          <NA>                NA <NA>     2022-02-12     NA
       9 NA         <NA>          <NA>                NA <NA>     2022-04-14     NA
      10 NA         <NA>          <NA>                NA <NA>     2024-02-10     NA
         ADTHAUT  ASEQ AESEQ AETERM        AELLT         AEDECOD       AEHLT      
         <fct>   <int> <int> <fct>         <fct>         <fct>         <fct>      
       1 Yes         8     8 trm D.1.1.1.1 llt D.1.1.1.1 dcd D.1.1.1.1 hlt D.1.1.1
       2 Yes         6     6 trm B.2.1.2.1 llt B.2.1.2.1 dcd B.2.1.2.1 hlt B.2.1.2
       3 Yes         9     9 trm D.1.1.4.2 llt D.1.1.4.2 dcd D.1.1.4.2 hlt D.1.1.4
       4 <NA>        3     3 trm C.2.1.2.1 llt C.2.1.2.1 dcd C.2.1.2.1 hlt C.2.1.2
       5 <NA>        3     3 trm B.1.1.1.1 llt B.1.1.1.1 dcd B.1.1.1.1 hlt B.1.1.1
       6 <NA>        4     4 trm B.2.2.3.1 llt B.2.2.3.1 dcd B.2.2.3.1 hlt B.2.2.3
       7 <NA>        5     5 trm C.1.1.1.3 llt C.1.1.1.3 dcd C.1.1.1.3 hlt C.1.1.1
       8 <NA>        6     6 trm B.1.1.1.1 llt B.1.1.1.1 dcd B.1.1.1.1 hlt B.1.1.1
       9 <NA>        8     8 trm A.1.1.1.1 llt A.1.1.1.1 dcd A.1.1.1.1 hlt A.1.1.1
      10 <NA>        5     5 trm D.1.1.4.2 llt D.1.1.4.2 dcd D.1.1.4.2 hlt D.1.1.4
         AEHLGT     AEBODSYS AESOC AESEV    AESER AEACN            AEREL
         <fct>      <fct>    <fct> <fct>    <fct> <chr>            <fct>
       1 hlgt D.1.1 cl D.1   cl D  SEVERE   Y     NOT EVALUABLE    Y    
       2 hlgt B.2.1 cl B.2   cl B  MODERATE N     DOSE NOT CHANGED N    
       3 hlgt D.1.1 cl D.1   cl D  MODERATE N     DOSE NOT CHANGED N    
       4 hlgt C.2.1 cl C.2   cl C  MODERATE N     DOSE NOT CHANGED Y    
       5 hlgt B.1.1 cl B.1   cl B  SEVERE   Y     NOT EVALUABLE    Y    
       6 hlgt B.2.2 cl B.2   cl B  MILD     Y     UNKNOWN          N    
       7 hlgt C.1.1 cl C.1   cl C  SEVERE   N     DOSE REDUCED     Y    
       8 hlgt B.1.1 cl B.1   cl B  SEVERE   Y     NOT EVALUABLE    Y    
       9 hlgt A.1.1 cl A.1   cl A  MILD     N     DOSE NOT CHANGED N    
      10 hlgt D.1.1 cl D.1   cl D  MODERATE N     DOSE NOT CHANGED N    
         AEOUT                            AESDTH AESCONG AESDISAB AESHOSP AESLIFE
         <chr>                            <fct>  <fct>   <fct>    <fct>   <fct>  
       1 FATAL                            Y      N       N        N       N      
       2 RECOVERED/RESOLVED               N      N       N        N       N      
       3 RECOVERING/RESOLVING             N      N       Y        N       N      
       4 RECOVERED/RESOLVED               N      N       N        N       N      
       5 FATAL                            Y      N       N        N       N      
       6 RECOVERED/RESOLVED WITH SEQUELAE N      Y       N        N       N      
       7 RECOVERED/RESOLVED               N      N       N        Y       N      
       8 FATAL                            Y      N       N        N       N      
       9 UNKNOWN                          N      N       N        Y       N      
      10 RECOVERING/RESOLVING             N      Y       N        N       N      
         AESMIE TRTEMFL AECONTRT ASTDTM              AENDTM              ASTDY AENDY
         <fct>  <fct>   <fct>    <dttm>              <dttm>              <int> <int>
       1 N      Y       Y        2021-04-05 02:28:45 2021-08-12 02:28:45   338   467
       2 Y      Y       Y        2021-02-20 02:28:45 2021-07-29 02:28:45   294   453
       3 N      Y       N        2021-08-20 02:28:45 2021-09-02 02:28:45   475   488
       4 Y      Y       N        2021-06-01 22:16:26 2023-08-07 22:16:26   218  1015
       5 N      Y       Y        2022-01-07 18:15:59 2022-02-03 18:15:59   681   708
       6 N      Y       N        2021-10-18 17:56:02 2022-04-09 17:56:02   732   905
       7 N      Y       N        2021-08-17 20:42:09 2021-12-23 20:42:09   354   482
       8 N      Y       N        2021-08-23 20:42:09 2021-12-06 20:42:09   360   465
       9 N      Y       N        2021-08-01 12:07:16 2022-02-10 12:07:16   857  1050
      10 N      Y       N        2022-07-02 22:43:53 2022-09-11 22:43:53   531   602
         LDOSEDTM            LDRELTM AETOXGR SMQ01NAM                 SMQ02NAM SMQ01SC
         <dttm>                <dbl> <fct>   <chr>                    <chr>    <chr>  
       1 2021-01-14 17:03:09 115766. 5       <NA>                     <NA>     <NA>   
       2 2020-08-29 09:01:30 251607. 3       <NA>                     <NA>     <NA>   
       3 2021-07-29 00:55:51  31773. 3       <NA>                     <NA>     <NA>   
       4 2021-04-03 01:35:40  86201. 2       <NA>                     <NA>     <NA>   
       5 2021-12-17 19:00:55  30195. 5       <NA>                     <NA>     <NA>   
       6 2020-01-29 01:33:27 905303. 1       C.1.1.1.3/B.2.2.3.1 AESI <NA>     BROAD  
       7 2020-10-30 07:50:21 419812. 4       C.1.1.1.3/B.2.2.3.1 AESI <NA>     BROAD  
       8 2021-01-14 05:05:17 319177. 5       <NA>                     <NA>     <NA>   
       9 2020-04-27 01:19:10 664488. 1       <NA>                     <NA>     <NA>   
      10 2022-03-10 12:59:19 164745. 3       <NA>                     <NA>     <NA>   
         SMQ02SC CQ01NAM                  ANL01FL AERELNST           
         <chr>   <chr>                    <fct>   <fct>              
       1 <NA>    <NA>                     "Y"     OTHER              
       2 <NA>    <NA>                     "Y"     CONCURRENT ILLNESS 
       3 <NA>    <NA>                     "Y"     DISEASE UNDER STUDY
       4 <NA>    <NA>                     "Y"     DISEASE UNDER STUDY
       5 <NA>    <NA>                     ""      OTHER              
       6 <NA>    <NA>                     "Y"     OTHER              
       7 <NA>    <NA>                     "Y"     OTHER              
       8 <NA>    <NA>                     "Y"     NONE               
       9 <NA>    D.2.1.5.3/A.1.1.1.1 AESI "Y"     OTHER              
      10 <NA>    <NA>                     "Y"     CONCURRENT ILLNESS 
         AEACNOTH                       
         <fct>                          
       1 MEDICATION                     
       2 NONE                           
       3 MEDICATION                     
       4 NONE                           
       5 MEDICATION                     
       6 SUBJECT DISCONTINUED FROM STUDY
       7 NONE                           
       8 MEDICATION                     
       9 PROCEDURE/SURGERY              
      10 SUBJECT DISCONTINUED FROM STUDY

# radaette produces expected values

    Code
      first_pt_rows
    Output
      # A tibble: 9 x 66
        STUDYID USUBJID            SUBJID SITEID   AGE AGEU  SEX  
        <chr>   <chr>              <chr>  <chr>  <int> <fct> <fct>
      1 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      2 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      3 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      4 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      5 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      6 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      7 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      8 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      9 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
        RACE                      ETHNIC  COUNTRY DTHFL INVID        INVNAM       
        <fct>                     <fct>   <fct>   <fct> <chr>        <chr>        
      1 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      2 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      3 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      4 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      5 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      6 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      7 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      8 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      9 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
        ARM            ARMCD ACTARM         ACTARMCD TRT01P         TRT01A        
        <fct>          <fct> <fct>          <fct>    <fct>          <fct>         
      1 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      2 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      3 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      4 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      5 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      6 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      7 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      8 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      9 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
        TRT02P    TRT02A         REGION1       STRATA1 STRATA2 BMRKR1 BMRKR2 ITTFL
        <fct>     <fct>          <fct>         <fct>   <fct>    <dbl> <fct>  <fct>
      1 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      2 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      3 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      4 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      5 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      6 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      7 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      8 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      9 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
        SAFFL BMEASIFL BEP01FL AEWITHFL RANDDT     TRTSDTM            
        <fct> <fct>    <fct>   <fct>    <date>     <dttm>             
      1 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      2 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      3 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      4 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      5 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      6 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      7 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      8 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      9 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
        TRTEDTM             TRT01SDTM           TRT01EDTM          
        <dttm>              <dttm>              <dttm>             
      1 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      2 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      3 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      4 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      5 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      6 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      7 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      8 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      9 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
        TRT02SDTM           TRT02EDTM           AP01SDTM           
        <dttm>              <dttm>              <dttm>             
      1 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      2 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      3 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      4 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      5 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      6 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      7 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      8 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      9 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
        AP01EDTM            AP02SDTM            AP02EDTM            EOSSTT   
        <dttm>              <dttm>              <dttm>              <fct>    
      1 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      2 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      3 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      4 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      5 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      6 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      7 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      8 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      9 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
        EOTSTT    EOSDT      EOSDY DCSREAS DTHDT  DTHCAUS DTHCAT LDDTHELD LDDTHGR1
        <fct>     <date>     <int> <fct>   <date> <fct>   <fct>     <int> <fct>   
      1 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      2 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      3 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      4 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      5 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      6 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      7 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      8 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      9 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
        LSTALVDT   DTHADY ADTHAUT  ASEQ TTESEQ
        <date>      <int> <fct>   <int>  <int>
      1 2024-02-10     NA <NA>        5      5
      2 2024-02-10     NA <NA>        7      7
      3 2024-02-10     NA <NA>        8      8
      4 2024-02-10     NA <NA>        9      9
      5 2024-02-10     NA <NA>        2      2
      6 2024-02-10     NA <NA>        6      6
      7 2024-02-10     NA <NA>        1      1
      8 2024-02-10     NA <NA>        4      4
      9 2024-02-10     NA <NA>        3      3
        PARAM                                                 PARAMCD     AVAL AVALU
        <fct>                                                 <fct>      <dbl> <fct>
      1 Time to end of AE reporting period                    AEREPTTE  3.00   YEARS
      2 Number of occurrences of any adverse event            AETOT1    5      <NA> 
      3 Number of occurrences of any serious adverse event    AETOT2    0      <NA> 
      4 Number of occurrences of a grade 3-5 adverse event    AETOT3    4      <NA> 
      5 Time to first occurrence of any adverse event         AETTE1    0.205  YEARS
      6 Time to first occurrence of any serious adverse event AETTE2    3.00   YEARS
      7 Time to first occurrence of a grade 3-5 adverse event AETTE3    0.0463 YEARS
      8 Time to Hy's Law Elevation in relation to Baseline    HYSTTEBL 83.3    WEEKS
      9 Time to Hy's Law Elevation in relation to ULN         HYSTTEUL 41.1    WEEKS
        ADTM                  ADY  CNSR EVNTDESC                       
        <dttm>              <int> <int> <chr>                          
      1 2024-01-18 00:00:00  1097     0 "Completion or Discontinuation"
      2 NA                     NA    NA  <NA>                          
      3 NA                     NA    NA  <NA>                          
      4 NA                     NA    NA  <NA>                          
      5 2021-04-02 22:43:53    75     0 "Preferred Term"               
      6 2024-01-19 22:43:53  1097     1 ""                             
      7 2021-02-03 22:43:53    17     0 "Preferred Term"               
      8 2022-08-22 16:49:24   583     1  <NA>                          
      9 2021-10-31 05:12:47   288     1  <NA>                          
        CNSDTDSC                              
        <chr>                                 
      1  <NA>                                 
      2  <NA>                                 
      3  <NA>                                 
      4  <NA>                                 
      5 ""                                    
      6 "Clinical Cut Off"                    
      7 ""                                    
      8 "Last Post-Baseline ALT or AST Result"
      9 "Last Post-Baseline ALT or AST Result"

---

    Code
      rand_rows
    Output
      # A tibble: 10 x 66
         STUDYID USUBJID             SUBJID SITEID   AGE AGEU  SEX  
         <chr>   <chr>               <chr>  <chr>  <int> <fct> <fct>
       1 AB12345 AB12345-CHN-3-id-5  id-5   CHN-3     36 YEARS F    
       2 AB12345 AB12345-BRA-9-id-8  id-8   BRA-9     31 YEARS F    
       3 AB12345 AB12345-USA-13-id-3 id-3   USA-13    35 YEARS F    
       4 AB12345 AB12345-BRA-1-id-9  id-9   BRA-1     35 YEARS F    
       5 AB12345 AB12345-CHN-3-id-5  id-5   CHN-3     36 YEARS F    
       6 AB12345 AB12345-RUS-1-id-4  id-4   RUS-1     36 YEARS M    
       7 AB12345 AB12345-CHN-3-id-10 id-10  CHN-3     35 YEARS M    
       8 AB12345 AB12345-RUS-1-id-6  id-6   RUS-1     36 YEARS F    
       9 AB12345 AB12345-RUS-1-id-4  id-4   RUS-1     36 YEARS M    
      10 AB12345 AB12345-CHN-11-id-1 id-1   CHN-11    35 YEARS F    
         RACE                             ETHNIC                 COUNTRY DTHFL
         <fct>                            <fct>                  <fct>   <fct>
       1 ASIAN                            NOT HISPANIC OR LATINO CHN     N    
       2 ASIAN                            NOT HISPANIC OR LATINO BRA     Y    
       3 AMERICAN INDIAN OR ALASKA NATIVE NOT HISPANIC OR LATINO USA     N    
       4 BLACK OR AFRICAN AMERICAN        UNKNOWN                BRA     N    
       5 ASIAN                            NOT HISPANIC OR LATINO CHN     N    
       6 BLACK OR AFRICAN AMERICAN        NOT HISPANIC OR LATINO RUS     N    
       7 ASIAN                            NOT HISPANIC OR LATINO CHN     N    
       8 ASIAN                            NOT HISPANIC OR LATINO RUS     N    
       9 BLACK OR AFRICAN AMERICAN        NOT HISPANIC OR LATINO RUS     N    
      10 WHITE                            NOT HISPANIC OR LATINO CHN     Y    
         INVID         INVNAM         ARM            ARMCD ACTARM         ACTARMCD
         <chr>         <chr>          <fct>          <fct> <fct>          <fct>   
       1 INV ID CHN-3  Dr. CHN-3 Doe  A: Drug X      ARM A A: Drug X      ARM A   
       2 INV ID BRA-9  Dr. BRA-9 Doe  A: Drug X      ARM A A: Drug X      ARM A   
       3 INV ID USA-13 Dr. USA-13 Doe A: Drug X      ARM A A: Drug X      ARM A   
       4 INV ID BRA-1  Dr. BRA-1 Doe  C: Combination ARM C C: Combination ARM C   
       5 INV ID CHN-3  Dr. CHN-3 Doe  A: Drug X      ARM A A: Drug X      ARM A   
       6 INV ID RUS-1  Dr. RUS-1 Doe  B: Placebo     ARM B B: Placebo     ARM B   
       7 INV ID CHN-3  Dr. CHN-3 Doe  B: Placebo     ARM B B: Placebo     ARM B   
       8 INV ID RUS-1  Dr. RUS-1 Doe  A: Drug X      ARM A A: Drug X      ARM A   
       9 INV ID RUS-1  Dr. RUS-1 Doe  B: Placebo     ARM B B: Placebo     ARM B   
      10 INV ID CHN-11 Dr. CHN-11 Doe C: Combination ARM C C: Combination ARM C   
         TRT01P         TRT01A         TRT02P         TRT02A         REGION1      
         <fct>          <fct>          <fct>          <fct>          <fct>        
       1 A: Drug X      A: Drug X      A: Drug X      C: Combination Asia         
       2 A: Drug X      A: Drug X      A: Drug X      A: Drug X      South America
       3 A: Drug X      A: Drug X      B: Placebo     A: Drug X      North America
       4 C: Combination C: Combination A: Drug X      C: Combination South America
       5 A: Drug X      A: Drug X      A: Drug X      C: Combination Asia         
       6 B: Placebo     B: Placebo     A: Drug X      A: Drug X      Eurasia      
       7 B: Placebo     B: Placebo     A: Drug X      A: Drug X      Asia         
       8 A: Drug X      A: Drug X      C: Combination A: Drug X      Eurasia      
       9 B: Placebo     B: Placebo     A: Drug X      A: Drug X      Eurasia      
      10 C: Combination C: Combination B: Placebo     B: Placebo     Asia         
         STRATA1 STRATA2 BMRKR1 BMRKR2 ITTFL SAFFL BMEASIFL BEP01FL AEWITHFL
         <fct>   <fct>    <dbl> <fct>  <fct> <fct> <fct>    <fct>   <fct>   
       1 A       S2        2.62 LOW    Y     Y     Y        N       N       
       2 B       S2       11.3  MEDIUM Y     Y     Y        Y       N       
       3 C       S1        7.25 LOW    Y     Y     Y        N       N       
       4 A       S1        6.92 HIGH   Y     Y     Y        N       N       
       5 A       S2        2.62 LOW    Y     Y     Y        N       N       
       6 A       S1        9.95 MEDIUM Y     Y     Y        N       N       
       7 A       S1        1.78 LOW    Y     Y     N        Y       N       
       8 B       S1        9.34 MEDIUM Y     Y     N        N       N       
       9 A       S1        9.95 MEDIUM Y     Y     Y        N       N       
      10 B       S1        8.93 LOW    Y     Y     N        N       N       
         RANDDT     TRTSDTM             TRTEDTM             TRT01SDTM          
         <date>     <dttm>              <dttm>              <dttm>             
       1 2020-06-24 2020-06-27 04:48:00 2023-06-27 22:48:00 2020-06-27 04:48:00
       2 2020-01-18 2020-01-21 10:19:08 2021-10-16 19:37:36 2020-01-21 10:19:08
       3 2019-10-16 2019-10-17 17:56:02 2022-10-17 11:56:02 2019-10-17 17:56:02
       4 2021-01-17 2021-01-17 22:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       5 2020-06-24 2020-06-27 04:48:00 2023-06-27 22:48:00 2020-06-27 04:48:00
       6 2020-08-27 2020-08-28 20:42:09 2022-01-23 08:46:48 2020-08-28 20:42:09
       7 2019-03-24 2019-03-28 12:07:16 2022-03-28 06:07:16 2019-03-28 12:07:16
       8 2020-10-24 2020-10-26 22:16:26 2023-10-27 16:16:26 2020-10-26 22:16:26
       9 2020-08-27 2020-08-28 20:42:09 2022-01-23 08:46:48 2020-08-28 20:42:09
      10 2020-04-29 2020-05-02 02:28:45 2021-09-08 20:09:38 2020-05-02 02:28:45
         TRT01EDTM           TRT02SDTM           TRT02EDTM          
         <dttm>              <dttm>              <dttm>             
       1 2022-06-27 16:48:00 2022-06-27 16:48:00 2023-06-27 22:48:00
       2 2020-10-16 13:37:36 2020-10-16 13:37:36 2021-10-16 19:37:36
       3 2021-10-17 05:56:02 2021-10-17 05:56:02 2022-10-17 11:56:02
       4 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53
       5 2022-06-27 16:48:00 2022-06-27 16:48:00 2023-06-27 22:48:00
       6 2021-01-23 02:46:48 2021-01-23 02:46:48 2022-01-23 08:46:48
       7 2021-03-28 00:07:16 2021-03-28 00:07:16 2022-03-28 06:07:16
       8 2022-10-27 10:16:26 2022-10-27 10:16:26 2023-10-27 16:16:26
       9 2021-01-23 02:46:48 2021-01-23 02:46:48 2022-01-23 08:46:48
      10 2020-09-08 14:09:38 2020-09-08 14:09:38 2021-09-08 20:09:38
         AP01SDTM            AP01EDTM            AP02SDTM           
         <dttm>              <dttm>              <dttm>             
       1 2020-06-27 04:48:00 2022-06-27 16:48:00 2022-06-27 16:48:00
       2 2020-01-21 10:19:08 2020-10-16 13:37:36 2020-10-16 13:37:36
       3 2019-10-17 17:56:02 2021-10-17 05:56:02 2021-10-17 05:56:02
       4 2021-01-17 22:43:53 2023-01-18 10:43:53 2023-01-18 10:43:53
       5 2020-06-27 04:48:00 2022-06-27 16:48:00 2022-06-27 16:48:00
       6 2020-08-28 20:42:09 2021-01-23 02:46:48 2021-01-23 02:46:48
       7 2019-03-28 12:07:16 2021-03-28 00:07:16 2021-03-28 00:07:16
       8 2020-10-26 22:16:26 2022-10-27 10:16:26 2022-10-27 10:16:26
       9 2020-08-28 20:42:09 2021-01-23 02:46:48 2021-01-23 02:46:48
      10 2020-05-02 02:28:45 2020-09-08 14:09:38 2020-09-08 14:09:38
         AP02EDTM            EOSSTT       EOTSTT       EOSDT      EOSDY DCSREAS      
         <dttm>              <fct>        <fct>        <date>     <int> <fct>        
       1 2023-06-27 22:48:00 COMPLETED    COMPLETED    2023-06-27  1096 <NA>         
       2 2021-10-16 19:37:36 DISCONTINUED DISCONTINUED 2021-10-16   635 DEATH        
       3 2022-10-17 11:56:02 COMPLETED    COMPLETED    2022-10-17  1096 <NA>         
       4 2024-01-18 16:43:53 COMPLETED    COMPLETED    2024-01-18  1096 <NA>         
       5 2023-06-27 22:48:00 COMPLETED    COMPLETED    2023-06-27  1096 <NA>         
       6 2022-01-23 08:46:48 DISCONTINUED DISCONTINUED 2022-01-23   513 ADVERSE EVENT
       7 2022-03-28 06:07:16 COMPLETED    COMPLETED    2022-03-28  1096 <NA>         
       8 2023-10-27 16:16:26 COMPLETED    COMPLETED    2023-10-27  1096 <NA>         
       9 2022-01-23 08:46:48 DISCONTINUED DISCONTINUED 2022-01-23   513 ADVERSE EVENT
      10 2021-09-08 20:09:38 DISCONTINUED DISCONTINUED 2021-09-08   495 DEATH        
         DTHDT      DTHCAUS             DTHCAT              LDDTHELD LDDTHGR1
         <date>     <fct>               <fct>                  <int> <fct>   
       1 NA         <NA>                <NA>                      NA <NA>    
       2 2021-11-23 DISEASE PROGRESSION PROGRESSIVE DISEASE       38 >30     
       3 NA         <NA>                <NA>                      NA <NA>    
       4 NA         <NA>                <NA>                      NA <NA>    
       5 NA         <NA>                <NA>                      NA <NA>    
       6 NA         <NA>                <NA>                      NA <NA>    
       7 NA         <NA>                <NA>                      NA <NA>    
       8 NA         <NA>                <NA>                      NA <NA>    
       9 NA         <NA>                <NA>                      NA <NA>    
      10 2021-09-27 ADVERSE EVENT       ADVERSE EVENT             19 <=30    
         LSTALVDT   DTHADY ADTHAUT  ASEQ TTESEQ
         <date>      <int> <fct>   <int>  <int>
       1 2023-07-10     NA <NA>        4      4
       2 2021-11-23    671 Yes         2      2
       3 2022-10-30     NA <NA>        7      7
       4 2024-02-10     NA <NA>        7      7
       5 2023-07-10     NA <NA>        8      8
       6 2022-02-12     NA <NA>        7      7
       7 2022-04-14     NA <NA>        5      5
       8 2023-11-13     NA <NA>        6      6
       9 2022-02-12     NA <NA>        8      8
      10 2021-09-27    512 Yes         5      5
         PARAM                                                 PARAMCD    AVAL AVALU
         <fct>                                                 <fct>     <dbl> <fct>
       1 Time to Hy's Law Elevation in relation to Baseline    HYSTTEBL 21     WEEKS
       2 Time to first occurrence of a grade 3-5 adverse event AETTE3    0.364 YEARS
       3 Number of occurrences of any adverse event            AETOT1    0     <NA> 
       4 Number of occurrences of any adverse event            AETOT1    5     <NA> 
       5 Number of occurrences of any serious adverse event    AETOT2    2     <NA> 
       6 Number of occurrences of any adverse event            AETOT1    6     <NA> 
       7 Time to Hy's Law Elevation in relation to Baseline    HYSTTEBL 47.1   WEEKS
       8 Time to first occurrence of any adverse event         AETTE1    3.00  YEARS
       9 Number of occurrences of any serious adverse event    AETOT2    2     <NA> 
      10 Time to end of AE reporting period                    AEREPTTE  1.36  YEARS
         ADTM                  ADY  CNSR EVNTDESC                       
         <dttm>              <int> <int> <chr>                          
       1 2020-11-20 02:07:46   147     1  <NA>                          
       2 2020-06-03 10:19:08   134     0 "Preferred Term"               
       3 NA                     NA    NA  <NA>                          
       4 NA                     NA    NA  <NA>                          
       5 NA                     NA    NA  <NA>                          
       6 NA                     NA    NA  <NA>                          
       7 2020-02-20 22:11:41   330     1  <NA>                          
       8 2023-10-28 22:16:26  1097     1 ""                             
       9 NA                     NA    NA  <NA>                          
      10 2021-09-08 00:00:00   495     0 "Completion or Discontinuation"
         CNSDTDSC                              
         <chr>                                 
       1 "Last Post-Baseline ALT or AST Result"
       2 ""                                    
       3  <NA>                                 
       4  <NA>                                 
       5  <NA>                                 
       6  <NA>                                 
       7 "Last Post-Baseline ALT or AST Result"
       8 "Clinical Cut Off"                    
       9  <NA>                                 
      10  <NA>                                 

# radcm produces expected values

    Code
      first_pt_rows
    Output
      # A tibble: 5 x 83
        STUDYID USUBJID            SUBJID SITEID   AGE AGEU  SEX  
        <chr>   <chr>              <chr>  <chr>  <int> <fct> <fct>
      1 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      2 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      3 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      4 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      5 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
        RACE                      ETHNIC  COUNTRY DTHFL INVID        INVNAM       
        <fct>                     <fct>   <fct>   <fct> <chr>        <chr>        
      1 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      2 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      3 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      4 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      5 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
        ARM            ARMCD ACTARM         ACTARMCD TRT01P         TRT01A        
        <fct>          <fct> <fct>          <fct>    <fct>          <fct>         
      1 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      2 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      3 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      4 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      5 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
        TRT02P    TRT02A         REGION1       STRATA1 STRATA2 BMRKR1 BMRKR2 ITTFL
        <fct>     <fct>          <fct>         <fct>   <fct>    <dbl> <fct>  <fct>
      1 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      2 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      3 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      4 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      5 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
        SAFFL BMEASIFL BEP01FL AEWITHFL RANDDT     TRTSDTM            
        <fct> <fct>    <fct>   <fct>    <date>     <dttm>             
      1 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      2 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      3 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      4 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      5 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
        TRTEDTM             TRT01SDTM           TRT01EDTM          
        <dttm>              <dttm>              <dttm>             
      1 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      2 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      3 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      4 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      5 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
        TRT02SDTM           TRT02EDTM           AP01SDTM           
        <dttm>              <dttm>              <dttm>             
      1 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      2 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      3 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      4 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      5 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
        AP01EDTM            AP02SDTM            AP02EDTM            EOSSTT   
        <dttm>              <dttm>              <dttm>              <fct>    
      1 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      2 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      3 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      4 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      5 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
        EOTSTT    EOSDT      EOSDY DCSREAS DTHDT  DTHCAUS DTHCAT LDDTHELD LDDTHGR1
        <fct>     <date>     <int> <fct>   <date> <fct>   <fct>     <int> <fct>   
      1 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      2 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      3 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      4 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      5 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
        LSTALVDT   DTHADY ADTHAUT  ASEQ CMSEQ CMDECOD       CMCAT   CMCLAS  ATC1      
        <date>      <int> <fct>   <int> <int> <fct>         <fct>   <fct>   <fct>     
      1 2024-02-10     NA <NA>        1     1 medname A_1/3 medcl A medcl A ATCCLAS1 A
      2 2024-02-10     NA <NA>        2     2 medname A_3/3 medcl A medcl A ATCCLAS1 A
      3 2024-02-10     NA <NA>        3     3 medname C_1/2 medcl C medcl C ATCCLAS1 C
      4 2024-02-10     NA <NA>        4     4 medname A_3/3 medcl A medcl A ATCCLAS1 A
      5 2024-02-10     NA <NA>        5     5 medname B_3/4 medcl B medcl B ATCCLAS1 B
        ATC2       ATC3       ATC4       ATC1CD     ATC2CD     ATC3CD     ATC4CD    
        <fct>      <fct>      <fct>      <fct>      <fct>      <fct>      <fct>     
      1 ATCCLAS2 A ATCCLAS3 A ATCCLAS4 A ATCCLAS1 A ATCCLAS2 A ATCCLAS3 A ATCCLAS4 A
      2 ATCCLAS2 A ATCCLAS3 A ATCCLAS4 A ATCCLAS1 A ATCCLAS2 A ATCCLAS3 A ATCCLAS4 A
      3 ATCCLAS2 C ATCCLAS3 C ATCCLAS4 C ATCCLAS1 C ATCCLAS2 C ATCCLAS3 C ATCCLAS4 C
      4 ATCCLAS2 A ATCCLAS3 A ATCCLAS4 A ATCCLAS1 A ATCCLAS2 A ATCCLAS3 A ATCCLAS4 A
      5 ATCCLAS2 B ATCCLAS3 B ATCCLAS4 B ATCCLAS1 B ATCCLAS2 B ATCCLAS3 B ATCCLAS4 B
        ATIREL      ASTDTM              AENDTM              ASTDY AENDY CMINDC      
        <fct>       <dttm>              <dttm>              <int> <int> <fct>       
      1 PRIOR       2022-07-06 22:43:53 2022-09-08 22:43:53   535   599 Hypertension
      2 CONCOMITANT 2022-12-10 22:43:53 2023-10-05 22:43:53   692   991 Hypertension
      3 CONCOMITANT 2023-01-23 22:43:53 2023-05-07 22:43:53   736   840 Urticaria   
      4 CONCOMITANT 2023-10-01 22:43:53 2024-01-11 22:43:53   987  1089 Nausea      
      5 PRIOR       2023-12-19 22:43:53 2024-01-15 22:43:53  1066  1093 Hypertension
        CMDOSE CMTRT CMDOSU    CMROUTE       CMDOSFRQ CMSTRTPT CMENRTPT ADURN ADURU
         <int> <fct> <fct>     <fct>         <fct>    <fct>    <fct>    <int> <fct>
      1     53 A_1/3 ug/kg/day SUBCUTANEOUS  TID      AFTER    BEFORE     -64 days 
      2     86 A_3/3 ug/mL     INTRAMUSCULAR Q4H      AFTER    BEFORE    -299 days 
      3     50 C_1/2 ug/mL     UNKNOWN       Q4H      AFTER    BEFORE    -104 days 
      4     80 A_3/3 uL        ORAL          Q4H      AFTER    BEFORE    -102 days 
      5     30 B_3/4 DROP      SUBCUTANEOUS  Q4W      AFTER    BEFORE     -27 days 

---

    Code
      rand_rows
    Output
      # A tibble: 10 x 83
         STUDYID USUBJID             SUBJID SITEID   AGE AGEU  SEX  
         <chr>   <chr>               <chr>  <chr>  <int> <fct> <fct>
       1 AB12345 AB12345-CHN-3-id-10 id-10  CHN-3     35 YEARS M    
       2 AB12345 AB12345-RUS-1-id-6  id-6   RUS-1     36 YEARS F    
       3 AB12345 AB12345-CHN-3-id-5  id-5   CHN-3     36 YEARS F    
       4 AB12345 AB12345-CHN-11-id-2 id-2   CHN-11    35 YEARS M    
       5 AB12345 AB12345-BRA-9-id-8  id-8   BRA-9     31 YEARS F    
       6 AB12345 AB12345-CHN-3-id-5  id-5   CHN-3     36 YEARS F    
       7 AB12345 AB12345-CHN-3-id-5  id-5   CHN-3     36 YEARS F    
       8 AB12345 AB12345-JPN-4-id-7  id-7   JPN-4     30 YEARS F    
       9 AB12345 AB12345-USA-13-id-3 id-3   USA-13    35 YEARS F    
      10 AB12345 AB12345-CHN-3-id-10 id-10  CHN-3     35 YEARS M    
         RACE                             ETHNIC                 COUNTRY DTHFL
         <fct>                            <fct>                  <fct>   <fct>
       1 ASIAN                            NOT HISPANIC OR LATINO CHN     N    
       2 ASIAN                            NOT HISPANIC OR LATINO RUS     N    
       3 ASIAN                            NOT HISPANIC OR LATINO CHN     N    
       4 BLACK OR AFRICAN AMERICAN        NOT HISPANIC OR LATINO CHN     N    
       5 ASIAN                            NOT HISPANIC OR LATINO BRA     Y    
       6 ASIAN                            NOT HISPANIC OR LATINO CHN     N    
       7 ASIAN                            NOT HISPANIC OR LATINO CHN     N    
       8 ASIAN                            NOT HISPANIC OR LATINO JPN     N    
       9 AMERICAN INDIAN OR ALASKA NATIVE NOT HISPANIC OR LATINO USA     N    
      10 ASIAN                            NOT HISPANIC OR LATINO CHN     N    
         INVID         INVNAM         ARM        ARMCD ACTARM     ACTARMCD TRT01P    
         <chr>         <chr>          <fct>      <fct> <fct>      <fct>    <fct>     
       1 INV ID CHN-3  Dr. CHN-3 Doe  B: Placebo ARM B B: Placebo ARM B    B: Placebo
       2 INV ID RUS-1  Dr. RUS-1 Doe  A: Drug X  ARM A A: Drug X  ARM A    A: Drug X 
       3 INV ID CHN-3  Dr. CHN-3 Doe  A: Drug X  ARM A A: Drug X  ARM A    A: Drug X 
       4 INV ID CHN-11 Dr. CHN-11 Doe A: Drug X  ARM A A: Drug X  ARM A    A: Drug X 
       5 INV ID BRA-9  Dr. BRA-9 Doe  A: Drug X  ARM A A: Drug X  ARM A    A: Drug X 
       6 INV ID CHN-3  Dr. CHN-3 Doe  A: Drug X  ARM A A: Drug X  ARM A    A: Drug X 
       7 INV ID CHN-3  Dr. CHN-3 Doe  A: Drug X  ARM A A: Drug X  ARM A    A: Drug X 
       8 INV ID JPN-4  Dr. JPN-4 Doe  A: Drug X  ARM A A: Drug X  ARM A    A: Drug X 
       9 INV ID USA-13 Dr. USA-13 Doe A: Drug X  ARM A A: Drug X  ARM A    A: Drug X 
      10 INV ID CHN-3  Dr. CHN-3 Doe  B: Placebo ARM B B: Placebo ARM B    B: Placebo
         TRT01A     TRT02P         TRT02A         REGION1       STRATA1 STRATA2 BMRKR1
         <fct>      <fct>          <fct>          <fct>         <fct>   <fct>    <dbl>
       1 B: Placebo A: Drug X      A: Drug X      Asia          A       S1        1.78
       2 A: Drug X  C: Combination A: Drug X      Eurasia       B       S1        9.34
       3 A: Drug X  A: Drug X      C: Combination Asia          A       S2        2.62
       4 A: Drug X  A: Drug X      A: Drug X      Asia          C       S2        4.08
       5 A: Drug X  A: Drug X      A: Drug X      South America B       S2       11.3 
       6 A: Drug X  A: Drug X      C: Combination Asia          A       S2        2.62
       7 A: Drug X  A: Drug X      C: Combination Asia          A       S2        2.62
       8 A: Drug X  C: Combination B: Placebo     Asia          B       S1        7.46
       9 A: Drug X  B: Placebo     A: Drug X      North America C       S1        7.25
      10 B: Placebo A: Drug X      A: Drug X      Asia          A       S1        1.78
         BMRKR2 ITTFL SAFFL BMEASIFL BEP01FL AEWITHFL RANDDT     TRTSDTM            
         <fct>  <fct> <fct> <fct>    <fct>   <fct>    <date>     <dttm>             
       1 LOW    Y     Y     N        Y       N        2019-03-24 2019-03-28 12:07:16
       2 MEDIUM Y     Y     N        N       N        2020-10-24 2020-10-26 22:16:26
       3 LOW    Y     Y     Y        N       N        2020-06-24 2020-06-27 04:48:00
       4 HIGH   Y     Y     Y        Y       N        2020-02-23 2020-02-26 18:15:59
       5 MEDIUM Y     Y     Y        Y       N        2020-01-18 2020-01-21 10:19:08
       6 LOW    Y     Y     Y        N       N        2020-06-24 2020-06-27 04:48:00
       7 LOW    Y     Y     Y        N       N        2020-06-24 2020-06-27 04:48:00
       8 MEDIUM Y     Y     Y        N       N        2019-09-22 2019-09-22 02:25:18
       9 LOW    Y     Y     Y        N       N        2019-10-16 2019-10-17 17:56:02
      10 LOW    Y     Y     N        Y       N        2019-03-24 2019-03-28 12:07:16
         TRTEDTM             TRT01SDTM           TRT01EDTM          
         <dttm>              <dttm>              <dttm>             
       1 2022-03-28 06:07:16 2019-03-28 12:07:16 2021-03-28 00:07:16
       2 2023-10-27 16:16:26 2020-10-26 22:16:26 2022-10-27 10:16:26
       3 2023-06-27 22:48:00 2020-06-27 04:48:00 2022-06-27 16:48:00
       4 NA                  2020-02-26 18:15:59 NA                 
       5 2021-10-16 19:37:36 2020-01-21 10:19:08 2020-10-16 13:37:36
       6 2023-06-27 22:48:00 2020-06-27 04:48:00 2022-06-27 16:48:00
       7 2023-06-27 22:48:00 2020-06-27 04:48:00 2022-06-27 16:48:00
       8 2022-09-21 20:25:18 2019-09-22 02:25:18 2021-09-21 14:25:18
       9 2022-10-17 11:56:02 2019-10-17 17:56:02 2021-10-17 05:56:02
      10 2022-03-28 06:07:16 2019-03-28 12:07:16 2021-03-28 00:07:16
         TRT02SDTM           TRT02EDTM           AP01SDTM           
         <dttm>              <dttm>              <dttm>             
       1 2021-03-28 00:07:16 2022-03-28 06:07:16 2019-03-28 12:07:16
       2 2022-10-27 10:16:26 2023-10-27 16:16:26 2020-10-26 22:16:26
       3 2022-06-27 16:48:00 2023-06-27 22:48:00 2020-06-27 04:48:00
       4 NA                  NA                  2020-02-26 18:15:59
       5 2020-10-16 13:37:36 2021-10-16 19:37:36 2020-01-21 10:19:08
       6 2022-06-27 16:48:00 2023-06-27 22:48:00 2020-06-27 04:48:00
       7 2022-06-27 16:48:00 2023-06-27 22:48:00 2020-06-27 04:48:00
       8 2021-09-21 14:25:18 2022-09-21 20:25:18 2019-09-22 02:25:18
       9 2021-10-17 05:56:02 2022-10-17 11:56:02 2019-10-17 17:56:02
      10 2021-03-28 00:07:16 2022-03-28 06:07:16 2019-03-28 12:07:16
         AP01EDTM            AP02SDTM            AP02EDTM            EOSSTT      
         <dttm>              <dttm>              <dttm>              <fct>       
       1 2021-03-28 00:07:16 2021-03-28 00:07:16 2022-03-28 06:07:16 COMPLETED   
       2 2022-10-27 10:16:26 2022-10-27 10:16:26 2023-10-27 16:16:26 COMPLETED   
       3 2022-06-27 16:48:00 2022-06-27 16:48:00 2023-06-27 22:48:00 COMPLETED   
       4 NA                  NA                  NA                  ONGOING     
       5 2020-10-16 13:37:36 2020-10-16 13:37:36 2021-10-16 19:37:36 DISCONTINUED
       6 2022-06-27 16:48:00 2022-06-27 16:48:00 2023-06-27 22:48:00 COMPLETED   
       7 2022-06-27 16:48:00 2022-06-27 16:48:00 2023-06-27 22:48:00 COMPLETED   
       8 2021-09-21 14:25:18 2021-09-21 14:25:18 2022-09-21 20:25:18 COMPLETED   
       9 2021-10-17 05:56:02 2021-10-17 05:56:02 2022-10-17 11:56:02 COMPLETED   
      10 2021-03-28 00:07:16 2021-03-28 00:07:16 2022-03-28 06:07:16 COMPLETED   
         EOTSTT       EOSDT      EOSDY DCSREAS DTHDT      DTHCAUS            
         <fct>        <date>     <int> <fct>   <date>     <fct>              
       1 COMPLETED    2022-03-28  1096 <NA>    NA         <NA>               
       2 COMPLETED    2023-10-27  1096 <NA>    NA         <NA>               
       3 COMPLETED    2023-06-27  1096 <NA>    NA         <NA>               
       4 ONGOING      NA            NA <NA>    NA         <NA>               
       5 DISCONTINUED 2021-10-16   635 DEATH   2021-11-23 DISEASE PROGRESSION
       6 COMPLETED    2023-06-27  1096 <NA>    NA         <NA>               
       7 COMPLETED    2023-06-27  1096 <NA>    NA         <NA>               
       8 COMPLETED    2022-09-21  1096 <NA>    NA         <NA>               
       9 COMPLETED    2022-10-17  1096 <NA>    NA         <NA>               
      10 COMPLETED    2022-03-28  1096 <NA>    NA         <NA>               
         DTHCAT              LDDTHELD LDDTHGR1 LSTALVDT   DTHADY ADTHAUT  ASEQ CMSEQ
         <fct>                  <int> <fct>    <date>      <int> <fct>   <int> <int>
       1 <NA>                      NA <NA>     2022-04-14     NA <NA>        1     1
       2 <NA>                      NA <NA>     2023-11-13     NA <NA>        1     1
       3 <NA>                      NA <NA>     2023-07-10     NA <NA>        2     2
       4 <NA>                      NA <NA>     NA             NA <NA>        2     2
       5 PROGRESSIVE DISEASE       38 >30      2021-11-23    671 Yes         2     2
       6 <NA>                      NA <NA>     2023-07-10     NA <NA>        5     5
       7 <NA>                      NA <NA>     2023-07-10     NA <NA>        4     4
       8 <NA>                      NA <NA>     2022-10-09     NA <NA>        3     3
       9 <NA>                      NA <NA>     2022-10-30     NA <NA>        4     4
      10 <NA>                      NA <NA>     2022-04-14     NA <NA>        4     4
         CMDECOD       CMCAT   CMCLAS  ATC1       ATC2       ATC3       ATC4      
         <fct>         <fct>   <fct>   <fct>      <fct>      <fct>      <fct>     
       1 medname B_4/4 medcl B medcl B ATCCLAS1 B ATCCLAS2 B ATCCLAS3 B ATCCLAS4 B
       2 medname B_3/4 medcl B medcl B ATCCLAS1 B ATCCLAS2 B ATCCLAS3 B ATCCLAS4 B
       3 medname C_1/2 medcl C medcl C ATCCLAS1 C ATCCLAS2 C ATCCLAS3 C ATCCLAS4 C
       4 medname B_3/4 medcl B medcl B ATCCLAS1 B ATCCLAS2 B ATCCLAS3 B ATCCLAS4 B
       5 medname B_1/4 medcl B medcl B ATCCLAS1 B ATCCLAS2 B ATCCLAS3 B ATCCLAS4 B
       6 medname B_4/4 medcl B medcl B ATCCLAS1 B ATCCLAS2 B ATCCLAS3 B ATCCLAS4 B
       7 medname C_2/2 medcl C medcl C ATCCLAS1 C ATCCLAS2 C ATCCLAS3 C ATCCLAS4 C
       8 medname C_2/2 medcl C medcl C ATCCLAS1 C ATCCLAS2 C ATCCLAS3 C ATCCLAS4 C
       9 medname C_2/2 medcl C medcl C ATCCLAS1 C ATCCLAS2 C ATCCLAS3 C ATCCLAS4 C
      10 medname A_1/3 medcl A medcl A ATCCLAS1 A ATCCLAS2 A ATCCLAS3 A ATCCLAS4 A
         ATC1CD     ATC2CD     ATC3CD     ATC4CD     ATIREL      ASTDTM             
         <fct>      <fct>      <fct>      <fct>      <fct>       <dttm>             
       1 ATCCLAS1 B ATCCLAS2 B ATCCLAS3 B ATCCLAS4 B CONCOMITANT 2019-06-19 12:07:16
       2 ATCCLAS1 B ATCCLAS2 B ATCCLAS3 B ATCCLAS4 B PRIOR       2022-03-20 22:16:26
       3 ATCCLAS1 C ATCCLAS2 C ATCCLAS3 C ATCCLAS4 C CONCOMITANT 2021-04-04 04:48:00
       4 ATCCLAS1 B ATCCLAS2 B ATCCLAS3 B ATCCLAS4 B PRIOR       2021-06-29 18:15:59
       5 ATCCLAS1 B ATCCLAS2 B ATCCLAS3 B ATCCLAS4 B CONCOMITANT 2021-08-18 10:19:08
       6 ATCCLAS1 B ATCCLAS2 B ATCCLAS3 B ATCCLAS4 B CONCOMITANT 2023-02-06 04:48:00
       7 ATCCLAS1 C ATCCLAS2 C ATCCLAS3 C ATCCLAS4 C CONCOMITANT 2022-09-15 04:48:00
       8 ATCCLAS1 C ATCCLAS2 C ATCCLAS3 C ATCCLAS4 C CONCOMITANT 2021-05-27 02:25:18
       9 ATCCLAS1 C ATCCLAS2 C ATCCLAS3 C ATCCLAS4 C CONCOMITANT 2022-02-17 17:56:02
      10 ATCCLAS1 A ATCCLAS2 A ATCCLAS3 A ATCCLAS4 A PRIOR       2021-03-29 12:07:16
         AENDTM              ASTDY AENDY CMINDC    CMDOSE CMTRT CMDOSU    CMROUTE
         <dttm>              <int> <int> <fct>      <int> <fct> <fct>     <fct>  
       1 2021-10-03 12:07:16    83   920 Pneumonia     56 B_4/4 DROP      INHALED
       2 2022-07-27 22:16:26   510   639 Nausea        20 B_3/4 uL        INHALED
       3 2022-09-17 04:48:00   281   812 Diarrhea       6 C_1/2 ug/kg/day ORAL   
       4 2021-08-27 18:15:59   489   548 Asthma        72 B_3/4 mg/breath RECTAL 
       5 2021-09-27 10:19:08   575   615 Urticaria      2 B_1/4 umol/L    NASAL  
       6 2023-05-27 04:48:00   954  1064 Nausea        99 B_4/4 umol/L    UNKNOWN
       7 2023-01-27 04:48:00   810   944 Infection     35 C_2/2 %         UNKNOWN
       8 2021-08-20 02:25:18   613   698 Pneumonia     71 C_2/2 DROP      UNKNOWN
       9 2022-06-06 17:56:02   854   963 Diarrhea      65 C_2/2 umol/L    INHALED
      10 2021-11-16 12:07:16   732   964 Asthma        27 A_1/3 mg        NASAL  
         CMDOSFRQ          CMSTRTPT CMENRTPT ADURN ADURU
         <fct>             <fct>    <fct>    <int> <fct>
       1 TWICE             BEFORE   BEFORE    -837 days 
       2 UNKNOWN           AFTER    BEFORE    -129 days 
       3 4 TIMES PER MONTH BEFORE   BEFORE    -531 days 
       4 QD                AFTER    ONGOING    -59 days 
       5 UNKNOWN           AFTER    BEFORE     -40 days 
       6 Q4H               AFTER    BEFORE    -110 days 
       7 Q4H               AFTER    BEFORE    -134 days 
       8 UNKNOWN           AFTER    BEFORE     -85 days 
       9 TWICE             AFTER    BEFORE    -109 days 
      10 4 TIMES PER MONTH AFTER    BEFORE    -232 days 

# raddv produces expected values

    Code
      first_pt_rows
    Output
      # A tibble: 2 x 66
        STUDYID USUBJID            SUBJID SITEID   AGE AGEU  SEX  
        <chr>   <chr>              <chr>  <chr>  <int> <fct> <fct>
      1 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      2 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
        RACE                      ETHNIC  COUNTRY DTHFL INVID        INVNAM       
        <fct>                     <fct>   <fct>   <fct> <chr>        <chr>        
      1 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      2 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
        ARM            ARMCD ACTARM         ACTARMCD TRT01P         TRT01A        
        <fct>          <fct> <fct>          <fct>    <fct>          <fct>         
      1 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      2 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
        TRT02P    TRT02A         REGION1       STRATA1 STRATA2 BMRKR1 BMRKR2 ITTFL
        <fct>     <fct>          <fct>         <fct>   <fct>    <dbl> <fct>  <fct>
      1 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      2 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
        SAFFL BMEASIFL BEP01FL AEWITHFL RANDDT     TRTSDTM            
        <fct> <fct>    <fct>   <fct>    <date>     <dttm>             
      1 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      2 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
        TRTEDTM             TRT01SDTM           TRT01EDTM          
        <dttm>              <dttm>              <dttm>             
      1 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      2 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
        TRT02SDTM           TRT02EDTM           AP01SDTM           
        <dttm>              <dttm>              <dttm>             
      1 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      2 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
        AP01EDTM            AP02SDTM            AP02EDTM            EOSSTT   
        <dttm>              <dttm>              <dttm>              <fct>    
      1 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      2 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
        EOTSTT    EOSDT      EOSDY DCSREAS DTHDT  DTHCAUS DTHCAT LDDTHELD LDDTHGR1
        <fct>     <date>     <int> <fct>   <date> <fct>   <fct>     <int> <fct>   
      1 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      2 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
        LSTALVDT   DTHADY ADTHAUT DOMAIN DVSEQ DVTERM                                
        <date>      <int> <fct>   <chr>  <fct> <fct>                                 
      1 2024-02-10     NA <NA>    DV     1     Other exclusion criteria              
      2 2024-02-10     NA <NA>    DV     2     Omission of screening tumor assessment
        DVDECOD            DVCAT DVSCAT DVREAS DVEPRELI ASTDT      ASTDY AEPRELFL
        <fct>              <fct> <fct>  <fct>  <fct>    <date>     <int> <fct>   
      1 EXCLUSION CRITERIA MAJOR MAJOR  ""     N        2022-02-02   381 ""      
      2 PROCEDURAL         MAJOR MAJOR  ""     N        2023-06-09   873 ""      

---

    Code
      rand_rows
    Output
      # A tibble: 2 x 66
        STUDYID USUBJID            SUBJID SITEID   AGE AGEU  SEX  
        <chr>   <chr>              <chr>  <chr>  <int> <fct> <fct>
      1 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      2 AB12345 AB12345-BRA-9-id-8 id-8   BRA-9     31 YEARS F    
        RACE                      ETHNIC                 COUNTRY DTHFL INVID       
        <fct>                     <fct>                  <fct>   <fct> <chr>       
      1 BLACK OR AFRICAN AMERICAN UNKNOWN                BRA     N     INV ID BRA-1
      2 ASIAN                     NOT HISPANIC OR LATINO BRA     Y     INV ID BRA-9
        INVNAM        ARM            ARMCD ACTARM         ACTARMCD TRT01P        
        <chr>         <fct>          <fct> <fct>          <fct>    <fct>         
      1 Dr. BRA-1 Doe C: Combination ARM C C: Combination ARM C    C: Combination
      2 Dr. BRA-9 Doe A: Drug X      ARM A A: Drug X      ARM A    A: Drug X     
        TRT01A         TRT02P    TRT02A         REGION1       STRATA1 STRATA2 BMRKR1
        <fct>          <fct>     <fct>          <fct>         <fct>   <fct>    <dbl>
      1 C: Combination A: Drug X C: Combination South America A       S1        6.92
      2 A: Drug X      A: Drug X A: Drug X      South America B       S2       11.3 
        BMRKR2 ITTFL SAFFL BMEASIFL BEP01FL AEWITHFL RANDDT     TRTSDTM            
        <fct>  <fct> <fct> <fct>    <fct>   <fct>    <date>     <dttm>             
      1 HIGH   Y     Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      2 MEDIUM Y     Y     Y        Y       N        2020-01-18 2020-01-21 10:19:08
        TRTEDTM             TRT01SDTM           TRT01EDTM          
        <dttm>              <dttm>              <dttm>             
      1 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      2 2021-10-16 19:37:36 2020-01-21 10:19:08 2020-10-16 13:37:36
        TRT02SDTM           TRT02EDTM           AP01SDTM           
        <dttm>              <dttm>              <dttm>             
      1 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      2 2020-10-16 13:37:36 2021-10-16 19:37:36 2020-01-21 10:19:08
        AP01EDTM            AP02SDTM            AP02EDTM            EOSSTT      
        <dttm>              <dttm>              <dttm>              <fct>       
      1 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED   
      2 2020-10-16 13:37:36 2020-10-16 13:37:36 2021-10-16 19:37:36 DISCONTINUED
        EOTSTT       EOSDT      EOSDY DCSREAS DTHDT      DTHCAUS            
        <fct>        <date>     <int> <fct>   <date>     <fct>              
      1 COMPLETED    2024-01-18  1096 <NA>    NA         <NA>               
      2 DISCONTINUED 2021-10-16   635 DEATH   2021-11-23 DISEASE PROGRESSION
        DTHCAT              LDDTHELD LDDTHGR1 LSTALVDT   DTHADY ADTHAUT DOMAIN DVSEQ
        <fct>                  <int> <fct>    <date>      <int> <fct>   <chr>  <fct>
      1 <NA>                      NA <NA>     2024-02-10     NA <NA>    DV     1    
      2 PROGRESSIVE DISEASE       38 >30      2021-11-23    671 Yes     DV     1    
        DVTERM                                     DVDECOD            DVCAT DVSCAT
        <fct>                                      <fct>              <fct> <fct> 
      1 Other exclusion criteria                   EXCLUSION CRITERIA MAJOR MAJOR 
      2 Received prohibited concomitant medication MEDICATION         MAJOR MAJOR 
        DVREAS DVEPRELI ASTDT      ASTDY AEPRELFL
        <fct>  <fct>    <date>     <int> <fct>   
      1 ""     N        2022-02-02   381 ""      
      2 ""     N        2020-05-04   104 ""      

# radeg produces expected values

    Code
      first_pt_rows
    Output
      # A tibble: 34 x 88
         STUDYID USUBJID            SUBJID SITEID   AGE AGEU  SEX  
         <chr>   <chr>              <chr>  <chr>  <int> <fct> <fct>
       1 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       2 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       3 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       4 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       5 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       6 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       7 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       8 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       9 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      10 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      11 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      12 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      13 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      14 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      15 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      16 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      17 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      18 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      19 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      20 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      21 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      22 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      23 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      24 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      25 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      26 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      27 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      28 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      29 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      30 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      31 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      32 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      33 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      34 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
         RACE                      ETHNIC  COUNTRY DTHFL INVID        INVNAM       
         <fct>                     <fct>   <fct>   <fct> <chr>        <chr>        
       1 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       2 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       3 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       4 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       5 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       6 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       7 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       8 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       9 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      10 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      11 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      12 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      13 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      14 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      15 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      16 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      17 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      18 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      19 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      20 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      21 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      22 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      23 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      24 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      25 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      26 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      27 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      28 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      29 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      30 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      31 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      32 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      33 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      34 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
         ARM            ARMCD ACTARM         ACTARMCD TRT01P         TRT01A        
         <fct>          <fct> <fct>          <fct>    <fct>          <fct>         
       1 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       2 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       3 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       4 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       5 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       6 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       7 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       8 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       9 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      10 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      11 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      12 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      13 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      14 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      15 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      16 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      17 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      18 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      19 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      20 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      21 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      22 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      23 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      24 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      25 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      26 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      27 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      28 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      29 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      30 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      31 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      32 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      33 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      34 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
         TRT02P    TRT02A         REGION1       STRATA1 STRATA2 BMRKR1 BMRKR2 ITTFL
         <fct>     <fct>          <fct>         <fct>   <fct>    <dbl> <fct>  <fct>
       1 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       2 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       3 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       4 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       5 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       6 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       7 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       8 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       9 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      10 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      11 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      12 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      13 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      14 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      15 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      16 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      17 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      18 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      19 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      20 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      21 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      22 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      23 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      24 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      25 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      26 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      27 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      28 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      29 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      30 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      31 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      32 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      33 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      34 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
         SAFFL BMEASIFL BEP01FL AEWITHFL RANDDT     TRTSDTM            
         <fct> <fct>    <fct>   <fct>    <date>     <dttm>             
       1 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       2 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       3 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       4 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       5 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       6 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       7 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       8 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       9 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      10 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      11 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      12 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      13 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      14 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      15 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      16 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      17 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      18 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      19 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      20 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      21 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      22 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      23 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      24 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      25 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      26 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      27 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      28 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      29 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      30 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      31 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      32 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      33 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      34 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
         TRTEDTM             TRT01SDTM           TRT01EDTM          
         <dttm>              <dttm>              <dttm>             
       1 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       2 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       3 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       4 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       5 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       6 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       7 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       8 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       9 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      10 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      11 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      12 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      13 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      14 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      15 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      16 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      17 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      18 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      19 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      20 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      21 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      22 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      23 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      24 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      25 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      26 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      27 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      28 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      29 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      30 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      31 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      32 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      33 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      34 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
         TRT02SDTM           TRT02EDTM           AP01SDTM           
         <dttm>              <dttm>              <dttm>             
       1 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       2 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       3 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       4 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       5 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       6 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       7 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       8 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       9 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      10 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      11 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      12 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      13 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      14 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      15 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      16 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      17 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      18 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      19 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      20 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      21 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      22 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      23 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      24 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      25 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      26 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      27 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      28 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      29 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      30 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      31 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      32 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      33 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      34 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
         AP01EDTM            AP02SDTM            AP02EDTM            EOSSTT   
         <dttm>              <dttm>              <dttm>              <fct>    
       1 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       2 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       3 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       4 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       5 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       6 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       7 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       8 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       9 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      10 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      11 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      12 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      13 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      14 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      15 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      16 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      17 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      18 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      19 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      20 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      21 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      22 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      23 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      24 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      25 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      26 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      27 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      28 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      29 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      30 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      31 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      32 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      33 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      34 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
         EOTSTT    EOSDT      EOSDY DCSREAS DTHDT  DTHCAUS DTHCAT LDDTHELD LDDTHGR1
         <fct>     <date>     <int> <fct>   <date> <fct>   <fct>     <int> <fct>   
       1 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       2 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       3 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       4 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       5 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       6 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       7 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       8 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       9 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      10 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      11 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      12 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      13 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      14 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      15 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      16 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      17 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      18 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      19 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      20 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      21 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      22 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      23 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      24 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      25 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      26 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      27 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      28 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      29 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      30 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      31 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      32 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      33 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      34 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
         LSTALVDT   DTHADY ADTHAUT  ASEQ EGSEQ EGTESTCD EGTEST             EGCAT      
         <date>      <int> <fct>   <int> <int> <fct>    <fct>              <fct>      
       1 2024-02-10     NA <NA>        1     1 ECGINTP  ECG Interpretation FINDING    
       2 2024-02-10     NA <NA>        5     5 ECGINTP  ECG Interpretation FINDING    
       3 2024-02-10     NA <NA>        9     9 ECGINTP  ECG Interpretation FINDING    
       4 2024-02-10     NA <NA>       13    13 ECGINTP  ECG Interpretation FINDING    
       5 2024-02-10     NA <NA>       17    17 ECGINTP  ECG Interpretation FINDING    
       6 2024-02-10     NA <NA>       21    21 ECGINTP  ECG Interpretation FINDING    
       7 2024-02-10     NA <NA>       25    25 ECGINTP  ECG Interpretation FINDING    
       8 2024-02-10     NA <NA>        2     2 HR       Heart Rate         MEASUREMENT
       9 2024-02-10     NA <NA>        6     6 HR       Heart Rate         MEASUREMENT
      10 2024-02-10     NA <NA>       10    10 HR       Heart Rate         MEASUREMENT
      11 2024-02-10     NA <NA>       14    14 HR       Heart Rate         MEASUREMENT
      12 2024-02-10     NA <NA>       18    18 HR       Heart Rate         MEASUREMENT
      13 2024-02-10     NA <NA>       22    22 HR       Heart Rate         MEASUREMENT
      14 2024-02-10     NA <NA>       26    26 HR       Heart Rate         MEASUREMENT
      15 2024-02-10     NA <NA>       22    22 HR       Heart Rate         MEASUREMENT
      16 2024-02-10     NA <NA>       10    10 HR       Heart Rate         MEASUREMENT
      17 2024-02-10     NA <NA>        3     3 QT       QT Duration        INTERVAL   
      18 2024-02-10     NA <NA>        7     7 QT       QT Duration        INTERVAL   
      19 2024-02-10     NA <NA>       11    11 QT       QT Duration        INTERVAL   
      20 2024-02-10     NA <NA>       15    15 QT       QT Duration        INTERVAL   
      21 2024-02-10     NA <NA>       19    19 QT       QT Duration        INTERVAL   
      22 2024-02-10     NA <NA>       23    23 QT       QT Duration        INTERVAL   
      23 2024-02-10     NA <NA>       27    27 QT       QT Duration        INTERVAL   
      24 2024-02-10     NA <NA>       15    15 QT       QT Duration        INTERVAL   
      25 2024-02-10     NA <NA>       27    27 QT       QT Duration        INTERVAL   
      26 2024-02-10     NA <NA>        4     4 RR       RR Duration        INTERVAL   
      27 2024-02-10     NA <NA>        8     8 RR       RR Duration        INTERVAL   
      28 2024-02-10     NA <NA>       12    12 RR       RR Duration        INTERVAL   
      29 2024-02-10     NA <NA>       16    16 RR       RR Duration        INTERVAL   
      30 2024-02-10     NA <NA>       20    20 RR       RR Duration        INTERVAL   
      31 2024-02-10     NA <NA>       24    24 RR       RR Duration        INTERVAL   
      32 2024-02-10     NA <NA>       28    28 RR       RR Duration        INTERVAL   
      33 2024-02-10     NA <NA>       24    24 RR       RR Duration        INTERVAL   
      34 2024-02-10     NA <NA>       12    12 RR       RR Duration        INTERVAL   
         ASPID PARAM              PARAMCD   AVAL AVALC            AVALU        BASE
         <int> <fct>              <fct>    <dbl> <chr>            <fct>       <dbl>
       1   117 ECG Interpretation ECGINTP   NA   NORMAL           ""           NA  
       2    25 ECG Interpretation ECGINTP   NA   ABNORMAL         ""           NA  
       3   203 ECG Interpretation ECGINTP   NA   NORMAL           ""           NA  
       4    41 ECG Interpretation ECGINTP   NA   NORMAL           ""           NA  
       5    44 ECG Interpretation ECGINTP   NA   NORMAL           ""           NA  
       6   218 ECG Interpretation ECGINTP   NA   NORMAL           ""           NA  
       7   224 ECG Interpretation ECGINTP   NA   NORMAL           ""           NA  
       8   239 Heart Rate         HR        54.8 54.7791944988704 "beats/min"  54.8
       9   192 Heart Rate         HR        97.3 97.252885859094  "beats/min"  97.3
      10   140 Heart Rate         HR       114.  113.795047185584 "beats/min"  97.3
      11    22 Heart Rate         HR       105.  105.075896906697 "beats/min"  97.3
      12   250 Heart Rate         HR       105.  105.430839207588 "beats/min"  97.3
      13   255 Heart Rate         HR        54.2 54.2280412924157 "beats/min"  97.3
      14    40 Heart Rate         HR        69.7 69.6607701443552 "beats/min"  97.3
      15   255 Heart Rate         HR        54.2 54.2280412924157 "beats/min"  97.3
      16   140 Heart Rate         HR       114.  113.795047185584 "beats/min"  97.3
      17    18 QT Duration        QT       319.  319.461161284364 "msec"      319. 
      18   244 QT Duration        QT       438.  438.110772645421 "msec"      438. 
      19   128 QT Duration        QT       377.  376.709879077223 "msec"      438. 
      20    67 QT Duration        QT       318.  317.572972775368 "msec"      438. 
      21   263 QT Duration        QT       371.  370.753833923234 "msec"      438. 
      22   237 QT Duration        QT       401.  401.010842295293 "msec"      438. 
      23   272 QT Duration        QT       452.  452.046390878411 "msec"      438. 
      24    67 QT Duration        QT       318.  317.572972775368 "msec"      438. 
      25   272 QT Duration        QT       452.  452.046390878411 "msec"      438. 
      26   157 RR Duration        RR       958.  958.255374069909 "msec"      958. 
      27    16 RR Duration        RR       891.  891.091347259949 "msec"      891. 
      28    95 RR Duration        RR      1579.  1579.06560083548 "msec"      891. 
      29   267 RR Duration        RR      1563.  1562.73630963026 "msec"      891. 
      30   212 RR Duration        RR      1211.  1210.73151667578 "msec"      891. 
      31   190 RR Duration        RR       788.  788.020639481387 "msec"      891. 
      32   124 RR Duration        RR       958.  957.893320638949 "msec"      891. 
      33   190 RR Duration        RR       788.  788.020639481387 "msec"      891. 
      34    95 RR Duration        RR      1579.  1579.06560083548 "msec"      891. 
         BASEC            BASETYPE ABLFL     CHG   PCHG DTYPE   ANRLO ANRHI ANRIND
         <chr>            <fct>    <fct>   <dbl>  <dbl> <fct>   <dbl> <dbl> <fct> 
       1 ABNORMAL         LAST     ""      NA     NA    <NA>       NA    NA <NA>  
       2 ABNORMAL         LAST     "Y"     NA     NA    <NA>       NA    NA <NA>  
       3 ABNORMAL         LAST     ""      NA     NA    <NA>       NA    NA <NA>  
       4 ABNORMAL         LAST     ""      NA     NA    <NA>       NA    NA <NA>  
       5 ABNORMAL         LAST     ""      NA     NA    <NA>       NA    NA <NA>  
       6 ABNORMAL         LAST     ""      NA     NA    <NA>       NA    NA <NA>  
       7 ABNORMAL         LAST     ""      NA     NA    <NA>       NA    NA <NA>  
       8 54.7791944988704 LAST     ""      NA     NA    <NA>       40   100 NORMAL
       9 97.252885859094  LAST     "Y"     NA     NA    <NA>       40   100 NORMAL
      10 97.252885859094  LAST     ""      16.5   17.0  <NA>       40   100 HIGH  
      11 97.252885859094  LAST     ""       7.82   8.04 <NA>       40   100 HIGH  
      12 97.252885859094  LAST     ""       8.18   8.41 <NA>       40   100 HIGH  
      13 97.252885859094  LAST     ""     -43.0  -44.2  <NA>       40   100 NORMAL
      14 97.252885859094  LAST     ""     -27.6  -28.4  <NA>       40   100 NORMAL
      15 97.252885859094  LAST     ""     -43.0  -44.2  MINIMUM    40   100 NORMAL
      16 97.252885859094  LAST     ""      16.5   17.0  MAXIMUM    40   100 HIGH  
      17 319.461161284364 LAST     ""      NA     NA    <NA>      200   500 NORMAL
      18 438.110772645421 LAST     "Y"     NA     NA    <NA>      200   500 NORMAL
      19 438.110772645421 LAST     ""     -61.4  -14.0  <NA>      200   500 NORMAL
      20 438.110772645421 LAST     ""    -121.   -27.5  <NA>      200   500 NORMAL
      21 438.110772645421 LAST     ""     -67.4  -15.4  <NA>      200   500 NORMAL
      22 438.110772645421 LAST     ""     -37.1   -8.47 <NA>      200   500 NORMAL
      23 438.110772645421 LAST     ""      13.9    3.18 <NA>      200   500 NORMAL
      24 438.110772645421 LAST     ""    -121.   -27.5  MINIMUM   200   500 NORMAL
      25 438.110772645421 LAST     ""      13.9    3.18 MAXIMUM   200   500 NORMAL
      26 958.255374069909 LAST     ""      NA     NA    <NA>      600  1500 NORMAL
      27 891.091347259949 LAST     "Y"     NA     NA    <NA>      600  1500 NORMAL
      28 891.091347259949 LAST     ""     688.    77.2  <NA>      600  1500 HIGH  
      29 891.091347259949 LAST     ""     672.    75.4  <NA>      600  1500 HIGH  
      30 891.091347259949 LAST     ""     320.    35.9  <NA>      600  1500 NORMAL
      31 891.091347259949 LAST     ""    -103.   -11.6  <NA>      600  1500 NORMAL
      32 891.091347259949 LAST     ""      66.8    7.50 <NA>      600  1500 NORMAL
      33 891.091347259949 LAST     ""    -103.   -11.6  MINIMUM   600  1500 NORMAL
      34 891.091347259949 LAST     ""     688.    77.2  MAXIMUM   600  1500 HIGH  
         BNRIND ADTM                  ADY ATPTN AVISIT                AVISITN ONTRTFL
         <fct>  <dttm>              <int> <int> <fct>                   <int> <fct>  
       1 <NA>   2021-01-23 22:43:53     6     1 SCREENING                  -1 ""     
       2 <NA>   2021-06-04 22:43:53   138     1 BASELINE                    0 ""     
       3 <NA>   2021-09-16 22:43:53   242     1 WEEK 1 DAY 8                1 "Y"    
       4 <NA>   2022-08-17 22:43:53   577     1 WEEK 2 DAY 15               2 "Y"    
       5 <NA>   2023-03-26 22:43:53   798     1 WEEK 3 DAY 22               3 "Y"    
       6 <NA>   2023-04-01 22:43:53   804     1 WEEK 4 DAY 29               4 "Y"    
       7 <NA>   2024-01-14 22:43:53  1092     1 WEEK 5 DAY 36               5 "Y"    
       8 NORMAL 2021-01-23 22:43:53     6     1 SCREENING                  -1 ""     
       9 NORMAL 2021-06-04 22:43:53   138     1 BASELINE                    0 ""     
      10 NORMAL 2021-09-16 22:43:53   242     1 WEEK 1 DAY 8                1 "Y"    
      11 NORMAL 2022-08-17 22:43:53   577     1 WEEK 2 DAY 15               2 "Y"    
      12 NORMAL 2023-03-26 22:43:53   798     1 WEEK 3 DAY 22               3 "Y"    
      13 NORMAL 2023-04-01 22:43:53   804     1 WEEK 4 DAY 29               4 "Y"    
      14 NORMAL 2024-01-14 22:43:53  1092     1 WEEK 5 DAY 36               5 "Y"    
      15 NORMAL 2023-04-01 22:43:53   804     1 POST-BASELINE MINIMUM       4 "Y"    
      16 NORMAL 2021-09-16 22:43:53   242     1 POST-BASELINE MAXIMUM       1 "Y"    
      17 NORMAL 2021-01-23 22:43:53     6     1 SCREENING                  -1 ""     
      18 NORMAL 2021-06-04 22:43:53   138     1 BASELINE                    0 ""     
      19 NORMAL 2021-09-16 22:43:53   242     1 WEEK 1 DAY 8                1 "Y"    
      20 NORMAL 2022-08-17 22:43:53   577     1 WEEK 2 DAY 15               2 "Y"    
      21 NORMAL 2023-03-26 22:43:53   798     1 WEEK 3 DAY 22               3 "Y"    
      22 NORMAL 2023-04-01 22:43:53   804     1 WEEK 4 DAY 29               4 "Y"    
      23 NORMAL 2024-01-14 22:43:53  1092     1 WEEK 5 DAY 36               5 "Y"    
      24 NORMAL 2022-08-17 22:43:53   577     1 POST-BASELINE MINIMUM       2 "Y"    
      25 NORMAL 2024-01-14 22:43:53  1092     1 POST-BASELINE MAXIMUM       5 "Y"    
      26 NORMAL 2021-01-23 22:43:53     6     1 SCREENING                  -1 ""     
      27 NORMAL 2021-06-04 22:43:53   138     1 BASELINE                    0 ""     
      28 NORMAL 2021-09-16 22:43:53   242     1 WEEK 1 DAY 8                1 "Y"    
      29 NORMAL 2022-08-17 22:43:53   577     1 WEEK 2 DAY 15               2 "Y"    
      30 NORMAL 2023-03-26 22:43:53   798     1 WEEK 3 DAY 22               3 "Y"    
      31 NORMAL 2023-04-01 22:43:53   804     1 WEEK 4 DAY 29               4 "Y"    
      32 NORMAL 2024-01-14 22:43:53  1092     1 WEEK 5 DAY 36               5 "Y"    
      33 NORMAL 2023-04-01 22:43:53   804     1 POST-BASELINE MINIMUM       4 "Y"    
      34 NORMAL 2021-09-16 22:43:53   242     1 POST-BASELINE MAXIMUM       1 "Y"    
         WORS01FL WORS02FL ANL01FL ANL03FL ANL04FL
         <fct>    <fct>    <fct>   <fct>   <fct>  
       1 ""       ""       ""      ""      ""     
       2 ""       ""       "Y"     ""      ""     
       3 "Y"      "Y"      "Y"     ""      ""     
       4 "Y"      ""       "Y"     ""      ""     
       5 "Y"      ""       "Y"     ""      ""     
       6 "Y"      ""       "Y"     ""      ""     
       7 "Y"      ""       "Y"     ""      ""     
       8 ""       ""       ""      ""      ""     
       9 ""       ""       "Y"     "Y"     "Y"    
      10 "Y"      ""       "Y"     ""      ""     
      11 "Y"      ""       "Y"     ""      ""     
      12 "Y"      ""       "Y"     ""      ""     
      13 "Y"      "Y"      "Y"     ""      ""     
      14 "Y"      ""       "Y"     ""      ""     
      15 ""       ""       ""      "Y"     ""     
      16 ""       ""       ""      ""      "Y"    
      17 ""       ""       ""      ""      ""     
      18 ""       ""       "Y"     "Y"     "Y"    
      19 "Y"      ""       "Y"     ""      ""     
      20 "Y"      "Y"      "Y"     ""      ""     
      21 "Y"      ""       "Y"     ""      ""     
      22 "Y"      ""       "Y"     ""      ""     
      23 "Y"      ""       "Y"     ""      ""     
      24 ""       ""       ""      "Y"     ""     
      25 ""       ""       ""      ""      "Y"    
      26 ""       ""       ""      ""      ""     
      27 ""       ""       "Y"     "Y"     "Y"    
      28 "Y"      ""       "Y"     ""      ""     
      29 "Y"      ""       "Y"     ""      ""     
      30 "Y"      ""       "Y"     ""      ""     
      31 "Y"      "Y"      "Y"     ""      ""     
      32 "Y"      ""       "Y"     ""      ""     
      33 ""       ""       ""      "Y"     ""     
      34 ""       ""       ""      ""      "Y"    

---

    Code
      rand_rows
    Output
      # A tibble: 10 x 88
         STUDYID USUBJID             SUBJID SITEID   AGE AGEU  SEX  
         <chr>   <chr>               <chr>  <chr>  <int> <fct> <fct>
       1 AB12345 AB12345-BRA-1-id-9  id-9   BRA-1     35 YEARS F    
       2 AB12345 AB12345-BRA-1-id-9  id-9   BRA-1     35 YEARS F    
       3 AB12345 AB12345-USA-13-id-3 id-3   USA-13    35 YEARS F    
       4 AB12345 AB12345-BRA-1-id-9  id-9   BRA-1     35 YEARS F    
       5 AB12345 AB12345-RUS-1-id-4  id-4   RUS-1     36 YEARS M    
       6 AB12345 AB12345-CHN-3-id-10 id-10  CHN-3     35 YEARS M    
       7 AB12345 AB12345-USA-13-id-3 id-3   USA-13    35 YEARS F    
       8 AB12345 AB12345-CHN-3-id-10 id-10  CHN-3     35 YEARS M    
       9 AB12345 AB12345-CHN-3-id-5  id-5   CHN-3     36 YEARS F    
      10 AB12345 AB12345-RUS-1-id-4  id-4   RUS-1     36 YEARS M    
         RACE                             ETHNIC                 COUNTRY DTHFL
         <fct>                            <fct>                  <fct>   <fct>
       1 BLACK OR AFRICAN AMERICAN        UNKNOWN                BRA     N    
       2 BLACK OR AFRICAN AMERICAN        UNKNOWN                BRA     N    
       3 AMERICAN INDIAN OR ALASKA NATIVE NOT HISPANIC OR LATINO USA     N    
       4 BLACK OR AFRICAN AMERICAN        UNKNOWN                BRA     N    
       5 BLACK OR AFRICAN AMERICAN        NOT HISPANIC OR LATINO RUS     N    
       6 ASIAN                            NOT HISPANIC OR LATINO CHN     N    
       7 AMERICAN INDIAN OR ALASKA NATIVE NOT HISPANIC OR LATINO USA     N    
       8 ASIAN                            NOT HISPANIC OR LATINO CHN     N    
       9 ASIAN                            NOT HISPANIC OR LATINO CHN     N    
      10 BLACK OR AFRICAN AMERICAN        NOT HISPANIC OR LATINO RUS     N    
         INVID         INVNAM         ARM            ARMCD ACTARM         ACTARMCD
         <chr>         <chr>          <fct>          <fct> <fct>          <fct>   
       1 INV ID BRA-1  Dr. BRA-1 Doe  C: Combination ARM C C: Combination ARM C   
       2 INV ID BRA-1  Dr. BRA-1 Doe  C: Combination ARM C C: Combination ARM C   
       3 INV ID USA-13 Dr. USA-13 Doe A: Drug X      ARM A A: Drug X      ARM A   
       4 INV ID BRA-1  Dr. BRA-1 Doe  C: Combination ARM C C: Combination ARM C   
       5 INV ID RUS-1  Dr. RUS-1 Doe  B: Placebo     ARM B B: Placebo     ARM B   
       6 INV ID CHN-3  Dr. CHN-3 Doe  B: Placebo     ARM B B: Placebo     ARM B   
       7 INV ID USA-13 Dr. USA-13 Doe A: Drug X      ARM A A: Drug X      ARM A   
       8 INV ID CHN-3  Dr. CHN-3 Doe  B: Placebo     ARM B B: Placebo     ARM B   
       9 INV ID CHN-3  Dr. CHN-3 Doe  A: Drug X      ARM A A: Drug X      ARM A   
      10 INV ID RUS-1  Dr. RUS-1 Doe  B: Placebo     ARM B B: Placebo     ARM B   
         TRT01P         TRT01A         TRT02P     TRT02A         REGION1       STRATA1
         <fct>          <fct>          <fct>      <fct>          <fct>         <fct>  
       1 C: Combination C: Combination A: Drug X  C: Combination South America A      
       2 C: Combination C: Combination A: Drug X  C: Combination South America A      
       3 A: Drug X      A: Drug X      B: Placebo A: Drug X      North America C      
       4 C: Combination C: Combination A: Drug X  C: Combination South America A      
       5 B: Placebo     B: Placebo     A: Drug X  A: Drug X      Eurasia       A      
       6 B: Placebo     B: Placebo     A: Drug X  A: Drug X      Asia          A      
       7 A: Drug X      A: Drug X      B: Placebo A: Drug X      North America C      
       8 B: Placebo     B: Placebo     A: Drug X  A: Drug X      Asia          A      
       9 A: Drug X      A: Drug X      A: Drug X  C: Combination Asia          A      
      10 B: Placebo     B: Placebo     A: Drug X  A: Drug X      Eurasia       A      
         STRATA2 BMRKR1 BMRKR2 ITTFL SAFFL BMEASIFL BEP01FL AEWITHFL RANDDT    
         <fct>    <dbl> <fct>  <fct> <fct> <fct>    <fct>   <fct>    <date>    
       1 S1        6.92 HIGH   Y     Y     Y        N       N        2021-01-17
       2 S1        6.92 HIGH   Y     Y     Y        N       N        2021-01-17
       3 S1        7.25 LOW    Y     Y     Y        N       N        2019-10-16
       4 S1        6.92 HIGH   Y     Y     Y        N       N        2021-01-17
       5 S1        9.95 MEDIUM Y     Y     Y        N       N        2020-08-27
       6 S1        1.78 LOW    Y     Y     N        Y       N        2019-03-24
       7 S1        7.25 LOW    Y     Y     Y        N       N        2019-10-16
       8 S1        1.78 LOW    Y     Y     N        Y       N        2019-03-24
       9 S2        2.62 LOW    Y     Y     Y        N       N        2020-06-24
      10 S1        9.95 MEDIUM Y     Y     Y        N       N        2020-08-27
         TRTSDTM             TRTEDTM             TRT01SDTM          
         <dttm>              <dttm>              <dttm>             
       1 2021-01-17 22:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       2 2021-01-17 22:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       3 2019-10-17 17:56:02 2022-10-17 11:56:02 2019-10-17 17:56:02
       4 2021-01-17 22:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       5 2020-08-28 20:42:09 2022-01-23 08:46:48 2020-08-28 20:42:09
       6 2019-03-28 12:07:16 2022-03-28 06:07:16 2019-03-28 12:07:16
       7 2019-10-17 17:56:02 2022-10-17 11:56:02 2019-10-17 17:56:02
       8 2019-03-28 12:07:16 2022-03-28 06:07:16 2019-03-28 12:07:16
       9 2020-06-27 04:48:00 2023-06-27 22:48:00 2020-06-27 04:48:00
      10 2020-08-28 20:42:09 2022-01-23 08:46:48 2020-08-28 20:42:09
         TRT01EDTM           TRT02SDTM           TRT02EDTM          
         <dttm>              <dttm>              <dttm>             
       1 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53
       2 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53
       3 2021-10-17 05:56:02 2021-10-17 05:56:02 2022-10-17 11:56:02
       4 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53
       5 2021-01-23 02:46:48 2021-01-23 02:46:48 2022-01-23 08:46:48
       6 2021-03-28 00:07:16 2021-03-28 00:07:16 2022-03-28 06:07:16
       7 2021-10-17 05:56:02 2021-10-17 05:56:02 2022-10-17 11:56:02
       8 2021-03-28 00:07:16 2021-03-28 00:07:16 2022-03-28 06:07:16
       9 2022-06-27 16:48:00 2022-06-27 16:48:00 2023-06-27 22:48:00
      10 2021-01-23 02:46:48 2021-01-23 02:46:48 2022-01-23 08:46:48
         AP01SDTM            AP01EDTM            AP02SDTM           
         <dttm>              <dttm>              <dttm>             
       1 2021-01-17 22:43:53 2023-01-18 10:43:53 2023-01-18 10:43:53
       2 2021-01-17 22:43:53 2023-01-18 10:43:53 2023-01-18 10:43:53
       3 2019-10-17 17:56:02 2021-10-17 05:56:02 2021-10-17 05:56:02
       4 2021-01-17 22:43:53 2023-01-18 10:43:53 2023-01-18 10:43:53
       5 2020-08-28 20:42:09 2021-01-23 02:46:48 2021-01-23 02:46:48
       6 2019-03-28 12:07:16 2021-03-28 00:07:16 2021-03-28 00:07:16
       7 2019-10-17 17:56:02 2021-10-17 05:56:02 2021-10-17 05:56:02
       8 2019-03-28 12:07:16 2021-03-28 00:07:16 2021-03-28 00:07:16
       9 2020-06-27 04:48:00 2022-06-27 16:48:00 2022-06-27 16:48:00
      10 2020-08-28 20:42:09 2021-01-23 02:46:48 2021-01-23 02:46:48
         AP02EDTM            EOSSTT       EOTSTT       EOSDT      EOSDY DCSREAS      
         <dttm>              <fct>        <fct>        <date>     <int> <fct>        
       1 2024-01-18 16:43:53 COMPLETED    COMPLETED    2024-01-18  1096 <NA>         
       2 2024-01-18 16:43:53 COMPLETED    COMPLETED    2024-01-18  1096 <NA>         
       3 2022-10-17 11:56:02 COMPLETED    COMPLETED    2022-10-17  1096 <NA>         
       4 2024-01-18 16:43:53 COMPLETED    COMPLETED    2024-01-18  1096 <NA>         
       5 2022-01-23 08:46:48 DISCONTINUED DISCONTINUED 2022-01-23   513 ADVERSE EVENT
       6 2022-03-28 06:07:16 COMPLETED    COMPLETED    2022-03-28  1096 <NA>         
       7 2022-10-17 11:56:02 COMPLETED    COMPLETED    2022-10-17  1096 <NA>         
       8 2022-03-28 06:07:16 COMPLETED    COMPLETED    2022-03-28  1096 <NA>         
       9 2023-06-27 22:48:00 COMPLETED    COMPLETED    2023-06-27  1096 <NA>         
      10 2022-01-23 08:46:48 DISCONTINUED DISCONTINUED 2022-01-23   513 ADVERSE EVENT
         DTHDT  DTHCAUS DTHCAT LDDTHELD LDDTHGR1 LSTALVDT   DTHADY ADTHAUT  ASEQ EGSEQ
         <date> <fct>   <fct>     <int> <fct>    <date>      <int> <fct>   <int> <int>
       1 NA     <NA>    <NA>         NA <NA>     2024-02-10     NA <NA>       24    24
       2 NA     <NA>    <NA>         NA <NA>     2024-02-10     NA <NA>       10    10
       3 NA     <NA>    <NA>         NA <NA>     2022-10-30     NA <NA>       18    18
       4 NA     <NA>    <NA>         NA <NA>     2024-02-10     NA <NA>       12    12
       5 NA     <NA>    <NA>         NA <NA>     2022-02-12     NA <NA>        2     2
       6 NA     <NA>    <NA>         NA <NA>     2022-04-14     NA <NA>       20    20
       7 NA     <NA>    <NA>         NA <NA>     2022-10-30     NA <NA>       16    16
       8 NA     <NA>    <NA>         NA <NA>     2022-04-14     NA <NA>       19    19
       9 NA     <NA>    <NA>         NA <NA>     2023-07-10     NA <NA>       17    17
      10 NA     <NA>    <NA>         NA <NA>     2022-02-12     NA <NA>       28    28
         EGTESTCD EGTEST             EGCAT       ASPID PARAM              PARAMCD
         <fct>    <fct>              <fct>       <int> <fct>              <fct>  
       1 RR       RR Duration        INTERVAL      190 RR Duration        RR     
       2 HR       Heart Rate         MEASUREMENT   140 Heart Rate         HR     
       3 HR       Heart Rate         MEASUREMENT    23 Heart Rate         HR     
       4 RR       RR Duration        INTERVAL       95 RR Duration        RR     
       5 HR       Heart Rate         MEASUREMENT    24 Heart Rate         HR     
       6 RR       RR Duration        INTERVAL      161 RR Duration        RR     
       7 RR       RR Duration        INTERVAL       48 RR Duration        RR     
       8 QT       QT Duration        INTERVAL       97 QT Duration        QT     
       9 ECGINTP  ECG Interpretation FINDING        21 ECG Interpretation ECGINTP
      10 RR       RR Duration        INTERVAL      159 RR Duration        RR     
           AVAL AVALC            AVALU         BASE BASEC            BASETYPE ABLFL
          <dbl> <chr>            <fct>        <dbl> <chr>            <fct>    <fct>
       1  788.  788.020639481387 "msec"       891.  891.091347259949 LAST     ""   
       2  114.  113.795047185584 "beats/min"   97.3 97.252885859094  LAST     ""   
       3   95.7 95.6555041235539 "beats/min"  106.  105.693256320495 LAST     ""   
       4 1579.  1579.06560083548 "msec"       891.  891.091347259949 LAST     ""   
       5   79.4 79.3794352014842 "beats/min"   79.4 79.3794352014842 LAST     ""   
       6 1339.  1338.50899001421 "msec"       952.  951.869695604069 LAST     ""   
       7 1387.  1387.43173396054 "msec"       940.  939.764773148856 LAST     ""   
       8  393.  392.510037737245 "msec"       334.  333.547640374641 LAST     ""   
       9   NA   NORMAL           ""            NA   NORMAL           LAST     ""   
      10 1435.  1434.52122635505 "msec"      1051.  1051.31961129791 LAST     ""   
            CHG   PCHG DTYPE   ANRLO ANRHI ANRIND BNRIND ADTM                  ADY
          <dbl>  <dbl> <fct>   <dbl> <dbl> <fct>  <fct>  <dttm>              <int>
       1 -103.  -11.6  <NA>      600  1500 NORMAL NORMAL 2023-04-01 22:43:53   804
       2   16.5  17.0  MAXIMUM    40   100 HIGH   NORMAL 2021-09-16 22:43:53   242
       3  -10.0  -9.50 <NA>       40   100 NORMAL HIGH   2021-11-13 17:56:02   758
       4  688.   77.2  <NA>      600  1500 HIGH   NORMAL 2021-09-16 22:43:53   242
       5   NA    NA    <NA>       40   100 NORMAL NORMAL 2021-06-25 20:42:09   301
       6  387.   40.6  MAXIMUM   600  1500 NORMAL NORMAL 2021-07-14 12:07:16   839
       7  448.   47.6  <NA>      600  1500 NORMAL NORMAL 2021-09-05 17:56:02   689
       8   59.0  17.7  <NA>      200   500 NORMAL NORMAL 2021-07-14 12:07:16   839
       9   NA    NA    <NA>       NA    NA <NA>   <NA>   2022-07-06 04:48:00   739
      10  383.   36.4  <NA>      600  1500 NORMAL NORMAL 2021-11-29 20:42:09   458
         ATPTN AVISIT                AVISITN ONTRTFL WORS01FL WORS02FL ANL01FL ANL03FL
         <int> <fct>                   <int> <fct>   <fct>    <fct>    <fct>   <fct>  
       1     1 WEEK 4 DAY 29               4 "Y"     "Y"      "Y"      "Y"     ""     
       2     1 POST-BASELINE MAXIMUM       1 "Y"     ""       ""       ""      ""     
       3     1 WEEK 3 DAY 22               3 "Y"     "Y"      ""       "Y"     ""     
       4     1 WEEK 1 DAY 8                1 "Y"     "Y"      ""       "Y"     ""     
       5     1 SCREENING                  -1 ""      ""       ""       ""      ""     
       6     1 POST-BASELINE MAXIMUM       3 "Y"     ""       ""       ""      ""     
       7     1 WEEK 2 DAY 15               2 "Y"     "Y"      ""       "Y"     ""     
       8     1 WEEK 3 DAY 22               3 "Y"     "Y"      ""       "Y"     ""     
       9     1 WEEK 3 DAY 22               3 "Y"     "Y"      ""       "Y"     ""     
      10     1 WEEK 5 DAY 36               5 "Y"     "Y"      ""       "Y"     ""     
         ANL04FL
         <fct>  
       1 ""     
       2 "Y"    
       3 ""     
       4 ""     
       5 ""     
       6 "Y"    
       7 ""     
       8 ""     
       9 ""     
      10 ""     

# radex produces expected values

    Code
      first_pt_rows
    Output
      # A tibble: 16 x 79
         STUDYID USUBJID            SUBJID SITEID   AGE AGEU  SEX  
         <chr>   <chr>              <chr>  <chr>  <int> <fct> <fct>
       1 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       2 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       3 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       4 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       5 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       6 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       7 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       8 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       9 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      10 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      11 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      12 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      13 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      14 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      15 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      16 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
         RACE                      ETHNIC  COUNTRY DTHFL INVID        INVNAM       
         <fct>                     <fct>   <fct>   <fct> <chr>        <chr>        
       1 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       2 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       3 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       4 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       5 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       6 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       7 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       8 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       9 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      10 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      11 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      12 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      13 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      14 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      15 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      16 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
         ARM            ARMCD ACTARM         ACTARMCD TRT01P         TRT01A        
         <fct>          <fct> <fct>          <fct>    <fct>          <fct>         
       1 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       2 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       3 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       4 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       5 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       6 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       7 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       8 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       9 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      10 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      11 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      12 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      13 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      14 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      15 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      16 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
         TRT02P    TRT02A         REGION1       STRATA1 STRATA2 BMRKR1 BMRKR2 ITTFL
         <fct>     <fct>          <fct>         <fct>   <fct>    <dbl> <fct>  <fct>
       1 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       2 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       3 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       4 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       5 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       6 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       7 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       8 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       9 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      10 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      11 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      12 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      13 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      14 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      15 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      16 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
         SAFFL BMEASIFL BEP01FL AEWITHFL RANDDT     TRTSDTM            
         <fct> <fct>    <fct>   <fct>    <date>     <dttm>             
       1 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       2 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       3 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       4 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       5 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       6 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       7 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       8 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       9 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      10 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      11 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      12 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      13 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      14 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      15 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      16 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
         TRTEDTM             TRT01SDTM           TRT01EDTM          
         <dttm>              <dttm>              <dttm>             
       1 2021-02-22 23:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       2 2021-02-22 23:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       3 2021-02-22 23:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       4 2021-02-22 23:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       5 2021-02-22 23:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       6 2021-02-22 23:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       7 2021-02-22 23:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       8 2021-02-22 23:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       9 2021-02-22 23:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      10 2021-02-22 23:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      11 2021-02-22 23:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      12 2021-02-22 23:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      13 2021-02-22 23:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      14 2021-02-22 23:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      15 2021-02-22 23:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      16 2021-02-22 23:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
         TRT02SDTM           TRT02EDTM           AP01SDTM           
         <dttm>              <dttm>              <dttm>             
       1 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       2 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       3 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       4 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       5 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       6 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       7 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       8 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       9 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      10 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      11 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      12 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      13 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      14 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      15 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      16 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
         AP01EDTM            AP02SDTM            AP02EDTM            EOSSTT   
         <dttm>              <dttm>              <dttm>              <fct>    
       1 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       2 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       3 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       4 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       5 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       6 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       7 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       8 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       9 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      10 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      11 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      12 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      13 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      14 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      15 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      16 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
         EOTSTT    EOSDT      EOSDY DCSREAS DTHDT  DTHCAUS DTHCAT LDDTHELD LDDTHGR1
         <fct>     <date>     <int> <fct>   <date> <fct>   <fct>     <int> <fct>   
       1 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       2 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       3 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       4 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       5 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       6 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       7 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       8 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       9 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      10 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      11 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      12 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      13 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      14 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      15 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      16 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
         LSTALVDT   DTHADY ADTHAUT  ASEQ EXSEQ
         <date>      <int> <fct>   <int> <int>
       1 2024-02-10     NA <NA>        5     5
       2 2024-02-10     NA <NA>        6     6
       3 2024-02-10     NA <NA>        7     7
       4 2024-02-10     NA <NA>        8     8
       5 2024-02-10     NA <NA>       10    10
       6 2024-02-10     NA <NA>       11    11
       7 2024-02-10     NA <NA>       13    13
       8 2024-02-10     NA <NA>        1     1
       9 2024-02-10     NA <NA>        2     2
      10 2024-02-10     NA <NA>        3     3
      11 2024-02-10     NA <NA>        9     9
      12 2024-02-10     NA <NA>       12    12
      13 2024-02-10     NA <NA>       14    14
      14 2024-02-10     NA <NA>       16    16
      15 2024-02-10     NA <NA>        4     4
      16 2024-02-10     NA <NA>       15    15
         PARAM                                                        PARAMCD
         <fct>                                                        <fct>  
       1 Dose administered during constant dosing interval            DOSE   
       2 Dose administered during constant dosing interval            DOSE   
       3 Dose administered during constant dosing interval            DOSE   
       4 Dose administered during constant dosing interval            DOSE   
       5 Dose administered during constant dosing interval            DOSE   
       6 Dose administered during constant dosing interval            DOSE   
       7 Dose administered during constant dosing interval            DOSE   
       8 Number of doses administered during constant dosing interval NDOSE  
       9 Number of doses administered during constant dosing interval NDOSE  
      10 Number of doses administered during constant dosing interval NDOSE  
      11 Number of doses administered during constant dosing interval NDOSE  
      12 Number of doses administered during constant dosing interval NDOSE  
      13 Number of doses administered during constant dosing interval NDOSE  
      14 Number of doses administered during constant dosing interval NDOSE  
      15 Total dose administered                                      TDOSE  
      16 Total number of doses administered                           TNDOSE 
         AVISIT        AVISITN  AVAL AVALU PARCAT1    PARCAT2 ASTDTM             
         <fct>           <int> <dbl> <fct> <fct>      <fct>   <dttm>             
       1 WEEK 1 DAY 8        1  1200 "mg"  INDIVIDUAL Drug A  2021-01-25 22:43:53
       2 WEEK 3 DAY 22       3   960 "mg"  INDIVIDUAL Drug A  2021-02-08 22:43:53
       3 WEEK 4 DAY 29       4   960 "mg"  INDIVIDUAL Drug A  2021-02-15 22:43:53
       4 BASELINE            0   960 "mg"  INDIVIDUAL Drug A  2021-01-18 22:43:53
       5 WEEK 2 DAY 15       2  1200 "mg"  INDIVIDUAL Drug A  2021-02-01 22:43:53
       6 SCREENING          -1   960 "mg"  INDIVIDUAL Drug A  2021-01-16 22:43:53
       7 WEEK 5 DAY 36       5  1200 "mg"  INDIVIDUAL Drug A  2021-02-22 22:43:53
       8 WEEK 4 DAY 29       4     1 " "   INDIVIDUAL Drug A  2021-02-15 22:43:53
       9 WEEK 5 DAY 36       5     1 " "   INDIVIDUAL Drug A  2021-02-22 22:43:53
      10 WEEK 3 DAY 22       3     1 " "   INDIVIDUAL Drug A  2021-02-08 22:43:53
      11 BASELINE            0     1 " "   INDIVIDUAL Drug A  2021-01-18 22:43:53
      12 SCREENING          -1     1 " "   INDIVIDUAL Drug A  2021-01-16 22:43:53
      13 WEEK 1 DAY 8        1     1 " "   INDIVIDUAL Drug A  2021-01-25 22:43:53
      14 WEEK 2 DAY 15       2     1 " "   INDIVIDUAL Drug A  2021-02-01 22:43:53
      15 <NA>           999000  7440 "mg"  OVERALL    Drug A  NA                 
      16 <NA>           999000     7 " "   OVERALL    Drug A  NA                 
         AENDTM              ASTDY AENDY EXDOSFRQ EXROUTE        VISIT         VISITDY
         <dttm>              <int> <int> <chr>    <chr>          <chr>           <int>
       1 2021-01-25 23:43:53     8     8 "ONCE"   "INTRAVENOUS"  WEEK 1 DAY 8        8
       2 2021-02-08 23:43:53    22    22 "ONCE"   "SUBCUTANEOUS" WEEK 3 DAY 22      22
       3 2021-02-15 23:43:53    29    29 "ONCE"   "INTRAVENOUS"  WEEK 4 DAY 29      29
       4 2021-01-18 23:43:53     1     1 "ONCE"   "INTRAVENOUS"  BASELINE            1
       5 2021-02-01 23:43:53    15    15 "ONCE"   "INTRAVENOUS"  WEEK 2 DAY 15      15
       6 2021-01-16 23:43:53    -1    -1 "ONCE"   "INTRAVENOUS"  SCREENING          -1
       7 2021-02-22 23:43:53    36    36 "ONCE"   "INTRAVENOUS"  WEEK 5 DAY 36      36
       8 2021-02-15 23:43:53    29    29 "ONCE"   "INTRAVENOUS"  WEEK 4 DAY 29      29
       9 2021-02-22 23:43:53    36    36 "ONCE"   "INTRAVENOUS"  WEEK 5 DAY 36      36
      10 2021-02-08 23:43:53    22    22 "ONCE"   "INTRAVENOUS"  WEEK 3 DAY 22      22
      11 2021-01-18 23:43:53     1     1 "ONCE"   "INTRAVENOUS"  BASELINE            1
      12 2021-01-16 23:43:53    -1    -1 "ONCE"   "INTRAVENOUS"  SCREENING          -1
      13 2021-01-25 23:43:53     8     8 "ONCE"   "SUBCUTANEOUS" WEEK 1 DAY 8        8
      14 2021-02-01 23:43:53    15    15 "ONCE"   "INTRAVENOUS"  WEEK 2 DAY 15      15
      15 NA                     NA    NA ""       ""             <NA>               NA
      16 NA                     NA    NA ""       ""             <NA>               NA
         EXSTDTC             EXENDTC             EXSTDY EXENDY TRTSDT     TRTEDT    
         <dttm>              <dttm>               <int>  <int> <date>     <date>    
       1 2021-01-25 22:43:53 2021-01-25 23:43:53      8      8 2021-01-17 2021-02-22
       2 2021-02-08 22:43:53 2021-02-08 23:43:53     22     22 2021-01-17 2021-02-22
       3 2021-02-15 22:43:53 2021-02-15 23:43:53     29     29 2021-01-17 2021-02-22
       4 2021-01-18 22:43:53 2021-01-18 23:43:53      1      1 2021-01-17 2021-02-22
       5 2021-02-01 22:43:53 2021-02-01 23:43:53     15     15 2021-01-17 2021-02-22
       6 2021-01-16 22:43:53 2021-01-16 23:43:53     -1     -1 2021-01-17 2021-02-22
       7 2021-02-22 22:43:53 2021-02-22 23:43:53     36     36 2021-01-17 2021-02-22
       8 2021-02-15 22:43:53 2021-02-15 23:43:53     29     29 2021-01-17 2021-02-22
       9 2021-02-22 22:43:53 2021-02-22 23:43:53     36     36 2021-01-17 2021-02-22
      10 2021-02-08 22:43:53 2021-02-08 23:43:53     22     22 2021-01-17 2021-02-22
      11 2021-01-18 22:43:53 2021-01-18 23:43:53      1      1 2021-01-17 2021-02-22
      12 2021-01-16 22:43:53 2021-01-16 23:43:53     -1     -1 2021-01-17 2021-02-22
      13 2021-01-25 22:43:53 2021-01-25 23:43:53      8      8 2021-01-17 2021-02-22
      14 2021-02-01 22:43:53 2021-02-01 23:43:53     15     15 2021-01-17 2021-02-22
      15 NA                  NA                      NA     NA 2021-01-17 2021-02-22
      16 NA                  NA                      NA     NA 2021-01-17 2021-02-22

---

    Code
      rand_rows
    Output
      # A tibble: 10 x 79
         STUDYID USUBJID             SUBJID SITEID   AGE AGEU  SEX  
         <chr>   <chr>               <chr>  <chr>  <int> <fct> <fct>
       1 AB12345 AB12345-RUS-1-id-4  id-4   RUS-1     36 YEARS M    
       2 AB12345 AB12345-USA-13-id-3 id-3   USA-13    35 YEARS F    
       3 AB12345 AB12345-BRA-9-id-8  id-8   BRA-9     31 YEARS F    
       4 AB12345 AB12345-CHN-11-id-1 id-1   CHN-11    35 YEARS F    
       5 AB12345 AB12345-RUS-1-id-4  id-4   RUS-1     36 YEARS M    
       6 AB12345 AB12345-CHN-11-id-1 id-1   CHN-11    35 YEARS F    
       7 AB12345 AB12345-USA-13-id-3 id-3   USA-13    35 YEARS F    
       8 AB12345 AB12345-CHN-3-id-5  id-5   CHN-3     36 YEARS F    
       9 AB12345 AB12345-BRA-9-id-8  id-8   BRA-9     31 YEARS F    
      10 AB12345 AB12345-JPN-4-id-7  id-7   JPN-4     30 YEARS F    
         RACE                             ETHNIC                 COUNTRY DTHFL
         <fct>                            <fct>                  <fct>   <fct>
       1 BLACK OR AFRICAN AMERICAN        NOT HISPANIC OR LATINO RUS     N    
       2 AMERICAN INDIAN OR ALASKA NATIVE NOT HISPANIC OR LATINO USA     N    
       3 ASIAN                            NOT HISPANIC OR LATINO BRA     Y    
       4 WHITE                            NOT HISPANIC OR LATINO CHN     Y    
       5 BLACK OR AFRICAN AMERICAN        NOT HISPANIC OR LATINO RUS     N    
       6 WHITE                            NOT HISPANIC OR LATINO CHN     Y    
       7 AMERICAN INDIAN OR ALASKA NATIVE NOT HISPANIC OR LATINO USA     N    
       8 ASIAN                            NOT HISPANIC OR LATINO CHN     N    
       9 ASIAN                            NOT HISPANIC OR LATINO BRA     Y    
      10 ASIAN                            NOT HISPANIC OR LATINO JPN     N    
         INVID         INVNAM         ARM            ARMCD ACTARM         ACTARMCD
         <chr>         <chr>          <fct>          <fct> <fct>          <fct>   
       1 INV ID RUS-1  Dr. RUS-1 Doe  B: Placebo     ARM B B: Placebo     ARM B   
       2 INV ID USA-13 Dr. USA-13 Doe A: Drug X      ARM A A: Drug X      ARM A   
       3 INV ID BRA-9  Dr. BRA-9 Doe  A: Drug X      ARM A A: Drug X      ARM A   
       4 INV ID CHN-11 Dr. CHN-11 Doe C: Combination ARM C C: Combination ARM C   
       5 INV ID RUS-1  Dr. RUS-1 Doe  B: Placebo     ARM B B: Placebo     ARM B   
       6 INV ID CHN-11 Dr. CHN-11 Doe C: Combination ARM C C: Combination ARM C   
       7 INV ID USA-13 Dr. USA-13 Doe A: Drug X      ARM A A: Drug X      ARM A   
       8 INV ID CHN-3  Dr. CHN-3 Doe  A: Drug X      ARM A A: Drug X      ARM A   
       9 INV ID BRA-9  Dr. BRA-9 Doe  A: Drug X      ARM A A: Drug X      ARM A   
      10 INV ID JPN-4  Dr. JPN-4 Doe  A: Drug X      ARM A A: Drug X      ARM A   
         TRT01P         TRT01A         TRT02P         TRT02A         REGION1      
         <fct>          <fct>          <fct>          <fct>          <fct>        
       1 B: Placebo     B: Placebo     A: Drug X      A: Drug X      Eurasia      
       2 A: Drug X      A: Drug X      B: Placebo     A: Drug X      North America
       3 A: Drug X      A: Drug X      A: Drug X      A: Drug X      South America
       4 C: Combination C: Combination B: Placebo     B: Placebo     Asia         
       5 B: Placebo     B: Placebo     A: Drug X      A: Drug X      Eurasia      
       6 C: Combination C: Combination B: Placebo     B: Placebo     Asia         
       7 A: Drug X      A: Drug X      B: Placebo     A: Drug X      North America
       8 A: Drug X      A: Drug X      A: Drug X      C: Combination Asia         
       9 A: Drug X      A: Drug X      A: Drug X      A: Drug X      South America
      10 A: Drug X      A: Drug X      C: Combination B: Placebo     Asia         
         STRATA1 STRATA2 BMRKR1 BMRKR2 ITTFL SAFFL BMEASIFL BEP01FL AEWITHFL
         <fct>   <fct>    <dbl> <fct>  <fct> <fct> <fct>    <fct>   <fct>   
       1 A       S1        9.95 MEDIUM Y     Y     Y        N       N       
       2 C       S1        7.25 LOW    Y     Y     Y        N       N       
       3 B       S2       11.3  MEDIUM Y     Y     Y        Y       N       
       4 B       S1        8.93 LOW    Y     Y     N        N       N       
       5 A       S1        9.95 MEDIUM Y     Y     Y        N       N       
       6 B       S1        8.93 LOW    Y     Y     N        N       N       
       7 C       S1        7.25 LOW    Y     Y     Y        N       N       
       8 A       S2        2.62 LOW    Y     Y     Y        N       N       
       9 B       S2       11.3  MEDIUM Y     Y     Y        Y       N       
      10 B       S1        7.46 MEDIUM Y     Y     Y        N       N       
         RANDDT     TRTSDTM             TRTEDTM             TRT01SDTM          
         <date>     <dttm>              <dttm>              <dttm>             
       1 2020-08-27 2020-08-28 20:42:09 2020-10-03 21:42:09 2020-08-28 20:42:09
       2 2019-10-16 2019-10-17 17:56:02 2019-11-22 18:56:02 2019-10-17 17:56:02
       3 2020-01-18 2020-01-21 10:19:08 2020-02-26 11:19:08 2020-01-21 10:19:08
       4 2020-04-29 2020-05-02 02:28:45 2020-06-07 03:28:45 2020-05-02 02:28:45
       5 2020-08-27 2020-08-28 20:42:09 2020-10-03 21:42:09 2020-08-28 20:42:09
       6 2020-04-29 2020-05-02 02:28:45 2020-06-07 03:28:45 2020-05-02 02:28:45
       7 2019-10-16 2019-10-17 17:56:02 2019-11-22 18:56:02 2019-10-17 17:56:02
       8 2020-06-24 2020-06-27 04:48:00 2020-08-02 05:48:00 2020-06-27 04:48:00
       9 2020-01-18 2020-01-21 10:19:08 2020-02-26 11:19:08 2020-01-21 10:19:08
      10 2019-09-22 2019-09-22 02:25:18 2019-10-28 03:25:18 2019-09-22 02:25:18
         TRT01EDTM           TRT02SDTM           TRT02EDTM          
         <dttm>              <dttm>              <dttm>             
       1 2021-01-23 02:46:48 2021-01-23 02:46:48 2022-01-23 08:46:48
       2 2021-10-17 05:56:02 2021-10-17 05:56:02 2022-10-17 11:56:02
       3 2020-10-16 13:37:36 2020-10-16 13:37:36 2021-10-16 19:37:36
       4 2020-09-08 14:09:38 2020-09-08 14:09:38 2021-09-08 20:09:38
       5 2021-01-23 02:46:48 2021-01-23 02:46:48 2022-01-23 08:46:48
       6 2020-09-08 14:09:38 2020-09-08 14:09:38 2021-09-08 20:09:38
       7 2021-10-17 05:56:02 2021-10-17 05:56:02 2022-10-17 11:56:02
       8 2022-06-27 16:48:00 2022-06-27 16:48:00 2023-06-27 22:48:00
       9 2020-10-16 13:37:36 2020-10-16 13:37:36 2021-10-16 19:37:36
      10 2021-09-21 14:25:18 2021-09-21 14:25:18 2022-09-21 20:25:18
         AP01SDTM            AP01EDTM            AP02SDTM           
         <dttm>              <dttm>              <dttm>             
       1 2020-08-28 20:42:09 2021-01-23 02:46:48 2021-01-23 02:46:48
       2 2019-10-17 17:56:02 2021-10-17 05:56:02 2021-10-17 05:56:02
       3 2020-01-21 10:19:08 2020-10-16 13:37:36 2020-10-16 13:37:36
       4 2020-05-02 02:28:45 2020-09-08 14:09:38 2020-09-08 14:09:38
       5 2020-08-28 20:42:09 2021-01-23 02:46:48 2021-01-23 02:46:48
       6 2020-05-02 02:28:45 2020-09-08 14:09:38 2020-09-08 14:09:38
       7 2019-10-17 17:56:02 2021-10-17 05:56:02 2021-10-17 05:56:02
       8 2020-06-27 04:48:00 2022-06-27 16:48:00 2022-06-27 16:48:00
       9 2020-01-21 10:19:08 2020-10-16 13:37:36 2020-10-16 13:37:36
      10 2019-09-22 02:25:18 2021-09-21 14:25:18 2021-09-21 14:25:18
         AP02EDTM            EOSSTT       EOTSTT       EOSDT      EOSDY DCSREAS      
         <dttm>              <fct>        <fct>        <date>     <int> <fct>        
       1 2022-01-23 08:46:48 DISCONTINUED DISCONTINUED 2022-01-23   513 ADVERSE EVENT
       2 2022-10-17 11:56:02 COMPLETED    COMPLETED    2022-10-17  1096 <NA>         
       3 2021-10-16 19:37:36 DISCONTINUED DISCONTINUED 2021-10-16   635 DEATH        
       4 2021-09-08 20:09:38 DISCONTINUED DISCONTINUED 2021-09-08   495 DEATH        
       5 2022-01-23 08:46:48 DISCONTINUED DISCONTINUED 2022-01-23   513 ADVERSE EVENT
       6 2021-09-08 20:09:38 DISCONTINUED DISCONTINUED 2021-09-08   495 DEATH        
       7 2022-10-17 11:56:02 COMPLETED    COMPLETED    2022-10-17  1096 <NA>         
       8 2023-06-27 22:48:00 COMPLETED    COMPLETED    2023-06-27  1096 <NA>         
       9 2021-10-16 19:37:36 DISCONTINUED DISCONTINUED 2021-10-16   635 DEATH        
      10 2022-09-21 20:25:18 COMPLETED    COMPLETED    2022-09-21  1096 <NA>         
         DTHDT      DTHCAUS             DTHCAT              LDDTHELD LDDTHGR1
         <date>     <fct>               <fct>                  <int> <fct>   
       1 NA         <NA>                <NA>                      NA <NA>    
       2 NA         <NA>                <NA>                      NA <NA>    
       3 2021-11-23 DISEASE PROGRESSION PROGRESSIVE DISEASE       38 >30     
       4 2021-09-27 ADVERSE EVENT       ADVERSE EVENT             19 <=30    
       5 NA         <NA>                <NA>                      NA <NA>    
       6 2021-09-27 ADVERSE EVENT       ADVERSE EVENT             19 <=30    
       7 NA         <NA>                <NA>                      NA <NA>    
       8 NA         <NA>                <NA>                      NA <NA>    
       9 2021-11-23 DISEASE PROGRESSION PROGRESSIVE DISEASE       38 >30     
      10 NA         <NA>                <NA>                      NA <NA>    
         LSTALVDT   DTHADY ADTHAUT  ASEQ EXSEQ
         <date>      <int> <fct>   <int> <int>
       1 2022-02-12     NA <NA>       10    10
       2 2022-10-30     NA <NA>        4     4
       3 2021-11-23    671 Yes         3     3
       4 2021-09-27    512 Yes         3     3
       5 2022-02-12     NA <NA>        8     8
       6 2021-09-27    512 Yes         2     2
       7 2022-10-30     NA <NA>        7     7
       8 2023-07-10     NA <NA>       12    12
       9 2021-11-23    671 Yes        12    12
      10 2022-10-09     NA <NA>       12    12
         PARAM                                                        PARAMCD
         <fct>                                                        <fct>  
       1 Number of doses administered during constant dosing interval NDOSE  
       2 Number of doses administered during constant dosing interval NDOSE  
       3 Dose administered during constant dosing interval            DOSE   
       4 Dose administered during constant dosing interval            DOSE   
       5 Number of doses administered during constant dosing interval NDOSE  
       6 Number of doses administered during constant dosing interval NDOSE  
       7 Dose administered during constant dosing interval            DOSE   
       8 Dose administered during constant dosing interval            DOSE   
       9 Dose administered during constant dosing interval            DOSE   
      10 Total number of doses administered                           TNDOSE 
         AVISIT        AVISITN  AVAL AVALU PARCAT1    PARCAT2 ASTDTM             
         <fct>           <int> <dbl> <fct> <fct>      <fct>   <dttm>             
       1 WEEK 2 DAY 15       2     1 " "   INDIVIDUAL Drug A  2020-09-12 20:42:09
       2 WEEK 4 DAY 29       4     1 " "   INDIVIDUAL Drug B  2019-11-15 17:56:02
       3 WEEK 4 DAY 29       4   960 "mg"  INDIVIDUAL Drug B  2020-02-19 10:19:08
       4 SCREENING          -1   960 "mg"  INDIVIDUAL Drug A  2020-05-01 02:28:45
       5 WEEK 5 DAY 36       5     1 " "   INDIVIDUAL Drug A  2020-10-03 20:42:09
       6 WEEK 1 DAY 8        1     1 " "   INDIVIDUAL Drug A  2020-05-10 02:28:45
       7 WEEK 1 DAY 8        1   960 "mg"  INDIVIDUAL Drug B  2019-10-25 17:56:02
       8 BASELINE            0   960 "mg"  INDIVIDUAL Drug A  2020-06-28 04:48:00
       9 BASELINE            0   720 "mg"  INDIVIDUAL Drug B  2020-01-22 10:19:08
      10 <NA>           999000     7 " "   OVERALL    Drug A  NA                 
         AENDTM              ASTDY AENDY EXDOSFRQ EXROUTE        VISIT         VISITDY
         <dttm>              <int> <int> <chr>    <chr>          <chr>           <int>
       1 2020-09-12 21:42:09    15    15 "ONCE"   "SUBCUTANEOUS" WEEK 2 DAY 15      15
       2 2019-11-15 18:56:02    29    29 "ONCE"   "SUBCUTANEOUS" WEEK 4 DAY 29      29
       3 2020-02-19 11:19:08    29    29 "ONCE"   "INTRAVENOUS"  WEEK 4 DAY 29      29
       4 2020-05-01 03:28:45    -1    -1 "ONCE"   "INTRAVENOUS"  SCREENING          -1
       5 2020-10-03 21:42:09    36    36 "ONCE"   "INTRAVENOUS"  WEEK 5 DAY 36      36
       6 2020-05-10 03:28:45     8     8 "ONCE"   "INTRAVENOUS"  WEEK 1 DAY 8        8
       7 2019-10-25 18:56:02     8     8 "ONCE"   "INTRAVENOUS"  WEEK 1 DAY 8        8
       8 2020-06-28 05:48:00     1     1 "ONCE"   "INTRAVENOUS"  BASELINE            1
       9 2020-01-22 11:19:08     1     1 "ONCE"   "INTRAVENOUS"  BASELINE            1
      10 NA                     NA    NA ""       ""             <NA>               NA
         EXSTDTC             EXENDTC             EXSTDY EXENDY TRTSDT     TRTEDT    
         <dttm>              <dttm>               <int>  <int> <date>     <date>    
       1 2020-09-12 20:42:09 2020-09-12 21:42:09     15     15 2020-08-28 2020-10-03
       2 2019-11-15 17:56:02 2019-11-15 18:56:02     29     29 2019-10-17 2019-11-22
       3 2020-02-19 10:19:08 2020-02-19 11:19:08     29     29 2020-01-21 2020-02-26
       4 2020-05-01 02:28:45 2020-05-01 03:28:45     -1     -1 2020-05-02 2020-06-07
       5 2020-10-03 20:42:09 2020-10-03 21:42:09     36     36 2020-08-28 2020-10-03
       6 2020-05-10 02:28:45 2020-05-10 03:28:45      8      8 2020-05-02 2020-06-07
       7 2019-10-25 17:56:02 2019-10-25 18:56:02      8      8 2019-10-17 2019-11-22
       8 2020-06-28 04:48:00 2020-06-28 05:48:00      1      1 2020-06-27 2020-08-02
       9 2020-01-22 10:19:08 2020-01-22 11:19:08      1      1 2020-01-21 2020-02-26
      10 NA                  NA                      NA     NA 2019-09-22 2019-10-28

# radhy produces expected values

    Code
      first_pt_rows
    Output
      # A tibble: 50 x 71
         STUDYID USUBJID            SUBJID SITEID   AGE AGEU  SEX  
         <chr>   <chr>              <chr>  <chr>  <int> <fct> <fct>
       1 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       2 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       3 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       4 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       5 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       6 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       7 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       8 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       9 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      10 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      11 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      12 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      13 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      14 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      15 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      16 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      17 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      18 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      19 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      20 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      21 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      22 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      23 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      24 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      25 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      26 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      27 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      28 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      29 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      30 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      31 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      32 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      33 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      34 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      35 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      36 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      37 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      38 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      39 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      40 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      41 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      42 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      43 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      44 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      45 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      46 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      47 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      48 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      49 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      50 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
         RACE                      ETHNIC  COUNTRY DTHFL INVID        INVNAM       
         <fct>                     <fct>   <fct>   <fct> <chr>        <chr>        
       1 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       2 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       3 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       4 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       5 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       6 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       7 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       8 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       9 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      10 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      11 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      12 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      13 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      14 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      15 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      16 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      17 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      18 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      19 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      20 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      21 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      22 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      23 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      24 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      25 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      26 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      27 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      28 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      29 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      30 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      31 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      32 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      33 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      34 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      35 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      36 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      37 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      38 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      39 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      40 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      41 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      42 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      43 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      44 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      45 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      46 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      47 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      48 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      49 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      50 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
         ARM            ARMCD ACTARM         ACTARMCD TRT01P         TRT01A        
         <fct>          <fct> <fct>          <fct>    <fct>          <fct>         
       1 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       2 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       3 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       4 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       5 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       6 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       7 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       8 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       9 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      10 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      11 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      12 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      13 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      14 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      15 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      16 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      17 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      18 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      19 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      20 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      21 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      22 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      23 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      24 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      25 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      26 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      27 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      28 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      29 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      30 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      31 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      32 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      33 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      34 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      35 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      36 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      37 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      38 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      39 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      40 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      41 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      42 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      43 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      44 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      45 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      46 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      47 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      48 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      49 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      50 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
         TRT02P    TRT02A         REGION1       STRATA1 STRATA2 BMRKR1 BMRKR2 ITTFL
         <fct>     <fct>          <fct>         <fct>   <fct>    <dbl> <fct>  <fct>
       1 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       2 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       3 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       4 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       5 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       6 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       7 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       8 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       9 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      10 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      11 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      12 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      13 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      14 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      15 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      16 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      17 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      18 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      19 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      20 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      21 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      22 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      23 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      24 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      25 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      26 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      27 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      28 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      29 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      30 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      31 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      32 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      33 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      34 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      35 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      36 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      37 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      38 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      39 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      40 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      41 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      42 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      43 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      44 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      45 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      46 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      47 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      48 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      49 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      50 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
         SAFFL BMEASIFL BEP01FL AEWITHFL RANDDT     TRTSDTM            
         <fct> <fct>    <fct>   <fct>    <date>     <dttm>             
       1 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       2 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       3 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       4 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       5 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       6 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       7 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       8 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       9 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      10 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      11 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      12 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      13 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      14 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      15 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      16 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      17 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      18 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      19 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      20 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      21 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      22 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      23 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      24 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      25 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      26 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      27 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      28 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      29 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      30 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      31 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      32 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      33 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      34 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      35 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      36 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      37 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      38 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      39 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      40 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      41 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      42 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      43 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      44 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      45 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      46 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      47 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      48 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      49 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      50 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
         TRTEDTM             TRT01SDTM           TRT01EDTM          
         <dttm>              <dttm>              <dttm>             
       1 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       2 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       3 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       4 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       5 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       6 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       7 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       8 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       9 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      10 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      11 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      12 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      13 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      14 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      15 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      16 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      17 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      18 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      19 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      20 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      21 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      22 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      23 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      24 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      25 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      26 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      27 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      28 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      29 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      30 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      31 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      32 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      33 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      34 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      35 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      36 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      37 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      38 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      39 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      40 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      41 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      42 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      43 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      44 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      45 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      46 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      47 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      48 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      49 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      50 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
         TRT02SDTM           TRT02EDTM           AP01SDTM           
         <dttm>              <dttm>              <dttm>             
       1 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       2 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       3 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       4 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       5 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       6 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       7 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       8 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       9 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      10 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      11 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      12 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      13 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      14 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      15 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      16 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      17 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      18 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      19 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      20 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      21 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      22 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      23 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      24 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      25 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      26 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      27 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      28 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      29 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      30 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      31 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      32 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      33 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      34 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      35 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      36 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      37 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      38 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      39 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      40 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      41 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      42 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      43 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      44 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      45 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      46 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      47 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      48 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      49 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      50 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
         AP01EDTM            AP02SDTM            AP02EDTM            EOSSTT   
         <dttm>              <dttm>              <dttm>              <fct>    
       1 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       2 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       3 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       4 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       5 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       6 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       7 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       8 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       9 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      10 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      11 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      12 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      13 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      14 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      15 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      16 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      17 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      18 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      19 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      20 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      21 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      22 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      23 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      24 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      25 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      26 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      27 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      28 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      29 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      30 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      31 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      32 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      33 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      34 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      35 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      36 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      37 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      38 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      39 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      40 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      41 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      42 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      43 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      44 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      45 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      46 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      47 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      48 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      49 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      50 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
         EOTSTT    EOSDT      EOSDY DCSREAS DTHDT  DTHCAUS DTHCAT LDDTHELD LDDTHGR1
         <fct>     <date>     <int> <fct>   <date> <fct>   <fct>     <int> <fct>   
       1 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       2 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       3 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       4 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       5 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       6 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       7 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       8 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       9 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      10 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      11 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      12 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      13 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      14 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      15 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      16 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      17 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      18 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      19 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      20 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      21 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      22 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      23 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      24 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      25 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      26 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      27 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      28 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      29 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      30 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      31 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      32 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      33 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      34 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      35 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      36 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      37 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      38 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      39 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      40 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      41 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      42 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      43 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      44 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      45 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      46 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      47 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      48 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      49 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      50 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
         LSTALVDT   DTHADY ADTHAUT
         <date>      <int> <fct>  
       1 2024-02-10     NA <NA>   
       2 2024-02-10     NA <NA>   
       3 2024-02-10     NA <NA>   
       4 2024-02-10     NA <NA>   
       5 2024-02-10     NA <NA>   
       6 2024-02-10     NA <NA>   
       7 2024-02-10     NA <NA>   
       8 2024-02-10     NA <NA>   
       9 2024-02-10     NA <NA>   
      10 2024-02-10     NA <NA>   
      11 2024-02-10     NA <NA>   
      12 2024-02-10     NA <NA>   
      13 2024-02-10     NA <NA>   
      14 2024-02-10     NA <NA>   
      15 2024-02-10     NA <NA>   
      16 2024-02-10     NA <NA>   
      17 2024-02-10     NA <NA>   
      18 2024-02-10     NA <NA>   
      19 2024-02-10     NA <NA>   
      20 2024-02-10     NA <NA>   
      21 2024-02-10     NA <NA>   
      22 2024-02-10     NA <NA>   
      23 2024-02-10     NA <NA>   
      24 2024-02-10     NA <NA>   
      25 2024-02-10     NA <NA>   
      26 2024-02-10     NA <NA>   
      27 2024-02-10     NA <NA>   
      28 2024-02-10     NA <NA>   
      29 2024-02-10     NA <NA>   
      30 2024-02-10     NA <NA>   
      31 2024-02-10     NA <NA>   
      32 2024-02-10     NA <NA>   
      33 2024-02-10     NA <NA>   
      34 2024-02-10     NA <NA>   
      35 2024-02-10     NA <NA>   
      36 2024-02-10     NA <NA>   
      37 2024-02-10     NA <NA>   
      38 2024-02-10     NA <NA>   
      39 2024-02-10     NA <NA>   
      40 2024-02-10     NA <NA>   
      41 2024-02-10     NA <NA>   
      42 2024-02-10     NA <NA>   
      43 2024-02-10     NA <NA>   
      44 2024-02-10     NA <NA>   
      45 2024-02-10     NA <NA>   
      46 2024-02-10     NA <NA>   
      47 2024-02-10     NA <NA>   
      48 2024-02-10     NA <NA>   
      49 2024-02-10     NA <NA>   
      50 2024-02-10     NA <NA>   
         PARAM                                                                        
         <fct>                                                                        
       1 ALT or AST > 3 times Baseline by Period                                      
       2 ALT or AST > 3 times Baseline by Period                                      
       3 ALT or AST > 3 times Baseline by Period                                      
       4 ALT or AST > 3 times ULN by Period                                           
       5 ALT or AST > 3 times ULN by Period                                           
       6 ALT or AST > 3 times ULN by Period                                           
       7 ALT > 3 times Baseline by Period                                             
       8 ALT > 3 times Baseline by Period                                             
       9 ALT > 3 times Baseline by Period                                             
      10 ALT > 3 times ULN by Period                                                  
      11 ALT > 3 times ULN by Period                                                  
      12 ALT > 3 times ULN by Period                                                  
      13 AST > 3 times Baseline by Period                                             
      14 AST > 3 times Baseline by Period                                             
      15 AST > 3 times Baseline by Period                                             
      16 AST > 3 times ULN by Period                                                  
      17 AST > 3 times ULN by Period                                                  
      18 AST > 3 times ULN by Period                                                  
      19 TBILI > 2 times ULN and ALKPH <= 2 times ULN and ALT value category          
      20 TBILI > 2 times ULN and ALKPH <= 2 times ULN and ALT value category          
      21 TBILI > 2 times ULN and ALKPH <= 2 times ULN and AST value category          
      22 TBILI > 2 times ULN and ALKPH <= 2 times ULN and AST value category          
      23 TBILI > 2 times ULN and ALKPH <= 5 times ULN and ALT value category          
      24 TBILI > 2 times ULN and ALKPH <= 5 times ULN and ALT value category          
      25 TBILI > 2 times ULN and ALKPH <= 5 times ULN and AST value category          
      26 TBILI > 2 times ULN and ALKPH <= 5 times ULN and AST value category          
      27 TBILI > 2 times ULN and two consecutive elevations of ALT in relation to Bas~
      28 TBILI > 2 times ULN and two consecutive elevations of ALT in relation to Bas~
      29 TBILI > 2 times ULN and two consecutive elevations of ALT in relation to ULN 
      30 TBILI > 2 times ULN and two consecutive elevations of ALT in relation to ULN 
      31 TBILI > 2 times ULN and two consecutive elevations of AST in relation to Bas~
      32 TBILI > 2 times ULN and two consecutive elevations of AST in relation to Bas~
      33 TBILI > 2 times ULN and two consecutive elevations of AST in relation to ULN 
      34 TBILI > 2 times ULN and two consecutive elevations of AST in relation to ULN 
      35 TBILI > 2 times ULN and ALT value category                                   
      36 TBILI > 2 times ULN and ALT value category                                   
      37 TBILI > 2 times ULN and AST value category                                   
      38 TBILI > 2 times ULN and AST value category                                   
      39 TBILI <= 2 times ULN and two consecutive elevations of ALT in relation to Ba~
      40 TBILI <= 2 times ULN and two consecutive elevations of ALT in relation to Ba~
      41 TBILI <= 2 times ULN and two consecutive elevations of ALT in relation to ULN
      42 TBILI <= 2 times ULN and two consecutive elevations of ALT in relation to ULN
      43 TBILI <= 2 times ULN and two consecutive elevations of AST in relation to Ba~
      44 TBILI <= 2 times ULN and two consecutive elevations of AST in relation to Ba~
      45 TBILI <= 2 times ULN and two consecutive elevations of AST in relation to ULN
      46 TBILI <= 2 times ULN and two consecutive elevations of AST in relation to ULN
      47 TBILI <= 2 times ULN and ALT value category                                  
      48 TBILI <= 2 times ULN and ALT value category                                  
      49 TBILI <= 2 times ULN and AST value category                                  
      50 TBILI <= 2 times ULN and AST value category                                  
         PARAMCD   AVAL AVALC             BASE BASEC            ABLFL
         <fct>    <dbl> <fct>            <dbl> <fct>            <fct>
       1 ALTASTPB     1 Y                    1 Y                Y    
       2 ALTASTPB     0 N                    1 Y                <NA> 
       3 ALTASTPB     0 N                    1 Y                <NA> 
       4 ALTASTPU     0 N                    0 N                Y    
       5 ALTASTPU     0 N                    0 N                <NA> 
       6 ALTASTPU     0 N                    0 N                <NA> 
       7 ALTPBASE     0 N                    0 N                Y    
       8 ALTPBASE     0 N                    0 N                <NA> 
       9 ALTPBASE     0 N                    0 N                <NA> 
      10 ALTPULN      0 N                    0 N                Y    
      11 ALTPULN      0 N                    0 N                <NA> 
      12 ALTPULN      0 N                    0 N                <NA> 
      13 ASTPBASE     0 N                    0 N                Y    
      14 ASTPBASE     0 N                    0 N                <NA> 
      15 ASTPBASE     0 N                    0 N                <NA> 
      16 ASTPULN      0 N                    0 N                Y    
      17 ASTPULN      0 N                    0 N                <NA> 
      18 ASTPULN      0 N                    0 N                <NA> 
      19 BA2AL        3 >10-20ULN            3 >10-20ULN        Y    
      20 BA2AL        4 >20ULN               3 >10-20ULN        <NA> 
      21 BA2AS        0 Criteria not met     0 Criteria not met Y    
      22 BA2AS        2 >5-10ULN             0 Criteria not met <NA> 
      23 BA5AL        2 >5-10ULN             2 >5-10ULN         Y    
      24 BA5AL        3 >10-20ULN            2 >5-10ULN         <NA> 
      25 BA5AS        3 >10-20ULN            3 >10-20ULN        Y    
      26 BA5AS        0 Criteria not met     3 >10-20ULN        <NA> 
      27 BG2AL2CB     0 N                    0 N                Y    
      28 BG2AL2CB     0 N                    0 N                <NA> 
      29 BG2AL2CU     0 N                    0 N                Y    
      30 BG2AL2CU     0 N                    0 N                <NA> 
      31 BG2AS2CB     0 N                    0 N                Y    
      32 BG2AS2CB     0 N                    0 N                <NA> 
      33 BG2AS2CU     0 N                    0 N                Y    
      34 BG2AS2CU     0 N                    0 N                <NA> 
      35 BGAL         2 >5-10ULN             2 >5-10ULN         Y    
      36 BGAL         3 >10-20ULN            2 >5-10ULN         <NA> 
      37 BGAS         0 Criteria not met     0 Criteria not met Y    
      38 BGAS         3 >10-20ULN            0 Criteria not met <NA> 
      39 BL2AL2CB     0 N                    0 N                Y    
      40 BL2AL2CB     1 Y                    0 N                <NA> 
      41 BL2AL2CU     0 N                    0 N                Y    
      42 BL2AL2CU     0 N                    0 N                <NA> 
      43 BL2AS2CB     0 N                    0 N                Y    
      44 BL2AS2CB     0 N                    0 N                <NA> 
      45 BL2AS2CU     0 N                    0 N                Y    
      46 BL2AS2CU     0 N                    0 N                <NA> 
      47 BLAL         1 >3-5ULN              1 >3-5ULN          Y    
      48 BLAL         0 Criteria not met     1 >3-5ULN          <NA> 
      49 BLAS         2 >5-10ULN             2 >5-10ULN         Y    
      50 BLAS         1 >3-5ULN              2 >5-10ULN         <NA> 
         ADTM                  ADY AVISIT        AVISITN APERIOD APERIODC ONTRTFL
         <dttm>              <int> <fct>           <int>   <int> <fct>    <fct>  
       1 2021-01-13 22:43:53    -4 BASELINE            0       1 PERIOD 1 <NA>   
       2 2023-10-11 22:43:53   997 POST-BASELINE    9995       2 PERIOD 2 Y      
       3 2023-10-17 22:43:53  1003 POST-BASELINE    9995       1 PERIOD 1 Y      
       4 2021-01-13 22:43:53    -4 BASELINE            0       1 PERIOD 1 <NA>   
       5 2021-03-09 22:43:53    51 POST-BASELINE    9995       1 PERIOD 1 Y      
       6 2021-08-01 22:43:53   196 POST-BASELINE    9995       2 PERIOD 2 Y      
       7 2021-01-08 22:43:53    -9 BASELINE            0       1 PERIOD 1 <NA>   
       8 2022-01-13 22:43:53   361 POST-BASELINE    9995       1 PERIOD 1 Y      
       9 2022-12-26 22:43:53   708 POST-BASELINE    9995       2 PERIOD 2 Y      
      10 2021-01-04 22:43:53   -13 BASELINE            0       1 PERIOD 1 <NA>   
      11 2022-04-04 22:43:53   442 POST-BASELINE    9995       1 PERIOD 1 Y      
      12 2022-10-26 22:43:53   647 POST-BASELINE    9995       2 PERIOD 2 Y      
      13 2021-01-04 22:43:53   -13 BASELINE            0       1 PERIOD 1 <NA>   
      14 2022-01-25 22:43:53   373 POST-BASELINE    9995       1 PERIOD 1 Y      
      15 2023-04-23 22:43:53   826 POST-BASELINE    9995       2 PERIOD 2 Y      
      16 2021-01-13 22:43:53    -4 BASELINE            0       1 PERIOD 1 <NA>   
      17 2021-01-20 22:43:53     3 POST-BASELINE    9995       2 PERIOD 2 Y      
      18 2021-05-12 22:43:53   115 POST-BASELINE    9995       1 PERIOD 1 Y      
      19 2021-01-14 22:43:53    -3 BASELINE            0       1 PERIOD 1 <NA>   
      20 2023-01-25 22:43:53   738 POST-BASELINE    9995       1 PERIOD 1 Y      
      21 2021-01-09 22:43:53    -8 BASELINE            0       1 PERIOD 1 <NA>   
      22 2023-02-15 22:43:53   759 POST-BASELINE    9995       1 PERIOD 1 Y      
      23 2021-01-15 22:43:53    -2 BASELINE            0       1 PERIOD 1 <NA>   
      24 2021-12-23 22:43:53   340 POST-BASELINE    9995       1 PERIOD 1 Y      
      25 2021-01-13 22:43:53    -4 BASELINE            0       1 PERIOD 1 <NA>   
      26 2021-07-23 22:43:53   187 POST-BASELINE    9995       1 PERIOD 1 Y      
      27 2021-01-09 22:43:53    -8 BASELINE            0       1 PERIOD 1 <NA>   
      28 2024-01-14 22:43:53  1092 POST-BASELINE    9995       1 PERIOD 1 Y      
      29 2021-01-05 22:43:53   -12 BASELINE            0       1 PERIOD 1 <NA>   
      30 2022-05-04 22:43:53   472 POST-BASELINE    9995       1 PERIOD 1 Y      
      31 2021-01-03 22:43:53   -14 BASELINE            0       1 PERIOD 1 <NA>   
      32 2022-11-25 22:43:53   677 POST-BASELINE    9995       1 PERIOD 1 Y      
      33 2021-01-12 22:43:53    -5 BASELINE            0       1 PERIOD 1 <NA>   
      34 2022-05-23 22:43:53   491 POST-BASELINE    9995       1 PERIOD 1 Y      
      35 2021-01-12 22:43:53    -5 BASELINE            0       1 PERIOD 1 <NA>   
      36 2021-02-01 22:43:53    15 POST-BASELINE    9995       1 PERIOD 1 Y      
      37 2021-01-10 22:43:53    -7 BASELINE            0       1 PERIOD 1 <NA>   
      38 2022-09-09 22:43:53   600 POST-BASELINE    9995       1 PERIOD 1 Y      
      39 2021-01-06 22:43:53   -11 BASELINE            0       1 PERIOD 1 <NA>   
      40 2023-04-26 22:43:53   829 POST-BASELINE    9995       1 PERIOD 1 Y      
      41 2021-01-12 22:43:53    -5 BASELINE            0       1 PERIOD 1 <NA>   
      42 2022-05-22 22:43:53   490 POST-BASELINE    9995       1 PERIOD 1 Y      
      43 2021-01-14 22:43:53    -3 BASELINE            0       1 PERIOD 1 <NA>   
      44 2023-07-31 22:43:53   925 POST-BASELINE    9995       1 PERIOD 1 Y      
      45 2021-01-05 22:43:53   -12 BASELINE            0       1 PERIOD 1 <NA>   
      46 2021-09-11 22:43:53   237 POST-BASELINE    9995       1 PERIOD 1 Y      
      47 2021-01-04 22:43:53   -13 BASELINE            0       1 PERIOD 1 <NA>   
      48 2023-01-22 22:43:53   735 POST-BASELINE    9995       1 PERIOD 1 Y      
      49 2021-01-03 22:43:53   -14 BASELINE            0       1 PERIOD 1 <NA>   
      50 2023-07-17 22:43:53   911 POST-BASELINE    9995       1 PERIOD 1 Y      
         SRCSEQ ANL01FL
          <int> <fct>  
       1     NA Y      
       2     NA Y      
       3     NA Y      
       4     NA Y      
       5     NA Y      
       6     NA Y      
       7     NA Y      
       8     NA Y      
       9     NA Y      
      10     NA Y      
      11     NA Y      
      12     NA Y      
      13     NA Y      
      14     NA Y      
      15     NA Y      
      16     NA Y      
      17     NA Y      
      18     NA Y      
      19     NA Y      
      20     NA Y      
      21     NA Y      
      22     NA Y      
      23     NA Y      
      24     NA Y      
      25     NA Y      
      26     NA Y      
      27     NA Y      
      28     NA Y      
      29     NA Y      
      30     NA Y      
      31     NA Y      
      32     NA Y      
      33     NA Y      
      34     NA Y      
      35     NA Y      
      36     NA Y      
      37     NA Y      
      38     NA Y      
      39     NA Y      
      40     NA Y      
      41     NA Y      
      42     NA Y      
      43     NA Y      
      44     NA Y      
      45     NA Y      
      46     NA Y      
      47     NA Y      
      48     NA Y      
      49     NA Y      
      50     NA Y      

---

    Code
      rand_rows
    Output
      # A tibble: 10 x 71
         STUDYID USUBJID             SUBJID SITEID   AGE AGEU  SEX  
         <chr>   <chr>               <chr>  <chr>  <int> <fct> <fct>
       1 AB12345 AB12345-CHN-3-id-10 id-10  CHN-3     35 YEARS M    
       2 AB12345 AB12345-CHN-11-id-1 id-1   CHN-11    35 YEARS F    
       3 AB12345 AB12345-RUS-1-id-6  id-6   RUS-1     36 YEARS F    
       4 AB12345 AB12345-RUS-1-id-6  id-6   RUS-1     36 YEARS F    
       5 AB12345 AB12345-RUS-1-id-4  id-4   RUS-1     36 YEARS M    
       6 AB12345 AB12345-CHN-3-id-5  id-5   CHN-3     36 YEARS F    
       7 AB12345 AB12345-BRA-9-id-8  id-8   BRA-9     31 YEARS F    
       8 AB12345 AB12345-CHN-11-id-2 id-2   CHN-11    35 YEARS M    
       9 AB12345 AB12345-USA-13-id-3 id-3   USA-13    35 YEARS F    
      10 AB12345 AB12345-CHN-3-id-10 id-10  CHN-3     35 YEARS M    
         RACE                             ETHNIC                 COUNTRY DTHFL
         <fct>                            <fct>                  <fct>   <fct>
       1 ASIAN                            NOT HISPANIC OR LATINO CHN     N    
       2 WHITE                            NOT HISPANIC OR LATINO CHN     Y    
       3 ASIAN                            NOT HISPANIC OR LATINO RUS     N    
       4 ASIAN                            NOT HISPANIC OR LATINO RUS     N    
       5 BLACK OR AFRICAN AMERICAN        NOT HISPANIC OR LATINO RUS     N    
       6 ASIAN                            NOT HISPANIC OR LATINO CHN     N    
       7 ASIAN                            NOT HISPANIC OR LATINO BRA     Y    
       8 BLACK OR AFRICAN AMERICAN        NOT HISPANIC OR LATINO CHN     N    
       9 AMERICAN INDIAN OR ALASKA NATIVE NOT HISPANIC OR LATINO USA     N    
      10 ASIAN                            NOT HISPANIC OR LATINO CHN     N    
         INVID         INVNAM         ARM            ARMCD ACTARM         ACTARMCD
         <chr>         <chr>          <fct>          <fct> <fct>          <fct>   
       1 INV ID CHN-3  Dr. CHN-3 Doe  B: Placebo     ARM B B: Placebo     ARM B   
       2 INV ID CHN-11 Dr. CHN-11 Doe C: Combination ARM C C: Combination ARM C   
       3 INV ID RUS-1  Dr. RUS-1 Doe  A: Drug X      ARM A A: Drug X      ARM A   
       4 INV ID RUS-1  Dr. RUS-1 Doe  A: Drug X      ARM A A: Drug X      ARM A   
       5 INV ID RUS-1  Dr. RUS-1 Doe  B: Placebo     ARM B B: Placebo     ARM B   
       6 INV ID CHN-3  Dr. CHN-3 Doe  A: Drug X      ARM A A: Drug X      ARM A   
       7 INV ID BRA-9  Dr. BRA-9 Doe  A: Drug X      ARM A A: Drug X      ARM A   
       8 INV ID CHN-11 Dr. CHN-11 Doe A: Drug X      ARM A A: Drug X      ARM A   
       9 INV ID USA-13 Dr. USA-13 Doe A: Drug X      ARM A A: Drug X      ARM A   
      10 INV ID CHN-3  Dr. CHN-3 Doe  B: Placebo     ARM B B: Placebo     ARM B   
         TRT01P         TRT01A         TRT02P         TRT02A         REGION1      
         <fct>          <fct>          <fct>          <fct>          <fct>        
       1 B: Placebo     B: Placebo     A: Drug X      A: Drug X      Asia         
       2 C: Combination C: Combination B: Placebo     B: Placebo     Asia         
       3 A: Drug X      A: Drug X      C: Combination A: Drug X      Eurasia      
       4 A: Drug X      A: Drug X      C: Combination A: Drug X      Eurasia      
       5 B: Placebo     B: Placebo     A: Drug X      A: Drug X      Eurasia      
       6 A: Drug X      A: Drug X      A: Drug X      C: Combination Asia         
       7 A: Drug X      A: Drug X      A: Drug X      A: Drug X      South America
       8 A: Drug X      A: Drug X      A: Drug X      A: Drug X      Asia         
       9 A: Drug X      A: Drug X      B: Placebo     A: Drug X      North America
      10 B: Placebo     B: Placebo     A: Drug X      A: Drug X      Asia         
         STRATA1 STRATA2 BMRKR1 BMRKR2 ITTFL SAFFL BMEASIFL BEP01FL AEWITHFL
         <fct>   <fct>    <dbl> <fct>  <fct> <fct> <fct>    <fct>   <fct>   
       1 A       S1        1.78 LOW    Y     Y     N        Y       N       
       2 B       S1        8.93 LOW    Y     Y     N        N       N       
       3 B       S1        9.34 MEDIUM Y     Y     N        N       N       
       4 B       S1        9.34 MEDIUM Y     Y     N        N       N       
       5 A       S1        9.95 MEDIUM Y     Y     Y        N       N       
       6 A       S2        2.62 LOW    Y     Y     Y        N       N       
       7 B       S2       11.3  MEDIUM Y     Y     Y        Y       N       
       8 C       S2        4.08 HIGH   Y     Y     Y        Y       N       
       9 C       S1        7.25 LOW    Y     Y     Y        N       N       
      10 A       S1        1.78 LOW    Y     Y     N        Y       N       
         RANDDT     TRTSDTM             TRTEDTM             TRT01SDTM          
         <date>     <dttm>              <dttm>              <dttm>             
       1 2019-03-24 2019-03-28 12:07:16 2022-03-28 06:07:16 2019-03-28 12:07:16
       2 2020-04-29 2020-05-02 02:28:45 2021-09-08 20:09:38 2020-05-02 02:28:45
       3 2020-10-24 2020-10-26 22:16:26 2023-10-27 16:16:26 2020-10-26 22:16:26
       4 2020-10-24 2020-10-26 22:16:26 2023-10-27 16:16:26 2020-10-26 22:16:26
       5 2020-08-27 2020-08-28 20:42:09 2022-01-23 08:46:48 2020-08-28 20:42:09
       6 2020-06-24 2020-06-27 04:48:00 2023-06-27 22:48:00 2020-06-27 04:48:00
       7 2020-01-18 2020-01-21 10:19:08 2021-10-16 19:37:36 2020-01-21 10:19:08
       8 2020-02-23 2020-02-26 18:15:59 NA                  2020-02-26 18:15:59
       9 2019-10-16 2019-10-17 17:56:02 2022-10-17 11:56:02 2019-10-17 17:56:02
      10 2019-03-24 2019-03-28 12:07:16 2022-03-28 06:07:16 2019-03-28 12:07:16
         TRT01EDTM           TRT02SDTM           TRT02EDTM          
         <dttm>              <dttm>              <dttm>             
       1 2021-03-28 00:07:16 2021-03-28 00:07:16 2022-03-28 06:07:16
       2 2020-09-08 14:09:38 2020-09-08 14:09:38 2021-09-08 20:09:38
       3 2022-10-27 10:16:26 2022-10-27 10:16:26 2023-10-27 16:16:26
       4 2022-10-27 10:16:26 2022-10-27 10:16:26 2023-10-27 16:16:26
       5 2021-01-23 02:46:48 2021-01-23 02:46:48 2022-01-23 08:46:48
       6 2022-06-27 16:48:00 2022-06-27 16:48:00 2023-06-27 22:48:00
       7 2020-10-16 13:37:36 2020-10-16 13:37:36 2021-10-16 19:37:36
       8 NA                  NA                  NA                 
       9 2021-10-17 05:56:02 2021-10-17 05:56:02 2022-10-17 11:56:02
      10 2021-03-28 00:07:16 2021-03-28 00:07:16 2022-03-28 06:07:16
         AP01SDTM            AP01EDTM            AP02SDTM           
         <dttm>              <dttm>              <dttm>             
       1 2019-03-28 12:07:16 2021-03-28 00:07:16 2021-03-28 00:07:16
       2 2020-05-02 02:28:45 2020-09-08 14:09:38 2020-09-08 14:09:38
       3 2020-10-26 22:16:26 2022-10-27 10:16:26 2022-10-27 10:16:26
       4 2020-10-26 22:16:26 2022-10-27 10:16:26 2022-10-27 10:16:26
       5 2020-08-28 20:42:09 2021-01-23 02:46:48 2021-01-23 02:46:48
       6 2020-06-27 04:48:00 2022-06-27 16:48:00 2022-06-27 16:48:00
       7 2020-01-21 10:19:08 2020-10-16 13:37:36 2020-10-16 13:37:36
       8 2020-02-26 18:15:59 NA                  NA                 
       9 2019-10-17 17:56:02 2021-10-17 05:56:02 2021-10-17 05:56:02
      10 2019-03-28 12:07:16 2021-03-28 00:07:16 2021-03-28 00:07:16
         AP02EDTM            EOSSTT       EOTSTT       EOSDT      EOSDY DCSREAS      
         <dttm>              <fct>        <fct>        <date>     <int> <fct>        
       1 2022-03-28 06:07:16 COMPLETED    COMPLETED    2022-03-28  1096 <NA>         
       2 2021-09-08 20:09:38 DISCONTINUED DISCONTINUED 2021-09-08   495 DEATH        
       3 2023-10-27 16:16:26 COMPLETED    COMPLETED    2023-10-27  1096 <NA>         
       4 2023-10-27 16:16:26 COMPLETED    COMPLETED    2023-10-27  1096 <NA>         
       5 2022-01-23 08:46:48 DISCONTINUED DISCONTINUED 2022-01-23   513 ADVERSE EVENT
       6 2023-06-27 22:48:00 COMPLETED    COMPLETED    2023-06-27  1096 <NA>         
       7 2021-10-16 19:37:36 DISCONTINUED DISCONTINUED 2021-10-16   635 DEATH        
       8 NA                  ONGOING      ONGOING      NA            NA <NA>         
       9 2022-10-17 11:56:02 COMPLETED    COMPLETED    2022-10-17  1096 <NA>         
      10 2022-03-28 06:07:16 COMPLETED    COMPLETED    2022-03-28  1096 <NA>         
         DTHDT      DTHCAUS             DTHCAT              LDDTHELD LDDTHGR1
         <date>     <fct>               <fct>                  <int> <fct>   
       1 NA         <NA>                <NA>                      NA <NA>    
       2 2021-09-27 ADVERSE EVENT       ADVERSE EVENT             19 <=30    
       3 NA         <NA>                <NA>                      NA <NA>    
       4 NA         <NA>                <NA>                      NA <NA>    
       5 NA         <NA>                <NA>                      NA <NA>    
       6 NA         <NA>                <NA>                      NA <NA>    
       7 2021-11-23 DISEASE PROGRESSION PROGRESSIVE DISEASE       38 >30     
       8 NA         <NA>                <NA>                      NA <NA>    
       9 NA         <NA>                <NA>                      NA <NA>    
      10 NA         <NA>                <NA>                      NA <NA>    
         LSTALVDT   DTHADY ADTHAUT
         <date>      <int> <fct>  
       1 2022-04-14     NA <NA>   
       2 2021-09-27    512 Yes    
       3 2023-11-13     NA <NA>   
       4 2023-11-13     NA <NA>   
       5 2022-02-12     NA <NA>   
       6 2023-07-10     NA <NA>   
       7 2021-11-23    671 Yes    
       8 NA             NA <NA>   
       9 2022-10-30     NA <NA>   
      10 2022-04-14     NA <NA>   
         PARAM                                                                        
         <fct>                                                                        
       1 TBILI > 2 times ULN and ALKPH <= 2 times ULN and ALT value category          
       2 TBILI <= 2 times ULN and ALT value category                                  
       3 TBILI > 2 times ULN and ALKPH <= 5 times ULN and ALT value category          
       4 TBILI > 2 times ULN and two consecutive elevations of AST in relation to ULN 
       5 TBILI <= 2 times ULN and two consecutive elevations of AST in relation to ULN
       6 TBILI > 2 times ULN and ALKPH <= 2 times ULN and AST value category          
       7 ALT > 3 times ULN by Period                                                  
       8 TBILI > 2 times ULN and ALKPH <= 5 times ULN and ALT value category          
       9 ALT or AST > 3 times Baseline by Period                                      
      10 TBILI > 2 times ULN and two consecutive elevations of ALT in relation to ULN 
         PARAMCD   AVAL AVALC             BASE BASEC            ABLFL
         <fct>    <dbl> <fct>            <dbl> <fct>            <fct>
       1 BA2AL        3 >10-20ULN            3 >10-20ULN        Y    
       2 BLAL         3 >10-20ULN            3 >10-20ULN        Y    
       3 BA5AL        3 >10-20ULN            2 >5-10ULN         <NA> 
       4 BG2AS2CU     0 N                    0 N                Y    
       5 BL2AS2CU     0 N                    0 N                Y    
       6 BA2AS        0 Criteria not met     0 Criteria not met Y    
       7 ALTPULN      0 N                    0 N                <NA> 
       8 BA5AL        1 >3-5ULN              0 Criteria not met <NA> 
       9 ALTASTPB     0 N                    1 Y                <NA> 
      10 BG2AL2CU     0 N                    0 N                Y    
         ADTM                  ADY AVISIT        AVISITN APERIOD APERIODC ONTRTFL
         <dttm>              <int> <fct>           <int>   <int> <fct>    <fct>  
       1 2019-03-22 12:07:16    -6 BASELINE            0       1 PERIOD 1 <NA>   
       2 2020-04-22 02:28:45   -10 BASELINE            0       1 PERIOD 1 <NA>   
       3 2022-09-25 22:16:26   699 POST-BASELINE    9995       1 PERIOD 1 Y      
       4 2020-10-24 22:16:26    -2 BASELINE            0       1 PERIOD 1 <NA>   
       5 2020-08-22 20:42:09    -6 BASELINE            0       1 PERIOD 1 <NA>   
       6 2020-06-24 04:48:00    -3 BASELINE            0       1 PERIOD 1 <NA>   
       7 2020-05-31 10:19:08   131 POST-BASELINE    9995       2 PERIOD 2 Y      
       8 2020-03-08 18:15:59    11 POST-BASELINE    9995       1 PERIOD 1 Y      
       9 2022-07-12 17:56:02   999 POST-BASELINE    9995       1 PERIOD 1 Y      
      10 2019-03-18 12:07:16   -10 BASELINE            0       1 PERIOD 1 <NA>   
         SRCSEQ ANL01FL
          <int> <fct>  
       1     NA Y      
       2     NA Y      
       3     NA Y      
       4     NA Y      
       5     NA Y      
       6     NA Y      
       7     NA Y      
       8     NA Y      
       9     NA Y      
      10     NA Y      

# radlb produces expected values

    Code
      first_pt_rows
    Output
      # A tibble: 21 x 102
         STUDYID USUBJID            SUBJID SITEID   AGE AGEU  SEX  
         <chr>   <chr>              <chr>  <chr>  <int> <fct> <fct>
       1 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       2 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       3 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       4 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       5 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       6 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       7 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       8 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       9 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      10 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      11 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      12 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      13 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      14 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      15 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      16 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      17 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      18 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      19 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      20 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      21 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
         RACE                      ETHNIC  COUNTRY DTHFL INVID        INVNAM       
         <fct>                     <fct>   <fct>   <fct> <chr>        <chr>        
       1 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       2 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       3 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       4 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       5 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       6 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       7 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       8 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       9 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      10 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      11 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      12 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      13 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      14 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      15 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      16 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      17 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      18 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      19 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      20 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      21 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
         ARM            ARMCD ACTARM         ACTARMCD TRT01P         TRT01A        
         <fct>          <fct> <fct>          <fct>    <fct>          <fct>         
       1 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       2 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       3 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       4 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       5 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       6 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       7 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       8 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       9 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      10 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      11 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      12 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      13 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      14 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      15 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      16 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      17 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      18 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      19 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      20 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      21 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
         TRT02P    TRT02A         REGION1       STRATA1 STRATA2 BMRKR1 BMRKR2 ITTFL
         <fct>     <fct>          <fct>         <fct>   <fct>    <dbl> <fct>  <fct>
       1 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       2 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       3 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       4 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       5 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       6 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       7 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       8 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       9 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      10 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      11 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      12 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      13 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      14 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      15 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      16 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      17 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      18 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      19 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      20 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      21 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
         SAFFL BMEASIFL BEP01FL AEWITHFL RANDDT     TRTSDTM            
         <fct> <fct>    <fct>   <fct>    <date>     <dttm>             
       1 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       2 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       3 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       4 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       5 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       6 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       7 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       8 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       9 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      10 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      11 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      12 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      13 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      14 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      15 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      16 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      17 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      18 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      19 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      20 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      21 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
         TRTEDTM             TRT01SDTM           TRT01EDTM          
         <dttm>              <dttm>              <dttm>             
       1 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       2 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       3 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       4 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       5 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       6 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       7 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       8 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       9 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      10 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      11 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      12 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      13 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      14 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      15 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      16 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      17 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      18 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      19 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      20 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      21 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
         TRT02SDTM           TRT02EDTM           AP01SDTM           
         <dttm>              <dttm>              <dttm>             
       1 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       2 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       3 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       4 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       5 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       6 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       7 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       8 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       9 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      10 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      11 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      12 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      13 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      14 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      15 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      16 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      17 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      18 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      19 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      20 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      21 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
         AP01EDTM            AP02SDTM            AP02EDTM            EOSSTT   
         <dttm>              <dttm>              <dttm>              <fct>    
       1 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       2 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       3 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       4 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       5 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       6 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       7 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       8 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       9 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      10 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      11 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      12 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      13 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      14 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      15 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      16 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      17 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      18 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      19 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      20 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      21 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
         EOTSTT    EOSDT      EOSDY DCSREAS DTHDT  DTHCAUS DTHCAT LDDTHELD LDDTHGR1
         <fct>     <date>     <int> <fct>   <date> <fct>   <fct>     <int> <fct>   
       1 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       2 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       3 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       4 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       5 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       6 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       7 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       8 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       9 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      10 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      11 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      12 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      13 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      14 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      15 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      16 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      17 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      18 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      19 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      20 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      21 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
         LSTALVDT   DTHADY ADTHAUT  ASEQ LBSEQ LBTESTCD
         <date>      <int> <fct>   <int> <int> <fct>   
       1 2024-02-10     NA <NA>        1     1 ALT     
       2 2024-02-10     NA <NA>        4     4 ALT     
       3 2024-02-10     NA <NA>        7     7 ALT     
       4 2024-02-10     NA <NA>       10    10 ALT     
       5 2024-02-10     NA <NA>       13    13 ALT     
       6 2024-02-10     NA <NA>       16    16 ALT     
       7 2024-02-10     NA <NA>       19    19 ALT     
       8 2024-02-10     NA <NA>        2     2 CRP     
       9 2024-02-10     NA <NA>        5     5 CRP     
      10 2024-02-10     NA <NA>        8     8 CRP     
      11 2024-02-10     NA <NA>       11    11 CRP     
      12 2024-02-10     NA <NA>       14    14 CRP     
      13 2024-02-10     NA <NA>       17    17 CRP     
      14 2024-02-10     NA <NA>       20    20 CRP     
      15 2024-02-10     NA <NA>        3     3 IGA     
      16 2024-02-10     NA <NA>        6     6 IGA     
      17 2024-02-10     NA <NA>        9     9 IGA     
      18 2024-02-10     NA <NA>       12    12 IGA     
      19 2024-02-10     NA <NA>       15    15 IGA     
      20 2024-02-10     NA <NA>       18    18 IGA     
      21 2024-02-10     NA <NA>       21    21 IGA     
         LBTEST                               LBCAT      LBSTRESC ASPID
         <fct>                                <fct>      <chr>    <int>
       1 Alanine Aminotransferase Measurement CHEMISTRY  <7         117
       2 Alanine Aminotransferase Measurement CHEMISTRY  <7         157
       3 Alanine Aminotransferase Measurement CHEMISTRY  <7          16
       4 Alanine Aminotransferase Measurement CHEMISTRY  <7         140
       5 Alanine Aminotransferase Measurement CHEMISTRY  <7         122
       6 Alanine Aminotransferase Measurement CHEMISTRY  <7          41
       7 Alanine Aminotransferase Measurement CHEMISTRY  <7          38
       8 C-Reactive Protein Measurement       CHEMISTRY  <8         179
       9 C-Reactive Protein Measurement       CHEMISTRY  <8          25
      10 C-Reactive Protein Measurement       CHEMISTRY  <8          60
      11 C-Reactive Protein Measurement       CHEMISTRY  <8         128
      12 C-Reactive Protein Measurement       CHEMISTRY  <8          95
      13 C-Reactive Protein Measurement       CHEMISTRY  <8          22
      14 C-Reactive Protein Measurement       CHEMISTRY  <8          67
      15 Immunoglobulin A Measurement         IMMUNOLOGY >3          18
      16 Immunoglobulin A Measurement         IMMUNOLOGY >3         192
      17 Immunoglobulin A Measurement         IMMUNOLOGY >3          70
      18 Immunoglobulin A Measurement         IMMUNOLOGY >3         186
      19 Immunoglobulin A Measurement         IMMUNOLOGY >3          20
      20 Immunoglobulin A Measurement         IMMUNOLOGY >3         137
      21 Immunoglobulin A Measurement         IMMUNOLOGY >3         194
         PARAM                                PARAMCD  AVAL AVALU BASE2  BASE BASETYPE
         <fct>                                <fct>   <dbl> <fct> <dbl> <dbl> <fct>   
       1 Alanine Aminotransferase Measurement ALT     14.9  U/L   14.9  NA    LAST    
       2 Alanine Aminotransferase Measurement ALT     25.6  U/L   14.9  25.6  LAST    
       3 Alanine Aminotransferase Measurement ALT     39.7  U/L   14.9  25.6  LAST    
       4 Alanine Aminotransferase Measurement ALT     13.3  U/L   14.9  25.6  LAST    
       5 Alanine Aminotransferase Measurement ALT     14.8  U/L   14.9  25.6  LAST    
       6 Alanine Aminotransferase Measurement ALT     36.7  U/L   14.9  25.6  LAST    
       7 Alanine Aminotransferase Measurement ALT      8.74 U/L   14.9  25.6  LAST    
       8 C-Reactive Protein Measurement       CRP      9.26 mg/L   9.26 NA    LAST    
       9 C-Reactive Protein Measurement       CRP      8.57 mg/L   9.26  8.57 LAST    
      10 C-Reactive Protein Measurement       CRP     10.0  mg/L   9.26  8.57 LAST    
      11 C-Reactive Protein Measurement       CRP      9.49 mg/L   9.26  8.57 LAST    
      12 C-Reactive Protein Measurement       CRP     10.9  mg/L   9.26  8.57 LAST    
      13 C-Reactive Protein Measurement       CRP     10.8  mg/L   9.26  8.57 LAST    
      14 C-Reactive Protein Measurement       CRP      8.30 mg/L   9.26  8.57 LAST    
      15 Immunoglobulin A Measurement         IGA      2.67 g/L    2.67 NA    LAST    
      16 Immunoglobulin A Measurement         IGA      2.90 g/L    2.67  2.90 LAST    
      17 Immunoglobulin A Measurement         IGA      2.79 g/L    2.67  2.90 LAST    
      18 Immunoglobulin A Measurement         IGA      2.87 g/L    2.67  2.90 LAST    
      19 Immunoglobulin A Measurement         IGA      2.99 g/L    2.67  2.90 LAST    
      20 Immunoglobulin A Measurement         IGA      2.82 g/L    2.67  2.90 LAST    
      21 Immunoglobulin A Measurement         IGA      3.04 g/L    2.67  2.90 LAST    
         ABLFL2 ABLFL   CHG2  PCHG2      CHG    PCHG DTYPE ANRIND BNRIND
         <fct>  <fct>  <dbl>  <dbl>    <dbl>   <dbl> <lgl> <fct>  <fct> 
       1 "Y"    ""     0       0     NA       NA     NA    NORMAL NORMAL
       2 ""     "Y"   10.7    71.5    0        0     NA    NORMAL NORMAL
       3 ""     ""    24.8   166.    14.1     55.0   NA    NORMAL NORMAL
       4 ""     ""    -1.68  -11.2  -12.4    -48.2   NA    NORMAL NORMAL
       5 ""     ""    -0.189  -1.26 -10.9    -42.4   NA    NORMAL NORMAL
       6 ""     ""    21.7   146.    11.1     43.2   NA    NORMAL NORMAL
       7 ""     ""    -6.21  -41.5  -16.9    -65.9   NA    NORMAL NORMAL
       8 "Y"    ""     0       0     NA       NA     NA    NORMAL NORMAL
       9 ""     "Y"   -0.688  -7.43   0        0     NA    NORMAL NORMAL
      10 ""     ""     0.742   8.01   1.43    16.7   NA    HIGH   NORMAL
      11 ""     ""     0.231   2.50   0.920   10.7   NA    NORMAL NORMAL
      12 ""     ""     1.62   17.5    2.31    27.0   NA    HIGH   NORMAL
      13 ""     ""     1.50   16.2    2.19    25.5   NA    HIGH   NORMAL
      14 ""     ""    -0.961 -10.4   -0.272   -3.18  NA    NORMAL NORMAL
      15 "Y"    ""     0       0     NA       NA     NA    NORMAL NORMAL
      16 ""     "Y"    0.231   8.68   0        0     NA    NORMAL NORMAL
      17 ""     ""     0.123   4.61  -0.109   -3.75  NA    NORMAL NORMAL
      18 ""     ""     0.204   7.64  -0.0279  -0.963 NA    NORMAL NORMAL
      19 ""     ""     0.324  12.2    0.0928   3.20  NA    NORMAL NORMAL
      20 ""     ""     0.158   5.93  -0.0735  -2.54  NA    NORMAL NORMAL
      21 ""     ""     0.371  13.9    0.139    4.80  NA    HIGH   NORMAL
         SHIFT1             ATOXGR BTOXGR ADTM                  ADY ATPTN
         <fct>              <fct>  <fct>  <dttm>              <int> <int>
       1 ""                 0      0      2021-01-23 22:43:53     6     1
       2 ""                 0      0      2021-06-04 22:43:53   138     1
       3 "NORMAL to NORMAL" 0      0      2021-09-16 22:43:53   242     1
       4 "NORMAL to NORMAL" 0      0      2022-08-17 22:43:53   577     1
       5 "NORMAL to NORMAL" 0      0      2023-03-26 22:43:53   798     1
       6 "NORMAL to NORMAL" 0      0      2023-04-01 22:43:53   804     1
       7 "NORMAL to NORMAL" 0      0      2024-01-14 22:43:53  1092     1
       8 ""                 0      0      2021-01-23 22:43:53     6     1
       9 ""                 0      0      2021-06-04 22:43:53   138     1
      10 "NORMAL to HIGH"   3      0      2021-09-16 22:43:53   242     1
      11 "NORMAL to NORMAL" 0      0      2022-08-17 22:43:53   577     1
      12 "NORMAL to HIGH"   1      0      2023-03-26 22:43:53   798     1
      13 "NORMAL to HIGH"   1      0      2023-04-01 22:43:53   804     1
      14 "NORMAL to NORMAL" 0      0      2024-01-14 22:43:53  1092     1
      15 ""                 0      0      2021-01-23 22:43:53     6     1
      16 ""                 0      0      2021-06-04 22:43:53   138     1
      17 "NORMAL to NORMAL" 0      0      2021-09-16 22:43:53   242     1
      18 "NORMAL to NORMAL" 0      0      2022-08-17 22:43:53   577     1
      19 "NORMAL to NORMAL" 0      0      2023-03-26 22:43:53   798     1
      20 "NORMAL to NORMAL" 0      0      2023-04-01 22:43:53   804     1
      21 "NORMAL to HIGH"   1      0      2024-01-14 22:43:53  1092     1
         AVISIT        AVISITN LOQFL ONTRTFL WORS01FL WGRHIFL WGRLOFL WGRHIVFL
         <fct>           <int> <fct> <fct>   <fct>    <fct>   <fct>   <fct>   
       1 SCREENING          -1 N     ""      ""       ""      ""      ""      
       2 BASELINE            0 N     ""      ""       ""      ""      ""      
       3 WEEK 1 DAY 8        1 N     "Y"     "Y"      "Y"     "Y"     "Y"     
       4 WEEK 2 DAY 15       2 N     "Y"     "Y"      ""      ""      "Y"     
       5 WEEK 3 DAY 22       3 N     "Y"     "Y"      ""      ""      "Y"     
       6 WEEK 4 DAY 29       4 N     "Y"     "Y"      ""      ""      "Y"     
       7 WEEK 5 DAY 36       5 N     "Y"     "Y"      ""      ""      "Y"     
       8 SCREENING          -1 N     ""      ""       ""      ""      ""      
       9 BASELINE            0 N     ""      ""       ""      ""      ""      
      10 WEEK 1 DAY 8        1 N     "Y"     "Y"      "Y"     ""      "Y"     
      11 WEEK 2 DAY 15       2 N     "Y"     "Y"      ""      "Y"     "Y"     
      12 WEEK 3 DAY 22       3 N     "Y"     "Y"      ""      ""      "Y"     
      13 WEEK 4 DAY 29       4 N     "Y"     "Y"      ""      ""      "Y"     
      14 WEEK 5 DAY 36       5 N     "Y"     "Y"      ""      ""      "Y"     
      15 SCREENING          -1 N     ""      ""       ""      ""      ""      
      16 BASELINE            0 N     ""      ""       ""      ""      ""      
      17 WEEK 1 DAY 8        1 N     "Y"     "Y"      ""      "Y"     "Y"     
      18 WEEK 2 DAY 15       2 N     "Y"     "Y"      ""      ""      "Y"     
      19 WEEK 3 DAY 22       3 N     "Y"     "Y"      ""      ""      "Y"     
      20 WEEK 4 DAY 29       4 N     "Y"     "Y"      ""      ""      "Y"     
      21 WEEK 5 DAY 36       5 Y     "Y"     "Y"      "Y"     ""      "Y"     
         WGRLOVFL ANL01FL ANRLO ANRHI BTOXGRL BTOXGRH ATOXGRL   ATOXGRH ATOXDSCL
         <fct>    <fct>   <dbl> <dbl> <fct>   <fct>   <fct>     <fct>   <chr>   
       1 ""       ""        7      55 0       0       0         0       <NA>    
       2 ""       "Y"       7      55 0       0       0         0       <NA>    
       3 "Y"      "Y"       7      55 0       0       0         0       <NA>    
       4 "Y"      "Y"       7      55 0       0       0         0       <NA>    
       5 "Y"      "Y"       7      55 0       0       0         0       <NA>    
       6 "Y"      "Y"       7      55 0       0       0         0       <NA>    
       7 "Y"      "Y"       7      55 0       0       0         0       <NA>    
       8 ""       ""        8      10 0       0       0         0       <NA>    
       9 ""       "Y"       8      10 0       0       0         0       <NA>    
      10 "Y"      "Y"       8      10 0       0       <Missing> 3       <NA>    
      11 "Y"      "Y"       8      10 0       0       0         0       <NA>    
      12 "Y"      "Y"       8      10 0       0       <Missing> 1       <NA>    
      13 "Y"      "Y"       8      10 0       0       <Missing> 1       <NA>    
      14 "Y"      "Y"       8      10 0       0       0         0       <NA>    
      15 ""       ""        0.8     3 0       0       0         0       <NA>    
      16 ""       "Y"       0.8     3 0       0       0         0       <NA>    
      17 "Y"      "Y"       0.8     3 0       0       0         0       <NA>    
      18 "Y"      "Y"       0.8     3 0       0       0         0       <NA>    
      19 "Y"      "Y"       0.8     3 0       0       0         0       <NA>    
      20 "Y"      "Y"       0.8     3 0       0       0         0       <NA>    
      21 "Y"      "Y"       0.8     3 0       0       <Missing> 1       <NA>    
         ATOXDSCH                          
         <chr>                             
       1 Alanine aminotransferase increased
       2 Alanine aminotransferase increased
       3 Alanine aminotransferase increased
       4 Alanine aminotransferase increased
       5 Alanine aminotransferase increased
       6 Alanine aminotransferase increased
       7 Alanine aminotransferase increased
       8 C reactive protein increased      
       9 C reactive protein increased      
      10 C reactive protein increased      
      11 C reactive protein increased      
      12 C reactive protein increased      
      13 C reactive protein increased      
      14 C reactive protein increased      
      15 Immunoglobulin A increased        
      16 Immunoglobulin A increased        
      17 Immunoglobulin A increased        
      18 Immunoglobulin A increased        
      19 Immunoglobulin A increased        
      20 Immunoglobulin A increased        
      21 Immunoglobulin A increased        

---

    Code
      rand_rows
    Output
      # A tibble: 10 x 102
         STUDYID USUBJID             SUBJID SITEID   AGE AGEU  SEX  
         <chr>   <chr>               <chr>  <chr>  <int> <fct> <fct>
       1 AB12345 AB12345-CHN-3-id-10 id-10  CHN-3     35 YEARS M    
       2 AB12345 AB12345-CHN-3-id-10 id-10  CHN-3     35 YEARS M    
       3 AB12345 AB12345-USA-13-id-3 id-3   USA-13    35 YEARS F    
       4 AB12345 AB12345-JPN-4-id-7  id-7   JPN-4     30 YEARS F    
       5 AB12345 AB12345-RUS-1-id-4  id-4   RUS-1     36 YEARS M    
       6 AB12345 AB12345-CHN-3-id-5  id-5   CHN-3     36 YEARS F    
       7 AB12345 AB12345-BRA-1-id-9  id-9   BRA-1     35 YEARS F    
       8 AB12345 AB12345-BRA-9-id-8  id-8   BRA-9     31 YEARS F    
       9 AB12345 AB12345-CHN-3-id-5  id-5   CHN-3     36 YEARS F    
      10 AB12345 AB12345-CHN-11-id-2 id-2   CHN-11    35 YEARS M    
         RACE                             ETHNIC                 COUNTRY DTHFL
         <fct>                            <fct>                  <fct>   <fct>
       1 ASIAN                            NOT HISPANIC OR LATINO CHN     N    
       2 ASIAN                            NOT HISPANIC OR LATINO CHN     N    
       3 AMERICAN INDIAN OR ALASKA NATIVE NOT HISPANIC OR LATINO USA     N    
       4 ASIAN                            NOT HISPANIC OR LATINO JPN     N    
       5 BLACK OR AFRICAN AMERICAN        NOT HISPANIC OR LATINO RUS     N    
       6 ASIAN                            NOT HISPANIC OR LATINO CHN     N    
       7 BLACK OR AFRICAN AMERICAN        UNKNOWN                BRA     N    
       8 ASIAN                            NOT HISPANIC OR LATINO BRA     Y    
       9 ASIAN                            NOT HISPANIC OR LATINO CHN     N    
      10 BLACK OR AFRICAN AMERICAN        NOT HISPANIC OR LATINO CHN     N    
         INVID         INVNAM         ARM            ARMCD ACTARM         ACTARMCD
         <chr>         <chr>          <fct>          <fct> <fct>          <fct>   
       1 INV ID CHN-3  Dr. CHN-3 Doe  B: Placebo     ARM B B: Placebo     ARM B   
       2 INV ID CHN-3  Dr. CHN-3 Doe  B: Placebo     ARM B B: Placebo     ARM B   
       3 INV ID USA-13 Dr. USA-13 Doe A: Drug X      ARM A A: Drug X      ARM A   
       4 INV ID JPN-4  Dr. JPN-4 Doe  A: Drug X      ARM A A: Drug X      ARM A   
       5 INV ID RUS-1  Dr. RUS-1 Doe  B: Placebo     ARM B B: Placebo     ARM B   
       6 INV ID CHN-3  Dr. CHN-3 Doe  A: Drug X      ARM A A: Drug X      ARM A   
       7 INV ID BRA-1  Dr. BRA-1 Doe  C: Combination ARM C C: Combination ARM C   
       8 INV ID BRA-9  Dr. BRA-9 Doe  A: Drug X      ARM A A: Drug X      ARM A   
       9 INV ID CHN-3  Dr. CHN-3 Doe  A: Drug X      ARM A A: Drug X      ARM A   
      10 INV ID CHN-11 Dr. CHN-11 Doe A: Drug X      ARM A A: Drug X      ARM A   
         TRT01P         TRT01A         TRT02P         TRT02A         REGION1      
         <fct>          <fct>          <fct>          <fct>          <fct>        
       1 B: Placebo     B: Placebo     A: Drug X      A: Drug X      Asia         
       2 B: Placebo     B: Placebo     A: Drug X      A: Drug X      Asia         
       3 A: Drug X      A: Drug X      B: Placebo     A: Drug X      North America
       4 A: Drug X      A: Drug X      C: Combination B: Placebo     Asia         
       5 B: Placebo     B: Placebo     A: Drug X      A: Drug X      Eurasia      
       6 A: Drug X      A: Drug X      A: Drug X      C: Combination Asia         
       7 C: Combination C: Combination A: Drug X      C: Combination South America
       8 A: Drug X      A: Drug X      A: Drug X      A: Drug X      South America
       9 A: Drug X      A: Drug X      A: Drug X      C: Combination Asia         
      10 A: Drug X      A: Drug X      A: Drug X      A: Drug X      Asia         
         STRATA1 STRATA2 BMRKR1 BMRKR2 ITTFL SAFFL BMEASIFL BEP01FL AEWITHFL
         <fct>   <fct>    <dbl> <fct>  <fct> <fct> <fct>    <fct>   <fct>   
       1 A       S1        1.78 LOW    Y     Y     N        Y       N       
       2 A       S1        1.78 LOW    Y     Y     N        Y       N       
       3 C       S1        7.25 LOW    Y     Y     Y        N       N       
       4 B       S1        7.46 MEDIUM Y     Y     Y        N       N       
       5 A       S1        9.95 MEDIUM Y     Y     Y        N       N       
       6 A       S2        2.62 LOW    Y     Y     Y        N       N       
       7 A       S1        6.92 HIGH   Y     Y     Y        N       N       
       8 B       S2       11.3  MEDIUM Y     Y     Y        Y       N       
       9 A       S2        2.62 LOW    Y     Y     Y        N       N       
      10 C       S2        4.08 HIGH   Y     Y     Y        Y       N       
         RANDDT     TRTSDTM             TRTEDTM             TRT01SDTM          
         <date>     <dttm>              <dttm>              <dttm>             
       1 2019-03-24 2019-03-28 12:07:16 2022-03-28 06:07:16 2019-03-28 12:07:16
       2 2019-03-24 2019-03-28 12:07:16 2022-03-28 06:07:16 2019-03-28 12:07:16
       3 2019-10-16 2019-10-17 17:56:02 2022-10-17 11:56:02 2019-10-17 17:56:02
       4 2019-09-22 2019-09-22 02:25:18 2022-09-21 20:25:18 2019-09-22 02:25:18
       5 2020-08-27 2020-08-28 20:42:09 2022-01-23 08:46:48 2020-08-28 20:42:09
       6 2020-06-24 2020-06-27 04:48:00 2023-06-27 22:48:00 2020-06-27 04:48:00
       7 2021-01-17 2021-01-17 22:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       8 2020-01-18 2020-01-21 10:19:08 2021-10-16 19:37:36 2020-01-21 10:19:08
       9 2020-06-24 2020-06-27 04:48:00 2023-06-27 22:48:00 2020-06-27 04:48:00
      10 2020-02-23 2020-02-26 18:15:59 NA                  2020-02-26 18:15:59
         TRT01EDTM           TRT02SDTM           TRT02EDTM          
         <dttm>              <dttm>              <dttm>             
       1 2021-03-28 00:07:16 2021-03-28 00:07:16 2022-03-28 06:07:16
       2 2021-03-28 00:07:16 2021-03-28 00:07:16 2022-03-28 06:07:16
       3 2021-10-17 05:56:02 2021-10-17 05:56:02 2022-10-17 11:56:02
       4 2021-09-21 14:25:18 2021-09-21 14:25:18 2022-09-21 20:25:18
       5 2021-01-23 02:46:48 2021-01-23 02:46:48 2022-01-23 08:46:48
       6 2022-06-27 16:48:00 2022-06-27 16:48:00 2023-06-27 22:48:00
       7 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53
       8 2020-10-16 13:37:36 2020-10-16 13:37:36 2021-10-16 19:37:36
       9 2022-06-27 16:48:00 2022-06-27 16:48:00 2023-06-27 22:48:00
      10 NA                  NA                  NA                 
         AP01SDTM            AP01EDTM            AP02SDTM           
         <dttm>              <dttm>              <dttm>             
       1 2019-03-28 12:07:16 2021-03-28 00:07:16 2021-03-28 00:07:16
       2 2019-03-28 12:07:16 2021-03-28 00:07:16 2021-03-28 00:07:16
       3 2019-10-17 17:56:02 2021-10-17 05:56:02 2021-10-17 05:56:02
       4 2019-09-22 02:25:18 2021-09-21 14:25:18 2021-09-21 14:25:18
       5 2020-08-28 20:42:09 2021-01-23 02:46:48 2021-01-23 02:46:48
       6 2020-06-27 04:48:00 2022-06-27 16:48:00 2022-06-27 16:48:00
       7 2021-01-17 22:43:53 2023-01-18 10:43:53 2023-01-18 10:43:53
       8 2020-01-21 10:19:08 2020-10-16 13:37:36 2020-10-16 13:37:36
       9 2020-06-27 04:48:00 2022-06-27 16:48:00 2022-06-27 16:48:00
      10 2020-02-26 18:15:59 NA                  NA                 
         AP02EDTM            EOSSTT       EOTSTT       EOSDT      EOSDY DCSREAS      
         <dttm>              <fct>        <fct>        <date>     <int> <fct>        
       1 2022-03-28 06:07:16 COMPLETED    COMPLETED    2022-03-28  1096 <NA>         
       2 2022-03-28 06:07:16 COMPLETED    COMPLETED    2022-03-28  1096 <NA>         
       3 2022-10-17 11:56:02 COMPLETED    COMPLETED    2022-10-17  1096 <NA>         
       4 2022-09-21 20:25:18 COMPLETED    COMPLETED    2022-09-21  1096 <NA>         
       5 2022-01-23 08:46:48 DISCONTINUED DISCONTINUED 2022-01-23   513 ADVERSE EVENT
       6 2023-06-27 22:48:00 COMPLETED    COMPLETED    2023-06-27  1096 <NA>         
       7 2024-01-18 16:43:53 COMPLETED    COMPLETED    2024-01-18  1096 <NA>         
       8 2021-10-16 19:37:36 DISCONTINUED DISCONTINUED 2021-10-16   635 DEATH        
       9 2023-06-27 22:48:00 COMPLETED    COMPLETED    2023-06-27  1096 <NA>         
      10 NA                  ONGOING      ONGOING      NA            NA <NA>         
         DTHDT      DTHCAUS             DTHCAT              LDDTHELD LDDTHGR1
         <date>     <fct>               <fct>                  <int> <fct>   
       1 NA         <NA>                <NA>                      NA <NA>    
       2 NA         <NA>                <NA>                      NA <NA>    
       3 NA         <NA>                <NA>                      NA <NA>    
       4 NA         <NA>                <NA>                      NA <NA>    
       5 NA         <NA>                <NA>                      NA <NA>    
       6 NA         <NA>                <NA>                      NA <NA>    
       7 NA         <NA>                <NA>                      NA <NA>    
       8 2021-11-23 DISEASE PROGRESSION PROGRESSIVE DISEASE       38 >30     
       9 NA         <NA>                <NA>                      NA <NA>    
      10 NA         <NA>                <NA>                      NA <NA>    
         LSTALVDT   DTHADY ADTHAUT  ASEQ LBSEQ LBTESTCD
         <date>      <int> <fct>   <int> <int> <fct>   
       1 2022-04-14     NA <NA>       20    20 CRP     
       2 2022-04-14     NA <NA>       14    14 CRP     
       3 2022-10-30     NA <NA>        4     4 ALT     
       4 2022-10-09     NA <NA>       21    21 IGA     
       5 2022-02-12     NA <NA>       13    13 ALT     
       6 2023-07-10     NA <NA>       14    14 CRP     
       7 2024-02-10     NA <NA>        5     5 CRP     
       8 2021-11-23    671 Yes        18    18 IGA     
       9 2023-07-10     NA <NA>        4     4 ALT     
      10 NA             NA <NA>        5     5 CRP     
         LBTEST                               LBCAT      LBSTRESC ASPID
         <fct>                                <fct>      <chr>    <int>
       1 C-Reactive Protein Measurement       CHEMISTRY  <8          11
       2 C-Reactive Protein Measurement       CHEMISTRY  <8          49
       3 Alanine Aminotransferase Measurement CHEMISTRY  <7          84
       4 Immunoglobulin A Measurement         IMMUNOLOGY >3          19
       5 Alanine Aminotransferase Measurement CHEMISTRY  <7         158
       6 C-Reactive Protein Measurement       CHEMISTRY  <8         195
       7 C-Reactive Protein Measurement       CHEMISTRY  <8          25
       8 Immunoglobulin A Measurement         IMMUNOLOGY >3         114
       9 Alanine Aminotransferase Measurement CHEMISTRY  <7         207
      10 C-Reactive Protein Measurement       CHEMISTRY  <8          62
         PARAM                                PARAMCD  AVAL AVALU BASE2  BASE BASETYPE
         <fct>                                <fct>   <dbl> <fct> <dbl> <dbl> <fct>   
       1 C-Reactive Protein Measurement       CRP     10.1  mg/L   7.27  9.14 LAST    
       2 C-Reactive Protein Measurement       CRP      9.74 mg/L   7.27  9.14 LAST    
       3 Alanine Aminotransferase Measurement ALT     21.9  U/L    9.64 21.9  LAST    
       4 Immunoglobulin A Measurement         IGA      2.72 g/L    3.08  2.74 LAST    
       5 Alanine Aminotransferase Measurement ALT     17.6  U/L   25.4  17.4  LAST    
       6 C-Reactive Protein Measurement       CRP      9.92 mg/L   8.67  6.60 LAST    
       7 C-Reactive Protein Measurement       CRP      8.57 mg/L   9.26  8.57 LAST    
       8 Immunoglobulin A Measurement         IGA      2.80 g/L    2.99  2.94 LAST    
       9 Alanine Aminotransferase Measurement ALT     14.1  U/L   22.9  14.1  LAST    
      10 C-Reactive Protein Measurement       CRP      9.70 mg/L   7.84  9.70 LAST    
         ABLFL2 ABLFL   CHG2  PCHG2     CHG   PCHG DTYPE ANRIND BNRIND
         <fct>  <fct>  <dbl>  <dbl>   <dbl>  <dbl> <lgl> <fct>  <fct> 
       1 ""     ""     2.81   38.6   0.938  10.3   NA    HIGH   NORMAL
       2 ""     ""     2.47   34.0   0.603   6.60  NA    NORMAL NORMAL
       3 ""     "Y"   12.2   127.    0       0     NA    NORMAL NORMAL
       4 ""     ""    -0.356 -11.6  -0.0168 -0.614 NA    NORMAL NORMAL
       5 ""     ""    -7.76  -30.6   0.217   1.25  NA    NORMAL NORMAL
       6 ""     ""     1.25   14.4   3.32   50.3   NA    NORMAL LOW   
       7 ""     "Y"   -0.688  -7.43  0       0     NA    NORMAL NORMAL
       8 ""     ""    -0.189  -6.33 -0.148  -5.02  NA    NORMAL NORMAL
       9 ""     "Y"   -8.82  -38.5   0       0     NA    NORMAL NORMAL
      10 ""     "Y"    1.85   23.6   0       0     NA    NORMAL NORMAL
         SHIFT1             ATOXGR BTOXGR ADTM                  ADY ATPTN
         <fct>              <fct>  <fct>  <dttm>              <int> <int>
       1 "NORMAL to HIGH"   4      0      2022-02-16 12:07:16  1056     1
       2 "NORMAL to NORMAL" 0      0      2021-07-14 12:07:16   839     1
       3 ""                 0      0      2020-09-07 17:56:02   326     1
       4 "NORMAL to NORMAL" 0      0      2022-02-01 02:25:18   863     1
       5 "NORMAL to NORMAL" 0      0      2021-09-26 20:42:09   394     1
       6 "LOW to NORMAL"    0      -2     2022-07-06 04:48:00   739     1
       7 ""                 0      0      2021-06-04 22:43:53   138     1
       8 "NORMAL to NORMAL" 0      0      2021-10-11 10:19:08   629     1
       9 ""                 0      0      2021-11-01 04:48:00   492     1
      10 ""                 0      0      2020-08-28 18:15:59   184     1
         AVISIT        AVISITN LOQFL ONTRTFL WORS01FL WGRHIFL WGRLOFL WGRHIVFL
         <fct>           <int> <fct> <fct>   <fct>    <fct>   <fct>   <fct>   
       1 WEEK 5 DAY 36       5 N     "Y"     "Y"      "Y"     ""      "Y"     
       2 WEEK 3 DAY 22       3 N     "Y"     "Y"      ""      ""      "Y"     
       3 BASELINE            0 N     ""      ""       ""      ""      ""      
       4 WEEK 5 DAY 36       5 N     "Y"     "Y"      ""      ""      "Y"     
       5 WEEK 3 DAY 22       3 N     "Y"     "Y"      ""      ""      "Y"     
       6 WEEK 3 DAY 22       3 N     "Y"     "Y"      ""      ""      "Y"     
       7 BASELINE            0 N     ""      ""       ""      ""      ""      
       8 WEEK 4 DAY 29       4 N     "Y"     "Y"      ""      ""      "Y"     
       9 BASELINE            0 N     ""      ""       ""      ""      ""      
      10 BASELINE            0 N     ""      ""       ""      ""      ""      
         WGRLOVFL ANL01FL ANRLO ANRHI BTOXGRL BTOXGRH   ATOXGRL   ATOXGRH ATOXDSCL
         <fct>    <fct>   <dbl> <dbl> <fct>   <fct>     <fct>     <fct>   <chr>   
       1 "Y"      Y         8      10 0       0         <Missing> 4       <NA>    
       2 "Y"      Y         8      10 0       0         0         0       <NA>    
       3 ""       Y         7      55 0       0         0         0       <NA>    
       4 "Y"      Y         0.8     3 0       0         0         0       <NA>    
       5 "Y"      Y         7      55 0       0         0         0       <NA>    
       6 "Y"      Y         8      10 2       <Missing> 0         0       <NA>    
       7 ""       Y         8      10 0       0         0         0       <NA>    
       8 "Y"      Y         0.8     3 0       0         0         0       <NA>    
       9 ""       Y         7      55 0       0         0         0       <NA>    
      10 ""       Y         8      10 0       0         0         0       <NA>    
         ATOXDSCH                          
         <chr>                             
       1 C reactive protein increased      
       2 C reactive protein increased      
       3 Alanine aminotransferase increased
       4 Immunoglobulin A increased        
       5 Alanine aminotransferase increased
       6 C reactive protein increased      
       7 C reactive protein increased      
       8 Immunoglobulin A increased        
       9 Alanine aminotransferase increased
      10 C reactive protein increased      

# radmh produces expected values

    Code
      first_pt_rows
    Output
      # A tibble: 7 x 67
        STUDYID USUBJID            SUBJID SITEID   AGE AGEU  SEX  
        <chr>   <chr>              <chr>  <chr>  <int> <fct> <fct>
      1 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      2 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      3 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      4 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      5 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      6 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      7 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
        RACE                      ETHNIC  COUNTRY DTHFL INVID        INVNAM       
        <fct>                     <fct>   <fct>   <fct> <chr>        <chr>        
      1 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      2 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      3 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      4 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      5 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      6 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      7 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
        ARM            ARMCD ACTARM         ACTARMCD TRT01P         TRT01A        
        <fct>          <fct> <fct>          <fct>    <fct>          <fct>         
      1 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      2 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      3 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      4 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      5 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      6 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      7 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
        TRT02P    TRT02A         REGION1       STRATA1 STRATA2 BMRKR1 BMRKR2 ITTFL
        <fct>     <fct>          <fct>         <fct>   <fct>    <dbl> <fct>  <fct>
      1 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      2 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      3 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      4 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      5 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      6 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      7 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
        SAFFL BMEASIFL BEP01FL AEWITHFL RANDDT     TRTSDTM            
        <fct> <fct>    <fct>   <fct>    <date>     <dttm>             
      1 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      2 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      3 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      4 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      5 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      6 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      7 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
        TRTEDTM             TRT01SDTM           TRT01EDTM          
        <dttm>              <dttm>              <dttm>             
      1 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      2 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      3 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      4 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      5 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      6 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      7 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
        TRT02SDTM           TRT02EDTM           AP01SDTM           
        <dttm>              <dttm>              <dttm>             
      1 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      2 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      3 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      4 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      5 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      6 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      7 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
        AP01EDTM            AP02SDTM            AP02EDTM            EOSSTT   
        <dttm>              <dttm>              <dttm>              <fct>    
      1 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      2 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      3 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      4 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      5 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      6 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      7 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
        EOTSTT    EOSDT      EOSDY DCSREAS DTHDT  DTHCAUS DTHCAT LDDTHELD LDDTHGR1
        <fct>     <date>     <int> <fct>   <date> <fct>   <fct>     <int> <fct>   
      1 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      2 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      3 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      4 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      5 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      6 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      7 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
        LSTALVDT   DTHADY ADTHAUT  ASEQ MHSEQ MHTERM    MHDECOD   MHBODSYS MHSOC
        <date>      <int> <fct>   <int> <int> <fct>     <fct>     <fct>    <fct>
      1 2024-02-10     NA <NA>        1     1 trm A_1/2 trm A_1/2 cl A     cl A 
      2 2024-02-10     NA <NA>        2     2 trm D_2/3 trm D_2/3 cl D     cl D 
      3 2024-02-10     NA <NA>        3     3 trm C_2/2 trm C_2/2 cl C     cl C 
      4 2024-02-10     NA <NA>        4     4 trm C_1/2 trm C_1/2 cl C     cl C 
      5 2024-02-10     NA <NA>        5     5 trm D_2/3 trm D_2/3 cl D     cl D 
      6 2024-02-10     NA <NA>        6     6 trm C_2/2 trm C_2/2 cl C     cl C 
      7 2024-02-10     NA <NA>        7     7 trm B_2/3 trm B_2/3 cl B     cl B 
        ASTDTM              AENDTM              ASTDY AENDY MHDISTAT                 
        <dttm>              <dttm>              <int> <int> <fct>                    
      1 2021-05-26 22:43:53 2023-02-12 22:43:53   129   756 Resolved                 
      2 2022-01-28 22:43:53 2023-09-09 22:43:53   376   965 Resolved                 
      3 2022-02-28 22:43:53 2023-06-16 22:43:53   407   880 Resolved                 
      4 2022-04-28 22:43:53 2023-07-26 22:43:53   466   920 Ongoing with treatment   
      5 2022-07-02 22:43:53 2022-09-11 22:43:53   531   602 Ongoing without treatment
      6 2023-07-17 22:43:53 2023-12-28 22:43:53   911  1075 Resolved                 
      7 2023-12-27 22:43:53 2024-01-03 22:43:53  1074  1081 Resolved                 
        ATIREL           
        <fct>            
      1 PRIOR_CONCOMITANT
      2 PRIOR_CONCOMITANT
      3 PRIOR_CONCOMITANT
      4 PRIOR_CONCOMITANT
      5 PRIOR_CONCOMITANT
      6 PRIOR_CONCOMITANT
      7 PRIOR_CONCOMITANT

---

    Code
      rand_rows
    Output
      # A tibble: 10 x 67
         STUDYID USUBJID             SUBJID SITEID   AGE AGEU  SEX  
         <chr>   <chr>               <chr>  <chr>  <int> <fct> <fct>
       1 AB12345 AB12345-CHN-11-id-1 id-1   CHN-11    35 YEARS F    
       2 AB12345 AB12345-RUS-1-id-4  id-4   RUS-1     36 YEARS M    
       3 AB12345 AB12345-CHN-11-id-1 id-1   CHN-11    35 YEARS F    
       4 AB12345 AB12345-CHN-3-id-5  id-5   CHN-3     36 YEARS F    
       5 AB12345 AB12345-CHN-3-id-5  id-5   CHN-3     36 YEARS F    
       6 AB12345 AB12345-BRA-9-id-8  id-8   BRA-9     31 YEARS F    
       7 AB12345 AB12345-RUS-1-id-6  id-6   RUS-1     36 YEARS F    
       8 AB12345 AB12345-RUS-1-id-6  id-6   RUS-1     36 YEARS F    
       9 AB12345 AB12345-JPN-4-id-7  id-7   JPN-4     30 YEARS F    
      10 AB12345 AB12345-CHN-3-id-5  id-5   CHN-3     36 YEARS F    
         RACE                      ETHNIC                 COUNTRY DTHFL INVID        
         <fct>                     <fct>                  <fct>   <fct> <chr>        
       1 WHITE                     NOT HISPANIC OR LATINO CHN     Y     INV ID CHN-11
       2 BLACK OR AFRICAN AMERICAN NOT HISPANIC OR LATINO RUS     N     INV ID RUS-1 
       3 WHITE                     NOT HISPANIC OR LATINO CHN     Y     INV ID CHN-11
       4 ASIAN                     NOT HISPANIC OR LATINO CHN     N     INV ID CHN-3 
       5 ASIAN                     NOT HISPANIC OR LATINO CHN     N     INV ID CHN-3 
       6 ASIAN                     NOT HISPANIC OR LATINO BRA     Y     INV ID BRA-9 
       7 ASIAN                     NOT HISPANIC OR LATINO RUS     N     INV ID RUS-1 
       8 ASIAN                     NOT HISPANIC OR LATINO RUS     N     INV ID RUS-1 
       9 ASIAN                     NOT HISPANIC OR LATINO JPN     N     INV ID JPN-4 
      10 ASIAN                     NOT HISPANIC OR LATINO CHN     N     INV ID CHN-3 
         INVNAM         ARM            ARMCD ACTARM         ACTARMCD TRT01P        
         <chr>          <fct>          <fct> <fct>          <fct>    <fct>         
       1 Dr. CHN-11 Doe C: Combination ARM C C: Combination ARM C    C: Combination
       2 Dr. RUS-1 Doe  B: Placebo     ARM B B: Placebo     ARM B    B: Placebo    
       3 Dr. CHN-11 Doe C: Combination ARM C C: Combination ARM C    C: Combination
       4 Dr. CHN-3 Doe  A: Drug X      ARM A A: Drug X      ARM A    A: Drug X     
       5 Dr. CHN-3 Doe  A: Drug X      ARM A A: Drug X      ARM A    A: Drug X     
       6 Dr. BRA-9 Doe  A: Drug X      ARM A A: Drug X      ARM A    A: Drug X     
       7 Dr. RUS-1 Doe  A: Drug X      ARM A A: Drug X      ARM A    A: Drug X     
       8 Dr. RUS-1 Doe  A: Drug X      ARM A A: Drug X      ARM A    A: Drug X     
       9 Dr. JPN-4 Doe  A: Drug X      ARM A A: Drug X      ARM A    A: Drug X     
      10 Dr. CHN-3 Doe  A: Drug X      ARM A A: Drug X      ARM A    A: Drug X     
         TRT01A         TRT02P         TRT02A         REGION1       STRATA1 STRATA2
         <fct>          <fct>          <fct>          <fct>         <fct>   <fct>  
       1 C: Combination B: Placebo     B: Placebo     Asia          B       S1     
       2 B: Placebo     A: Drug X      A: Drug X      Eurasia       A       S1     
       3 C: Combination B: Placebo     B: Placebo     Asia          B       S1     
       4 A: Drug X      A: Drug X      C: Combination Asia          A       S2     
       5 A: Drug X      A: Drug X      C: Combination Asia          A       S2     
       6 A: Drug X      A: Drug X      A: Drug X      South America B       S2     
       7 A: Drug X      C: Combination A: Drug X      Eurasia       B       S1     
       8 A: Drug X      C: Combination A: Drug X      Eurasia       B       S1     
       9 A: Drug X      C: Combination B: Placebo     Asia          B       S1     
      10 A: Drug X      A: Drug X      C: Combination Asia          A       S2     
         BMRKR1 BMRKR2 ITTFL SAFFL BMEASIFL BEP01FL AEWITHFL RANDDT    
          <dbl> <fct>  <fct> <fct> <fct>    <fct>   <fct>    <date>    
       1   8.93 LOW    Y     Y     N        N       N        2020-04-29
       2   9.95 MEDIUM Y     Y     Y        N       N        2020-08-27
       3   8.93 LOW    Y     Y     N        N       N        2020-04-29
       4   2.62 LOW    Y     Y     Y        N       N        2020-06-24
       5   2.62 LOW    Y     Y     Y        N       N        2020-06-24
       6  11.3  MEDIUM Y     Y     Y        Y       N        2020-01-18
       7   9.34 MEDIUM Y     Y     N        N       N        2020-10-24
       8   9.34 MEDIUM Y     Y     N        N       N        2020-10-24
       9   7.46 MEDIUM Y     Y     Y        N       N        2019-09-22
      10   2.62 LOW    Y     Y     Y        N       N        2020-06-24
         TRTSDTM             TRTEDTM             TRT01SDTM          
         <dttm>              <dttm>              <dttm>             
       1 2020-05-02 02:28:45 2021-09-08 20:09:38 2020-05-02 02:28:45
       2 2020-08-28 20:42:09 2022-01-23 08:46:48 2020-08-28 20:42:09
       3 2020-05-02 02:28:45 2021-09-08 20:09:38 2020-05-02 02:28:45
       4 2020-06-27 04:48:00 2023-06-27 22:48:00 2020-06-27 04:48:00
       5 2020-06-27 04:48:00 2023-06-27 22:48:00 2020-06-27 04:48:00
       6 2020-01-21 10:19:08 2021-10-16 19:37:36 2020-01-21 10:19:08
       7 2020-10-26 22:16:26 2023-10-27 16:16:26 2020-10-26 22:16:26
       8 2020-10-26 22:16:26 2023-10-27 16:16:26 2020-10-26 22:16:26
       9 2019-09-22 02:25:18 2022-09-21 20:25:18 2019-09-22 02:25:18
      10 2020-06-27 04:48:00 2023-06-27 22:48:00 2020-06-27 04:48:00
         TRT01EDTM           TRT02SDTM           TRT02EDTM          
         <dttm>              <dttm>              <dttm>             
       1 2020-09-08 14:09:38 2020-09-08 14:09:38 2021-09-08 20:09:38
       2 2021-01-23 02:46:48 2021-01-23 02:46:48 2022-01-23 08:46:48
       3 2020-09-08 14:09:38 2020-09-08 14:09:38 2021-09-08 20:09:38
       4 2022-06-27 16:48:00 2022-06-27 16:48:00 2023-06-27 22:48:00
       5 2022-06-27 16:48:00 2022-06-27 16:48:00 2023-06-27 22:48:00
       6 2020-10-16 13:37:36 2020-10-16 13:37:36 2021-10-16 19:37:36
       7 2022-10-27 10:16:26 2022-10-27 10:16:26 2023-10-27 16:16:26
       8 2022-10-27 10:16:26 2022-10-27 10:16:26 2023-10-27 16:16:26
       9 2021-09-21 14:25:18 2021-09-21 14:25:18 2022-09-21 20:25:18
      10 2022-06-27 16:48:00 2022-06-27 16:48:00 2023-06-27 22:48:00
         AP01SDTM            AP01EDTM            AP02SDTM           
         <dttm>              <dttm>              <dttm>             
       1 2020-05-02 02:28:45 2020-09-08 14:09:38 2020-09-08 14:09:38
       2 2020-08-28 20:42:09 2021-01-23 02:46:48 2021-01-23 02:46:48
       3 2020-05-02 02:28:45 2020-09-08 14:09:38 2020-09-08 14:09:38
       4 2020-06-27 04:48:00 2022-06-27 16:48:00 2022-06-27 16:48:00
       5 2020-06-27 04:48:00 2022-06-27 16:48:00 2022-06-27 16:48:00
       6 2020-01-21 10:19:08 2020-10-16 13:37:36 2020-10-16 13:37:36
       7 2020-10-26 22:16:26 2022-10-27 10:16:26 2022-10-27 10:16:26
       8 2020-10-26 22:16:26 2022-10-27 10:16:26 2022-10-27 10:16:26
       9 2019-09-22 02:25:18 2021-09-21 14:25:18 2021-09-21 14:25:18
      10 2020-06-27 04:48:00 2022-06-27 16:48:00 2022-06-27 16:48:00
         AP02EDTM            EOSSTT       EOTSTT       EOSDT      EOSDY DCSREAS      
         <dttm>              <fct>        <fct>        <date>     <int> <fct>        
       1 2021-09-08 20:09:38 DISCONTINUED DISCONTINUED 2021-09-08   495 DEATH        
       2 2022-01-23 08:46:48 DISCONTINUED DISCONTINUED 2022-01-23   513 ADVERSE EVENT
       3 2021-09-08 20:09:38 DISCONTINUED DISCONTINUED 2021-09-08   495 DEATH        
       4 2023-06-27 22:48:00 COMPLETED    COMPLETED    2023-06-27  1096 <NA>         
       5 2023-06-27 22:48:00 COMPLETED    COMPLETED    2023-06-27  1096 <NA>         
       6 2021-10-16 19:37:36 DISCONTINUED DISCONTINUED 2021-10-16   635 DEATH        
       7 2023-10-27 16:16:26 COMPLETED    COMPLETED    2023-10-27  1096 <NA>         
       8 2023-10-27 16:16:26 COMPLETED    COMPLETED    2023-10-27  1096 <NA>         
       9 2022-09-21 20:25:18 COMPLETED    COMPLETED    2022-09-21  1096 <NA>         
      10 2023-06-27 22:48:00 COMPLETED    COMPLETED    2023-06-27  1096 <NA>         
         DTHDT      DTHCAUS             DTHCAT              LDDTHELD LDDTHGR1
         <date>     <fct>               <fct>                  <int> <fct>   
       1 2021-09-27 ADVERSE EVENT       ADVERSE EVENT             19 <=30    
       2 NA         <NA>                <NA>                      NA <NA>    
       3 2021-09-27 ADVERSE EVENT       ADVERSE EVENT             19 <=30    
       4 NA         <NA>                <NA>                      NA <NA>    
       5 NA         <NA>                <NA>                      NA <NA>    
       6 2021-11-23 DISEASE PROGRESSION PROGRESSIVE DISEASE       38 >30     
       7 NA         <NA>                <NA>                      NA <NA>    
       8 NA         <NA>                <NA>                      NA <NA>    
       9 NA         <NA>                <NA>                      NA <NA>    
      10 NA         <NA>                <NA>                      NA <NA>    
         LSTALVDT   DTHADY ADTHAUT  ASEQ MHSEQ MHTERM    MHDECOD   MHBODSYS MHSOC
         <date>      <int> <fct>   <int> <int> <fct>     <fct>     <fct>    <fct>
       1 2021-09-27    512 Yes         6     6 trm B_2/3 trm B_2/3 cl B     cl B 
       2 2022-02-12     NA <NA>        4     4 trm C_1/2 trm C_1/2 cl C     cl C 
       3 2021-09-27    512 Yes         7     7 trm C_1/2 trm C_1/2 cl C     cl C 
       4 2023-07-10     NA <NA>        2     2 trm C_2/2 trm C_2/2 cl C     cl C 
       5 2023-07-10     NA <NA>        1     1 trm C_1/2 trm C_1/2 cl C     cl C 
       6 2021-11-23    671 Yes         1     1 trm D_3/3 trm D_3/3 cl D     cl D 
       7 2023-11-13     NA <NA>        3     3 trm C_2/2 trm C_2/2 cl C     cl C 
       8 2023-11-13     NA <NA>        6     6 trm C_1/2 trm C_1/2 cl C     cl C 
       9 2022-10-09     NA <NA>        3     3 trm C_1/2 trm C_1/2 cl C     cl C 
      10 2023-07-10     NA <NA>        8     8 trm C_2/2 trm C_2/2 cl C     cl C 
         ASTDTM              AENDTM              ASTDY AENDY MHDISTAT                 
         <dttm>              <dttm>              <int> <int> <fct>                    
       1 2021-02-20 02:28:45 2021-07-29 02:28:45   294   453 Ongoing with treatment   
       2 2021-07-20 20:42:09 2021-09-21 20:42:09   326   389 Resolved                 
       3 2021-02-21 02:28:45 2021-03-08 02:28:45   295   310 Ongoing without treatment
       4 2021-02-14 04:48:00 2021-06-20 04:48:00   232   358 Resolved                 
       5 2020-07-25 04:48:00 2021-12-10 04:48:00    28   531 Ongoing without treatment
       6 2020-06-11 10:19:08 2020-07-20 10:19:08   142   181 Resolved                 
       7 2021-06-01 22:16:26 2023-08-07 22:16:26   218  1015 Resolved                 
       8 2022-11-22 22:16:26 2023-03-18 22:16:26   757   873 Resolved                 
       9 2022-06-07 02:25:18 2022-07-10 02:25:18   989  1022 Resolved                 
      10 2023-05-29 04:48:00 2023-05-29 04:48:00  1066  1066 Resolved                 
         ATIREL           
         <fct>            
       1 PRIOR_CONCOMITANT
       2 PRIOR_CONCOMITANT
       3 PRIOR_CONCOMITANT
       4 PRIOR_CONCOMITANT
       5 PRIOR_CONCOMITANT
       6 PRIOR_CONCOMITANT
       7 PRIOR_CONCOMITANT
       8 PRIOR_CONCOMITANT
       9 PRIOR_CONCOMITANT
      10 PRIOR_CONCOMITANT

# radpc produces expected values

    Code
      first_pt_rows
    Output
      # A tibble: 30 x 71
         STUDYID USUBJID            SUBJID SITEID   AGE AGEU  SEX  
         <chr>   <chr>              <chr>  <chr>  <int> <fct> <fct>
       1 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       2 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       3 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       4 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       5 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       6 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       7 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       8 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       9 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      10 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      11 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      12 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      13 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      14 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      15 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      16 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      17 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      18 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      19 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      20 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      21 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      22 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      23 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      24 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      25 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      26 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      27 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      28 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      29 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      30 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
         RACE                      ETHNIC  COUNTRY DTHFL INVID        INVNAM       
         <fct>                     <fct>   <fct>   <fct> <chr>        <chr>        
       1 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       2 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       3 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       4 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       5 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       6 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       7 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       8 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       9 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      10 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      11 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      12 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      13 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      14 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      15 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      16 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      17 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      18 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      19 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      20 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      21 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      22 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      23 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      24 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      25 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      26 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      27 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      28 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      29 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      30 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
         ARM            ARMCD ACTARM         ACTARMCD TRT01P         TRT01A        
         <fct>          <fct> <fct>          <fct>    <fct>          <fct>         
       1 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       2 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       3 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       4 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       5 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       6 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       7 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       8 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       9 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      10 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      11 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      12 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      13 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      14 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      15 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      16 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      17 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      18 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      19 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      20 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      21 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      22 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      23 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      24 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      25 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      26 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      27 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      28 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      29 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      30 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
         TRT02P    TRT02A         REGION1       STRATA1 STRATA2 BMRKR1 BMRKR2 ITTFL
         <fct>     <fct>          <fct>         <fct>   <fct>    <dbl> <fct>  <fct>
       1 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       2 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       3 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       4 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       5 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       6 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       7 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       8 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       9 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      10 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      11 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      12 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      13 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      14 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      15 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      16 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      17 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      18 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      19 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      20 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      21 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      22 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      23 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      24 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      25 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      26 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      27 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      28 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      29 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      30 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
         SAFFL BMEASIFL BEP01FL AEWITHFL RANDDT     TRTSDTM            
         <fct> <fct>    <fct>   <fct>    <date>     <dttm>             
       1 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       2 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       3 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       4 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       5 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       6 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       7 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       8 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       9 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      10 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      11 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      12 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      13 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      14 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      15 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      16 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      17 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      18 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      19 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      20 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      21 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      22 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      23 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      24 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      25 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      26 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      27 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      28 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      29 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      30 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
         TRTEDTM             TRT01SDTM           TRT01EDTM          
         <dttm>              <dttm>              <dttm>             
       1 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       2 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       3 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       4 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       5 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       6 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       7 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       8 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       9 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      10 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      11 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      12 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      13 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      14 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      15 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      16 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      17 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      18 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      19 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      20 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      21 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      22 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      23 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      24 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      25 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      26 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      27 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      28 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      29 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      30 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
         TRT02SDTM           TRT02EDTM           AP01SDTM           
         <dttm>              <dttm>              <dttm>             
       1 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       2 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       3 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       4 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       5 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       6 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       7 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       8 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       9 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      10 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      11 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      12 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      13 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      14 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      15 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      16 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      17 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      18 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      19 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      20 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      21 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      22 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      23 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      24 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      25 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      26 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      27 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      28 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      29 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      30 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
         AP01EDTM            AP02SDTM            AP02EDTM            EOSSTT   
         <dttm>              <dttm>              <dttm>              <fct>    
       1 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       2 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       3 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       4 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       5 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       6 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       7 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       8 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       9 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      10 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      11 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      12 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      13 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      14 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      15 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      16 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      17 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      18 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      19 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      20 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      21 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      22 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      23 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      24 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      25 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      26 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      27 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      28 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      29 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      30 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
         EOTSTT    EOSDT      EOSDY DCSREAS DTHDT  DTHCAUS DTHCAT LDDTHELD LDDTHGR1
         <fct>     <date>     <int> <fct>   <date> <fct>   <fct>     <int> <fct>   
       1 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       2 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       3 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       4 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       5 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       6 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       7 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       8 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       9 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      10 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      11 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      12 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      13 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      14 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      15 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      16 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      17 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      18 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      19 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      20 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      21 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      22 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      23 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      24 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      25 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      26 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      27 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      28 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      29 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      30 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
         LSTALVDT   DTHADY ADTHAUT NRELTM1 ARELTM1 NRELTM2 ARELTM2 PCTPTNUM PCTPT   
         <date>      <int> <fct>     <dbl>   <dbl>   <dbl>   <dbl>    <dbl> <fct>   
       1 2024-02-10     NA <NA>        0       0       0       0        0   Predose 
       2 2024-02-10     NA <NA>        0.5     0.5     0.5     0.5      0.5 0.5H    
       3 2024-02-10     NA <NA>        1       1       1       1        1   1H      
       4 2024-02-10     NA <NA>        1.5     1.5     1.5     1.5      1.5 1.5H    
       5 2024-02-10     NA <NA>        2       2       2       2        2   2H      
       6 2024-02-10     NA <NA>        3       3       3       3        3   3H      
       7 2024-02-10     NA <NA>        4       4       4       4        4   4H      
       8 2024-02-10     NA <NA>        8       8       8       8        8   8H      
       9 2024-02-10     NA <NA>       12      12      12      12       12   12H     
      10 2024-02-10     NA <NA>        0       0       0       0        0   Predose 
      11 2024-02-10     NA <NA>        0.5     0.5     0.5     0.5      0.5 0.5H    
      12 2024-02-10     NA <NA>        1       1       1       1        1   1H      
      13 2024-02-10     NA <NA>        1.5     1.5     1.5     1.5      1.5 1.5H    
      14 2024-02-10     NA <NA>        2       2       2       2        2   2H      
      15 2024-02-10     NA <NA>        3       3       3       3        3   3H      
      16 2024-02-10     NA <NA>        4       4       4       4        4   4H      
      17 2024-02-10     NA <NA>        8       8       8       8        8   8H      
      18 2024-02-10     NA <NA>       12      12      12      12       12   12H     
      19 2024-02-10     NA <NA>        0       0       0       0        0   Predose 
      20 2024-02-10     NA <NA>        4       4       4       4        4   0H - 4H 
      21 2024-02-10     NA <NA>        8       8       8       8        8   4H - 8H 
      22 2024-02-10     NA <NA>       12      12      12      12       12   8H - 12H
      23 2024-02-10     NA <NA>        0       0       0       0        0   Predose 
      24 2024-02-10     NA <NA>        4       4       4       4        4   0H - 4H 
      25 2024-02-10     NA <NA>        8       8       8       8        8   4H - 8H 
      26 2024-02-10     NA <NA>       12      12      12      12       12   8H - 12H
      27 2024-02-10     NA <NA>       24      24       0       0       24   24H     
      28 2024-02-10     NA <NA>       24      24       0       0       24   24H     
      29 2024-02-10     NA <NA>       24      24       0       0       24   0H - 24H
      30 2024-02-10     NA <NA>       24      24       0       0       24   0H - 24H
         PCVOL PCVOLU   AVAL AVALC  AVALU RELTMU PARAM         ASMED  VISIT VISITDY
         <dbl> <fct>   <dbl> <chr>  <fct> <fct>  <fct>         <fct>  <fct>   <int>
       1   NA  ""      0     BLQ    ug/mL hr     Plasma Drug X PLASMA Day 1       1
       2   NA  ""     15.3   15.3   ug/mL hr     Plasma Drug X PLASMA Day 1       1
       3   NA  ""     19.2   19.205 ug/mL hr     Plasma Drug X PLASMA Day 1       1
       4   NA  ""     18.1   18.082 ug/mL hr     Plasma Drug X PLASMA Day 1       1
       5   NA  ""     15.1   15.136 ug/mL hr     Plasma Drug X PLASMA Day 1       1
       6   NA  ""      8.95  8.953  ug/mL hr     Plasma Drug X PLASMA Day 1       1
       7   NA  ""      4.71  4.71   ug/mL hr     Plasma Drug X PLASMA Day 1       1
       8   NA  ""      0.23  0.23   ug/mL hr     Plasma Drug X PLASMA Day 1       1
       9   NA  ""      0.008 0.008  ug/mL hr     Plasma Drug X PLASMA Day 1       1
      10   NA  ""      0     BLQ    ug/mL hr     Plasma Drug Y PLASMA Day 1       1
      11   NA  ""     30.6   30.6   ug/mL hr     Plasma Drug Y PLASMA Day 1       1
      12   NA  ""     38.4   38.409 ug/mL hr     Plasma Drug Y PLASMA Day 1       1
      13   NA  ""     36.2   36.164 ug/mL hr     Plasma Drug Y PLASMA Day 1       1
      14   NA  ""     30.3   30.272 ug/mL hr     Plasma Drug Y PLASMA Day 1       1
      15   NA  ""     17.9   17.905 ug/mL hr     Plasma Drug Y PLASMA Day 1       1
      16   NA  ""      9.42  9.419  ug/mL hr     Plasma Drug Y PLASMA Day 1       1
      17   NA  ""      0.459 0.459  ug/mL hr     Plasma Drug Y PLASMA Day 1       1
      18   NA  ""      0.017 0.017  ug/mL hr     Plasma Drug Y PLASMA Day 1       1
      19 1122. "mL"    0     BLQ    ug/mL hr     Urine Drug X  URINE  Day 1       1
      20  152. "mL"    4.71  4.71   ug/mL hr     Urine Drug X  URINE  Day 1       1
      21  370. "mL"    0.23  0.23   ug/mL hr     Urine Drug X  URINE  Day 1       1
      22  605. "mL"    0.008 0.008  ug/mL hr     Urine Drug X  URINE  Day 1       1
      23 1122. "mL"    0     BLQ    ug/mL hr     Urine Drug Y  URINE  Day 1       1
      24  152. "mL"    4.71  4.71   ug/mL hr     Urine Drug Y  URINE  Day 1       1
      25  370. "mL"    0.23  0.23   ug/mL hr     Urine Drug Y  URINE  Day 1       1
      26  605. "mL"    0.008 0.008  ug/mL hr     Urine Drug Y  URINE  Day 1       1
      27   NA  ""      0     BLQ    ug/mL hr     Plasma Drug X PLASMA Day 2       2
      28   NA  ""      0     BLQ    ug/mL hr     Plasma Drug Y PLASMA Day 2       2
      29 1055. "mL"    0     BLQ    ug/mL hr     Urine Drug X  URINE  Day 2       2
      30 1055. "mL"    0     BLQ    ug/mL hr     Urine Drug Y  URINE  Day 2       2

---

    Code
      rand_rows
    Output
      # A tibble: 10 x 71
         STUDYID USUBJID             SUBJID SITEID   AGE AGEU  SEX  
         <chr>   <chr>               <chr>  <chr>  <int> <fct> <fct>
       1 AB12345 AB12345-USA-13-id-3 id-3   USA-13    35 YEARS F    
       2 AB12345 AB12345-USA-13-id-3 id-3   USA-13    35 YEARS F    
       3 AB12345 AB12345-CHN-3-id-5  id-5   CHN-3     36 YEARS F    
       4 AB12345 AB12345-CHN-3-id-5  id-5   CHN-3     36 YEARS F    
       5 AB12345 AB12345-CHN-3-id-5  id-5   CHN-3     36 YEARS F    
       6 AB12345 AB12345-CHN-11-id-2 id-2   CHN-11    35 YEARS M    
       7 AB12345 AB12345-BRA-1-id-9  id-9   BRA-1     35 YEARS F    
       8 AB12345 AB12345-JPN-4-id-7  id-7   JPN-4     30 YEARS F    
       9 AB12345 AB12345-RUS-1-id-6  id-6   RUS-1     36 YEARS F    
      10 AB12345 AB12345-JPN-4-id-7  id-7   JPN-4     30 YEARS F    
         RACE                             ETHNIC                 COUNTRY DTHFL
         <fct>                            <fct>                  <fct>   <fct>
       1 AMERICAN INDIAN OR ALASKA NATIVE NOT HISPANIC OR LATINO USA     N    
       2 AMERICAN INDIAN OR ALASKA NATIVE NOT HISPANIC OR LATINO USA     N    
       3 ASIAN                            NOT HISPANIC OR LATINO CHN     N    
       4 ASIAN                            NOT HISPANIC OR LATINO CHN     N    
       5 ASIAN                            NOT HISPANIC OR LATINO CHN     N    
       6 BLACK OR AFRICAN AMERICAN        NOT HISPANIC OR LATINO CHN     N    
       7 BLACK OR AFRICAN AMERICAN        UNKNOWN                BRA     N    
       8 ASIAN                            NOT HISPANIC OR LATINO JPN     N    
       9 ASIAN                            NOT HISPANIC OR LATINO RUS     N    
      10 ASIAN                            NOT HISPANIC OR LATINO JPN     N    
         INVID         INVNAM         ARM            ARMCD ACTARM         ACTARMCD
         <chr>         <chr>          <fct>          <fct> <fct>          <fct>   
       1 INV ID USA-13 Dr. USA-13 Doe A: Drug X      ARM A A: Drug X      ARM A   
       2 INV ID USA-13 Dr. USA-13 Doe A: Drug X      ARM A A: Drug X      ARM A   
       3 INV ID CHN-3  Dr. CHN-3 Doe  A: Drug X      ARM A A: Drug X      ARM A   
       4 INV ID CHN-3  Dr. CHN-3 Doe  A: Drug X      ARM A A: Drug X      ARM A   
       5 INV ID CHN-3  Dr. CHN-3 Doe  A: Drug X      ARM A A: Drug X      ARM A   
       6 INV ID CHN-11 Dr. CHN-11 Doe A: Drug X      ARM A A: Drug X      ARM A   
       7 INV ID BRA-1  Dr. BRA-1 Doe  C: Combination ARM C C: Combination ARM C   
       8 INV ID JPN-4  Dr. JPN-4 Doe  A: Drug X      ARM A A: Drug X      ARM A   
       9 INV ID RUS-1  Dr. RUS-1 Doe  A: Drug X      ARM A A: Drug X      ARM A   
      10 INV ID JPN-4  Dr. JPN-4 Doe  A: Drug X      ARM A A: Drug X      ARM A   
         TRT01P         TRT01A         TRT02P         TRT02A         REGION1      
         <fct>          <fct>          <fct>          <fct>          <fct>        
       1 A: Drug X      A: Drug X      B: Placebo     A: Drug X      North America
       2 A: Drug X      A: Drug X      B: Placebo     A: Drug X      North America
       3 A: Drug X      A: Drug X      A: Drug X      C: Combination Asia         
       4 A: Drug X      A: Drug X      A: Drug X      C: Combination Asia         
       5 A: Drug X      A: Drug X      A: Drug X      C: Combination Asia         
       6 A: Drug X      A: Drug X      A: Drug X      A: Drug X      Asia         
       7 C: Combination C: Combination A: Drug X      C: Combination South America
       8 A: Drug X      A: Drug X      C: Combination B: Placebo     Asia         
       9 A: Drug X      A: Drug X      C: Combination A: Drug X      Eurasia      
      10 A: Drug X      A: Drug X      C: Combination B: Placebo     Asia         
         STRATA1 STRATA2 BMRKR1 BMRKR2 ITTFL SAFFL BMEASIFL BEP01FL AEWITHFL
         <fct>   <fct>    <dbl> <fct>  <fct> <fct> <fct>    <fct>   <fct>   
       1 C       S1        7.25 LOW    Y     Y     Y        N       N       
       2 C       S1        7.25 LOW    Y     Y     Y        N       N       
       3 A       S2        2.62 LOW    Y     Y     Y        N       N       
       4 A       S2        2.62 LOW    Y     Y     Y        N       N       
       5 A       S2        2.62 LOW    Y     Y     Y        N       N       
       6 C       S2        4.08 HIGH   Y     Y     Y        Y       N       
       7 A       S1        6.92 HIGH   Y     Y     Y        N       N       
       8 B       S1        7.46 MEDIUM Y     Y     Y        N       N       
       9 B       S1        9.34 MEDIUM Y     Y     N        N       N       
      10 B       S1        7.46 MEDIUM Y     Y     Y        N       N       
         RANDDT     TRTSDTM             TRTEDTM             TRT01SDTM          
         <date>     <dttm>              <dttm>              <dttm>             
       1 2019-10-16 2019-10-17 17:56:02 2022-10-17 11:56:02 2019-10-17 17:56:02
       2 2019-10-16 2019-10-17 17:56:02 2022-10-17 11:56:02 2019-10-17 17:56:02
       3 2020-06-24 2020-06-27 04:48:00 2023-06-27 22:48:00 2020-06-27 04:48:00
       4 2020-06-24 2020-06-27 04:48:00 2023-06-27 22:48:00 2020-06-27 04:48:00
       5 2020-06-24 2020-06-27 04:48:00 2023-06-27 22:48:00 2020-06-27 04:48:00
       6 2020-02-23 2020-02-26 18:15:59 NA                  2020-02-26 18:15:59
       7 2021-01-17 2021-01-17 22:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       8 2019-09-22 2019-09-22 02:25:18 2022-09-21 20:25:18 2019-09-22 02:25:18
       9 2020-10-24 2020-10-26 22:16:26 2023-10-27 16:16:26 2020-10-26 22:16:26
      10 2019-09-22 2019-09-22 02:25:18 2022-09-21 20:25:18 2019-09-22 02:25:18
         TRT01EDTM           TRT02SDTM           TRT02EDTM          
         <dttm>              <dttm>              <dttm>             
       1 2021-10-17 05:56:02 2021-10-17 05:56:02 2022-10-17 11:56:02
       2 2021-10-17 05:56:02 2021-10-17 05:56:02 2022-10-17 11:56:02
       3 2022-06-27 16:48:00 2022-06-27 16:48:00 2023-06-27 22:48:00
       4 2022-06-27 16:48:00 2022-06-27 16:48:00 2023-06-27 22:48:00
       5 2022-06-27 16:48:00 2022-06-27 16:48:00 2023-06-27 22:48:00
       6 NA                  NA                  NA                 
       7 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53
       8 2021-09-21 14:25:18 2021-09-21 14:25:18 2022-09-21 20:25:18
       9 2022-10-27 10:16:26 2022-10-27 10:16:26 2023-10-27 16:16:26
      10 2021-09-21 14:25:18 2021-09-21 14:25:18 2022-09-21 20:25:18
         AP01SDTM            AP01EDTM            AP02SDTM           
         <dttm>              <dttm>              <dttm>             
       1 2019-10-17 17:56:02 2021-10-17 05:56:02 2021-10-17 05:56:02
       2 2019-10-17 17:56:02 2021-10-17 05:56:02 2021-10-17 05:56:02
       3 2020-06-27 04:48:00 2022-06-27 16:48:00 2022-06-27 16:48:00
       4 2020-06-27 04:48:00 2022-06-27 16:48:00 2022-06-27 16:48:00
       5 2020-06-27 04:48:00 2022-06-27 16:48:00 2022-06-27 16:48:00
       6 2020-02-26 18:15:59 NA                  NA                 
       7 2021-01-17 22:43:53 2023-01-18 10:43:53 2023-01-18 10:43:53
       8 2019-09-22 02:25:18 2021-09-21 14:25:18 2021-09-21 14:25:18
       9 2020-10-26 22:16:26 2022-10-27 10:16:26 2022-10-27 10:16:26
      10 2019-09-22 02:25:18 2021-09-21 14:25:18 2021-09-21 14:25:18
         AP02EDTM            EOSSTT    EOTSTT    EOSDT      EOSDY DCSREAS DTHDT 
         <dttm>              <fct>     <fct>     <date>     <int> <fct>   <date>
       1 2022-10-17 11:56:02 COMPLETED COMPLETED 2022-10-17  1096 <NA>    NA    
       2 2022-10-17 11:56:02 COMPLETED COMPLETED 2022-10-17  1096 <NA>    NA    
       3 2023-06-27 22:48:00 COMPLETED COMPLETED 2023-06-27  1096 <NA>    NA    
       4 2023-06-27 22:48:00 COMPLETED COMPLETED 2023-06-27  1096 <NA>    NA    
       5 2023-06-27 22:48:00 COMPLETED COMPLETED 2023-06-27  1096 <NA>    NA    
       6 NA                  ONGOING   ONGOING   NA            NA <NA>    NA    
       7 2024-01-18 16:43:53 COMPLETED COMPLETED 2024-01-18  1096 <NA>    NA    
       8 2022-09-21 20:25:18 COMPLETED COMPLETED 2022-09-21  1096 <NA>    NA    
       9 2023-10-27 16:16:26 COMPLETED COMPLETED 2023-10-27  1096 <NA>    NA    
      10 2022-09-21 20:25:18 COMPLETED COMPLETED 2022-09-21  1096 <NA>    NA    
         DTHCAUS DTHCAT LDDTHELD LDDTHGR1 LSTALVDT   DTHADY ADTHAUT NRELTM1 ARELTM1
         <fct>   <fct>     <int> <fct>    <date>      <int> <fct>     <dbl>   <dbl>
       1 <NA>    <NA>         NA <NA>     2022-10-30     NA <NA>       24      24  
       2 <NA>    <NA>         NA <NA>     2022-10-30     NA <NA>        4       4  
       3 <NA>    <NA>         NA <NA>     2023-07-10     NA <NA>        8       8  
       4 <NA>    <NA>         NA <NA>     2023-07-10     NA <NA>        4       4  
       5 <NA>    <NA>         NA <NA>     2023-07-10     NA <NA>        4       4  
       6 <NA>    <NA>         NA <NA>     NA             NA <NA>        3       3  
       7 <NA>    <NA>         NA <NA>     2024-02-10     NA <NA>        0.5     0.5
       8 <NA>    <NA>         NA <NA>     2022-10-09     NA <NA>       12      12  
       9 <NA>    <NA>         NA <NA>     2023-11-13     NA <NA>        4       4  
      10 <NA>    <NA>         NA <NA>     2022-10-09     NA <NA>        8       8  
         NRELTM2 ARELTM2 PCTPTNUM PCTPT    PCVOL PCVOLU   AVAL AVALC AVALU RELTMU
           <dbl>   <dbl>    <dbl> <fct>    <dbl> <fct>   <dbl> <chr> <fct> <fct> 
       1     0       0       24   24H       NA   ""      0     BLQ   ug/mL hr    
       2     4       4        4   0H - 4H  120.  "mL"    5.27  5.269 ug/mL hr    
       3     8       8        8   4H - 8H  236.  "mL"    0.665 0.665 ug/mL hr    
       4     4       4        4   0H - 4H   97.1 "mL"    6.11  6.106 ug/mL hr    
       5     4       4        4   4H        NA   ""      6.11  6.106 ug/mL hr    
       6     3       3        3   3H        NA   ""      9.11  9.113 ug/mL hr    
       7     0.5     0.5      0.5 0.5H      NA   ""     15.3   15.3  ug/mL hr    
       8    12      12       12   8H - 12H 528.  "mL"    0.005 0.005 ug/mL hr    
       9     4       4        4   0H - 4H  117.  "mL"    4.37  4.371 ug/mL hr    
      10     8       8        8   8H        NA   ""      0.151 0.151 ug/mL hr    
         PARAM         ASMED  VISIT VISITDY
         <fct>         <fct>  <fct>   <int>
       1 Plasma Drug X PLASMA Day 2       2
       2 Urine Drug X  URINE  Day 1       1
       3 Urine Drug X  URINE  Day 1       1
       4 Urine Drug Y  URINE  Day 1       1
       5 Plasma Drug X PLASMA Day 1       1
       6 Plasma Drug X PLASMA Day 1       1
       7 Plasma Drug X PLASMA Day 1       1
       8 Urine Drug X  URINE  Day 1       1
       9 Urine Drug X  URINE  Day 1       1
      10 Plasma Drug X PLASMA Day 1       1

# radab produces expected values

    Code
      first_pt_rows
    Output
      # A tibble: 220 x 22
          STUDYID USUBJID            ARM       ACTARM    ISTPT      AVAL
          <chr>   <chr>              <fct>     <fct>     <fct>     <dbl>
        1 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X "Predose" 1.04 
        2 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X "Predose" 1    
        3 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X "Predose" 1.04 
        4 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X "Predose" 1    
        5 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X "Predose" 1    
        6 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X "Predose" 0    
        7 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X "Predose" 0    
        8 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X "Predose" 1    
        9 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X "Predose" 1    
       10 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X "Predose" 0    
       11 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X "Predose" 1    
       12 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X "Predose" 1    
       13 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X "Predose" 1    
       14 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X "Predose" 0    
       15 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X "Predose" 0.143
       16 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X "Predose" 1    
       17 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X "Predose" 0    
       18 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X "Predose" 0    
       19 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X "Predose" 1    
       20 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X "Predose" 0    
       21 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X "Predose" 1    
       22 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X "Predose" 1    
       23 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1.04 
       24 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
       25 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1.04 
       26 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
       27 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
       28 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
       29 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
       30 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
       31 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
       32 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
       33 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
       34 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
       35 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
       36 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
       37 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0.143
       38 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
       39 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
       40 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
       41 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
       42 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
       43 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
       44 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
       45 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1.04 
       46 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
       47 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1.04 
       48 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
       49 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
       50 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
       51 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
       52 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
       53 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
       54 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
       55 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
       56 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
       57 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
       58 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
       59 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0.143
       60 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
       61 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
       62 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
       63 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
       64 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
       65 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
       66 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
       67 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1.04 
       68 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
       69 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1.04 
       70 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
       71 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
       72 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
       73 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
       74 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
       75 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
       76 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
       77 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
       78 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
       79 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
       80 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
       81 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0.143
       82 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
       83 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
       84 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
       85 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
       86 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
       87 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
       88 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
       89 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1.04 
       90 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
       91 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1.04 
       92 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
       93 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
       94 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
       95 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
       96 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
       97 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
       98 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
       99 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      100 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      101 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      102 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
      103 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0.143
      104 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      105 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
      106 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
      107 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      108 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
      109 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      110 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      111 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1.04 
      112 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      113 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1.04 
      114 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      115 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      116 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
      117 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
      118 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      119 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      120 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
      121 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      122 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      123 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      124 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
      125 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0.143
      126 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      127 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
      128 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
      129 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      130 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
      131 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      132 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      133 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1.04 
      134 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      135 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1.04 
      136 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      137 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      138 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
      139 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
      140 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      141 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      142 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
      143 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      144 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      145 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      146 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
      147 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0.143
      148 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      149 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
      150 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
      151 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      152 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
      153 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      154 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      155 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1.04 
      156 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      157 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1.04 
      158 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      159 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      160 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
      161 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
      162 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      163 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      164 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
      165 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      166 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      167 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      168 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
      169 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0.143
      170 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      171 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
      172 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
      173 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      174 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
      175 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      176 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      177 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1.04 
      178 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      179 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1.04 
      180 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      181 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      182 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
      183 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
      184 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      185 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      186 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
      187 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      188 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      189 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      190 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
      191 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0.143
      192 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      193 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
      194 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
      195 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      196 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
      197 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      198 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      199 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1.08 
      200 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      201 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1.08 
      202 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      203 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      204 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
      205 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
      206 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      207 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      208 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
      209 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      210 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      211 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      212 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
      213 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0.143
      214 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      215 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
      216 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
      217 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      218 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        0    
      219 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
      220 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X ""        1    
          AVALC             AVALU  
          <chr>             <fct>  
        1 POSITIVE          "titer"
        2 POSITIVE          ""     
        3 POSITIVE          "titer"
        4 POSITIVE          ""     
        5 POSITIVE          ""     
        6 N                 ""     
        7 N                 ""     
        8 Y                 ""     
        9 Y                 ""     
       10 N                 ""     
       11 Y                 ""     
       12 Y                 ""     
       13 POSITIVE          ""     
       14 0                 "weeks"
       15 0.142857142857143 "weeks"
       16 POSITIVE          ""     
       17 N                 ""     
       18 N                 ""     
       19 Y                 ""     
       20 N                 ""     
       21 POSITIVE          ""     
       22 Y                 ""     
       23 POSITIVE          "titer"
       24 POSITIVE          ""     
       25 POSITIVE          "titer"
       26 POSITIVE          ""     
       27 POSITIVE          ""     
       28 N                 ""     
       29 N                 ""     
       30 Y                 ""     
       31 Y                 ""     
       32 N                 ""     
       33 Y                 ""     
       34 Y                 ""     
       35 POSITIVE          ""     
       36 0                 "weeks"
       37 0.142857142857143 "weeks"
       38 POSITIVE          ""     
       39 N                 ""     
       40 N                 ""     
       41 Y                 ""     
       42 N                 ""     
       43 POSITIVE          ""     
       44 Y                 ""     
       45 POSITIVE          "titer"
       46 POSITIVE          ""     
       47 POSITIVE          "titer"
       48 POSITIVE          ""     
       49 POSITIVE          ""     
       50 N                 ""     
       51 N                 ""     
       52 Y                 ""     
       53 Y                 ""     
       54 N                 ""     
       55 Y                 ""     
       56 Y                 ""     
       57 POSITIVE          ""     
       58 0                 "weeks"
       59 0.142857142857143 "weeks"
       60 POSITIVE          ""     
       61 N                 ""     
       62 N                 ""     
       63 Y                 ""     
       64 N                 ""     
       65 POSITIVE          ""     
       66 Y                 ""     
       67 POSITIVE          "titer"
       68 POSITIVE          ""     
       69 POSITIVE          "titer"
       70 POSITIVE          ""     
       71 POSITIVE          ""     
       72 N                 ""     
       73 N                 ""     
       74 Y                 ""     
       75 Y                 ""     
       76 N                 ""     
       77 Y                 ""     
       78 Y                 ""     
       79 POSITIVE          ""     
       80 0                 "weeks"
       81 0.142857142857143 "weeks"
       82 POSITIVE          ""     
       83 N                 ""     
       84 N                 ""     
       85 Y                 ""     
       86 N                 ""     
       87 POSITIVE          ""     
       88 Y                 ""     
       89 POSITIVE          "titer"
       90 POSITIVE          ""     
       91 POSITIVE          "titer"
       92 POSITIVE          ""     
       93 POSITIVE          ""     
       94 N                 ""     
       95 N                 ""     
       96 Y                 ""     
       97 Y                 ""     
       98 N                 ""     
       99 Y                 ""     
      100 Y                 ""     
      101 POSITIVE          ""     
      102 0                 "weeks"
      103 0.142857142857143 "weeks"
      104 POSITIVE          ""     
      105 N                 ""     
      106 N                 ""     
      107 Y                 ""     
      108 N                 ""     
      109 POSITIVE          ""     
      110 Y                 ""     
      111 POSITIVE          "titer"
      112 POSITIVE          ""     
      113 POSITIVE          "titer"
      114 POSITIVE          ""     
      115 POSITIVE          ""     
      116 N                 ""     
      117 N                 ""     
      118 Y                 ""     
      119 Y                 ""     
      120 N                 ""     
      121 Y                 ""     
      122 Y                 ""     
      123 POSITIVE          ""     
      124 0                 "weeks"
      125 0.142857142857143 "weeks"
      126 POSITIVE          ""     
      127 N                 ""     
      128 N                 ""     
      129 Y                 ""     
      130 N                 ""     
      131 POSITIVE          ""     
      132 Y                 ""     
      133 POSITIVE          "titer"
      134 POSITIVE          ""     
      135 POSITIVE          "titer"
      136 POSITIVE          ""     
      137 POSITIVE          ""     
      138 N                 ""     
      139 N                 ""     
      140 Y                 ""     
      141 Y                 ""     
      142 N                 ""     
      143 Y                 ""     
      144 Y                 ""     
      145 POSITIVE          ""     
      146 0                 "weeks"
      147 0.142857142857143 "weeks"
      148 POSITIVE          ""     
      149 N                 ""     
      150 N                 ""     
      151 Y                 ""     
      152 N                 ""     
      153 POSITIVE          ""     
      154 Y                 ""     
      155 POSITIVE          "titer"
      156 POSITIVE          ""     
      157 POSITIVE          "titer"
      158 POSITIVE          ""     
      159 POSITIVE          ""     
      160 N                 ""     
      161 N                 ""     
      162 Y                 ""     
      163 Y                 ""     
      164 N                 ""     
      165 Y                 ""     
      166 Y                 ""     
      167 POSITIVE          ""     
      168 0                 "weeks"
      169 0.142857142857143 "weeks"
      170 POSITIVE          ""     
      171 N                 ""     
      172 N                 ""     
      173 Y                 ""     
      174 N                 ""     
      175 POSITIVE          ""     
      176 Y                 ""     
      177 POSITIVE          "titer"
      178 POSITIVE          ""     
      179 POSITIVE          "titer"
      180 POSITIVE          ""     
      181 POSITIVE          ""     
      182 N                 ""     
      183 N                 ""     
      184 Y                 ""     
      185 Y                 ""     
      186 N                 ""     
      187 Y                 ""     
      188 Y                 ""     
      189 POSITIVE          ""     
      190 0                 "weeks"
      191 0.142857142857143 "weeks"
      192 POSITIVE          ""     
      193 N                 ""     
      194 N                 ""     
      195 Y                 ""     
      196 N                 ""     
      197 POSITIVE          ""     
      198 Y                 ""     
      199 POSITIVE          "titer"
      200 POSITIVE          ""     
      201 POSITIVE          "titer"
      202 POSITIVE          ""     
      203 POSITIVE          ""     
      204 N                 ""     
      205 N                 ""     
      206 Y                 ""     
      207 Y                 ""     
      208 N                 ""     
      209 Y                 ""     
      210 Y                 ""     
      211 POSITIVE          ""     
      212 0                 "weeks"
      213 0.142857142857143 "weeks"
      214 POSITIVE          ""     
      215 N                 ""     
      216 N                 ""     
      217 Y                 ""     
      218 N                 ""     
      219 POSITIVE          ""     
      220 Y                 ""     
          PARAM                                                PARAMCD  VISIT VISITDY
          <fct>                                                <fct>    <fct>   <int>
        1 Antibody titer units                                 R1800000 Day 1       1
        2 ADA interpreted per sample result                    RESULT1  Day 1       1
        3 Neutralizing Antibody titer units                    R1800001 Day 1       1
        4 NAB interpreted per sample result                    RESULT2  Day 1       1
        5 ADA Status of a patient                              ADASTAT1 Day 1       1
        6 Treatment induced ADA                                INDUCD1  Day 1       1
        7 Treatment enhanced ADA                               ENHANC1  Day 1       1
        8 Treatment unaffected                                 TRUNAFF1 Day 1       1
        9 Treatment Emergent - Negative                        EMERNEG1 Day 1       1
       10 Treatment Emergent - Positive                        EMERPOS1 Day 1       1
       11 Persistent ADA                                       PERSADA1 Day 1       1
       12 Transient ADA                                        TRANADA1 Day 1       1
       13 Baseline                                             BFLAG1   Day 1       1
       14 Time to onset of ADA                                 TIMADA1  Day 1       1
       15 ADA Duration                                         ADADUR1  Day 1       1
       16 NAB Status of a patient                              ADASTAT2 Day 1       1
       17 Treatment induced ADA, Neutralizing Antibody         INDUCD2  Day 1       1
       18 Treatment enhanced ADA, Neutralizing Antibody        ENHANC2  Day 1       1
       19 Treatment Emergent - Negative, Neutralizing Antibody EMERNEG2 Day 1       1
       20 Treatment Emergent - Positive, Neutralizing Antibody EMERPOS2 Day 1       1
       21 Baseline, Neutralizing Antibody                      BFLAG2   Day 1       1
       22 Treatment unaffected, Neutralizing Antibody          TRUNAFF2 Day 1       1
       23 Antibody titer units                                 R1800000 Day 1       1
       24 ADA interpreted per sample result                    RESULT1  Day 1       1
       25 Neutralizing Antibody titer units                    R1800001 Day 1       1
       26 NAB interpreted per sample result                    RESULT2  Day 1       1
       27 ADA Status of a patient                              ADASTAT1 Day 1       1
       28 Treatment induced ADA                                INDUCD1  Day 1       1
       29 Treatment enhanced ADA                               ENHANC1  Day 1       1
       30 Treatment unaffected                                 TRUNAFF1 Day 1       1
       31 Treatment Emergent - Negative                        EMERNEG1 Day 1       1
       32 Treatment Emergent - Positive                        EMERPOS1 Day 1       1
       33 Persistent ADA                                       PERSADA1 Day 1       1
       34 Transient ADA                                        TRANADA1 Day 1       1
       35 Baseline                                             BFLAG1   Day 1       1
       36 Time to onset of ADA                                 TIMADA1  Day 1       1
       37 ADA Duration                                         ADADUR1  Day 1       1
       38 NAB Status of a patient                              ADASTAT2 Day 1       1
       39 Treatment induced ADA, Neutralizing Antibody         INDUCD2  Day 1       1
       40 Treatment enhanced ADA, Neutralizing Antibody        ENHANC2  Day 1       1
       41 Treatment Emergent - Negative, Neutralizing Antibody EMERNEG2 Day 1       1
       42 Treatment Emergent - Positive, Neutralizing Antibody EMERPOS2 Day 1       1
       43 Baseline, Neutralizing Antibody                      BFLAG2   Day 1       1
       44 Treatment unaffected, Neutralizing Antibody          TRUNAFF2 Day 1       1
       45 Antibody titer units                                 R1800000 Day 1       1
       46 ADA interpreted per sample result                    RESULT1  Day 1       1
       47 Neutralizing Antibody titer units                    R1800001 Day 1       1
       48 NAB interpreted per sample result                    RESULT2  Day 1       1
       49 ADA Status of a patient                              ADASTAT1 Day 1       1
       50 Treatment induced ADA                                INDUCD1  Day 1       1
       51 Treatment enhanced ADA                               ENHANC1  Day 1       1
       52 Treatment unaffected                                 TRUNAFF1 Day 1       1
       53 Treatment Emergent - Negative                        EMERNEG1 Day 1       1
       54 Treatment Emergent - Positive                        EMERPOS1 Day 1       1
       55 Persistent ADA                                       PERSADA1 Day 1       1
       56 Transient ADA                                        TRANADA1 Day 1       1
       57 Baseline                                             BFLAG1   Day 1       1
       58 Time to onset of ADA                                 TIMADA1  Day 1       1
       59 ADA Duration                                         ADADUR1  Day 1       1
       60 NAB Status of a patient                              ADASTAT2 Day 1       1
       61 Treatment induced ADA, Neutralizing Antibody         INDUCD2  Day 1       1
       62 Treatment enhanced ADA, Neutralizing Antibody        ENHANC2  Day 1       1
       63 Treatment Emergent - Negative, Neutralizing Antibody EMERNEG2 Day 1       1
       64 Treatment Emergent - Positive, Neutralizing Antibody EMERPOS2 Day 1       1
       65 Baseline, Neutralizing Antibody                      BFLAG2   Day 1       1
       66 Treatment unaffected, Neutralizing Antibody          TRUNAFF2 Day 1       1
       67 Antibody titer units                                 R1800000 Day 1       1
       68 ADA interpreted per sample result                    RESULT1  Day 1       1
       69 Neutralizing Antibody titer units                    R1800001 Day 1       1
       70 NAB interpreted per sample result                    RESULT2  Day 1       1
       71 ADA Status of a patient                              ADASTAT1 Day 1       1
       72 Treatment induced ADA                                INDUCD1  Day 1       1
       73 Treatment enhanced ADA                               ENHANC1  Day 1       1
       74 Treatment unaffected                                 TRUNAFF1 Day 1       1
       75 Treatment Emergent - Negative                        EMERNEG1 Day 1       1
       76 Treatment Emergent - Positive                        EMERPOS1 Day 1       1
       77 Persistent ADA                                       PERSADA1 Day 1       1
       78 Transient ADA                                        TRANADA1 Day 1       1
       79 Baseline                                             BFLAG1   Day 1       1
       80 Time to onset of ADA                                 TIMADA1  Day 1       1
       81 ADA Duration                                         ADADUR1  Day 1       1
       82 NAB Status of a patient                              ADASTAT2 Day 1       1
       83 Treatment induced ADA, Neutralizing Antibody         INDUCD2  Day 1       1
       84 Treatment enhanced ADA, Neutralizing Antibody        ENHANC2  Day 1       1
       85 Treatment Emergent - Negative, Neutralizing Antibody EMERNEG2 Day 1       1
       86 Treatment Emergent - Positive, Neutralizing Antibody EMERPOS2 Day 1       1
       87 Baseline, Neutralizing Antibody                      BFLAG2   Day 1       1
       88 Treatment unaffected, Neutralizing Antibody          TRUNAFF2 Day 1       1
       89 Antibody titer units                                 R1800000 Day 1       1
       90 ADA interpreted per sample result                    RESULT1  Day 1       1
       91 Neutralizing Antibody titer units                    R1800001 Day 1       1
       92 NAB interpreted per sample result                    RESULT2  Day 1       1
       93 ADA Status of a patient                              ADASTAT1 Day 1       1
       94 Treatment induced ADA                                INDUCD1  Day 1       1
       95 Treatment enhanced ADA                               ENHANC1  Day 1       1
       96 Treatment unaffected                                 TRUNAFF1 Day 1       1
       97 Treatment Emergent - Negative                        EMERNEG1 Day 1       1
       98 Treatment Emergent - Positive                        EMERPOS1 Day 1       1
       99 Persistent ADA                                       PERSADA1 Day 1       1
      100 Transient ADA                                        TRANADA1 Day 1       1
      101 Baseline                                             BFLAG1   Day 1       1
      102 Time to onset of ADA                                 TIMADA1  Day 1       1
      103 ADA Duration                                         ADADUR1  Day 1       1
      104 NAB Status of a patient                              ADASTAT2 Day 1       1
      105 Treatment induced ADA, Neutralizing Antibody         INDUCD2  Day 1       1
      106 Treatment enhanced ADA, Neutralizing Antibody        ENHANC2  Day 1       1
      107 Treatment Emergent - Negative, Neutralizing Antibody EMERNEG2 Day 1       1
      108 Treatment Emergent - Positive, Neutralizing Antibody EMERPOS2 Day 1       1
      109 Baseline, Neutralizing Antibody                      BFLAG2   Day 1       1
      110 Treatment unaffected, Neutralizing Antibody          TRUNAFF2 Day 1       1
      111 Antibody titer units                                 R1800000 Day 1       1
      112 ADA interpreted per sample result                    RESULT1  Day 1       1
      113 Neutralizing Antibody titer units                    R1800001 Day 1       1
      114 NAB interpreted per sample result                    RESULT2  Day 1       1
      115 ADA Status of a patient                              ADASTAT1 Day 1       1
      116 Treatment induced ADA                                INDUCD1  Day 1       1
      117 Treatment enhanced ADA                               ENHANC1  Day 1       1
      118 Treatment unaffected                                 TRUNAFF1 Day 1       1
      119 Treatment Emergent - Negative                        EMERNEG1 Day 1       1
      120 Treatment Emergent - Positive                        EMERPOS1 Day 1       1
      121 Persistent ADA                                       PERSADA1 Day 1       1
      122 Transient ADA                                        TRANADA1 Day 1       1
      123 Baseline                                             BFLAG1   Day 1       1
      124 Time to onset of ADA                                 TIMADA1  Day 1       1
      125 ADA Duration                                         ADADUR1  Day 1       1
      126 NAB Status of a patient                              ADASTAT2 Day 1       1
      127 Treatment induced ADA, Neutralizing Antibody         INDUCD2  Day 1       1
      128 Treatment enhanced ADA, Neutralizing Antibody        ENHANC2  Day 1       1
      129 Treatment Emergent - Negative, Neutralizing Antibody EMERNEG2 Day 1       1
      130 Treatment Emergent - Positive, Neutralizing Antibody EMERPOS2 Day 1       1
      131 Baseline, Neutralizing Antibody                      BFLAG2   Day 1       1
      132 Treatment unaffected, Neutralizing Antibody          TRUNAFF2 Day 1       1
      133 Antibody titer units                                 R1800000 Day 1       1
      134 ADA interpreted per sample result                    RESULT1  Day 1       1
      135 Neutralizing Antibody titer units                    R1800001 Day 1       1
      136 NAB interpreted per sample result                    RESULT2  Day 1       1
      137 ADA Status of a patient                              ADASTAT1 Day 1       1
      138 Treatment induced ADA                                INDUCD1  Day 1       1
      139 Treatment enhanced ADA                               ENHANC1  Day 1       1
      140 Treatment unaffected                                 TRUNAFF1 Day 1       1
      141 Treatment Emergent - Negative                        EMERNEG1 Day 1       1
      142 Treatment Emergent - Positive                        EMERPOS1 Day 1       1
      143 Persistent ADA                                       PERSADA1 Day 1       1
      144 Transient ADA                                        TRANADA1 Day 1       1
      145 Baseline                                             BFLAG1   Day 1       1
      146 Time to onset of ADA                                 TIMADA1  Day 1       1
      147 ADA Duration                                         ADADUR1  Day 1       1
      148 NAB Status of a patient                              ADASTAT2 Day 1       1
      149 Treatment induced ADA, Neutralizing Antibody         INDUCD2  Day 1       1
      150 Treatment enhanced ADA, Neutralizing Antibody        ENHANC2  Day 1       1
      151 Treatment Emergent - Negative, Neutralizing Antibody EMERNEG2 Day 1       1
      152 Treatment Emergent - Positive, Neutralizing Antibody EMERPOS2 Day 1       1
      153 Baseline, Neutralizing Antibody                      BFLAG2   Day 1       1
      154 Treatment unaffected, Neutralizing Antibody          TRUNAFF2 Day 1       1
      155 Antibody titer units                                 R1800000 Day 1       1
      156 ADA interpreted per sample result                    RESULT1  Day 1       1
      157 Neutralizing Antibody titer units                    R1800001 Day 1       1
      158 NAB interpreted per sample result                    RESULT2  Day 1       1
      159 ADA Status of a patient                              ADASTAT1 Day 1       1
      160 Treatment induced ADA                                INDUCD1  Day 1       1
      161 Treatment enhanced ADA                               ENHANC1  Day 1       1
      162 Treatment unaffected                                 TRUNAFF1 Day 1       1
      163 Treatment Emergent - Negative                        EMERNEG1 Day 1       1
      164 Treatment Emergent - Positive                        EMERPOS1 Day 1       1
      165 Persistent ADA                                       PERSADA1 Day 1       1
      166 Transient ADA                                        TRANADA1 Day 1       1
      167 Baseline                                             BFLAG1   Day 1       1
      168 Time to onset of ADA                                 TIMADA1  Day 1       1
      169 ADA Duration                                         ADADUR1  Day 1       1
      170 NAB Status of a patient                              ADASTAT2 Day 1       1
      171 Treatment induced ADA, Neutralizing Antibody         INDUCD2  Day 1       1
      172 Treatment enhanced ADA, Neutralizing Antibody        ENHANC2  Day 1       1
      173 Treatment Emergent - Negative, Neutralizing Antibody EMERNEG2 Day 1       1
      174 Treatment Emergent - Positive, Neutralizing Antibody EMERPOS2 Day 1       1
      175 Baseline, Neutralizing Antibody                      BFLAG2   Day 1       1
      176 Treatment unaffected, Neutralizing Antibody          TRUNAFF2 Day 1       1
      177 Antibody titer units                                 R1800000 Day 1       1
      178 ADA interpreted per sample result                    RESULT1  Day 1       1
      179 Neutralizing Antibody titer units                    R1800001 Day 1       1
      180 NAB interpreted per sample result                    RESULT2  Day 1       1
      181 ADA Status of a patient                              ADASTAT1 Day 1       1
      182 Treatment induced ADA                                INDUCD1  Day 1       1
      183 Treatment enhanced ADA                               ENHANC1  Day 1       1
      184 Treatment unaffected                                 TRUNAFF1 Day 1       1
      185 Treatment Emergent - Negative                        EMERNEG1 Day 1       1
      186 Treatment Emergent - Positive                        EMERPOS1 Day 1       1
      187 Persistent ADA                                       PERSADA1 Day 1       1
      188 Transient ADA                                        TRANADA1 Day 1       1
      189 Baseline                                             BFLAG1   Day 1       1
      190 Time to onset of ADA                                 TIMADA1  Day 1       1
      191 ADA Duration                                         ADADUR1  Day 1       1
      192 NAB Status of a patient                              ADASTAT2 Day 1       1
      193 Treatment induced ADA, Neutralizing Antibody         INDUCD2  Day 1       1
      194 Treatment enhanced ADA, Neutralizing Antibody        ENHANC2  Day 1       1
      195 Treatment Emergent - Negative, Neutralizing Antibody EMERNEG2 Day 1       1
      196 Treatment Emergent - Positive, Neutralizing Antibody EMERPOS2 Day 1       1
      197 Baseline, Neutralizing Antibody                      BFLAG2   Day 1       1
      198 Treatment unaffected, Neutralizing Antibody          TRUNAFF2 Day 1       1
      199 Antibody titer units                                 R1800000 Day 2       2
      200 ADA interpreted per sample result                    RESULT1  Day 2       2
      201 Neutralizing Antibody titer units                    R1800001 Day 2       2
      202 NAB interpreted per sample result                    RESULT2  Day 2       2
      203 ADA Status of a patient                              ADASTAT1 Day 2       2
      204 Treatment induced ADA                                INDUCD1  Day 2       2
      205 Treatment enhanced ADA                               ENHANC1  Day 2       2
      206 Treatment unaffected                                 TRUNAFF1 Day 2       2
      207 Treatment Emergent - Negative                        EMERNEG1 Day 2       2
      208 Treatment Emergent - Positive                        EMERPOS1 Day 2       2
      209 Persistent ADA                                       PERSADA1 Day 2       2
      210 Transient ADA                                        TRANADA1 Day 2       2
      211 Baseline                                             BFLAG1   Day 2       2
      212 Time to onset of ADA                                 TIMADA1  Day 2       2
      213 ADA Duration                                         ADADUR1  Day 2       2
      214 NAB Status of a patient                              ADASTAT2 Day 2       2
      215 Treatment induced ADA, Neutralizing Antibody         INDUCD2  Day 2       2
      216 Treatment enhanced ADA, Neutralizing Antibody        ENHANC2  Day 2       2
      217 Treatment Emergent - Negative, Neutralizing Antibody EMERNEG2 Day 2       2
      218 Treatment Emergent - Positive, Neutralizing Antibody EMERPOS2 Day 2       2
      219 Baseline, Neutralizing Antibody                      BFLAG2   Day 2       2
      220 Treatment unaffected, Neutralizing Antibody          TRUNAFF2 Day 2       2
          PARCAT1                         ADABLFL ADAPBLFL ABLFL RELTMU ATACHAR
          <fct>                           <fct>   <fct>    <fct> <fct>  <fct>  
        1 A: Drug X Antibody              Y       Y        Y     day    F+     
        2 A: Drug X Antibody              Y       Y        Y     day    F+     
        3 A: Drug X Antibody              Y       Y        Y     day    F+     
        4 A: Drug X Antibody              Y       Y        Y     day    F+     
        5 A: Drug X Antibody              Y       Y        Y     day    F+     
        6 A: Drug X Antibody              Y       Y        Y     day    F+     
        7 A: Drug X Antibody              Y       Y        Y     day    F+     
        8 A: Drug X Antibody              Y       Y        Y     day    F+     
        9 A: Drug X Antibody              Y       Y        Y     day    F+     
       10 A: Drug X Antibody              Y       Y        Y     day    F+     
       11 A: Drug X Antibody              Y       Y        Y     day    F+     
       12 A: Drug X Antibody              Y       Y        Y     day    F+     
       13 A: Drug X Antibody              Y       Y        Y     day    F+     
       14 A: Drug X Antibody              Y       Y        Y     day    F+     
       15 A: Drug X Antibody              Y       Y        Y     day    F+     
       16 A: Drug X Neutralizing Antibody Y       Y        Y     day    F+     
       17 A: Drug X Neutralizing Antibody Y       Y        Y     day    F+     
       18 A: Drug X Neutralizing Antibody Y       Y        Y     day    F+     
       19 A: Drug X Neutralizing Antibody Y       Y        Y     day    F+     
       20 A: Drug X Neutralizing Antibody Y       Y        Y     day    F+     
       21 A: Drug X Antibody              Y       Y        Y     day    F+     
       22 A: Drug X Neutralizing Antibody Y       Y        Y     day    F+     
       23 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       24 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       25 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       26 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       27 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       28 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       29 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       30 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       31 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       32 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       33 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       34 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       35 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       36 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       37 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       38 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
       39 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
       40 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
       41 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
       42 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
       43 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       44 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
       45 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       46 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       47 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       48 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       49 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       50 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       51 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       52 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       53 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       54 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       55 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       56 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       57 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       58 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       59 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       60 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
       61 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
       62 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
       63 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
       64 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
       65 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       66 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
       67 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       68 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       69 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       70 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       71 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       72 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       73 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       74 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       75 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       76 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       77 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       78 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       79 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       80 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       81 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       82 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
       83 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
       84 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
       85 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
       86 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
       87 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       88 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
       89 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       90 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       91 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       92 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       93 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       94 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       95 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       96 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       97 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       98 A: Drug X Antibody              Y       Y        <NA>  day    F+     
       99 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      100 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      101 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      102 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      103 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      104 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
      105 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
      106 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
      107 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
      108 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
      109 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      110 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
      111 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      112 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      113 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      114 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      115 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      116 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      117 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      118 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      119 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      120 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      121 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      122 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      123 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      124 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      125 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      126 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
      127 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
      128 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
      129 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
      130 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
      131 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      132 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
      133 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      134 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      135 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      136 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      137 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      138 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      139 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      140 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      141 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      142 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      143 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      144 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      145 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      146 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      147 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      148 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
      149 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
      150 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
      151 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
      152 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
      153 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      154 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
      155 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      156 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      157 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      158 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      159 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      160 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      161 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      162 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      163 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      164 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      165 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      166 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      167 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      168 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      169 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      170 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
      171 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
      172 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
      173 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
      174 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
      175 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      176 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
      177 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      178 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      179 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      180 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      181 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      182 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      183 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      184 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      185 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      186 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      187 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      188 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      189 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      190 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      191 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      192 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
      193 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
      194 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
      195 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
      196 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
      197 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      198 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
      199 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      200 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      201 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      202 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      203 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      204 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      205 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      206 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      207 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      208 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      209 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      210 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      211 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      212 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      213 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      214 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
      215 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
      216 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
      217 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
      218 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
      219 A: Drug X Antibody              Y       Y        <NA>  day    F+     
      220 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    F+     
          NRELTM1 ARELTM1 NRELTM2 ARELTM2
            <dbl>   <dbl>   <dbl>   <dbl>
        1  0       0       0       0     
        2  0       0       0       0     
        3  0       0       0       0     
        4  0       0       0       0     
        5  0       0       0       0     
        6  0       0       0       0     
        7  0       0       0       0     
        8  0       0       0       0     
        9  0       0       0       0     
       10  0       0       0       0     
       11  0       0       0       0     
       12  0       0       0       0     
       13  0       0       0       0     
       14  0       0       0       0     
       15  0       0       0       0     
       16  0       0       0       0     
       17  0       0       0       0     
       18  0       0       0       0     
       19  0       0       0       0     
       20  0       0       0       0     
       21  0       0       0       0     
       22  0       0       0       0     
       23  0.0208  0.0208  0.0208  0.0208
       24  0.0208  0.0208  0.0208  0.0208
       25  0.0208  0.0208  0.0208  0.0208
       26  0.0208  0.0208  0.0208  0.0208
       27  0.0208  0.0208  0.0208  0.0208
       28  0.0208  0.0208  0.0208  0.0208
       29  0.0208  0.0208  0.0208  0.0208
       30  0.0208  0.0208  0.0208  0.0208
       31  0.0208  0.0208  0.0208  0.0208
       32  0.0208  0.0208  0.0208  0.0208
       33  0.0208  0.0208  0.0208  0.0208
       34  0.0208  0.0208  0.0208  0.0208
       35  0.0208  0.0208  0.0208  0.0208
       36  0.0208  0.0208  0.0208  0.0208
       37  0.0208  0.0208  0.0208  0.0208
       38  0.0208  0.0208  0.0208  0.0208
       39  0.0208  0.0208  0.0208  0.0208
       40  0.0208  0.0208  0.0208  0.0208
       41  0.0208  0.0208  0.0208  0.0208
       42  0.0208  0.0208  0.0208  0.0208
       43  0.0208  0.0208  0.0208  0.0208
       44  0.0208  0.0208  0.0208  0.0208
       45  0.0417  0.0417  0.0417  0.0417
       46  0.0417  0.0417  0.0417  0.0417
       47  0.0417  0.0417  0.0417  0.0417
       48  0.0417  0.0417  0.0417  0.0417
       49  0.0417  0.0417  0.0417  0.0417
       50  0.0417  0.0417  0.0417  0.0417
       51  0.0417  0.0417  0.0417  0.0417
       52  0.0417  0.0417  0.0417  0.0417
       53  0.0417  0.0417  0.0417  0.0417
       54  0.0417  0.0417  0.0417  0.0417
       55  0.0417  0.0417  0.0417  0.0417
       56  0.0417  0.0417  0.0417  0.0417
       57  0.0417  0.0417  0.0417  0.0417
       58  0.0417  0.0417  0.0417  0.0417
       59  0.0417  0.0417  0.0417  0.0417
       60  0.0417  0.0417  0.0417  0.0417
       61  0.0417  0.0417  0.0417  0.0417
       62  0.0417  0.0417  0.0417  0.0417
       63  0.0417  0.0417  0.0417  0.0417
       64  0.0417  0.0417  0.0417  0.0417
       65  0.0417  0.0417  0.0417  0.0417
       66  0.0417  0.0417  0.0417  0.0417
       67  0.0625  0.0625  0.0625  0.0625
       68  0.0625  0.0625  0.0625  0.0625
       69  0.0625  0.0625  0.0625  0.0625
       70  0.0625  0.0625  0.0625  0.0625
       71  0.0625  0.0625  0.0625  0.0625
       72  0.0625  0.0625  0.0625  0.0625
       73  0.0625  0.0625  0.0625  0.0625
       74  0.0625  0.0625  0.0625  0.0625
       75  0.0625  0.0625  0.0625  0.0625
       76  0.0625  0.0625  0.0625  0.0625
       77  0.0625  0.0625  0.0625  0.0625
       78  0.0625  0.0625  0.0625  0.0625
       79  0.0625  0.0625  0.0625  0.0625
       80  0.0625  0.0625  0.0625  0.0625
       81  0.0625  0.0625  0.0625  0.0625
       82  0.0625  0.0625  0.0625  0.0625
       83  0.0625  0.0625  0.0625  0.0625
       84  0.0625  0.0625  0.0625  0.0625
       85  0.0625  0.0625  0.0625  0.0625
       86  0.0625  0.0625  0.0625  0.0625
       87  0.0625  0.0625  0.0625  0.0625
       88  0.0625  0.0625  0.0625  0.0625
       89  0.0833  0.0833  0.0833  0.0833
       90  0.0833  0.0833  0.0833  0.0833
       91  0.0833  0.0833  0.0833  0.0833
       92  0.0833  0.0833  0.0833  0.0833
       93  0.0833  0.0833  0.0833  0.0833
       94  0.0833  0.0833  0.0833  0.0833
       95  0.0833  0.0833  0.0833  0.0833
       96  0.0833  0.0833  0.0833  0.0833
       97  0.0833  0.0833  0.0833  0.0833
       98  0.0833  0.0833  0.0833  0.0833
       99  0.0833  0.0833  0.0833  0.0833
      100  0.0833  0.0833  0.0833  0.0833
      101  0.0833  0.0833  0.0833  0.0833
      102  0.0833  0.0833  0.0833  0.0833
      103  0.0833  0.0833  0.0833  0.0833
      104  0.0833  0.0833  0.0833  0.0833
      105  0.0833  0.0833  0.0833  0.0833
      106  0.0833  0.0833  0.0833  0.0833
      107  0.0833  0.0833  0.0833  0.0833
      108  0.0833  0.0833  0.0833  0.0833
      109  0.0833  0.0833  0.0833  0.0833
      110  0.0833  0.0833  0.0833  0.0833
      111  0.125   0.125   0.125   0.125 
      112  0.125   0.125   0.125   0.125 
      113  0.125   0.125   0.125   0.125 
      114  0.125   0.125   0.125   0.125 
      115  0.125   0.125   0.125   0.125 
      116  0.125   0.125   0.125   0.125 
      117  0.125   0.125   0.125   0.125 
      118  0.125   0.125   0.125   0.125 
      119  0.125   0.125   0.125   0.125 
      120  0.125   0.125   0.125   0.125 
      121  0.125   0.125   0.125   0.125 
      122  0.125   0.125   0.125   0.125 
      123  0.125   0.125   0.125   0.125 
      124  0.125   0.125   0.125   0.125 
      125  0.125   0.125   0.125   0.125 
      126  0.125   0.125   0.125   0.125 
      127  0.125   0.125   0.125   0.125 
      128  0.125   0.125   0.125   0.125 
      129  0.125   0.125   0.125   0.125 
      130  0.125   0.125   0.125   0.125 
      131  0.125   0.125   0.125   0.125 
      132  0.125   0.125   0.125   0.125 
      133  0.167   0.167   0.167   0.167 
      134  0.167   0.167   0.167   0.167 
      135  0.167   0.167   0.167   0.167 
      136  0.167   0.167   0.167   0.167 
      137  0.167   0.167   0.167   0.167 
      138  0.167   0.167   0.167   0.167 
      139  0.167   0.167   0.167   0.167 
      140  0.167   0.167   0.167   0.167 
      141  0.167   0.167   0.167   0.167 
      142  0.167   0.167   0.167   0.167 
      143  0.167   0.167   0.167   0.167 
      144  0.167   0.167   0.167   0.167 
      145  0.167   0.167   0.167   0.167 
      146  0.167   0.167   0.167   0.167 
      147  0.167   0.167   0.167   0.167 
      148  0.167   0.167   0.167   0.167 
      149  0.167   0.167   0.167   0.167 
      150  0.167   0.167   0.167   0.167 
      151  0.167   0.167   0.167   0.167 
      152  0.167   0.167   0.167   0.167 
      153  0.167   0.167   0.167   0.167 
      154  0.167   0.167   0.167   0.167 
      155  0.333   0.333   0.333   0.333 
      156  0.333   0.333   0.333   0.333 
      157  0.333   0.333   0.333   0.333 
      158  0.333   0.333   0.333   0.333 
      159  0.333   0.333   0.333   0.333 
      160  0.333   0.333   0.333   0.333 
      161  0.333   0.333   0.333   0.333 
      162  0.333   0.333   0.333   0.333 
      163  0.333   0.333   0.333   0.333 
      164  0.333   0.333   0.333   0.333 
      165  0.333   0.333   0.333   0.333 
      166  0.333   0.333   0.333   0.333 
      167  0.333   0.333   0.333   0.333 
      168  0.333   0.333   0.333   0.333 
      169  0.333   0.333   0.333   0.333 
      170  0.333   0.333   0.333   0.333 
      171  0.333   0.333   0.333   0.333 
      172  0.333   0.333   0.333   0.333 
      173  0.333   0.333   0.333   0.333 
      174  0.333   0.333   0.333   0.333 
      175  0.333   0.333   0.333   0.333 
      176  0.333   0.333   0.333   0.333 
      177  0.5     0.5     0.5     0.5   
      178  0.5     0.5     0.5     0.5   
      179  0.5     0.5     0.5     0.5   
      180  0.5     0.5     0.5     0.5   
      181  0.5     0.5     0.5     0.5   
      182  0.5     0.5     0.5     0.5   
      183  0.5     0.5     0.5     0.5   
      184  0.5     0.5     0.5     0.5   
      185  0.5     0.5     0.5     0.5   
      186  0.5     0.5     0.5     0.5   
      187  0.5     0.5     0.5     0.5   
      188  0.5     0.5     0.5     0.5   
      189  0.5     0.5     0.5     0.5   
      190  0.5     0.5     0.5     0.5   
      191  0.5     0.5     0.5     0.5   
      192  0.5     0.5     0.5     0.5   
      193  0.5     0.5     0.5     0.5   
      194  0.5     0.5     0.5     0.5   
      195  0.5     0.5     0.5     0.5   
      196  0.5     0.5     0.5     0.5   
      197  0.5     0.5     0.5     0.5   
      198  0.5     0.5     0.5     0.5   
      199  1       1       0       0     
      200  1       1       0       0     
      201  1       1       0       0     
      202  1       1       0       0     
      203  1       1       0       0     
      204  1       1       0       0     
      205  1       1       0       0     
      206  1       1       0       0     
      207  1       1       0       0     
      208  1       1       0       0     
      209  1       1       0       0     
      210  1       1       0       0     
      211  1       1       0       0     
      212  1       1       0       0     
      213  1       1       0       0     
      214  1       1       0       0     
      215  1       1       0       0     
      216  1       1       0       0     
      217  1       1       0       0     
      218  1       1       0       0     
      219  1       1       0       0     
      220  1       1       0       0     

---

    Code
      rand_rows
    Output
      # A tibble: 10 x 22
         STUDYID USUBJID             ARM       ACTARM    ISTPT      AVAL AVALC   
         <chr>   <chr>               <fct>     <fct>     <fct>     <dbl> <chr>   
       1 AB12345 AB12345-USA-13-id-3 A: Drug X A: Drug X ""         0    NEGATIVE
       2 AB12345 AB12345-CHN-3-id-5  A: Drug X A: Drug X ""         1    POSITIVE
       3 AB12345 AB12345-RUS-1-id-6  A: Drug X A: Drug X "Predose"  0    0       
       4 AB12345 AB12345-CHN-11-id-2 A: Drug X A: Drug X ""         1.07 POSITIVE
       5 AB12345 AB12345-CHN-11-id-2 A: Drug X A: Drug X ""         1.07 POSITIVE
       6 AB12345 AB12345-USA-13-id-3 A: Drug X A: Drug X ""         0    NEGATIVE
       7 AB12345 AB12345-CHN-11-id-2 A: Drug X A: Drug X ""         1    POSITIVE
       8 AB12345 AB12345-JPN-4-id-7  A: Drug X A: Drug X ""         1    POSITIVE
       9 AB12345 AB12345-RUS-1-id-6  A: Drug X A: Drug X ""         1    POSITIVE
      10 AB12345 AB12345-CHN-3-id-5  A: Drug X A: Drug X ""         0    N       
         AVALU   PARAM                             PARAMCD  VISIT VISITDY
         <fct>   <fct>                             <fct>    <fct>   <int>
       1 ""      NAB interpreted per sample result RESULT2  Day 1       1
       2 ""      ADA Status of a patient           ADASTAT1 Day 1       1
       3 "weeks" Time to onset of ADA              TIMADA1  Day 1       1
       4 "titer" Neutralizing Antibody titer units R1800001 Day 1       1
       5 "titer" Antibody titer units              R1800000 Day 1       1
       6 ""      NAB Status of a patient           ADASTAT2 Day 1       1
       7 ""      NAB interpreted per sample result RESULT2  Day 1       1
       8 ""      ADA interpreted per sample result RESULT1  Day 1       1
       9 ""      Baseline, Neutralizing Antibody   BFLAG2   Day 1       1
      10 ""      Treatment enhanced ADA            ENHANC1  Day 1       1
         PARCAT1                         ADABLFL ADAPBLFL ABLFL RELTMU ATACHAR NRELTM1
         <fct>                           <fct>   <fct>    <fct> <fct>  <fct>     <dbl>
       1 A: Drug X Antibody              Y       Y        <NA>  day    H+       0.0625
       2 A: Drug X Antibody              Y       Y        <NA>  day    E+       0.5   
       3 A: Drug X Antibody              Y       Y        Y     day    G+       0     
       4 A: Drug X Antibody              Y       Y        <NA>  day    D+       0.5   
       5 A: Drug X Antibody              Y       Y        <NA>  day    D+       0.0625
       6 A: Drug X Neutralizing Antibody Y       Y        <NA>  day    H+       0.5   
       7 A: Drug X Antibody              Y       Y        <NA>  day    D+       0.0625
       8 A: Drug X Antibody              Y       Y        <NA>  day    F+       0.125 
       9 A: Drug X Antibody              Y       Y        <NA>  day    G+       0.0208
      10 A: Drug X Antibody              Y       Y        <NA>  day    E+       0.0625
         ARELTM1 NRELTM2 ARELTM2
           <dbl>   <dbl>   <dbl>
       1  0.0625  0.0625  0.0625
       2  0.5     0.5     0.5   
       3  0       0       0     
       4  0.5     0.5     0.5   
       5  0.0625  0.0625  0.0625
       6  0.5     0.5     0.5   
       7  0.0625  0.0625  0.0625
       8  0.125   0.125   0.125 
       9  0.0208  0.0208  0.0208
      10  0.0625  0.0625  0.0625

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
          STUDYID USUBJID            SUBJID SITEID   AGE AGEU  SEX  
          <chr>   <chr>              <chr>  <chr>  <int> <fct> <fct>
        1 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
        2 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
        3 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
        4 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
        5 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
        6 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
        7 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
        8 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
        9 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       10 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       11 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       12 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       13 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       14 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       15 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       16 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       17 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       18 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       19 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       20 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       21 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       22 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       23 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       24 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       25 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       26 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       27 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       28 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       29 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       30 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       31 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       32 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       33 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       34 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       35 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       36 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       37 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       38 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       39 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       40 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       41 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       42 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       43 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       44 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       45 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       46 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       47 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       48 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       49 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       50 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       51 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       52 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       53 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       54 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       55 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       56 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       57 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       58 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       59 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       60 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       61 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       62 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       63 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       64 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       65 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       66 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       67 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       68 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       69 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       70 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       71 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       72 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       73 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       74 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       75 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       76 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       77 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       78 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       79 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       80 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       81 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       82 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       83 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       84 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       85 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       86 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       87 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       88 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       89 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       90 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       91 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       92 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       93 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       94 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       95 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       96 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       97 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       98 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       99 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      100 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      101 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      102 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      103 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      104 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      105 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      106 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      107 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      108 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      109 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      110 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      111 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      112 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      113 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      114 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      115 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      116 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      117 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      118 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      119 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      120 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      121 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      122 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      123 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      124 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      125 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      126 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      127 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      128 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      129 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      130 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      131 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      132 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      133 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      134 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      135 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      136 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      137 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      138 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      139 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      140 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      141 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      142 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      143 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      144 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      145 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      146 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      147 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      148 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      149 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      150 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      151 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      152 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      153 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      154 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      155 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      156 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      157 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      158 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      159 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      160 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      161 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      162 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      163 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      164 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      165 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      166 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      167 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      168 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      169 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      170 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      171 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      172 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      173 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      174 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      175 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      176 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      177 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      178 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      179 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      180 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      181 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      182 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      183 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      184 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      185 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      186 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      187 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      188 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      189 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      190 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      191 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      192 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      193 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      194 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      195 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      196 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      197 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      198 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      199 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      200 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      201 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      202 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      203 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      204 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      205 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      206 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      207 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      208 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      209 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      210 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      211 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      212 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      213 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      214 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      215 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      216 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      217 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      218 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      219 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      220 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      221 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      222 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      223 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      224 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      225 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      226 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      227 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      228 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      229 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      230 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      231 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      232 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      233 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      234 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      235 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      236 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      237 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      238 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      239 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      240 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      241 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      242 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      243 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      244 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      245 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      246 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      247 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      248 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      249 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      250 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      251 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      252 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      253 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      254 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      255 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      256 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      257 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      258 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      259 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      260 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      261 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      262 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      263 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      264 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      265 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      266 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      267 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      268 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      269 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      270 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      271 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      272 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      273 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      274 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      275 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      276 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      277 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      278 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      279 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      280 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      281 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      282 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      283 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      284 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      285 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      286 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      287 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      288 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
          RACE                      ETHNIC  COUNTRY TRT01P         TRT01A        
          <fct>                     <fct>   <fct>   <fct>          <fct>         
        1 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
        2 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
        3 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
        4 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
        5 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
        6 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
        7 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
        8 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
        9 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       10 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       11 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       12 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       13 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       14 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       15 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       16 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       17 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       18 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       19 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       20 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       21 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       22 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       23 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       24 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       25 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       26 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       27 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       28 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       29 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       30 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       31 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       32 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       33 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       34 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       35 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       36 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       37 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       38 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       39 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       40 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       41 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       42 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       43 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       44 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       45 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       46 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       47 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       48 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       49 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       50 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       51 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       52 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       53 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       54 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       55 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       56 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       57 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       58 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       59 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       60 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       61 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       62 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       63 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       64 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       65 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       66 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       67 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       68 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       69 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       70 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       71 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       72 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       73 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       74 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       75 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       76 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       77 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       78 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       79 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       80 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       81 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       82 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       83 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       84 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       85 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       86 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       87 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       88 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       89 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       90 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       91 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       92 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       93 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       94 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       95 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       96 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       97 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       98 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
       99 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      100 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      101 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      102 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      103 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      104 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      105 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      106 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      107 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      108 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      109 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      110 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      111 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      112 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      113 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      114 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      115 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      116 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      117 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      118 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      119 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      120 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      121 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      122 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      123 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      124 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      125 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      126 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      127 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      128 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      129 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      130 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      131 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      132 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      133 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      134 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      135 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      136 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      137 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      138 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      139 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      140 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      141 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      142 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      143 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      144 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      145 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      146 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      147 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      148 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      149 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      150 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      151 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      152 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      153 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      154 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      155 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      156 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      157 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      158 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      159 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      160 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      161 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      162 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      163 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      164 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      165 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      166 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      167 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      168 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      169 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      170 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      171 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      172 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      173 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      174 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      175 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      176 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      177 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      178 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      179 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      180 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      181 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      182 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      183 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      184 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      185 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      186 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      187 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      188 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      189 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      190 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      191 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      192 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      193 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      194 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      195 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      196 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      197 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      198 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      199 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      200 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      201 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      202 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      203 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      204 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      205 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      206 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      207 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      208 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      209 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      210 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      211 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      212 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      213 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      214 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      215 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      216 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      217 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      218 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      219 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      220 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      221 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      222 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      223 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      224 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      225 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      226 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      227 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      228 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      229 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      230 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      231 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      232 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      233 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      234 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      235 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      236 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      237 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      238 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      239 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      240 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      241 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      242 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      243 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      244 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      245 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      246 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      247 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      248 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      249 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      250 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      251 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      252 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      253 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      254 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      255 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      256 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      257 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      258 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      259 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      260 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      261 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      262 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      263 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      264 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      265 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      266 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      267 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      268 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      269 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      270 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      271 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      272 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      273 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      274 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      275 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      276 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      277 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      278 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      279 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      280 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      281 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      282 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      283 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      284 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      285 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      286 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      287 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
      288 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     C: Combination C: Combination
          REGION1       ITTFL SAFFL TRTSDTM             TRTEDTM             QSSEQ
          <fct>         <fct> <fct> <dttm>              <dttm>              <int>
        1 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53     1
        2 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53     2
        3 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53     3
        4 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53     4
        5 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53     5
        6 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53     6
        7 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53     7
        8 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53     8
        9 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53     9
       10 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    10
       11 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    11
       12 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    12
       13 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    13
       14 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    14
       15 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    15
       16 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    16
       17 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    17
       18 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    18
       19 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    19
       20 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    20
       21 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    21
       22 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    22
       23 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    23
       24 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    24
       25 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    25
       26 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    26
       27 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    27
       28 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    28
       29 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    29
       30 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    30
       31 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
       32 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
       33 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
       34 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
       35 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
       36 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
       37 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
       38 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
       39 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
       40 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
       41 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
       42 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
       43 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
       44 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
       45 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
       46 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
       47 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    31
       48 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    32
       49 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    33
       50 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    34
       51 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    35
       52 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    36
       53 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    37
       54 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    38
       55 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    39
       56 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    40
       57 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    41
       58 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    42
       59 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    43
       60 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    44
       61 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    45
       62 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    46
       63 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    47
       64 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    48
       65 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    49
       66 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    50
       67 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    51
       68 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    52
       69 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    53
       70 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    54
       71 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    55
       72 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    56
       73 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    57
       74 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    58
       75 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    59
       76 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    60
       77 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
       78 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
       79 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
       80 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
       81 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
       82 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
       83 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
       84 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
       85 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
       86 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
       87 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
       88 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
       89 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
       90 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
       91 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
       92 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
       93 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    61
       94 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    62
       95 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    63
       96 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    64
       97 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    65
       98 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    66
       99 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    67
      100 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    68
      101 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    69
      102 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    70
      103 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    71
      104 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    72
      105 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    73
      106 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    74
      107 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    75
      108 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    76
      109 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    77
      110 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    78
      111 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    79
      112 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    80
      113 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    81
      114 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    82
      115 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    83
      116 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    84
      117 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    85
      118 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    86
      119 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    87
      120 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    88
      121 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    89
      122 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    90
      123 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      124 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      125 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      126 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      127 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      128 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      129 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      130 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      131 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      132 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      133 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      134 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      135 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      136 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      137 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      138 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      139 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      140 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      141 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      142 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    91
      143 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    92
      144 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    93
      145 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    94
      146 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    95
      147 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    96
      148 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    97
      149 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    98
      150 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    99
      151 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   100
      152 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   101
      153 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   102
      154 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   103
      155 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   104
      156 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   105
      157 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   106
      158 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   107
      159 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   108
      160 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   109
      161 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   110
      162 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   111
      163 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   112
      164 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   113
      165 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   114
      166 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   115
      167 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   116
      168 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   117
      169 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   118
      170 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   119
      171 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   120
      172 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      173 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      174 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      175 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      176 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      177 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      178 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      179 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      180 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      181 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      182 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      183 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      184 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      185 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      186 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      187 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      188 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      189 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      190 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      191 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   121
      192 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   122
      193 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   123
      194 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   124
      195 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   125
      196 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   126
      197 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   127
      198 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   128
      199 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   129
      200 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   130
      201 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   131
      202 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   132
      203 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   133
      204 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   134
      205 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   135
      206 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   136
      207 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   137
      208 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   138
      209 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   139
      210 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   140
      211 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   141
      212 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   142
      213 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   143
      214 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   144
      215 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   145
      216 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   146
      217 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   147
      218 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   148
      219 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   149
      220 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   150
      221 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      222 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      223 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      224 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      225 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      226 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      227 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      228 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      229 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      230 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      231 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      232 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      233 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      234 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      235 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      236 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      237 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      238 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      239 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      240 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   151
      241 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   152
      242 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   153
      243 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   154
      244 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   155
      245 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   156
      246 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   157
      247 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   158
      248 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   159
      249 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   160
      250 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   161
      251 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   162
      252 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   163
      253 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   164
      254 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   165
      255 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   166
      256 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   167
      257 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   168
      258 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   169
      259 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   170
      260 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   171
      261 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   172
      262 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   173
      263 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   174
      264 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   175
      265 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   176
      266 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   177
      267 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   178
      268 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   179
      269 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53   180
      270 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      271 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      272 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      273 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      274 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      275 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      276 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      277 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      278 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      279 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      280 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      281 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      282 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      283 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      284 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      285 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      286 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      287 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
      288 South America Y     Y     2021-01-17 22:43:53 2024-01-18 16:43:53    NA
          QSCAT              QSSCAT QSDTC               QSSTAT   QSSTRESC QSSTRESU
          <fct>              <fct>  <dttm>              <fct>    <fct>    <fct>   
        1 EORTC QLQ-C30 V3.0 <NA>   2021-01-13 22:43:53 <NA>     1        <NA>    
        2 EORTC QLQ-C30 V3.0 <NA>   2021-01-13 22:43:53 <NA>     3        <NA>    
        3 EORTC QLQ-C30 V3.0 <NA>   2021-01-13 22:43:53 <NA>     1        <NA>    
        4 EORTC QLQ-C30 V3.0 <NA>   2021-01-13 22:43:53 NOT DONE <NA>     <NA>    
        5 EORTC QLQ-C30 V3.0 <NA>   2021-01-13 22:43:53 <NA>     1        <NA>    
        6 EORTC QLQ-C30 V3.0 <NA>   2021-01-13 22:43:53 <NA>     2        <NA>    
        7 EORTC QLQ-C30 V3.0 <NA>   2021-01-13 22:43:53 <NA>     4        <NA>    
        8 EORTC QLQ-C30 V3.0 <NA>   2021-01-13 22:43:53 <NA>     3        <NA>    
        9 EORTC QLQ-C30 V3.0 <NA>   2021-01-13 22:43:53 <NA>     1        <NA>    
       10 EORTC QLQ-C30 V3.0 <NA>   2021-01-13 22:43:53 NOT DONE <NA>     <NA>    
       11 EORTC QLQ-C30 V3.0 <NA>   2021-01-13 22:43:53 <NA>     3        <NA>    
       12 EORTC QLQ-C30 V3.0 <NA>   2021-01-13 22:43:53 <NA>     2        <NA>    
       13 EORTC QLQ-C30 V3.0 <NA>   2021-01-13 22:43:53 <NA>     1        <NA>    
       14 EORTC QLQ-C30 V3.0 <NA>   2021-01-13 22:43:53 <NA>     3        <NA>    
       15 EORTC QLQ-C30 V3.0 <NA>   2021-01-13 22:43:53 <NA>     1        <NA>    
       16 EORTC QLQ-C30 V3.0 <NA>   2021-01-13 22:43:53 <NA>     1        <NA>    
       17 EORTC QLQ-C30 V3.0 <NA>   2021-01-13 22:43:53 <NA>     1        <NA>    
       18 EORTC QLQ-C30 V3.0 <NA>   2021-01-13 22:43:53 <NA>     4        <NA>    
       19 EORTC QLQ-C30 V3.0 <NA>   2021-01-13 22:43:53 <NA>     1        <NA>    
       20 EORTC QLQ-C30 V3.0 <NA>   2021-01-13 22:43:53 <NA>     2        <NA>    
       21 EORTC QLQ-C30 V3.0 <NA>   2021-01-13 22:43:53 <NA>     2        <NA>    
       22 EORTC QLQ-C30 V3.0 <NA>   2021-01-13 22:43:53 NOT DONE <NA>     <NA>    
       23 EORTC QLQ-C30 V3.0 <NA>   2021-01-13 22:43:53 <NA>     2        <NA>    
       24 EORTC QLQ-C30 V3.0 <NA>   2021-01-13 22:43:53 <NA>     4        <NA>    
       25 EORTC QLQ-C30 V3.0 <NA>   2021-01-13 22:43:53 <NA>     1        <NA>    
       26 EORTC QLQ-C30 V3.0 <NA>   2021-01-13 22:43:53 <NA>     2        <NA>    
       27 EORTC QLQ-C30 V3.0 <NA>   2021-01-13 22:43:53 <NA>     2        <NA>    
       28 EORTC QLQ-C30 V3.0 <NA>   2021-01-13 22:43:53 <NA>     1        <NA>    
       29 EORTC QLQ-C30 V3.0 <NA>   2021-01-13 22:43:53 <NA>     7        <NA>    
       30 EORTC QLQ-C30 V3.0 <NA>   2021-01-13 22:43:53 <NA>     1        <NA>    
       31 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
       32 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
       33 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
       34 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
       35 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
       36 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
       37 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
       38 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
       39 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
       40 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
       41 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
       42 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
       43 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
       44 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
       45 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
       46 <NA>               <NA>   NA                  <NA>     <NA>     <NA>    
       47 EORTC QLQ-C30 V3.0 <NA>   2021-01-17 22:43:53 <NA>     4        <NA>    
       48 EORTC QLQ-C30 V3.0 <NA>   2021-01-17 22:43:53 <NA>     3        <NA>    
       49 EORTC QLQ-C30 V3.0 <NA>   2021-01-17 22:43:53 <NA>     1        <NA>    
       50 EORTC QLQ-C30 V3.0 <NA>   2021-01-17 22:43:53 <NA>     3        <NA>    
       51 EORTC QLQ-C30 V3.0 <NA>   2021-01-17 22:43:53 <NA>     1        <NA>    
       52 EORTC QLQ-C30 V3.0 <NA>   2021-01-17 22:43:53 <NA>     2        <NA>    
       53 EORTC QLQ-C30 V3.0 <NA>   2021-01-17 22:43:53 <NA>     3        <NA>    
       54 EORTC QLQ-C30 V3.0 <NA>   2021-01-17 22:43:53 <NA>     4        <NA>    
       55 EORTC QLQ-C30 V3.0 <NA>   2021-01-17 22:43:53 <NA>     3        <NA>    
       56 EORTC QLQ-C30 V3.0 <NA>   2021-01-17 22:43:53 NOT DONE <NA>     <NA>    
       57 EORTC QLQ-C30 V3.0 <NA>   2021-01-17 22:43:53 NOT DONE <NA>     <NA>    
       58 EORTC QLQ-C30 V3.0 <NA>   2021-01-17 22:43:53 <NA>     1        <NA>    
       59 EORTC QLQ-C30 V3.0 <NA>   2021-01-17 22:43:53 <NA>     3        <NA>    
       60 EORTC QLQ-C30 V3.0 <NA>   2021-01-17 22:43:53 <NA>     4        <NA>    
       61 EORTC QLQ-C30 V3.0 <NA>   2021-01-17 22:43:53 <NA>     4        <NA>    
       62 EORTC QLQ-C30 V3.0 <NA>   2021-01-17 22:43:53 <NA>     3        <NA>    
       63 EORTC QLQ-C30 V3.0 <NA>   2021-01-17 22:43:53 <NA>     4        <NA>    
       64 EORTC QLQ-C30 V3.0 <NA>   2021-01-17 22:43:53 <NA>     1        <NA>    
       65 EORTC QLQ-C30 V3.0 <NA>   2021-01-17 22:43:53 NOT DONE <NA>     <NA>    
       66 EORTC QLQ-C30 V3.0 <NA>   2021-01-17 22:43:53 <NA>     2        <NA>    
       67 EORTC QLQ-C30 V3.0 <NA>   2021-01-17 22:43:53 <NA>     4        <NA>    
       68 EORTC QLQ-C30 V3.0 <NA>   2021-01-17 22:43:53 <NA>     2        <NA>    
       69 EORTC QLQ-C30 V3.0 <NA>   2021-01-17 22:43:53 <NA>     3        <NA>    
       70 EORTC QLQ-C30 V3.0 <NA>   2021-01-17 22:43:53 <NA>     1        <NA>    
       71 EORTC QLQ-C30 V3.0 <NA>   2021-01-17 22:43:53 <NA>     4        <NA>    
       72 EORTC QLQ-C30 V3.0 <NA>   2021-01-17 22:43:53 <NA>     3        <NA>    
       73 EORTC QLQ-C30 V3.0 <NA>   2021-01-17 22:43:53 NOT DONE <NA>     <NA>    
       74 EORTC QLQ-C30 V3.0 <NA>   2021-01-17 22:43:53 <NA>     2        <NA>    
       75 EORTC QLQ-C30 V3.0 <NA>   2021-01-17 22:43:53 <NA>     6        <NA>    
       76 EORTC QLQ-C30 V3.0 <NA>   2021-01-17 22:43:53 NOT DONE <NA>     <NA>    
       77 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
       78 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
       79 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
       80 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
       81 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
       82 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
       83 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
       84 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
       85 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
       86 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
       87 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
       88 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
       89 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
       90 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
       91 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
       92 <NA>               <NA>   NA                  <NA>     <NA>     <NA>    
       93 EORTC QLQ-C30 V3.0 <NA>   2021-01-18 22:43:53 NOT DONE <NA>     <NA>    
       94 EORTC QLQ-C30 V3.0 <NA>   2021-01-18 22:43:53 NOT DONE <NA>     <NA>    
       95 EORTC QLQ-C30 V3.0 <NA>   2021-01-18 22:43:53 <NA>     1        <NA>    
       96 EORTC QLQ-C30 V3.0 <NA>   2021-01-18 22:43:53 <NA>     1        <NA>    
       97 EORTC QLQ-C30 V3.0 <NA>   2021-01-18 22:43:53 <NA>     2        <NA>    
       98 EORTC QLQ-C30 V3.0 <NA>   2021-01-18 22:43:53 NOT DONE <NA>     <NA>    
       99 EORTC QLQ-C30 V3.0 <NA>   2021-01-18 22:43:53 <NA>     2        <NA>    
      100 EORTC QLQ-C30 V3.0 <NA>   2021-01-18 22:43:53 <NA>     4        <NA>    
      101 EORTC QLQ-C30 V3.0 <NA>   2021-01-18 22:43:53 <NA>     2        <NA>    
      102 EORTC QLQ-C30 V3.0 <NA>   2021-01-18 22:43:53 <NA>     4        <NA>    
      103 EORTC QLQ-C30 V3.0 <NA>   2021-01-18 22:43:53 NOT DONE <NA>     <NA>    
      104 EORTC QLQ-C30 V3.0 <NA>   2021-01-18 22:43:53 <NA>     2        <NA>    
      105 EORTC QLQ-C30 V3.0 <NA>   2021-01-18 22:43:53 <NA>     3        <NA>    
      106 EORTC QLQ-C30 V3.0 <NA>   2021-01-18 22:43:53 <NA>     2        <NA>    
      107 EORTC QLQ-C30 V3.0 <NA>   2021-01-18 22:43:53 <NA>     1        <NA>    
      108 EORTC QLQ-C30 V3.0 <NA>   2021-01-18 22:43:53 <NA>     2        <NA>    
      109 EORTC QLQ-C30 V3.0 <NA>   2021-01-18 22:43:53 <NA>     2        <NA>    
      110 EORTC QLQ-C30 V3.0 <NA>   2021-01-18 22:43:53 <NA>     1        <NA>    
      111 EORTC QLQ-C30 V3.0 <NA>   2021-01-18 22:43:53 NOT DONE <NA>     <NA>    
      112 EORTC QLQ-C30 V3.0 <NA>   2021-01-18 22:43:53 <NA>     4        <NA>    
      113 EORTC QLQ-C30 V3.0 <NA>   2021-01-18 22:43:53 <NA>     3        <NA>    
      114 EORTC QLQ-C30 V3.0 <NA>   2021-01-18 22:43:53 <NA>     2        <NA>    
      115 EORTC QLQ-C30 V3.0 <NA>   2021-01-18 22:43:53 NOT DONE <NA>     <NA>    
      116 EORTC QLQ-C30 V3.0 <NA>   2021-01-18 22:43:53 <NA>     4        <NA>    
      117 EORTC QLQ-C30 V3.0 <NA>   2021-01-18 22:43:53 <NA>     2        <NA>    
      118 EORTC QLQ-C30 V3.0 <NA>   2021-01-18 22:43:53 <NA>     3        <NA>    
      119 EORTC QLQ-C30 V3.0 <NA>   2021-01-18 22:43:53 <NA>     4        <NA>    
      120 EORTC QLQ-C30 V3.0 <NA>   2021-01-18 22:43:53 <NA>     1        <NA>    
      121 EORTC QLQ-C30 V3.0 <NA>   2021-01-18 22:43:53 <NA>     3        <NA>    
      122 EORTC QLQ-C30 V3.0 <NA>   2021-01-18 22:43:53 NOT DONE <NA>     <NA>    
      123 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      124 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      125 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      126 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      127 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      128 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      129 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      130 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      131 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      132 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      133 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      134 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      135 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      136 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      137 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      138 <NA>               <NA>   NA                  <NA>     <NA>     <NA>    
      139 <NA>               <NA>   NA                  <NA>     <NA>     <NA>    
      140 <NA>               <NA>   NA                  <NA>     <NA>     <NA>    
      141 <NA>               <NA>   NA                  <NA>     <NA>     <NA>    
      142 EORTC QLQ-C30 V3.0 <NA>   2021-02-15 22:43:53 <NA>     1        <NA>    
      143 EORTC QLQ-C30 V3.0 <NA>   2021-02-15 22:43:53 <NA>     2        <NA>    
      144 EORTC QLQ-C30 V3.0 <NA>   2021-02-15 22:43:53 NOT DONE <NA>     <NA>    
      145 EORTC QLQ-C30 V3.0 <NA>   2021-02-15 22:43:53 <NA>     3        <NA>    
      146 EORTC QLQ-C30 V3.0 <NA>   2021-02-15 22:43:53 <NA>     1        <NA>    
      147 EORTC QLQ-C30 V3.0 <NA>   2021-02-15 22:43:53 NOT DONE <NA>     <NA>    
      148 EORTC QLQ-C30 V3.0 <NA>   2021-02-15 22:43:53 <NA>     2        <NA>    
      149 EORTC QLQ-C30 V3.0 <NA>   2021-02-15 22:43:53 NOT DONE <NA>     <NA>    
      150 EORTC QLQ-C30 V3.0 <NA>   2021-02-15 22:43:53 <NA>     1        <NA>    
      151 EORTC QLQ-C30 V3.0 <NA>   2021-02-15 22:43:53 <NA>     2        <NA>    
      152 EORTC QLQ-C30 V3.0 <NA>   2021-02-15 22:43:53 NOT DONE <NA>     <NA>    
      153 EORTC QLQ-C30 V3.0 <NA>   2021-02-15 22:43:53 <NA>     2        <NA>    
      154 EORTC QLQ-C30 V3.0 <NA>   2021-02-15 22:43:53 NOT DONE <NA>     <NA>    
      155 EORTC QLQ-C30 V3.0 <NA>   2021-02-15 22:43:53 <NA>     4        <NA>    
      156 EORTC QLQ-C30 V3.0 <NA>   2021-02-15 22:43:53 <NA>     4        <NA>    
      157 EORTC QLQ-C30 V3.0 <NA>   2021-02-15 22:43:53 <NA>     4        <NA>    
      158 EORTC QLQ-C30 V3.0 <NA>   2021-02-15 22:43:53 <NA>     1        <NA>    
      159 EORTC QLQ-C30 V3.0 <NA>   2021-02-15 22:43:53 NOT DONE <NA>     <NA>    
      160 EORTC QLQ-C30 V3.0 <NA>   2021-02-15 22:43:53 <NA>     3        <NA>    
      161 EORTC QLQ-C30 V3.0 <NA>   2021-02-15 22:43:53 <NA>     3        <NA>    
      162 EORTC QLQ-C30 V3.0 <NA>   2021-02-15 22:43:53 NOT DONE <NA>     <NA>    
      163 EORTC QLQ-C30 V3.0 <NA>   2021-02-15 22:43:53 <NA>     1        <NA>    
      164 EORTC QLQ-C30 V3.0 <NA>   2021-02-15 22:43:53 <NA>     1        <NA>    
      165 EORTC QLQ-C30 V3.0 <NA>   2021-02-15 22:43:53 <NA>     3        <NA>    
      166 EORTC QLQ-C30 V3.0 <NA>   2021-02-15 22:43:53 NOT DONE <NA>     <NA>    
      167 EORTC QLQ-C30 V3.0 <NA>   2021-02-15 22:43:53 <NA>     1        <NA>    
      168 EORTC QLQ-C30 V3.0 <NA>   2021-02-15 22:43:53 NOT DONE <NA>     <NA>    
      169 EORTC QLQ-C30 V3.0 <NA>   2021-02-15 22:43:53 <NA>     3        <NA>    
      170 EORTC QLQ-C30 V3.0 <NA>   2021-02-15 22:43:53 <NA>     3        <NA>    
      171 EORTC QLQ-C30 V3.0 <NA>   2021-02-15 22:43:53 <NA>     6        <NA>    
      172 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      173 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      174 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      175 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      176 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      177 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      178 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      179 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      180 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      181 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      182 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      183 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      184 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      185 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      186 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      187 <NA>               <NA>   NA                  <NA>     <NA>     <NA>    
      188 <NA>               <NA>   NA                  <NA>     <NA>     <NA>    
      189 <NA>               <NA>   NA                  <NA>     <NA>     <NA>    
      190 <NA>               <NA>   NA                  <NA>     <NA>     <NA>    
      191 EORTC QLQ-C30 V3.0 <NA>   2021-03-15 22:43:53 <NA>     2        <NA>    
      192 EORTC QLQ-C30 V3.0 <NA>   2021-03-15 22:43:53 NOT DONE <NA>     <NA>    
      193 EORTC QLQ-C30 V3.0 <NA>   2021-03-15 22:43:53 NOT DONE <NA>     <NA>    
      194 EORTC QLQ-C30 V3.0 <NA>   2021-03-15 22:43:53 <NA>     1        <NA>    
      195 EORTC QLQ-C30 V3.0 <NA>   2021-03-15 22:43:53 <NA>     1        <NA>    
      196 EORTC QLQ-C30 V3.0 <NA>   2021-03-15 22:43:53 <NA>     3        <NA>    
      197 EORTC QLQ-C30 V3.0 <NA>   2021-03-15 22:43:53 <NA>     2        <NA>    
      198 EORTC QLQ-C30 V3.0 <NA>   2021-03-15 22:43:53 <NA>     2        <NA>    
      199 EORTC QLQ-C30 V3.0 <NA>   2021-03-15 22:43:53 <NA>     4        <NA>    
      200 EORTC QLQ-C30 V3.0 <NA>   2021-03-15 22:43:53 <NA>     2        <NA>    
      201 EORTC QLQ-C30 V3.0 <NA>   2021-03-15 22:43:53 NOT DONE <NA>     <NA>    
      202 EORTC QLQ-C30 V3.0 <NA>   2021-03-15 22:43:53 <NA>     2        <NA>    
      203 EORTC QLQ-C30 V3.0 <NA>   2021-03-15 22:43:53 NOT DONE <NA>     <NA>    
      204 EORTC QLQ-C30 V3.0 <NA>   2021-03-15 22:43:53 <NA>     3        <NA>    
      205 EORTC QLQ-C30 V3.0 <NA>   2021-03-15 22:43:53 <NA>     1        <NA>    
      206 EORTC QLQ-C30 V3.0 <NA>   2021-03-15 22:43:53 NOT DONE <NA>     <NA>    
      207 EORTC QLQ-C30 V3.0 <NA>   2021-03-15 22:43:53 <NA>     4        <NA>    
      208 EORTC QLQ-C30 V3.0 <NA>   2021-03-15 22:43:53 <NA>     3        <NA>    
      209 EORTC QLQ-C30 V3.0 <NA>   2021-03-15 22:43:53 <NA>     3        <NA>    
      210 EORTC QLQ-C30 V3.0 <NA>   2021-03-15 22:43:53 <NA>     4        <NA>    
      211 EORTC QLQ-C30 V3.0 <NA>   2021-03-15 22:43:53 <NA>     4        <NA>    
      212 EORTC QLQ-C30 V3.0 <NA>   2021-03-15 22:43:53 <NA>     3        <NA>    
      213 EORTC QLQ-C30 V3.0 <NA>   2021-03-15 22:43:53 <NA>     4        <NA>    
      214 EORTC QLQ-C30 V3.0 <NA>   2021-03-15 22:43:53 <NA>     3        <NA>    
      215 EORTC QLQ-C30 V3.0 <NA>   2021-03-15 22:43:53 NOT DONE <NA>     <NA>    
      216 EORTC QLQ-C30 V3.0 <NA>   2021-03-15 22:43:53 <NA>     1        <NA>    
      217 EORTC QLQ-C30 V3.0 <NA>   2021-03-15 22:43:53 <NA>     1        <NA>    
      218 EORTC QLQ-C30 V3.0 <NA>   2021-03-15 22:43:53 <NA>     2        <NA>    
      219 EORTC QLQ-C30 V3.0 <NA>   2021-03-15 22:43:53 NOT DONE <NA>     <NA>    
      220 EORTC QLQ-C30 V3.0 <NA>   2021-03-15 22:43:53 <NA>     1        <NA>    
      221 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      222 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      223 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      224 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      225 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      226 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      227 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      228 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      229 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      230 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      231 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      232 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      233 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      234 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      235 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      236 <NA>               <NA>   NA                  <NA>     <NA>     <NA>    
      237 <NA>               <NA>   NA                  <NA>     <NA>     <NA>    
      238 <NA>               <NA>   NA                  <NA>     <NA>     <NA>    
      239 <NA>               <NA>   NA                  <NA>     <NA>     <NA>    
      240 EORTC QLQ-C30 V3.0 <NA>   2021-04-12 22:43:53 <NA>     1        <NA>    
      241 EORTC QLQ-C30 V3.0 <NA>   2021-04-12 22:43:53 <NA>     3        <NA>    
      242 EORTC QLQ-C30 V3.0 <NA>   2021-04-12 22:43:53 NOT DONE <NA>     <NA>    
      243 EORTC QLQ-C30 V3.0 <NA>   2021-04-12 22:43:53 <NA>     1        <NA>    
      244 EORTC QLQ-C30 V3.0 <NA>   2021-04-12 22:43:53 NOT DONE <NA>     <NA>    
      245 EORTC QLQ-C30 V3.0 <NA>   2021-04-12 22:43:53 <NA>     1        <NA>    
      246 EORTC QLQ-C30 V3.0 <NA>   2021-04-12 22:43:53 <NA>     2        <NA>    
      247 EORTC QLQ-C30 V3.0 <NA>   2021-04-12 22:43:53 <NA>     4        <NA>    
      248 EORTC QLQ-C30 V3.0 <NA>   2021-04-12 22:43:53 <NA>     4        <NA>    
      249 EORTC QLQ-C30 V3.0 <NA>   2021-04-12 22:43:53 <NA>     3        <NA>    
      250 EORTC QLQ-C30 V3.0 <NA>   2021-04-12 22:43:53 <NA>     2        <NA>    
      251 EORTC QLQ-C30 V3.0 <NA>   2021-04-12 22:43:53 <NA>     2        <NA>    
      252 EORTC QLQ-C30 V3.0 <NA>   2021-04-12 22:43:53 <NA>     3        <NA>    
      253 EORTC QLQ-C30 V3.0 <NA>   2021-04-12 22:43:53 <NA>     3        <NA>    
      254 EORTC QLQ-C30 V3.0 <NA>   2021-04-12 22:43:53 <NA>     4        <NA>    
      255 EORTC QLQ-C30 V3.0 <NA>   2021-04-12 22:43:53 <NA>     1        <NA>    
      256 EORTC QLQ-C30 V3.0 <NA>   2021-04-12 22:43:53 <NA>     4        <NA>    
      257 EORTC QLQ-C30 V3.0 <NA>   2021-04-12 22:43:53 <NA>     2        <NA>    
      258 EORTC QLQ-C30 V3.0 <NA>   2021-04-12 22:43:53 NOT DONE <NA>     <NA>    
      259 EORTC QLQ-C30 V3.0 <NA>   2021-04-12 22:43:53 <NA>     2        <NA>    
      260 EORTC QLQ-C30 V3.0 <NA>   2021-04-12 22:43:53 <NA>     3        <NA>    
      261 EORTC QLQ-C30 V3.0 <NA>   2021-04-12 22:43:53 <NA>     3        <NA>    
      262 EORTC QLQ-C30 V3.0 <NA>   2021-04-12 22:43:53 <NA>     2        <NA>    
      263 EORTC QLQ-C30 V3.0 <NA>   2021-04-12 22:43:53 <NA>     4        <NA>    
      264 EORTC QLQ-C30 V3.0 <NA>   2021-04-12 22:43:53 NOT DONE <NA>     <NA>    
      265 EORTC QLQ-C30 V3.0 <NA>   2021-04-12 22:43:53 <NA>     2        <NA>    
      266 EORTC QLQ-C30 V3.0 <NA>   2021-04-12 22:43:53 <NA>     1        <NA>    
      267 EORTC QLQ-C30 V3.0 <NA>   2021-04-12 22:43:53 <NA>     3        <NA>    
      268 EORTC QLQ-C30 V3.0 <NA>   2021-04-12 22:43:53 <NA>     1        <NA>    
      269 EORTC QLQ-C30 V3.0 <NA>   2021-04-12 22:43:53 <NA>     2        <NA>    
      270 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      271 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      272 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      273 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      274 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      275 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      276 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      277 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      278 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      279 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      280 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      281 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      282 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      283 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      284 EORTC QLQ-C30 V3.0 <NA>   NA                  <NA>     <NA>     <NA>    
      285 <NA>               <NA>   NA                  <NA>     <NA>     <NA>    
      286 <NA>               <NA>   NA                  <NA>     <NA>     <NA>    
      287 <NA>               <NA>   NA                  <NA>     <NA>     <NA>    
      288 <NA>               <NA>   NA                  <NA>     <NA>     <NA>    
          QSORRES       QSORRESU QSTEST                                   QSTESTCD
          <fct>         <fct>    <fct>                                    <fct>   
        1 NOT AT ALL    <NA>     EOR01-Trouble Doing Strenuous Activities EOR0101 
        2 QUITE A BIT   <NA>     EOR01-Trouble Taking Long Walk           EOR0102 
        3 NOT AT ALL    <NA>     EOR01-Trouble Taking Short Walk Outside  EOR0103 
        4 <NA>          <NA>     EOR01-Stay in Bed/Chair During the Day   EOR0104 
        5 NOT AT ALL    <NA>     EOR01-Need Help Eating/Dressing/Washing  EOR0105 
        6 A LITTLE      <NA>     EOR01-Limited in Work/Daily Activities   EOR0106 
        7 VERY MUCH     <NA>     EOR01-Limited Hobbies/Leisure Activities EOR0107 
        8 QUITE A BIT   <NA>     EOR01-Were You Short of Breath           EOR0108 
        9 NOT AT ALL    <NA>     EOR01-Have You Had Pain                  EOR0109 
       10 <NA>          <NA>     EOR01-Did You Need to Rest               EOR0110 
       11 QUITE A BIT   <NA>     EOR01-Have You Had Trouble Sleeping      EOR0111 
       12 A LITTLE      <NA>     EOR01-Have You Felt Weak                 EOR0112 
       13 NOT AT ALL    <NA>     EOR01-Have You Lacked Appetite           EOR0113 
       14 QUITE A BIT   <NA>     EOR01-Have You Felt Nauseated            EOR0114 
       15 NOT AT ALL    <NA>     EOR01-Have You Vomited                   EOR0115 
       16 NOT AT ALL    <NA>     EOR01-Have You Been Constipated          EOR0116 
       17 NOT AT ALL    <NA>     EOR01-Have You Had Diarrhea              EOR0117 
       18 VERY MUCH     <NA>     EOR01-Were You Tired                     EOR0118 
       19 NOT AT ALL    <NA>     EOR01-Pain Interfere Daily Activities    EOR0119 
       20 A LITTLE      <NA>     EOR01-Difficulty Concentrating on Things EOR0120 
       21 A LITTLE      <NA>     EOR01-Did You Feel Tense                 EOR0121 
       22 <NA>          <NA>     EOR01-Did You Worry                      EOR0122 
       23 A LITTLE      <NA>     EOR01-Did You Feel Irritable             EOR0123 
       24 VERY MUCH     <NA>     EOR01-Did You Feel Depressed             EOR0124 
       25 NOT AT ALL    <NA>     EOR01-Had Difficulty Remembering Things  EOR0125 
       26 A LITTLE      <NA>     EOR01-Condition Interfered Family Life   EOR0126 
       27 A LITTLE      <NA>     EOR01-Condition Interfered Social Activ  EOR0127 
       28 NOT AT ALL    <NA>     EOR01-Condition Caused Financial Diff    EOR0128 
       29 7 - EXCELLENT <NA>     EOR01-Rate Your Overall Health           EOR0129 
       30 1 - VERY POOR <NA>     EOR01-Rate Your Overall Quality of Life  EOR0130 
       31 <NA>          <NA>     EOR01-Global Health Status/QoL           EOR0131 
       32 <NA>          <NA>     EOR01-FS:Physical Functioning            EOR0132 
       33 <NA>          <NA>     EOR01-FS:Role Functioning                EOR0133 
       34 <NA>          <NA>     EOR01-FS:Emotional Functioning           EOR0134 
       35 <NA>          <NA>     EOR01-FS:Cognitive Functioning           EOR0135 
       36 <NA>          <NA>     EOR01-FS:Social Functioning              EOR0136 
       37 <NA>          <NA>     EOR01-SS:Fatigue                         EOR0137 
       38 <NA>          <NA>     EOR01-SS:Nausea and Vomiting             EOR0138 
       39 <NA>          <NA>     EOR01-SS:Pain                            EOR0139 
       40 <NA>          <NA>     EOR01-SS:Dyspnoea                        EOR0140 
       41 <NA>          <NA>     EOR01-SS:Insomnia                        EOR0141 
       42 <NA>          <NA>     EOR01-SS:Appetite Loss                   EOR0142 
       43 <NA>          <NA>     EOR01-SS:Constipation                    EOR0143 
       44 <NA>          <NA>     EOR01-SS:Diarrhoea                       EOR0144 
       45 <NA>          <NA>     EOR01-SS:Financial Difficulties          EOR0145 
       46 <NA>          <NA>     <NA>                                     <NA>    
       47 VERY MUCH     <NA>     EOR01-Trouble Doing Strenuous Activities EOR0101 
       48 QUITE A BIT   <NA>     EOR01-Trouble Taking Long Walk           EOR0102 
       49 NOT AT ALL    <NA>     EOR01-Trouble Taking Short Walk Outside  EOR0103 
       50 QUITE A BIT   <NA>     EOR01-Stay in Bed/Chair During the Day   EOR0104 
       51 NOT AT ALL    <NA>     EOR01-Need Help Eating/Dressing/Washing  EOR0105 
       52 A LITTLE      <NA>     EOR01-Limited in Work/Daily Activities   EOR0106 
       53 QUITE A BIT   <NA>     EOR01-Limited Hobbies/Leisure Activities EOR0107 
       54 VERY MUCH     <NA>     EOR01-Were You Short of Breath           EOR0108 
       55 QUITE A BIT   <NA>     EOR01-Have You Had Pain                  EOR0109 
       56 <NA>          <NA>     EOR01-Did You Need to Rest               EOR0110 
       57 <NA>          <NA>     EOR01-Have You Had Trouble Sleeping      EOR0111 
       58 NOT AT ALL    <NA>     EOR01-Have You Felt Weak                 EOR0112 
       59 QUITE A BIT   <NA>     EOR01-Have You Lacked Appetite           EOR0113 
       60 VERY MUCH     <NA>     EOR01-Have You Felt Nauseated            EOR0114 
       61 VERY MUCH     <NA>     EOR01-Have You Vomited                   EOR0115 
       62 QUITE A BIT   <NA>     EOR01-Have You Been Constipated          EOR0116 
       63 VERY MUCH     <NA>     EOR01-Have You Had Diarrhea              EOR0117 
       64 NOT AT ALL    <NA>     EOR01-Were You Tired                     EOR0118 
       65 <NA>          <NA>     EOR01-Pain Interfere Daily Activities    EOR0119 
       66 A LITTLE      <NA>     EOR01-Difficulty Concentrating on Things EOR0120 
       67 VERY MUCH     <NA>     EOR01-Did You Feel Tense                 EOR0121 
       68 A LITTLE      <NA>     EOR01-Did You Worry                      EOR0122 
       69 QUITE A BIT   <NA>     EOR01-Did You Feel Irritable             EOR0123 
       70 NOT AT ALL    <NA>     EOR01-Did You Feel Depressed             EOR0124 
       71 VERY MUCH     <NA>     EOR01-Had Difficulty Remembering Things  EOR0125 
       72 QUITE A BIT   <NA>     EOR01-Condition Interfered Family Life   EOR0126 
       73 <NA>          <NA>     EOR01-Condition Interfered Social Activ  EOR0127 
       74 A LITTLE      <NA>     EOR01-Condition Caused Financial Diff    EOR0128 
       75 6             <NA>     EOR01-Rate Your Overall Health           EOR0129 
       76 <NA>          <NA>     EOR01-Rate Your Overall Quality of Life  EOR0130 
       77 <NA>          <NA>     EOR01-Global Health Status/QoL           EOR0131 
       78 <NA>          <NA>     EOR01-FS:Physical Functioning            EOR0132 
       79 <NA>          <NA>     EOR01-FS:Role Functioning                EOR0133 
       80 <NA>          <NA>     EOR01-FS:Emotional Functioning           EOR0134 
       81 <NA>          <NA>     EOR01-FS:Cognitive Functioning           EOR0135 
       82 <NA>          <NA>     EOR01-FS:Social Functioning              EOR0136 
       83 <NA>          <NA>     EOR01-SS:Fatigue                         EOR0137 
       84 <NA>          <NA>     EOR01-SS:Nausea and Vomiting             EOR0138 
       85 <NA>          <NA>     EOR01-SS:Pain                            EOR0139 
       86 <NA>          <NA>     EOR01-SS:Dyspnoea                        EOR0140 
       87 <NA>          <NA>     EOR01-SS:Insomnia                        EOR0141 
       88 <NA>          <NA>     EOR01-SS:Appetite Loss                   EOR0142 
       89 <NA>          <NA>     EOR01-SS:Constipation                    EOR0143 
       90 <NA>          <NA>     EOR01-SS:Diarrhoea                       EOR0144 
       91 <NA>          <NA>     EOR01-SS:Financial Difficulties          EOR0145 
       92 <NA>          <NA>     <NA>                                     <NA>    
       93 <NA>          <NA>     EOR01-Trouble Doing Strenuous Activities EOR0101 
       94 <NA>          <NA>     EOR01-Trouble Taking Long Walk           EOR0102 
       95 NOT AT ALL    <NA>     EOR01-Trouble Taking Short Walk Outside  EOR0103 
       96 NOT AT ALL    <NA>     EOR01-Stay in Bed/Chair During the Day   EOR0104 
       97 A LITTLE      <NA>     EOR01-Need Help Eating/Dressing/Washing  EOR0105 
       98 <NA>          <NA>     EOR01-Limited in Work/Daily Activities   EOR0106 
       99 A LITTLE      <NA>     EOR01-Limited Hobbies/Leisure Activities EOR0107 
      100 VERY MUCH     <NA>     EOR01-Were You Short of Breath           EOR0108 
      101 A LITTLE      <NA>     EOR01-Have You Had Pain                  EOR0109 
      102 VERY MUCH     <NA>     EOR01-Did You Need to Rest               EOR0110 
      103 <NA>          <NA>     EOR01-Have You Had Trouble Sleeping      EOR0111 
      104 A LITTLE      <NA>     EOR01-Have You Felt Weak                 EOR0112 
      105 QUITE A BIT   <NA>     EOR01-Have You Lacked Appetite           EOR0113 
      106 A LITTLE      <NA>     EOR01-Have You Felt Nauseated            EOR0114 
      107 NOT AT ALL    <NA>     EOR01-Have You Vomited                   EOR0115 
      108 A LITTLE      <NA>     EOR01-Have You Been Constipated          EOR0116 
      109 A LITTLE      <NA>     EOR01-Have You Had Diarrhea              EOR0117 
      110 NOT AT ALL    <NA>     EOR01-Were You Tired                     EOR0118 
      111 <NA>          <NA>     EOR01-Pain Interfere Daily Activities    EOR0119 
      112 VERY MUCH     <NA>     EOR01-Difficulty Concentrating on Things EOR0120 
      113 QUITE A BIT   <NA>     EOR01-Did You Feel Tense                 EOR0121 
      114 A LITTLE      <NA>     EOR01-Did You Worry                      EOR0122 
      115 <NA>          <NA>     EOR01-Did You Feel Irritable             EOR0123 
      116 VERY MUCH     <NA>     EOR01-Did You Feel Depressed             EOR0124 
      117 A LITTLE      <NA>     EOR01-Had Difficulty Remembering Things  EOR0125 
      118 QUITE A BIT   <NA>     EOR01-Condition Interfered Family Life   EOR0126 
      119 VERY MUCH     <NA>     EOR01-Condition Interfered Social Activ  EOR0127 
      120 NOT AT ALL    <NA>     EOR01-Condition Caused Financial Diff    EOR0128 
      121 3             <NA>     EOR01-Rate Your Overall Health           EOR0129 
      122 <NA>          <NA>     EOR01-Rate Your Overall Quality of Life  EOR0130 
      123 <NA>          <NA>     EOR01-Global Health Status/QoL           EOR0131 
      124 <NA>          <NA>     EOR01-FS:Physical Functioning            EOR0132 
      125 <NA>          <NA>     EOR01-FS:Role Functioning                EOR0133 
      126 <NA>          <NA>     EOR01-FS:Emotional Functioning           EOR0134 
      127 <NA>          <NA>     EOR01-FS:Cognitive Functioning           EOR0135 
      128 <NA>          <NA>     EOR01-FS:Social Functioning              EOR0136 
      129 <NA>          <NA>     EOR01-SS:Fatigue                         EOR0137 
      130 <NA>          <NA>     EOR01-SS:Nausea and Vomiting             EOR0138 
      131 <NA>          <NA>     EOR01-SS:Pain                            EOR0139 
      132 <NA>          <NA>     EOR01-SS:Dyspnoea                        EOR0140 
      133 <NA>          <NA>     EOR01-SS:Insomnia                        EOR0141 
      134 <NA>          <NA>     EOR01-SS:Appetite Loss                   EOR0142 
      135 <NA>          <NA>     EOR01-SS:Constipation                    EOR0143 
      136 <NA>          <NA>     EOR01-SS:Diarrhoea                       EOR0144 
      137 <NA>          <NA>     EOR01-SS:Financial Difficulties          EOR0145 
      138 <NA>          <NA>     <NA>                                     <NA>    
      139 <NA>          <NA>     <NA>                                     <NA>    
      140 <NA>          <NA>     <NA>                                     <NA>    
      141 <NA>          <NA>     <NA>                                     <NA>    
      142 NOT AT ALL    <NA>     EOR01-Trouble Doing Strenuous Activities EOR0101 
      143 A LITTLE      <NA>     EOR01-Trouble Taking Long Walk           EOR0102 
      144 <NA>          <NA>     EOR01-Trouble Taking Short Walk Outside  EOR0103 
      145 QUITE A BIT   <NA>     EOR01-Stay in Bed/Chair During the Day   EOR0104 
      146 NOT AT ALL    <NA>     EOR01-Need Help Eating/Dressing/Washing  EOR0105 
      147 <NA>          <NA>     EOR01-Limited in Work/Daily Activities   EOR0106 
      148 A LITTLE      <NA>     EOR01-Limited Hobbies/Leisure Activities EOR0107 
      149 <NA>          <NA>     EOR01-Were You Short of Breath           EOR0108 
      150 NOT AT ALL    <NA>     EOR01-Have You Had Pain                  EOR0109 
      151 A LITTLE      <NA>     EOR01-Did You Need to Rest               EOR0110 
      152 <NA>          <NA>     EOR01-Have You Had Trouble Sleeping      EOR0111 
      153 A LITTLE      <NA>     EOR01-Have You Felt Weak                 EOR0112 
      154 <NA>          <NA>     EOR01-Have You Lacked Appetite           EOR0113 
      155 VERY MUCH     <NA>     EOR01-Have You Felt Nauseated            EOR0114 
      156 VERY MUCH     <NA>     EOR01-Have You Vomited                   EOR0115 
      157 VERY MUCH     <NA>     EOR01-Have You Been Constipated          EOR0116 
      158 NOT AT ALL    <NA>     EOR01-Have You Had Diarrhea              EOR0117 
      159 <NA>          <NA>     EOR01-Were You Tired                     EOR0118 
      160 QUITE A BIT   <NA>     EOR01-Pain Interfere Daily Activities    EOR0119 
      161 QUITE A BIT   <NA>     EOR01-Difficulty Concentrating on Things EOR0120 
      162 <NA>          <NA>     EOR01-Did You Feel Tense                 EOR0121 
      163 NOT AT ALL    <NA>     EOR01-Did You Worry                      EOR0122 
      164 NOT AT ALL    <NA>     EOR01-Did You Feel Irritable             EOR0123 
      165 QUITE A BIT   <NA>     EOR01-Did You Feel Depressed             EOR0124 
      166 <NA>          <NA>     EOR01-Had Difficulty Remembering Things  EOR0125 
      167 NOT AT ALL    <NA>     EOR01-Condition Interfered Family Life   EOR0126 
      168 <NA>          <NA>     EOR01-Condition Interfered Social Activ  EOR0127 
      169 QUITE A BIT   <NA>     EOR01-Condition Caused Financial Diff    EOR0128 
      170 3             <NA>     EOR01-Rate Your Overall Health           EOR0129 
      171 6             <NA>     EOR01-Rate Your Overall Quality of Life  EOR0130 
      172 <NA>          <NA>     EOR01-Global Health Status/QoL           EOR0131 
      173 <NA>          <NA>     EOR01-FS:Physical Functioning            EOR0132 
      174 <NA>          <NA>     EOR01-FS:Role Functioning                EOR0133 
      175 <NA>          <NA>     EOR01-FS:Emotional Functioning           EOR0134 
      176 <NA>          <NA>     EOR01-FS:Cognitive Functioning           EOR0135 
      177 <NA>          <NA>     EOR01-FS:Social Functioning              EOR0136 
      178 <NA>          <NA>     EOR01-SS:Fatigue                         EOR0137 
      179 <NA>          <NA>     EOR01-SS:Nausea and Vomiting             EOR0138 
      180 <NA>          <NA>     EOR01-SS:Pain                            EOR0139 
      181 <NA>          <NA>     EOR01-SS:Dyspnoea                        EOR0140 
      182 <NA>          <NA>     EOR01-SS:Insomnia                        EOR0141 
      183 <NA>          <NA>     EOR01-SS:Appetite Loss                   EOR0142 
      184 <NA>          <NA>     EOR01-SS:Constipation                    EOR0143 
      185 <NA>          <NA>     EOR01-SS:Diarrhoea                       EOR0144 
      186 <NA>          <NA>     EOR01-SS:Financial Difficulties          EOR0145 
      187 <NA>          <NA>     <NA>                                     <NA>    
      188 <NA>          <NA>     <NA>                                     <NA>    
      189 <NA>          <NA>     <NA>                                     <NA>    
      190 <NA>          <NA>     <NA>                                     <NA>    
      191 A LITTLE      <NA>     EOR01-Trouble Doing Strenuous Activities EOR0101 
      192 <NA>          <NA>     EOR01-Trouble Taking Long Walk           EOR0102 
      193 <NA>          <NA>     EOR01-Trouble Taking Short Walk Outside  EOR0103 
      194 NOT AT ALL    <NA>     EOR01-Stay in Bed/Chair During the Day   EOR0104 
      195 NOT AT ALL    <NA>     EOR01-Need Help Eating/Dressing/Washing  EOR0105 
      196 QUITE A BIT   <NA>     EOR01-Limited in Work/Daily Activities   EOR0106 
      197 A LITTLE      <NA>     EOR01-Limited Hobbies/Leisure Activities EOR0107 
      198 A LITTLE      <NA>     EOR01-Were You Short of Breath           EOR0108 
      199 VERY MUCH     <NA>     EOR01-Have You Had Pain                  EOR0109 
      200 A LITTLE      <NA>     EOR01-Did You Need to Rest               EOR0110 
      201 <NA>          <NA>     EOR01-Have You Had Trouble Sleeping      EOR0111 
      202 A LITTLE      <NA>     EOR01-Have You Felt Weak                 EOR0112 
      203 <NA>          <NA>     EOR01-Have You Lacked Appetite           EOR0113 
      204 QUITE A BIT   <NA>     EOR01-Have You Felt Nauseated            EOR0114 
      205 NOT AT ALL    <NA>     EOR01-Have You Vomited                   EOR0115 
      206 <NA>          <NA>     EOR01-Have You Been Constipated          EOR0116 
      207 VERY MUCH     <NA>     EOR01-Have You Had Diarrhea              EOR0117 
      208 QUITE A BIT   <NA>     EOR01-Were You Tired                     EOR0118 
      209 QUITE A BIT   <NA>     EOR01-Pain Interfere Daily Activities    EOR0119 
      210 VERY MUCH     <NA>     EOR01-Difficulty Concentrating on Things EOR0120 
      211 VERY MUCH     <NA>     EOR01-Did You Feel Tense                 EOR0121 
      212 QUITE A BIT   <NA>     EOR01-Did You Worry                      EOR0122 
      213 VERY MUCH     <NA>     EOR01-Did You Feel Irritable             EOR0123 
      214 QUITE A BIT   <NA>     EOR01-Did You Feel Depressed             EOR0124 
      215 <NA>          <NA>     EOR01-Had Difficulty Remembering Things  EOR0125 
      216 NOT AT ALL    <NA>     EOR01-Condition Interfered Family Life   EOR0126 
      217 NOT AT ALL    <NA>     EOR01-Condition Interfered Social Activ  EOR0127 
      218 A LITTLE      <NA>     EOR01-Condition Caused Financial Diff    EOR0128 
      219 <NA>          <NA>     EOR01-Rate Your Overall Health           EOR0129 
      220 1 - VERY POOR <NA>     EOR01-Rate Your Overall Quality of Life  EOR0130 
      221 <NA>          <NA>     EOR01-Global Health Status/QoL           EOR0131 
      222 <NA>          <NA>     EOR01-FS:Physical Functioning            EOR0132 
      223 <NA>          <NA>     EOR01-FS:Role Functioning                EOR0133 
      224 <NA>          <NA>     EOR01-FS:Emotional Functioning           EOR0134 
      225 <NA>          <NA>     EOR01-FS:Cognitive Functioning           EOR0135 
      226 <NA>          <NA>     EOR01-FS:Social Functioning              EOR0136 
      227 <NA>          <NA>     EOR01-SS:Fatigue                         EOR0137 
      228 <NA>          <NA>     EOR01-SS:Nausea and Vomiting             EOR0138 
      229 <NA>          <NA>     EOR01-SS:Pain                            EOR0139 
      230 <NA>          <NA>     EOR01-SS:Dyspnoea                        EOR0140 
      231 <NA>          <NA>     EOR01-SS:Insomnia                        EOR0141 
      232 <NA>          <NA>     EOR01-SS:Appetite Loss                   EOR0142 
      233 <NA>          <NA>     EOR01-SS:Constipation                    EOR0143 
      234 <NA>          <NA>     EOR01-SS:Diarrhoea                       EOR0144 
      235 <NA>          <NA>     EOR01-SS:Financial Difficulties          EOR0145 
      236 <NA>          <NA>     <NA>                                     <NA>    
      237 <NA>          <NA>     <NA>                                     <NA>    
      238 <NA>          <NA>     <NA>                                     <NA>    
      239 <NA>          <NA>     <NA>                                     <NA>    
      240 NOT AT ALL    <NA>     EOR01-Trouble Doing Strenuous Activities EOR0101 
      241 QUITE A BIT   <NA>     EOR01-Trouble Taking Long Walk           EOR0102 
      242 <NA>          <NA>     EOR01-Trouble Taking Short Walk Outside  EOR0103 
      243 NOT AT ALL    <NA>     EOR01-Stay in Bed/Chair During the Day   EOR0104 
      244 <NA>          <NA>     EOR01-Need Help Eating/Dressing/Washing  EOR0105 
      245 NOT AT ALL    <NA>     EOR01-Limited in Work/Daily Activities   EOR0106 
      246 A LITTLE      <NA>     EOR01-Limited Hobbies/Leisure Activities EOR0107 
      247 VERY MUCH     <NA>     EOR01-Were You Short of Breath           EOR0108 
      248 VERY MUCH     <NA>     EOR01-Have You Had Pain                  EOR0109 
      249 QUITE A BIT   <NA>     EOR01-Did You Need to Rest               EOR0110 
      250 A LITTLE      <NA>     EOR01-Have You Had Trouble Sleeping      EOR0111 
      251 A LITTLE      <NA>     EOR01-Have You Felt Weak                 EOR0112 
      252 QUITE A BIT   <NA>     EOR01-Have You Lacked Appetite           EOR0113 
      253 QUITE A BIT   <NA>     EOR01-Have You Felt Nauseated            EOR0114 
      254 VERY MUCH     <NA>     EOR01-Have You Vomited                   EOR0115 
      255 NOT AT ALL    <NA>     EOR01-Have You Been Constipated          EOR0116 
      256 VERY MUCH     <NA>     EOR01-Have You Had Diarrhea              EOR0117 
      257 A LITTLE      <NA>     EOR01-Were You Tired                     EOR0118 
      258 <NA>          <NA>     EOR01-Pain Interfere Daily Activities    EOR0119 
      259 A LITTLE      <NA>     EOR01-Difficulty Concentrating on Things EOR0120 
      260 QUITE A BIT   <NA>     EOR01-Did You Feel Tense                 EOR0121 
      261 QUITE A BIT   <NA>     EOR01-Did You Worry                      EOR0122 
      262 A LITTLE      <NA>     EOR01-Did You Feel Irritable             EOR0123 
      263 VERY MUCH     <NA>     EOR01-Did You Feel Depressed             EOR0124 
      264 <NA>          <NA>     EOR01-Had Difficulty Remembering Things  EOR0125 
      265 A LITTLE      <NA>     EOR01-Condition Interfered Family Life   EOR0126 
      266 NOT AT ALL    <NA>     EOR01-Condition Interfered Social Activ  EOR0127 
      267 QUITE A BIT   <NA>     EOR01-Condition Caused Financial Diff    EOR0128 
      268 1 - VERY POOR <NA>     EOR01-Rate Your Overall Health           EOR0129 
      269 2             <NA>     EOR01-Rate Your Overall Quality of Life  EOR0130 
      270 <NA>          <NA>     EOR01-Global Health Status/QoL           EOR0131 
      271 <NA>          <NA>     EOR01-FS:Physical Functioning            EOR0132 
      272 <NA>          <NA>     EOR01-FS:Role Functioning                EOR0133 
      273 <NA>          <NA>     EOR01-FS:Emotional Functioning           EOR0134 
      274 <NA>          <NA>     EOR01-FS:Cognitive Functioning           EOR0135 
      275 <NA>          <NA>     EOR01-FS:Social Functioning              EOR0136 
      276 <NA>          <NA>     EOR01-SS:Fatigue                         EOR0137 
      277 <NA>          <NA>     EOR01-SS:Nausea and Vomiting             EOR0138 
      278 <NA>          <NA>     EOR01-SS:Pain                            EOR0139 
      279 <NA>          <NA>     EOR01-SS:Dyspnoea                        EOR0140 
      280 <NA>          <NA>     EOR01-SS:Insomnia                        EOR0141 
      281 <NA>          <NA>     EOR01-SS:Appetite Loss                   EOR0142 
      282 <NA>          <NA>     EOR01-SS:Constipation                    EOR0143 
      283 <NA>          <NA>     EOR01-SS:Diarrhoea                       EOR0144 
      284 <NA>          <NA>     EOR01-SS:Financial Difficulties          EOR0145 
      285 <NA>          <NA>     <NA>                                     <NA>    
      286 <NA>          <NA>     <NA>                                     <NA>    
      287 <NA>          <NA>     <NA>                                     <NA>    
      288 <NA>          <NA>     <NA>                                     <NA>    
          QSREASND QSEVLINT VISIT         VISITNUM  ASEQ
          <fct>    <fct>    <fct>            <int> <int>
        1 <NA>     <NA>     SCREENING           -1     1
        2 <NA>     <NA>     SCREENING           -1     2
        3 <NA>     <NA>     SCREENING           -1     3
        4 <NA>     <NA>     SCREENING           -1     4
        5 <NA>     <NA>     SCREENING           -1     5
        6 <NA>     -P1W     SCREENING           -1     6
        7 <NA>     -P1W     SCREENING           -1     7
        8 <NA>     -P1W     SCREENING           -1     8
        9 <NA>     -P1W     SCREENING           -1     9
       10 <NA>     -P1W     SCREENING           -1    10
       11 <NA>     -P1W     SCREENING           -1    11
       12 <NA>     -P1W     SCREENING           -1    12
       13 <NA>     -P1W     SCREENING           -1    13
       14 <NA>     -P1W     SCREENING           -1    14
       15 <NA>     -P1W     SCREENING           -1    15
       16 <NA>     -P1W     SCREENING           -1    16
       17 <NA>     -P1W     SCREENING           -1    17
       18 <NA>     -P1W     SCREENING           -1    18
       19 <NA>     -P1W     SCREENING           -1    19
       20 <NA>     -P1W     SCREENING           -1    20
       21 <NA>     -P1W     SCREENING           -1    21
       22 <NA>     -P1W     SCREENING           -1    22
       23 <NA>     -P1W     SCREENING           -1    23
       24 <NA>     -P1W     SCREENING           -1    24
       25 <NA>     -P1W     SCREENING           -1    25
       26 <NA>     -P1W     SCREENING           -1    26
       27 <NA>     -P1W     SCREENING           -1    27
       28 <NA>     -P1W     SCREENING           -1    28
       29 <NA>     -P1W     SCREENING           -1    29
       30 <NA>     -P1W     SCREENING           -1    30
       31 <NA>     <NA>     <NA>                NA    31
       32 <NA>     <NA>     <NA>                NA    32
       33 <NA>     <NA>     <NA>                NA    33
       34 <NA>     <NA>     <NA>                NA    34
       35 <NA>     <NA>     <NA>                NA    35
       36 <NA>     <NA>     <NA>                NA    36
       37 <NA>     <NA>     <NA>                NA    37
       38 <NA>     <NA>     <NA>                NA    38
       39 <NA>     <NA>     <NA>                NA    39
       40 <NA>     <NA>     <NA>                NA    40
       41 <NA>     <NA>     <NA>                NA    41
       42 <NA>     <NA>     <NA>                NA    42
       43 <NA>     <NA>     <NA>                NA    43
       44 <NA>     <NA>     <NA>                NA    44
       45 <NA>     <NA>     <NA>                NA    45
       46 <NA>     <NA>     <NA>                NA    46
       47 <NA>     <NA>     CYCLE 1 DAY 1        0    47
       48 <NA>     <NA>     CYCLE 1 DAY 1        0    48
       49 <NA>     <NA>     CYCLE 1 DAY 1        0    49
       50 <NA>     <NA>     CYCLE 1 DAY 1        0    50
       51 <NA>     <NA>     CYCLE 1 DAY 1        0    51
       52 <NA>     -P1W     CYCLE 1 DAY 1        0    52
       53 <NA>     -P1W     CYCLE 1 DAY 1        0    53
       54 <NA>     -P1W     CYCLE 1 DAY 1        0    54
       55 <NA>     -P1W     CYCLE 1 DAY 1        0    55
       56 <NA>     -P1W     CYCLE 1 DAY 1        0    56
       57 <NA>     -P1W     CYCLE 1 DAY 1        0    57
       58 <NA>     -P1W     CYCLE 1 DAY 1        0    58
       59 <NA>     -P1W     CYCLE 1 DAY 1        0    59
       60 <NA>     -P1W     CYCLE 1 DAY 1        0    60
       61 <NA>     -P1W     CYCLE 1 DAY 1        0    61
       62 <NA>     -P1W     CYCLE 1 DAY 1        0    62
       63 <NA>     -P1W     CYCLE 1 DAY 1        0    63
       64 <NA>     -P1W     CYCLE 1 DAY 1        0    64
       65 <NA>     -P1W     CYCLE 1 DAY 1        0    65
       66 <NA>     -P1W     CYCLE 1 DAY 1        0    66
       67 <NA>     -P1W     CYCLE 1 DAY 1        0    67
       68 <NA>     -P1W     CYCLE 1 DAY 1        0    68
       69 <NA>     -P1W     CYCLE 1 DAY 1        0    69
       70 <NA>     -P1W     CYCLE 1 DAY 1        0    70
       71 <NA>     -P1W     CYCLE 1 DAY 1        0    71
       72 <NA>     -P1W     CYCLE 1 DAY 1        0    72
       73 <NA>     -P1W     CYCLE 1 DAY 1        0    73
       74 <NA>     -P1W     CYCLE 1 DAY 1        0    74
       75 <NA>     -P1W     CYCLE 1 DAY 1        0    75
       76 <NA>     -P1W     CYCLE 1 DAY 1        0    76
       77 <NA>     <NA>     <NA>                NA    77
       78 <NA>     <NA>     <NA>                NA    78
       79 <NA>     <NA>     <NA>                NA    79
       80 <NA>     <NA>     <NA>                NA    80
       81 <NA>     <NA>     <NA>                NA    81
       82 <NA>     <NA>     <NA>                NA    82
       83 <NA>     <NA>     <NA>                NA    83
       84 <NA>     <NA>     <NA>                NA    84
       85 <NA>     <NA>     <NA>                NA    85
       86 <NA>     <NA>     <NA>                NA    86
       87 <NA>     <NA>     <NA>                NA    87
       88 <NA>     <NA>     <NA>                NA    88
       89 <NA>     <NA>     <NA>                NA    89
       90 <NA>     <NA>     <NA>                NA    90
       91 <NA>     <NA>     <NA>                NA    91
       92 <NA>     <NA>     <NA>                NA    92
       93 <NA>     <NA>     CYCLE 2 DAY 1        1    93
       94 <NA>     <NA>     CYCLE 2 DAY 1        1    94
       95 <NA>     <NA>     CYCLE 2 DAY 1        1    95
       96 <NA>     <NA>     CYCLE 2 DAY 1        1    96
       97 <NA>     <NA>     CYCLE 2 DAY 1        1    97
       98 <NA>     -P1W     CYCLE 2 DAY 1        1    98
       99 <NA>     -P1W     CYCLE 2 DAY 1        1    99
      100 <NA>     -P1W     CYCLE 2 DAY 1        1   100
      101 <NA>     -P1W     CYCLE 2 DAY 1        1   101
      102 <NA>     -P1W     CYCLE 2 DAY 1        1   102
      103 <NA>     -P1W     CYCLE 2 DAY 1        1   103
      104 <NA>     -P1W     CYCLE 2 DAY 1        1   104
      105 <NA>     -P1W     CYCLE 2 DAY 1        1   105
      106 <NA>     -P1W     CYCLE 2 DAY 1        1   106
      107 <NA>     -P1W     CYCLE 2 DAY 1        1   107
      108 <NA>     -P1W     CYCLE 2 DAY 1        1   108
      109 <NA>     -P1W     CYCLE 2 DAY 1        1   109
      110 <NA>     -P1W     CYCLE 2 DAY 1        1   110
      111 <NA>     -P1W     CYCLE 2 DAY 1        1   111
      112 <NA>     -P1W     CYCLE 2 DAY 1        1   112
      113 <NA>     -P1W     CYCLE 2 DAY 1        1   113
      114 <NA>     -P1W     CYCLE 2 DAY 1        1   114
      115 <NA>     -P1W     CYCLE 2 DAY 1        1   115
      116 <NA>     -P1W     CYCLE 2 DAY 1        1   116
      117 <NA>     -P1W     CYCLE 2 DAY 1        1   117
      118 <NA>     -P1W     CYCLE 2 DAY 1        1   118
      119 <NA>     -P1W     CYCLE 2 DAY 1        1   119
      120 <NA>     -P1W     CYCLE 2 DAY 1        1   120
      121 <NA>     -P1W     CYCLE 2 DAY 1        1   121
      122 <NA>     -P1W     CYCLE 2 DAY 1        1   122
      123 <NA>     <NA>     <NA>                NA   123
      124 <NA>     <NA>     <NA>                NA   124
      125 <NA>     <NA>     <NA>                NA   125
      126 <NA>     <NA>     <NA>                NA   126
      127 <NA>     <NA>     <NA>                NA   127
      128 <NA>     <NA>     <NA>                NA   128
      129 <NA>     <NA>     <NA>                NA   129
      130 <NA>     <NA>     <NA>                NA   130
      131 <NA>     <NA>     <NA>                NA   131
      132 <NA>     <NA>     <NA>                NA   132
      133 <NA>     <NA>     <NA>                NA   133
      134 <NA>     <NA>     <NA>                NA   134
      135 <NA>     <NA>     <NA>                NA   135
      136 <NA>     <NA>     <NA>                NA   136
      137 <NA>     <NA>     <NA>                NA   137
      138 <NA>     <NA>     <NA>                NA   138
      139 <NA>     <NA>     <NA>                NA   139
      140 <NA>     <NA>     <NA>                NA   140
      141 <NA>     <NA>     <NA>                NA   141
      142 <NA>     <NA>     CYCLE 3 DAY 1        2   142
      143 <NA>     <NA>     CYCLE 3 DAY 1        2   143
      144 <NA>     <NA>     CYCLE 3 DAY 1        2   144
      145 <NA>     <NA>     CYCLE 3 DAY 1        2   145
      146 <NA>     <NA>     CYCLE 3 DAY 1        2   146
      147 <NA>     -P1W     CYCLE 3 DAY 1        2   147
      148 <NA>     -P1W     CYCLE 3 DAY 1        2   148
      149 <NA>     -P1W     CYCLE 3 DAY 1        2   149
      150 <NA>     -P1W     CYCLE 3 DAY 1        2   150
      151 <NA>     -P1W     CYCLE 3 DAY 1        2   151
      152 <NA>     -P1W     CYCLE 3 DAY 1        2   152
      153 <NA>     -P1W     CYCLE 3 DAY 1        2   153
      154 <NA>     -P1W     CYCLE 3 DAY 1        2   154
      155 <NA>     -P1W     CYCLE 3 DAY 1        2   155
      156 <NA>     -P1W     CYCLE 3 DAY 1        2   156
      157 <NA>     -P1W     CYCLE 3 DAY 1        2   157
      158 <NA>     -P1W     CYCLE 3 DAY 1        2   158
      159 <NA>     -P1W     CYCLE 3 DAY 1        2   159
      160 <NA>     -P1W     CYCLE 3 DAY 1        2   160
      161 <NA>     -P1W     CYCLE 3 DAY 1        2   161
      162 <NA>     -P1W     CYCLE 3 DAY 1        2   162
      163 <NA>     -P1W     CYCLE 3 DAY 1        2   163
      164 <NA>     -P1W     CYCLE 3 DAY 1        2   164
      165 <NA>     -P1W     CYCLE 3 DAY 1        2   165
      166 <NA>     -P1W     CYCLE 3 DAY 1        2   166
      167 <NA>     -P1W     CYCLE 3 DAY 1        2   167
      168 <NA>     -P1W     CYCLE 3 DAY 1        2   168
      169 <NA>     -P1W     CYCLE 3 DAY 1        2   169
      170 <NA>     -P1W     CYCLE 3 DAY 1        2   170
      171 <NA>     -P1W     CYCLE 3 DAY 1        2   171
      172 <NA>     <NA>     <NA>                NA   172
      173 <NA>     <NA>     <NA>                NA   173
      174 <NA>     <NA>     <NA>                NA   174
      175 <NA>     <NA>     <NA>                NA   175
      176 <NA>     <NA>     <NA>                NA   176
      177 <NA>     <NA>     <NA>                NA   177
      178 <NA>     <NA>     <NA>                NA   178
      179 <NA>     <NA>     <NA>                NA   179
      180 <NA>     <NA>     <NA>                NA   180
      181 <NA>     <NA>     <NA>                NA   181
      182 <NA>     <NA>     <NA>                NA   182
      183 <NA>     <NA>     <NA>                NA   183
      184 <NA>     <NA>     <NA>                NA   184
      185 <NA>     <NA>     <NA>                NA   185
      186 <NA>     <NA>     <NA>                NA   186
      187 <NA>     <NA>     <NA>                NA   187
      188 <NA>     <NA>     <NA>                NA   188
      189 <NA>     <NA>     <NA>                NA   189
      190 <NA>     <NA>     <NA>                NA   190
      191 <NA>     <NA>     CYCLE 4 DAY 1        3   191
      192 <NA>     <NA>     CYCLE 4 DAY 1        3   192
      193 <NA>     <NA>     CYCLE 4 DAY 1        3   193
      194 <NA>     <NA>     CYCLE 4 DAY 1        3   194
      195 <NA>     <NA>     CYCLE 4 DAY 1        3   195
      196 <NA>     -P1W     CYCLE 4 DAY 1        3   196
      197 <NA>     -P1W     CYCLE 4 DAY 1        3   197
      198 <NA>     -P1W     CYCLE 4 DAY 1        3   198
      199 <NA>     -P1W     CYCLE 4 DAY 1        3   199
      200 <NA>     -P1W     CYCLE 4 DAY 1        3   200
      201 <NA>     -P1W     CYCLE 4 DAY 1        3   201
      202 <NA>     -P1W     CYCLE 4 DAY 1        3   202
      203 <NA>     -P1W     CYCLE 4 DAY 1        3   203
      204 <NA>     -P1W     CYCLE 4 DAY 1        3   204
      205 <NA>     -P1W     CYCLE 4 DAY 1        3   205
      206 <NA>     -P1W     CYCLE 4 DAY 1        3   206
      207 <NA>     -P1W     CYCLE 4 DAY 1        3   207
      208 <NA>     -P1W     CYCLE 4 DAY 1        3   208
      209 <NA>     -P1W     CYCLE 4 DAY 1        3   209
      210 <NA>     -P1W     CYCLE 4 DAY 1        3   210
      211 <NA>     -P1W     CYCLE 4 DAY 1        3   211
      212 <NA>     -P1W     CYCLE 4 DAY 1        3   212
      213 <NA>     -P1W     CYCLE 4 DAY 1        3   213
      214 <NA>     -P1W     CYCLE 4 DAY 1        3   214
      215 <NA>     -P1W     CYCLE 4 DAY 1        3   215
      216 <NA>     -P1W     CYCLE 4 DAY 1        3   216
      217 <NA>     -P1W     CYCLE 4 DAY 1        3   217
      218 <NA>     -P1W     CYCLE 4 DAY 1        3   218
      219 <NA>     -P1W     CYCLE 4 DAY 1        3   219
      220 <NA>     -P1W     CYCLE 4 DAY 1        3   220
      221 <NA>     <NA>     <NA>                NA   221
      222 <NA>     <NA>     <NA>                NA   222
      223 <NA>     <NA>     <NA>                NA   223
      224 <NA>     <NA>     <NA>                NA   224
      225 <NA>     <NA>     <NA>                NA   225
      226 <NA>     <NA>     <NA>                NA   226
      227 <NA>     <NA>     <NA>                NA   227
      228 <NA>     <NA>     <NA>                NA   228
      229 <NA>     <NA>     <NA>                NA   229
      230 <NA>     <NA>     <NA>                NA   230
      231 <NA>     <NA>     <NA>                NA   231
      232 <NA>     <NA>     <NA>                NA   232
      233 <NA>     <NA>     <NA>                NA   233
      234 <NA>     <NA>     <NA>                NA   234
      235 <NA>     <NA>     <NA>                NA   235
      236 <NA>     <NA>     <NA>                NA   236
      237 <NA>     <NA>     <NA>                NA   237
      238 <NA>     <NA>     <NA>                NA   238
      239 <NA>     <NA>     <NA>                NA   239
      240 <NA>     <NA>     CYCLE 5 DAY 1        4   240
      241 <NA>     <NA>     CYCLE 5 DAY 1        4   241
      242 <NA>     <NA>     CYCLE 5 DAY 1        4   242
      243 <NA>     <NA>     CYCLE 5 DAY 1        4   243
      244 <NA>     <NA>     CYCLE 5 DAY 1        4   244
      245 <NA>     -P1W     CYCLE 5 DAY 1        4   245
      246 <NA>     -P1W     CYCLE 5 DAY 1        4   246
      247 <NA>     -P1W     CYCLE 5 DAY 1        4   247
      248 <NA>     -P1W     CYCLE 5 DAY 1        4   248
      249 <NA>     -P1W     CYCLE 5 DAY 1        4   249
      250 <NA>     -P1W     CYCLE 5 DAY 1        4   250
      251 <NA>     -P1W     CYCLE 5 DAY 1        4   251
      252 <NA>     -P1W     CYCLE 5 DAY 1        4   252
      253 <NA>     -P1W     CYCLE 5 DAY 1        4   253
      254 <NA>     -P1W     CYCLE 5 DAY 1        4   254
      255 <NA>     -P1W     CYCLE 5 DAY 1        4   255
      256 <NA>     -P1W     CYCLE 5 DAY 1        4   256
      257 <NA>     -P1W     CYCLE 5 DAY 1        4   257
      258 <NA>     -P1W     CYCLE 5 DAY 1        4   258
      259 <NA>     -P1W     CYCLE 5 DAY 1        4   259
      260 <NA>     -P1W     CYCLE 5 DAY 1        4   260
      261 <NA>     -P1W     CYCLE 5 DAY 1        4   261
      262 <NA>     -P1W     CYCLE 5 DAY 1        4   262
      263 <NA>     -P1W     CYCLE 5 DAY 1        4   263
      264 <NA>     -P1W     CYCLE 5 DAY 1        4   264
      265 <NA>     -P1W     CYCLE 5 DAY 1        4   265
      266 <NA>     -P1W     CYCLE 5 DAY 1        4   266
      267 <NA>     -P1W     CYCLE 5 DAY 1        4   267
      268 <NA>     -P1W     CYCLE 5 DAY 1        4   268
      269 <NA>     -P1W     CYCLE 5 DAY 1        4   269
      270 <NA>     <NA>     <NA>                NA   270
      271 <NA>     <NA>     <NA>                NA   271
      272 <NA>     <NA>     <NA>                NA   272
      273 <NA>     <NA>     <NA>                NA   273
      274 <NA>     <NA>     <NA>                NA   274
      275 <NA>     <NA>     <NA>                NA   275
      276 <NA>     <NA>     <NA>                NA   276
      277 <NA>     <NA>     <NA>                NA   277
      278 <NA>     <NA>     <NA>                NA   278
      279 <NA>     <NA>     <NA>                NA   279
      280 <NA>     <NA>     <NA>                NA   280
      281 <NA>     <NA>     <NA>                NA   281
      282 <NA>     <NA>     <NA>                NA   282
      283 <NA>     <NA>     <NA>                NA   283
      284 <NA>     <NA>     <NA>                NA   284
      285 <NA>     <NA>     <NA>                NA   285
      286 <NA>     <NA>     <NA>                NA   286
      287 <NA>     <NA>     <NA>                NA   287
      288 <NA>     <NA>     <NA>                NA   288
          PARAM                                                           PARAMCD 
          <fct>                                                           <fct>   
        1 EORTC QLQ-C30: Trouble doing strenuous activities               QS02801 
        2 EORTC QLQ-C30: Trouble taking a long walk                       QS02802 
        3 EORTC QLQ-C30: Trouble taking a short walk                      QS02803 
        4 EORTC QLQ-C30: Stay in bed or chair during the day              QS02804 
        5 EORTC QLQ-C30: Need help eating, dressing, washing              QS02805 
        6 EORTC QLQ-C30: Limited in work or daily activities              QS02806 
        7 EORTC QLQ-C30: Limited in hobbies or leisure activities         QS02807 
        8 EORTC QLQ-C30: Were you short of breath                         QS02808 
        9 EORTC QLQ-C30: Have you had pain                                QS02809 
       10 EORTC QLQ-C30: Did you need to rest                             QS02810 
       11 EORTC QLQ-C30: Have you had trouble sleeping                    QS02811 
       12 EORTC QLQ-C30: Have you felt weak                               QS02812 
       13 EORTC QLQ-C30: Have you lacked appetite                         QS02813 
       14 EORTC QLQ-C30: Have you felt nauseated                          QS02814 
       15 EORTC QLQ-C30: Have you vomited                                 QS02815 
       16 EORTC QLQ-C30: Have you been constipated                        QS02816 
       17 EORTC QLQ-C30: Have you had diarrhea                            QS02817 
       18 EORTC QLQ-C30: Were you tired                                   QS02818 
       19 EORTC QLQ-C30: Pain interfere with daily activities             QS02819 
       20 EORTC QLQ-C30: Had difficulty concentrating                     QS02820 
       21 EORTC QLQ-C30: Did you feel tense                               QS02821 
       22 EORTC QLQ-C30: Did you worry                                    QS02822 
       23 EORTC QLQ-C30: Did you feel irritable                           QS02823 
       24 EORTC QLQ-C30: Did you feel depressed                           QS02824 
       25 EORTC QLQ-C30: Had difficulty remembering things                QS02825 
       26 EORTC QLQ-C30: Interfered with your family life                 QS02826 
       27 EORTC QLQ-C30: Interfered with your social activities           QS02827 
       28 EORTC QLQ-C30: Caused you financial difficulties                QS02828 
       29 EORTC QLQ-C30: How would you rate your overall health           QS02829 
       30 EORTC QLQ-C30: Rate your overall quality of life                QS02830 
       31 EORTC QLQ-C30: Global health status/QoL (revised)               QS028QL2
       32 EORTC QLQ-C30: Physical functioning (revised)                   QS028PF2
       33 EORTC QLQ-C30: Role functioning (revised)                       QS028RF2
       34 EORTC QLQ-C30: Emotional functioning                            QS028EF 
       35 EORTC QLQ-C30: Cognitive functioning                            QS028CF 
       36 EORTC QLQ-C30: Social functioning                               QS028SF 
       37 EORTC QLQ-C30: Fatigue                                          QS028FA 
       38 EORTC QLQ-C30: Nausea and vomiting                              QS028NV 
       39 EORTC QLQ-C30: Pain                                             QS028PA 
       40 EORTC QLQ-C30: Dyspnoea                                         QS028DY 
       41 EORTC QLQ-C30: Insomnia                                         QS028SL 
       42 EORTC QLQ-C30: Appetite loss                                    QS028AP 
       43 EORTC QLQ-C30: Constipation                                     QS028CO 
       44 EORTC QLQ-C30: Diarrhoea                                        QS028DI 
       45 EORTC QLQ-C30: Financial difficulties                           QS028FI 
       46 EORTC QLQ-C30: Completion - Expectation                         EX028   
       47 EORTC QLQ-C30: Trouble doing strenuous activities               QS02801 
       48 EORTC QLQ-C30: Trouble taking a long walk                       QS02802 
       49 EORTC QLQ-C30: Trouble taking a short walk                      QS02803 
       50 EORTC QLQ-C30: Stay in bed or chair during the day              QS02804 
       51 EORTC QLQ-C30: Need help eating, dressing, washing              QS02805 
       52 EORTC QLQ-C30: Limited in work or daily activities              QS02806 
       53 EORTC QLQ-C30: Limited in hobbies or leisure activities         QS02807 
       54 EORTC QLQ-C30: Were you short of breath                         QS02808 
       55 EORTC QLQ-C30: Have you had pain                                QS02809 
       56 EORTC QLQ-C30: Did you need to rest                             QS02810 
       57 EORTC QLQ-C30: Have you had trouble sleeping                    QS02811 
       58 EORTC QLQ-C30: Have you felt weak                               QS02812 
       59 EORTC QLQ-C30: Have you lacked appetite                         QS02813 
       60 EORTC QLQ-C30: Have you felt nauseated                          QS02814 
       61 EORTC QLQ-C30: Have you vomited                                 QS02815 
       62 EORTC QLQ-C30: Have you been constipated                        QS02816 
       63 EORTC QLQ-C30: Have you had diarrhea                            QS02817 
       64 EORTC QLQ-C30: Were you tired                                   QS02818 
       65 EORTC QLQ-C30: Pain interfere with daily activities             QS02819 
       66 EORTC QLQ-C30: Had difficulty concentrating                     QS02820 
       67 EORTC QLQ-C30: Did you feel tense                               QS02821 
       68 EORTC QLQ-C30: Did you worry                                    QS02822 
       69 EORTC QLQ-C30: Did you feel irritable                           QS02823 
       70 EORTC QLQ-C30: Did you feel depressed                           QS02824 
       71 EORTC QLQ-C30: Had difficulty remembering things                QS02825 
       72 EORTC QLQ-C30: Interfered with your family life                 QS02826 
       73 EORTC QLQ-C30: Interfered with your social activities           QS02827 
       74 EORTC QLQ-C30: Caused you financial difficulties                QS02828 
       75 EORTC QLQ-C30: How would you rate your overall health           QS02829 
       76 EORTC QLQ-C30: Rate your overall quality of life                QS02830 
       77 EORTC QLQ-C30: Global health status/QoL (revised)               QS028QL2
       78 EORTC QLQ-C30: Physical functioning (revised)                   QS028PF2
       79 EORTC QLQ-C30: Role functioning (revised)                       QS028RF2
       80 EORTC QLQ-C30: Emotional functioning                            QS028EF 
       81 EORTC QLQ-C30: Cognitive functioning                            QS028CF 
       82 EORTC QLQ-C30: Social functioning                               QS028SF 
       83 EORTC QLQ-C30: Fatigue                                          QS028FA 
       84 EORTC QLQ-C30: Nausea and vomiting                              QS028NV 
       85 EORTC QLQ-C30: Pain                                             QS028PA 
       86 EORTC QLQ-C30: Dyspnoea                                         QS028DY 
       87 EORTC QLQ-C30: Insomnia                                         QS028SL 
       88 EORTC QLQ-C30: Appetite loss                                    QS028AP 
       89 EORTC QLQ-C30: Constipation                                     QS028CO 
       90 EORTC QLQ-C30: Diarrhoea                                        QS028DI 
       91 EORTC QLQ-C30: Financial difficulties                           QS028FI 
       92 EORTC QLQ-C30: Completion - Expectation                         EX028   
       93 EORTC QLQ-C30: Trouble doing strenuous activities               QS02801 
       94 EORTC QLQ-C30: Trouble taking a long walk                       QS02802 
       95 EORTC QLQ-C30: Trouble taking a short walk                      QS02803 
       96 EORTC QLQ-C30: Stay in bed or chair during the day              QS02804 
       97 EORTC QLQ-C30: Need help eating, dressing, washing              QS02805 
       98 EORTC QLQ-C30: Limited in work or daily activities              QS02806 
       99 EORTC QLQ-C30: Limited in hobbies or leisure activities         QS02807 
      100 EORTC QLQ-C30: Were you short of breath                         QS02808 
      101 EORTC QLQ-C30: Have you had pain                                QS02809 
      102 EORTC QLQ-C30: Did you need to rest                             QS02810 
      103 EORTC QLQ-C30: Have you had trouble sleeping                    QS02811 
      104 EORTC QLQ-C30: Have you felt weak                               QS02812 
      105 EORTC QLQ-C30: Have you lacked appetite                         QS02813 
      106 EORTC QLQ-C30: Have you felt nauseated                          QS02814 
      107 EORTC QLQ-C30: Have you vomited                                 QS02815 
      108 EORTC QLQ-C30: Have you been constipated                        QS02816 
      109 EORTC QLQ-C30: Have you had diarrhea                            QS02817 
      110 EORTC QLQ-C30: Were you tired                                   QS02818 
      111 EORTC QLQ-C30: Pain interfere with daily activities             QS02819 
      112 EORTC QLQ-C30: Had difficulty concentrating                     QS02820 
      113 EORTC QLQ-C30: Did you feel tense                               QS02821 
      114 EORTC QLQ-C30: Did you worry                                    QS02822 
      115 EORTC QLQ-C30: Did you feel irritable                           QS02823 
      116 EORTC QLQ-C30: Did you feel depressed                           QS02824 
      117 EORTC QLQ-C30: Had difficulty remembering things                QS02825 
      118 EORTC QLQ-C30: Interfered with your family life                 QS02826 
      119 EORTC QLQ-C30: Interfered with your social activities           QS02827 
      120 EORTC QLQ-C30: Caused you financial difficulties                QS02828 
      121 EORTC QLQ-C30: How would you rate your overall health           QS02829 
      122 EORTC QLQ-C30: Rate your overall quality of life                QS02830 
      123 EORTC QLQ-C30: Global health status/QoL (revised)               QS028QL2
      124 EORTC QLQ-C30: Physical functioning (revised)                   QS028PF2
      125 EORTC QLQ-C30: Role functioning (revised)                       QS028RF2
      126 EORTC QLQ-C30: Emotional functioning                            QS028EF 
      127 EORTC QLQ-C30: Cognitive functioning                            QS028CF 
      128 EORTC QLQ-C30: Social functioning                               QS028SF 
      129 EORTC QLQ-C30: Fatigue                                          QS028FA 
      130 EORTC QLQ-C30: Nausea and vomiting                              QS028NV 
      131 EORTC QLQ-C30: Pain                                             QS028PA 
      132 EORTC QLQ-C30: Dyspnoea                                         QS028DY 
      133 EORTC QLQ-C30: Insomnia                                         QS028SL 
      134 EORTC QLQ-C30: Appetite loss                                    QS028AP 
      135 EORTC QLQ-C30: Constipation                                     QS028CO 
      136 EORTC QLQ-C30: Diarrhoea                                        QS028DI 
      137 EORTC QLQ-C30: Financial difficulties                           QS028FI 
      138 EORTC QLQ-C30: Completion - Expectation                         EX028   
      139 EORTC QLQ-C30: Completion - Completed all questions             CO028ALL
      140 EORTC QLQ-C30: Completion - Completed at least 80% of questions CO02880P
      141 EORTC QLQ-C30: Completion - Completed at least 2 question(s)    CO0282Q 
      142 EORTC QLQ-C30: Trouble doing strenuous activities               QS02801 
      143 EORTC QLQ-C30: Trouble taking a long walk                       QS02802 
      144 EORTC QLQ-C30: Trouble taking a short walk                      QS02803 
      145 EORTC QLQ-C30: Stay in bed or chair during the day              QS02804 
      146 EORTC QLQ-C30: Need help eating, dressing, washing              QS02805 
      147 EORTC QLQ-C30: Limited in work or daily activities              QS02806 
      148 EORTC QLQ-C30: Limited in hobbies or leisure activities         QS02807 
      149 EORTC QLQ-C30: Were you short of breath                         QS02808 
      150 EORTC QLQ-C30: Have you had pain                                QS02809 
      151 EORTC QLQ-C30: Did you need to rest                             QS02810 
      152 EORTC QLQ-C30: Have you had trouble sleeping                    QS02811 
      153 EORTC QLQ-C30: Have you felt weak                               QS02812 
      154 EORTC QLQ-C30: Have you lacked appetite                         QS02813 
      155 EORTC QLQ-C30: Have you felt nauseated                          QS02814 
      156 EORTC QLQ-C30: Have you vomited                                 QS02815 
      157 EORTC QLQ-C30: Have you been constipated                        QS02816 
      158 EORTC QLQ-C30: Have you had diarrhea                            QS02817 
      159 EORTC QLQ-C30: Were you tired                                   QS02818 
      160 EORTC QLQ-C30: Pain interfere with daily activities             QS02819 
      161 EORTC QLQ-C30: Had difficulty concentrating                     QS02820 
      162 EORTC QLQ-C30: Did you feel tense                               QS02821 
      163 EORTC QLQ-C30: Did you worry                                    QS02822 
      164 EORTC QLQ-C30: Did you feel irritable                           QS02823 
      165 EORTC QLQ-C30: Did you feel depressed                           QS02824 
      166 EORTC QLQ-C30: Had difficulty remembering things                QS02825 
      167 EORTC QLQ-C30: Interfered with your family life                 QS02826 
      168 EORTC QLQ-C30: Interfered with your social activities           QS02827 
      169 EORTC QLQ-C30: Caused you financial difficulties                QS02828 
      170 EORTC QLQ-C30: How would you rate your overall health           QS02829 
      171 EORTC QLQ-C30: Rate your overall quality of life                QS02830 
      172 EORTC QLQ-C30: Global health status/QoL (revised)               QS028QL2
      173 EORTC QLQ-C30: Physical functioning (revised)                   QS028PF2
      174 EORTC QLQ-C30: Role functioning (revised)                       QS028RF2
      175 EORTC QLQ-C30: Emotional functioning                            QS028EF 
      176 EORTC QLQ-C30: Cognitive functioning                            QS028CF 
      177 EORTC QLQ-C30: Social functioning                               QS028SF 
      178 EORTC QLQ-C30: Fatigue                                          QS028FA 
      179 EORTC QLQ-C30: Nausea and vomiting                              QS028NV 
      180 EORTC QLQ-C30: Pain                                             QS028PA 
      181 EORTC QLQ-C30: Dyspnoea                                         QS028DY 
      182 EORTC QLQ-C30: Insomnia                                         QS028SL 
      183 EORTC QLQ-C30: Appetite loss                                    QS028AP 
      184 EORTC QLQ-C30: Constipation                                     QS028CO 
      185 EORTC QLQ-C30: Diarrhoea                                        QS028DI 
      186 EORTC QLQ-C30: Financial difficulties                           QS028FI 
      187 EORTC QLQ-C30: Completion - Expectation                         EX028   
      188 EORTC QLQ-C30: Completion - Completed all questions             CO028ALL
      189 EORTC QLQ-C30: Completion - Completed at least 80% of questions CO02880P
      190 EORTC QLQ-C30: Completion - Completed at least 2 question(s)    CO0282Q 
      191 EORTC QLQ-C30: Trouble doing strenuous activities               QS02801 
      192 EORTC QLQ-C30: Trouble taking a long walk                       QS02802 
      193 EORTC QLQ-C30: Trouble taking a short walk                      QS02803 
      194 EORTC QLQ-C30: Stay in bed or chair during the day              QS02804 
      195 EORTC QLQ-C30: Need help eating, dressing, washing              QS02805 
      196 EORTC QLQ-C30: Limited in work or daily activities              QS02806 
      197 EORTC QLQ-C30: Limited in hobbies or leisure activities         QS02807 
      198 EORTC QLQ-C30: Were you short of breath                         QS02808 
      199 EORTC QLQ-C30: Have you had pain                                QS02809 
      200 EORTC QLQ-C30: Did you need to rest                             QS02810 
      201 EORTC QLQ-C30: Have you had trouble sleeping                    QS02811 
      202 EORTC QLQ-C30: Have you felt weak                               QS02812 
      203 EORTC QLQ-C30: Have you lacked appetite                         QS02813 
      204 EORTC QLQ-C30: Have you felt nauseated                          QS02814 
      205 EORTC QLQ-C30: Have you vomited                                 QS02815 
      206 EORTC QLQ-C30: Have you been constipated                        QS02816 
      207 EORTC QLQ-C30: Have you had diarrhea                            QS02817 
      208 EORTC QLQ-C30: Were you tired                                   QS02818 
      209 EORTC QLQ-C30: Pain interfere with daily activities             QS02819 
      210 EORTC QLQ-C30: Had difficulty concentrating                     QS02820 
      211 EORTC QLQ-C30: Did you feel tense                               QS02821 
      212 EORTC QLQ-C30: Did you worry                                    QS02822 
      213 EORTC QLQ-C30: Did you feel irritable                           QS02823 
      214 EORTC QLQ-C30: Did you feel depressed                           QS02824 
      215 EORTC QLQ-C30: Had difficulty remembering things                QS02825 
      216 EORTC QLQ-C30: Interfered with your family life                 QS02826 
      217 EORTC QLQ-C30: Interfered with your social activities           QS02827 
      218 EORTC QLQ-C30: Caused you financial difficulties                QS02828 
      219 EORTC QLQ-C30: How would you rate your overall health           QS02829 
      220 EORTC QLQ-C30: Rate your overall quality of life                QS02830 
      221 EORTC QLQ-C30: Global health status/QoL (revised)               QS028QL2
      222 EORTC QLQ-C30: Physical functioning (revised)                   QS028PF2
      223 EORTC QLQ-C30: Role functioning (revised)                       QS028RF2
      224 EORTC QLQ-C30: Emotional functioning                            QS028EF 
      225 EORTC QLQ-C30: Cognitive functioning                            QS028CF 
      226 EORTC QLQ-C30: Social functioning                               QS028SF 
      227 EORTC QLQ-C30: Fatigue                                          QS028FA 
      228 EORTC QLQ-C30: Nausea and vomiting                              QS028NV 
      229 EORTC QLQ-C30: Pain                                             QS028PA 
      230 EORTC QLQ-C30: Dyspnoea                                         QS028DY 
      231 EORTC QLQ-C30: Insomnia                                         QS028SL 
      232 EORTC QLQ-C30: Appetite loss                                    QS028AP 
      233 EORTC QLQ-C30: Constipation                                     QS028CO 
      234 EORTC QLQ-C30: Diarrhoea                                        QS028DI 
      235 EORTC QLQ-C30: Financial difficulties                           QS028FI 
      236 EORTC QLQ-C30: Completion - Expectation                         EX028   
      237 EORTC QLQ-C30: Completion - Completed all questions             CO028ALL
      238 EORTC QLQ-C30: Completion - Completed at least 80% of questions CO02880P
      239 EORTC QLQ-C30: Completion - Completed at least 2 question(s)    CO0282Q 
      240 EORTC QLQ-C30: Trouble doing strenuous activities               QS02801 
      241 EORTC QLQ-C30: Trouble taking a long walk                       QS02802 
      242 EORTC QLQ-C30: Trouble taking a short walk                      QS02803 
      243 EORTC QLQ-C30: Stay in bed or chair during the day              QS02804 
      244 EORTC QLQ-C30: Need help eating, dressing, washing              QS02805 
      245 EORTC QLQ-C30: Limited in work or daily activities              QS02806 
      246 EORTC QLQ-C30: Limited in hobbies or leisure activities         QS02807 
      247 EORTC QLQ-C30: Were you short of breath                         QS02808 
      248 EORTC QLQ-C30: Have you had pain                                QS02809 
      249 EORTC QLQ-C30: Did you need to rest                             QS02810 
      250 EORTC QLQ-C30: Have you had trouble sleeping                    QS02811 
      251 EORTC QLQ-C30: Have you felt weak                               QS02812 
      252 EORTC QLQ-C30: Have you lacked appetite                         QS02813 
      253 EORTC QLQ-C30: Have you felt nauseated                          QS02814 
      254 EORTC QLQ-C30: Have you vomited                                 QS02815 
      255 EORTC QLQ-C30: Have you been constipated                        QS02816 
      256 EORTC QLQ-C30: Have you had diarrhea                            QS02817 
      257 EORTC QLQ-C30: Were you tired                                   QS02818 
      258 EORTC QLQ-C30: Pain interfere with daily activities             QS02819 
      259 EORTC QLQ-C30: Had difficulty concentrating                     QS02820 
      260 EORTC QLQ-C30: Did you feel tense                               QS02821 
      261 EORTC QLQ-C30: Did you worry                                    QS02822 
      262 EORTC QLQ-C30: Did you feel irritable                           QS02823 
      263 EORTC QLQ-C30: Did you feel depressed                           QS02824 
      264 EORTC QLQ-C30: Had difficulty remembering things                QS02825 
      265 EORTC QLQ-C30: Interfered with your family life                 QS02826 
      266 EORTC QLQ-C30: Interfered with your social activities           QS02827 
      267 EORTC QLQ-C30: Caused you financial difficulties                QS02828 
      268 EORTC QLQ-C30: How would you rate your overall health           QS02829 
      269 EORTC QLQ-C30: Rate your overall quality of life                QS02830 
      270 EORTC QLQ-C30: Global health status/QoL (revised)               QS028QL2
      271 EORTC QLQ-C30: Physical functioning (revised)                   QS028PF2
      272 EORTC QLQ-C30: Role functioning (revised)                       QS028RF2
      273 EORTC QLQ-C30: Emotional functioning                            QS028EF 
      274 EORTC QLQ-C30: Cognitive functioning                            QS028CF 
      275 EORTC QLQ-C30: Social functioning                               QS028SF 
      276 EORTC QLQ-C30: Fatigue                                          QS028FA 
      277 EORTC QLQ-C30: Nausea and vomiting                              QS028NV 
      278 EORTC QLQ-C30: Pain                                             QS028PA 
      279 EORTC QLQ-C30: Dyspnoea                                         QS028DY 
      280 EORTC QLQ-C30: Insomnia                                         QS028SL 
      281 EORTC QLQ-C30: Appetite loss                                    QS028AP 
      282 EORTC QLQ-C30: Constipation                                     QS028CO 
      283 EORTC QLQ-C30: Diarrhoea                                        QS028DI 
      284 EORTC QLQ-C30: Financial difficulties                           QS028FI 
      285 EORTC QLQ-C30: Completion - Expectation                         EX028   
      286 EORTC QLQ-C30: Completion - Completed all questions             CO028ALL
      287 EORTC QLQ-C30: Completion - Completed at least 80% of questions CO02880P
      288 EORTC QLQ-C30: Completion - Completed at least 2 question(s)    CO0282Q 
          PARCAT1       PARCAT1N PARCAT2                AVAL
          <fct>            <dbl> <fct>                 <dbl>
        1 EORTC QLQ-C30       28 Original Items         1   
        2 EORTC QLQ-C30       28 Original Items         3   
        3 EORTC QLQ-C30       28 Original Items         1   
        4 EORTC QLQ-C30       28 Original Items        NA   
        5 EORTC QLQ-C30       28 Original Items         1   
        6 EORTC QLQ-C30       28 Original Items         2   
        7 EORTC QLQ-C30       28 Original Items         4   
        8 EORTC QLQ-C30       28 Original Items         3   
        9 EORTC QLQ-C30       28 Original Items         1   
       10 EORTC QLQ-C30       28 Original Items        NA   
       11 EORTC QLQ-C30       28 Original Items         3   
       12 EORTC QLQ-C30       28 Original Items         2   
       13 EORTC QLQ-C30       28 Original Items         1   
       14 EORTC QLQ-C30       28 Original Items         3   
       15 EORTC QLQ-C30       28 Original Items         1   
       16 EORTC QLQ-C30       28 Original Items         1   
       17 EORTC QLQ-C30       28 Original Items         1   
       18 EORTC QLQ-C30       28 Original Items         4   
       19 EORTC QLQ-C30       28 Original Items         1   
       20 EORTC QLQ-C30       28 Original Items         2   
       21 EORTC QLQ-C30       28 Original Items         2   
       22 EORTC QLQ-C30       28 Original Items        NA   
       23 EORTC QLQ-C30       28 Original Items         2   
       24 EORTC QLQ-C30       28 Original Items         4   
       25 EORTC QLQ-C30       28 Original Items         1   
       26 EORTC QLQ-C30       28 Original Items         2   
       27 EORTC QLQ-C30       28 Original Items         2   
       28 EORTC QLQ-C30       28 Original Items         1   
       29 EORTC QLQ-C30       28 Original Items         7   
       30 EORTC QLQ-C30       28 Original Items         1   
       31 EORTC QLQ-C30       28 Global Health Status  50   
       32 EORTC QLQ-C30       28 Functional Scales     83.3 
       33 EORTC QLQ-C30       28 Functional Scales     33.3 
       34 EORTC QLQ-C30       28 Functional Scales     44.4 
       35 EORTC QLQ-C30       28 Functional Scales     83.3 
       36 EORTC QLQ-C30       28 Functional Scales     66.7 
       37 EORTC QLQ-C30       28 Symptom Scales        66.7 
       38 EORTC QLQ-C30       28 Symptom Scales        33.3 
       39 EORTC QLQ-C30       28 Symptom Scales         0   
       40 EORTC QLQ-C30       28 Symptom Scales        66.7 
       41 EORTC QLQ-C30       28 Symptom Scales        66.7 
       42 EORTC QLQ-C30       28 Symptom Scales         0   
       43 EORTC QLQ-C30       28 Symptom Scales         0   
       44 EORTC QLQ-C30       28 Symptom Scales         0   
       45 EORTC QLQ-C30       28 Symptom Scales         0   
       46 EORTC QLQ-C30       28 Completion             0   
       47 EORTC QLQ-C30       28 Original Items         4   
       48 EORTC QLQ-C30       28 Original Items         3   
       49 EORTC QLQ-C30       28 Original Items         1   
       50 EORTC QLQ-C30       28 Original Items         3   
       51 EORTC QLQ-C30       28 Original Items         1   
       52 EORTC QLQ-C30       28 Original Items         2   
       53 EORTC QLQ-C30       28 Original Items         3   
       54 EORTC QLQ-C30       28 Original Items         4   
       55 EORTC QLQ-C30       28 Original Items         3   
       56 EORTC QLQ-C30       28 Original Items        NA   
       57 EORTC QLQ-C30       28 Original Items        NA   
       58 EORTC QLQ-C30       28 Original Items         1   
       59 EORTC QLQ-C30       28 Original Items         3   
       60 EORTC QLQ-C30       28 Original Items         4   
       61 EORTC QLQ-C30       28 Original Items         4   
       62 EORTC QLQ-C30       28 Original Items         3   
       63 EORTC QLQ-C30       28 Original Items         4   
       64 EORTC QLQ-C30       28 Original Items         1   
       65 EORTC QLQ-C30       28 Original Items        NA   
       66 EORTC QLQ-C30       28 Original Items         2   
       67 EORTC QLQ-C30       28 Original Items         4   
       68 EORTC QLQ-C30       28 Original Items         2   
       69 EORTC QLQ-C30       28 Original Items         3   
       70 EORTC QLQ-C30       28 Original Items         1   
       71 EORTC QLQ-C30       28 Original Items         4   
       72 EORTC QLQ-C30       28 Original Items         3   
       73 EORTC QLQ-C30       28 Original Items        NA   
       74 EORTC QLQ-C30       28 Original Items         2   
       75 EORTC QLQ-C30       28 Original Items         6   
       76 EORTC QLQ-C30       28 Original Items        NA   
       77 EORTC QLQ-C30       28 Global Health Status  83.3 
       78 EORTC QLQ-C30       28 Functional Scales     53.3 
       79 EORTC QLQ-C30       28 Functional Scales     50   
       80 EORTC QLQ-C30       28 Functional Scales     50   
       81 EORTC QLQ-C30       28 Functional Scales     33.3 
       82 EORTC QLQ-C30       28 Functional Scales     33.3 
       83 EORTC QLQ-C30       28 Symptom Scales         0   
       84 EORTC QLQ-C30       28 Symptom Scales       100   
       85 EORTC QLQ-C30       28 Symptom Scales        66.7 
       86 EORTC QLQ-C30       28 Symptom Scales       100   
       87 EORTC QLQ-C30       28 Symptom Scales        NA   
       88 EORTC QLQ-C30       28 Symptom Scales        66.7 
       89 EORTC QLQ-C30       28 Symptom Scales        66.7 
       90 EORTC QLQ-C30       28 Symptom Scales       100   
       91 EORTC QLQ-C30       28 Symptom Scales        33.3 
       92 EORTC QLQ-C30       28 Completion             0   
       93 EORTC QLQ-C30       28 Original Items        NA   
       94 EORTC QLQ-C30       28 Original Items        NA   
       95 EORTC QLQ-C30       28 Original Items         1   
       96 EORTC QLQ-C30       28 Original Items         1   
       97 EORTC QLQ-C30       28 Original Items         2   
       98 EORTC QLQ-C30       28 Original Items        NA   
       99 EORTC QLQ-C30       28 Original Items         2   
      100 EORTC QLQ-C30       28 Original Items         4   
      101 EORTC QLQ-C30       28 Original Items         2   
      102 EORTC QLQ-C30       28 Original Items         4   
      103 EORTC QLQ-C30       28 Original Items        NA   
      104 EORTC QLQ-C30       28 Original Items         2   
      105 EORTC QLQ-C30       28 Original Items         3   
      106 EORTC QLQ-C30       28 Original Items         2   
      107 EORTC QLQ-C30       28 Original Items         1   
      108 EORTC QLQ-C30       28 Original Items         2   
      109 EORTC QLQ-C30       28 Original Items         2   
      110 EORTC QLQ-C30       28 Original Items         1   
      111 EORTC QLQ-C30       28 Original Items        NA   
      112 EORTC QLQ-C30       28 Original Items         4   
      113 EORTC QLQ-C30       28 Original Items         3   
      114 EORTC QLQ-C30       28 Original Items         2   
      115 EORTC QLQ-C30       28 Original Items        NA   
      116 EORTC QLQ-C30       28 Original Items         4   
      117 EORTC QLQ-C30       28 Original Items         2   
      118 EORTC QLQ-C30       28 Original Items         3   
      119 EORTC QLQ-C30       28 Original Items         4   
      120 EORTC QLQ-C30       28 Original Items         1   
      121 EORTC QLQ-C30       28 Original Items         3   
      122 EORTC QLQ-C30       28 Original Items        NA   
      123 EORTC QLQ-C30       28 Global Health Status  33.3 
      124 EORTC QLQ-C30       28 Functional Scales     88.9 
      125 EORTC QLQ-C30       28 Functional Scales     66.7 
      126 EORTC QLQ-C30       28 Functional Scales     33.3 
      127 EORTC QLQ-C30       28 Functional Scales     33.3 
      128 EORTC QLQ-C30       28 Functional Scales     16.7 
      129 EORTC QLQ-C30       28 Symptom Scales        44.4 
      130 EORTC QLQ-C30       28 Symptom Scales        16.7 
      131 EORTC QLQ-C30       28 Symptom Scales        33.3 
      132 EORTC QLQ-C30       28 Symptom Scales       100   
      133 EORTC QLQ-C30       28 Symptom Scales        NA   
      134 EORTC QLQ-C30       28 Symptom Scales        66.7 
      135 EORTC QLQ-C30       28 Symptom Scales        33.3 
      136 EORTC QLQ-C30       28 Symptom Scales        33.3 
      137 EORTC QLQ-C30       28 Symptom Scales         0   
      138 EORTC QLQ-C30       28 Completion             1   
      139 EORTC QLQ-C30       NA Completion             0   
      140 EORTC QLQ-C30       NA Completion             0   
      141 EORTC QLQ-C30       NA Completion             1   
      142 EORTC QLQ-C30       28 Original Items         1   
      143 EORTC QLQ-C30       28 Original Items         2   
      144 EORTC QLQ-C30       28 Original Items        NA   
      145 EORTC QLQ-C30       28 Original Items         3   
      146 EORTC QLQ-C30       28 Original Items         1   
      147 EORTC QLQ-C30       28 Original Items        NA   
      148 EORTC QLQ-C30       28 Original Items         2   
      149 EORTC QLQ-C30       28 Original Items        NA   
      150 EORTC QLQ-C30       28 Original Items         1   
      151 EORTC QLQ-C30       28 Original Items         2   
      152 EORTC QLQ-C30       28 Original Items        NA   
      153 EORTC QLQ-C30       28 Original Items         2   
      154 EORTC QLQ-C30       28 Original Items        NA   
      155 EORTC QLQ-C30       28 Original Items         4   
      156 EORTC QLQ-C30       28 Original Items         4   
      157 EORTC QLQ-C30       28 Original Items         4   
      158 EORTC QLQ-C30       28 Original Items         1   
      159 EORTC QLQ-C30       28 Original Items        NA   
      160 EORTC QLQ-C30       28 Original Items         3   
      161 EORTC QLQ-C30       28 Original Items         3   
      162 EORTC QLQ-C30       28 Original Items        NA   
      163 EORTC QLQ-C30       28 Original Items         1   
      164 EORTC QLQ-C30       28 Original Items         1   
      165 EORTC QLQ-C30       28 Original Items         3   
      166 EORTC QLQ-C30       28 Original Items        NA   
      167 EORTC QLQ-C30       28 Original Items         1   
      168 EORTC QLQ-C30       28 Original Items        NA   
      169 EORTC QLQ-C30       28 Original Items         3   
      170 EORTC QLQ-C30       28 Original Items         3   
      171 EORTC QLQ-C30       28 Original Items         6   
      172 EORTC QLQ-C30       28 Global Health Status  58.3 
      173 EORTC QLQ-C30       28 Functional Scales     75   
      174 EORTC QLQ-C30       28 Functional Scales     66.7 
      175 EORTC QLQ-C30       28 Functional Scales     77.8 
      176 EORTC QLQ-C30       28 Functional Scales     33.3 
      177 EORTC QLQ-C30       28 Functional Scales    100   
      178 EORTC QLQ-C30       28 Symptom Scales        33.3 
      179 EORTC QLQ-C30       28 Symptom Scales       100   
      180 EORTC QLQ-C30       28 Symptom Scales        33.3 
      181 EORTC QLQ-C30       28 Symptom Scales        NA   
      182 EORTC QLQ-C30       28 Symptom Scales        NA   
      183 EORTC QLQ-C30       28 Symptom Scales        NA   
      184 EORTC QLQ-C30       28 Symptom Scales       100   
      185 EORTC QLQ-C30       28 Symptom Scales         0   
      186 EORTC QLQ-C30       28 Symptom Scales        66.7 
      187 EORTC QLQ-C30       28 Completion             1   
      188 EORTC QLQ-C30       NA Completion             0   
      189 EORTC QLQ-C30       NA Completion             0   
      190 EORTC QLQ-C30       NA Completion             1   
      191 EORTC QLQ-C30       28 Original Items         2   
      192 EORTC QLQ-C30       28 Original Items        NA   
      193 EORTC QLQ-C30       28 Original Items        NA   
      194 EORTC QLQ-C30       28 Original Items         1   
      195 EORTC QLQ-C30       28 Original Items         1   
      196 EORTC QLQ-C30       28 Original Items         3   
      197 EORTC QLQ-C30       28 Original Items         2   
      198 EORTC QLQ-C30       28 Original Items         2   
      199 EORTC QLQ-C30       28 Original Items         4   
      200 EORTC QLQ-C30       28 Original Items         2   
      201 EORTC QLQ-C30       28 Original Items        NA   
      202 EORTC QLQ-C30       28 Original Items         2   
      203 EORTC QLQ-C30       28 Original Items        NA   
      204 EORTC QLQ-C30       28 Original Items         3   
      205 EORTC QLQ-C30       28 Original Items         1   
      206 EORTC QLQ-C30       28 Original Items        NA   
      207 EORTC QLQ-C30       28 Original Items         4   
      208 EORTC QLQ-C30       28 Original Items         3   
      209 EORTC QLQ-C30       28 Original Items         3   
      210 EORTC QLQ-C30       28 Original Items         4   
      211 EORTC QLQ-C30       28 Original Items         4   
      212 EORTC QLQ-C30       28 Original Items         3   
      213 EORTC QLQ-C30       28 Original Items         4   
      214 EORTC QLQ-C30       28 Original Items         3   
      215 EORTC QLQ-C30       28 Original Items        NA   
      216 EORTC QLQ-C30       28 Original Items         1   
      217 EORTC QLQ-C30       28 Original Items         1   
      218 EORTC QLQ-C30       28 Original Items         2   
      219 EORTC QLQ-C30       28 Original Items        NA   
      220 EORTC QLQ-C30       28 Original Items         1   
      221 EORTC QLQ-C30       28 Global Health Status   0   
      222 EORTC QLQ-C30       28 Functional Scales     88.9 
      223 EORTC QLQ-C30       28 Functional Scales     50   
      224 EORTC QLQ-C30       28 Functional Scales     16.7 
      225 EORTC QLQ-C30       28 Functional Scales      0   
      226 EORTC QLQ-C30       28 Functional Scales    100   
      227 EORTC QLQ-C30       28 Symptom Scales        44.4 
      228 EORTC QLQ-C30       28 Symptom Scales        33.3 
      229 EORTC QLQ-C30       28 Symptom Scales        83.3 
      230 EORTC QLQ-C30       28 Symptom Scales        33.3 
      231 EORTC QLQ-C30       28 Symptom Scales        NA   
      232 EORTC QLQ-C30       28 Symptom Scales        NA   
      233 EORTC QLQ-C30       28 Symptom Scales        NA   
      234 EORTC QLQ-C30       28 Symptom Scales       100   
      235 EORTC QLQ-C30       28 Symptom Scales        33.3 
      236 EORTC QLQ-C30       28 Completion             1   
      237 EORTC QLQ-C30       NA Completion             0   
      238 EORTC QLQ-C30       NA Completion             0   
      239 EORTC QLQ-C30       NA Completion             1   
      240 EORTC QLQ-C30       28 Original Items         1   
      241 EORTC QLQ-C30       28 Original Items         3   
      242 EORTC QLQ-C30       28 Original Items        NA   
      243 EORTC QLQ-C30       28 Original Items         1   
      244 EORTC QLQ-C30       28 Original Items        NA   
      245 EORTC QLQ-C30       28 Original Items         1   
      246 EORTC QLQ-C30       28 Original Items         2   
      247 EORTC QLQ-C30       28 Original Items         4   
      248 EORTC QLQ-C30       28 Original Items         4   
      249 EORTC QLQ-C30       28 Original Items         3   
      250 EORTC QLQ-C30       28 Original Items         2   
      251 EORTC QLQ-C30       28 Original Items         2   
      252 EORTC QLQ-C30       28 Original Items         3   
      253 EORTC QLQ-C30       28 Original Items         3   
      254 EORTC QLQ-C30       28 Original Items         4   
      255 EORTC QLQ-C30       28 Original Items         1   
      256 EORTC QLQ-C30       28 Original Items         4   
      257 EORTC QLQ-C30       28 Original Items         2   
      258 EORTC QLQ-C30       28 Original Items        NA   
      259 EORTC QLQ-C30       28 Original Items         2   
      260 EORTC QLQ-C30       28 Original Items         3   
      261 EORTC QLQ-C30       28 Original Items         3   
      262 EORTC QLQ-C30       28 Original Items         2   
      263 EORTC QLQ-C30       28 Original Items         4   
      264 EORTC QLQ-C30       28 Original Items        NA   
      265 EORTC QLQ-C30       28 Original Items         2   
      266 EORTC QLQ-C30       28 Original Items         1   
      267 EORTC QLQ-C30       28 Original Items         3   
      268 EORTC QLQ-C30       28 Original Items         1   
      269 EORTC QLQ-C30       28 Original Items         2   
      270 EORTC QLQ-C30       28 Global Health Status   8.33
      271 EORTC QLQ-C30       28 Functional Scales     77.8 
      272 EORTC QLQ-C30       28 Functional Scales     83.3 
      273 EORTC QLQ-C30       28 Functional Scales     33.3 
      274 EORTC QLQ-C30       28 Functional Scales     66.7 
      275 EORTC QLQ-C30       28 Functional Scales     83.3 
      276 EORTC QLQ-C30       28 Symptom Scales        44.4 
      277 EORTC QLQ-C30       28 Symptom Scales        83.3 
      278 EORTC QLQ-C30       28 Symptom Scales       100   
      279 EORTC QLQ-C30       28 Symptom Scales       100   
      280 EORTC QLQ-C30       28 Symptom Scales        33.3 
      281 EORTC QLQ-C30       28 Symptom Scales        66.7 
      282 EORTC QLQ-C30       28 Symptom Scales         0   
      283 EORTC QLQ-C30       28 Symptom Scales       100   
      284 EORTC QLQ-C30       28 Symptom Scales        66.7 
      285 EORTC QLQ-C30       28 Completion             1   
      286 EORTC QLQ-C30       NA Completion             0   
      287 EORTC QLQ-C30       NA Completion             1   
      288 EORTC QLQ-C30       NA Completion             1   
          AVALC                                       BASE ABLFL    CHG   PCHG
          <fct>                                      <dbl> <fct>  <dbl>  <dbl>
        1 NOT AT ALL                                  NA   ""      NA     NA  
        2 QUITE A BIT                                 NA   ""      NA     NA  
        3 NOT AT ALL                                  NA   ""      NA     NA  
        4 <NA>                                        NA   ""      NA     NA  
        5 NOT AT ALL                                  NA   ""      NA     NA  
        6 A LITTLE                                    NA   ""      NA     NA  
        7 VERY MUCH                                   NA   ""      NA     NA  
        8 QUITE A BIT                                 NA   ""      NA     NA  
        9 NOT AT ALL                                  NA   ""      NA     NA  
       10 <NA>                                        NA   ""      NA     NA  
       11 QUITE A BIT                                 NA   ""      NA     NA  
       12 A LITTLE                                    NA   ""      NA     NA  
       13 NOT AT ALL                                  NA   ""      NA     NA  
       14 QUITE A BIT                                 NA   ""      NA     NA  
       15 NOT AT ALL                                  NA   ""      NA     NA  
       16 NOT AT ALL                                  NA   ""      NA     NA  
       17 NOT AT ALL                                  NA   ""      NA     NA  
       18 VERY MUCH                                   NA   ""      NA     NA  
       19 NOT AT ALL                                  NA   ""      NA     NA  
       20 A LITTLE                                    NA   ""      NA     NA  
       21 A LITTLE                                    NA   ""      NA     NA  
       22 <NA>                                        NA   ""      NA     NA  
       23 A LITTLE                                    NA   ""      NA     NA  
       24 VERY MUCH                                   NA   ""      NA     NA  
       25 NOT AT ALL                                  NA   ""      NA     NA  
       26 A LITTLE                                    NA   ""      NA     NA  
       27 A LITTLE                                    NA   ""      NA     NA  
       28 NOT AT ALL                                  NA   ""      NA     NA  
       29 7 - EXCELLENT                               NA   ""      NA     NA  
       30 1 - VERY POOR                               NA   ""      NA     NA  
       31 50                                          NA   ""      NA     NA  
       32 83.3333333333333                            NA   ""      NA     NA  
       33 33.3333333333333                            NA   ""      NA     NA  
       34 44.4444444444444                            NA   ""      NA     NA  
       35 83.3333333333333                            NA   ""      NA     NA  
       36 66.6666666666667                            NA   ""      NA     NA  
       37 66.6666666666667                            NA   ""      NA     NA  
       38 33.3333333333333                            NA   ""      NA     NA  
       39 0                                           NA   ""      NA     NA  
       40 66.6666666666667                            NA   ""      NA     NA  
       41 66.6666666666667                            NA   ""      NA     NA  
       42 0                                           NA   ""      NA     NA  
       43 0                                           NA   ""      NA     NA  
       44 0                                           NA   ""      NA     NA  
       45 0                                           NA   ""      NA     NA  
       46 Not expected to complete questionnaire      NA   ""      NA     NA  
       47 VERY MUCH                                    4   "Y"      0      0  
       48 QUITE A BIT                                  3   "Y"      0      0  
       49 NOT AT ALL                                   1   "Y"      0      0  
       50 QUITE A BIT                                  3   "Y"      0      0  
       51 NOT AT ALL                                   1   "Y"      0      0  
       52 A LITTLE                                     2   "Y"      0      0  
       53 QUITE A BIT                                  3   "Y"      0      0  
       54 VERY MUCH                                    4   "Y"      0      0  
       55 QUITE A BIT                                  3   "Y"      0      0  
       56 <NA>                                        NA   "Y"     NA     NA  
       57 <NA>                                        NA   "Y"     NA     NA  
       58 NOT AT ALL                                   1   "Y"      0      0  
       59 QUITE A BIT                                  3   "Y"      0      0  
       60 VERY MUCH                                    4   "Y"      0      0  
       61 VERY MUCH                                    4   "Y"      0      0  
       62 QUITE A BIT                                  3   "Y"      0      0  
       63 VERY MUCH                                    4   "Y"      0      0  
       64 NOT AT ALL                                   1   "Y"      0      0  
       65 <NA>                                        NA   "Y"     NA     NA  
       66 A LITTLE                                     2   "Y"      0      0  
       67 VERY MUCH                                    4   "Y"      0      0  
       68 A LITTLE                                     2   "Y"      0      0  
       69 QUITE A BIT                                  3   "Y"      0      0  
       70 NOT AT ALL                                   1   "Y"      0      0  
       71 VERY MUCH                                    4   "Y"      0      0  
       72 QUITE A BIT                                  3   "Y"      0      0  
       73 <NA>                                        NA   "Y"     NA     NA  
       74 A LITTLE                                     2   "Y"      0      0  
       75 6                                            6   "Y"      0      0  
       76 <NA>                                        NA   "Y"     NA     NA  
       77 83.3333333333333                            83.3 "Y"      0      0  
       78 53.3333333333333                            53.3 "Y"      0      0  
       79 50                                          50   "Y"      0      0  
       80 50                                          50   "Y"      0      0  
       81 33.3333333333333                            33.3 "Y"      0      0  
       82 33.3333333333333                            33.3 "Y"      0      0  
       83 0                                            0   "Y"      0    NaN  
       84 100                                        100   "Y"      0      0  
       85 66.6666666666667                            66.7 "Y"      0      0  
       86 100                                        100   "Y"      0      0  
       87 <NA>                                        NA   "Y"     NA     NA  
       88 66.6666666666667                            66.7 "Y"      0      0  
       89 66.6666666666667                            66.7 "Y"      0      0  
       90 100                                        100   "Y"      0      0  
       91 33.3333333333333                            33.3 "Y"      0      0  
       92 Not expected to complete questionnaire      NA   ""      NA     NA  
       93 <NA>                                         4   ""      NA     NA  
       94 <NA>                                         3   ""      NA     NA  
       95 NOT AT ALL                                   1   ""       0      0  
       96 NOT AT ALL                                   3   ""      -2    -66.7
       97 A LITTLE                                     1   ""       1    100  
       98 <NA>                                         2   ""      NA     NA  
       99 A LITTLE                                     3   ""      -1    -33.3
      100 VERY MUCH                                    4   ""       0      0  
      101 A LITTLE                                     3   ""      -1    -33.3
      102 VERY MUCH                                   NA   ""      NA     NA  
      103 <NA>                                        NA   ""      NA     NA  
      104 A LITTLE                                     1   ""       1    100  
      105 QUITE A BIT                                  3   ""       0      0  
      106 A LITTLE                                     4   ""      -2    -50  
      107 NOT AT ALL                                   4   ""      -3    -75  
      108 A LITTLE                                     3   ""      -1    -33.3
      109 A LITTLE                                     4   ""      -2    -50  
      110 NOT AT ALL                                   1   ""       0      0  
      111 <NA>                                        NA   ""      NA     NA  
      112 VERY MUCH                                    2   ""       2    100  
      113 QUITE A BIT                                  4   ""      -1    -25  
      114 A LITTLE                                     2   ""       0      0  
      115 <NA>                                         3   ""      NA     NA  
      116 VERY MUCH                                    1   ""       3    300  
      117 A LITTLE                                     4   ""      -2    -50  
      118 QUITE A BIT                                  3   ""       0      0  
      119 VERY MUCH                                   NA   ""      NA     NA  
      120 NOT AT ALL                                   2   ""      -1    -50  
      121 3                                            6   ""      -3    -50  
      122 <NA>                                        NA   ""      NA     NA  
      123 33.3333333333333                            83.3 ""     -50    -60  
      124 88.8888888888889                            53.3 ""      35.6   66.7
      125 66.6666666666667                            50   ""      16.7   33.3
      126 33.3333333333333                            50   ""     -16.7  -33.3
      127 33.3333333333333                            33.3 ""       0      0  
      128 16.6666666666667                            33.3 ""     -16.7  -50  
      129 44.4444444444444                             0   ""      44.4  Inf  
      130 16.6666666666667                           100   ""     -83.3  -83.3
      131 33.3333333333333                            66.7 ""     -33.3  -50  
      132 100                                        100   ""       0      0  
      133 <NA>                                        NA   ""      NA     NA  
      134 66.6666666666667                            66.7 ""       0      0  
      135 33.3333333333333                            66.7 ""     -33.3  -50  
      136 33.3333333333333                           100   ""     -66.7  -66.7
      137 0                                           33.3 ""     -33.3 -100  
      138 Expected to complete questionnaire          NA   ""      NA     NA  
      139 Did not complete all questions              NA   <NA>    NA     NA  
      140 Did not complete at least 80% of questions  NA   <NA>    NA     NA  
      141 Completed at least 2 questions              NA   <NA>    NA     NA  
      142 NOT AT ALL                                   4   ""      -3    -75  
      143 A LITTLE                                     3   ""      -1    -33.3
      144 <NA>                                         1   ""      NA     NA  
      145 QUITE A BIT                                  3   ""       0      0  
      146 NOT AT ALL                                   1   ""       0      0  
      147 <NA>                                         2   ""      NA     NA  
      148 A LITTLE                                     3   ""      -1    -33.3
      149 <NA>                                         4   ""      NA     NA  
      150 NOT AT ALL                                   3   ""      -2    -66.7
      151 A LITTLE                                    NA   ""      NA     NA  
      152 <NA>                                        NA   ""      NA     NA  
      153 A LITTLE                                     1   ""       1    100  
      154 <NA>                                         3   ""      NA     NA  
      155 VERY MUCH                                    4   ""       0      0  
      156 VERY MUCH                                    4   ""       0      0  
      157 VERY MUCH                                    3   ""       1     33.3
      158 NOT AT ALL                                   4   ""      -3    -75  
      159 <NA>                                         1   ""      NA     NA  
      160 QUITE A BIT                                 NA   ""      NA     NA  
      161 QUITE A BIT                                  2   ""       1     50  
      162 <NA>                                         4   ""      NA     NA  
      163 NOT AT ALL                                   2   ""      -1    -50  
      164 NOT AT ALL                                   3   ""      -2    -66.7
      165 QUITE A BIT                                  1   ""       2    200  
      166 <NA>                                         4   ""      NA     NA  
      167 NOT AT ALL                                   3   ""      -2    -66.7
      168 <NA>                                        NA   ""      NA     NA  
      169 QUITE A BIT                                  2   ""       1     50  
      170 3                                            6   ""      -3    -50  
      171 6                                           NA   ""      NA     NA  
      172 58.3333333333333                            83.3 ""     -25    -30  
      173 75                                          53.3 ""      21.7   40.6
      174 66.6666666666667                            50   ""      16.7   33.3
      175 77.7777777777778                            50   ""      27.8   55.6
      176 33.3333333333333                            33.3 ""       0      0  
      177 100                                         33.3 ""      66.7  200  
      178 33.3333333333333                             0   ""      33.3  Inf  
      179 100                                        100   ""       0      0  
      180 33.3333333333333                            66.7 ""     -33.3  -50  
      181 <NA>                                       100   ""      NA     NA  
      182 <NA>                                        NA   ""      NA     NA  
      183 <NA>                                        66.7 ""      NA     NA  
      184 100                                         66.7 ""      33.3   50  
      185 0                                          100   ""    -100   -100  
      186 66.6666666666667                            33.3 ""      33.3  100  
      187 Expected to complete questionnaire          NA   ""      NA     NA  
      188 Did not complete all questions              NA   <NA>    NA     NA  
      189 Did not complete at least 80% of questions  NA   <NA>    NA     NA  
      190 Completed at least 2 questions              NA   <NA>    NA     NA  
      191 A LITTLE                                     4   ""      -2    -50  
      192 <NA>                                         3   ""      NA     NA  
      193 <NA>                                         1   ""      NA     NA  
      194 NOT AT ALL                                   3   ""      -2    -66.7
      195 NOT AT ALL                                   1   ""       0      0  
      196 QUITE A BIT                                  2   ""       1     50  
      197 A LITTLE                                     3   ""      -1    -33.3
      198 A LITTLE                                     4   ""      -2    -50  
      199 VERY MUCH                                    3   ""       1     33.3
      200 A LITTLE                                    NA   ""      NA     NA  
      201 <NA>                                        NA   ""      NA     NA  
      202 A LITTLE                                     1   ""       1    100  
      203 <NA>                                         3   ""      NA     NA  
      204 QUITE A BIT                                  4   ""      -1    -25  
      205 NOT AT ALL                                   4   ""      -3    -75  
      206 <NA>                                         3   ""      NA     NA  
      207 VERY MUCH                                    4   ""       0      0  
      208 QUITE A BIT                                  1   ""       2    200  
      209 QUITE A BIT                                 NA   ""      NA     NA  
      210 VERY MUCH                                    2   ""       2    100  
      211 VERY MUCH                                    4   ""       0      0  
      212 QUITE A BIT                                  2   ""       1     50  
      213 VERY MUCH                                    3   ""       1     33.3
      214 QUITE A BIT                                  1   ""       2    200  
      215 <NA>                                         4   ""      NA     NA  
      216 NOT AT ALL                                   3   ""      -2    -66.7
      217 NOT AT ALL                                  NA   ""      NA     NA  
      218 A LITTLE                                     2   ""       0      0  
      219 <NA>                                         6   ""      NA     NA  
      220 1 - VERY POOR                               NA   ""      NA     NA  
      221 0                                           83.3 ""     -83.3 -100  
      222 88.8888888888889                            53.3 ""      35.6   66.7
      223 50                                          50   ""       0      0  
      224 16.6666666666667                            50   ""     -33.3  -66.7
      225 0                                           33.3 ""     -33.3 -100  
      226 100                                         33.3 ""      66.7  200  
      227 44.4444444444444                             0   ""      44.4  Inf  
      228 33.3333333333333                           100   ""     -66.7  -66.7
      229 83.3333333333333                            66.7 ""      16.7   25.0
      230 33.3333333333333                           100   ""     -66.7  -66.7
      231 <NA>                                        NA   ""      NA     NA  
      232 <NA>                                        66.7 ""      NA     NA  
      233 <NA>                                        66.7 ""      NA     NA  
      234 100                                        100   ""       0      0  
      235 33.3333333333333                            33.3 ""       0      0  
      236 Expected to complete questionnaire          NA   ""      NA     NA  
      237 Did not complete all questions              NA   <NA>    NA     NA  
      238 Did not complete at least 80% of questions  NA   <NA>    NA     NA  
      239 Completed at least 2 questions              NA   <NA>    NA     NA  
      240 NOT AT ALL                                   4   ""      -3    -75  
      241 QUITE A BIT                                  3   ""       0      0  
      242 <NA>                                         1   ""      NA     NA  
      243 NOT AT ALL                                   3   ""      -2    -66.7
      244 <NA>                                         1   ""      NA     NA  
      245 NOT AT ALL                                   2   ""      -1    -50  
      246 A LITTLE                                     3   ""      -1    -33.3
      247 VERY MUCH                                    4   ""       0      0  
      248 VERY MUCH                                    3   ""       1     33.3
      249 QUITE A BIT                                 NA   ""      NA     NA  
      250 A LITTLE                                    NA   ""      NA     NA  
      251 A LITTLE                                     1   ""       1    100  
      252 QUITE A BIT                                  3   ""       0      0  
      253 QUITE A BIT                                  4   ""      -1    -25  
      254 VERY MUCH                                    4   ""       0      0  
      255 NOT AT ALL                                   3   ""      -2    -66.7
      256 VERY MUCH                                    4   ""       0      0  
      257 A LITTLE                                     1   ""       1    100  
      258 <NA>                                        NA   ""      NA     NA  
      259 A LITTLE                                     2   ""       0      0  
      260 QUITE A BIT                                  4   ""      -1    -25  
      261 QUITE A BIT                                  2   ""       1     50  
      262 A LITTLE                                     3   ""      -1    -33.3
      263 VERY MUCH                                    1   ""       3    300  
      264 <NA>                                         4   ""      NA     NA  
      265 A LITTLE                                     3   ""      -1    -33.3
      266 NOT AT ALL                                  NA   ""      NA     NA  
      267 QUITE A BIT                                  2   ""       1     50  
      268 1 - VERY POOR                                6   ""      -5    -83.3
      269 2                                           NA   ""      NA     NA  
      270 8.33333333333333                            83.3 ""     -75    -90  
      271 77.7777777777778                            53.3 ""      24.4   45.8
      272 83.3333333333333                            50   ""      33.3   66.7
      273 33.3333333333333                            50   ""     -16.7  -33.3
      274 66.6666666666667                            33.3 ""      33.3  100  
      275 83.3333333333333                            33.3 ""      50    150  
      276 44.4444444444444                             0   ""      44.4  Inf  
      277 83.3333333333333                           100   ""     -16.7  -16.7
      278 100                                         66.7 ""      33.3   50  
      279 100                                        100   ""       0      0  
      280 33.3333333333333                            NA   ""      NA     NA  
      281 66.6666666666667                            66.7 ""       0      0  
      282 0                                           66.7 ""     -66.7 -100  
      283 100                                        100   ""       0      0  
      284 66.6666666666667                            33.3 ""      33.3  100  
      285 Expected to complete questionnaire          NA   ""      NA     NA  
      286 Did not complete all questions              NA   <NA>    NA     NA  
      287 Completed at least 80% of questions         NA   <NA>    NA     NA  
      288 Completed at least 2 questions              NA   <NA>    NA     NA  
          CHGCAT1                    ADTM                  ADY AVISIT        AVISITN
          <fct>                      <dttm>              <int> <fct>           <int>
        1  <NA>                      2021-01-13 22:43:53    -4 SCREENING          -1
        2  <NA>                      2021-01-13 22:43:53    -4 SCREENING          -1
        3  <NA>                      2021-01-13 22:43:53    -4 SCREENING          -1
        4  <NA>                      2021-01-13 22:43:53    -4 SCREENING          -1
        5  <NA>                      2021-01-13 22:43:53    -4 SCREENING          -1
        6  <NA>                      2021-01-13 22:43:53    -4 SCREENING          -1
        7  <NA>                      2021-01-13 22:43:53    -4 SCREENING          -1
        8  <NA>                      2021-01-13 22:43:53    -4 SCREENING          -1
        9  <NA>                      2021-01-13 22:43:53    -4 SCREENING          -1
       10  <NA>                      2021-01-13 22:43:53    -4 SCREENING          -1
       11  <NA>                      2021-01-13 22:43:53    -4 SCREENING          -1
       12  <NA>                      2021-01-13 22:43:53    -4 SCREENING          -1
       13  <NA>                      2021-01-13 22:43:53    -4 SCREENING          -1
       14  <NA>                      2021-01-13 22:43:53    -4 SCREENING          -1
       15  <NA>                      2021-01-13 22:43:53    -4 SCREENING          -1
       16  <NA>                      2021-01-13 22:43:53    -4 SCREENING          -1
       17  <NA>                      2021-01-13 22:43:53    -4 SCREENING          -1
       18  <NA>                      2021-01-13 22:43:53    -4 SCREENING          -1
       19  <NA>                      2021-01-13 22:43:53    -4 SCREENING          -1
       20  <NA>                      2021-01-13 22:43:53    -4 SCREENING          -1
       21  <NA>                      2021-01-13 22:43:53    -4 SCREENING          -1
       22  <NA>                      2021-01-13 22:43:53    -4 SCREENING          -1
       23  <NA>                      2021-01-13 22:43:53    -4 SCREENING          -1
       24  <NA>                      2021-01-13 22:43:53    -4 SCREENING          -1
       25  <NA>                      2021-01-13 22:43:53    -4 SCREENING          -1
       26  <NA>                      2021-01-13 22:43:53    -4 SCREENING          -1
       27  <NA>                      2021-01-13 22:43:53    -4 SCREENING          -1
       28  <NA>                      2021-01-13 22:43:53    -4 SCREENING          -1
       29  <NA>                      2021-01-13 22:43:53    -4 SCREENING          -1
       30  <NA>                      2021-01-13 22:43:53    -4 SCREENING          -1
       31 ""                         2021-01-13 22:43:53    -4 SCREENING          -1
       32 ""                         2021-01-13 22:43:53    -4 SCREENING          -1
       33 ""                         2021-01-13 22:43:53    -4 SCREENING          -1
       34 ""                         2021-01-13 22:43:53    -4 SCREENING          -1
       35 ""                         2021-01-13 22:43:53    -4 SCREENING          -1
       36 ""                         2021-01-13 22:43:53    -4 SCREENING          -1
       37 ""                         2021-01-13 22:43:53    -4 SCREENING          -1
       38 ""                         2021-01-13 22:43:53    -4 SCREENING          -1
       39 ""                         2021-01-13 22:43:53    -4 SCREENING          -1
       40 ""                         2021-01-13 22:43:53    -4 SCREENING          -1
       41 ""                         2021-01-13 22:43:53    -4 SCREENING          -1
       42 ""                         2021-01-13 22:43:53    -4 SCREENING          -1
       43 ""                         2021-01-13 22:43:53    -4 SCREENING          -1
       44 ""                         2021-01-13 22:43:53    -4 SCREENING          -1
       45 ""                         2021-01-13 22:43:53    -4 SCREENING          -1
       46 ""                         NA                     NA SCREENING          -1
       47 "No changed"               2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       48 "No change"                2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       49 "No change"                2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       50 "No change"                2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       51 "No change"                2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       52 "No change"                2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       53 "No change"                2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       54 "No change"                2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       55 "No change"                2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       56  <NA>                      2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       57  <NA>                      2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       58 "No change"                2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       59 "No change"                2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       60 "No change"                2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       61 "No change"                2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       62 "No change"                2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       63 "No change"                2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       64 "No change"                2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       65  <NA>                      2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       66 "No change"                2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       67 "No change"                2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       68 "No change"                2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       69 "No change"                2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       70 "No change"                2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       71 "No change"                2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       72 "No change"                2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       73  <NA>                      2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       74 "No change"                2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       75 "No change"                2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       76  <NA>                      2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       77 "No change"                2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       78 "No change"                2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       79 "No change"                2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       80 "No change"                2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       81 "No change"                2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       82 "No change"                2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       83 "No change"                2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       84 "No change"                2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       85 "No change"                2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       86 "No change"                2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       87 ""                         2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       88 "No change"                2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       89 "No change"                2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       90 "No change"                2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       91 "No change"                2021-01-17 22:43:53     1 CYCLE 1 DAY 1       0
       92 ""                         NA                     NA CYCLE 1 DAY 1       0
       93  <NA>                      2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
       94  <NA>                      2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
       95 "No change"                2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
       96 "Improved by two levels"   2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
       97 "Worsened by one level"    2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
       98  <NA>                      2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
       99 "Improved by one level"    2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      100 "No change"                2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      101 "Improved by one level"    2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      102  <NA>                      2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      103  <NA>                      2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      104 "Worsened by one level"    2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      105 "No change"                2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      106 "Improved by two levels"   2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      107 "Improved by three levels" 2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      108 "Improved by one level"    2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      109 "Improved by two levels"   2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      110 "No change"                2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      111  <NA>                      2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      112 "Worsened by two levels"   2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      113 "Improved by one level"    2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      114 "No change"                2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      115  <NA>                      2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      116 "Worsened by three levels" 2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      117 "Improved by two levels"   2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      118 "No change"                2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      119  <NA>                      2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      120 "Improved by one level"    2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      121 "Worsened by three levels" 2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      122  <NA>                      2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      123 "Worsened"                 2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      124 "Improved"                 2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      125 "Improved"                 2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      126 "Worsened"                 2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      127 "No change"                2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      128 "Worsened"                 2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      129 "Worsened"                 2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      130 "Improved"                 2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      131 "Improved"                 2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      132 "No change"                2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      133 ""                         2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      134 "No change"                2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      135 "Improved"                 2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      136 "Improved"                 2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      137 "Improved"                 2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      138 ""                         NA                     NA CYCLE 2 DAY 1       1
      139  <NA>                      2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      140  <NA>                      2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      141  <NA>                      2021-01-18 22:43:53     2 CYCLE 2 DAY 1       1
      142 "Improved by three levels" 2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      143 "Improved by one level"    2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      144  <NA>                      2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      145 "No change"                2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      146 "No change"                2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      147  <NA>                      2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      148 "Improved by one level"    2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      149  <NA>                      2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      150 "Improved by two levels"   2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      151  <NA>                      2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      152  <NA>                      2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      153 "Worsened by one level"    2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      154  <NA>                      2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      155 "No change"                2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      156 "No change"                2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      157 "Worsened by one level"    2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      158 "Improved by three levels" 2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      159  <NA>                      2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      160  <NA>                      2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      161 "Worsened by one level"    2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      162  <NA>                      2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      163 "Improved by one level"    2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      164 "Improved by two levels"   2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      165 "Worsened by two levels"   2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      166  <NA>                      2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      167 "Improved by two levels"   2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      168  <NA>                      2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      169 "Worsened by one level"    2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      170 "Worsened by three levels" 2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      171  <NA>                      2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      172 "Worsened"                 2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      173 "Improved"                 2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      174 "Improved"                 2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      175 "Improved"                 2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      176 "No change"                2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      177 "Improved"                 2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      178 "Worsened"                 2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      179 "No change"                2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      180 "Improved"                 2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      181 ""                         2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      182 ""                         2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      183 ""                         2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      184 "Worsened"                 2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      185 "Improved"                 2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      186 "Worsened"                 2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      187 ""                         NA                     NA CYCLE 3 DAY 1       2
      188  <NA>                      2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      189  <NA>                      2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      190  <NA>                      2021-02-15 22:43:53    30 CYCLE 3 DAY 1       2
      191 "Improved by two levels"   2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      192  <NA>                      2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      193  <NA>                      2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      194 "Improved by two levels"   2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      195 "No change"                2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      196 "Worsened by one level"    2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      197 "Improved by one level"    2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      198 "Improved by two levels"   2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      199 "Worsened by one level"    2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      200  <NA>                      2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      201  <NA>                      2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      202 "Worsened by one level"    2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      203  <NA>                      2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      204 "Improved by one level"    2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      205 "Improved by three levels" 2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      206  <NA>                      2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      207 "No change"                2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      208 "Worsened by two levels"   2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      209  <NA>                      2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      210 "Worsened by two levels"   2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      211 "No change"                2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      212 "Worsened by one level"    2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      213 "Worsened by one level"    2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      214 "Worsened by two levels"   2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      215  <NA>                      2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      216 "Improved by two levels"   2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      217  <NA>                      2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      218 "No change"                2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      219  <NA>                      2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      220  <NA>                      2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      221 "Worsened"                 2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      222 "Improved"                 2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      223 "No change"                2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      224 "Worsened"                 2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      225 "Worsened"                 2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      226 "Improved"                 2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      227 "Worsened"                 2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      228 "Improved"                 2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      229 "Worsened"                 2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      230 "Improved"                 2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      231 ""                         2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      232 ""                         2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      233 ""                         2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      234 "No change"                2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      235 "No change"                2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      236 ""                         NA                     NA CYCLE 4 DAY 1       3
      237  <NA>                      2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      238  <NA>                      2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      239  <NA>                      2021-03-15 22:43:53    58 CYCLE 4 DAY 1       3
      240 "Improved by three levels" 2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      241 "No change"                2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      242  <NA>                      2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      243 "Improved by two levels"   2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      244  <NA>                      2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      245 "Improved by one level"    2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      246 "Improved by one level"    2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      247 "No change"                2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      248 "Worsened by one level"    2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      249  <NA>                      2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      250  <NA>                      2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      251 "Worsened by one level"    2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      252 "No change"                2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      253 "Improved by one level"    2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      254 "No change"                2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      255 "Improved by two levels"   2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      256 "No change"                2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      257 "Worsened by one level"    2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      258  <NA>                      2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      259 "No change"                2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      260 "Improved by one level"    2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      261 "Worsened by one level"    2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      262 "Improved by one level"    2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      263 "Worsened by three levels" 2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      264  <NA>                      2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      265 "Improved by one level"    2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      266  <NA>                      2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      267 "Worsened by one level"    2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      268 "Worsened by five levels"  2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      269  <NA>                      2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      270 "Worsened"                 2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      271 "Improved"                 2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      272 "Improved"                 2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      273 "Worsened"                 2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      274 "Improved"                 2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      275 "Improved"                 2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      276 "Worsened"                 2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      277 "Improved"                 2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      278 "Worsened"                 2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      279 "No change"                2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      280 ""                         2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      281 "No change"                2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      282 "Improved"                 2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      283 "No change"                2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      284 "Worsened"                 2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      285 ""                         NA                     NA CYCLE 5 DAY 1       4
      286  <NA>                      2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      287  <NA>                      2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
      288  <NA>                      2021-04-12 22:43:53    86 CYCLE 5 DAY 1       4
          ANL01FL
          <fct>  
        1 <NA>   
        2 <NA>   
        3 <NA>   
        4 <NA>   
        5 <NA>   
        6 <NA>   
        7 <NA>   
        8 <NA>   
        9 <NA>   
       10 <NA>   
       11 <NA>   
       12 <NA>   
       13 <NA>   
       14 <NA>   
       15 <NA>   
       16 <NA>   
       17 <NA>   
       18 <NA>   
       19 <NA>   
       20 <NA>   
       21 <NA>   
       22 <NA>   
       23 <NA>   
       24 <NA>   
       25 <NA>   
       26 <NA>   
       27 <NA>   
       28 <NA>   
       29 <NA>   
       30 <NA>   
       31 <NA>   
       32 <NA>   
       33 <NA>   
       34 <NA>   
       35 <NA>   
       36 <NA>   
       37 <NA>   
       38 <NA>   
       39 <NA>   
       40 <NA>   
       41 <NA>   
       42 <NA>   
       43 <NA>   
       44 <NA>   
       45 <NA>   
       46 <NA>   
       47 Y      
       48 Y      
       49 Y      
       50 Y      
       51 Y      
       52 Y      
       53 Y      
       54 Y      
       55 Y      
       56 Y      
       57 Y      
       58 Y      
       59 Y      
       60 Y      
       61 Y      
       62 Y      
       63 Y      
       64 Y      
       65 Y      
       66 Y      
       67 Y      
       68 Y      
       69 Y      
       70 Y      
       71 Y      
       72 Y      
       73 Y      
       74 Y      
       75 Y      
       76 Y      
       77 Y      
       78 Y      
       79 Y      
       80 Y      
       81 Y      
       82 Y      
       83 Y      
       84 Y      
       85 Y      
       86 Y      
       87 Y      
       88 Y      
       89 Y      
       90 Y      
       91 Y      
       92 <NA>   
       93 Y      
       94 Y      
       95 Y      
       96 Y      
       97 Y      
       98 Y      
       99 Y      
      100 Y      
      101 Y      
      102 Y      
      103 Y      
      104 Y      
      105 Y      
      106 Y      
      107 Y      
      108 Y      
      109 Y      
      110 Y      
      111 Y      
      112 Y      
      113 Y      
      114 Y      
      115 Y      
      116 Y      
      117 Y      
      118 Y      
      119 Y      
      120 Y      
      121 Y      
      122 Y      
      123 Y      
      124 Y      
      125 Y      
      126 Y      
      127 Y      
      128 Y      
      129 Y      
      130 Y      
      131 Y      
      132 Y      
      133 Y      
      134 Y      
      135 Y      
      136 Y      
      137 Y      
      138 <NA>   
      139 Y      
      140 Y      
      141 Y      
      142 Y      
      143 Y      
      144 Y      
      145 Y      
      146 Y      
      147 Y      
      148 Y      
      149 Y      
      150 Y      
      151 Y      
      152 Y      
      153 Y      
      154 Y      
      155 Y      
      156 Y      
      157 Y      
      158 Y      
      159 Y      
      160 Y      
      161 Y      
      162 Y      
      163 Y      
      164 Y      
      165 Y      
      166 Y      
      167 Y      
      168 Y      
      169 Y      
      170 Y      
      171 Y      
      172 Y      
      173 Y      
      174 Y      
      175 Y      
      176 Y      
      177 Y      
      178 Y      
      179 Y      
      180 Y      
      181 Y      
      182 Y      
      183 Y      
      184 Y      
      185 Y      
      186 Y      
      187 <NA>   
      188 Y      
      189 Y      
      190 Y      
      191 Y      
      192 Y      
      193 Y      
      194 Y      
      195 Y      
      196 Y      
      197 Y      
      198 Y      
      199 Y      
      200 Y      
      201 Y      
      202 Y      
      203 Y      
      204 Y      
      205 Y      
      206 Y      
      207 Y      
      208 Y      
      209 Y      
      210 Y      
      211 Y      
      212 Y      
      213 Y      
      214 Y      
      215 Y      
      216 Y      
      217 Y      
      218 Y      
      219 Y      
      220 Y      
      221 Y      
      222 Y      
      223 Y      
      224 Y      
      225 Y      
      226 Y      
      227 Y      
      228 Y      
      229 Y      
      230 Y      
      231 Y      
      232 Y      
      233 Y      
      234 Y      
      235 Y      
      236 <NA>   
      237 Y      
      238 Y      
      239 Y      
      240 Y      
      241 Y      
      242 Y      
      243 Y      
      244 Y      
      245 Y      
      246 Y      
      247 Y      
      248 Y      
      249 Y      
      250 Y      
      251 Y      
      252 Y      
      253 Y      
      254 Y      
      255 Y      
      256 Y      
      257 Y      
      258 Y      
      259 Y      
      260 Y      
      261 Y      
      262 Y      
      263 Y      
      264 Y      
      265 Y      
      266 Y      
      267 Y      
      268 Y      
      269 Y      
      270 Y      
      271 Y      
      272 Y      
      273 Y      
      274 Y      
      275 Y      
      276 Y      
      277 Y      
      278 Y      
      279 Y      
      280 Y      
      281 Y      
      282 Y      
      283 Y      
      284 Y      
      285 <NA>   
      286 Y      
      287 Y      
      288 Y      

---

    Code
      rand_rows
    Output
      # A tibble: 10 x 50
         STUDYID USUBJID             SUBJID SITEID   AGE AGEU  SEX  
         <chr>   <chr>               <chr>  <chr>  <int> <fct> <fct>
       1 AB12345 AB12345-CHN-11-id-1 id-1   CHN-11    35 YEARS F    
       2 AB12345 AB12345-USA-13-id-3 id-3   USA-13    35 YEARS F    
       3 AB12345 AB12345-RUS-1-id-4  id-4   RUS-1     36 YEARS M    
       4 AB12345 AB12345-RUS-1-id-6  id-6   RUS-1     36 YEARS F    
       5 AB12345 AB12345-CHN-11-id-2 id-2   CHN-11    35 YEARS M    
       6 AB12345 AB12345-CHN-3-id-10 id-10  CHN-3     35 YEARS M    
       7 AB12345 AB12345-CHN-3-id-5  id-5   CHN-3     36 YEARS F    
       8 AB12345 AB12345-JPN-4-id-7  id-7   JPN-4     30 YEARS F    
       9 AB12345 AB12345-BRA-9-id-8  id-8   BRA-9     31 YEARS F    
      10 AB12345 AB12345-CHN-11-id-2 id-2   CHN-11    35 YEARS M    
         RACE                             ETHNIC                 COUNTRY
         <fct>                            <fct>                  <fct>  
       1 WHITE                            NOT HISPANIC OR LATINO CHN    
       2 AMERICAN INDIAN OR ALASKA NATIVE NOT HISPANIC OR LATINO USA    
       3 BLACK OR AFRICAN AMERICAN        NOT HISPANIC OR LATINO RUS    
       4 ASIAN                            NOT HISPANIC OR LATINO RUS    
       5 BLACK OR AFRICAN AMERICAN        NOT HISPANIC OR LATINO CHN    
       6 ASIAN                            NOT HISPANIC OR LATINO CHN    
       7 ASIAN                            NOT HISPANIC OR LATINO CHN    
       8 ASIAN                            NOT HISPANIC OR LATINO JPN    
       9 ASIAN                            NOT HISPANIC OR LATINO BRA    
      10 BLACK OR AFRICAN AMERICAN        NOT HISPANIC OR LATINO CHN    
         TRT01P         TRT01A         REGION1       ITTFL SAFFL TRTSDTM            
         <fct>          <fct>          <fct>         <fct> <fct> <dttm>             
       1 C: Combination C: Combination Asia          Y     Y     2020-05-02 02:28:45
       2 A: Drug X      A: Drug X      North America Y     Y     2019-10-17 17:56:02
       3 B: Placebo     B: Placebo     Eurasia       Y     Y     2020-08-28 20:42:09
       4 A: Drug X      A: Drug X      Eurasia       Y     Y     2020-10-26 22:16:26
       5 A: Drug X      A: Drug X      Asia          Y     Y     2020-02-26 18:15:59
       6 B: Placebo     B: Placebo     Asia          Y     Y     2019-03-28 12:07:16
       7 A: Drug X      A: Drug X      Asia          Y     Y     2020-06-27 04:48:00
       8 A: Drug X      A: Drug X      Asia          Y     Y     2019-09-22 02:25:18
       9 A: Drug X      A: Drug X      South America Y     Y     2020-01-21 10:19:08
      10 A: Drug X      A: Drug X      Asia          Y     Y     2020-02-26 18:15:59
         TRTEDTM             QSSEQ QSCAT              QSSCAT QSDTC              
         <dttm>              <int> <fct>              <fct>  <dttm>             
       1 2021-09-08 20:09:38    25 EORTC QLQ-C30 V3.0 <NA>   2020-04-25 02:28:45
       2 2022-10-17 11:56:02    NA <NA>               <NA>   NA                 
       3 2022-01-23 08:46:48    NA <NA>               <NA>   NA                 
       4 2023-10-27 16:16:26    NA EORTC QLQ-C30 V3.0 <NA>   NA                 
       5 NA                     27 EORTC QLQ-C30 V3.0 <NA>   2020-02-19 18:15:59
       6 2022-03-28 06:07:16    41 EORTC QLQ-C30 V3.0 <NA>   2019-03-28 12:07:16
       7 2023-06-27 22:48:00    13 EORTC QLQ-C30 V3.0 <NA>   2020-06-21 04:48:00
       8 2022-09-21 20:25:18    NA EORTC QLQ-C30 V3.0 <NA>   NA                 
       9 2021-10-16 19:37:36   133 EORTC QLQ-C30 V3.0 <NA>   2020-03-18 10:19:08
      10 NA                     NA <NA>               <NA>   NA                 
         QSSTAT   QSSTRESC QSSTRESU QSORRES     QSORRESU
         <fct>    <fct>    <fct>    <fct>       <fct>   
       1 <NA>     3        <NA>     QUITE A BIT <NA>    
       2 <NA>     <NA>     <NA>     <NA>        <NA>    
       3 <NA>     <NA>     <NA>     <NA>        <NA>    
       4 <NA>     <NA>     <NA>     <NA>        <NA>    
       5 <NA>     4        <NA>     VERY MUCH   <NA>    
       6 <NA>     3        <NA>     QUITE A BIT <NA>    
       7 <NA>     3        <NA>     QUITE A BIT <NA>    
       8 <NA>     <NA>     <NA>     <NA>        <NA>    
       9 NOT DONE <NA>     <NA>     <NA>        <NA>    
      10 <NA>     <NA>     <NA>     <NA>        <NA>    
         QSTEST                                  QSTESTCD QSREASND QSEVLINT
         <fct>                                   <fct>    <fct>    <fct>   
       1 EOR01-Had Difficulty Remembering Things EOR0125  <NA>     -P1W    
       2 <NA>                                    <NA>     <NA>     <NA>    
       3 <NA>                                    <NA>     <NA>     <NA>    
       4 EOR01-SS:Appetite Loss                  EOR0142  <NA>     <NA>    
       5 EOR01-Condition Interfered Social Activ EOR0127  <NA>     -P1W    
       6 EOR01-Have You Had Trouble Sleeping     EOR0111  <NA>     -P1W    
       7 EOR01-Have You Lacked Appetite          EOR0113  <NA>     -P1W    
       8 EOR01-FS:Emotional Functioning          EOR0134  <NA>     <NA>    
       9 EOR01-Have You Lacked Appetite          EOR0113  <NA>     -P1W    
      10 <NA>                                    <NA>     <NA>     <NA>    
         VISIT         VISITNUM  ASEQ
         <fct>            <int> <int>
       1 SCREENING           -1    25
       2 <NA>                NA    97
       3 <NA>                NA    94
       4 <NA>                NA   189
       5 SCREENING           -1    27
       6 CYCLE 1 DAY 1        0    60
       7 SCREENING           -1    13
       8 <NA>                NA   181
       9 CYCLE 4 DAY 1        3   200
      10 <NA>                NA    48
         PARAM                                                           PARAMCD 
         <fct>                                                           <fct>   
       1 EORTC QLQ-C30: Had difficulty remembering things                QS02825 
       2 EORTC QLQ-C30: Completion - Completed at least 80% of questions CO02880P
       3 EORTC QLQ-C30: Completion - Completed at least 80% of questions CO02880P
       4 EORTC QLQ-C30: Appetite loss                                    QS028AP 
       5 EORTC QLQ-C30: Interfered with your social activities           QS02827 
       6 EORTC QLQ-C30: Have you had trouble sleeping                    QS02811 
       7 EORTC QLQ-C30: Have you lacked appetite                         QS02813 
       8 EORTC QLQ-C30: Emotional functioning                            QS028EF 
       9 EORTC QLQ-C30: Have you lacked appetite                         QS02813 
      10 EORTC QLQ-C30: Completion - Completed at least 80% of questions CO02880P
         PARCAT1       PARCAT1N PARCAT2            AVAL
         <fct>            <dbl> <fct>             <dbl>
       1 EORTC QLQ-C30       28 Original Items      3  
       2 EORTC QLQ-C30       NA Completion          1  
       3 EORTC QLQ-C30       NA Completion          1  
       4 EORTC QLQ-C30       28 Symptom Scales    100  
       5 EORTC QLQ-C30       28 Original Items      4  
       6 EORTC QLQ-C30       28 Original Items      3  
       7 EORTC QLQ-C30       28 Original Items      3  
       8 EORTC QLQ-C30       28 Functional Scales  58.3
       9 EORTC QLQ-C30       28 Original Items     NA  
      10 EORTC QLQ-C30       NA Completion          1  
         AVALC                                BASE ABLFL   CHG  PCHG CHGCAT1  
         <fct>                               <dbl> <fct> <dbl> <dbl> <fct>    
       1 QUITE A BIT                          NA   ""    NA     NA   <NA>     
       2 Completed at least 80% of questions  NA   <NA>  NA     NA   <NA>     
       3 Completed at least 80% of questions  NA   <NA>  NA     NA   <NA>     
       4 100                                  33.3 ""    66.7  200   Worsened 
       5 VERY MUCH                            NA   ""    NA     NA   <NA>     
       6 QUITE A BIT                           3   "Y"    0      0   No change
       7 QUITE A BIT                          NA   ""    NA     NA   <NA>     
       8 58.3333333333333                     50   ""     8.33  16.7 No change
       9 <NA>                                  1   ""    NA     NA   <NA>     
      10 Completed at least 80% of questions  NA   <NA>  NA     NA   <NA>     
         ADTM                  ADY AVISIT        AVISITN ANL01FL
         <dttm>              <int> <fct>           <int> <fct>  
       1 2020-04-25 02:28:45    -7 SCREENING          -1 <NA>   
       2 2019-10-17 17:56:02     1 CYCLE 1 DAY 1       0 Y      
       3 2020-08-28 20:42:09     1 CYCLE 1 DAY 1       0 Y      
       4 2020-11-24 22:16:26    30 CYCLE 3 DAY 1       2 Y      
       5 2020-02-19 18:15:59    -7 SCREENING          -1 <NA>   
       6 2019-03-28 12:07:16     1 CYCLE 1 DAY 1       0 Y      
       7 2020-06-21 04:48:00    -6 SCREENING          -1 <NA>   
       8 2019-10-21 02:25:18    30 CYCLE 3 DAY 1       2 Y      
       9 2020-03-18 10:19:08    58 CYCLE 4 DAY 1       3 Y      
      10 2020-02-19 18:15:59    -7 SCREENING          -1 <NA>   

# radqs produces expected values

    Code
      first_pt_rows
    Output
      # A tibble: 35 x 73
         STUDYID USUBJID            SUBJID SITEID   AGE AGEU  SEX  
         <chr>   <chr>              <chr>  <chr>  <int> <fct> <fct>
       1 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       2 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       3 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       4 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       5 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       6 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       7 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       8 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       9 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      10 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      11 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      12 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      13 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      14 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      15 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      16 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      17 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      18 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      19 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      20 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      21 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      22 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      23 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      24 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      25 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      26 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      27 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      28 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      29 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      30 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      31 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      32 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      33 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      34 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      35 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
         RACE                      ETHNIC  COUNTRY DTHFL INVID        INVNAM       
         <fct>                     <fct>   <fct>   <fct> <chr>        <chr>        
       1 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       2 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       3 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       4 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       5 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       6 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       7 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       8 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       9 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      10 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      11 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      12 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      13 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      14 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      15 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      16 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      17 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      18 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      19 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      20 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      21 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      22 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      23 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      24 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      25 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      26 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      27 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      28 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      29 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      30 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      31 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      32 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      33 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      34 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      35 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
         ARM            ARMCD ACTARM         ACTARMCD TRT01P         TRT01A        
         <fct>          <fct> <fct>          <fct>    <fct>          <fct>         
       1 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       2 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       3 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       4 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       5 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       6 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       7 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       8 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       9 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      10 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      11 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      12 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      13 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      14 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      15 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      16 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      17 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      18 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      19 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      20 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      21 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      22 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      23 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      24 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      25 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      26 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      27 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      28 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      29 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      30 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      31 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      32 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      33 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      34 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      35 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
         TRT02P    TRT02A         REGION1       STRATA1 STRATA2 BMRKR1 BMRKR2 ITTFL
         <fct>     <fct>          <fct>         <fct>   <fct>    <dbl> <fct>  <fct>
       1 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       2 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       3 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       4 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       5 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       6 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       7 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       8 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       9 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      10 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      11 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      12 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      13 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      14 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      15 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      16 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      17 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      18 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      19 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      20 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      21 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      22 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      23 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      24 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      25 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      26 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      27 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      28 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      29 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      30 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      31 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      32 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      33 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      34 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      35 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
         SAFFL BMEASIFL BEP01FL AEWITHFL RANDDT     TRTSDTM            
         <fct> <fct>    <fct>   <fct>    <date>     <dttm>             
       1 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       2 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       3 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       4 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       5 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       6 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       7 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       8 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       9 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      10 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      11 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      12 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      13 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      14 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      15 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      16 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      17 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      18 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      19 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      20 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      21 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      22 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      23 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      24 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      25 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      26 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      27 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      28 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      29 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      30 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      31 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      32 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      33 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      34 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      35 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
         TRTEDTM             TRT01SDTM           TRT01EDTM          
         <dttm>              <dttm>              <dttm>             
       1 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       2 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       3 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       4 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       5 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       6 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       7 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       8 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       9 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      10 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      11 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      12 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      13 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      14 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      15 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      16 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      17 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      18 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      19 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      20 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      21 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      22 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      23 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      24 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      25 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      26 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      27 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      28 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      29 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      30 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      31 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      32 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      33 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      34 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      35 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
         TRT02SDTM           TRT02EDTM           AP01SDTM           
         <dttm>              <dttm>              <dttm>             
       1 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       2 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       3 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       4 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       5 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       6 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       7 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       8 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       9 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      10 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      11 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      12 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      13 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      14 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      15 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      16 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      17 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      18 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      19 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      20 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      21 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      22 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      23 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      24 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      25 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      26 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      27 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      28 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      29 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      30 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      31 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      32 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      33 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      34 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      35 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
         AP01EDTM            AP02SDTM            AP02EDTM            EOSSTT   
         <dttm>              <dttm>              <dttm>              <fct>    
       1 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       2 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       3 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       4 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       5 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       6 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       7 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       8 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       9 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      10 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      11 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      12 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      13 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      14 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      15 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      16 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      17 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      18 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      19 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      20 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      21 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      22 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      23 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      24 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      25 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      26 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      27 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      28 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      29 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      30 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      31 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      32 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      33 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      34 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      35 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
         EOTSTT    EOSDT      EOSDY DCSREAS DTHDT  DTHCAUS DTHCAT LDDTHELD LDDTHGR1
         <fct>     <date>     <int> <fct>   <date> <fct>   <fct>     <int> <fct>   
       1 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       2 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       3 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       4 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       5 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       6 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       7 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       8 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       9 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      10 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      11 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      12 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      13 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      14 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      15 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      16 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      17 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      18 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      19 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      20 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      21 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      22 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      23 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      24 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      25 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      26 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      27 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      28 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      29 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      30 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      31 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      32 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      33 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      34 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      35 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
         LSTALVDT   DTHADY ADTHAUT  ASEQ QSSEQ PARAM                              
         <date>      <int> <fct>   <int> <int> <fct>                              
       1 2024-02-10     NA <NA>        1     1 BFI All Questions                  
       2 2024-02-10     NA <NA>        6     6 BFI All Questions                  
       3 2024-02-10     NA <NA>       11    11 BFI All Questions                  
       4 2024-02-10     NA <NA>       16    16 BFI All Questions                  
       5 2024-02-10     NA <NA>       21    21 BFI All Questions                  
       6 2024-02-10     NA <NA>       26    26 BFI All Questions                  
       7 2024-02-10     NA <NA>       31    31 BFI All Questions                  
       8 2024-02-10     NA <NA>        2     2 Fatigue Interference               
       9 2024-02-10     NA <NA>        7     7 Fatigue Interference               
      10 2024-02-10     NA <NA>       12    12 Fatigue Interference               
      11 2024-02-10     NA <NA>       17    17 Fatigue Interference               
      12 2024-02-10     NA <NA>       22    22 Fatigue Interference               
      13 2024-02-10     NA <NA>       27    27 Fatigue Interference               
      14 2024-02-10     NA <NA>       32    32 Fatigue Interference               
      15 2024-02-10     NA <NA>        3     3 Function/Well-Being (GF1,GF3,GF7)  
      16 2024-02-10     NA <NA>        8     8 Function/Well-Being (GF1,GF3,GF7)  
      17 2024-02-10     NA <NA>       13    13 Function/Well-Being (GF1,GF3,GF7)  
      18 2024-02-10     NA <NA>       18    18 Function/Well-Being (GF1,GF3,GF7)  
      19 2024-02-10     NA <NA>       23    23 Function/Well-Being (GF1,GF3,GF7)  
      20 2024-02-10     NA <NA>       28    28 Function/Well-Being (GF1,GF3,GF7)  
      21 2024-02-10     NA <NA>       33    33 Function/Well-Being (GF1,GF3,GF7)  
      22 2024-02-10     NA <NA>        4     4 Treatment Side Effects (GP2,C5,GP5)
      23 2024-02-10     NA <NA>        9     9 Treatment Side Effects (GP2,C5,GP5)
      24 2024-02-10     NA <NA>       14    14 Treatment Side Effects (GP2,C5,GP5)
      25 2024-02-10     NA <NA>       19    19 Treatment Side Effects (GP2,C5,GP5)
      26 2024-02-10     NA <NA>       24    24 Treatment Side Effects (GP2,C5,GP5)
      27 2024-02-10     NA <NA>       29    29 Treatment Side Effects (GP2,C5,GP5)
      28 2024-02-10     NA <NA>       34    34 Treatment Side Effects (GP2,C5,GP5)
      29 2024-02-10     NA <NA>        5     5 FKSI-19 All Questions              
      30 2024-02-10     NA <NA>       10    10 FKSI-19 All Questions              
      31 2024-02-10     NA <NA>       15    15 FKSI-19 All Questions              
      32 2024-02-10     NA <NA>       20    20 FKSI-19 All Questions              
      33 2024-02-10     NA <NA>       25    25 FKSI-19 All Questions              
      34 2024-02-10     NA <NA>       30    30 FKSI-19 All Questions              
      35 2024-02-10     NA <NA>       35    35 FKSI-19 All Questions              
         PARAMCD   AVAL BASE2  BASE ABLFL2 ABLFL    CHG2  PCHG2     CHG   PCHG
         <fct>    <dbl> <dbl> <dbl> <fct>  <fct>   <dbl>  <dbl>   <dbl>  <dbl>
       1 BFIALL    42.9  42.9  NA   "Y"    ""      0       0     NA      NA   
       2 BFIALL    48.9  42.9  48.9 ""     "Y"     5.97   13.9    0       0   
       3 BFIALL    69.5  42.9  48.9 ""     ""     26.6    61.9   20.6    42.1 
       4 BFIALL    70.5  42.9  48.9 ""     ""     27.6    64.1   21.6    44.1 
       5 BFIALL    66.0  42.9  48.9 ""     ""     23.1    53.7   17.1    34.9 
       6 BFIALL    68.4  42.9  48.9 ""     ""     25.4    59.2   19.5    39.8 
       7 BFIALL    84.6  42.9  48.9 ""     ""     41.7    97.1   35.7    73.0 
       8 FATIGI    52.5  52.5  NA   "Y"    ""      0       0     NA      NA   
       9 FATIGI    67.4  52.5  67.4 ""     "Y"    14.9    28.4    0       0   
      10 FATIGI    55.7  52.5  67.4 ""     ""      3.27    6.23 -11.6   -17.3 
      11 FATIGI    66.4  52.5  67.4 ""     ""     13.9    26.6   -0.960  -1.43
      12 FATIGI    70.0  52.5  67.4 ""     ""     17.6    33.5    2.66    3.95
      13 FATIGI    60.5  52.5  67.4 ""     ""      8.03   15.3   -6.88  -10.2 
      14 FATIGI   101.   52.5  67.4 ""     ""     48.4    92.2   33.5    49.7 
      15 FKSI-FWB  44.8  44.8  NA   "Y"    ""      0       0     NA      NA   
      16 FKSI-FWB  45.3  44.8  45.3 ""     "Y"     0.467   1.04   0       0   
      17 FKSI-FWB  52.4  44.8  45.3 ""     ""      7.53   16.8    7.07   15.6 
      18 FKSI-FWB  70.2  44.8  45.3 ""     ""     25.4    56.7   25.0    55.1 
      19 FKSI-FWB  60.1  44.8  45.3 ""     ""     15.3    34.1   14.8    32.8 
      20 FKSI-FWB  88.3  44.8  45.3 ""     ""     43.4    96.9   43.0    94.9 
      21 FKSI-FWB  70.4  44.8  45.3 ""     ""     25.6    57.2   25.2    55.6 
      22 FKSI-TSE  52.7  52.7  NA   "Y"    ""      0       0     NA      NA   
      23 FKSI-TSE  52.1  52.7  52.1 ""     "Y"    -0.591  -1.12   0       0   
      24 FKSI-TSE  55.6  52.7  52.1 ""     ""      2.85    5.40   3.44    6.59
      25 FKSI-TSE  51.4  52.7  52.1 ""     ""     -1.36   -2.59  -0.774  -1.48
      26 FKSI-TSE  60.4  52.7  52.1 ""     ""      7.66   14.5    8.25   15.8 
      27 FKSI-TSE  82.5  52.7  52.1 ""     ""     29.8    56.5   30.4    58.3 
      28 FKSI-TSE  60.4  52.7  52.1 ""     ""      7.63   14.5    8.22   15.8 
      29 FKSIALL   50.3  50.3  NA   "Y"    ""      0       0     NA      NA   
      30 FKSIALL   46.2  50.3  46.2 ""     "Y"    -4.11   -8.16   0       0   
      31 FKSIALL   40.1  50.3  46.2 ""     ""    -10.2   -20.3   -6.08  -13.2 
      32 FKSIALL   58.5  50.3  46.2 ""     ""      8.20   16.3   12.3    26.6 
      33 FKSIALL   68.6  50.3  46.2 ""     ""     18.3    36.3   22.4    48.4 
      34 FKSIALL   65.5  50.3  46.2 ""     ""     15.2    30.2   19.3    41.8 
      35 FKSIALL   87.1  50.3  46.2 ""     ""     36.7    73.0   40.8    88.4 
         ADTM                  ADY AVISIT        AVISITN LOQFL
         <dttm>              <int> <fct>           <int> <fct>
       1 2021-04-16 22:43:53    89 SCREENING          -1 N    
       2 2021-08-01 22:43:53   196 BASELINE            0 N    
       3 2021-12-23 22:43:53   340 WEEK 1 DAY 8        1 N    
       4 2022-01-20 22:43:53   368 WEEK 2 DAY 15       2 N    
       5 2022-04-15 22:43:53   453 WEEK 3 DAY 22       3 N    
       6 2022-04-19 22:43:53   457 WEEK 4 DAY 29       4 N    
       7 2022-09-24 22:43:53   615 WEEK 5 DAY 36       5 N    
       8 2021-04-16 22:43:53    89 SCREENING          -1 N    
       9 2021-08-01 22:43:53   196 BASELINE            0 N    
      10 2021-12-23 22:43:53   340 WEEK 1 DAY 8        1 N    
      11 2022-01-20 22:43:53   368 WEEK 2 DAY 15       2 N    
      12 2022-04-15 22:43:53   453 WEEK 3 DAY 22       3 N    
      13 2022-04-19 22:43:53   457 WEEK 4 DAY 29       4 N    
      14 2022-09-24 22:43:53   615 WEEK 5 DAY 36       5 N    
      15 2021-04-16 22:43:53    89 SCREENING          -1 N    
      16 2021-08-01 22:43:53   196 BASELINE            0 N    
      17 2021-12-23 22:43:53   340 WEEK 1 DAY 8        1 N    
      18 2022-01-20 22:43:53   368 WEEK 2 DAY 15       2 N    
      19 2022-04-15 22:43:53   453 WEEK 3 DAY 22       3 N    
      20 2022-04-19 22:43:53   457 WEEK 4 DAY 29       4 N    
      21 2022-09-24 22:43:53   615 WEEK 5 DAY 36       5 N    
      22 2021-04-16 22:43:53    89 SCREENING          -1 N    
      23 2021-08-01 22:43:53   196 BASELINE            0 N    
      24 2021-12-23 22:43:53   340 WEEK 1 DAY 8        1 N    
      25 2022-01-20 22:43:53   368 WEEK 2 DAY 15       2 N    
      26 2022-04-15 22:43:53   453 WEEK 3 DAY 22       3 N    
      27 2022-04-19 22:43:53   457 WEEK 4 DAY 29       4 N    
      28 2022-09-24 22:43:53   615 WEEK 5 DAY 36       5 N    
      29 2021-04-16 22:43:53    89 SCREENING          -1 N    
      30 2021-08-01 22:43:53   196 BASELINE            0 N    
      31 2021-12-23 22:43:53   340 WEEK 1 DAY 8        1 N    
      32 2022-01-20 22:43:53   368 WEEK 2 DAY 15       2 N    
      33 2022-04-15 22:43:53   453 WEEK 3 DAY 22       3 N    
      34 2022-04-19 22:43:53   457 WEEK 4 DAY 29       4 N    
      35 2022-09-24 22:43:53   615 WEEK 5 DAY 36       5 N    

---

    Code
      rand_rows
    Output
      # A tibble: 10 x 73
         STUDYID USUBJID             SUBJID SITEID   AGE AGEU  SEX  
         <chr>   <chr>               <chr>  <chr>  <int> <fct> <fct>
       1 AB12345 AB12345-JPN-4-id-7  id-7   JPN-4     30 YEARS F    
       2 AB12345 AB12345-USA-13-id-3 id-3   USA-13    35 YEARS F    
       3 AB12345 AB12345-JPN-4-id-7  id-7   JPN-4     30 YEARS F    
       4 AB12345 AB12345-RUS-1-id-6  id-6   RUS-1     36 YEARS F    
       5 AB12345 AB12345-USA-13-id-3 id-3   USA-13    35 YEARS F    
       6 AB12345 AB12345-BRA-9-id-8  id-8   BRA-9     31 YEARS F    
       7 AB12345 AB12345-CHN-11-id-2 id-2   CHN-11    35 YEARS M    
       8 AB12345 AB12345-CHN-3-id-10 id-10  CHN-3     35 YEARS M    
       9 AB12345 AB12345-BRA-1-id-9  id-9   BRA-1     35 YEARS F    
      10 AB12345 AB12345-CHN-11-id-2 id-2   CHN-11    35 YEARS M    
         RACE                             ETHNIC                 COUNTRY DTHFL
         <fct>                            <fct>                  <fct>   <fct>
       1 ASIAN                            NOT HISPANIC OR LATINO JPN     N    
       2 AMERICAN INDIAN OR ALASKA NATIVE NOT HISPANIC OR LATINO USA     N    
       3 ASIAN                            NOT HISPANIC OR LATINO JPN     N    
       4 ASIAN                            NOT HISPANIC OR LATINO RUS     N    
       5 AMERICAN INDIAN OR ALASKA NATIVE NOT HISPANIC OR LATINO USA     N    
       6 ASIAN                            NOT HISPANIC OR LATINO BRA     Y    
       7 BLACK OR AFRICAN AMERICAN        NOT HISPANIC OR LATINO CHN     N    
       8 ASIAN                            NOT HISPANIC OR LATINO CHN     N    
       9 BLACK OR AFRICAN AMERICAN        UNKNOWN                BRA     N    
      10 BLACK OR AFRICAN AMERICAN        NOT HISPANIC OR LATINO CHN     N    
         INVID         INVNAM         ARM            ARMCD ACTARM         ACTARMCD
         <chr>         <chr>          <fct>          <fct> <fct>          <fct>   
       1 INV ID JPN-4  Dr. JPN-4 Doe  A: Drug X      ARM A A: Drug X      ARM A   
       2 INV ID USA-13 Dr. USA-13 Doe A: Drug X      ARM A A: Drug X      ARM A   
       3 INV ID JPN-4  Dr. JPN-4 Doe  A: Drug X      ARM A A: Drug X      ARM A   
       4 INV ID RUS-1  Dr. RUS-1 Doe  A: Drug X      ARM A A: Drug X      ARM A   
       5 INV ID USA-13 Dr. USA-13 Doe A: Drug X      ARM A A: Drug X      ARM A   
       6 INV ID BRA-9  Dr. BRA-9 Doe  A: Drug X      ARM A A: Drug X      ARM A   
       7 INV ID CHN-11 Dr. CHN-11 Doe A: Drug X      ARM A A: Drug X      ARM A   
       8 INV ID CHN-3  Dr. CHN-3 Doe  B: Placebo     ARM B B: Placebo     ARM B   
       9 INV ID BRA-1  Dr. BRA-1 Doe  C: Combination ARM C C: Combination ARM C   
      10 INV ID CHN-11 Dr. CHN-11 Doe A: Drug X      ARM A A: Drug X      ARM A   
         TRT01P         TRT01A         TRT02P         TRT02A         REGION1      
         <fct>          <fct>          <fct>          <fct>          <fct>        
       1 A: Drug X      A: Drug X      C: Combination B: Placebo     Asia         
       2 A: Drug X      A: Drug X      B: Placebo     A: Drug X      North America
       3 A: Drug X      A: Drug X      C: Combination B: Placebo     Asia         
       4 A: Drug X      A: Drug X      C: Combination A: Drug X      Eurasia      
       5 A: Drug X      A: Drug X      B: Placebo     A: Drug X      North America
       6 A: Drug X      A: Drug X      A: Drug X      A: Drug X      South America
       7 A: Drug X      A: Drug X      A: Drug X      A: Drug X      Asia         
       8 B: Placebo     B: Placebo     A: Drug X      A: Drug X      Asia         
       9 C: Combination C: Combination A: Drug X      C: Combination South America
      10 A: Drug X      A: Drug X      A: Drug X      A: Drug X      Asia         
         STRATA1 STRATA2 BMRKR1 BMRKR2 ITTFL SAFFL BMEASIFL BEP01FL AEWITHFL
         <fct>   <fct>    <dbl> <fct>  <fct> <fct> <fct>    <fct>   <fct>   
       1 B       S1        7.46 MEDIUM Y     Y     Y        N       N       
       2 C       S1        7.25 LOW    Y     Y     Y        N       N       
       3 B       S1        7.46 MEDIUM Y     Y     Y        N       N       
       4 B       S1        9.34 MEDIUM Y     Y     N        N       N       
       5 C       S1        7.25 LOW    Y     Y     Y        N       N       
       6 B       S2       11.3  MEDIUM Y     Y     Y        Y       N       
       7 C       S2        4.08 HIGH   Y     Y     Y        Y       N       
       8 A       S1        1.78 LOW    Y     Y     N        Y       N       
       9 A       S1        6.92 HIGH   Y     Y     Y        N       N       
      10 C       S2        4.08 HIGH   Y     Y     Y        Y       N       
         RANDDT     TRTSDTM             TRTEDTM             TRT01SDTM          
         <date>     <dttm>              <dttm>              <dttm>             
       1 2019-09-22 2019-09-22 02:25:18 2022-09-21 20:25:18 2019-09-22 02:25:18
       2 2019-10-16 2019-10-17 17:56:02 2022-10-17 11:56:02 2019-10-17 17:56:02
       3 2019-09-22 2019-09-22 02:25:18 2022-09-21 20:25:18 2019-09-22 02:25:18
       4 2020-10-24 2020-10-26 22:16:26 2023-10-27 16:16:26 2020-10-26 22:16:26
       5 2019-10-16 2019-10-17 17:56:02 2022-10-17 11:56:02 2019-10-17 17:56:02
       6 2020-01-18 2020-01-21 10:19:08 2021-10-16 19:37:36 2020-01-21 10:19:08
       7 2020-02-23 2020-02-26 18:15:59 NA                  2020-02-26 18:15:59
       8 2019-03-24 2019-03-28 12:07:16 2022-03-28 06:07:16 2019-03-28 12:07:16
       9 2021-01-17 2021-01-17 22:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      10 2020-02-23 2020-02-26 18:15:59 NA                  2020-02-26 18:15:59
         TRT01EDTM           TRT02SDTM           TRT02EDTM          
         <dttm>              <dttm>              <dttm>             
       1 2021-09-21 14:25:18 2021-09-21 14:25:18 2022-09-21 20:25:18
       2 2021-10-17 05:56:02 2021-10-17 05:56:02 2022-10-17 11:56:02
       3 2021-09-21 14:25:18 2021-09-21 14:25:18 2022-09-21 20:25:18
       4 2022-10-27 10:16:26 2022-10-27 10:16:26 2023-10-27 16:16:26
       5 2021-10-17 05:56:02 2021-10-17 05:56:02 2022-10-17 11:56:02
       6 2020-10-16 13:37:36 2020-10-16 13:37:36 2021-10-16 19:37:36
       7 NA                  NA                  NA                 
       8 2021-03-28 00:07:16 2021-03-28 00:07:16 2022-03-28 06:07:16
       9 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53
      10 NA                  NA                  NA                 
         AP01SDTM            AP01EDTM            AP02SDTM           
         <dttm>              <dttm>              <dttm>             
       1 2019-09-22 02:25:18 2021-09-21 14:25:18 2021-09-21 14:25:18
       2 2019-10-17 17:56:02 2021-10-17 05:56:02 2021-10-17 05:56:02
       3 2019-09-22 02:25:18 2021-09-21 14:25:18 2021-09-21 14:25:18
       4 2020-10-26 22:16:26 2022-10-27 10:16:26 2022-10-27 10:16:26
       5 2019-10-17 17:56:02 2021-10-17 05:56:02 2021-10-17 05:56:02
       6 2020-01-21 10:19:08 2020-10-16 13:37:36 2020-10-16 13:37:36
       7 2020-02-26 18:15:59 NA                  NA                 
       8 2019-03-28 12:07:16 2021-03-28 00:07:16 2021-03-28 00:07:16
       9 2021-01-17 22:43:53 2023-01-18 10:43:53 2023-01-18 10:43:53
      10 2020-02-26 18:15:59 NA                  NA                 
         AP02EDTM            EOSSTT       EOTSTT       EOSDT      EOSDY DCSREAS
         <dttm>              <fct>        <fct>        <date>     <int> <fct>  
       1 2022-09-21 20:25:18 COMPLETED    COMPLETED    2022-09-21  1096 <NA>   
       2 2022-10-17 11:56:02 COMPLETED    COMPLETED    2022-10-17  1096 <NA>   
       3 2022-09-21 20:25:18 COMPLETED    COMPLETED    2022-09-21  1096 <NA>   
       4 2023-10-27 16:16:26 COMPLETED    COMPLETED    2023-10-27  1096 <NA>   
       5 2022-10-17 11:56:02 COMPLETED    COMPLETED    2022-10-17  1096 <NA>   
       6 2021-10-16 19:37:36 DISCONTINUED DISCONTINUED 2021-10-16   635 DEATH  
       7 NA                  ONGOING      ONGOING      NA            NA <NA>   
       8 2022-03-28 06:07:16 COMPLETED    COMPLETED    2022-03-28  1096 <NA>   
       9 2024-01-18 16:43:53 COMPLETED    COMPLETED    2024-01-18  1096 <NA>   
      10 NA                  ONGOING      ONGOING      NA            NA <NA>   
         DTHDT      DTHCAUS             DTHCAT              LDDTHELD LDDTHGR1
         <date>     <fct>               <fct>                  <int> <fct>   
       1 NA         <NA>                <NA>                      NA <NA>    
       2 NA         <NA>                <NA>                      NA <NA>    
       3 NA         <NA>                <NA>                      NA <NA>    
       4 NA         <NA>                <NA>                      NA <NA>    
       5 NA         <NA>                <NA>                      NA <NA>    
       6 2021-11-23 DISEASE PROGRESSION PROGRESSIVE DISEASE       38 >30     
       7 NA         <NA>                <NA>                      NA <NA>    
       8 NA         <NA>                <NA>                      NA <NA>    
       9 NA         <NA>                <NA>                      NA <NA>    
      10 NA         <NA>                <NA>                      NA <NA>    
         LSTALVDT   DTHADY ADTHAUT  ASEQ QSSEQ PARAM                              
         <date>      <int> <fct>   <int> <int> <fct>                              
       1 2022-10-09     NA <NA>       12    12 Fatigue Interference               
       2 2022-10-30     NA <NA>        5     5 FKSI-19 All Questions              
       3 2022-10-09     NA <NA>        2     2 Fatigue Interference               
       4 2023-11-13     NA <NA>       27    27 Fatigue Interference               
       5 2022-10-30     NA <NA>       30    30 FKSI-19 All Questions              
       6 2021-11-23    671 Yes        21    21 BFI All Questions                  
       7 NA             NA <NA>        6     6 BFI All Questions                  
       8 2022-04-14     NA <NA>       24    24 Treatment Side Effects (GP2,C5,GP5)
       9 2024-02-10     NA <NA>        5     5 FKSI-19 All Questions              
      10 NA             NA <NA>       26    26 BFI All Questions                  
         PARAMCD   AVAL BASE2  BASE ABLFL2 ABLFL  CHG2  PCHG2   CHG  PCHG
         <fct>    <dbl> <dbl> <dbl> <fct>  <fct> <dbl>  <dbl> <dbl> <dbl>
       1 FATIGI    55.6  45.5  49.7 ""     ""    10.1   22.3   5.95 12.0 
       2 FKSIALL   48.4  48.4  NA   "Y"    ""     0      0    NA    NA   
       3 FATIGI    45.5  45.5  NA   "Y"    ""     0      0    NA    NA   
       4 FATIGI    65.4  52.7  51.2 ""     ""    12.7   24.0  14.1  27.6 
       5 FKSIALL   77.7  48.4  59.3 ""     ""    29.3   60.5  18.4  31.0 
       6 BFIALL    60.0  58.1  41.0 ""     ""     1.83   3.16 19.0  46.4 
       7 BFIALL    61.5  44.5  61.5 ""     "Y"   17.0   38.2   0     0   
       8 FKSI-TSE  48.9  54.3  45.5 ""     ""    -5.49 -10.1   3.40  7.49
       9 FKSIALL   50.3  50.3  NA   "Y"    ""     0      0    NA    NA   
      10 BFIALL    74.5  44.5  61.5 ""     ""    30.0   67.4  13.0  21.2 
         ADTM                  ADY AVISIT        AVISITN LOQFL
         <dttm>              <int> <fct>           <int> <fct>
       1 2021-02-06 02:25:18   503 WEEK 1 DAY 8        1 N    
       2 2020-08-16 17:56:02   304 SCREENING          -1 N    
       3 2020-02-25 02:25:18   156 SCREENING          -1 N    
       4 2022-11-10 22:16:26   745 WEEK 4 DAY 29       4 N    
       5 2022-01-10 17:56:02   816 WEEK 4 DAY 29       4 N    
       6 2021-05-03 10:19:08   468 WEEK 3 DAY 22       3 N    
       7 2020-03-10 18:15:59    13 BASELINE            0 N    
       8 2020-10-27 12:07:16   579 WEEK 3 DAY 22       3 N    
       9 2021-04-16 22:43:53    89 SCREENING          -1 N    
      10 2021-12-06 18:15:59   649 WEEK 4 DAY 29       4 N    

# radrs produces expected values

    Code
      first_pt_rows
    Output
      # A tibble: 8 x 65
        STUDYID USUBJID            SUBJID SITEID   AGE AGEU  SEX  
        <chr>   <chr>              <chr>  <chr>  <int> <fct> <fct>
      1 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      2 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      3 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      4 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      5 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      6 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      7 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      8 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
        RACE                      ETHNIC  COUNTRY DTHFL INVID        INVNAM       
        <fct>                     <fct>   <fct>   <fct> <chr>        <chr>        
      1 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      2 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      3 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      4 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      5 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      6 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      7 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      8 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
        ARM            ARMCD ACTARM         ACTARMCD TRT01P         TRT01A        
        <fct>          <fct> <fct>          <fct>    <fct>          <fct>         
      1 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      2 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      3 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      4 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      5 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      6 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      7 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      8 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
        TRT02P    TRT02A         REGION1       STRATA1 STRATA2 BMRKR1 BMRKR2 ITTFL
        <fct>     <fct>          <fct>         <fct>   <fct>    <dbl> <fct>  <fct>
      1 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      2 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      3 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      4 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      5 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      6 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      7 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      8 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
        SAFFL BMEASIFL BEP01FL AEWITHFL RANDDT     TRTSDTM            
        <fct> <fct>    <fct>   <fct>    <date>     <dttm>             
      1 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      2 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      3 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      4 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      5 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      6 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      7 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      8 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
        TRTEDTM             TRT01SDTM           TRT01EDTM          
        <dttm>              <dttm>              <dttm>             
      1 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      2 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      3 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      4 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      5 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      6 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      7 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      8 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
        TRT02SDTM           TRT02EDTM           AP01SDTM           
        <dttm>              <dttm>              <dttm>             
      1 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      2 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      3 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      4 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      5 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      6 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      7 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      8 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
        AP01EDTM            AP02SDTM            AP02EDTM            EOSSTT   
        <dttm>              <dttm>              <dttm>              <fct>    
      1 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      2 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      3 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      4 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      5 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      6 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      7 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      8 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
        EOTSTT    EOSDT      EOSDY DCSREAS DTHDT  DTHCAUS DTHCAT LDDTHELD LDDTHGR1
        <fct>     <date>     <int> <fct>   <date> <fct>   <fct>     <int> <fct>   
      1 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      2 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      3 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      4 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      5 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      6 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      7 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      8 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
        LSTALVDT   DTHADY ADTHAUT  ASEQ RSSEQ
        <date>      <int> <fct>   <int> <int>
      1 2024-02-10     NA <NA>        3     3
      2 2024-02-10     NA <NA>        6     6
      3 2024-02-10     NA <NA>        8     8
      4 2024-02-10     NA <NA>        1     1
      5 2024-02-10     NA <NA>        2     2
      6 2024-02-10     NA <NA>        4     4
      7 2024-02-10     NA <NA>        5     5
      8 2024-02-10     NA <NA>        7     7
        PARAM                                           PARAMCD  AVAL AVALC
        <fct>                                           <fct>   <int> <fct>
      1 Best Confirmed Overall Response by Investigator BESRSPI     1 CR   
      2 Investigator End Of Induction Response          INVET       1 CR   
      3 Overall Response by Investigator - by visit     OVRINV      3 SD   
      4 Overall Response by Investigator - by visit     OVRINV      3 SD   
      5 Overall Response by Investigator - by visit     OVRINV      2 PR   
      6 Overall Response by Investigator - by visit     OVRINV      3 SD   
      7 Overall Response by Investigator - by visit     OVRINV      1 CR   
      8 Overall Response by Investigator - by visit     OVRINV      3 SD   
        ADTM                  ADY AVISIT           AVISITN
        <dttm>              <int> <fct>              <int>
      1 2021-10-13 00:00:00   269 CYCLE 2 DAY 1          2
      2 2021-11-11 00:00:00   298 END OF INDUCTION     999
      3 2020-10-09 00:00:00  -100 SCREENING             -1
      4 2021-01-17 00:00:00     0 BASELINE               0
      5 2021-10-13 00:00:00   269 CYCLE 2 DAY 1          2
      6 2021-12-12 00:00:00   329 CYCLE 4 DAY 1          4
      7 2021-11-11 00:00:00   298 END OF INDUCTION     999
      8 2022-05-02 00:00:00   470 FOLLOW UP            999

---

    Code
      rand_rows
    Output
      # A tibble: 10 x 65
         STUDYID USUBJID             SUBJID SITEID   AGE AGEU  SEX  
         <chr>   <chr>               <chr>  <chr>  <int> <fct> <fct>
       1 AB12345 AB12345-CHN-11-id-1 id-1   CHN-11    35 YEARS F    
       2 AB12345 AB12345-USA-13-id-3 id-3   USA-13    35 YEARS F    
       3 AB12345 AB12345-CHN-3-id-5  id-5   CHN-3     36 YEARS F    
       4 AB12345 AB12345-RUS-1-id-4  id-4   RUS-1     36 YEARS M    
       5 AB12345 AB12345-RUS-1-id-4  id-4   RUS-1     36 YEARS M    
       6 AB12345 AB12345-JPN-4-id-7  id-7   JPN-4     30 YEARS F    
       7 AB12345 AB12345-CHN-3-id-10 id-10  CHN-3     35 YEARS M    
       8 AB12345 AB12345-BRA-9-id-8  id-8   BRA-9     31 YEARS F    
       9 AB12345 AB12345-BRA-1-id-9  id-9   BRA-1     35 YEARS F    
      10 AB12345 AB12345-CHN-3-id-5  id-5   CHN-3     36 YEARS F    
         RACE                             ETHNIC                 COUNTRY DTHFL
         <fct>                            <fct>                  <fct>   <fct>
       1 WHITE                            NOT HISPANIC OR LATINO CHN     Y    
       2 AMERICAN INDIAN OR ALASKA NATIVE NOT HISPANIC OR LATINO USA     N    
       3 ASIAN                            NOT HISPANIC OR LATINO CHN     N    
       4 BLACK OR AFRICAN AMERICAN        NOT HISPANIC OR LATINO RUS     N    
       5 BLACK OR AFRICAN AMERICAN        NOT HISPANIC OR LATINO RUS     N    
       6 ASIAN                            NOT HISPANIC OR LATINO JPN     N    
       7 ASIAN                            NOT HISPANIC OR LATINO CHN     N    
       8 ASIAN                            NOT HISPANIC OR LATINO BRA     Y    
       9 BLACK OR AFRICAN AMERICAN        UNKNOWN                BRA     N    
      10 ASIAN                            NOT HISPANIC OR LATINO CHN     N    
         INVID         INVNAM         ARM            ARMCD ACTARM         ACTARMCD
         <chr>         <chr>          <fct>          <fct> <fct>          <fct>   
       1 INV ID CHN-11 Dr. CHN-11 Doe C: Combination ARM C C: Combination ARM C   
       2 INV ID USA-13 Dr. USA-13 Doe A: Drug X      ARM A A: Drug X      ARM A   
       3 INV ID CHN-3  Dr. CHN-3 Doe  A: Drug X      ARM A A: Drug X      ARM A   
       4 INV ID RUS-1  Dr. RUS-1 Doe  B: Placebo     ARM B B: Placebo     ARM B   
       5 INV ID RUS-1  Dr. RUS-1 Doe  B: Placebo     ARM B B: Placebo     ARM B   
       6 INV ID JPN-4  Dr. JPN-4 Doe  A: Drug X      ARM A A: Drug X      ARM A   
       7 INV ID CHN-3  Dr. CHN-3 Doe  B: Placebo     ARM B B: Placebo     ARM B   
       8 INV ID BRA-9  Dr. BRA-9 Doe  A: Drug X      ARM A A: Drug X      ARM A   
       9 INV ID BRA-1  Dr. BRA-1 Doe  C: Combination ARM C C: Combination ARM C   
      10 INV ID CHN-3  Dr. CHN-3 Doe  A: Drug X      ARM A A: Drug X      ARM A   
         TRT01P         TRT01A         TRT02P         TRT02A         REGION1      
         <fct>          <fct>          <fct>          <fct>          <fct>        
       1 C: Combination C: Combination B: Placebo     B: Placebo     Asia         
       2 A: Drug X      A: Drug X      B: Placebo     A: Drug X      North America
       3 A: Drug X      A: Drug X      A: Drug X      C: Combination Asia         
       4 B: Placebo     B: Placebo     A: Drug X      A: Drug X      Eurasia      
       5 B: Placebo     B: Placebo     A: Drug X      A: Drug X      Eurasia      
       6 A: Drug X      A: Drug X      C: Combination B: Placebo     Asia         
       7 B: Placebo     B: Placebo     A: Drug X      A: Drug X      Asia         
       8 A: Drug X      A: Drug X      A: Drug X      A: Drug X      South America
       9 C: Combination C: Combination A: Drug X      C: Combination South America
      10 A: Drug X      A: Drug X      A: Drug X      C: Combination Asia         
         STRATA1 STRATA2 BMRKR1 BMRKR2 ITTFL SAFFL BMEASIFL BEP01FL AEWITHFL
         <fct>   <fct>    <dbl> <fct>  <fct> <fct> <fct>    <fct>   <fct>   
       1 B       S1        8.93 LOW    Y     Y     N        N       N       
       2 C       S1        7.25 LOW    Y     Y     Y        N       N       
       3 A       S2        2.62 LOW    Y     Y     Y        N       N       
       4 A       S1        9.95 MEDIUM Y     Y     Y        N       N       
       5 A       S1        9.95 MEDIUM Y     Y     Y        N       N       
       6 B       S1        7.46 MEDIUM Y     Y     Y        N       N       
       7 A       S1        1.78 LOW    Y     Y     N        Y       N       
       8 B       S2       11.3  MEDIUM Y     Y     Y        Y       N       
       9 A       S1        6.92 HIGH   Y     Y     Y        N       N       
      10 A       S2        2.62 LOW    Y     Y     Y        N       N       
         RANDDT     TRTSDTM             TRTEDTM             TRT01SDTM          
         <date>     <dttm>              <dttm>              <dttm>             
       1 2020-04-29 2020-05-02 02:28:45 2021-09-08 20:09:38 2020-05-02 02:28:45
       2 2019-10-16 2019-10-17 17:56:02 2022-10-17 11:56:02 2019-10-17 17:56:02
       3 2020-06-24 2020-06-27 04:48:00 2023-06-27 22:48:00 2020-06-27 04:48:00
       4 2020-08-27 2020-08-28 20:42:09 2022-01-23 08:46:48 2020-08-28 20:42:09
       5 2020-08-27 2020-08-28 20:42:09 2022-01-23 08:46:48 2020-08-28 20:42:09
       6 2019-09-22 2019-09-22 02:25:18 2022-09-21 20:25:18 2019-09-22 02:25:18
       7 2019-03-24 2019-03-28 12:07:16 2022-03-28 06:07:16 2019-03-28 12:07:16
       8 2020-01-18 2020-01-21 10:19:08 2021-10-16 19:37:36 2020-01-21 10:19:08
       9 2021-01-17 2021-01-17 22:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      10 2020-06-24 2020-06-27 04:48:00 2023-06-27 22:48:00 2020-06-27 04:48:00
         TRT01EDTM           TRT02SDTM           TRT02EDTM          
         <dttm>              <dttm>              <dttm>             
       1 2020-09-08 14:09:38 2020-09-08 14:09:38 2021-09-08 20:09:38
       2 2021-10-17 05:56:02 2021-10-17 05:56:02 2022-10-17 11:56:02
       3 2022-06-27 16:48:00 2022-06-27 16:48:00 2023-06-27 22:48:00
       4 2021-01-23 02:46:48 2021-01-23 02:46:48 2022-01-23 08:46:48
       5 2021-01-23 02:46:48 2021-01-23 02:46:48 2022-01-23 08:46:48
       6 2021-09-21 14:25:18 2021-09-21 14:25:18 2022-09-21 20:25:18
       7 2021-03-28 00:07:16 2021-03-28 00:07:16 2022-03-28 06:07:16
       8 2020-10-16 13:37:36 2020-10-16 13:37:36 2021-10-16 19:37:36
       9 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53
      10 2022-06-27 16:48:00 2022-06-27 16:48:00 2023-06-27 22:48:00
         AP01SDTM            AP01EDTM            AP02SDTM           
         <dttm>              <dttm>              <dttm>             
       1 2020-05-02 02:28:45 2020-09-08 14:09:38 2020-09-08 14:09:38
       2 2019-10-17 17:56:02 2021-10-17 05:56:02 2021-10-17 05:56:02
       3 2020-06-27 04:48:00 2022-06-27 16:48:00 2022-06-27 16:48:00
       4 2020-08-28 20:42:09 2021-01-23 02:46:48 2021-01-23 02:46:48
       5 2020-08-28 20:42:09 2021-01-23 02:46:48 2021-01-23 02:46:48
       6 2019-09-22 02:25:18 2021-09-21 14:25:18 2021-09-21 14:25:18
       7 2019-03-28 12:07:16 2021-03-28 00:07:16 2021-03-28 00:07:16
       8 2020-01-21 10:19:08 2020-10-16 13:37:36 2020-10-16 13:37:36
       9 2021-01-17 22:43:53 2023-01-18 10:43:53 2023-01-18 10:43:53
      10 2020-06-27 04:48:00 2022-06-27 16:48:00 2022-06-27 16:48:00
         AP02EDTM            EOSSTT       EOTSTT       EOSDT      EOSDY DCSREAS      
         <dttm>              <fct>        <fct>        <date>     <int> <fct>        
       1 2021-09-08 20:09:38 DISCONTINUED DISCONTINUED 2021-09-08   495 DEATH        
       2 2022-10-17 11:56:02 COMPLETED    COMPLETED    2022-10-17  1096 <NA>         
       3 2023-06-27 22:48:00 COMPLETED    COMPLETED    2023-06-27  1096 <NA>         
       4 2022-01-23 08:46:48 DISCONTINUED DISCONTINUED 2022-01-23   513 ADVERSE EVENT
       5 2022-01-23 08:46:48 DISCONTINUED DISCONTINUED 2022-01-23   513 ADVERSE EVENT
       6 2022-09-21 20:25:18 COMPLETED    COMPLETED    2022-09-21  1096 <NA>         
       7 2022-03-28 06:07:16 COMPLETED    COMPLETED    2022-03-28  1096 <NA>         
       8 2021-10-16 19:37:36 DISCONTINUED DISCONTINUED 2021-10-16   635 DEATH        
       9 2024-01-18 16:43:53 COMPLETED    COMPLETED    2024-01-18  1096 <NA>         
      10 2023-06-27 22:48:00 COMPLETED    COMPLETED    2023-06-27  1096 <NA>         
         DTHDT      DTHCAUS             DTHCAT              LDDTHELD LDDTHGR1
         <date>     <fct>               <fct>                  <int> <fct>   
       1 2021-09-27 ADVERSE EVENT       ADVERSE EVENT             19 <=30    
       2 NA         <NA>                <NA>                      NA <NA>    
       3 NA         <NA>                <NA>                      NA <NA>    
       4 NA         <NA>                <NA>                      NA <NA>    
       5 NA         <NA>                <NA>                      NA <NA>    
       6 NA         <NA>                <NA>                      NA <NA>    
       7 NA         <NA>                <NA>                      NA <NA>    
       8 2021-11-23 DISEASE PROGRESSION PROGRESSIVE DISEASE       38 >30     
       9 NA         <NA>                <NA>                      NA <NA>    
      10 NA         <NA>                <NA>                      NA <NA>    
         LSTALVDT   DTHADY ADTHAUT  ASEQ RSSEQ
         <date>      <int> <fct>   <int> <int>
       1 2021-09-27    512 Yes         3     3
       2 2022-10-30     NA <NA>        3     3
       3 2023-07-10     NA <NA>        5     5
       4 2022-02-12     NA <NA>        5     5
       5 2022-02-12     NA <NA>        1     1
       6 2022-10-09     NA <NA>        8     8
       7 2022-04-14     NA <NA>        5     5
       8 2021-11-23    671 Yes         6     6
       9 2024-02-10     NA <NA>        3     3
      10 2023-07-10     NA <NA>        8     8
         PARAM                                           PARAMCD  AVAL AVALC
         <fct>                                           <fct>   <int> <fct>
       1 Best Confirmed Overall Response by Investigator BESRSPI     1 CR   
       2 Best Confirmed Overall Response by Investigator BESRSPI     1 CR   
       3 Overall Response by Investigator - by visit     OVRINV      1 CR   
       4 Overall Response by Investigator - by visit     OVRINV      2 PR   
       5 Overall Response by Investigator - by visit     OVRINV      3 SD   
       6 Overall Response by Investigator - by visit     OVRINV      3 SD   
       7 Investigator End Of Induction Response          INVET       4 PD   
       8 Investigator End Of Induction Response          INVET       1 CR   
       9 Best Confirmed Overall Response by Investigator BESRSPI     1 CR   
      10 Overall Response by Investigator - by visit     OVRINV      3 SD   
         ADTM                  ADY AVISIT           AVISITN
         <dttm>              <int> <fct>              <int>
       1 2021-04-28 00:00:00   361 CYCLE 2 DAY 1          2
       2 2021-06-21 00:00:00   613 CYCLE 2 DAY 1          2
       3 2021-07-09 00:00:00   377 END OF INDUCTION     999
       4 2022-01-01 00:00:00   491 END OF INDUCTION     999
       5 2020-08-28 00:00:00     0 BASELINE               0
       6 2019-06-14 00:00:00  -100 SCREENING             -1
       7 2021-09-01 00:00:00   888 END OF INDUCTION     999
       8 2020-12-15 00:00:00   329 END OF INDUCTION     999
       9 2021-10-13 00:00:00   269 CYCLE 2 DAY 1          2
      10 2020-03-19 00:00:00  -100 SCREENING             -1

# radsaftte produces expected values

    Code
      first_pt_rows
    Output
      # A tibble: 9 x 66
        STUDYID USUBJID            SUBJID SITEID   AGE AGEU  SEX  
        <chr>   <chr>              <chr>  <chr>  <int> <fct> <fct>
      1 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      2 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      3 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      4 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      5 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      6 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      7 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      8 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      9 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
        RACE                      ETHNIC  COUNTRY DTHFL INVID        INVNAM       
        <fct>                     <fct>   <fct>   <fct> <chr>        <chr>        
      1 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      2 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      3 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      4 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      5 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      6 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      7 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      8 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      9 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
        ARM            ARMCD ACTARM         ACTARMCD TRT01P         TRT01A        
        <fct>          <fct> <fct>          <fct>    <fct>          <fct>         
      1 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      2 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      3 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      4 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      5 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      6 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      7 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      8 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      9 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
        TRT02P    TRT02A         REGION1       STRATA1 STRATA2 BMRKR1 BMRKR2 ITTFL
        <fct>     <fct>          <fct>         <fct>   <fct>    <dbl> <fct>  <fct>
      1 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      2 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      3 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      4 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      5 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      6 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      7 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      8 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      9 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
        SAFFL BMEASIFL BEP01FL AEWITHFL RANDDT     TRTSDTM            
        <fct> <fct>    <fct>   <fct>    <date>     <dttm>             
      1 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      2 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      3 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      4 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      5 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      6 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      7 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      8 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      9 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
        TRTEDTM             TRT01SDTM           TRT01EDTM          
        <dttm>              <dttm>              <dttm>             
      1 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      2 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      3 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      4 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      5 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      6 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      7 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      8 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      9 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
        TRT02SDTM           TRT02EDTM           AP01SDTM           
        <dttm>              <dttm>              <dttm>             
      1 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      2 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      3 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      4 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      5 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      6 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      7 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      8 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      9 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
        AP01EDTM            AP02SDTM            AP02EDTM            EOSSTT   
        <dttm>              <dttm>              <dttm>              <fct>    
      1 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      2 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      3 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      4 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      5 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      6 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      7 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      8 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      9 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
        EOTSTT    EOSDT      EOSDY DCSREAS DTHDT  DTHCAUS DTHCAT LDDTHELD LDDTHGR1
        <fct>     <date>     <int> <fct>   <date> <fct>   <fct>     <int> <fct>   
      1 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      2 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      3 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      4 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      5 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      6 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      7 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      8 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      9 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
        LSTALVDT   DTHADY ADTHAUT  ASEQ TTESEQ
        <date>      <int> <fct>   <int>  <int>
      1 2024-02-10     NA <NA>        5      5
      2 2024-02-10     NA <NA>        7      7
      3 2024-02-10     NA <NA>        8      8
      4 2024-02-10     NA <NA>        9      9
      5 2024-02-10     NA <NA>        2      2
      6 2024-02-10     NA <NA>        6      6
      7 2024-02-10     NA <NA>        1      1
      8 2024-02-10     NA <NA>        4      4
      9 2024-02-10     NA <NA>        3      3
        PARAM                                                 PARAMCD     AVAL AVALU
        <fct>                                                 <fct>      <dbl> <fct>
      1 Time to end of AE reporting period                    AEREPTTE  3.00   YEARS
      2 Number of occurrences of any adverse event            AETOT1    5      <NA> 
      3 Number of occurrences of any serious adverse event    AETOT2    0      <NA> 
      4 Number of occurrences of a grade 3-5 adverse event    AETOT3    4      <NA> 
      5 Time to first occurrence of any adverse event         AETTE1    0.205  YEARS
      6 Time to first occurrence of any serious adverse event AETTE2    3.00   YEARS
      7 Time to first occurrence of a grade 3-5 adverse event AETTE3    0.0463 YEARS
      8 Time to Hy's Law Elevation in relation to Baseline    HYSTTEBL 83.3    WEEKS
      9 Time to Hy's Law Elevation in relation to ULN         HYSTTEUL 41.1    WEEKS
        ADTM                  ADY  CNSR EVNTDESC                       
        <dttm>              <int> <int> <chr>                          
      1 2024-01-18 00:00:00  1097     0 "Completion or Discontinuation"
      2 NA                     NA    NA  <NA>                          
      3 NA                     NA    NA  <NA>                          
      4 NA                     NA    NA  <NA>                          
      5 2021-04-02 22:43:53    75     0 "Preferred Term"               
      6 2024-01-19 22:43:53  1097     1 ""                             
      7 2021-02-03 22:43:53    17     0 "Preferred Term"               
      8 2022-08-22 16:49:24   583     1  <NA>                          
      9 2021-10-31 05:12:47   288     1  <NA>                          
        CNSDTDSC                              
        <chr>                                 
      1  <NA>                                 
      2  <NA>                                 
      3  <NA>                                 
      4  <NA>                                 
      5 ""                                    
      6 "Clinical Cut Off"                    
      7 ""                                    
      8 "Last Post-Baseline ALT or AST Result"
      9 "Last Post-Baseline ALT or AST Result"

---

    Code
      rand_rows
    Output
      # A tibble: 10 x 66
         STUDYID USUBJID             SUBJID SITEID   AGE AGEU  SEX  
         <chr>   <chr>               <chr>  <chr>  <int> <fct> <fct>
       1 AB12345 AB12345-CHN-3-id-5  id-5   CHN-3     36 YEARS F    
       2 AB12345 AB12345-BRA-9-id-8  id-8   BRA-9     31 YEARS F    
       3 AB12345 AB12345-USA-13-id-3 id-3   USA-13    35 YEARS F    
       4 AB12345 AB12345-BRA-1-id-9  id-9   BRA-1     35 YEARS F    
       5 AB12345 AB12345-CHN-3-id-5  id-5   CHN-3     36 YEARS F    
       6 AB12345 AB12345-RUS-1-id-4  id-4   RUS-1     36 YEARS M    
       7 AB12345 AB12345-CHN-3-id-10 id-10  CHN-3     35 YEARS M    
       8 AB12345 AB12345-RUS-1-id-6  id-6   RUS-1     36 YEARS F    
       9 AB12345 AB12345-RUS-1-id-4  id-4   RUS-1     36 YEARS M    
      10 AB12345 AB12345-CHN-11-id-1 id-1   CHN-11    35 YEARS F    
         RACE                             ETHNIC                 COUNTRY DTHFL
         <fct>                            <fct>                  <fct>   <fct>
       1 ASIAN                            NOT HISPANIC OR LATINO CHN     N    
       2 ASIAN                            NOT HISPANIC OR LATINO BRA     Y    
       3 AMERICAN INDIAN OR ALASKA NATIVE NOT HISPANIC OR LATINO USA     N    
       4 BLACK OR AFRICAN AMERICAN        UNKNOWN                BRA     N    
       5 ASIAN                            NOT HISPANIC OR LATINO CHN     N    
       6 BLACK OR AFRICAN AMERICAN        NOT HISPANIC OR LATINO RUS     N    
       7 ASIAN                            NOT HISPANIC OR LATINO CHN     N    
       8 ASIAN                            NOT HISPANIC OR LATINO RUS     N    
       9 BLACK OR AFRICAN AMERICAN        NOT HISPANIC OR LATINO RUS     N    
      10 WHITE                            NOT HISPANIC OR LATINO CHN     Y    
         INVID         INVNAM         ARM            ARMCD ACTARM         ACTARMCD
         <chr>         <chr>          <fct>          <fct> <fct>          <fct>   
       1 INV ID CHN-3  Dr. CHN-3 Doe  A: Drug X      ARM A A: Drug X      ARM A   
       2 INV ID BRA-9  Dr. BRA-9 Doe  A: Drug X      ARM A A: Drug X      ARM A   
       3 INV ID USA-13 Dr. USA-13 Doe A: Drug X      ARM A A: Drug X      ARM A   
       4 INV ID BRA-1  Dr. BRA-1 Doe  C: Combination ARM C C: Combination ARM C   
       5 INV ID CHN-3  Dr. CHN-3 Doe  A: Drug X      ARM A A: Drug X      ARM A   
       6 INV ID RUS-1  Dr. RUS-1 Doe  B: Placebo     ARM B B: Placebo     ARM B   
       7 INV ID CHN-3  Dr. CHN-3 Doe  B: Placebo     ARM B B: Placebo     ARM B   
       8 INV ID RUS-1  Dr. RUS-1 Doe  A: Drug X      ARM A A: Drug X      ARM A   
       9 INV ID RUS-1  Dr. RUS-1 Doe  B: Placebo     ARM B B: Placebo     ARM B   
      10 INV ID CHN-11 Dr. CHN-11 Doe C: Combination ARM C C: Combination ARM C   
         TRT01P         TRT01A         TRT02P         TRT02A         REGION1      
         <fct>          <fct>          <fct>          <fct>          <fct>        
       1 A: Drug X      A: Drug X      A: Drug X      C: Combination Asia         
       2 A: Drug X      A: Drug X      A: Drug X      A: Drug X      South America
       3 A: Drug X      A: Drug X      B: Placebo     A: Drug X      North America
       4 C: Combination C: Combination A: Drug X      C: Combination South America
       5 A: Drug X      A: Drug X      A: Drug X      C: Combination Asia         
       6 B: Placebo     B: Placebo     A: Drug X      A: Drug X      Eurasia      
       7 B: Placebo     B: Placebo     A: Drug X      A: Drug X      Asia         
       8 A: Drug X      A: Drug X      C: Combination A: Drug X      Eurasia      
       9 B: Placebo     B: Placebo     A: Drug X      A: Drug X      Eurasia      
      10 C: Combination C: Combination B: Placebo     B: Placebo     Asia         
         STRATA1 STRATA2 BMRKR1 BMRKR2 ITTFL SAFFL BMEASIFL BEP01FL AEWITHFL
         <fct>   <fct>    <dbl> <fct>  <fct> <fct> <fct>    <fct>   <fct>   
       1 A       S2        2.62 LOW    Y     Y     Y        N       N       
       2 B       S2       11.3  MEDIUM Y     Y     Y        Y       N       
       3 C       S1        7.25 LOW    Y     Y     Y        N       N       
       4 A       S1        6.92 HIGH   Y     Y     Y        N       N       
       5 A       S2        2.62 LOW    Y     Y     Y        N       N       
       6 A       S1        9.95 MEDIUM Y     Y     Y        N       N       
       7 A       S1        1.78 LOW    Y     Y     N        Y       N       
       8 B       S1        9.34 MEDIUM Y     Y     N        N       N       
       9 A       S1        9.95 MEDIUM Y     Y     Y        N       N       
      10 B       S1        8.93 LOW    Y     Y     N        N       N       
         RANDDT     TRTSDTM             TRTEDTM             TRT01SDTM          
         <date>     <dttm>              <dttm>              <dttm>             
       1 2020-06-24 2020-06-27 04:48:00 2023-06-27 22:48:00 2020-06-27 04:48:00
       2 2020-01-18 2020-01-21 10:19:08 2021-10-16 19:37:36 2020-01-21 10:19:08
       3 2019-10-16 2019-10-17 17:56:02 2022-10-17 11:56:02 2019-10-17 17:56:02
       4 2021-01-17 2021-01-17 22:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       5 2020-06-24 2020-06-27 04:48:00 2023-06-27 22:48:00 2020-06-27 04:48:00
       6 2020-08-27 2020-08-28 20:42:09 2022-01-23 08:46:48 2020-08-28 20:42:09
       7 2019-03-24 2019-03-28 12:07:16 2022-03-28 06:07:16 2019-03-28 12:07:16
       8 2020-10-24 2020-10-26 22:16:26 2023-10-27 16:16:26 2020-10-26 22:16:26
       9 2020-08-27 2020-08-28 20:42:09 2022-01-23 08:46:48 2020-08-28 20:42:09
      10 2020-04-29 2020-05-02 02:28:45 2021-09-08 20:09:38 2020-05-02 02:28:45
         TRT01EDTM           TRT02SDTM           TRT02EDTM          
         <dttm>              <dttm>              <dttm>             
       1 2022-06-27 16:48:00 2022-06-27 16:48:00 2023-06-27 22:48:00
       2 2020-10-16 13:37:36 2020-10-16 13:37:36 2021-10-16 19:37:36
       3 2021-10-17 05:56:02 2021-10-17 05:56:02 2022-10-17 11:56:02
       4 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53
       5 2022-06-27 16:48:00 2022-06-27 16:48:00 2023-06-27 22:48:00
       6 2021-01-23 02:46:48 2021-01-23 02:46:48 2022-01-23 08:46:48
       7 2021-03-28 00:07:16 2021-03-28 00:07:16 2022-03-28 06:07:16
       8 2022-10-27 10:16:26 2022-10-27 10:16:26 2023-10-27 16:16:26
       9 2021-01-23 02:46:48 2021-01-23 02:46:48 2022-01-23 08:46:48
      10 2020-09-08 14:09:38 2020-09-08 14:09:38 2021-09-08 20:09:38
         AP01SDTM            AP01EDTM            AP02SDTM           
         <dttm>              <dttm>              <dttm>             
       1 2020-06-27 04:48:00 2022-06-27 16:48:00 2022-06-27 16:48:00
       2 2020-01-21 10:19:08 2020-10-16 13:37:36 2020-10-16 13:37:36
       3 2019-10-17 17:56:02 2021-10-17 05:56:02 2021-10-17 05:56:02
       4 2021-01-17 22:43:53 2023-01-18 10:43:53 2023-01-18 10:43:53
       5 2020-06-27 04:48:00 2022-06-27 16:48:00 2022-06-27 16:48:00
       6 2020-08-28 20:42:09 2021-01-23 02:46:48 2021-01-23 02:46:48
       7 2019-03-28 12:07:16 2021-03-28 00:07:16 2021-03-28 00:07:16
       8 2020-10-26 22:16:26 2022-10-27 10:16:26 2022-10-27 10:16:26
       9 2020-08-28 20:42:09 2021-01-23 02:46:48 2021-01-23 02:46:48
      10 2020-05-02 02:28:45 2020-09-08 14:09:38 2020-09-08 14:09:38
         AP02EDTM            EOSSTT       EOTSTT       EOSDT      EOSDY DCSREAS      
         <dttm>              <fct>        <fct>        <date>     <int> <fct>        
       1 2023-06-27 22:48:00 COMPLETED    COMPLETED    2023-06-27  1096 <NA>         
       2 2021-10-16 19:37:36 DISCONTINUED DISCONTINUED 2021-10-16   635 DEATH        
       3 2022-10-17 11:56:02 COMPLETED    COMPLETED    2022-10-17  1096 <NA>         
       4 2024-01-18 16:43:53 COMPLETED    COMPLETED    2024-01-18  1096 <NA>         
       5 2023-06-27 22:48:00 COMPLETED    COMPLETED    2023-06-27  1096 <NA>         
       6 2022-01-23 08:46:48 DISCONTINUED DISCONTINUED 2022-01-23   513 ADVERSE EVENT
       7 2022-03-28 06:07:16 COMPLETED    COMPLETED    2022-03-28  1096 <NA>         
       8 2023-10-27 16:16:26 COMPLETED    COMPLETED    2023-10-27  1096 <NA>         
       9 2022-01-23 08:46:48 DISCONTINUED DISCONTINUED 2022-01-23   513 ADVERSE EVENT
      10 2021-09-08 20:09:38 DISCONTINUED DISCONTINUED 2021-09-08   495 DEATH        
         DTHDT      DTHCAUS             DTHCAT              LDDTHELD LDDTHGR1
         <date>     <fct>               <fct>                  <int> <fct>   
       1 NA         <NA>                <NA>                      NA <NA>    
       2 2021-11-23 DISEASE PROGRESSION PROGRESSIVE DISEASE       38 >30     
       3 NA         <NA>                <NA>                      NA <NA>    
       4 NA         <NA>                <NA>                      NA <NA>    
       5 NA         <NA>                <NA>                      NA <NA>    
       6 NA         <NA>                <NA>                      NA <NA>    
       7 NA         <NA>                <NA>                      NA <NA>    
       8 NA         <NA>                <NA>                      NA <NA>    
       9 NA         <NA>                <NA>                      NA <NA>    
      10 2021-09-27 ADVERSE EVENT       ADVERSE EVENT             19 <=30    
         LSTALVDT   DTHADY ADTHAUT  ASEQ TTESEQ
         <date>      <int> <fct>   <int>  <int>
       1 2023-07-10     NA <NA>        4      4
       2 2021-11-23    671 Yes         2      2
       3 2022-10-30     NA <NA>        7      7
       4 2024-02-10     NA <NA>        7      7
       5 2023-07-10     NA <NA>        8      8
       6 2022-02-12     NA <NA>        7      7
       7 2022-04-14     NA <NA>        5      5
       8 2023-11-13     NA <NA>        6      6
       9 2022-02-12     NA <NA>        8      8
      10 2021-09-27    512 Yes         5      5
         PARAM                                                 PARAMCD    AVAL AVALU
         <fct>                                                 <fct>     <dbl> <fct>
       1 Time to Hy's Law Elevation in relation to Baseline    HYSTTEBL 21     WEEKS
       2 Time to first occurrence of a grade 3-5 adverse event AETTE3    0.364 YEARS
       3 Number of occurrences of any adverse event            AETOT1    0     <NA> 
       4 Number of occurrences of any adverse event            AETOT1    5     <NA> 
       5 Number of occurrences of any serious adverse event    AETOT2    2     <NA> 
       6 Number of occurrences of any adverse event            AETOT1    6     <NA> 
       7 Time to Hy's Law Elevation in relation to Baseline    HYSTTEBL 47.1   WEEKS
       8 Time to first occurrence of any adverse event         AETTE1    3.00  YEARS
       9 Number of occurrences of any serious adverse event    AETOT2    2     <NA> 
      10 Time to end of AE reporting period                    AEREPTTE  1.36  YEARS
         ADTM                  ADY  CNSR EVNTDESC                       
         <dttm>              <int> <int> <chr>                          
       1 2020-11-20 02:07:46   147     1  <NA>                          
       2 2020-06-03 10:19:08   134     0 "Preferred Term"               
       3 NA                     NA    NA  <NA>                          
       4 NA                     NA    NA  <NA>                          
       5 NA                     NA    NA  <NA>                          
       6 NA                     NA    NA  <NA>                          
       7 2020-02-20 22:11:41   330     1  <NA>                          
       8 2023-10-28 22:16:26  1097     1 ""                             
       9 NA                     NA    NA  <NA>                          
      10 2021-09-08 00:00:00   495     0 "Completion or Discontinuation"
         CNSDTDSC                              
         <chr>                                 
       1 "Last Post-Baseline ALT or AST Result"
       2 ""                                    
       3  <NA>                                 
       4  <NA>                                 
       5  <NA>                                 
       6  <NA>                                 
       7 "Last Post-Baseline ALT or AST Result"
       8 "Clinical Cut Off"                    
       9  <NA>                                 
      10  <NA>                                 

# radsub produces expected values

    Code
      first_pt_rows
    Output
      # A tibble: 5 x 65
        STUDYID USUBJID            SUBJID SITEID   AGE AGEU  SEX  
        <chr>   <chr>              <chr>  <chr>  <int> <fct> <fct>
      1 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      2 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      3 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      4 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      5 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
        RACE                      ETHNIC  COUNTRY DTHFL INVID        INVNAM       
        <fct>                     <fct>   <fct>   <fct> <chr>        <chr>        
      1 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      2 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      3 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      4 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      5 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
        ARM            ARMCD ACTARM         ACTARMCD TRT01P         TRT01A        
        <fct>          <fct> <fct>          <fct>    <fct>          <fct>         
      1 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      2 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      3 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      4 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      5 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
        TRT02P    TRT02A         REGION1       STRATA1 STRATA2 BMRKR1 BMRKR2 ITTFL
        <fct>     <fct>          <fct>         <fct>   <fct>    <dbl> <fct>  <fct>
      1 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      2 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      3 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      4 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      5 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
        SAFFL BMEASIFL BEP01FL AEWITHFL RANDDT     TRTSDTM            
        <fct> <fct>    <fct>   <fct>    <date>     <dttm>             
      1 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      2 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      3 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      4 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      5 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
        TRTEDTM             TRT01SDTM           TRT01EDTM          
        <dttm>              <dttm>              <dttm>             
      1 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      2 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      3 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      4 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      5 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
        TRT02SDTM           TRT02EDTM           AP01SDTM           
        <dttm>              <dttm>              <dttm>             
      1 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      2 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      3 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      4 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      5 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
        AP01EDTM            AP02SDTM            AP02EDTM            EOSSTT   
        <dttm>              <dttm>              <dttm>              <fct>    
      1 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      2 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      3 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      4 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      5 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
        EOTSTT    EOSDT      EOSDY DCSREAS DTHDT  DTHCAUS DTHCAT LDDTHELD LDDTHGR1
        <fct>     <date>     <int> <fct>   <date> <fct>   <fct>     <int> <fct>   
      1 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      2 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      3 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      4 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      5 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
        LSTALVDT   DTHADY ADTHAUT PARAM                       PARAMCD  AVAL AVALC    
        <date>      <int> <fct>   <fct>                       <fct>   <dbl> <chr>    
      1 2024-02-10     NA <NA>    Baseline Weight             BWGHTSI 147.  147.3    
      2 2024-02-10     NA <NA>    Baseline Height             BHGHTSI   1.9 1.9      
      3 2024-02-10     NA <NA>    Baseline BMI                BBMISI   39.3 39.3     
      4 2024-02-10     NA <NA>    Baseline ECOG               BECOG     5   5        
      5 2024-02-10     NA <NA>    Baseline Biomarker Mutation BBMRKR1   1   WILD TYPE
        AVALU   AVALCAT1 ADTM                AVISIT   AVISITN SRCSEQ
        <fct>   <chr>    <dttm>              <fct>      <int>  <int>
      1 "kg"    ""       2021-01-08 00:00:00 BASELINE       0      1
      2 "m"     ""       2021-01-08 00:00:00 BASELINE       0      1
      3 "kg/m2" ">30"    2021-01-08 00:00:00 BASELINE       0      1
      4 ""      "4-5"    2021-01-08 00:00:00 BASELINE       0      1
      5 ""      ""       2021-01-08 00:00:00 BASELINE       0      1

---

    Code
      rand_rows
    Output
      # A tibble: 10 x 65
         STUDYID USUBJID             SUBJID SITEID   AGE AGEU  SEX  
         <chr>   <chr>               <chr>  <chr>  <int> <fct> <fct>
       1 AB12345 AB12345-JPN-4-id-7  id-7   JPN-4     30 YEARS F    
       2 AB12345 AB12345-RUS-1-id-6  id-6   RUS-1     36 YEARS F    
       3 AB12345 AB12345-CHN-3-id-10 id-10  CHN-3     35 YEARS M    
       4 AB12345 AB12345-JPN-4-id-7  id-7   JPN-4     30 YEARS F    
       5 AB12345 AB12345-RUS-1-id-4  id-4   RUS-1     36 YEARS M    
       6 AB12345 AB12345-CHN-11-id-2 id-2   CHN-11    35 YEARS M    
       7 AB12345 AB12345-BRA-9-id-8  id-8   BRA-9     31 YEARS F    
       8 AB12345 AB12345-RUS-1-id-4  id-4   RUS-1     36 YEARS M    
       9 AB12345 AB12345-CHN-3-id-10 id-10  CHN-3     35 YEARS M    
      10 AB12345 AB12345-CHN-11-id-2 id-2   CHN-11    35 YEARS M    
         RACE                      ETHNIC                 COUNTRY DTHFL INVID        
         <fct>                     <fct>                  <fct>   <fct> <chr>        
       1 ASIAN                     NOT HISPANIC OR LATINO JPN     N     INV ID JPN-4 
       2 ASIAN                     NOT HISPANIC OR LATINO RUS     N     INV ID RUS-1 
       3 ASIAN                     NOT HISPANIC OR LATINO CHN     N     INV ID CHN-3 
       4 ASIAN                     NOT HISPANIC OR LATINO JPN     N     INV ID JPN-4 
       5 BLACK OR AFRICAN AMERICAN NOT HISPANIC OR LATINO RUS     N     INV ID RUS-1 
       6 BLACK OR AFRICAN AMERICAN NOT HISPANIC OR LATINO CHN     N     INV ID CHN-11
       7 ASIAN                     NOT HISPANIC OR LATINO BRA     Y     INV ID BRA-9 
       8 BLACK OR AFRICAN AMERICAN NOT HISPANIC OR LATINO RUS     N     INV ID RUS-1 
       9 ASIAN                     NOT HISPANIC OR LATINO CHN     N     INV ID CHN-3 
      10 BLACK OR AFRICAN AMERICAN NOT HISPANIC OR LATINO CHN     N     INV ID CHN-11
         INVNAM         ARM        ARMCD ACTARM     ACTARMCD TRT01P     TRT01A    
         <chr>          <fct>      <fct> <fct>      <fct>    <fct>      <fct>     
       1 Dr. JPN-4 Doe  A: Drug X  ARM A A: Drug X  ARM A    A: Drug X  A: Drug X 
       2 Dr. RUS-1 Doe  A: Drug X  ARM A A: Drug X  ARM A    A: Drug X  A: Drug X 
       3 Dr. CHN-3 Doe  B: Placebo ARM B B: Placebo ARM B    B: Placebo B: Placebo
       4 Dr. JPN-4 Doe  A: Drug X  ARM A A: Drug X  ARM A    A: Drug X  A: Drug X 
       5 Dr. RUS-1 Doe  B: Placebo ARM B B: Placebo ARM B    B: Placebo B: Placebo
       6 Dr. CHN-11 Doe A: Drug X  ARM A A: Drug X  ARM A    A: Drug X  A: Drug X 
       7 Dr. BRA-9 Doe  A: Drug X  ARM A A: Drug X  ARM A    A: Drug X  A: Drug X 
       8 Dr. RUS-1 Doe  B: Placebo ARM B B: Placebo ARM B    B: Placebo B: Placebo
       9 Dr. CHN-3 Doe  B: Placebo ARM B B: Placebo ARM B    B: Placebo B: Placebo
      10 Dr. CHN-11 Doe A: Drug X  ARM A A: Drug X  ARM A    A: Drug X  A: Drug X 
         TRT02P         TRT02A     REGION1       STRATA1 STRATA2 BMRKR1 BMRKR2 ITTFL
         <fct>          <fct>      <fct>         <fct>   <fct>    <dbl> <fct>  <fct>
       1 C: Combination B: Placebo Asia          B       S1        7.46 MEDIUM Y    
       2 C: Combination A: Drug X  Eurasia       B       S1        9.34 MEDIUM Y    
       3 A: Drug X      A: Drug X  Asia          A       S1        1.78 LOW    Y    
       4 C: Combination B: Placebo Asia          B       S1        7.46 MEDIUM Y    
       5 A: Drug X      A: Drug X  Eurasia       A       S1        9.95 MEDIUM Y    
       6 A: Drug X      A: Drug X  Asia          C       S2        4.08 HIGH   Y    
       7 A: Drug X      A: Drug X  South America B       S2       11.3  MEDIUM Y    
       8 A: Drug X      A: Drug X  Eurasia       A       S1        9.95 MEDIUM Y    
       9 A: Drug X      A: Drug X  Asia          A       S1        1.78 LOW    Y    
      10 A: Drug X      A: Drug X  Asia          C       S2        4.08 HIGH   Y    
         SAFFL BMEASIFL BEP01FL AEWITHFL RANDDT     TRTSDTM            
         <fct> <fct>    <fct>   <fct>    <date>     <dttm>             
       1 Y     Y        N       N        2019-09-22 2019-09-22 02:25:18
       2 Y     N        N       N        2020-10-24 2020-10-26 22:16:26
       3 Y     N        Y       N        2019-03-24 2019-03-28 12:07:16
       4 Y     Y        N       N        2019-09-22 2019-09-22 02:25:18
       5 Y     Y        N       N        2020-08-27 2020-08-28 20:42:09
       6 Y     Y        Y       N        2020-02-23 2020-02-26 18:15:59
       7 Y     Y        Y       N        2020-01-18 2020-01-21 10:19:08
       8 Y     Y        N       N        2020-08-27 2020-08-28 20:42:09
       9 Y     N        Y       N        2019-03-24 2019-03-28 12:07:16
      10 Y     Y        Y       N        2020-02-23 2020-02-26 18:15:59
         TRTEDTM             TRT01SDTM           TRT01EDTM          
         <dttm>              <dttm>              <dttm>             
       1 2022-09-21 20:25:18 2019-09-22 02:25:18 2021-09-21 14:25:18
       2 2023-10-27 16:16:26 2020-10-26 22:16:26 2022-10-27 10:16:26
       3 2022-03-28 06:07:16 2019-03-28 12:07:16 2021-03-28 00:07:16
       4 2022-09-21 20:25:18 2019-09-22 02:25:18 2021-09-21 14:25:18
       5 2022-01-23 08:46:48 2020-08-28 20:42:09 2021-01-23 02:46:48
       6 NA                  2020-02-26 18:15:59 NA                 
       7 2021-10-16 19:37:36 2020-01-21 10:19:08 2020-10-16 13:37:36
       8 2022-01-23 08:46:48 2020-08-28 20:42:09 2021-01-23 02:46:48
       9 2022-03-28 06:07:16 2019-03-28 12:07:16 2021-03-28 00:07:16
      10 NA                  2020-02-26 18:15:59 NA                 
         TRT02SDTM           TRT02EDTM           AP01SDTM           
         <dttm>              <dttm>              <dttm>             
       1 2021-09-21 14:25:18 2022-09-21 20:25:18 2019-09-22 02:25:18
       2 2022-10-27 10:16:26 2023-10-27 16:16:26 2020-10-26 22:16:26
       3 2021-03-28 00:07:16 2022-03-28 06:07:16 2019-03-28 12:07:16
       4 2021-09-21 14:25:18 2022-09-21 20:25:18 2019-09-22 02:25:18
       5 2021-01-23 02:46:48 2022-01-23 08:46:48 2020-08-28 20:42:09
       6 NA                  NA                  2020-02-26 18:15:59
       7 2020-10-16 13:37:36 2021-10-16 19:37:36 2020-01-21 10:19:08
       8 2021-01-23 02:46:48 2022-01-23 08:46:48 2020-08-28 20:42:09
       9 2021-03-28 00:07:16 2022-03-28 06:07:16 2019-03-28 12:07:16
      10 NA                  NA                  2020-02-26 18:15:59
         AP01EDTM            AP02SDTM            AP02EDTM            EOSSTT      
         <dttm>              <dttm>              <dttm>              <fct>       
       1 2021-09-21 14:25:18 2021-09-21 14:25:18 2022-09-21 20:25:18 COMPLETED   
       2 2022-10-27 10:16:26 2022-10-27 10:16:26 2023-10-27 16:16:26 COMPLETED   
       3 2021-03-28 00:07:16 2021-03-28 00:07:16 2022-03-28 06:07:16 COMPLETED   
       4 2021-09-21 14:25:18 2021-09-21 14:25:18 2022-09-21 20:25:18 COMPLETED   
       5 2021-01-23 02:46:48 2021-01-23 02:46:48 2022-01-23 08:46:48 DISCONTINUED
       6 NA                  NA                  NA                  ONGOING     
       7 2020-10-16 13:37:36 2020-10-16 13:37:36 2021-10-16 19:37:36 DISCONTINUED
       8 2021-01-23 02:46:48 2021-01-23 02:46:48 2022-01-23 08:46:48 DISCONTINUED
       9 2021-03-28 00:07:16 2021-03-28 00:07:16 2022-03-28 06:07:16 COMPLETED   
      10 NA                  NA                  NA                  ONGOING     
         EOTSTT       EOSDT      EOSDY DCSREAS       DTHDT      DTHCAUS            
         <fct>        <date>     <int> <fct>         <date>     <fct>              
       1 COMPLETED    2022-09-21  1096 <NA>          NA         <NA>               
       2 COMPLETED    2023-10-27  1096 <NA>          NA         <NA>               
       3 COMPLETED    2022-03-28  1096 <NA>          NA         <NA>               
       4 COMPLETED    2022-09-21  1096 <NA>          NA         <NA>               
       5 DISCONTINUED 2022-01-23   513 ADVERSE EVENT NA         <NA>               
       6 ONGOING      NA            NA <NA>          NA         <NA>               
       7 DISCONTINUED 2021-10-16   635 DEATH         2021-11-23 DISEASE PROGRESSION
       8 DISCONTINUED 2022-01-23   513 ADVERSE EVENT NA         <NA>               
       9 COMPLETED    2022-03-28  1096 <NA>          NA         <NA>               
      10 ONGOING      NA            NA <NA>          NA         <NA>               
         DTHCAT              LDDTHELD LDDTHGR1 LSTALVDT   DTHADY ADTHAUT
         <fct>                  <int> <fct>    <date>      <int> <fct>  
       1 <NA>                      NA <NA>     2022-10-09     NA <NA>   
       2 <NA>                      NA <NA>     2023-11-13     NA <NA>   
       3 <NA>                      NA <NA>     2022-04-14     NA <NA>   
       4 <NA>                      NA <NA>     2022-10-09     NA <NA>   
       5 <NA>                      NA <NA>     2022-02-12     NA <NA>   
       6 <NA>                      NA <NA>     NA             NA <NA>   
       7 PROGRESSIVE DISEASE       38 >30      2021-11-23    671 Yes    
       8 <NA>                      NA <NA>     2022-02-12     NA <NA>   
       9 <NA>                      NA <NA>     2022-04-14     NA <NA>   
      10 <NA>                      NA <NA>     NA             NA <NA>   
         PARAM                       PARAMCD  AVAL AVALC     AVALU   AVALCAT1
         <fct>                       <fct>   <dbl> <chr>     <fct>   <chr>   
       1 Baseline BMI                BBMISI   33.4 33.4      "kg/m2" ">30"   
       2 Baseline Biomarker Mutation BBMRKR1   1   WILD TYPE ""      ""      
       3 Baseline Weight             BWGHTSI 105.  105.4     "kg"    ""      
       4 Baseline Weight             BWGHTSI  76.8 76.8      "kg"    ""      
       5 Baseline BMI                BBMISI   51.9 51.9      "kg/m2" ">30"   
       6 Baseline Height             BHGHTSI   1.5 1.5       "m"     ""      
       7 Baseline ECOG               BECOG     2   2         ""      "2-3"   
       8 Baseline ECOG               BECOG     3   3         ""      "2-3"   
       9 Baseline BMI                BBMISI   31.2 31.2      "kg/m2" ">30"   
      10 Baseline ECOG               BECOG     0   0         ""      "0-1"   
         ADTM                AVISIT   AVISITN SRCSEQ
         <dttm>              <fct>      <int>  <int>
       1 2019-09-20 00:00:00 BASELINE       0      1
       2 2020-10-25 00:00:00 BASELINE       0      1
       3 2019-03-26 00:00:00 BASELINE       0      1
       4 2019-09-20 00:00:00 BASELINE       0      1
       5 2020-08-25 00:00:00 BASELINE       0      1
       6 2020-02-25 00:00:00 BASELINE       0      1
       7 2020-01-17 00:00:00 BASELINE       0      1
       8 2020-08-25 00:00:00 BASELINE       0      1
       9 2019-03-26 00:00:00 BASELINE       0      1
      10 2020-02-25 00:00:00 BASELINE       0      1

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
              ADTM  ADY   DTYPE     AVAL            AVALC AVALU    BASE ABLFL
      1 2022-05-02  470         145.9484 145.948361883575    mm 209.412      
      2 2021-12-12  329 MINIMUM 118.6760 118.675961210504    mm 209.412      
      3 2020-10-09 -100         192.9907 192.990711051031    mm 209.412      
      4 2021-01-17    0               NA             <NA>    mm 209.412     Y
      5 2021-10-13  269         138.9834 138.983355706005    mm 209.412      
      6 2021-12-12  329         118.6760 118.675961210504    mm 209.412      
      7 2021-11-11  298         167.0916 167.091588823272    mm 209.412      
              CHG      PCHG ONTRTFL ANL01FL ANL02FL ANL03FL
      1 -63.46364 -30.30563               Y       Y        
      2 -90.73604 -43.32896       Y                       Y
      3        NA        NA                                
      4        NA        NA                       Y       Y
      5 -70.42864 -33.63162       Y       Y                
      6 -90.73604 -43.32896       Y       Y                
      7 -42.32041 -20.20916       Y       Y                

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
         AVISITN       ADTM  ADY   DTYPE     AVAL            AVALC AVALU     BASE
      32     999 2021-09-01  888         104.2930 104.292995987107    mm 132.3144
      39       0 2020-06-27    0               NA             <NA>    mm 159.9885
      37     999 2021-07-09  377         158.0130 158.012963723167    mm 159.9885
      12       0 2020-01-21    0               NA             <NA>    mm 148.8228
      14      -1 2019-10-13 -100         222.0485 222.048532815143    mm 148.8228
      16     999 2021-02-15  289 MINIMUM 128.7016 128.701607072346    mm 193.9666
      15       4 2021-06-27  421         215.1784 215.178350110865    mm 193.9666
      2        4 2021-12-12  329 MINIMUM 118.6760 118.675961210504    mm 209.4120
      1      999 2022-05-02  470         145.9484 145.948361883575    mm 209.4120
      3       -1 2020-10-09 -100         192.9907 192.990711051031    mm 209.4120
         ABLFL        CHG       PCHG ONTRTFL ANL01FL ANL02FL ANL03FL
      32       -28.021376 -21.177878       Y       Y       Y        
      39     Y         NA         NA                       Y       Y
      37        -1.975547  -1.234806       Y       Y       Y        
      12     Y         NA         NA                       Y       Y
      14               NA         NA                                
      16       -65.265039 -33.647558       Y                       Y
      15        21.211704  10.935748       Y       Y       Y        
      2        -90.736036 -43.328958       Y                       Y
      1        -63.463635 -30.305635               Y       Y        
      3                NA         NA                                

# radtte produces expected values

    Code
      first_pt_rows
    Output
      # A tibble: 5 x 67
        STUDYID USUBJID            SUBJID SITEID   AGE AGEU  SEX  
        <chr>   <chr>              <chr>  <chr>  <int> <fct> <fct>
      1 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      2 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      3 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      4 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      5 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
        RACE                      ETHNIC  COUNTRY DTHFL INVID        INVNAM       
        <fct>                     <fct>   <fct>   <fct> <chr>        <chr>        
      1 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      2 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      3 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      4 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      5 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
        ARM            ARMCD ACTARM         ACTARMCD TRT01P         TRT01A        
        <fct>          <fct> <fct>          <fct>    <fct>          <fct>         
      1 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      2 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      3 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      4 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      5 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
        TRT02P    TRT02A         REGION1       STRATA1 STRATA2 BMRKR1 BMRKR2 ITTFL
        <fct>     <fct>          <fct>         <fct>   <fct>    <dbl> <fct>  <fct>
      1 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      2 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      3 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      4 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      5 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
        SAFFL BMEASIFL BEP01FL AEWITHFL RANDDT     TRTSDTM            
        <fct> <fct>    <fct>   <fct>    <date>     <dttm>             
      1 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      2 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      3 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      4 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      5 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
        TRTEDTM             TRT01SDTM           TRT01EDTM          
        <dttm>              <dttm>              <dttm>             
      1 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      2 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      3 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      4 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      5 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
        TRT02SDTM           TRT02EDTM           AP01SDTM           
        <dttm>              <dttm>              <dttm>             
      1 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      2 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      3 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      4 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      5 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
        AP01EDTM            AP02SDTM            AP02EDTM            EOSSTT   
        <dttm>              <dttm>              <dttm>              <fct>    
      1 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      2 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      3 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      4 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      5 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
        EOTSTT    EOSDT      EOSDY DCSREAS DTHDT  DTHCAUS DTHCAT LDDTHELD LDDTHGR1
        <fct>     <date>     <int> <fct>   <date> <fct>   <fct>     <int> <fct>   
      1 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      2 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      3 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      4 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      5 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
        LSTALVDT   DTHADY ADTHAUT  ASEQ TTESEQ PARAM                          PARAMCD
        <date>      <int> <fct>   <int>  <int> <fct>                          <fct>  
      1 2024-02-10     NA <NA>        4      4 Duration of Confirmed Response CRSD   
      2 2024-02-10     NA <NA>        2      2 Event Free Survival            EFS    
      3 2024-02-10     NA <NA>        3      3 Overall Survival               OS     
      4 2024-02-10     NA <NA>        1      1 Progression Free Survival      PFS    
      5 2024-02-10     NA <NA>       NA     NA Total Number of Exacerbations  TNE    
         AVAL AVALU ADTM                  ADY  CNSR EVNTDESC             
        <dbl> <fct> <dttm>              <int> <int> <chr>                
      1 127.  DAYS  2022-08-21 22:43:53   581     1 Adverse Event        
      2  25.7 DAYS  2021-12-25 22:43:53   342     1 Last Tumor Assessment
      3 303.  DAYS  2022-07-07 22:43:53   536     1 Alive                
      4 239.  DAYS  2021-02-25 22:43:53    39     1 Last Tumor Assessment
      5   1   COUNT NA                     NA     1 <NA>                 
        CNSDTDSC                      lgTMATRSK
        <chr>                             <dbl>
      1 Preferred Term                    NA   
      2 Completion or Discontinuation     NA   
      3 Alive During Study                NA   
      4 Completion or Discontinuation     NA   
      5 Preferred Term                    -2.35

---

    Code
      rand_rows
    Output
      # A tibble: 10 x 67
         STUDYID USUBJID             SUBJID SITEID   AGE AGEU  SEX  
         <chr>   <chr>               <chr>  <chr>  <int> <fct> <fct>
       1 AB12345 AB12345-CHN-3-id-10 id-10  CHN-3     35 YEARS M    
       2 AB12345 AB12345-BRA-9-id-8  id-8   BRA-9     31 YEARS F    
       3 AB12345 AB12345-CHN-3-id-5  id-5   CHN-3     36 YEARS F    
       4 AB12345 AB12345-RUS-1-id-6  id-6   RUS-1     36 YEARS F    
       5 AB12345 AB12345-RUS-1-id-4  id-4   RUS-1     36 YEARS M    
       6 AB12345 AB12345-BRA-1-id-9  id-9   BRA-1     35 YEARS F    
       7 AB12345 AB12345-USA-13-id-3 id-3   USA-13    35 YEARS F    
       8 AB12345 AB12345-JPN-4-id-7  id-7   JPN-4     30 YEARS F    
       9 AB12345 AB12345-BRA-9-id-8  id-8   BRA-9     31 YEARS F    
      10 AB12345 AB12345-RUS-1-id-6  id-6   RUS-1     36 YEARS F    
         RACE                             ETHNIC                 COUNTRY DTHFL
         <fct>                            <fct>                  <fct>   <fct>
       1 ASIAN                            NOT HISPANIC OR LATINO CHN     N    
       2 ASIAN                            NOT HISPANIC OR LATINO BRA     Y    
       3 ASIAN                            NOT HISPANIC OR LATINO CHN     N    
       4 ASIAN                            NOT HISPANIC OR LATINO RUS     N    
       5 BLACK OR AFRICAN AMERICAN        NOT HISPANIC OR LATINO RUS     N    
       6 BLACK OR AFRICAN AMERICAN        UNKNOWN                BRA     N    
       7 AMERICAN INDIAN OR ALASKA NATIVE NOT HISPANIC OR LATINO USA     N    
       8 ASIAN                            NOT HISPANIC OR LATINO JPN     N    
       9 ASIAN                            NOT HISPANIC OR LATINO BRA     Y    
      10 ASIAN                            NOT HISPANIC OR LATINO RUS     N    
         INVID         INVNAM         ARM            ARMCD ACTARM         ACTARMCD
         <chr>         <chr>          <fct>          <fct> <fct>          <fct>   
       1 INV ID CHN-3  Dr. CHN-3 Doe  B: Placebo     ARM B B: Placebo     ARM B   
       2 INV ID BRA-9  Dr. BRA-9 Doe  A: Drug X      ARM A A: Drug X      ARM A   
       3 INV ID CHN-3  Dr. CHN-3 Doe  A: Drug X      ARM A A: Drug X      ARM A   
       4 INV ID RUS-1  Dr. RUS-1 Doe  A: Drug X      ARM A A: Drug X      ARM A   
       5 INV ID RUS-1  Dr. RUS-1 Doe  B: Placebo     ARM B B: Placebo     ARM B   
       6 INV ID BRA-1  Dr. BRA-1 Doe  C: Combination ARM C C: Combination ARM C   
       7 INV ID USA-13 Dr. USA-13 Doe A: Drug X      ARM A A: Drug X      ARM A   
       8 INV ID JPN-4  Dr. JPN-4 Doe  A: Drug X      ARM A A: Drug X      ARM A   
       9 INV ID BRA-9  Dr. BRA-9 Doe  A: Drug X      ARM A A: Drug X      ARM A   
      10 INV ID RUS-1  Dr. RUS-1 Doe  A: Drug X      ARM A A: Drug X      ARM A   
         TRT01P         TRT01A         TRT02P         TRT02A         REGION1      
         <fct>          <fct>          <fct>          <fct>          <fct>        
       1 B: Placebo     B: Placebo     A: Drug X      A: Drug X      Asia         
       2 A: Drug X      A: Drug X      A: Drug X      A: Drug X      South America
       3 A: Drug X      A: Drug X      A: Drug X      C: Combination Asia         
       4 A: Drug X      A: Drug X      C: Combination A: Drug X      Eurasia      
       5 B: Placebo     B: Placebo     A: Drug X      A: Drug X      Eurasia      
       6 C: Combination C: Combination A: Drug X      C: Combination South America
       7 A: Drug X      A: Drug X      B: Placebo     A: Drug X      North America
       8 A: Drug X      A: Drug X      C: Combination B: Placebo     Asia         
       9 A: Drug X      A: Drug X      A: Drug X      A: Drug X      South America
      10 A: Drug X      A: Drug X      C: Combination A: Drug X      Eurasia      
         STRATA1 STRATA2 BMRKR1 BMRKR2 ITTFL SAFFL BMEASIFL BEP01FL AEWITHFL
         <fct>   <fct>    <dbl> <fct>  <fct> <fct> <fct>    <fct>   <fct>   
       1 A       S1        1.78 LOW    Y     Y     N        Y       N       
       2 B       S2       11.3  MEDIUM Y     Y     Y        Y       N       
       3 A       S2        2.62 LOW    Y     Y     Y        N       N       
       4 B       S1        9.34 MEDIUM Y     Y     N        N       N       
       5 A       S1        9.95 MEDIUM Y     Y     Y        N       N       
       6 A       S1        6.92 HIGH   Y     Y     Y        N       N       
       7 C       S1        7.25 LOW    Y     Y     Y        N       N       
       8 B       S1        7.46 MEDIUM Y     Y     Y        N       N       
       9 B       S2       11.3  MEDIUM Y     Y     Y        Y       N       
      10 B       S1        9.34 MEDIUM Y     Y     N        N       N       
         RANDDT     TRTSDTM             TRTEDTM             TRT01SDTM          
         <date>     <dttm>              <dttm>              <dttm>             
       1 2019-03-24 2019-03-28 12:07:16 2022-03-28 06:07:16 2019-03-28 12:07:16
       2 2020-01-18 2020-01-21 10:19:08 2021-10-16 19:37:36 2020-01-21 10:19:08
       3 2020-06-24 2020-06-27 04:48:00 2023-06-27 22:48:00 2020-06-27 04:48:00
       4 2020-10-24 2020-10-26 22:16:26 2023-10-27 16:16:26 2020-10-26 22:16:26
       5 2020-08-27 2020-08-28 20:42:09 2022-01-23 08:46:48 2020-08-28 20:42:09
       6 2021-01-17 2021-01-17 22:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       7 2019-10-16 2019-10-17 17:56:02 2022-10-17 11:56:02 2019-10-17 17:56:02
       8 2019-09-22 2019-09-22 02:25:18 2022-09-21 20:25:18 2019-09-22 02:25:18
       9 2020-01-18 2020-01-21 10:19:08 2021-10-16 19:37:36 2020-01-21 10:19:08
      10 2020-10-24 2020-10-26 22:16:26 2023-10-27 16:16:26 2020-10-26 22:16:26
         TRT01EDTM           TRT02SDTM           TRT02EDTM          
         <dttm>              <dttm>              <dttm>             
       1 2021-03-28 00:07:16 2021-03-28 00:07:16 2022-03-28 06:07:16
       2 2020-10-16 13:37:36 2020-10-16 13:37:36 2021-10-16 19:37:36
       3 2022-06-27 16:48:00 2022-06-27 16:48:00 2023-06-27 22:48:00
       4 2022-10-27 10:16:26 2022-10-27 10:16:26 2023-10-27 16:16:26
       5 2021-01-23 02:46:48 2021-01-23 02:46:48 2022-01-23 08:46:48
       6 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53
       7 2021-10-17 05:56:02 2021-10-17 05:56:02 2022-10-17 11:56:02
       8 2021-09-21 14:25:18 2021-09-21 14:25:18 2022-09-21 20:25:18
       9 2020-10-16 13:37:36 2020-10-16 13:37:36 2021-10-16 19:37:36
      10 2022-10-27 10:16:26 2022-10-27 10:16:26 2023-10-27 16:16:26
         AP01SDTM            AP01EDTM            AP02SDTM           
         <dttm>              <dttm>              <dttm>             
       1 2019-03-28 12:07:16 2021-03-28 00:07:16 2021-03-28 00:07:16
       2 2020-01-21 10:19:08 2020-10-16 13:37:36 2020-10-16 13:37:36
       3 2020-06-27 04:48:00 2022-06-27 16:48:00 2022-06-27 16:48:00
       4 2020-10-26 22:16:26 2022-10-27 10:16:26 2022-10-27 10:16:26
       5 2020-08-28 20:42:09 2021-01-23 02:46:48 2021-01-23 02:46:48
       6 2021-01-17 22:43:53 2023-01-18 10:43:53 2023-01-18 10:43:53
       7 2019-10-17 17:56:02 2021-10-17 05:56:02 2021-10-17 05:56:02
       8 2019-09-22 02:25:18 2021-09-21 14:25:18 2021-09-21 14:25:18
       9 2020-01-21 10:19:08 2020-10-16 13:37:36 2020-10-16 13:37:36
      10 2020-10-26 22:16:26 2022-10-27 10:16:26 2022-10-27 10:16:26
         AP02EDTM            EOSSTT       EOTSTT       EOSDT      EOSDY DCSREAS      
         <dttm>              <fct>        <fct>        <date>     <int> <fct>        
       1 2022-03-28 06:07:16 COMPLETED    COMPLETED    2022-03-28  1096 <NA>         
       2 2021-10-16 19:37:36 DISCONTINUED DISCONTINUED 2021-10-16   635 DEATH        
       3 2023-06-27 22:48:00 COMPLETED    COMPLETED    2023-06-27  1096 <NA>         
       4 2023-10-27 16:16:26 COMPLETED    COMPLETED    2023-10-27  1096 <NA>         
       5 2022-01-23 08:46:48 DISCONTINUED DISCONTINUED 2022-01-23   513 ADVERSE EVENT
       6 2024-01-18 16:43:53 COMPLETED    COMPLETED    2024-01-18  1096 <NA>         
       7 2022-10-17 11:56:02 COMPLETED    COMPLETED    2022-10-17  1096 <NA>         
       8 2022-09-21 20:25:18 COMPLETED    COMPLETED    2022-09-21  1096 <NA>         
       9 2021-10-16 19:37:36 DISCONTINUED DISCONTINUED 2021-10-16   635 DEATH        
      10 2023-10-27 16:16:26 COMPLETED    COMPLETED    2023-10-27  1096 <NA>         
         DTHDT      DTHCAUS             DTHCAT              LDDTHELD LDDTHGR1
         <date>     <fct>               <fct>                  <int> <fct>   
       1 NA         <NA>                <NA>                      NA <NA>    
       2 2021-11-23 DISEASE PROGRESSION PROGRESSIVE DISEASE       38 >30     
       3 NA         <NA>                <NA>                      NA <NA>    
       4 NA         <NA>                <NA>                      NA <NA>    
       5 NA         <NA>                <NA>                      NA <NA>    
       6 NA         <NA>                <NA>                      NA <NA>    
       7 NA         <NA>                <NA>                      NA <NA>    
       8 NA         <NA>                <NA>                      NA <NA>    
       9 2021-11-23 DISEASE PROGRESSION PROGRESSIVE DISEASE       38 >30     
      10 NA         <NA>                <NA>                      NA <NA>    
         LSTALVDT   DTHADY ADTHAUT  ASEQ TTESEQ PARAM                          PARAMCD
         <date>      <int> <fct>   <int>  <int> <fct>                          <fct>  
       1 2022-04-14     NA <NA>        4      4 Event Free Survival            EFS    
       2 2021-11-23    671 Yes         2      2 Duration of Confirmed Response CRSD   
       3 2023-07-10     NA <NA>        4      4 Overall Survival               OS     
       4 2023-11-13     NA <NA>        3      3 Duration of Confirmed Response CRSD   
       5 2022-02-12     NA <NA>        3      3 Event Free Survival            EFS    
       6 2024-02-10     NA <NA>        3      3 Overall Survival               OS     
       7 2022-10-30     NA <NA>       NA     NA Total Number of Exacerbations  TNE    
       8 2022-10-09     NA <NA>       NA     NA Total Number of Exacerbations  TNE    
       9 2021-11-23    671 Yes         3      3 Event Free Survival            EFS    
      10 2023-11-13     NA <NA>        4      4 Overall Survival               OS     
          AVAL AVALU ADTM                  ADY  CNSR EVNTDESC             
         <dbl> <fct> <dttm>              <int> <int> <chr>                
       1  66.0 DAYS  2022-02-28 12:07:16  1068     0 Disease Progression  
       2  47.5 DAYS  2020-09-24 10:19:08   247     0 Death                
       3 211.  DAYS  2023-03-19 04:48:00   995     0 Death                
       4 179.  DAYS  2023-02-27 22:16:26   854     1 Last Tumor Assessment
       5  84.8 DAYS  2021-06-27 20:42:09   303     0 Disease Progression  
       6 303.  DAYS  2022-07-07 22:43:53   536     1 Alive                
       7   0   COUNT NA                     NA     0 <NA>                 
       8   3   COUNT NA                     NA     0 <NA>                 
       9  47.5 DAYS  2021-01-29 10:19:08   374     0 Death                
      10 202.  DAYS  2023-03-02 22:16:26   857     0 Death                
         CNSDTDSC                        lgTMATRSK
         <chr>                               <dbl>
       1 ""                                NA     
       2 ""                                NA     
       3 ""                                NA     
       4 "Completion or Discontinuation"   NA     
       5 ""                                NA     
       6 "Alive During Study"              NA     
       7 ""                                -1.30  
       8 ""                                -0.0837
       9 ""                                NA     
      10 ""                                NA     

# radvs produces expected values

    Code
      first_pt_rows
    Output
      # A tibble: 42 x 87
         STUDYID USUBJID            SUBJID SITEID   AGE AGEU  SEX  
         <chr>   <chr>              <chr>  <chr>  <int> <fct> <fct>
       1 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       2 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       3 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       4 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       5 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       6 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       7 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       8 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
       9 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      10 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      11 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      12 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      13 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      14 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      15 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      16 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      17 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      18 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      19 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      20 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      21 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      22 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      23 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      24 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      25 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      26 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      27 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      28 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      29 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      30 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      31 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      32 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      33 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      34 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      35 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      36 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      37 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      38 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      39 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      40 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      41 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
      42 AB12345 AB12345-BRA-1-id-9 id-9   BRA-1     35 YEARS F    
         RACE                      ETHNIC  COUNTRY DTHFL INVID        INVNAM       
         <fct>                     <fct>   <fct>   <fct> <chr>        <chr>        
       1 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       2 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       3 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       4 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       5 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       6 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       7 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       8 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
       9 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      10 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      11 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      12 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      13 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      14 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      15 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      16 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      17 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      18 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      19 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      20 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      21 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      22 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      23 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      24 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      25 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      26 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      27 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      28 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      29 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      30 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      31 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      32 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      33 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      34 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      35 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      36 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      37 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      38 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      39 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      40 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      41 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
      42 BLACK OR AFRICAN AMERICAN UNKNOWN BRA     N     INV ID BRA-1 Dr. BRA-1 Doe
         ARM            ARMCD ACTARM         ACTARMCD TRT01P         TRT01A        
         <fct>          <fct> <fct>          <fct>    <fct>          <fct>         
       1 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       2 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       3 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       4 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       5 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       6 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       7 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       8 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
       9 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      10 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      11 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      12 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      13 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      14 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      15 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      16 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      17 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      18 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      19 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      20 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      21 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      22 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      23 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      24 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      25 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      26 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      27 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      28 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      29 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      30 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      31 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      32 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      33 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      34 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      35 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      36 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      37 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      38 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      39 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      40 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      41 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
      42 C: Combination ARM C C: Combination ARM C    C: Combination C: Combination
         TRT02P    TRT02A         REGION1       STRATA1 STRATA2 BMRKR1 BMRKR2 ITTFL
         <fct>     <fct>          <fct>         <fct>   <fct>    <dbl> <fct>  <fct>
       1 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       2 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       3 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       4 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       5 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       6 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       7 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       8 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
       9 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      10 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      11 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      12 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      13 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      14 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      15 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      16 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      17 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      18 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      19 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      20 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      21 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      22 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      23 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      24 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      25 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      26 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      27 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      28 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      29 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      30 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      31 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      32 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      33 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      34 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      35 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      36 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      37 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      38 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      39 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      40 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      41 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
      42 A: Drug X C: Combination South America A       S1        6.92 HIGH   Y    
         SAFFL BMEASIFL BEP01FL AEWITHFL RANDDT     TRTSDTM            
         <fct> <fct>    <fct>   <fct>    <date>     <dttm>             
       1 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       2 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       3 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       4 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       5 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       6 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       7 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       8 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
       9 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      10 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      11 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      12 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      13 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      14 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      15 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      16 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      17 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      18 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      19 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      20 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      21 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      22 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      23 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      24 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      25 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      26 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      27 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      28 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      29 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      30 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      31 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      32 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      33 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      34 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      35 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      36 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      37 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      38 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      39 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      40 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      41 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
      42 Y     Y        N       N        2021-01-17 2021-01-17 22:43:53
         TRTEDTM             TRT01SDTM           TRT01EDTM          
         <dttm>              <dttm>              <dttm>             
       1 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       2 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       3 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       4 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       5 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       6 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       7 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       8 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
       9 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      10 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      11 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      12 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      13 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      14 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      15 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      16 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      17 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      18 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      19 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      20 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      21 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      22 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      23 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      24 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      25 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      26 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      27 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      28 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      29 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      30 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      31 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      32 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      33 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      34 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      35 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      36 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      37 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      38 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      39 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      40 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      41 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
      42 2024-01-18 16:43:53 2021-01-17 22:43:53 2023-01-18 10:43:53
         TRT02SDTM           TRT02EDTM           AP01SDTM           
         <dttm>              <dttm>              <dttm>             
       1 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       2 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       3 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       4 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       5 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       6 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       7 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       8 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       9 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      10 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      11 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      12 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      13 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      14 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      15 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      16 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      17 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      18 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      19 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      20 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      21 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      22 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      23 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      24 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      25 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      26 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      27 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      28 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      29 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      30 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      31 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      32 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      33 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      34 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      35 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      36 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      37 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      38 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      39 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      40 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      41 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
      42 2023-01-18 10:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
         AP01EDTM            AP02SDTM            AP02EDTM            EOSSTT   
         <dttm>              <dttm>              <dttm>              <fct>    
       1 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       2 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       3 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       4 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       5 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       6 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       7 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       8 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
       9 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      10 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      11 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      12 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      13 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      14 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      15 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      16 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      17 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      18 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      19 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      20 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      21 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      22 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      23 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      24 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      25 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      26 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      27 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      28 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      29 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      30 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      31 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      32 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      33 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      34 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      35 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      36 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      37 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      38 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      39 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      40 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      41 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
      42 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53 COMPLETED
         EOTSTT    EOSDT      EOSDY DCSREAS DTHDT  DTHCAUS DTHCAT LDDTHELD LDDTHGR1
         <fct>     <date>     <int> <fct>   <date> <fct>   <fct>     <int> <fct>   
       1 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       2 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       3 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       4 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       5 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       6 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       7 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       8 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
       9 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      10 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      11 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      12 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      13 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      14 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      15 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      16 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      17 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      18 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      19 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      20 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      21 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      22 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      23 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      24 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      25 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      26 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      27 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      28 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      29 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      30 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      31 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      32 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      33 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      34 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      35 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      36 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      37 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      38 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      39 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      40 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      41 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
      42 COMPLETED 2024-01-18  1096 <NA>    NA     <NA>    <NA>         NA <NA>    
         LSTALVDT   DTHADY ADTHAUT  ASEQ VSSEQ VSTESTCD VSTEST                  
         <date>      <int> <fct>   <int> <int> <fct>    <fct>                   
       1 2024-02-10     NA <NA>        1     1 DIABP    Diastolic Blood Pressure
       2 2024-02-10     NA <NA>        7     7 DIABP    Diastolic Blood Pressure
       3 2024-02-10     NA <NA>       13    13 DIABP    Diastolic Blood Pressure
       4 2024-02-10     NA <NA>       19    19 DIABP    Diastolic Blood Pressure
       5 2024-02-10     NA <NA>       25    25 DIABP    Diastolic Blood Pressure
       6 2024-02-10     NA <NA>       31    31 DIABP    Diastolic Blood Pressure
       7 2024-02-10     NA <NA>       37    37 DIABP    Diastolic Blood Pressure
       8 2024-02-10     NA <NA>        2     2 PULSE    Pulse Rate              
       9 2024-02-10     NA <NA>        8     8 PULSE    Pulse Rate              
      10 2024-02-10     NA <NA>       14    14 PULSE    Pulse Rate              
      11 2024-02-10     NA <NA>       20    20 PULSE    Pulse Rate              
      12 2024-02-10     NA <NA>       26    26 PULSE    Pulse Rate              
      13 2024-02-10     NA <NA>       32    32 PULSE    Pulse Rate              
      14 2024-02-10     NA <NA>       38    38 PULSE    Pulse Rate              
      15 2024-02-10     NA <NA>        3     3 RESP     Respiratory Rate        
      16 2024-02-10     NA <NA>        9     9 RESP     Respiratory Rate        
      17 2024-02-10     NA <NA>       15    15 RESP     Respiratory Rate        
      18 2024-02-10     NA <NA>       21    21 RESP     Respiratory Rate        
      19 2024-02-10     NA <NA>       27    27 RESP     Respiratory Rate        
      20 2024-02-10     NA <NA>       33    33 RESP     Respiratory Rate        
      21 2024-02-10     NA <NA>       39    39 RESP     Respiratory Rate        
      22 2024-02-10     NA <NA>        4     4 SYSBP    Systolic Blood Pressure 
      23 2024-02-10     NA <NA>       10    10 SYSBP    Systolic Blood Pressure 
      24 2024-02-10     NA <NA>       16    16 SYSBP    Systolic Blood Pressure 
      25 2024-02-10     NA <NA>       22    22 SYSBP    Systolic Blood Pressure 
      26 2024-02-10     NA <NA>       28    28 SYSBP    Systolic Blood Pressure 
      27 2024-02-10     NA <NA>       34    34 SYSBP    Systolic Blood Pressure 
      28 2024-02-10     NA <NA>       40    40 SYSBP    Systolic Blood Pressure 
      29 2024-02-10     NA <NA>        5     5 TEMP     Temperature             
      30 2024-02-10     NA <NA>       11    11 TEMP     Temperature             
      31 2024-02-10     NA <NA>       17    17 TEMP     Temperature             
      32 2024-02-10     NA <NA>       23    23 TEMP     Temperature             
      33 2024-02-10     NA <NA>       29    29 TEMP     Temperature             
      34 2024-02-10     NA <NA>       35    35 TEMP     Temperature             
      35 2024-02-10     NA <NA>       41    41 TEMP     Temperature             
      36 2024-02-10     NA <NA>        6     6 WEIGHT   Weight                  
      37 2024-02-10     NA <NA>       12    12 WEIGHT   Weight                  
      38 2024-02-10     NA <NA>       18    18 WEIGHT   Weight                  
      39 2024-02-10     NA <NA>       24    24 WEIGHT   Weight                  
      40 2024-02-10     NA <NA>       30    30 WEIGHT   Weight                  
      41 2024-02-10     NA <NA>       36    36 WEIGHT   Weight                  
      42 2024-02-10     NA <NA>       42    42 WEIGHT   Weight                  
         VSCAT       VSSTRESC ASPID PARAM                    PARAMCD    AVAL
         <fct>       <chr>    <int> <fct>                    <fct>     <dbl>
       1 VITAL SIGNS <80        207 Diastolic Blood Pressure DIABP    93.9  
       2 VITAL SIGNS <80        230 Diastolic Blood Pressure DIABP   143.   
       3 VITAL SIGNS <80        191 Diastolic Blood Pressure DIABP    93.5  
       4 VITAL SIGNS <80        344 Diastolic Blood Pressure DIABP    81.5  
       5 VITAL SIGNS <80        313 Diastolic Blood Pressure DIABP   120.   
       6 VITAL SIGNS <80        162 Diastolic Blood Pressure DIABP   106.   
       7 VITAL SIGNS <80        309 Diastolic Blood Pressure DIABP    72.7  
       8 VITAL SIGNS <60        409 Pulse Rate               PULSE    89.7  
       9 VITAL SIGNS <60        337 Pulse Rate               PULSE    66.9  
      10 VITAL SIGNS <60        268 Pulse Rate               PULSE    72.3  
      11 VITAL SIGNS <60        288 Pulse Rate               PULSE    76.3  
      12 VITAL SIGNS <60        265 Pulse Rate               PULSE    65.0  
      13 VITAL SIGNS <60         68 Pulse Rate               PULSE    87.4  
      14 VITAL SIGNS <60        306 Pulse Rate               PULSE    97.5  
      15 VITAL SIGNS >20         98 Respiratory Rate         RESP     15.4  
      16 VITAL SIGNS >20        351 Respiratory Rate         RESP     17.7  
      17 VITAL SIGNS >20         30 Respiratory Rate         RESP     19.4  
      18 VITAL SIGNS >20        264 Respiratory Rate         RESP     16.8  
      19 VITAL SIGNS >20        389 Respiratory Rate         RESP     18.9  
      20 VITAL SIGNS >20        349 Respiratory Rate         RESP     13.8  
      21 VITAL SIGNS >20        127 Respiratory Rate         RESP     15.6  
      22 VITAL SIGNS >180       256 Systolic Blood Pressure  SYSBP   169.   
      23 VITAL SIGNS >180       176 Systolic Blood Pressure  SYSBP   126.   
      24 VITAL SIGNS >180       354 Systolic Blood Pressure  SYSBP   188.   
      25 VITAL SIGNS >180       360 Systolic Blood Pressure  SYSBP   141.   
      26 VITAL SIGNS >180        79 Systolic Blood Pressure  SYSBP   181.   
      27 VITAL SIGNS >180       302 Systolic Blood Pressure  SYSBP   151.   
      28 VITAL SIGNS >180       324 Systolic Blood Pressure  SYSBP   167.   
      29 VITAL SIGNS <36.1      380 Temperature              TEMP     37.9  
      30 VITAL SIGNS <36.1      322 Temperature              TEMP     36.3  
      31 VITAL SIGNS <36.1      215 Temperature              TEMP     37.1  
      32 VITAL SIGNS <36.1      304 Temperature              TEMP     36.5  
      33 VITAL SIGNS <36.1      255 Temperature              TEMP     38.1  
      34 VITAL SIGNS <36.1      229 Temperature              TEMP     37.4  
      35 VITAL SIGNS <36.1      410 Temperature              TEMP     36.0  
      36 VITAL SIGNS <40        158 Weight                   WEIGHT   42.1  
      37 VITAL SIGNS <40        348 Weight                   WEIGHT  113.   
      38 VITAL SIGNS <40        241 Weight                   WEIGHT   82.9  
      39 VITAL SIGNS <40          3 Weight                   WEIGHT   54.7  
      40 VITAL SIGNS <40         33 Weight                   WEIGHT   56.6  
      41 VITAL SIGNS <40        164 Weight                   WEIGHT   -0.792
      42 VITAL SIGNS <40         81 Weight                   WEIGHT   66.5  
         AVALU       BASE2  BASE BASETYPE ABLFL2 ABLFL    CHG2    PCHG2      CHG
         <fct>       <dbl> <dbl> <fct>    <fct>  <fct>   <dbl>    <dbl>    <dbl>
       1 Pa           93.9  NA   LAST     "Y"    ""      0        0       NA    
       2 Pa           93.9 143.  LAST     ""     "Y"    49.6     52.8      0    
       3 Pa           93.9 143.  LAST     ""     ""     -0.378   -0.402  -49.9  
       4 Pa           93.9 143.  LAST     ""     ""    -12.4    -13.2    -62.0  
       5 Pa           93.9 143.  LAST     ""     ""     26.5     28.2    -23.0  
       6 Pa           93.9 143.  LAST     ""     ""     12.6     13.4    -37.0  
       7 Pa           93.9 143.  LAST     ""     ""    -21.2    -22.5    -70.7  
       8 beats/min    89.7  NA   LAST     "Y"    ""      0        0       NA    
       9 beats/min    89.7  66.9 LAST     ""     "Y"   -22.8    -25.4      0    
      10 beats/min    89.7  66.9 LAST     ""     ""    -17.4    -19.4      5.44 
      11 beats/min    89.7  66.9 LAST     ""     ""    -13.4    -14.9      9.39 
      12 beats/min    89.7  66.9 LAST     ""     ""    -24.7    -27.5     -1.88 
      13 beats/min    89.7  66.9 LAST     ""     ""     -2.26    -2.52    20.5  
      14 beats/min    89.7  66.9 LAST     ""     ""      7.84     8.74    30.6  
      15 breaths/min  15.4  NA   LAST     "Y"    ""      0        0       NA    
      16 breaths/min  15.4  17.7 LAST     ""     "Y"     2.32    15.0      0    
      17 breaths/min  15.4  17.7 LAST     ""     ""      3.98    25.8      1.66 
      18 breaths/min  15.4  17.7 LAST     ""     ""      1.35     8.79    -0.960
      19 breaths/min  15.4  17.7 LAST     ""     ""      3.48    22.6      1.16 
      20 breaths/min  15.4  17.7 LAST     ""     ""     -1.60   -10.4     -3.92 
      21 breaths/min  15.4  17.7 LAST     ""     ""      0.232    1.51    -2.08 
      22 Pa          169.   NA   LAST     "Y"    ""      0        0       NA    
      23 Pa          169.  126.  LAST     ""     "Y"   -43.5    -25.7      0    
      24 Pa          169.  126.  LAST     ""     ""     19.4     11.5     62.9  
      25 Pa          169.  126.  LAST     ""     ""    -27.6    -16.3     15.9  
      26 Pa          169.  126.  LAST     ""     ""     12.1      7.15    55.6  
      27 Pa          169.  126.  LAST     ""     ""    -18.5    -11.0     25.0  
      28 Pa          169.  126.  LAST     ""     ""     -1.99    -1.18    41.5  
      29 C            37.9  NA   LAST     "Y"    ""      0        0       NA    
      30 C            37.9  36.3 LAST     ""     "Y"    -1.58    -4.17     0    
      31 C            37.9  36.3 LAST     ""     ""     -0.752   -1.99     0.826
      32 C            37.9  36.3 LAST     ""     ""     -1.32    -3.48     0.262
      33 C            37.9  36.3 LAST     ""     ""      0.222    0.585    1.80 
      34 C            37.9  36.3 LAST     ""     ""     -0.436   -1.15     1.14 
      35 C            37.9  36.3 LAST     ""     ""     -1.86    -4.91    -0.281
      36 Kg           42.1  NA   LAST     "Y"    ""      0        0       NA    
      37 Kg           42.1 113.  LAST     ""     "Y"    71.4    170.       0    
      38 Kg           42.1 113.  LAST     ""     ""     40.8     96.9    -30.6  
      39 Kg           42.1 113.  LAST     ""     ""     12.6     30.0    -58.8  
      40 Kg           42.1 113.  LAST     ""     ""     14.5     34.5    -56.9  
      41 Kg           42.1 113.  LAST     ""     ""    -42.9   -102.    -114.   
      42 Kg           42.1 113.  LAST     ""     ""     24.4     58.0    -47.0  
             PCHG DTYPE ANRIND BNRIND ADTM                  ADY ATPTN AVISIT       
            <dbl> <fct> <fct>  <fct>  <dttm>              <int> <int> <fct>        
       1   NA     <NA>  NORMAL HIGH   2021-04-29 22:43:53   102     1 SCREENING    
       2    0     <NA>  HIGH   HIGH   2021-06-26 22:43:53   160     1 BASELINE     
       3  -34.8   <NA>  NORMAL HIGH   2022-02-17 22:43:53   396     1 WEEK 1 DAY 8 
       4  -43.2   <NA>  NORMAL HIGH   2022-08-15 22:43:53   575     1 WEEK 2 DAY 15
       5  -16.1   <NA>  HIGH   HIGH   2022-12-31 22:43:53   713     1 WEEK 3 DAY 22
       6  -25.8   <NA>  NORMAL HIGH   2023-07-24 22:43:53   918     1 WEEK 4 DAY 29
       7  -49.3   <NA>  LOW    HIGH   2024-01-12 22:43:53  1090     1 WEEK 5 DAY 36
       8   NA     <NA>  NORMAL NORMAL 2021-04-29 22:43:53   102     1 SCREENING    
       9    0     <NA>  NORMAL NORMAL 2021-06-26 22:43:53   160     1 BASELINE     
      10    8.12  <NA>  NORMAL NORMAL 2022-02-17 22:43:53   396     1 WEEK 1 DAY 8 
      11   14.0   <NA>  NORMAL NORMAL 2022-08-15 22:43:53   575     1 WEEK 2 DAY 15
      12   -2.82  <NA>  NORMAL NORMAL 2022-12-31 22:43:53   713     1 WEEK 3 DAY 22
      13   30.7   <NA>  NORMAL NORMAL 2023-07-24 22:43:53   918     1 WEEK 4 DAY 29
      14   45.8   <NA>  NORMAL NORMAL 2024-01-12 22:43:53  1090     1 WEEK 5 DAY 36
      15   NA     <NA>  NORMAL NORMAL 2021-04-29 22:43:53   102     1 SCREENING    
      16    0     <NA>  NORMAL NORMAL 2021-06-26 22:43:53   160     1 BASELINE     
      17    9.38  <NA>  NORMAL NORMAL 2022-02-17 22:43:53   396     1 WEEK 1 DAY 8 
      18   -5.42  <NA>  NORMAL NORMAL 2022-08-15 22:43:53   575     1 WEEK 2 DAY 15
      19    6.55  <NA>  NORMAL NORMAL 2022-12-31 22:43:53   713     1 WEEK 3 DAY 22
      20  -22.1   <NA>  NORMAL NORMAL 2023-07-24 22:43:53   918     1 WEEK 4 DAY 29
      21  -11.8   <NA>  NORMAL NORMAL 2024-01-12 22:43:53  1090     1 WEEK 5 DAY 36
      22   NA     <NA>  NORMAL NORMAL 2021-04-29 22:43:53   102     1 SCREENING    
      23    0     <NA>  NORMAL NORMAL 2021-06-26 22:43:53   160     1 BASELINE     
      24   50.1   <NA>  HIGH   NORMAL 2022-02-17 22:43:53   396     1 WEEK 1 DAY 8 
      25   12.7   <NA>  NORMAL NORMAL 2022-08-15 22:43:53   575     1 WEEK 2 DAY 15
      26   44.3   <NA>  HIGH   NORMAL 2022-12-31 22:43:53   713     1 WEEK 3 DAY 22
      27   19.9   <NA>  NORMAL NORMAL 2023-07-24 22:43:53   918     1 WEEK 4 DAY 29
      28   33.1   <NA>  NORMAL NORMAL 2024-01-12 22:43:53  1090     1 WEEK 5 DAY 36
      29   NA     <NA>  HIGH   NORMAL 2021-04-29 22:43:53   102     1 SCREENING    
      30    0     <NA>  NORMAL NORMAL 2021-06-26 22:43:53   160     1 BASELINE     
      31    2.28  <NA>  NORMAL NORMAL 2022-02-17 22:43:53   396     1 WEEK 1 DAY 8 
      32    0.721 <NA>  NORMAL NORMAL 2022-08-15 22:43:53   575     1 WEEK 2 DAY 15
      33    4.96  <NA>  HIGH   NORMAL 2022-12-31 22:43:53   713     1 WEEK 3 DAY 22
      34    3.15  <NA>  HIGH   NORMAL 2023-07-24 22:43:53   918     1 WEEK 4 DAY 29
      35   -0.774 <NA>  LOW    NORMAL 2024-01-12 22:43:53  1090     1 WEEK 5 DAY 36
      36   NA     <NA>  NORMAL HIGH   2021-04-29 22:43:53   102     1 SCREENING    
      37    0     <NA>  HIGH   HIGH   2021-06-26 22:43:53   160     1 BASELINE     
      38  -27.0   <NA>  NORMAL HIGH   2022-02-17 22:43:53   396     1 WEEK 1 DAY 8 
      39  -51.8   <NA>  NORMAL HIGH   2022-08-15 22:43:53   575     1 WEEK 2 DAY 15
      40  -50.1   <NA>  NORMAL HIGH   2022-12-31 22:43:53   713     1 WEEK 3 DAY 22
      41 -101.    <NA>  LOW    HIGH   2023-07-24 22:43:53   918     1 WEEK 4 DAY 29
      42  -41.4   <NA>  NORMAL HIGH   2024-01-12 22:43:53  1090     1 WEEK 5 DAY 36
         AVISITN LOQFL ONTRTFL ANRLO ANRHI
           <int> <fct> <fct>   <dbl> <dbl>
       1      -1 N     ""       80   120  
       2       0 N     ""       80   120  
       3       1 N     "Y"      80   120  
       4       2 N     "Y"      80   120  
       5       3 N     "Y"      80   120  
       6       4 N     "Y"      80   120  
       7       5 Y     "Y"      80   120  
       8      -1 N     ""       60   100  
       9       0 N     ""       60   100  
      10       1 N     "Y"      60   100  
      11       2 N     "Y"      60   100  
      12       3 N     "Y"      60   100  
      13       4 N     "Y"      60   100  
      14       5 N     "Y"      60   100  
      15      -1 N     ""       12    20  
      16       0 N     ""       12    20  
      17       1 N     "Y"      12    20  
      18       2 N     "Y"      12    20  
      19       3 N     "Y"      12    20  
      20       4 N     "Y"      12    20  
      21       5 N     "Y"      12    20  
      22      -1 N     ""      120   180  
      23       0 N     ""      120   180  
      24       1 Y     "Y"     120   180  
      25       2 N     "Y"     120   180  
      26       3 Y     "Y"     120   180  
      27       4 N     "Y"     120   180  
      28       5 N     "Y"     120   180  
      29      -1 N     ""       36.1  37.2
      30       0 N     ""       36.1  37.2
      31       1 N     "Y"      36.1  37.2
      32       2 N     "Y"      36.1  37.2
      33       3 N     "Y"      36.1  37.2
      34       4 N     "Y"      36.1  37.2
      35       5 Y     "Y"      36.1  37.2
      36      -1 N     ""       40   100  
      37       0 N     ""       40   100  
      38       1 N     "Y"      40   100  
      39       2 N     "Y"      40   100  
      40       3 N     "Y"      40   100  
      41       4 Y     "Y"      40   100  
      42       5 N     "Y"      40   100  

---

    Code
      rand_rows
    Output
      # A tibble: 10 x 87
         STUDYID USUBJID             SUBJID SITEID   AGE AGEU  SEX  
         <chr>   <chr>               <chr>  <chr>  <int> <fct> <fct>
       1 AB12345 AB12345-RUS-1-id-6  id-6   RUS-1     36 YEARS F    
       2 AB12345 AB12345-BRA-1-id-9  id-9   BRA-1     35 YEARS F    
       3 AB12345 AB12345-CHN-11-id-1 id-1   CHN-11    35 YEARS F    
       4 AB12345 AB12345-RUS-1-id-6  id-6   RUS-1     36 YEARS F    
       5 AB12345 AB12345-CHN-11-id-2 id-2   CHN-11    35 YEARS M    
       6 AB12345 AB12345-RUS-1-id-6  id-6   RUS-1     36 YEARS F    
       7 AB12345 AB12345-RUS-1-id-4  id-4   RUS-1     36 YEARS M    
       8 AB12345 AB12345-CHN-11-id-2 id-2   CHN-11    35 YEARS M    
       9 AB12345 AB12345-BRA-9-id-8  id-8   BRA-9     31 YEARS F    
      10 AB12345 AB12345-BRA-1-id-9  id-9   BRA-1     35 YEARS F    
         RACE                      ETHNIC                 COUNTRY DTHFL INVID        
         <fct>                     <fct>                  <fct>   <fct> <chr>        
       1 ASIAN                     NOT HISPANIC OR LATINO RUS     N     INV ID RUS-1 
       2 BLACK OR AFRICAN AMERICAN UNKNOWN                BRA     N     INV ID BRA-1 
       3 WHITE                     NOT HISPANIC OR LATINO CHN     Y     INV ID CHN-11
       4 ASIAN                     NOT HISPANIC OR LATINO RUS     N     INV ID RUS-1 
       5 BLACK OR AFRICAN AMERICAN NOT HISPANIC OR LATINO CHN     N     INV ID CHN-11
       6 ASIAN                     NOT HISPANIC OR LATINO RUS     N     INV ID RUS-1 
       7 BLACK OR AFRICAN AMERICAN NOT HISPANIC OR LATINO RUS     N     INV ID RUS-1 
       8 BLACK OR AFRICAN AMERICAN NOT HISPANIC OR LATINO CHN     N     INV ID CHN-11
       9 ASIAN                     NOT HISPANIC OR LATINO BRA     Y     INV ID BRA-9 
      10 BLACK OR AFRICAN AMERICAN UNKNOWN                BRA     N     INV ID BRA-1 
         INVNAM         ARM            ARMCD ACTARM         ACTARMCD TRT01P        
         <chr>          <fct>          <fct> <fct>          <fct>    <fct>         
       1 Dr. RUS-1 Doe  A: Drug X      ARM A A: Drug X      ARM A    A: Drug X     
       2 Dr. BRA-1 Doe  C: Combination ARM C C: Combination ARM C    C: Combination
       3 Dr. CHN-11 Doe C: Combination ARM C C: Combination ARM C    C: Combination
       4 Dr. RUS-1 Doe  A: Drug X      ARM A A: Drug X      ARM A    A: Drug X     
       5 Dr. CHN-11 Doe A: Drug X      ARM A A: Drug X      ARM A    A: Drug X     
       6 Dr. RUS-1 Doe  A: Drug X      ARM A A: Drug X      ARM A    A: Drug X     
       7 Dr. RUS-1 Doe  B: Placebo     ARM B B: Placebo     ARM B    B: Placebo    
       8 Dr. CHN-11 Doe A: Drug X      ARM A A: Drug X      ARM A    A: Drug X     
       9 Dr. BRA-9 Doe  A: Drug X      ARM A A: Drug X      ARM A    A: Drug X     
      10 Dr. BRA-1 Doe  C: Combination ARM C C: Combination ARM C    C: Combination
         TRT01A         TRT02P         TRT02A         REGION1       STRATA1 STRATA2
         <fct>          <fct>          <fct>          <fct>         <fct>   <fct>  
       1 A: Drug X      C: Combination A: Drug X      Eurasia       B       S1     
       2 C: Combination A: Drug X      C: Combination South America A       S1     
       3 C: Combination B: Placebo     B: Placebo     Asia          B       S1     
       4 A: Drug X      C: Combination A: Drug X      Eurasia       B       S1     
       5 A: Drug X      A: Drug X      A: Drug X      Asia          C       S2     
       6 A: Drug X      C: Combination A: Drug X      Eurasia       B       S1     
       7 B: Placebo     A: Drug X      A: Drug X      Eurasia       A       S1     
       8 A: Drug X      A: Drug X      A: Drug X      Asia          C       S2     
       9 A: Drug X      A: Drug X      A: Drug X      South America B       S2     
      10 C: Combination A: Drug X      C: Combination South America A       S1     
         BMRKR1 BMRKR2 ITTFL SAFFL BMEASIFL BEP01FL AEWITHFL RANDDT    
          <dbl> <fct>  <fct> <fct> <fct>    <fct>   <fct>    <date>    
       1   9.34 MEDIUM Y     Y     N        N       N        2020-10-24
       2   6.92 HIGH   Y     Y     Y        N       N        2021-01-17
       3   8.93 LOW    Y     Y     N        N       N        2020-04-29
       4   9.34 MEDIUM Y     Y     N        N       N        2020-10-24
       5   4.08 HIGH   Y     Y     Y        Y       N        2020-02-23
       6   9.34 MEDIUM Y     Y     N        N       N        2020-10-24
       7   9.95 MEDIUM Y     Y     Y        N       N        2020-08-27
       8   4.08 HIGH   Y     Y     Y        Y       N        2020-02-23
       9  11.3  MEDIUM Y     Y     Y        Y       N        2020-01-18
      10   6.92 HIGH   Y     Y     Y        N       N        2021-01-17
         TRTSDTM             TRTEDTM             TRT01SDTM          
         <dttm>              <dttm>              <dttm>             
       1 2020-10-26 22:16:26 2023-10-27 16:16:26 2020-10-26 22:16:26
       2 2021-01-17 22:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
       3 2020-05-02 02:28:45 2021-09-08 20:09:38 2020-05-02 02:28:45
       4 2020-10-26 22:16:26 2023-10-27 16:16:26 2020-10-26 22:16:26
       5 2020-02-26 18:15:59 NA                  2020-02-26 18:15:59
       6 2020-10-26 22:16:26 2023-10-27 16:16:26 2020-10-26 22:16:26
       7 2020-08-28 20:42:09 2022-01-23 08:46:48 2020-08-28 20:42:09
       8 2020-02-26 18:15:59 NA                  2020-02-26 18:15:59
       9 2020-01-21 10:19:08 2021-10-16 19:37:36 2020-01-21 10:19:08
      10 2021-01-17 22:43:53 2024-01-18 16:43:53 2021-01-17 22:43:53
         TRT01EDTM           TRT02SDTM           TRT02EDTM          
         <dttm>              <dttm>              <dttm>             
       1 2022-10-27 10:16:26 2022-10-27 10:16:26 2023-10-27 16:16:26
       2 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53
       3 2020-09-08 14:09:38 2020-09-08 14:09:38 2021-09-08 20:09:38
       4 2022-10-27 10:16:26 2022-10-27 10:16:26 2023-10-27 16:16:26
       5 NA                  NA                  NA                 
       6 2022-10-27 10:16:26 2022-10-27 10:16:26 2023-10-27 16:16:26
       7 2021-01-23 02:46:48 2021-01-23 02:46:48 2022-01-23 08:46:48
       8 NA                  NA                  NA                 
       9 2020-10-16 13:37:36 2020-10-16 13:37:36 2021-10-16 19:37:36
      10 2023-01-18 10:43:53 2023-01-18 10:43:53 2024-01-18 16:43:53
         AP01SDTM            AP01EDTM            AP02SDTM           
         <dttm>              <dttm>              <dttm>             
       1 2020-10-26 22:16:26 2022-10-27 10:16:26 2022-10-27 10:16:26
       2 2021-01-17 22:43:53 2023-01-18 10:43:53 2023-01-18 10:43:53
       3 2020-05-02 02:28:45 2020-09-08 14:09:38 2020-09-08 14:09:38
       4 2020-10-26 22:16:26 2022-10-27 10:16:26 2022-10-27 10:16:26
       5 2020-02-26 18:15:59 NA                  NA                 
       6 2020-10-26 22:16:26 2022-10-27 10:16:26 2022-10-27 10:16:26
       7 2020-08-28 20:42:09 2021-01-23 02:46:48 2021-01-23 02:46:48
       8 2020-02-26 18:15:59 NA                  NA                 
       9 2020-01-21 10:19:08 2020-10-16 13:37:36 2020-10-16 13:37:36
      10 2021-01-17 22:43:53 2023-01-18 10:43:53 2023-01-18 10:43:53
         AP02EDTM            EOSSTT       EOTSTT       EOSDT      EOSDY DCSREAS      
         <dttm>              <fct>        <fct>        <date>     <int> <fct>        
       1 2023-10-27 16:16:26 COMPLETED    COMPLETED    2023-10-27  1096 <NA>         
       2 2024-01-18 16:43:53 COMPLETED    COMPLETED    2024-01-18  1096 <NA>         
       3 2021-09-08 20:09:38 DISCONTINUED DISCONTINUED 2021-09-08   495 DEATH        
       4 2023-10-27 16:16:26 COMPLETED    COMPLETED    2023-10-27  1096 <NA>         
       5 NA                  ONGOING      ONGOING      NA            NA <NA>         
       6 2023-10-27 16:16:26 COMPLETED    COMPLETED    2023-10-27  1096 <NA>         
       7 2022-01-23 08:46:48 DISCONTINUED DISCONTINUED 2022-01-23   513 ADVERSE EVENT
       8 NA                  ONGOING      ONGOING      NA            NA <NA>         
       9 2021-10-16 19:37:36 DISCONTINUED DISCONTINUED 2021-10-16   635 DEATH        
      10 2024-01-18 16:43:53 COMPLETED    COMPLETED    2024-01-18  1096 <NA>         
         DTHDT      DTHCAUS             DTHCAT              LDDTHELD LDDTHGR1
         <date>     <fct>               <fct>                  <int> <fct>   
       1 NA         <NA>                <NA>                      NA <NA>    
       2 NA         <NA>                <NA>                      NA <NA>    
       3 2021-09-27 ADVERSE EVENT       ADVERSE EVENT             19 <=30    
       4 NA         <NA>                <NA>                      NA <NA>    
       5 NA         <NA>                <NA>                      NA <NA>    
       6 NA         <NA>                <NA>                      NA <NA>    
       7 NA         <NA>                <NA>                      NA <NA>    
       8 NA         <NA>                <NA>                      NA <NA>    
       9 2021-11-23 DISEASE PROGRESSION PROGRESSIVE DISEASE       38 >30     
      10 NA         <NA>                <NA>                      NA <NA>    
         LSTALVDT   DTHADY ADTHAUT  ASEQ VSSEQ VSTESTCD VSTEST                  
         <date>      <int> <fct>   <int> <int> <fct>    <fct>                   
       1 2023-11-13     NA <NA>       22    22 SYSBP    Systolic Blood Pressure 
       2 2024-02-10     NA <NA>        3     3 RESP     Respiratory Rate        
       3 2021-09-27    512 Yes        24    24 WEIGHT   Weight                  
       4 2023-11-13     NA <NA>       18    18 WEIGHT   Weight                  
       5 NA             NA <NA>        7     7 DIABP    Diastolic Blood Pressure
       6 2023-11-13     NA <NA>       42    42 WEIGHT   Weight                  
       7 2022-02-12     NA <NA>       10    10 SYSBP    Systolic Blood Pressure 
       8 NA             NA <NA>       32    32 PULSE    Pulse Rate              
       9 2021-11-23    671 Yes        14    14 PULSE    Pulse Rate              
      10 2024-02-10     NA <NA>       12    12 WEIGHT   Weight                  
         VSCAT       VSSTRESC ASPID PARAM                    PARAMCD  AVAL AVALU      
         <fct>       <chr>    <int> <fct>                    <fct>   <dbl> <fct>      
       1 VITAL SIGNS >180       311 Systolic Blood Pressure  SYSBP   122.  Pa         
       2 VITAL SIGNS >20         98 Respiratory Rate         RESP     15.4 breaths/min
       3 VITAL SIGNS <40        239 Weight                   WEIGHT   44.8 Kg         
       4 VITAL SIGNS <40         77 Weight                   WEIGHT   78.4 Kg         
       5 VITAL SIGNS <80        129 Diastolic Blood Pressure DIABP    85.1 Pa         
       6 VITAL SIGNS <40         47 Weight                   WEIGHT   47.0 Kg         
       7 VITAL SIGNS >180       103 Systolic Blood Pressure  SYSBP   125.  Pa         
       8 VITAL SIGNS <60        143 Pulse Rate               PULSE    86.4 beats/min  
       9 VITAL SIGNS <60         19 Pulse Rate               PULSE    74.1 beats/min  
      10 VITAL SIGNS <40        348 Weight                   WEIGHT  113.  Kg         
         BASE2  BASE BASETYPE ABLFL2 ABLFL   CHG2  PCHG2    CHG   PCHG DTYPE ANRIND
         <dbl> <dbl> <fct>    <fct>  <fct>  <dbl>  <dbl>  <dbl>  <dbl> <fct> <fct> 
       1 138.  157.  LAST     ""     ""    -16.0  -11.6  -35.0  -22.3  <NA>  NORMAL
       2  15.4  NA   LAST     "Y"    ""      0      0     NA     NA    <NA>  NORMAL
       3  64.0  38.7 LAST     ""     ""    -19.3  -30.1    6.03  15.6  <NA>  NORMAL
       4  60.0  69.4 LAST     ""     ""     18.4   30.6    8.99  13.0  <NA>  NORMAL
       5 107.   85.1 LAST     ""     "Y"   -21.5  -20.1    0      0    <NA>  NORMAL
       6  60.0  69.4 LAST     ""     ""    -13.0  -21.7  -22.4  -32.3  <NA>  NORMAL
       7 163.  125.  LAST     ""     "Y"   -38.3  -23.4    0      0    <NA>  NORMAL
       8  88.9 137.  LAST     ""     ""     -2.53  -2.85 -50.8  -37.0  <NA>  NORMAL
       9  79.6  81.7 LAST     ""     ""     -5.55  -6.97  -7.59  -9.30 <NA>  NORMAL
      10  42.1 113.  LAST     ""     "Y"    71.4  170.     0      0    <NA>  HIGH  
         BNRIND ADTM                  ADY ATPTN AVISIT        AVISITN LOQFL ONTRTFL
         <fct>  <dttm>              <int> <int> <fct>           <int> <fct> <fct>  
       1 NORMAL 2022-04-14 22:16:26   535     1 WEEK 2 DAY 15       2 N     "Y"    
       2 NORMAL 2021-04-29 22:43:53   102     1 SCREENING          -1 N     ""     
       3 LOW    2020-10-31 02:28:45   182     1 WEEK 2 DAY 15       2 N     "Y"    
       4 NORMAL 2022-04-05 22:16:26   526     1 WEEK 1 DAY 8        1 N     "Y"    
       5 NORMAL 2020-04-30 18:15:59    64     1 BASELINE            0 N     ""     
       6 NORMAL 2023-01-13 22:16:26   809     1 WEEK 5 DAY 36       5 N     "Y"    
       7 NORMAL 2020-11-08 20:42:09    72     1 BASELINE            0 N     ""     
       8 HIGH   2021-02-18 18:15:59   358     1 WEEK 4 DAY 29       4 N     "Y"    
       9 NORMAL 2020-06-20 10:19:08   151     1 WEEK 1 DAY 8        1 N     "Y"    
      10 HIGH   2021-06-26 22:43:53   160     1 BASELINE            0 N     ""     
         ANRLO ANRHI
         <dbl> <dbl>
       1   120   180
       2    12    20
       3    40   100
       4    40   100
       5    80   120
       6    40   100
       7   120   180
       8    60   100
       9    60   100
      10    40   100

