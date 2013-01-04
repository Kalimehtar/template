template
========

It can be used to generate code.

For example, you need to write something like 

    (defmethod ((a type1) b)
       {some code})
   
    (defmethod ((a type2) b)
       {some code})
   
    (defmethod ((a type3) b)
       {some code})
   
defmethod don't give ypu a way to set list of types as a qualifier.

You may write

    (template type (type1 type2 type3)
      `(defmethod ((a ,type) b)
         {some code}))

And you can cycle several vars at once:

    (template (name type) ((name1 type1) (name2 type2) (name3 type3))
      `(defmethod ((,name ,type) b)
         {some code}))

And, if simply it easier generate code, than write (for long cond, for example)

    (template () ()
       (this-function-returns-generated-code))
