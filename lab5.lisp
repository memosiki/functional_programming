(defclass polar ()
    ((radius :initarg :radius :accessor radius)  ; длина >=0
    (angle  :initarg :angle  :accessor angle)))     ; угол (-pi;pi]
(defclass cart ()                ; имя класса и надклассы
    ((x :initarg :x :reader cart-x)   ; дескриптор слота x
    (y :initarg :y :reader cart-y)))
(defclass line ()
    ((start :initarg :start :accessor line-start)
    (end   :initarg :end   :accessor line-end)))
(defmethod cart-x ((p polar))
    (* (radius p) (cos (angle p))))
(defmethod cart-y ((p polar))
    (* (radius p) (sin (angle p))))

(defmethod line-slope ((line1 line)) ; тангенс угла наклона прямой к Оx
    (/ (- (cart-y (line-start line1)) (cart-y (line-end line1)))
        (- (cart-x (line-start line1)) (cart-x (line-end line1)))))
(defun almost-equal (a b)
    (< (abs(- a b)) 0.001))

(defmethod line-vertical ((l line)) ; является ли линия вертикальной?, т.е
    (almost-equal (cart-x (line-start l)) (cart-x (line-end l))))

(defmethod print-object ((p polar) stream)
  (format stream "[POLAR radius ~d angle ~d]"
          (radius p) (angle p)))
(defmethod print-object ((c cart) stream)
    (format stream "[CART x ~d y ~d]"
        (cart-x c) (cart-y c)))
(defmethod print-object ((lin line) stream)
  (format stream "[LINE ~s ~s]"
          (line-start lin) (line-end lin)))
(defun line-parallel2-p (line1 line2)
    ; если линии вертикальны, то тангенс их угла наклона равен беск.
    ; рассмотрим их отдельно
    (if (or (line-vertical line1) (line-vertical line2))
        (if (and (line-vertical line1) (line-vertical line2))
            T ; одновременно вертикальны
            NIL) ; только одна из них вертикальна -- не параллельны
        (if ( almost-equal (line-slope line1) (line-slope line2) ) ; смотрим тангенсы угла наклона
            T
            NIL)))
