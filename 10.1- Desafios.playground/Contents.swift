/*
 Desafio 1:
 
 Crie um protocolo chamado “Area” que define uma propriedade que pode apenas ser lida, e não setada, que corresponde a área de determinada figura, com o tipo Double. Essa propriedade é definida como uma propriedade computada, mas lembre-se que no protocolo não há diferenciação entre propriedades armazenadas ou computadas, você apenas define uma propriedade.

 E então, crie duas classes (ou structs) que implementem o protocolo Area: Quadrado e Triangulo. Implemente o cálculo da área de acordo com cada figura (cada classe precisa receber os parâmetros necessários para o cálculo) e por fim, imprima o valor de cada área no console.
 */


protocol Area{
   var area : Double {get}
    
    
}
 
class Quadrado : Area {
    var lado : Double
    var area : Double{
        return lado * lado
    }
    
    init(_ valor : Double){
        self.lado = valor
    }
}

struct Triangulo : Area {
    var base : Double
    var altura : Double
    
    var area : Double {
        return (base * altura) / 2
    }
    
    init(_ valor1 : Double , _ valor2 : Double){
        self.base = valor1
        self.altura = valor2
    }
    
}

let quadrado = Quadrado.init(5)
print(quadrado.area)
quadrado.lado = 7
print(quadrado.area)


var triangulo = Triangulo(20, 5)
print(triangulo.area)
triangulo.altura = 10
print(triangulo.area)


/*
 Desafio 2:
 
 Veja o código abaixo:
 
 enum Moeda: Int {
   case UmCentavo = 1
   case CincoCentavos = 5
   case DezCentavos = 10
   case VinteCincoCentavos = 25
   case CinquentaCentavos = 50
 }

 let moedas: [Moeda] = [.CincoCentavos, .UmCentavo, .CincoCentavos, .VinteCincoCentavos, .CincoCentavos, .DezCentavos]
 
 De acordo com esse código, crie uma função que recebe como parâmetro um array do tipo “Moeda”. Faça a soma de todos os valores desse array segundo o raw value e retorne essa soma.

 No caso do exemplo acima, o que deve ser retornado da função é o valor 51, que é a soma de todas as moedas desse array declarado.
 */

enum Moeda: Int {
  case UmCentavo = 1
  case CincoCentavos = 5
  case DezCentavos = 10
  case VinteCincoCentavos = 25
  case CinquentaCentavos = 50
}

let moedas: [Moeda] = [.CincoCentavos, .UmCentavo, .CincoCentavos, .VinteCincoCentavos, .CincoCentavos, .DezCentavos]

func calculaSoma(_ vetor : [Moeda]) -> Int{
    var soma = 0
    for i in vetor{
        soma += i.rawValue
    }
    return soma
}

print(calculaSoma(moedas))

