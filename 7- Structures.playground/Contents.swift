struct ContaCorrente{
    var saldo = 0.0 //Objetos de structures não podem ser criados com atributos não inicializados. Caso a estrutura padrão apresente algum atributo não inicializado, o construtor exigirá que se passe um valor para esse atributo.
    
    mutating func sacar(_ valor:Double){
        saldo -= valor
    }
//Funções em structures, por padrão, não podem alterar o valor dos atributos. Para permitir que elas façam isso, usa-se a palavra chave mutating
    
    mutating func depositar(_ valor:Double){
        saldo += valor
    }
}


var contaEduardo = ContaCorrente() //Apenas objetos armazenados em variáveis podem sofrer alterações
contaEduardo.depositar(1000.00)
contaEduardo.saldo

//Agora criando atributos não inicializados

struct ContaCorrente2{
    var nome: String
    var saldo: Double
    
    mutating func sacar(_ valor:Double){
        saldo -= valor
    }
    mutating func depositar(_ valor:Double){
        saldo += valor
    }
}

var contaFrancisco = ContaCorrente2(nome:"Eduardo" , saldo:1200.50)
contaFrancisco.sacar(200.50)
contaFrancisco.saldo

/*
 Structures, diferente de classes, possuem construtores padrões para o caso de nenhum construtor ser especificado.
 Esses construtores padrão funcionam adicionando os valores de cada atributo não inicializado, com seus respectivos nomes como chaves na passagem de parâmetro do construtor.
 Caso algum construtor seja especificado em structures, construtores padrões deixam de existir, a não ser que seja criado outro construtor semelhante ao construtor padrão
 
 As diferentes maneiras de se instanciar objetos de structures são exatamente iguais aos de classes:
 
 var meuRetangulo = Retangulo(base: 10 , altura : 5)
 var meuRetangulo2 = Retangulo.init(base: 10 , altura : 5)
 var meuRetangulo3 : Retangulo = .init(base: 10 , altura : 5)
 
 */
