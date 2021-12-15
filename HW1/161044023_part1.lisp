; *********************************************
; *  341 Programming Languages                *
; *  Fall 2020                                *
; *  Part 1                                   *
; *  Miray Yildiz                             *
; *********************************************


; This function write list elements to file.
(defun writefile(mylist)
  (setq lngth  (list-length mylist))
  (setq i 0)
  (with-open-file (stream "flattened_list.txt" :direction :output)
    (loop
    (setq i (+ i 1))
    (format stream  (write-to-string (car mylist)))
    (format stream " ")
    (setq mylist (cdr mylist)) (when (> i (- lngth 1)) (return t)))
  )
)  

; This function read numbers from file and adds numbers to the list. 
(defun listread(name) 
  (setq num 0)
  (setq mystring '"")
  (setq mylist '())
 (with-open-file (stream name)
    (do ((line (read-char stream nil)
               (read-char stream nil)))
        ((null line))   
        (if (or (string= line #\Space)(string= line nil)(string= line "(")(string= line ")")) 
            (progn
                (if (not ( string=  "" mystring)) 
                (progn     
                (setq num (parse-integer mystring))
                (setq mylist (cons num mylist))                                              ; Append integer to list.
                (setq mystring '"")))

            )
        )
        (if (not( or (string= line #\Space) (string= line "(") (string= line nil) (string= line ")")))
          (progn 
         (if (digit-char-p line)
            (progn
              (setf mystring (concatenate 'string mystring (list line))) 
            )
          )
          
        (if(not(digit-char-p line))
            (progn
              
              (setq mylist (append (list (read-from-string (string line))) mylist))          ; Append char to list.
            )
           )
          )
        )
      )
    
        
      (if (not ( string=  "" mystring))
        (progn     
          (setq num (parse-integer mystring))
          (setq mylist (cons num mylist))
          (setq mystring '"")
        )
      )
    
      (setq mylist (reverse mylist))
      (writefile mylist)                                                                      ; Call writefile function and write list elements to file.
    )

)

(listread "nested_list.txt")