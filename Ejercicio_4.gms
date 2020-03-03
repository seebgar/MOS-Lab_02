$onText
 LABORATORIO 1 - EJERCICIO 2
Minimizar costo de transporte, sistema de multiprocesamiento

SEBASTIAN GARCIA   -   201630047
NICOLAS SOLETO         -    201623026
$offText

sets

l losas / l1 * l20 /
t tubos/ t1 * t7 /



parameter  mapa(t,l) ubicaci�n de los tubos en las losas (filas)  ;
mapa(t,l) = 0;
mapa('t1','l1') = 1 ;
mapa('t1','l5') = 1 ;
mapa('t2','l2') = 1 ;
mapa('t2','l3') = 1 ;
mapa('t2','l6') = 1 ;
mapa('t2','l7') = 1 ;
mapa('t3','l5') = 1 ;
mapa('t3','l9') = 1 ;
mapa('t4','l8') = 1 ;
mapa('t4','l12') = 1 ;
mapa('t4','l16') = 1 ;
mapa('t4','l20') = 1 ;
mapa('t4','l19') = 1 ;
mapa('t5','l9') = 1 ;
mapa('t5','l10') = 1 ;
mapa('t5','l13') = 1 ;
mapa('t5','l14') = 1 ;
mapa('t6','l10') = 1 ;
mapa('t6','l11') = 1 ;
mapa('t6','l14') = 1 ;
mapa('t6','l15') = 1 ;
mapa('t7','l13') = 1 ;
mapa('t7','l17') = 1 ;

variables
x(l) variable para saber si se levanta la losa o no
obj funcion objetivo
binary variable x(l);

Equations
FuncionObjetivo funcion objetivo
rest1 restriccion 1 para que se conozaca el material de todos los tubos;

FuncionObjetivo .. obj =e= sum((l),x(l));
rest1(t)  ..   sum((l), mapa(t,l)*x(l))  =e= 1;


Model model1 /all/ ;
option mip=CPLEX
Solve model1 using mip minimizing obj;


Display x.l;
Display obj.l;




