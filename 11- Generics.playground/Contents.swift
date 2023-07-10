/*
 GENERICS
 
 Swift é uma linguagem fortemente tipada, mas as vezes isso pode gerar um problema.
 Por exemplo em funções, onde os valores a serem recebidos podem variar, ou mesmo em estruturas.
 Para exemplificar, pode-se citar a função soma, que pode receber dois inteiros, dois doubles, um inteiro e um double ou um double e um inteiro.
 Sem generics, seria necessário criar 4 funções diferentes, uma para cada possibilidade de parâmetros (polimorfismo de sobrecarga)
 */

func soma <T : Numeric> (_ numero1 : T , _ numero2 : T) -> T{
    return numero1 + numero2
}

print(soma(10 , 10))
print(soma(10.0 , 10.0))
print(soma(10 , 10.0))
print(soma(10.0 , 10))

