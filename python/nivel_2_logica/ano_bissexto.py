anos = int(input("Digite um ano:"))

if (anos % 4 == 0 and anos % 100 != 0) or anos % 400 == 0:
    print("Ele é bissexto")
else:
    print("Ele nao e bissexto")
