(* +++++++++++++++++++++++++++++++++++++++++++++
Developer: Vítor Caitité - 2016111849
Exercise 11
++++++++++++++++++++++++++++++++++++++++++++++++ *)

(* Defining a bynary tree with:
    - internal nodes labeled with integer values and 
    - non-labeled leaves   \  *)
datatype btree = 
    Leaf
    | Node of (btree * int * btree);

(*função sumAll: btree -> int que percorre a árvore 
retorna a soma de todos os valores dos nós internos desta*)
fun sumAll Leaf = 0
  | sumAll (Node(t1, r, t2)) = r + sumAll(t1) + sumAll(t2);