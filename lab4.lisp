(defun text-trim (char-bag text)
    (map 'list
        (lambda (line)
            (apply #'concatenate 'string (word-list-trim char-bag line)))
        text))

(defun whitespace-char-p (char)
  (member char '(#\Space #\Tab #\Newline)))

(defun word-list-trim (char-bag string)
  ;; Разбить строку на слова, при этом разделяющие символы тоже сохраняются
  ;; в отдельное слово. Чтобы была возможность точно восстановить исходный текст.
  ;; К каждому элементу не состоящему из пробельных символов применяется
  ;; функция string trim с заданным аргументом
  (loop with len = (length string)
        for prev = 0 then right
        for left = 0 then (1+ right)
        for right = (or (position-if #'whitespace-char-p string
                                     :start left)
                        len)
        unless (= left prev)
            collect(subseq string prev left)
        unless (= right left)   ; исключить пустые слова
            collect
            (string-trim char-bag (subseq string left right))
        while (< right len)))
