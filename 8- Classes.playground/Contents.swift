/*
 Diferenciar structures e classes:
 
 - quanto aos métodos
 - quanto aos construtores
 - quanto ao que é armazenado em variáveis/constantes (valor ou referência?)
 - quanto ao que implica esse tipo de armazenamento por valor ou por referência quando se trata de salvamento de objetos em variável ou constante
 - herança
 - deinit
 */

class ContaBancaria{
    // Atributos (ou propriedades) da classe
    var nome: String
    var saldo: Double
    
    // Construtor da classe, onde na chamada dever ser especificado o nome do parâmetro ("nome")
    init(nome: String){ //Métodos em classes não precisam do modificador mutating, elas podem naturalmente modificar parametros.
        self.nome = nome
        saldo = 0.0
    }
    // Construtor da classe, mas que recebe apenas valores
    init(_ nome:String , _ saldo:Double){
        self.nome = nome
        self.saldo = saldo
    }

    
    /* Enquanto structures podem ter atributos não inicializados que receberão um valor na hora de construir o objeto,
    Classes, se possuem qualquer atributo não inicializado, precisam de construtores para explicitar como os atributos receberão
    valores */
    
    // Métodos da classe
     func sacar(_ valor:Double){
        saldo -= valor
    }
    
     func depositar(_ valor:Double){
        saldo += valor
    }
}

//Diferentes formas de instanciar uma classe:

let minhaconta1 = ContaBancaria(nome: "Eduardo")
let minhaconta2 = ContaBancaria.init(nome: "Andre")
let minhaconta3 : ContaBancaria = .init(nome: "Felipe")


/*
 VARIÁVEIS E CONSTANTES ARMAZENAM A >>>> REFERÊNCIA <<<< PARA INSTÂNCIAS DE CLASSES (ENDEREÇO DE MEMÓRIA DO OBJETO)
 VARIÁVEIS E CONSTANTES ARMAZENAM A >>>> CÓPIA <<<< PARA INSTÂNCIAS DE STRUCTURES
 */


/*
 Principais diferenças entre structures e classes:
 
 QUANTO AOS CONSTRUTORES:
 Structures não precisam de construtores, são mais flexíveis em relação ao instanciamento de objetos. Assim, caso haja algum atributo não inicializado, basta inicializá-lo no momento da criação do objeto, passando como parâmetro o nome e o valor desse atributo.
 É possível criar construtores em structures também, caso seja desejado. De qualquer forma, é necessário garantir que nenhum objeto será criado com atributo não inicializado.
 Classes não são tão flexíveis quanto ao instanciamento de objetos. Caso exista algum atributo não inicializado, deve haver um construtor que explicite como esse atributo será inicializado no momento de se instanciar um objeto dessa classe.
 
 QUANTO AOS MÉTODOS:
 Métodos em structores por padrão não permitem que se altere valores de atributos a não ser que se explicite esse desejo por meio da palavra chave mutating antes de func.
 O mesmo não ocorre com classes, cujos métodos podem por padrão alterar os valores dos atributos da classe.
 
 QUANTO AO ARMAZENAMENTO DE OBJETOS EM VARIÁVEIS OU CONSTANTES:
 No caso de structures, objetos armazenados em constantes (let) não podem ser alterados, ou seja, todos os seus atributos estão agora fixos e imutáveis.
 O mesmo não ocorre com instâncias de classes, ou seja, objetos de classes, mesmo que armazenados em constantes (let) podem ter seus atributos internos alterados.
 (Isso ocorre porque variáveis e constantes armazenam structures por meio de passagem de valor, enquanto que, para classes, armazenam por referência.
 Assim, quando uma constante armazena uma instância de structure, esse objeto se torna imutável já que aquilo que está sendo armazenado na constante é uma cópia do objeto e, assim, nada pode ser alterado.
 O mesmo não ocorre para instâncias de classes, que armazenam a referência do objeto. Assim, as alterações feitas no objeto não serão vistas pela constante que armazena seu endereço de memória.
 
 */

//Herança em Swift:

// Classe mãe
class Conta {
    var saldo : Double
    
    // Construtor da classe, mas que recebe apenas valores
    init(_ saldo:Double){
        self.saldo = saldo
    }
    
    // Métodos da classe
     func sacar(_ valor:Double){
        saldo -= valor
    }
    
     func depositar(_ valor:Double){
        saldo += valor
    }
}

// Classe filha
class ContaCorrente : Conta {
    var limiteDeCredito : Double
    
    init (_ limite : Double , _ saldo : Double) {
        self.limiteDeCredito = limite
        super.init(saldo)
    }
}

// Classe filha
class ContaPoupanca : Conta {
    var aniversario = "03/07/2023"
}

let minhaconta : Conta
let minhacontacorrente = ContaCorrente(100 , 300)
print(minhacontacorrente.saldo)

// Em Swift, no construtor da classe filha, os atributos da classe filha DEVEM, NECESSARIAMENTE, serem inicializados antes de se chamar o construtor da classe pai

// Sobrescrita : override func ...

// Para chamar métodos e construtores da classe mãe na classe filha: super.metodo() / super.init() ...

