
$onText
 LABORATORIO 2 - EJERCICIO 5                    
Minimizar el número de trabajadores de tiempo completo
considerando la cantidad de trabajadores requeridos por cada día de la semana
Especifico

Ayuda = 22.33 || 23

SEBASTIAN GARCIA   -   201630047
NICOLAS SOLETO         -    201623026     
$offText

Variables
z           'Objective Function'
LM      'descansa lunes y martes'
MM     'descansa martes y miercoles'
MJ      'descansa miercoles y jueves'
JV      'descansa jueves y viernes'
VS      'descansa viernes y sabado'
SD      'descansa sabado y domingo'
DL      'descansa domingo y lunes'
;

Positive variables LM MM MJ JV VS SD DL;

Equations
objectiveFunction        'Objective Function'
lunes
martes
miercoles
jueves
viernes
sabado
domingo
;

objectiveFunction           ..  z=e= LM + MM+ MJ + JV + VS + SD + DL;
lunes .. DL + LM + MM + MJ + JV =g=17;
martes ..  LM + MM+ MJ + JV + VS =g=13;
miercoles   ..  MM + MJ + JV + VS + SD =g=15;
jueves .. MJ + JV + VS + SD + DL =g=19;
viernes .. JV + VS + SD + DL + LM =g= 14;
sabado .. VS + SD + DL + LM + MM =g=16;
domingo .. SD + DL + LM + MM + MJ =g=11;


Model mod1 /all/;
Option mip=CPLEX;
solve mod1 using MIP minimizing z;
display z.l;


