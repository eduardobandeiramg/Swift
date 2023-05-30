class ContaCorrente{
    var nome: String
    var saldo: Double
    
    init(nome: String){ //Métodos em classes não precisam do modificador mutating, elas podem naturalmente modificar parametros.
        self.nome = nome
        saldo = 0.0
    }
    
    init(_ nome:String , _ saldo:Double){
        self.nome = nome
        self.saldo = saldo
    }
    
    /* Enquanto structures podem ter atributos não inicializados que receberão um valor na hora de construir o objeto,
    Classes, se possuem qualquer atributo não inicializado, precisam de construtores para explicitar como os atributos receberão
    valores */
    
     func sacar(_ valor:Double){
        saldo -= valor
    }
    
     func depositar(_ valor:Double){
        saldo += valor
    }
}
