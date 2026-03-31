opçao = 0 

while opçao != 4:
    print("\n ------ Calculadora --------")
    print("1 - somar")
    print("2 - subtrair")
    print("3 - multiplicar")
    print("4 - Sair")

    opcao = int(input("Escolhe uma opçao:"))

    if opçao == 4:
        print("Saindo da calculadora...")
        break

    num1 = float(input("Digite o primeiro numero:"))
    num2 = float(input("Digite o segundo numero:"))

    if opçao == 1:
        print("Resultado:", num1 + num2)
    elif opçao == 2:    
        print("Resultado", num1 - num2)
    elif opçao == 3:    
        print("resultado:", num1 * num2)
    else:
        print("opçao invalida!!!")
