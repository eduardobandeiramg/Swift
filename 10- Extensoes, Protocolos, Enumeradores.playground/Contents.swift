/*
 EXTENSÕES:
 
 Em Swift, é possível adicionar novas funcionalidades (propriedades e métodos) a tipos já existentes, sem alterar o tipo diretamente.
 Obs: caso se esteja adicionando uma nova propriedade por meio de extensão, ela não pode ser armazenada, apenas computada ou estática.
 
 Isso pode ser útil em diversos casos, como por exemplo:
 - adicionar funcionalidades a tipos (structures, em sua maioria) da própria linguagem, tipos esses os quais não se tem acesso direto
 - adicionar funcionalidades a tipos pelos quais não se tem aceso direto e os quais não é possível de serem alterados diretamente
 - adicionar funcionalidades a determinada estrutura, sem que outros colaboradores tenham que atualizar o novo formatuo da estrutura
 - agrupar funcionalidades semelhantes de uma estrutura, de forma a organizá-la
 */

// Criando um método de extensão da estrutura Int (adicionando método que verifica se um número é par):
extension Int {
    func ehPar() -> Bool{
        return self % 2 == 0
    }
}
//Agora o tipo Int, da própria linguagem swift, possui um novo método:
print(2.ehPar())
print(3.ehPar())

//Criando outro método para explicar diferença entre self e Self:
extension Int {
    func MultiplicarPor (_ valor : Self) -> Self {
        return self * valor
    }
}
//Self está apenas substituindo Int, pois trata-se do tipo da struct que a função está dentro.
//self está e sempre é relacionado ao objeto instanciado daquela estrutura. (self.atributo significa o atributo do objeto instanciado da classe )

//Implementando o método apenas para ilustrar:
print(10.MultiplicarPor(5))





/*
 PROTOCOLOS:
 
 Protocolos nada mais são do que interfaces.
 */

protocol CalculaImposto{
    var taxa : Double {get}
    // Por algum motivo que ainda não entendi, todas as propriedades de protocolos devem ter um {get} ou {get set} na frente, indicando que os métodos get / get-set deverão ser implementandos na estrutura que implementar o protocolo
    
    func calculaImposto(_ valor : Double) -> Double
}

class PessoaJuridica : CalculaImposto {
    // A implementação de protocolos possui a mesma estrutura de herança
    let nome : String
    var taxa: Double
    
    func calculaImposto(_ valor: Double) -> Double {
        return valor * taxa
    }
    
    init(_ nome : String , _ taxa : Double){
        self.nome = nome
        self.taxa = taxa
    }
}




/*
 ENUMERADORES:
 
 Em alguns casos, seja na criação de variáveis seja na passagem de valores para métodos e funções, é recorrente que o escopo de possibilidades desses valores (da variável ou do parâmentro da função) seja limitado e pré-determinado.
 Neste caso é interessante o uso de enumeradores, que são basicamente classes/objeto que definem um conjunto de valores possíveis para determinada entidade.
 Cada instância possível é tratada como uma propriedade dessa classe/objeto
 Enumeradores não podem ser instanciados, logo podem ser vistos como classes estáticas ou como objetos. Ou como ambos simultaneamente.
 
 */

enum DiasDaSemana1 {
    case domingo
    case segunda
    case terça
}

enum DiasDaSemana2{
    case segunda,
    terça,
    quarta,
    quinta,
    sexta,
    sabado,
    domingo
}

//Função que limita quais atributos pode receber. Se não receber o que espera, lança exceção (tratar)
func printaDiaDaSemana(_ dia : DiasDaSemana1){
    switch dia{
    case .domingo: print("Ontem foi \(ontem)")
    case DiasDaSemana1.segunda: print("Hoje é \(hoje)")
    case .terça: print("Amanhã será \(amanha)")
    
    }
}

let ontem = DiasDaSemana1.domingo
let hoje : DiasDaSemana1 = .segunda
let amanha = DiasDaSemana1.terça
printaDiaDaSemana(ontem)
printaDiaDaSemana(hoje)
printaDiaDaSemana(amanha)




/*
 RawValues:
 
 Cada item de enums possui valores "crus" associados
 Para que o enumerador passe a possuir esses valores crus associados, é necessário que o enum implemente o tipo do valor que deseja possuir associado a cada item.
 Por exemplo, pode implementar Int , Double , String
 É possível implementar um valor inicial que será incrementado ou criar um rawValue para cada item
 */

enum DiasDaSemana3 : Int{ //Implementando rawValue para cada item
    case segunda,
    terca,
    quarta,
    quinta,
    sexta,
    sabado,
    domingo
}
print("Valor cru de segunda: \(DiasDaSemana3.segunda.rawValue)\nValor cru de terça: \(DiasDaSemana3.terca.rawValue)")

//Agora modificando o valor do primeiro:
enum DiasDaSemana4 : Int{ //Implementando rawValue para cada item
    case segunda = 1,
    terca,
    quarta,
    quinta,
    sexta,
    sabado,
    domingo
}
print("Valor cru de segunda: \(DiasDaSemana4.segunda.rawValue)\nValor cru de terça: \(DiasDaSemana4.terca.rawValue)")

//Agora para o rawValue ser um Double:
enum DiasDaSemana5 : Double{ //Implementando rawValue para cada item
    case segunda = 1,
    terca,
    quarta,
    quinta,
    sexta,
    sabado,
    domingo
}
print("Valor cru de segunda: \(DiasDaSemana5.segunda.rawValue)\nValor cru de terça: \(DiasDaSemana5.terca.rawValue)")

//Agora para o rawValue ser uma String:
enum DiasDaSemana6 : String{ //Implementando rawValue para cada item
    case segunda,
    terca,
    quarta,
    quinta,
    sexta,
    sabado,
    domingo
}
print("Valor cru de segunda: \(DiasDaSemana6.segunda.rawValue)\nValor cru de terça: \(DiasDaSemana6.terca.rawValue)")

//Agora criando valores quaisquer para cada rawValue
enum DiasDaSemana7 : Int{ //Implementando rawValue para cada item
    case segunda = 100,
    terca = 200,
    quarta = 300,
    quinta = 400,
    sexta = 500,
    sabado = 600,
    domingo = 700
}
print("Valor cru de segunda: \(DiasDaSemana7.segunda.rawValue)\nValor cru de terça: \(DiasDaSemana7.terca.rawValue)")

/*
 Valores associados
 
 Enumeradores também podem ter, além de valores crus associados aos itens, COMPORTAMENTOS associados a cada item, que serão retornados em funções.
 */

enum SituacaoDoCliente{
    case APROVADO(mensagem:String),
    REPROVADO (mensagem:String),
    EMANALISE (mensagem:String),
    REVISAO (mensagem:String)
}
