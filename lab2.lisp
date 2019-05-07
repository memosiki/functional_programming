(defun check-list (a)
    (if (null a) ; проверка на пустой список
        T
        (let (
            ; текущий (первый) элемент - x[i]
            (xi (car a))
            ; последний элемент - x[2n-i+1]
            (x1 (car (last a)))
            ; предпоследний элемент - x[2n-i]
            (x2 (car (last a 2)))
            )
            (if (and (< x1 xi) (<= xi x2) )
                ; вызов для списка без первого и последнего элемента
                ( check-list (butlast (cdr a)))
                NIL))))
