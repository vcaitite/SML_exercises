(* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Developer: Vítor Caitité - 2016111849
Exercise 1 - Tipo Abstrato de Dado em SML para representar uma biblioteca Math
que lida com números inteiros e fornece as seguintes funções para o usuário:
- fact: calcula o fatorial de um número
- halfPi: constante representando metade do valor de Pi
- pow: dado uma base e um expoente, calcule a potência
- double: dobra um número
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ *)

signature MATH =
sig
    val halfPi : real
    val fact : int -> int
    val pow: int -> int -> int
    val double: int -> int 
end;

structure MyMathLib =
struct
    val halfPi = Math.pi / 2.0
    fun fact 0 = 1
      | fact n = n * fact(n-1); 
    fun pow(x, 0) = 1
      | pow(x, n) = x * pow(x,n-1); 
    fun double x = 2 * x 
end;

(* Examples:
structure S = MyMathLib;
val s = S.halfPi
val s = S.fact(7)
val s = S.pow(2, 8)
val s = S.double(4)
*)