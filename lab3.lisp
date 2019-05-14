(defun swap-rows (a)
    (let (( b (make-array (array-dimensions a))))
        (loop with n = (array-dimension a 0)
              for i upfrom 0 below n do
              (loop for j upfrom 0 below (array-dimension a 1)  do
                (psetf (aref b i j) (aref a ( - n i 1) j)
                       )            )
        )
        b
    )
)
(defun print-matrix (matrix &optional (chars 3) stream)
  ;; Предполагаем, что требуется
  ;;  3 знака по умолчанию на каждый элемент,
  ;;  6 знаков на #2A и скобки.
  (let ((*print-right-margin* (+ 6 (* (1+ chars) ; плюс пробел
                                      (array-dimension matrix 1)))))
    (pprint matrix stream)
    (values)))

(defun make-enum (dim)
    (let ((a (make-array dim)))
        (loop  with m = (array-dimension a 1 )
              for i upfrom 0 below (array-dimension a 0 ) do
              (loop for j upfrom 0 below (array-dimension a 1)  do
                    (psetf (aref a i j) (+ (* m i) j))
            )
        )
    a)
)
