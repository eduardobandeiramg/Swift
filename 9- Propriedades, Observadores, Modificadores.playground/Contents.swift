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
 - private (set) : o atributo ou método permanece público para leitura, mas se torna impossível modificà-los fora da classe
 */

/*
 Gets e Sets:
 Todos os tipos de propriedades em Swift permitem definir sua visibilidade, métodos da classes de get e set e observadores de propriedades.
 No caso de propriedades computadas, além do citado, também é possível criar gets e sets personalizados da própria propriedades (quando a propriedade é acessada por meio do objeto (objeto.propriedade)). Lembrando que isso também pode ser feito com observadores. 
 Em Swift, para propriedades computadas, gets e sets são definidos implicitamente em cada variável, mas podem ser detalhados para adicionar lógica tanto na leitura quanto na alteração dessas propriedades. Esses gets e sets são definidos dentro da própria propriedade.
 Propriedades computadas podem ser utilizadas como armazenadas. Ou seja, seus valores não dependerão de outros atributos. Entretanto, sendo propriedades computadas, podem ser definidas regras de gets e sets.
 Para outros tipos de propriedades (armazenadas e estáticas) deve-se utilizar métodos, como padrão em outras linguagens (ou obsevadores)
 Caso deseja-se detalhar o acesso direto a variáveis (onjeto.variavel), tanto para visualização quanto para alteração, deve-se utilizar entao de willset e didset.
 */

class Cliente{
    // Atributos/Propriedades armazenadas (padrão)
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
    
    // Atributo/Propriedade computada (calculada a cada chamada da propriedade)
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
