; *********************************************
; *  341 Programming Languages                *
; *  Fall 2020                                *
; *  Part 3                                   *
; *  Miray Yıldız                             *
; *********************************************

;This function reads numbers from file
(defun readnumbers(name)
  (setq mystring '"")
  (setq mylist '())
 (with-open-file (stream name)
    (do ((line (read-char stream nil)
               (read-char stream nil)))
         ((null line)) 
          (if (< (length mylist) 5)                                ; If 5 elements were added to the list, stopped reading files
            (progn
                (if (or (string= line " ")(string= line nil))      ; In this if, the number read is added to the list
                    (progn
                      
                        (if (not ( string=  "" mystring) )
                          (progn 
                          (setq num (parse-integer mystring))
                          (setq mylist (cons num mylist))
                          (setq mystring '"")
                      
                          )
                        )
                     
                    )
                )
                (if (not(string= line " "))                       ; If the number has more digits, it is combined here
                  (progn 
                  (setf mystring (concatenate 'string mystring (list line))) 
                  )
                )
              )
            )
    )
    (if (not(= (length mylist) 5))
      (progn
        (setq num (parse-integer mystring)) 
        (setq mylist (cons num mylist))
      )
    )
    (setq mylist (reverse mylist))                                
  )
  return mylist                                                   ; Return list
)



; This function find collatz numbers and write this numbers to file.

(defun printCollatz (file) 
  (setq mylist (readnumbers file))                                ; Call readnumbers function and set mylist to this function.
  (with-open-file (stream "collatz_outputs.txt" :direction :output)
    (loop while (not (= (length mylist) 0)) do                    ; This loop continues until the list is empty.
      (setq number (car mylist))                                  ; The first element of the list is retrieved.
      (format stream (write-to-string number))
      (format stream ": ")
      (format stream (write-to-string number))
      (loop while (> number 1) do 
        (cond ((= (mod number 2) 0 )                              ; If the element is even, number = number / 2
          (progn
            (setq number (/ number 2))
            (format stream " ")
            (format stream (write-to-string number))
          )) 
          (t                                                      ; If the element is odd, number = (number * 3) + 1
            (progn
            (setq number (+ (* number 3) 1))
            (format stream " ")
            (format stream (write-to-string number))
            )
          )
        )
    )
        (setq mylist (cdr mylist))                                ; Update the list by deleting the first element.
      (format stream "~%")
  )
  )
)


  (printCollatz "integer_inputs.txt")                             ; Call printCollatz function and write numbers to file.




