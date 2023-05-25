//Desafio 1: Escreva uma função que receba um parâmetro do tipo Int e verifique se esse número é primo ou não. O retorno dessa função pode ser um booleano, representando true se for primo ou false se não for primo.
func ePrimo(_ numero : Int?) -> Bool{
    var divisores = 0
    guard let numero = numero else{
        print("Nenhum valor válido foi adicionado!")
        return false
    }
    for cont in 1...numero{
        if numero % cont == 0{
            divisores += 1
        }
    }
    if divisores > 2 {
        return false
    }
    else{
        return true
    }
}
ePrimo(200)
ePrimo(307)
ePrimo(503)
ePrimo(nil)


/*Desafio 2:
 Crie uma função que receba um parâmetro que representa o nome de uma pessoa. Esse parâmetro é um **opcional**, ou seja, ele pode conter um valor ou ser nulo.
 Faça o tratamento correto dessa opcional:
 Caso seja nulo, exiba no console “Nome não especificado”;
 Caso contenha algum valor, exiba no console esse valor.*/
func printaNome (_ nome : String?){
    guard let nome2 = nome else{
        print("Valor não especificado")
        return
    }
    print("Nome passado: \(nome2)")
}
printaNome("Eduardo")
printaNome(nil)


/*Desafio 3:
 Imagine que você foi ao restaurante com um quantidade “n” de amigos e gastaram ao total um valor x. Faça um programa que contenha uma função que calcule quanto cada pessoa deva pagar.

 A função deve receber dois parâmetros: o valor total da conta e o número total de pessoas que irão dividir a conta;
 Não se esqueça dos 10% do garçom! Faça o cálculo em cima do valor total;
 Retorne quanto cada pessoa deve pagar e exiba esse valor no console, fora da função.
 Exemplo: a conta total deu R$120,00 e foram 4 pessoas no total. Calculando 10% em cima de R$120,00, o valor final ficará R$132,00. Dividindo esse valor por 4, cada pessoa deve pagar um total de R$33,00.*/
func totalDeCada(_ valorTotal : Double? , _ qtdePessoas : Int?) -> Double{
    if valorTotal != nil && qtdePessoas != nil{
        var valorTotal = valorTotal!
        var qtde = Double(qtdePessoas!)
        var valorComDezPorCento = valorTotal * 1.1
        return valorComDezPorCento / qtde
    }
    else {return 0.0}
}
totalDeCada(120, 4)

