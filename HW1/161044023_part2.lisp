; *********************************************
; *  341 Programming Languages                *
; *  Fall 2020                                *
;	*  Part 2                                   *
; *  Miray Yıldız                             *
; *********************************************

; This function reads the boundiries and adds the boundries to the list and returns the list.
(defun readboundries(name)
  (setq mystring '"")
  (setq mylist '())
 (with-open-file (stream name)
    (do ((line (read-char stream nil)
               (read-char stream nil)))
        ((null line))
        (if (or (string= line " ")) 
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
        (if (not( or (string= line " ")))
          (progn 
          (setf mystring (concatenate 'string mystring (list line))) 
          ))
      )
      (setq num (parse-integer mystring)) 
      (setq mylist (cons num mylist))
    )
  return mylist
)



; This function checks whether the number is semi-prime, and it returns counter. If counter is 2, number is semi-prime.
(defun isSemiPrime (number)
  (setq counter 0)
  (setq temp 2)
  (loop while (and (< counter 2) (or(< (* temp temp ) number) (= (* temp temp) number))) do
    (loop while (= (mod number temp) 0) do
      (setq number (/ number temp))
      (setq counter (+ counter 1))
    )
    (setq temp (+ temp 1))
  )
  
  (if (> number 1)
    (setq counter (+ counter 1))
  )
  
 return counter )


; This function is recursive and checks whether the number is prime,
; and it returns counter. If counter is 0, number is prime.
(defun isPrime (number temp counter)
  (setq modnum (mod number temp))
  (if (= modnum 0)
    (progn
    (setq counter (+ counter 1))
    )
  )
  (if (= (+ temp 1) number)
     counter
  
  (isPrime number (+ temp 1) counter))
)


; This function write numbers' prime or semi-prime situations to file. 

(defun writeToFile (filename)
  (setq mylist (readboundries "boundries.txt"))                           ; Call readboundires function and determine boundries. 
  (setq boundry2 (car mylist))
  (setq mylist (cdr mylist))
  (setq boundry1 (car mylist))
  (with-open-file (stream filename :direction :output)                ; Open primedistribution.txt file and write information to file.
    (loop while (or(< boundry1 boundry2)(= boundry1 boundry2)) do     ; 0 and 1 are not semi-prime or prime.
      (if (and(not(= boundry1 0))(not(= boundry1 1))(not(= boundry1 2)))
       (progn
        (if (= (isPrime boundry1 2 0) 0)
          (progn
              (format stream  (write-to-string boundry1))
              (format stream " is Prime")
              (format stream "~%")
               
          )                        
        )
        (if (not(= (isPrime boundry1 2 0) 0))
            (progn
              (if(= (isSemiPrime boundry1) 2)
                (progn
                  (format stream  (write-to-string boundry1))
                  (format stream " is Semi-prime")
                  (format stream "~%")
                )
              )
            )
        )
       )
      )
      (if (= boundry1 2)
	    (progn
	    	(format stream  (write-to-string boundry1))
	        (format stream " is Prime")
	        (format stream "~%")
	    )
	  )  
      (setq boundry1 (+ boundry1 1))
    )
  )
)


(writeToFile "primedistribution.txt")                                ; Call writeToFile function and write information to file.