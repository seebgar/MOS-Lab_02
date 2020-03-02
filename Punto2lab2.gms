
$onText
 LABORATORIO 1 - EJERCICIO 2
Minimizar costo de transporte, sistema de multiprocesamiento

SEBASTIAN GARCIA   -   201630047
NICOLAS SOLETO         -    2016 23026
$offText

Sets
  i   'precesadores origen' / o1*o3 /
  j   'procesadores destino' / d1*d2 /;


Parameter
        a(i) 'oferta de procesos de un procesador origen <i> '
        / o1 60, o2 80, o3 50 /

          b(i) 'oferta de procesos de un procesador con prioridad origen <i> '
        / o1 80, o2 50, o3 50 /

        e(j) 'demanda de procesos sin prioridad por parte de un procesador destino <j>'
        / d1 100, d2 90 /
        d(j) 'demanda de procesos con prioridad por parte de un procesador destino <j>'
        / d1 60, d2 120 /;

Table c(i, j) 'costo de transporte desde un procesador origen <i> hasta uno de destino <j>'
            d1      d2
  o1        300     500
  o2        200     300
  o3        600      300;


Variables
  x(i, j)        'Cantidad de procesos a transportar sin prioridad'
  y(i, j)        'Cantidad de procesos a transportar con prioridad'
  z              'Objective function - costo total de transporte, se busca minimizar'  ;


Positive Variable x(i, j),y;


Equations
objectiveFunction        'objective function'
ofertaSinPrioridad(i)            'observa la cantidad de procesos sin prioridad disponibles en procesador origen'
ofertaConPrioridad(i)            'observa la cantidad de procesos conn prioridad disponibles en procesador origen'
demandaConPrioridad(j)           'observa el cumplimiento de la demanda que exige cada procesador destino con prioridad '
demandaSinPrioridad(j)           'observa el cumplimiento de la demanda que exige cada procesador destino sin prioridad';


objectiveFunction ..  z =e= sum((i, j), c(i, j) * (x(i, j)+y(i,j)));

ofertaSinPrioridad(i) ..   sum((j), x(i, j)) =l= a(i);
ofertaConPrioridad(i) ..   sum((j), y(i, j)) =l= b(i);

demandaSinPrioridad(j) .. sum( (i), x(i,j) ) =g=e(j);
demandaConPrioridad(j) .. sum( (i), y(i,j) ) =g=d(j);


Model model1 /all/ ;
option lp=CPLEX
Solve model1 using lp minimizing z;

Display x.l;
Display y.l;
Display z.l;
