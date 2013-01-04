(in-package #:template)

(defmacro template (vars args &body body)
  "Universal template macro. 
For every ARG in ARGS binded to VARS generates body. 
ARGS is a list. 
If VARS also list, then every element in ARGS is
a list of the same length.
  BODY of template should be as of DEFMACRO. 
It should return list (resulting program chunk)."
  (let ((%do (gensym "DO")) 
        (%vars (gensym "VARS")))
    (cond
      ((null vars)
       `(macrolet ((,%do () ,@body))
          (,%do)))
      ((consp vars)
       `(template ,%vars ,args
          (destructuring-bind ,vars ,%vars
            ,@body)))
      (t `(macrolet ((,%do ()
                       `(progn
                          ,@(mapcar (lambda (,vars) ,@body)
                                    ',args))))
            (,%do))))))

(setf (macro-function '!) (macro-function 'template))