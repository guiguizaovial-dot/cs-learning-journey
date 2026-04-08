secreto = 7

numero = float(input("Digite um número: "))

while numero != secreto:
    if numero > secreto:
        print("Muito alto")
    else:
        print("Muito baixo")
    
    numero = float(input("Digite outro número: "))

print("Acertou o número!")
