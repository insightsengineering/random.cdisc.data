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
      # A tibble: 30 x 72
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
         LSTALVDT   DTHADY ADTHAUT NFRLT AFRLT NRRLT ARRLT PCTPTNUM PCTPT    PCVOL
         <date>      <int> <fct>   <dbl> <dbl> <dbl> <dbl>    <dbl> <fct>    <dbl>
       1 2024-02-10     NA <NA>      0     0     0     0        0   Predose    NA 
       2 2024-02-10     NA <NA>      0.5   0.5   0.5   0.5      0.5 0.5H       NA 
       3 2024-02-10     NA <NA>      1     1     1     1        1   1H         NA 
       4 2024-02-10     NA <NA>      1.5   1.5   1.5   1.5      1.5 1.5H       NA 
       5 2024-02-10     NA <NA>      2     2     2     2        2   2H         NA 
       6 2024-02-10     NA <NA>      3     3     3     3        3   3H         NA 
       7 2024-02-10     NA <NA>      4     4     4     4        4   4H         NA 
       8 2024-02-10     NA <NA>      8     8     8     8        8   8H         NA 
       9 2024-02-10     NA <NA>     12    12    12    12       12   12H        NA 
      10 2024-02-10     NA <NA>      0     0     0     0        0   Predose    NA 
      11 2024-02-10     NA <NA>      0.5   0.5   0.5   0.5      0.5 0.5H       NA 
      12 2024-02-10     NA <NA>      1     1     1     1        1   1H         NA 
      13 2024-02-10     NA <NA>      1.5   1.5   1.5   1.5      1.5 1.5H       NA 
      14 2024-02-10     NA <NA>      2     2     2     2        2   2H         NA 
      15 2024-02-10     NA <NA>      3     3     3     3        3   3H         NA 
      16 2024-02-10     NA <NA>      4     4     4     4        4   4H         NA 
      17 2024-02-10     NA <NA>      8     8     8     8        8   8H         NA 
      18 2024-02-10     NA <NA>     12    12    12    12       12   12H        NA 
      19 2024-02-10     NA <NA>      0     0     0     0        0   Predose  1122.
      20 2024-02-10     NA <NA>      4     4     4     4        4   0H - 4H   152.
      21 2024-02-10     NA <NA>      8     8     8     8        8   4H - 8H   370.
      22 2024-02-10     NA <NA>     12    12    12    12       12   8H - 12H  605.
      23 2024-02-10     NA <NA>      0     0     0     0        0   Predose  1122.
      24 2024-02-10     NA <NA>      4     4     4     4        4   0H - 4H   152.
      25 2024-02-10     NA <NA>      8     8     8     8        8   4H - 8H   370.
      26 2024-02-10     NA <NA>     12    12    12    12       12   8H - 12H  605.
      27 2024-02-10     NA <NA>     24    24     0     0       24   24H        NA 
      28 2024-02-10     NA <NA>     24    24     0     0       24   24H        NA 
      29 2024-02-10     NA <NA>     24    24     0     0       24   0H - 24H 1055.
      30 2024-02-10     NA <NA>     24    24     0     0       24   0H - 24H 1055.
         PCVOLU   AVAL AVALCAT1 AVALU RELTMU PARAM         ASMED  VISIT VISITDY
         <fct>   <dbl> <chr>    <fct> <fct>  <fct>         <fct>  <fct>   <int>
       1 ""      0     BLQ      ug/mL hr     Plasma Drug X PLASMA Day 1       1
       2 ""     15.3   15.3     ug/mL hr     Plasma Drug X PLASMA Day 1       1
       3 ""     19.2   19.205   ug/mL hr     Plasma Drug X PLASMA Day 1       1
       4 ""     18.1   18.082   ug/mL hr     Plasma Drug X PLASMA Day 1       1
       5 ""     15.1   15.136   ug/mL hr     Plasma Drug X PLASMA Day 1       1
       6 ""      8.95  8.953    ug/mL hr     Plasma Drug X PLASMA Day 1       1
       7 ""      4.71  4.71     ug/mL hr     Plasma Drug X PLASMA Day 1       1
       8 ""      0.23  0.23     ug/mL hr     Plasma Drug X PLASMA Day 1       1
       9 ""      0.008 0.008    ug/mL hr     Plasma Drug X PLASMA Day 1       1
      10 ""      0     BLQ      ug/mL hr     Plasma Drug Y PLASMA Day 1       1
      11 ""     30.6   30.6     ug/mL hr     Plasma Drug Y PLASMA Day 1       1
      12 ""     38.4   38.409   ug/mL hr     Plasma Drug Y PLASMA Day 1       1
      13 ""     36.2   36.164   ug/mL hr     Plasma Drug Y PLASMA Day 1       1
      14 ""     30.3   30.272   ug/mL hr     Plasma Drug Y PLASMA Day 1       1
      15 ""     17.9   17.905   ug/mL hr     Plasma Drug Y PLASMA Day 1       1
      16 ""      9.42  9.419    ug/mL hr     Plasma Drug Y PLASMA Day 1       1
      17 ""      0.459 0.459    ug/mL hr     Plasma Drug Y PLASMA Day 1       1
      18 ""      0.017 0.017    ug/mL hr     Plasma Drug Y PLASMA Day 1       1
      19 "mL"    0     BLQ      ug/mL hr     Urine Drug X  URINE  Day 1       1
      20 "mL"    4.71  4.71     ug/mL hr     Urine Drug X  URINE  Day 1       1
      21 "mL"    0.23  0.23     ug/mL hr     Urine Drug X  URINE  Day 1       1
      22 "mL"    0.008 0.008    ug/mL hr     Urine Drug X  URINE  Day 1       1
      23 "mL"    0     BLQ      ug/mL hr     Urine Drug Y  URINE  Day 1       1
      24 "mL"    4.71  4.71     ug/mL hr     Urine Drug Y  URINE  Day 1       1
      25 "mL"    0.23  0.23     ug/mL hr     Urine Drug Y  URINE  Day 1       1
      26 "mL"    0.008 0.008    ug/mL hr     Urine Drug Y  URINE  Day 1       1
      27 ""      0     BLQ      ug/mL hr     Plasma Drug X PLASMA Day 2       2
      28 ""      0     BLQ      ug/mL hr     Plasma Drug Y PLASMA Day 2       2
      29 "mL"    0     BLQ      ug/mL hr     Urine Drug X  URINE  Day 2       2
      30 "mL"    0     BLQ      ug/mL hr     Urine Drug Y  URINE  Day 2       2
         ANL02FL
         <chr>  
       1 Y      
       2 Y      
       3 Y      
       4 Y      
       5 Y      
       6 Y      
       7 Y      
       8 Y      
       9 Y      
      10 Y      
      11 Y      
      12 Y      
      13 Y      
      14 Y      
      15 Y      
      16 Y      
      17 Y      
      18 Y      
      19 Y      
      20 Y      
      21 Y      
      22 Y      
      23 Y      
      24 Y      
      25 Y      
      26 Y      
      27 Y      
      28 Y      
      29 Y      
      30 Y      

