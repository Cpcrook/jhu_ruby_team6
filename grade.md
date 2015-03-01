## Assignment 2

Grade: A-

## Details

```
assignment_2.rb
  should detect distinct domains
  should print the correct count of distinct domains
  should sort domains when printing out results
  should avoid non-preferred iterators
    should not use `loop`
    should not use `for in`
  should right-justify each row when printing out results
    should use rjust
    should not print any domain name at left-most position (FAILED - 1)
    should ensure each right-justified line has same number of characters (FAILED - 2)

Finished in 0.0065 seconds
8 examples, 2 failures
```

## Details

The arguments passed into `rjust` were larger than the string being aligned. According to the docs for `String#rjust`, when that is the case, it will just return the string itself.  In your case, just removing the extra '.com' would put it under 25.  This is a minor point deduction.

More important, however, is the complexity of `DomainCounter`.  I would look harder at the methods available on the `Enumerable` module (from which `Array` and `Hash` extend), particularly the `#inject` method.  With a proper regex pattern, this assignment could probably be handled in under 20 lines of code.  In the future, a good internal indicator of over-complexity is if you are performing or chaining many iterations (eg, `select, `collect`, `each`, `map`, etc) on the same set of data.

There is some room for improvement on this one, but very good overall!  Keep up the good work!
