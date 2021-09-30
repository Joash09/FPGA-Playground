This core was created with the help of the following tutorial:

https://forum.digikey.com/t/implementing-polynomials-using-horners-rule-and-fixed-point-arithmetic-vhdl/13316

Background
==========

First I need to discuss Horner's method for evaluating polynomials. The generic polynomial of degree n is given by f(x).

f(x) = a_0 + a_1x + a_3x^2 + a_nx^(n-1)

Horner's rule states that polynomial can be evaluated as follows:

f(x) = a_0 + x(a_1 + x(a_2 + x(a_3 + ... x(a_(n-1) + a_nx) ) ) )

This then reduces the number of operations needed to evaluate the polynomial as opposed to x^n for each term separately. 


Results
=======


Wishlist / Todo
==============

Horner's rule is a sequential operation. We can parallelise evaluating polynomial equations increasing speedup but also increasing the amount of space our design takes.
