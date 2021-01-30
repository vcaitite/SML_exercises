(* +++++++++++++++++++++++++++++++++++++++++++++
Developer: Vítor Caitité - 2016111849
Exercise 10
++++++++++++++++++++++++++++++++++++++++++++++++ *)

(* Tipo de dados algébrico planeta onde os contrutores 
receberam os nomes dos planetas so sistema solar. *)
datatype Planeta =
    Mercurio
    | Venus
    | Terra
    | Marte
    | Jupiter
    | Saturno
    | Urano
    | Netuno;

(* Função Planeta-> real que recebe um planeta e retorna o 
tempo em órbita do planeta em dias terrestres. *)
fun daysInOrbit Mercurio = 88.0
  | daysInOrbit Venus = 225.0
  | daysInOrbit Terra = 365.0
  | daysInOrbit Marte = 687.0
  | daysInOrbit Jupiter = 4332.0
  | daysInOrbit Saturno = 10760.0
  | daysInOrbit Urano = 30681.0
  | daysInOrbit Netuno = 60190.0; 

(*Função planetAge: int * Planeta -> int que recebe como 
entrada a idade de alguém em meses e um planeta e retorna
a idade em dias dessa pessoa de acordo com o planeta dado
como entrada.*)
fun planetAge (months, planeta) = 
    floor(((real(months) / 12.0) * daysInOrbit(planeta)));   