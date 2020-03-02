
$onText
 LABORATORIO 2 - EJERCICIO 3                    
Equipo de futbol con 5 de 7 integrantes
Maximizar la capacidad defensiva total del equipo
Generico

SEBASTIAN GARCIA   -   201630047
NICOLAS SOLETO         -    201623026     
$offText

sets
         i 'players' /p1*p7/
;

Parameter
        rol(i) 'rol de cada jugador { ataque: 1, centro: 2, defensa: 3 }'
        / p1 1,  p2 2,  p3 1, p4 2, p5 1, p6 2, p7 1 /
        
        rolSecundario(i) 'rol de cada jugador'
        / p1 1,  p2 2,  p3 3, p4 3, p5 3, p6 3, p7 3 /
        
        control(i) 'control de balon de cada jufador'
        / p1 3,  p2 2,  p3 2, p4 1, p5 3, p6 3, p7 3 /
        
        disparo(i)
         / p1 3,  p2 1,  p3 3, p4 3, p5 3, p6 1, p7 2 /
        
        rebotes(i)
         / p1 1,  p2 3,  p3 2, p4 3, p5 3, p6 2, p7 2 /
        
        defensa(i)
         / p1 3,  p2 2,  p3 2, p4 1, p5 3, p6 3, p7 1 /        
;

Variables
x(i)     'Indica si se selecciona un jugador p'
z        'Objective Function';

Binary variable x;

Equations
objectiveFunction        'Objective Function'
limiteCincoJugadores             'restriccion en cantidad de jugadores'
limiteCuatroDefensas 
limiteDosAtaque 
limiteUnoCentro 
promedioControl 
promedioDisparo 
promedioRebotes 
jugadorDosTres
;

objectiveFunction           ..  z=e= sum((i), defensa(i) *  x(i));
limiteCincoJugadores .. sum( (i), x(i) )=e=5;
limiteCuatroDefensas .. sum((i), x(i) $ (rolSecundario(i) = 3))=g=4;
limiteDosAtaque .. sum( (i), x(i) $ ( rol(i) = 1 )  )=g=2;
limiteUnoCentro .. sum ( (i), x(i) $ ( rol(i) = 2 ) )=g=1;
promedioControl .. (sum( (i), x(i) * control(i) )/5)=g=2;
promedioDisparo .. (sum( (i), x(i) * disparo(i) )/5)=g=2;
promedioRebotes .. (sum( (i), x(i) * rebotes(i) )/5)=g=2;
 jugadorDosTres .. ( x('p2') + x('p3') )=e=1;


Model mod1 /all/;
Option mip=CPLEX;
solve mod1 using MIP maximizing z;
display x.l;
display z.l;


