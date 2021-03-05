# Developer: Vítor Caitité - 2016111849
# Exercício 8 - Calculadora Interatva

class FormulaError(Exception):
    def __init__(self, msg):
        self.value = msg
    def __str__(self):
        return repr(self.value)

# Função para captura a entrada do usuário 
def captureExpression():
    expr = input(">>> ")
    expr = expr.split(" ")
    if len(expr) != 3:
        raise FormulaError("A entrada nao consiste de 3 elementos")
    else:
        return expr

# Calculadora que capta a entrada do usuario, realiza a operaçao 
# desejada e retorna o resultado. Retorna exceções nos seguintes 
# casos: 
# - entrada diferente de 3 elementos (lembrando que os elementos 
# devem ser separados por espaço)
# - Não conseguir converter operands para float
# - Operando inválido
# - Divisao por 0 (adicional) 
def calculator():
    expr = captureExpression()
    try:
        op1 = float(expr[0])
        op2 = float(expr[2])
    except ValueError:
        raise FormulaError("O primeiro e o terceiro valor de entrada devem ser numeros")
    result = 0
    if expr[1] == "*" :
        result = op1*op2
    elif expr[1] == "/" :
        if op2 == 0:
            raise FormulaError("Divisao por 0")
        else:
            result = op1/op2
    elif expr[1] == "+" :
        result = op1+op2
    elif expr[1] == "-" :
        result = op1-op2
    else:
        raise FormulaError("x nao e um operador valido")
    return result


# Roda até o usuário interromper manualmente
while True:
    try:
        print(calculator())
    except FormulaError as fe:
        print(fe.value)