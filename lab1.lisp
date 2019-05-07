(defun bishop-threat-p-check (k l m n step1 step2)
; функция делает шаг по диагонали игрового поля, в
; соответвии с тем как ходит слон
; step1, step2 - шаги с которыми изменяются координаты

    ; проверка того, что не вышли за края поля
    (if (or (< k 1) (> k 8) (< l 1) (> l 8))
        NIL
        (if (and (= k m)(= l n))
            T ; слон добрался до заданной клетки
            (bishop-threat-p-check
                (+ k step1) (+ l step2) m n step1 step2))))

(defun bishop-threat-p (k l m n)
    ; проверяем каждую из четырёх диагоналей
    (or (bishop-threat-p-check k l m n -1 -1)
        (bishop-threat-p-check k l m n 1 -1)
        (bishop-threat-p-check k l m n -1 1)
        (bishop-threat-p-check k l m n 1 1)))
