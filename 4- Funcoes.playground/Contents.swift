//Funções:

//Existem 4 tipos de funções em Swift, quanto aos parâmetros.

//(1.1)Aquelas que não possuem parâmetros na chamada.
//(1.2)Aquelas em que se passam apenas valores na chamada.
//(1.3)Aquelas em que se passam valores na chamada, com seus respectivos identificadores.
//(1.4)Aquelas em que se criam "apelidos" para os identificadores (método chamado de "argument label")

//Existem 2 tipos de funções quanto ao retorno:
//(2.1) Retornam algo
//(2.2) Não retornam nada

//Ao final, observação sobre passagem por valor e por referência.


//Tipo 1:
func mostraSaudacao(){
    print("Olá mundo")
}

//Tipo 2:
func soma(_ numero1:Int , _ numero2:Int) -> Int{
    return numero1 + numero2
}

//Tipo 3:
func soma(numero1:Int , numero2:Int) -> Int{
    return numero1 + numero2
}

//Tipo 4:
func soma(_ numero1:Int , mais numero2:Int) -> Int{
    return numero1 + numero2
}



//Chamando a função 1:
mostraSaudacao()
print()

//Chamando a função 2:
print(soma(5 , 5))
print()

//Chamando a função 3:
print(soma(numero1:5 , numero2:5))
print()

//Chamando a função 4:
print(soma(5 , 5))
print()

//Também é possível passar variáveis como parâmetros:
var inteiro1 = 10
var inteiro2 = 20
print(soma(inteiro1 , inteiro2))




/*Em swift, quando uma função é chamada e são passadas variáveis como atributos, essas variáveis são tratadas, dentro da função, como constantes.
 Isso significa que, dentro da função, as variáveis não podem ser alteradas. Isso acontece porque o que houve foi uma passagem de parâmetro por valor, ou seja, o que entrou na função não foi a variável, mas sim o valor. Isso implica que qualquer tentativa de alterar o valor dentro da variável passada resultará em erro.
 Tentar mudar o valor, nesse caso, seria o equivalente a tratar uma constante - como um inteiro por exemplo, como uma variável, o que não faz sentido. */


/*Caso deseja-se fazer uma passagem por referência, ou seja, fazer com que a variável em si entre na função, permitindo a alteração do valor armazenado nessa variável, é necessário cumprir duas exigências: escrever a palavra chave inout na frente do tipo do parâmetro e, na chamada da função, escrever & na frente do parâmetro. */

//Exemplo:

func retornaMetade(_ valor: inout Double) -> Double{
    valor = valor / 2
    return valor
}

var numero = 10.0
print("Valor antes da passagem por referência: \(numero)")
retornaMetade(&numero)
print("Valor depois da passagem por referência: \(numero)")


