# Developer: Vítor Caitité - 2016111849
# Exercício 2 - Tipo abstrato de dado Stack 
# que armazena objetos do tipo Node. O campo 'e'
# armazena uma stringe e o campo 'n' aponta
# para o próximo elemento na pilha.

class Node :
    def __init__ ( self ) :
        self.n = 0
        self.e = ''


class Stack:
    def __init__(self):
        self.head = Node()

    def add(self, data):
        new_node = Node()
        new_node.e = data
        new_node.n = self.head
        self.head = new_node

    def remove(self):
        if self.head.e == '' and self.head.n == 0:
            return None
        else:
            popped = self.head.e
            self.head = self.head.n
            return popped
        
    def isNotEmpty(self):
        if self.head.e != '' and self.head.n != 0:
            return True
        else:
            return False

# Example:
# s = Stack()
# s.add ( " Baltimore " )
# s.add ( " Lord " )
# s.add ( " Sir " )
# print(s.isNotEmpty())
# while (s.isNotEmpty()) :
#     print (s.remove())

