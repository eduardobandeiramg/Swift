//Comando for:
for i in 1...5{
    print("Repetição número \(i)")
}
print()

//Assim como no switch-case, onde é possível criar variáveis temporárias dentro da estrutura (case a where a...),o mesmo também é feito na estrutura do for.
//Semelhante ao switch case, onde é possível não criar variáveis temporárias (switch variavel case _ where variavel...), o mesmo também pode ser feito na estrutura do for:
for _ in 1...5{
    print("Repetição número (...)") //neste caso não exite mais uma variável armazenando o valor de controle.
}
print()


//Comando while:

var controle = 1
while controle <= 5{
    print("Repetição número \(controle)")
    controle+=1
}
print()


controle = 1
//Comando repeat while
repeat{
    print("Repetição número \(controle)")
    controle += 1
}while controle <= 5
print()


//Comando Break e Continue:
//O comando Break força a interrupção do laço, mesmo que ele ainda não tenha atingido sua condição de parada.
//O comando Continue força o retorno ao início do laço, mesmo que os comando no interior do laço não tenham sido completamente executados.

for i in 10...20{
    print(i)
    if i == 15{
        break
    }
}
print()

for i in 20...30{   //neste caso, o valor 21 não vai ser impresso porque a execução retornará ao inicio do laço antes que se chegue ao
    if i == 21{     //comando de printar o valor 21.
        continue
    }
    print(i)
}