// A palavra chave final serve para impedir que determinada classe possua herdeiros

// Verificar se uma variável salva um determinado tipo: if variavel is Classe (boa prática?)



/*
 Polimorfismo universal de inclusão (extremamente utilizado em padrões de projeto, como por exemplo no Strategy):
 
        "UMA CLASSE FILHA DEVE PODER SER TRATADA COMO UMA CLASSE MÃE"
 
 Seja um método de uma classe de fora, com alguma atribuição específica.
 Este método receberá uma classe mãe como atributo e executará um método presente na classe mãe e que pode ter sido sobrescrito ou apenas herdado pelas diversas classes filhas.
 O polimorfismo de inclusão, que afirma que classes filhas devem conseguir se comportar como a classe mãe, DETERMINA que, NECESSARIAMENTE, TODAS as classes filhas, caso sejam passadas como parâmetro nesta função, consigam executar o método chamado dentro deste outro método de fora.
 Caso ALGUMA classe filha não execute este método chamado (ou seja, o método que existe na classe filha), EXISTE UM ERRO na estrutura de herança, pois UMA CLASSE FILHA JAMAIS DEVE HERDAR ATRIBUTOS OU MÉTODOS QUE NÃO ESTEJAM SENDO UTILIZADOS.
 
 
 Esse polimorfismo é visto quando se salva um objeto de uma classe filha dentro de uma variável que armazena um tipo da classe mãe.
 De certa forma, isso também é visto no exemplo acima.
 */

class verificadoraDeSaldo{
    func verificaSaldo (_ conta : Conta) {
        print(conta.saldo)
        // Polimorfismo de inclusão acima (classe filha sendo tratada como mãe)
        print(type(of: conta))
        print(conta is ContaCorrente)
        
        // mesmo "conta" sendo do tipo "ContaCorrente", não está sendo possível acessar os atributos da classe filha através de "conta"
    
        if let testandoconta = conta as? ContaCorrente{
            testandoconta.limiteDeCredito
            // Agora foi possível acessar os atributos da classe filha "ContaCorrente". Foi feita uma conversão de tipos
        }
    }
}

/*
 Polimorfismo ad hoc de coersão (typecastinhg) :
 
            "Um objeto de uma classe filha, tratado como sua classe mãe, deve poder ser convertido para sua classe filha"
                                                                    mãe -> filha
 
 Seja um objeto de uma classe filha armazenado dentro de uma variável do tipo da classe mãe.
 DEVE ser possível armazenar esse objeto dentro de uma variável do tipo classe filha (para isso usa-se coerção)
 
 Comida comida;
 Pizza pizza
 comida = new Pizza()
 pizza = (Pizza) comida;
 
 No caso do exemplo citado, se quer acessar, agora, um método de uma classe filha, que não está presente na classe mãe.
 Para isso, se faz necessário transformar o objeto  que entrou no método e salva em uma variável do tipo "Conta" em uma variável do tipo correspondente da classe filha, para, assim, acessar o método da classe filha.
 */

var verificando = verificadoraDeSaldo()
verificando.verificaSaldo(minhacontacorrente)


/*
 Caso tanto a classe mãe quanto a classe filha já tenha todos seus atributos inicializados na declaração de suas estruturas, nenhum construtor é necessário.
 
 Pode ser que a classe mãe possua construtor, mas a classe filha não. Nesse caso, basta passar os parâmetros do construtor da mãe no momento de instanciar a classe filha.
 
 Pode ser que a classe mãe não possua construtor, mas a classe filha sim. Nessa caso, basta passar os parâmetros do construtor da filha no momento de instanciar a classe filha.
 
 Pode ser que tanto a classe mãe quanto a classe filha possuam construtores. Nesse caso, é necessário que o construtor da classe filha receba os parametros que atribuam valores aos atributos da classe filha e os definam e também recebam os atributos exigidos pelo construtor da classe mãe e chame o construtor da classe mãe depois de preencher os seus atributos que não sejam inicializados na declaração da classe
 */




/*
 O polimorfismo de inclusão diz que classes filhas se comportam como classes mãe.
 Um exemplo clássico desse comportamento está em um método ou função que recebe como parâmetro um tipo da classe mãe.
 Esse método ou função, então, receberá um objeto da classe filha, porém sendo apontado por uma variável do tipo da classe mãe.
 Essa variável terá acesso ao método da classe mãe que foi sobrescrito pelas classes filhas.
 Poderá então chamar esse método da classe mãe e, automaticante, será executado o método sobrescrito da classe filha.
 
 Caso existam métodos ou propriedades exclusivas de uma ou mais classes filhas e que não estejam na classe mãe, deverá ser utilizado então a conversão de tipos.
 Ou seja, se antes um objeto da classe filha era apontado por uma variável da classe mãe; agora esse objeto deverá ser apontado por uma variável do tipo da classe filha.
 Esse comportamento é chamado de polimorfismo de coerção e o procedimento de apontar um objeto da classe filha antes apontado por uma variável do tipo da classe mãe agora por uma variável do tipo da classe filha é chamado de TYPECASTING.
 */
