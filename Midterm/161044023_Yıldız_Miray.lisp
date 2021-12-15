; *********************************************
; *  341 Programming Languages                *
; *  Fall 2020                                *
; *  Midterm                                  *
; *  Miray Yildiz                             *
; *********************************************

(setq upperCaSe '(#\A #\B #\C #\D #\E #\F #\G #\H #\I #\J #\K #\L #\M #\N #\O #\P #\Q #\R #\S #\T #\U #\V #\W #\X #\Y #\Z ))
(setq lowerCase '(#\a #\b #\c #\d #\e #\f #\g #\h #\i #\j #\k #\l #\m #\n #\o #\p #\q #\r #\s #\t #\u #\v #\w #\x #\y #\z ))
(setq numbers '(0 1 2 3 4 5 6 7 8 9))



; This function read numbers from file and adds numbers to the list. 
(defun file-get-contents (filename)
  (with-open-file (stream filename)
    (let ((contents (make-string (file-length stream))))
      (read-sequence contents stream)
      contents)))


(defun convert (filename)
  (setq mylist (read-from-string (string (file-get-contents filename))))
  mylist

)




(defun find-solution(filename)
  (setq mylist (convert "input.txt"))
  (setq tempp mylist)
  (setq predicate '())
  (setq fact '())
  (setq query '())
  (setq fact2 '())
  (setq flag 0)
  (setq flag1 0)
  (setq returnp 0)
  
  (loop for i from 1 to (list-length tempp) do
    (setq temp (car tempp))
    (if (and (not (equal (nth 0 temp) nil)) (equal (nth 1 temp) nil))
      (setq fact (append fact (list temp)))
    )
    (if (and (not (equal (nth 1 temp) nil)) (equal (nth 0 temp) nil))
      (setq query (append query  temp))
    )
    (if (and (not (equal (nth 0 temp) nil)) (not (equal (nth 1 temp) nil)))
      (progn

      (setq predicate (append predicate (list temp)))
      )
    )
    (setq tempp (cdr tempp))
   
  )
  (setq querh (nth 1 query))
  (setq head (nth 0 querh))
  (setq parameters (nth 1 querh))

  (if (and (equal predicate '()) (not (equal fact '())))
    (progn
      (setq newfacts '())
      (setq temp fact)
      (loop for i from 0 to (list-length fact) do
        (setq a (car temp))
        (setq newfacts (append (list(nth 0 a)) newfacts))
        (setq temp (cdr temp))
      )
      (terpri)
      (setq firstk (nth 1 query))

      (loop for j from 0 to (list-length newfacts) do
        (if (equal firstk (nth j newfacts))
          (progn
          (setq returnp 1)
          )
        )
      )
    )
  )

  (if (and (equal fact '()) (not (equal predicate '())))
    (progn
      (setq temppre predicate)
      (setq prefact '())
     ;; (write predicate)
      (loop for i from 0 to (list-length predicate) do
        (setq temp1 (nth i predicate))
        (setq temp2 (nth 1 temp1))
        (setq len (list-length temp2))
        (loop for j from 0 to len do
          (setq prefact (append (list (nth j temp2)) prefact))
        )
      )
      (setq firstk (nth 1 query))
      (setq name (nth 0 firstk))
      (setq inner (nth 1 firstk))
      (loop for j from 0 to (list-length prefact) do
        (if (not(equal (nth j prefact) nil))
          (progn
            (setq inner2 (nth j prefact))
            (if (equal (car inner2) name)
              (progn
                 (setq len1 (list-length(nth 1 inner2)))


                 (if (= len1 1)
                  (progn
                    (setq inner3 (car (nth 1 inner2)))

                    (if (or(equal inner3 "A")(equal inner3 "B")(equal inner3 "C")(equal inner3 "D")(equal inner3 "E")(equal inner3 "F")(equal inner3 "G")(equal inner3 "H")(equal inner3 "I")
                      (equal inner3 "J")(equal inner3 "K")(equal inner3 "L")(equal inner3 "M")(equal inner3 "N")(equal inner3 "O")(equal inner3 "P")(equal inner3 "R")(equal inner3 "S")(equal inner3 "T")
                      (equal inner3 "U")(equal inner3 "V")(equal inner3 "Y")(equal inner3 "Z")(equal inner3 "W")(equal inner3 "X"))
                      (progn
                      (setq returnp 1)
                      )
                    )
                  )
                )
                (if (= len1 2)
                  (progn
                    (setq inner3 (car (list (nth 1 inner2))))
                  
           
                    (loop for h from 0 to (- (list-length inner3) 1) do
                      (loop for p from 0 to (- (list-length inner) 1) do
                        (setq first (nth h inner3))
                        (setq second (nth p inner))
                   
                        (if (and(find first numbers)(find second numbers)(= first second))
                          (progn
                            (setq returnp 1)
                     
                          )
                        )
                        
                      )
                    )
                  )
                )

              )
          )
        )
      )
      )
      
    )
  )
  




  (if(and (not (equal predicate '()))(not (equal fact '())))
    (progn
      (setq predi predicate)

      (loop for i from 1 to (list-length predicate) do
        (setq mytemp (car predi))
        (setq temp3 (car mytemp))
        (setq temp2 (car temp3))

        (if(equal temp2 head)
          (progn
            (setq inner (nth 1 temp3))
            (loop for j from 0 to (- (list-length inner) 1) do 
              (if (find (nth j inner) parameters)
                (setq fact2 (append fact2 (nth 1 mytemp)))
              )

            )
          )

        )  

        (setq predi (cdr predi))
        (setq mytemp '())
        (setq temp3 '())
        (setq temp2 '())
      )
      
      (setq tempfact2 fact2)
      (setq tempfact fact)
      (loop for i from 1 to (list-length fact) do 
        (setq mytemp (car tempfact))
        (setq temp2 (car mytemp))
        (setq len1 (list-length mytemp))
        (loop for j from 1 to len1 do
          (setq str (car temp2))
          (loop for k from 0 to (- (list-length tempfact2) 1) do
            (setq inner (nth k tempfact2))
            (setq len (list-length(nth 1 inner)))
            (setq inner2 (car inner))
           
            (if (equal inner2 str)
              (progn
                (if (= len 1)
                  (progn
                    (setq inner3 (car (nth 1 inner)))

                    (if (or(equal inner3 "A")(equal inner3 "B")(equal inner3 "C")(equal inner3 "D")(equal inner3 "E")(equal inner3 "F")(equal inner3 "G")(equal inner3 "H")(equal inner3 "I")
                      (equal inner3 "J")(equal inner3 "K")(equal inner3 "L")(equal inner3 "M")(equal inner3 "N")(equal inner3 "O")(equal inner3 "P")(equal inner3 "R")(equal inner3 "S")(equal inner3 "T")
                      (equal inner3 "U")(equal inner3 "V")(equal inner3 "Y")(equal inner3 "Z")(equal inner3 "W")(equal inner3 "X"))
                      (progn
                      (setq flag 1)
                      )
                    )
                  )
                )
                (if (= len 2)
                  (progn
                    (setq inner3 (car (list (nth 1 inner))))
                    (setq temptemp2 (car (list (nth 1 temp2))))
           
                    (loop for h from 0 to (- (list-length inner3) 1) do
                      (loop for p from 0 to (- (list-length temptemp2) 1) do
                        (setq first (nth h inner3))
                        (setq second (nth p temptemp2))
                   
                        (if (and(find first numbers)(find second numbers)(= first second))
                          (progn
                            (setq flag1 1)
                     
                          )
                        )
                        
                      )
                    )
                  )
                )

              
              )

            )
             

          )
          (setq mytemp (cdr mytemp))
        )
        (setq tempfact (cdr tempfact))    
      )

    (if (and (= flag1 1)(= flag 1) )
      (setq returnp 1)
    )
  )
)
returnp
)


(defun write-file(fileName)

  (with-open-file (stream "output.txt" :direction :output)
    (if (= (find-solution fileName) 1)
       (format stream "(T)")
    )
    (if (= (find-solution fileName) 0)
       (format stream "()")
    )
  )
)


;(write(find-solution "input.txt"))
(write-file "input.txt")


