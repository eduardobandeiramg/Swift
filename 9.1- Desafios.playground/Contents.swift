/*
 Desafio 1:
 
 Crie uma classe/struct “Pessoa” que possua os seguintes atributos, que funcionarão como propriedades armazenadas:

 Nome (String);
 Idade (Int);
 Altura (Double);
 Peso (Double).
 E então, crie duas propriedades computadas:

 IMC (que retorna o índice de massa corporal da pessoa a partir da sua altura e peso);
 Adulto (que retorna se a pessoa é maior de 18 ou não, a partir do atributo “idade”).
 Caso não saiba, o IMC é calculado por peso / (altura * altura).
 */

struct Pessoa {
    let nome : String
    var idade : Int
    let altura : Double
    var peso : Double
    
    var imc : Double{
       return peso / (altura * altura)
    }
    
    var adulto : Bool {
        return idade >= 18
    }
    
    init(_ nome : String , _ idade : Int , _ altura : Double , _ peso : Double){
        self.nome = nome
        self.idade = idade
        self.altura = altura
        self.peso = peso
    }
}

/*
 Desafio 2:
 
 Na aula anterior, quando vimos sobre herança, criamos a classe “Empregado” que possuía como atributo o salário, lembra-se disso?

 Agora, vamos criar um observador de propriedade para esse atributo. Caso o salário seja alterado para um valor maior do que era, exiba no console a mensagem: “Parabéns, você recebeu uma promoção”. Caso o novo valor seja o mesmo que o anterior, exiba então a mensagem: “Parece que não houve uma promoção dessa vez.”.

 Por fim, se o novo valor do salário for menor do que já era anteriormente, bloqueie essa operação e exiba no console a mensagem: “O novo salário não pode ser menor do que era anteriormente”.

 Lembre-se que para pegar o valor antigo, use o didSet, e para pegar o valor novo, use o willSet.
 */

class Empregado {
    let nome : String
    var salario : Double{
        didSet{
            if salario < oldValue{
                salario = oldValue
                print("Tentativa de diminuição de salário. Será mantido o valor antigo")
            }
            else if salario == oldValue{
                print("Parece que não houve uma promoção dessa vez")
            }
            else{
                print("Parabens! Você recebeu uma promoção!")
            }
        }
    }
    
    init(_ nome : String , _ salario : Double){
        self.nome = nome
        self.salario = salario
    }
    
    func atualizarSalario(_ novoSalario : Double){
        salario = novoSalario
    }
}


let eu = Empregado("Eduardo" , 100)
eu.atualizarSalario(120)
eu.atualizarSalario(120)
eu.atualizarSalario(100)
print(eu.salario)
