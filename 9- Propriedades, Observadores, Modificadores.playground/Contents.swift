/*
 Em Swift existem 3 tipos de propriedades:
 - propriedades armazenadas
 - propriedades computadas
 - propriedades estáticas
 */


/*
 Observadores de Propriedades:
 
 Observadores são "métodos" disparados quando existe alguma modificação em atributos/propriedades de classes.
 Esses dois métodos são:
 - willSet
 - didSet
 
 O willSet possui um valor chamado newValue, que possui o novo valor do atributo após sua alteração
 O didSet possui um valor chamado oldValue, que possui o valor antigo do atributo após sua alteração
 */


/*
 Modificadores de acesso
 - private : torna o atributo ou o método privados, ou seja, não visíveis fora da classe
 - private (set) : o atributo ou método permanece público, mas se torna impossível modificà-los fora da classe
 */

class Cliente{
    // Atributos7Propriedades armazenadas (padrão)
    private(set) var nome : String
    var saldo : Double {
        // Como o saldo é um atributo constantemente modificado, cabe utilizar nele um observador
        willSet{
            //função chamada quando o saldo é modificado
            print("Saldo modificado. Novo valor: \(newValue)")
        }
        didSet(valorAntigo){
            //função chamada quando o saldo é modificado
            
            //nesse caso foi usado o polimorfismo de sobrecarga da função didSet, onde o valor antigo pode ser nomeado passando-se o seu
            //novo nome como parâmetro
            print("Saldo modificado. Valor antigo: \(valorAntigo)")
        }
    }
    
    // Atributo/Propriedade computada (calculada a todo momento)
    var negativado : Bool{
        return saldo < 0
    }
    
    // Atributo/Propriedade estática
    static var taxaTransferencia = 0.01
    
    // Construtor:
    
    init(_ nome : String , _ saldo : Double){
        self.nome = nome
        self.saldo = saldo
    }
    
    func alteraNome(_ nome : String){
        self.nome = nome
    }
}

let eu = Cliente("Eduardo" , 1000)
eu.nome
eu.saldo

//eu.nome = "Joao"
//vai dar erro, pois a variável nome é private(set) e não pode ser alterada fora da classe

eu.alteraNome("Joao")
print(eu.nome)
//Nesse caso não deu erro porque o atributo não foi modificado diretamente, mas sim foi chamada uma função que permite a modificação do atributo fora da classe
