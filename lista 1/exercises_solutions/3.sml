(* +++++++++++++++++++++++++++++++++++++++++++++
Developer: Vítor Caitité - 2016111849
Exercise 3 - Função que recebe duas listas de 
mesmo tamanho e retorne uma lista em que o 
i-ésimo elemento é a soma do i-ésimo elemento 
da lista 1 com o i-ésimo elemento da lista 2.
OBS.: Não se preocupou com listas de tamanhos
 diferentes como entrada.
+++++++++++++++++++++++++++++++++++++++++++++++ *)
fun sumLists ([],[]) = []
  | sumLists ((a::b),(c::d)) = ((a+c)::sumLists(b,d));