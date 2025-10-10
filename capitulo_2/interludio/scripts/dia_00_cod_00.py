def opciones_0(n, lista=[]):
    """
    representacion como una lista de pares
    """
    if len(lista) == n:
        yield lista
    else:
        for i in range(n):
            for j in range(n):
                if (i,j) not in lista:
                    new_lista = list(lista)
                    new_lista.append((i,j))
                    yield from opciones_0(n, new_lista)


def opciones_1(n, lista=[]):
    """
    representacion como listas de enteros
    """
    if len(lista) == n:
        yield lista
    else:
        for i in range(n):
            if i not in lista:
                new_lista = list(lista)
                new_lista.append(i)
                yield from opciones_1(n, new_lista)

                
for i in opciones_0(3,[]):
    print(i)

for i in opciones_1(3,[]):
    print(i)
