       program-id. Program1 as "TEST GRADES".
      ***************************************************************
      * THIS PROGRAM IS DESIGNED TO READ IN A STUDENT'S GRADES FROM * 
      * AN INPUT FILE, CALCULATE THE AVERAGE USING A CALLED PROGRAM *
      * AND THEN PRINT OUT A REPORT                                 *
      *************************************************************** 
        
        
        
       INPUT-OUTPUT SECTION.
       file-control.
           select INPUT-FILE ASSIGN TO "GRADE-FILE.TXT"
                   ORGANIZATION IS LINE SEQUENTIAL.
           select OUTPUT-FILE ASSIGN TO "OUTPUT.TXT"
                   ORGANIZATION IS LINE SEQUENTIAL.
       
       configuration section.
       
       data division.
       File Section.
       FD input-file.
       01 input-rec.
           05 NAME         PIC X(20).
           05 GRADE1       PIC 999.
           05 GRADE2       PIC 999.
           05 GRADE3       PIC 999.
       
       FD OUTPUT-FILE.
       01 OUTPUT-REC       PIC X(32).
       
       working-storage section.
       01 EOF              PIC X VALUE "N".
       
       
      ************************************************************
      * THIS PASSED-DATA INCLUDES AN FIELD TO RETURN THE AVERAGE *
      ************************************************************
       01 PASSED-DATA.
           05 P-GRADE1       PIC 999.
           05 P-GRADE2       PIC 999.
           05 P-GRADE3       PIC 999.
           05 P-AVG          PIC 999.
           
       01 HEADER1.
           05 FILLER         PIC X(9) VALUE SPACES.
           05 FILLER           PIC X(12) VALUE "GRADE REPORT".
           
       01 HEADER2.
           05 FILLER           PIC X(9) VALUE SPACES.
           05 FILLER           PIC X(4) VALUE "NAME".
           05 FILLER           PIC X(11) VALUE SPACES.
           05 FILLER           PIC X(7) VALUE "AVERAGE".
           
       01 STUDENT-REC.
           05 FILLER           PIC X VALUE SPACES.
           05 S-NAME           PIC X(20).
           05 FILLER           PIC X(5) VALUE SPACES.
           05 S-AVG            PIC 999.
           
       procedure division.
       
       
       100-MAIN.
           open INPUT input-file
               OUTPUT OUTPUT-FILE.
               
           PERFORM 200-HEADER
           
           PERFORM UNTIL EOF = "Y"
           READ INPUT-FILE
           AT END
                MOVE "Y" TO EOF
                    NOT AT END
                    PERFORM 300-PROCESS
            
               END-READ
            END-PERFORM.
            CLOSE INPUT-FILE
                   OUTPUT-FILE
           STOP RUN.
           
       200-HEADER.
           WRITE REPORT-REC FROM HEADER1
           MOVE SPACES TO REPORT-REC
           WRITE REPORT-REC
           WRITE REPORT-REC FROM HEADER2
           MOVE SPACES TO REPORT-REC
           WRITE REPORT-REC.
       
           
      ***************************************************************
      * THIS MOVES A STUDENT'S DATA TO THE PASSED-DATA FIELDS AND   * 
      * CALLS THE PROGRAM TO CALCULATE THE AVERAGE GRADE, WHICH IS  *
      * PASSED BACK TO THE MAIN PROGRAM                             *
      ***************************************************************
       300-PROCESS.
           MOVE GRADE1 TO P-GRADE1
           MOVE GRADE2 TO P-GRADE2
           move grade3 to p-grade3
           
           CALL "AVG1" USING PASSED-DATA
           
           MOVE NAME TO S-NAME
           MOVE P-AVG TO S-AVG
           WRITE REPORT-REC FROM STUDENT-REC.
           

           goback.
           
       end program Program1.
