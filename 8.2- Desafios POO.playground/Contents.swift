/*
 Desafio 1:
 
 Vamos simular uma situação de cadastro de funcionários!

 Crie uma classe Empregado que possuirá os seguintes atributos:
 A. Nome (String);
 B. Salário (Double).
 Crie uma classe filha de Empregado, a Gerente. Afinal de contas, gerente é um tipo de empregado.
 Na classe “Gerente”, adicione como atributo “departamento”, que deve ser uma String que diga a qual departamento o gerente pertence. Lembre de usar o super.init() para inicializar os atributos da classe pai.
 */

class Empregado {
    let nome : String
    var salario : Double
    
    init(_ nome : String , _ salario : Double){
        self.nome = nome
        self.salario = salario
    }
}

class Gerente : Empregado {
    let descricao = "Gerente"
    var departamento = "vendas"
    
    init(_ nome : String , _ salario : Double , _ departamento : String){
        super.init(nome , salario)
        self.departamento = departamento
    }
}

/*
 Desafio 2:
 
 Agora, com base no desafio anterior, vamos aprofundar!

 Crie uma outra classe filha chamada Vendedor.
 Faça um método chamado percentualComissao, que recebe como parâmetro o número de vendas que o vendedor realizou. Cada vendedor possui uma comissão de 10% sobre cada venda. Essa comissão é adicionada ao salário final. Retorne o valor final que o vendedor irá receber, supondo que cada venda possui um valor de R$50,00.
 */

class Vendedor : Empregado {
    let descricao = "Vendedor"
    
    func percentualComissao(_ vendas : Double) -> Double{
        return 50.0 * vendas * 0.1
    }
}

/*
 Desafio 3:
 
 Ainda com base no desafio anterior, vamos verificar os tipos de “Empregado”, se a instância é do tipo “Gerente” ou “Vendedor”.

 Crie uma função chamada verificaTipo que recebe, como parâmetro, uma instância do tipo Empregado;
 Faça o uso do typecasting para verificar se a instância é um gerente, vendedor ou apenas um outro empregado;
 Mostre no console o nome do empregado e a sua função. Caso o empregado for um gerente, mostre seu departamento também. O resultado final será parecido com esse:
 “O(a) empregado(a) Felipe é um(a) gerente e está no departamento RH.”
 “O(a) empregado(a) Daniel é um(a) vendedor.”
 */

func verificaTipo(_ instancia : Empregado){
    if instancia is Gerente{
        print("É gerente")
    }
    else if instancia is Vendedor{
        print("É vendedor")
    }
    else{
        print("Nem gerente e nem vendedor")
    }
}

func verificaTipoComTypeCasting(_ instancia : Empregado){
    if let verificador = instancia as? Gerente{
        print("É \(verificador.descricao)")
    }
    else if let verificador = instancia as? Vendedor{
        print("É \(verificador.descricao)")
    }
}

let gerente : Gerente = .init("Eduardo" , 1000, "vendas")
let vendedor = Vendedor.init("Eduardo" , 2000)

verificaTipo(gerente)
verificaTipo(vendedor)

verificaTipoComTypeCasting(gerente)
verificaTipoComTypeCasting(vendedor)
