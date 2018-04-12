       identification division.
       program-id. AVG1.

       environment division.
      I
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       
       LINKAGE SECTION.
       01 PASSED-DATA.
           05 A-NAME           PIC X(20).
           05 A-GRADE1         PIC 999.
           05 A-GRADE2         PIC 999.
           05 A-GRADE3         PIC 999.
           05 A-AVG            PIC 999.
           

       procedure division.
       100-MAIN. 
           COMPUTE A-AVG = A-GRADE1 +
                           A-GRADE2 +
                           A-GRADE3
           COMPUTE A-AVG = A-AVG / 3
           
           
       EXIT PROGRAM.

       
