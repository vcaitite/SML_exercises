(* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Developer: Vítor Caitité - 2016111849
Exercise 7 - Tratamento de Exceções.
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ *)

exception BadArgument of int;

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
      | fact n = if n < 0 then raise BadArgument n else n * fact(n-1); 
    fun pow(x, 0) = 1
      | pow(x, n) = if n < 0 then raise BadArgument n else if x < 0 then raise BadArgument x else x * pow(x,n-1); 
    fun double x = if x < 0 then raise BadArgument x else 2 * x
end;

fun useMyMathLib(x, function) = 
  let fun f x "fact"  = print(Int.toString(MyMathLib.fact(x)))
        | f x "pow" = print(Int.toString(MyMathLib.pow(x, x)))
        | f x "double" = print(Int.toString(MyMathLib.double(x)))
        | f x _ = raise Match
  in
    f x function
  end
  handle BadArgument x => print("Não posso lidar com valores negativos ");

(* Para mostrar o parametro inválido: 
handle BadArgument x => print("Não posso lidar com valores negativos, " ^ (Int.toString x)); 
*) 

(*Examples:
val x = useMyMathLib(~1, "fact");
val x = useMyMathLib(~1, "pow");
val x = useMyMathLib(~1, "double");
val x = useMyMathLib(~1, "fact2"); -> exception nao capturada, funçao invalida
*)
