// Para declarar variáveis não é necessário explicitar os tipos (se for inicializada junto com a declaração).
// Entretanto, é necessário deixar claro que uma nova variável está sendo criada, por meio da palavra "var"
var nome = "Eduardo"
var char = "a"
var inteiro = 10
var double = 10.5
var bool = true
print("Nome: \(nome) \nChar: \(char) \nInteiro: \(inteiro) \n...")

// Se a variável for declarada mas não for inicializada é necessário declarar explicitamente seu tipo
var nome2:String
var char2:Character
var inteiro2:Int
var double2:Double
var bool2:Bool
nome2 = "Francisco"
char2 = "F"
print("Nome2: \(nome2) \nChar2: \(char2) \n...")

// Para constantes, utiliza-se a palavra let
let nome3 = "Eduardo"
print(nome3)
//nome3 = "Francisco"
//print(nome3)
// O programa apresentará um erro, pois não é possível mudar o valor de constantes

//É possível criar uma "classe" de variáveis ou constantes, por meio do typealias. Exemplo:
typealias nomes = String
var primeiroNome:nomes = "Eduardo"
let segundonome:nomes = "Fernando"
