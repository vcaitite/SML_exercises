(* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Developer: Vítor Caitité - 2016111849
Exercise 4
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ *)
datatype UnOp = Not;
datatype BinOp = Add | Sub | Mul | Gt | Eq | Or;
datatype Sexpr = IConst of int | Op1 of UnOp * Sexpr | Op2 of BinOp * Sexpr * Sexpr;

fun simplify (IConst e) = (IConst e)
  | simplify (Op2 (Add, (IConst 0), e)) = (simplify e)
  | simplify (Op2 (Add, e, (IConst 0))) = (simplify e)
  | simplify (Op2 (Sub, e, (IConst 0))) = (simplify e)
  | simplify (Op2 (Mul, e, (IConst 1))) = (simplify e)
  | simplify (Op2 (Mul, (IConst 1), e)) = (simplify e)
  | simplify (Op2 (Mul, (IConst 0), _)) = (IConst 0)
  | simplify (Op2 (Mul, _, (IConst 0))) = (IConst 0)
  | simplify (Op2 (Sub, e1, e2)) = if (e1 = e2) then IConst 0 else Op2(Sub, (simplify e1), (simplify e2))
  | simplify (Op2 (Or, e1, e2)) = if (e1 = e2) then simplify e1 else Op2(Or, simplify e1, simplify e2)
  | simplify (Op1 (Not, Op1(Not, e))) = simplify e
  | simplify (Op2 (e, (IConst e1), (IConst e2))) = (Op2 (e, (IConst e1), (IConst e2)))
  | simplify (Op2 (e, e1, IConst e2)) = (simplify (Op2 (e, simplify e1, IConst e2)))
  | simplify (Op2 (e, IConst e1, e2)) = (simplify (Op2 (e, IConst e1, simplify e2)))
  | simplify (Op2 (e, e1, e2)) = simplify (Op2(e, simplify e1, simplify e2))
  | simplify (e) = e;  
