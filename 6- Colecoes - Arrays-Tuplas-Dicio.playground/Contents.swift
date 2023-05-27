                                                                    //ARRAYS:
//Existem diversas formas de declarar e inicializar variáveis contendo listas:
var exemplo1: [Double]
var exemplo2: [Double] = []
var exemplo3: [Double] = [1.0 , 2.0]
var exemplo4 = [5.0]
var exemplo5 : [Double] = Array<Double>()
var exemplo6 : [Double] = Array()
var exemplo7 = Array<Double>()
var exemplo8: [Double] = Array(arrayLiteral: 1.0)
var exemplo9 = Array<Double>(arrayLiteral: 1.0)
var exemplo10 = Array(arrayLiteral: 1.0)
var exemplo11 = [Double]()
//etc etc etc...

//Principais funções e propriedades de arraya: (retornam valores opcionais)
exemplo2.append(1.0)
exemplo2.append(2.0)
exemplo2.append(3.0)
exemplo2.append(4.0)
exemplo2.append(5.0)
exemplo2.insert(3.5, at: 3)
exemplo2.remove(at:4) //existem varios outros removes
exemplo2.first //existem vários outros a partir de first, como firstIndexOf etc
exemplo2.last
exemplo2.count
exemplo2.min()
exemplo2.max()
exemplo2.contains(2.0)
print(exemplo2.enumerated())

//Percorrendo Arrays:
for controle in exemplo2{
    print(controle)
}
print()

for i in 0..<exemplo2.count{
    print(exemplo2[i])
}
print()

for(index , elemento) in exemplo2.enumerated(){
    print(index , elemento)
}
print()

                                                                    //SETS (CONJUNTOS)
//Como conjuntos, os sets são não ordenados e sem repetição
//Não é possível acessar posições em conjuntos
//Só armazena valores de um único tipo
var conjunto : Set<Int> = [0]
conjunto.insert(1)
conjunto.insert(2)
conjunto.insert(3)
conjunto.insert(4)
conjunto.insert(5)
conjunto.insert(5)
conjunto.insert(5)
print("Conjunto: \(conjunto)")
print()

conjunto.contains(4)
conjunto.remove(4)
conjunto.remove(7)
print(conjunto.remove(2))
print()

                                                                    //TUPLAS
//Conjunto de elementos de diferentes tipos que podem apresentar chave-valor. São basicamente arryas cujos elementos podem ser de tipos diversos e que também podem ser identificados por chaves
var aluno : (matricula:Int , nome:String)
aluno = (1000 , "Eduardo")
aluno = (matricula:1001 , nome: "Francisco")

var notas = ("Eduardo" , 6 , 7 , 9 , 10)
var notas2 = (nome: "Eduardo" , nota1: 10 , nota2: 15 , nota3:8)

typealias Alunos = (Int , String)
let aluno1 : Alunos = (0 , "Eduardo")
let aluno2 : Alunos = (1 , "Francisco")
let aluno3 : Alunos = (matricula: 3 , nome: "Maria")
print("Alunos:")
print(aluno1.1)
print(aluno2.1)
print(aluno3.1)

typealias Inteiros = Int
var int1 : Inteiros = 0
var int2 : Inteiros = 1
var int3 : Inteiros = 2
var int4 : Inteiros = 3

//Desestruturação em Tuplas;
var (a , b) = aluno1
print(a)
print(b)

var(_ , d) = aluno2
print(d)
                                                                    //Dicionários
//Conjunto de dados armazenados seguindo o padrão chave-valor.
//Assim como conjuntos, não aceitam repetição de chaves (de valor ok) e não são ordenados
var declarandoDicio: [Int:String]
var criandoDicioVazio:[Int:String] = [:]
var criandoDicio = [
    000:"Eduardo",
    001:"Francisco",
    002:"João"
]
for duplas in criandoDicio{
    print(duplas)
}
for (chave, valor) in criandoDicio{
    print(chave , valor)
}
for chaves in criandoDicio.keys{
    print(chaves)
}
for valores in criandoDicio.values{
    print(valores)
}

criandoDicioVazio [000] = "Eduardo"
criandoDicioVazio.updateValue("Joao", forKey: 000)
criandoDicioVazio[000] = "Leonidas"
criandoDicio[0]
criandoDicio[1]
criandoDicio[2]
criandoDicio.removeValue(forKey: 001)
criandoDicio[002]?.removeLast()
criandoDicioVazio[0]//buscando valor pela posição no dicionario
criandoDicioVazio[000]//buscando valor pelo valor da chave
criandoDicioVazio.reserveCapacity(10)
