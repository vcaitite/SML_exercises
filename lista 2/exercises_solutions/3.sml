(* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Developer: Vítor Caitité - 2016111849
Exercise 3 - Desenvolvimento de uma linguagem que calcule o
perímetro de objetos quadrados, retangulares, triângulares
e circulares.
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ *)
datatype perimetro = RConst of real 
              | PQuadrado of perimetro 
              | PCirculo of perimetro
              | PRetangulo of perimetro * perimetro
              | PTriangulo of perimetro * perimetro * perimetro;


(* Função eval : perimetro -> real para realizar a interpretação das expressões*)
fun eval (RConst i) = i
  | eval (PQuadrado edge) = 4.0 * (eval edge)
  | eval (PCirculo r) = 2.0 * Math.pi * (eval r) 
  | eval (PRetangulo(edge1, edge2)) = 2.0 * (eval edge1) + 2.0 * (eval edge2)
  | eval (PTriangulo(edge1, edge2, edge3)) = (eval edge1) + (eval edge2) + (eval edge3);