---

    Code
      rand_rows
    Output
      # A tibble: 10 x 72
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
         DTHCAUS DTHCAT LDDTHELD LDDTHGR1 LSTALVDT   DTHADY ADTHAUT NFRLT AFRLT NRRLT
         <fct>   <fct>     <int> <fct>    <date>      <int> <fct>   <dbl> <dbl> <dbl>
       1 <NA>    <NA>         NA <NA>     2022-10-30     NA <NA>     24    24     0  
       2 <NA>    <NA>         NA <NA>     2022-10-30     NA <NA>      4     4     4  
       3 <NA>    <NA>         NA <NA>     2023-07-10     NA <NA>      8     8     8  
       4 <NA>    <NA>         NA <NA>     2023-07-10     NA <NA>      4     4     4  
       5 <NA>    <NA>         NA <NA>     2023-07-10     NA <NA>      4     4     4  
       6 <NA>    <NA>         NA <NA>     NA             NA <NA>      3     3     3  
       7 <NA>    <NA>         NA <NA>     2024-02-10     NA <NA>      0.5   0.5   0.5
       8 <NA>    <NA>         NA <NA>     2022-10-09     NA <NA>     12    12    12  
       9 <NA>    <NA>         NA <NA>     2023-11-13     NA <NA>      4     4     4  
      10 <NA>    <NA>         NA <NA>     2022-10-09     NA <NA>      8     8     8  
         ARRLT PCTPTNUM PCTPT    PCVOL PCVOLU   AVAL AVALCAT1 AVALU RELTMU
         <dbl>    <dbl> <fct>    <dbl> <fct>   <dbl> <chr>    <fct> <fct> 
       1   0       24   24H       NA   ""      0     BLQ      ug/mL hr    
       2   4        4   0H - 4H  120.  "mL"    5.27  5.269    ug/mL hr    
       3   8        8   4H - 8H  236.  "mL"    0.665 0.665    ug/mL hr    
       4   4        4   0H - 4H   97.1 "mL"    6.11  6.106    ug/mL hr    
       5   4        4   4H        NA   ""      6.11  6.106    ug/mL hr    
       6   3        3   3H        NA   ""      9.11  9.113    ug/mL hr    
       7   0.5      0.5 0.5H      NA   ""     15.3   15.3     ug/mL hr    
       8  12       12   8H - 12H 528.  "mL"    0.005 0.005    ug/mL hr    
       9   4        4   0H - 4H  117.  "mL"    4.37  4.371    ug/mL hr    
      10   8        8   8H        NA   ""      0.151 0.151    ug/mL hr    
         PARAM         ASMED  VISIT VISITDY ANL02FL
         <fct>         <fct>  <fct>   <int> <chr>  
       1 Plasma Drug X PLASMA Day 2       2 Y      
       2 Urine Drug X  URINE  Day 1       1 Y      
       3 Urine Drug X  URINE  Day 1       1 Y      
       4 Urine Drug Y  URINE  Day 1       1 Y      
       5 Plasma Drug X PLASMA Day 1       1 Y      
       6 Plasma Drug X PLASMA Day 1       1 Y      
       7 Plasma Drug X PLASMA Day 1       1 Y      
       8 Urine Drug X  URINE  Day 1       1 Y      
       9 Urine Drug X  URINE  Day 1       1 Y      
      10 Plasma Drug X PLASMA Day 1       1 Y      

