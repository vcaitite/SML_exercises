(* +++++++++++++++++++++++++++++++++++++++++++++++++++++++
Developer: Vítor Caitité - 2016111849
Exercise 2 - Desenvolvimento de uma linguagem que calcule
a área de objetos quadrados,  retangulares, e circulares.
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ *)
datatype area = RConst of real 
              | AQuadrado of area 
              | ACirculo of area
              | ARetangulo of area * area;

(* Função eval : area -> real para realizar a interpretação das expressões*)
fun eval (RConst i) = i
  | eval (AQuadrado edge) = (eval edge) * (eval edge)
  | eval (ACirculo r) = 3.14 * (eval r) * (eval r)
  | eval (ARetangulo(edge1, edge2)) = (eval edge1) * (eval edge2);

(* Se desejar maior precisão pode-se utilizar Math.pi ao invés de 3.14 no 
cálculo da área do círculo. Utilizou-se 3.14 para obter um resultado 
correspondente ao mostrado no enunciado da lista. *)
