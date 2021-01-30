(* +++++++++++++++++++++++++++++++++++++++++++++
Developer: Vítor Caitité - 2016111849
Exercise 6 - Função greet: string -> string que 
recebe um nome e retorna um cumprimento para esse
nome. Se nenhum nome for passado como entrada,
a função deve retornar Hello nobody.
++++++++++++++++++++++++++++++++++++++++++++++++ *)
fun greet name = 
    if (null (explode(name))) then 
        "Hello nobody"
    else
        "Hello " ^ name; 