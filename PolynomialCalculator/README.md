This core was created with the help of the following tutorial:

https://forum.digikey.com/t/implementing-polynomials-using-horners-rule-and-fixed-point-arithmetic-vhdl/13316

Background
==========

First I need to discuss Horner's method for evaluating polynomials. The generic polynomial of degree n is given by f(x).

f(x) = a_0 + a_1x + a_3x^2 + a_nx^(n-1)

Horner's rule states that polynomial can be evaluated as follows:

f(x) = a_0 + x(a_1 + x(a_2 + x(a_3 + ... x(a_(n-1) + a_nx) ) ) )

This then reduces the number of operations needed to evaluate the polynomial as opposed to x^n for each term separately. 


I represented the numbers using a fixed point representation. The representation dictates that a certain number of bits be dedicated for the integer part of the number and that another set of bits be used to represent the fractional part. Lastly a single bit is use to represent the sign of the number. Fixed point representation is simple to implement as the implementation does not need to know where the decimal point is. Fixed point numbers can be multiplied, added etc. as if they had no decimal point. It is up to the designer then to know how to intepret the final result has a fractional number.

More info on fixed point representation can be found here: https://courses.cs.washington.edu/courses/cse467/08au/labs/l5/fp.pdf

Results
=======


Wishlist / Todo
==============

Horner's rule is a sequential operation. We can parallelise evaluating polynomial equations increasing speedup but also increasing the amount of space our design takes.