# radab produces expected values

    Code
      first_pt_rows
    Output
      # A tibble: 26 x 21
         STUDYID USUBJID            ARM       ACTARM    ISTPT    AVAL
         <chr>   <chr>              <fct>     <fct>     <fct>   <dbl>
       1 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X Predose 1.04 
       2 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X 24H     1.08 
       3 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X Predose 1    
       4 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X 24H     1    
       5 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X Predose 1.04 
       6 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X 24H     1.08 
       7 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X Predose 1    
       8 AB12345 AB12345-JPN-4-id-7 A: Drug X A: Drug X 24H     1    
       9 AB12345 AB12345-JPN-4-id-7 <NA>      <NA>      <NA>    1    
      10 AB12345 AB12345-JPN-4-id-7 <NA>      <NA>      <NA>    0    
      11 AB12345 AB12345-JPN-4-id-7 <NA>      <NA>      <NA>    0    
      12 AB12345 AB12345-JPN-4-id-7 <NA>      <NA>      <NA>    1    
      13 AB12345 AB12345-JPN-4-id-7 <NA>      <NA>      <NA>    1    
      14 AB12345 AB12345-JPN-4-id-7 <NA>      <NA>      <NA>    0    
      15 AB12345 AB12345-JPN-4-id-7 <NA>      <NA>      <NA>    0    
      16 AB12345 AB12345-JPN-4-id-7 <NA>      <NA>      <NA>    1    
      17 AB12345 AB12345-JPN-4-id-7 <NA>      <NA>      <NA>    1    
      18 AB12345 AB12345-JPN-4-id-7 <NA>      <NA>      <NA>    1    
      19 AB12345 AB12345-JPN-4-id-7 <NA>      <NA>      <NA>    0    
      20 AB12345 AB12345-JPN-4-id-7 <NA>      <NA>      <NA>    0    
      21 AB12345 AB12345-JPN-4-id-7 <NA>      <NA>      <NA>    1    
      22 AB12345 AB12345-JPN-4-id-7 <NA>      <NA>      <NA>    0    
      23 AB12345 AB12345-JPN-4-id-7 <NA>      <NA>      <NA>    1    
      24 AB12345 AB12345-JPN-4-id-7 <NA>      <NA>      <NA>    1    
      25 AB12345 AB12345-JPN-4-id-7 <NA>      <NA>      <NA>    0    
      26 AB12345 AB12345-JPN-4-id-7 <NA>      <NA>      <NA>    0.143
         AVALC             AVALU  
         <chr>             <fct>  
       1 POSITIVE          "titer"
       2 POSITIVE          "titer"
       3 POSITIVE          ""     
       4 POSITIVE          ""     
       5 POSITIVE          "titer"
       6 POSITIVE          "titer"
       7 POSITIVE          ""     
       8 POSITIVE          ""     
       9 POSITIVE          ""     
      10 N                 ""     
      11 N                 ""     
      12 Y                 ""     
      13 Y                 ""     
      14 N                 ""     
      15 N                 ""     
      16 Y                 ""     
      17 POSITIVE          ""     
      18 POSITIVE          "weeks"
      19 N                 "weeks"
      20 N                 ""     
      21 Y                 ""     
      22 N                 ""     
      23 POSITIVE          ""     
      24 Y                 ""     
      25 0                 ""     
      26 0.142857142857143 ""     
         PARAM                                                PARAMCD  VISIT VISITDY
         <fct>                                                <fct>    <fct>   <int>
       1 Antibody titer units                                 R1800000 Day 1       1
       2 Antibody titer units                                 R1800000 Day 2       2
       3 ADA interpreted per sample result                    RESULT1  Day 1       1
       4 ADA interpreted per sample result                    RESULT1  Day 2       2
       5 Neutralizing Antibody titer units                    R1800001 Day 1       1
       6 Neutralizing Antibody titer units                    R1800001 Day 2       2
       7 NAB interpreted per sample result                    RESULT2  Day 1       1
       8 NAB interpreted per sample result                    RESULT2  Day 2       2
       9 ADA Status of a patient                              ADASTAT1 <NA>       NA
      10 Treatment induced ADA                                INDUCD1  <NA>       NA
      11 Treatment enhanced ADA                               ENHANC1  <NA>       NA
      12 Treatment unaffected                                 TRUNAFF1 <NA>       NA
      13 Treatment Emergent - Negative                        EMERNEG1 <NA>       NA
      14 Treatment Emergent - Positive                        EMERPOS1 <NA>       NA
      15 Persistent ADA                                       PERSADA1 <NA>       NA
      16 Transient ADA                                        TRANADA1 <NA>       NA
      17 Baseline                                             BFLAG1   <NA>       NA
      18 NAB Status of a patient                              TIMADA1  <NA>       NA
      19 Treatment induced ADA, Neutralizing Antibody         ADADUR1  <NA>       NA
      20 Treatment enhanced ADA, Neutralizing Antibody        ADASTAT2 <NA>       NA
      21 Treatment Emergent - Negative, Neutralizing Antibody INDUCD2  <NA>       NA
      22 Treatment Emergent - Positive, Neutralizing Antibody ENHANC2  <NA>       NA
      23 Baseline, Neutralizing Antibody                      EMERNEG2 <NA>       NA
      24 Treatment unaffected, Neutralizing Antibody          EMERPOS2 <NA>       NA
      25 Time to onset of ADA                                 BFLAG2   <NA>       NA
      26 ADA Duration                                         TRUNAFF2 <NA>       NA
         PARCAT1                         ADABLPFL ADPBLPFL ABLFL RELTMU NFRLT AFRLT
         <fct>                           <fct>    <fct>    <fct> <fct>  <dbl> <dbl>
       1 A: Drug X Antibody              <NA>     <NA>     Y     day        0     0
       2 A: Drug X Antibody              <NA>     <NA>     <NA>  day        1     1
       3 A: Drug X Antibody              Y        <NA>     Y     day        0     0
       4 A: Drug X Antibody              <NA>     Y        <NA>  day        1     1
       5 A: Drug X Antibody              <NA>     <NA>     Y     day        0     0
       6 A: Drug X Antibody              <NA>     <NA>     <NA>  day        1     1
       7 A: Drug X Antibody              <NA>     <NA>     Y     day        0     0
       8 A: Drug X Antibody              <NA>     <NA>     <NA>  day        1     1
       9 A: Drug X Antibody              <NA>     <NA>     <NA>  day       NA    NA
      10 A: Drug X Antibody              <NA>     <NA>     <NA>  day       NA    NA
      11 A: Drug X Antibody              <NA>     <NA>     <NA>  day       NA    NA
      12 A: Drug X Antibody              <NA>     <NA>     <NA>  day       NA    NA
      13 A: Drug X Antibody              <NA>     <NA>     <NA>  day       NA    NA
      14 A: Drug X Antibody              <NA>     <NA>     <NA>  day       NA    NA
      15 A: Drug X Antibody              <NA>     <NA>     <NA>  day       NA    NA
      16 A: Drug X Antibody              <NA>     <NA>     <NA>  day       NA    NA
      17 A: Drug X Antibody              <NA>     <NA>     <NA>  day       NA    NA
      18 A: Drug X Neutralizing Antibody <NA>     <NA>     <NA>  day       NA    NA
      19 A: Drug X Neutralizing Antibody <NA>     <NA>     <NA>  day       NA    NA
      20 A: Drug X Neutralizing Antibody <NA>     <NA>     <NA>  day       NA    NA
      21 A: Drug X Neutralizing Antibody <NA>     <NA>     <NA>  day       NA    NA
      22 A: Drug X Neutralizing Antibody <NA>     <NA>     <NA>  day       NA    NA
      23 A: Drug X Antibody              <NA>     <NA>     <NA>  day       NA    NA
      24 A: Drug X Neutralizing Antibody <NA>     <NA>     <NA>  day       NA    NA
      25 A: Drug X Antibody              <NA>     <NA>     <NA>  day       NA    NA
      26 A: Drug X Antibody              <NA>     <NA>     <NA>  day       NA    NA
         NRRLT ARRLT
         <dbl> <dbl>
       1     0     0
       2     0     0
       3     0     0
       4     0     0
       5     0     0
       6     0     0
       7     0     0
       8     0     0
       9    NA    NA
      10    NA    NA
      11    NA    NA
      12    NA    NA
      13    NA    NA
      14    NA    NA
      15    NA    NA
      16    NA    NA
      17    NA    NA
      18    NA    NA
      19    NA    NA
      20    NA    NA
      21    NA    NA
      22    NA    NA
      23    NA    NA
      24    NA    NA
      25    NA    NA
      26    NA    NA

