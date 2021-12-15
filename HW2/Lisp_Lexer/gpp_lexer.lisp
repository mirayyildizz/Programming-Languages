(setq characters '(#\A #\B #\C #\D #\E #\F #\G #\H #\I #\J #\K #\L #\M #\N #\O #\P #\Q #\R #\S #\T #\U #\V #\W #\X #\Y #\Z #\a #\b #\c #\d #\e #\f #\g #\h #\i #\j #\k #\l #\m #\n #\o #\p #\q #\r #\s #\t #\u #\v #\w #\x #\y #\z ))
(setq operators '("+" "-" "/" "*" "**" "(" ")" "," ))
(setq numbers '(#\0 #\1 #\2 #\3 #\4 #\5 #\6 #\7 #\8 #\9))



(defun lexer(name)
	(setq mylist name)
	(setq counter 0)
	(setq condition 0)
	(with-open-file (stream "parsed_lisp.txt" :direction :output 
											  :if-exists :append )
											  
		(loop while (not(= (list-length mylist) 0)) do
	      	(setq mystring (car mylist))
	      	(setq numcounter 0)
	      	(setq numcountertwo 0)

	      	(if (> (length mystring ) 1)
	      		(progn
			      	(if(and(equal (char mystring 0) #\;)(equal (char mystring 1) #\;))
			      		(progn 
				        	(loop 
				        		(setq mystring (car mylist))
				        		(setq mylist (cdr mylist))
				         		(when (string= mystring "1linefeed!!1") (return))
				     		)
				     		(setq mylist (cdr mylist))  
				      		(setq mystring (car mylist))
				      		;;(print "COMMENT")
				      		(format stream "COMMENT")
							(terpri stream)
			      		)
			        )
		        )
		        

	        )
	       
	      	
	      	

	      	(if (not(equal mystring " "))
	      		(progn
	      		
	      		(if (or (string= mystring "list") (string= mystring "and") (string= mystring "or") (string= mystring "not") (string= mystring "equal") (string= mystring "less") 
	      			(string= mystring "nil") (string= mystring "append") (string= mystring "concat") (string= mystring "set") (string= mystring "for") (string= mystring "if") 
	      			(string= mystring "exit") (string= mystring "load") (string= mystring "disp") (string= mystring "true") (string= mystring "false") (string= mystring "(")
	      			(string= mystring ")") (string= mystring "deffun") (string= mystring "+") (string= mystring "-") (string= mystring "*") (string= mystring "/") 
	      			(string= mystring "**") (string= mystring ",") (string= mystring "1quato1") (string= mystring "2quato2") )
	      				(progn

		      				(if (string= mystring "list")
								(progn 
									;;(print "KW_LIST")
									(format stream "KW_LIST")
									(terpri stream)
									(setq counter 1)
								)
		   					)
						    (if (string= mystring "and")
						    	(progn 
						        	;;(print "KW_AND")
						        	(format stream "KW_AND")
									(terpri stream)
						        	(setq counter 1)
						        )
										        		)
							(if (string= mystring "or")
								(progn 	
									(format stream "KW_OR")
									(terpri stream)
									;;(print "KW_OR")
									(setq counter 1)
								)
						    )
							(if (string= mystring "not")
								(progn 
									;;(print "KW_NOT")
									(format stream "KW_NOT")
									(terpri stream)
									(setq counter 1)
								)
							)
							(if (string= mystring "equal")
							    (progn 
							   		;;(print "KW_EQUAL")
							   		(format stream "KW_EQUAL")
									(terpri stream)
							   		(setq counter 1)
							   	)
							)
						 	(if (string= mystring "less")
						 		(progn
						 			(format stream "KW_LESS")
									(terpri stream) 
							   		;;(print "KW_LESS")
							   		(setq counter 1)
							   	)
						    )
						    (if (string= mystring "nil")
								(progn 
									;;(print "KW_NIL")
									(format stream "KW_NIL")
									(terpri stream)
									(setq counter 1)
								)
							)
							(if (string= mystring "append")
								(progn 
									;;(print "KW_APPEND")
									(format stream "KW_APPEND")
									(terpri stream)
									(setq counter 1)
								)
							)
							(if (string= mystring "concat")
								(progn 
									;;(print "KW_CONCAT")
									(format stream "KW_CONCAT")
									(terpri stream)
									(setq counter 1)
								)
							)
							(if (string= mystring "set")
								(progn 
									;;(print "KW_SET")
									(format stream "KW_SET")
									(terpri stream)
									(setq counter 1)
								)	
						    )
						    (if (string= mystring "for")
							    (progn 
								    ;;(print "KW_FOR")
								    (format stream "KW_FOR")
									(terpri stream)
								    (setq counter 1)
								)
							)
							(if (string= mystring "if")
						     	(progn 
						     		(format stream "KW_IF")
									(terpri stream)
						     		;;(print "KW_IF")
						     		(setq counter 1)
						     	)
							)
							(if (string= mystring "exit")
								(progn 
									;;(print "KW_EXIT")
									(format stream "KW_EXIT")
									(terpri stream)
									(setq counter 1)
								)
							)
							(if (string= mystring "load")
							    (progn 
							    	;;(print "KW_LOAD")
							    	(format stream "KW_LOAD")
									(terpri stream)
							    	(setq counter 1)
							    )
							)
							(if (string= mystring "disp")
							 	(progn 
							 		;;(print "KW_DISP")
							 		(format stream "KW_DISP")
									(terpri stream)
							 		(setq counter 1)
							 	)
							)
							(if (string= mystring "true")
								(progn 
									;;(print "KW_TRUE")
									(format stream "KW_TRUE")
									(terpri stream)
									(setq counter 1)
								)
							)
							(if (string= mystring "false")
								(progn 
									;;(print "KW_FALSE")
									(format stream "KW_FALSE")
									(terpri stream)
									(setq counter 1)
								)
							)
							(if(string= mystring "(")
								(progn 
									;;(print "OP_OP")
									(format stream "OP_OP")
									(terpri stream)
									(setq counter 1)
								)
							)
							(if(string= mystring ")")
								(progn 
									;;(print "OP_CP")
									(format stream "OP_CP")
									(terpri stream)
									(setq counter 1)
								)
							)
							(if (string= mystring "deffun")
								(progn 
									;;(print "KW_DEFFUN")
									(format stream "KW_DEFFUN")
									(terpri stream)
									(setq counter 1)
								)
							)
							(if(string= mystring "+")
							 	(progn 
							 		;;(print "OP_PLUS")
							 		(format stream "OP_PLUS")
									(terpri stream)
							 		(setq counter 1)
							 	)
							)			   
							(if(string= mystring "-")
							  	(progn 
							  		;;(print "OP_MINUS")
							  		(format stream "OP_MINUS")
									(terpri stream)
							  		(setq counter 1)
							  	)
							)
							(if (string= mystring "*")
								(progn 
									;;(print "OP_MULT")
									(format stream "OP_MULT")
									(terpri stream)
									(setq counter 1)
								)
							)
							(if(string= mystring "/")
								(progn 
									;;(print "OP_DIV")
									(format stream "OP_DIV")
									(terpri stream)
									(setq counter 1)
								)
							)
							(if (string= mystring "**")
								(progn 
							    	;;(print "OP_DBLMULT")
							    	(format stream "OP_DBLMULT")
									(terpri stream)
							    	(setq counter 1)
							    )
							)
						    (if (string= mystring ",")
						    	(progn 
									;;(print "OP_COMMA")
									(format stream "COMMA")
									(terpri stream)
									(setq counter 1)
								)
							)
							(if (string= mystring "1quato1") ;; burada sorun var
								(progn 
									;;(print "OP_OC")
									(format stream "OP_OC")
									(terpri stream)
									(setq counter 1)
								)
							)
							(if (string= mystring "2quato2") ;; burada sorun var
								(progn 
									;;(print "OP_CC")
									(format stream "OP_CC")
									(terpri stream)
									(setq counter 1)
								)
					
							)
						)	      	
					)
				
			
		
	      		
	      		
				(if (and (= counter 0)(not(string= mystring "1linefeed!!1")))
					(progn

						
						(setq len (length mystring))
						
							(loop for a from 0 to (- len 1) do
		  						(setq ch (char mystring a))
		  						
		  						(if (and(= numcounter 1)(not(= a 0))(not (equal (find ch characters) nil)))
									(progn
										;;(print "ERROR")
										(format stream "SYNTAX_ERROR")
										(terpri stream)

										(return)
									)		
								)

								(if (= numcountertwo len )
									(progn
										;;(print "VALUE")
										(format stream "VALUE")
										(terpri stream)
										(return)
									)
								)



								(if (and (equal (find ch characters) nil)(equal (find ch numbers) nil))
									(progn
										;;(print "ERROR")
										(format stream "SYNTAX_ERROR")
										(terpri stream)
										(return)
									)
								)
								
		  						(if (and (not (equal (find ch numbers) nil))(= len 1))
		  							(progn
		  								;;(print "VALUE")
		  								(format stream "VALUE")
		  								(terpri stream)
		  								(return)
		  							)
		  						)

		  						(if (and(equal ch #\0)(not(= numcounter 1)))
		  							(progn
		  								;;(print "ERROR")
		  								(format stream "SYNTAX_ERROR")
		  								(terpri stream)
		  								(return)
		  							)
		  						)
		  						(if (and ( or (equal ch #\1)(equal ch #\2)(equal ch #\3)(equal ch #\4)(equal ch #\5)(equal ch #\6)(equal ch #\7)(equal ch #\8)(equal ch #\9))(not(= len 1))(= a 0)) 
		  							(progn
		  								(setq numcounter 1)
		  								(setq numcountertwo 1)	
		  							)
		  						)

		  						(if (and (not (equal (find ch numbers) nil)) (not(= a 0))(= numcounter 1))
		  							(setq numcountertwo (+ numcountertwo 1))	
		  						)
		  					
		  						(if (and(= a (- len 1))(not(= numcounter 1)))
		  							(progn
		  							;;(print "IDENTIFIER")
		  							(format stream "IDENTIFIER")
		  							(terpri stream)
		  							(return)
		  							)
		  						)
		  						(if (and(= a (- len 1))(= numcounter 1))
		  							(progn
		  							(format stream "VALUE")
		  							(terpri stream)
		  							(return)
		  							)
		  						)
							)		
						
					)

				)	

		    )

	      )
	    (setq counter 0)
	    (setq mylist (cdr mylist))
	    )
	)
)
	




(defun readfile(name)
	(setq allthings '"")
	(with-open-file (stream name)
	    (do ((ch (read-char stream nil)
	               (read-char stream nil)))
	        ((null ch))
	        
	        (setf allthings (concatenate 'string  allthings (string ch)))
	      
	        
	    )   
	)
	
	(createlist allthings)
	

)

(defun createlist (allthings)
	(setq mystring '"")
	(setq mylist '())
	(setq counter 0)
	(setq doublemult 0)
	(setq i 0)
	(setq ch '"")
	(setq len (length allthings))

	(loop for a from 0 to (- len 1) do
		(setq ch (char allthings i))

		(if(string= ch " ")
		    (progn
		    	
			    (if (= doublemult 1)
			       	(progn
				        (setq mylist (append mylist  (list " " )) )
					    (setq mylist (append mylist (list "*")))
					   	(setq mylist (append mylist  (list " " )) )
					    (setq doublemult 0)
					)
			    )
			   	(setq mylist (append mylist (list mystring)) )
			    (setq mystring '"")	  	
		   	)
		 )

		(if(and(not(string= ch " ")) (not(string= ch "(")) (not(string= ch ")"))(not(string= ch #\linefeed)) (not(string= ch #\"))(not (string= ch "+"))(not (string= ch "-"))(not(string= ch "/"))(not(string= ch ","))(not (string= ch "*")))  
		    (progn
		    
		       	(if(= doublemult 1)
		       		(progn
					(setq mylist (append mylist  (list " " )) )
				    (setq mylist (append mylist (list "*")))
				    (setq mylist (append mylist  (list " " )) )
				    (setq doublemult 0)
				    )
				) 
			
				(setq mystring(concatenate 'string  mystring (string ch)))
			
				


		    )
		)

		(if (string= ch "*")
		   	(progn
				(if (not(equal "" mystring))
		       		(progn
					    (setq mylist (append mylist (list mystring)) )
					   	(setq mystring "")
		        	)
			    )
				
				(cond ((= doublemult 1)
					(setq mylist (append mylist  (list " " )) )
			        (setq mylist (append mylist (list "**")))
			        (setq mylist (append mylist  (list " " )) )
			        (setq doublemult 0)
				) 
					(t
						(setq doublemult 1)
					) 
				)

		    )
		)

		(if (or(string= ch "(") (string= ch ")") (string= ch "+")(string= ch "-") (string= ch "/") (string= ch ",") (string= ch #\")  (string= ch #\linefeed)) 
		   	(progn
		   		
		   		
		       	(if (not(equal "" mystring))
		        	(progn
					    (setq mylist (append mylist (list mystring)) )
					   	(setq mystring "")
		        	)
			    )
			    (setq mylist (append mylist  (list " " )) )
			    (if (string= ch "(")
			  	 	(setq mylist (append mylist (list "(")))
			 	)
			    (if (string= ch #\linefeed)
		        	(setq mylist (append mylist (list "1linefeed!!1")))
		        )
			    (if (string= ch ")")
			       	(setq mylist (append mylist (list ")")))
			    )
			    (if (string= ch "+")
			        (setq mylist (append mylist (list "+")))
			    )
			    (if (string= ch "-")
			        (setq mylist (append mylist (list "-")))
			   	)
			    (if (string= ch "*")
			       	(setq mylist (append mylist (list "*")))
			    )
			    (if (string= ch "/")
			       	(setq mylist (append mylist (list "/")))
				)
			    (if (string= ch ",")
			        (setq mylist (append mylist (list ",")))
			    )
			    (if (string= ch #\")
			      	(progn
			       		(cond ((= counter 0)
						(setq mylist (append mylist (list  "1quato1")))
						(setq counter 1) 
							  ) 	
							(t
								(setq mylist (append mylist (list  "2quato2")))
								(setq counter 0)
							) 
						) 
			        )
			    )
				(setq mylist (append mylist  (list " " )) )
			)
		)
		(setq i (+ i 1))
	)
	(if (not(= (length mystring) 0))
		    (progn
				(setq mylist (append mylist (list mystring)) )
				(setq mystring '"")
		    )
	)
	
	(lexer mylist)
)

(defun console(arg)
	
	(setq mystringg '"")

    (loop 
	 
	  (setf mystringg (read-line))

	  (setf mystringg (concatenate 'string  mystringg " 1linefeed!!1"))
	  
	  (if (not(string=  mystringg " 1linefeed1!!"))
	  	(createlist mystringg)
	  )

   (when (= (length(string mystringg)) 13) (return))
	)

	


)

(defun mymain(msms)
	
	(if( = (list-length *args*) 0)
		(console "examp")
	)

	(if(= (list-length *args*) 1)
		(readfile (car *args*))
	)



)




(mymain "go")
