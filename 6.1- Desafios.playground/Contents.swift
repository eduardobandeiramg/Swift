/*
 Desafio 1:
 
 Pense em um aplicativo que faz o cálculo da média de notas de alunos de uma turma! Ainda não podemos produzir um aplicativo, mas vamos usar essa situação para praticar um pouco:

 Escreva uma função que receba um array de notas de um determinado aluno e retorne a média aritmética dessas notas.
 */
func calculaMedia(_ notas:[Double]?) -> Double{
    var soma = 0.0
    var cont = 0
    guard let notas = notas else{
        return 0.0
    }
    for _ in notas{
        soma = soma + notas[cont]
        cont += 1
    }
    var total = Double(notas.count)
    return soma / total
}
calculaMedia([10 , 20 , 30])

/*
 Desafio 3:
 Dado um dicionário com duas letras que representam um estado como chave e o nome inteiro do estado como valor, escreva uma função que exiba todos os estados cujo nome tenha mais que 8 caracteres.
 Por exemplo, para o dicionário [”SP”: “São Paulo”, “CE”: “Ceará”, “RJ”: “Rio de Janeiro”], será exibido “São Paulo” e “Rio de Janeiro”, pois “Ceará” não possui mais de 8 caracteres.
 */
func maisDeOito(_ dicio:[String:String]?){
    var cont = 0
    guard let dicio = dicio else{
        return
    }
    for a in dicio.values{
        if a.count > 8{
            print(a)
        }
    }
}
var dicio1 = ["SP": "São Paulo", "CE": "Ceará", "RJ": "Rio de Janeiro"]
maisDeOito(dicio1)