---

    Code
      rand_rows
    Output
      # A tibble: 10 x 21
         STUDYID USUBJID             ARM            ACTARM         ISTPT     AVAL
         <chr>   <chr>               <fct>          <fct>          <fct>    <dbl>
       1 AB12345 AB12345-USA-13-id-3 <NA>           <NA>           <NA>     0    
       2 AB12345 AB12345-CHN-3-id-5  A: Drug X      A: Drug X      24H     NA    
       3 AB12345 AB12345-BRA-9-id-8  <NA>           <NA>           <NA>     1    
       4 AB12345 AB12345-CHN-11-id-1 C: Combination C: Combination 24H     NA    
       5 AB12345 AB12345-BRA-9-id-8  <NA>           <NA>           <NA>     0    
       6 AB12345 AB12345-CHN-3-id-5  A: Drug X      A: Drug X      Predose  1    
       7 AB12345 AB12345-BRA-1-id-9  <NA>           <NA>           <NA>     0.143
       8 AB12345 AB12345-CHN-11-id-1 <NA>           <NA>           <NA>     0    
       9 AB12345 AB12345-USA-13-id-3 <NA>           <NA>           <NA>     1    
      10 AB12345 AB12345-JPN-4-id-7  <NA>           <NA>           <NA>     1    
         AVALC             AVALU   PARAM                                        
         <chr>             <fct>   <fct>                                        
       1 N                 ""      Treatment enhanced ADA, Neutralizing Antibody
       2 NEGATIVE          "titer" Antibody titer units                         
       3 POSITIVE          ""      Baseline                                     
       4 NEGATIVE          "titer" Neutralizing Antibody titer units            
       5 N                 "weeks" Treatment induced ADA, Neutralizing Antibody 
       6 POSITIVE          ""      ADA interpreted per sample result            
       7 0.142857142857143 ""      Time to onset of ADA                         
       8 N                 ""      Persistent ADA                               
       9 Y                 ""      Treatment Emergent - Negative                
      10 POSITIVE          ""      ADA Status of a patient                      
         PARAMCD  VISIT VISITDY PARCAT1                         ADABLPFL ADPBLPFL
         <fct>    <fct>   <int> <fct>                           <fct>    <fct>   
       1 ADASTAT2 <NA>       NA A: Drug X Neutralizing Antibody <NA>     <NA>    
       2 R1800000 Day 2       2 A: Drug X Antibody              <NA>     <NA>    
       3 BFLAG1   <NA>       NA A: Drug X Antibody              <NA>     <NA>    
       4 R1800001 Day 2       2 A: Drug X Antibody              <NA>     <NA>    
       5 ADADUR1  <NA>       NA A: Drug X Neutralizing Antibody <NA>     <NA>    
       6 RESULT1  Day 1       1 A: Drug X Antibody              Y        <NA>    
       7 BFLAG2   <NA>       NA A: Drug X Antibody              <NA>     <NA>    
       8 PERSADA1 <NA>       NA A: Drug X Antibody              <NA>     <NA>    
       9 EMERNEG1 <NA>       NA A: Drug X Antibody              <NA>     <NA>    
      10 ADASTAT1 <NA>       NA A: Drug X Antibody              <NA>     <NA>    
         ABLFL RELTMU NFRLT AFRLT NRRLT ARRLT
         <fct> <fct>  <dbl> <dbl> <dbl> <dbl>
       1 <NA>  day       NA    NA    NA    NA
       2 <NA>  day        1     1     0     0
       3 <NA>  day       NA    NA    NA    NA
       4 <NA>  day        1     1     0     0
       5 <NA>  day       NA    NA    NA    NA
       6 Y     day        0     0     0     0
       7 <NA>  day       NA    NA    NA    NA
       8 <NA>  day       NA    NA    NA    NA
       9 <NA>  day       NA    NA    NA    NA
      10 <NA>  day       NA    NA    NA    NA

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

