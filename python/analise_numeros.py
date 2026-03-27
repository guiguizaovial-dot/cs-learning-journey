numero = int(input("Digite um numero (0 para parar): "))

soma = 0
contador = 0
maior = numero
menor = numero
pares = 0
impares = 0

while numero != 0:
    soma += numero
    contador += 1

    if numero > maior:
        maior = numero

    if numero < menor:
        menor = numero

    if numero % 2 == 0:
        pares += 1
    else:
        impares += 1

    numero = int(input("Digite outro numero (0 para parar): "))

print("\nRESULTADOS:")
print(f"Soma: {soma}")
print(f"Quantidade: {contador}")
print(f"Maior: {maior}")
print(f"Menor: {menor}")
print(f"Pares: {pares}")
print(f"Ímpares: {impares}")
