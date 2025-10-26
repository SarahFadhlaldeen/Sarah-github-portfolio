function [ A,a ] = CastleImage

a = [ 0 * ( 0:18 ), 4 + 0.2 * ( 0:5 ), ...
    5 - 0.2 * ( 1:5 ) , 2.5 + 0 * ( 1:20 ) ] ;
a = [ a 2.5 fliplr(a) ]' ;

alpha = 0.3 ;

v = ones( 101,1 ) ;
A = spdiags( [ alpha*v ( 1-2*alpha )*v alpha*v ], [ -1,0,1 ],101,101 ) ;
A = A^10 ;
A = full(A) ;
