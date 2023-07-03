/*
 Desafio 1 : Calculadora
 
 Crie uma classe/struct (a seu critério) chamada “Calculadora” que possua dois diferentes números como atributos;
 A. Esses números podem ser inteiros ou decimais, à sua escolha, e precisam ser inicializados pelo construtor de acordo com o que foi recebido por parâmetro;
 Produza 4 métodos referentes às operações básicas de cálculo: soma, subtração, divisão e multiplicação;
 A. Esses métodos não recebem parâmetros, mas eles retornam um valor do tipo inteiro ou decimal (à sua escolha). Os métodos agem em cima das propriedades citadas anteriormente;
 Instancie essa classe/struct com os dois valores em questão e chame todos os métodos citados;
 Por fim, exiba no console o resultado de todas as operações.
 */

class Calculadora {
    var numero1 : Double
    var numero2 : Double
    
    init (_ numero1 : Double , _ numero2 : Double){
        if numero1 >= numero2 {
            self.numero1 = numero1
            self.numero2 = numero2
        }
        else{
            self.numero1 = numero2
            self.numero2 = numero1
        }
    }
    
    init (){
        self.numero1 = 0.0
        self.numero2 = 0.0
    }
    
    func soma() -> Double{
        return numero1 + numero2
    }
    
    func subtrai() -> Double{
        return numero1 - numero2
    }
    
    func multiplica() -> Double{
        return numero1 * numero2
    }
    
    func divide() -> Double{
        return numero1 / numero2
    }
}

let minhacalculadora1 = Calculadora(10 , 2)
let minhacalculadora2 = Calculadora.init(10 , 2)
let minhacalculadora3 : Calculadora = .init(10 , 2)

print(minhacalculadora1.soma())
print(minhacalculadora1.subtrai())
print(minhacalculadora1.multiplica())
print(minhacalculadora3.divide())

/*
 Desafio 2 : Restaurante
 
 Crie uma classe/struct chamada “Restaurante” que tenha os seguintes atributos:

 Nome;
 Tipo de comida;
 Número de pedidos (esse sempre será inicializado como 0 no construtor).
 E então, implemente o seguinte método:

 recebePedido() → esse método acrescenta em 1 o valor do atributo referente ao número de pedidos;
 calculaTotalPedidos() → supondo que cada pedido tenha um valor fixo de R$35,00, crie um método que calcule e retorne o valor total em pedidos.
 */

class Restaurante {
    let nome : String
    var tipoDeComida : String
    var numeroDePedidos : Int
    
    init (_ nome : String , _ tipoDeComida : String){
        self.nome = nome
        self.tipoDeComida = tipoDeComida
        self.numeroDePedidos = 0;
    }
    
    func recebePedido () {
        numeroDePedidos += 1
    }
    
    func calculaTotalPedidos() -> Double{
        var valorTotal = Double(numeroDePedidos * 35)
        return valorTotal
    }
    
}

/*
 Desafio 3:
 
 Crie uma classe/struct chamada “Retângulo” que tenha os seguintes atributos:

 Base;
 Altura.
 E então, implemente os seguintes métodos:

 calcularArea() - retorna a área do retângulo, que é calculada por base multiplicado pela altura;
 calcularPerimetro() - retorna o perimêtro do retângulo, que é calculado pela soma de todos os lados.
 */


struct Retangulo {
    let base : Double
    let altura : Double
    
    mutating func calcularArea() -> Double {
        return base * altura
    }
    
    mutating func calcularPerimetro() -> Double{
        return 2 * base + 2 * altura
    }
}

var meuRetangulo = Retangulo(base: 10 , altura : 5)
var meuRetangulo2 = Retangulo.init(base: 10 , altura : 5)
var meuRetangulo3 : Retangulo = .init(base: 10 , altura : 5)
