# Developer: Vítor Caitité - 2016111849
# Exercício 3 - Tipo abstrato de dado Queue
# que armazena objetos do tipo Node. O campo 'e'
# armazena uma stringe e o campo 'n' aponta
# para o próximo elemento na queue.

class Node :
    def __init__ ( self ) :
        self.n = 0
        self.e = ''

class Queue(object):    
    def __init__(self):  
        self.head = Node()        
        self.tail = self.head

    def isNotEmpty(self):
        return self.head != self.tail
    
    def add(self, data):
        new_data = Node()
        new_data.e = data
        self.tail.n = new_data
        self.tail = new_data
    
    def remove(self): 
        node = self.head.n
        data = node.e
        self.head.n = node.n
        if self.head.n == 0:
            self.tail = self.head
        return data

    def getSmaller(self):
        if self.isNotEmpty() == False:
            return None
        node = self.head.n
        smallest = node.e
        # Checking the elements between heand and tail
        while node != self.tail:
            if node.e < smallest:
                smallest = node.e
            node = node.n
        # Checking the element of the tail    
        if node.e < smallest:
                smallest = node.e
        return smallest    


# Example
# q = Queue()
# q.add ("C")
# q.add ("B")
# q.add ("A")
# print(q.getSmaller())
# print(q.isNotEmpty())
# while (q.isNotEmpty()):
#     print (q.remove())
# print(q.isNotEmpty())
