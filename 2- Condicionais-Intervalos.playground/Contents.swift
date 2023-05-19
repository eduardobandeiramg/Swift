// Condicionais:
let nome = "Eduardo"
let nome2 = "Joao"
let nome3 = "Francisco"

if nome == "Eduardo"{
    print("Nome: Eduardo")
}
else if nome == "Joao"{
    print("Nome: Joao")
}
else{
    print("Nem Eduardo e nem Joao")
}


// Operador Ternário:
nome == "Eduardo" ? print("Nome: Eduardo") : print("Nome incorreto!")


// Switch-Case:
switch nome3{
case "Eduardo": print("O nome é Eduardo")
case "Joao": print("O nome é Joao")
case "Francisco": print("O nome é Francisco")
default: print("Nome não especificado")
}

// Dentro de cada case é possível criar variáveis ou constantes:
switch nome3{
case var x where x == "Eduardo" : print("O nome é Eduardo") //Criada uma variável x (= nome3)
case let y where y == "Joao" : print("O nome é João") //Criada uma constante y (=nome3)
case _ where nome3 == "Francisco" : print("O nome é Francisco") //Não foi criada uma variável nem uma constante
default : print("Nome não especificado")
}
//As variaveis e constantes criadas são locais. No caso abaixo o compilador alertaria para erro de x e y fora do escopo
    //print(x)
    //print(y)


//Intervalos:
var numero = 20

switch numero{
case 0..<20 : print("Está no intervalo de 0 a 19")
case 20...30 : print("Está no intervalo de 20 a 30")
default : print("Intervalo não especificado")
}


// Gerando números aleatórios e usando intervalos em cláusulas "if":
let numeroAleatorio = Int.random(in: 1...1000)
print(numeroAleatorio)
var intervalo = 1...500
if intervalo.contains(numeroAleatorio){
    print("Acerto Mizeravi")
}
else{
    print("EROOOOOUUUUUU")
}
