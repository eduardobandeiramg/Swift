/*Variáveis opcionais:
 Em Swift, uma variável não pode ser utilizada antes de ser inicializada.
 Para isso, é necessário que se usem variáveis opcionais, que podem conter tanto um valor nulo quanto um valor do tipo especificado.
 Exemplo:
 */

var texto : String?
print(texto) //usando a variavel texto, que pode conter uma String ou pode conter um valor nulo, dependendo do caso.
texto = "Adicionando um valor à variável"
print(texto)

//Será printado na tela primeiramente o valor "nil" e depois o valor "Optional("Adicionando um valor à variável)"

//Essa possibilidade de usar opcionais só serve no caso de variáveis. O que faz sentido, uma vez que constantes, uma vez que receberem o valor nulo, permanecerão para sempre com esse valor. Por causa disso, mesmo que se atribua um valor opcional a uma constante, não é possível utilizar as constantes antes de inicializá-las.

/* Variáveis, quando não são inicializadas, armazenam dentro delas o valor nulo até que sejam inicializadas.
 Porém, não é possível utilizá-las ao longo do programa.
 Além disso, uma vez que são inicializadas, não podem mais receber o valor nulo.
 Quando se usa opcionais, essas variáveis podem receber o valor nulo mesmo depois de serem inicializadas. */

//A variável texto, que antes armazenava um valor nulo, passou a armazenar um valor do tipo String. Entretanto, mesmo possuindo um valor armazenado diferente de nulo, esse valor encontra-se embrulhado.


                                                            // TÉCNICAS DE DESEMBRULHO
                            //Desembrulho forçado, Vinculação Opcional, Guard Let, Operador de Coalescência Nula e Encadeamento Opcional

        //(1) Desembrulho forçado (Forced Unwrapping) (não recomendado): para isso, basta colocar um ponto de exclamação após a variável.
print(texto!)
if texto != nil {
    print(texto!)
}
/*Entretanto, ao fazer esse desembrulho forçado, corre-se o risco de tentar desembrulhar um valor nulo, gerando um erro de execução e crashando a aplicação.
 Para que isso seja evitado, pode-se fazer um desembrulho seguro, como por exemplo:
 */

        //(2) Vinculação Opcional (Optional Binding) -> if let
            // Usando estrutura condicional if
var texto2 : String?
if let valortemporario = texto2{            //Também é comum utilizar if let texto2 = texto2 (ambas as variaveis com mesmo nome)
    //Executa caso texto2 seja diferente de nil
} //else ou não aqui

        //(3) Guard let (apenas dentro de uma função)
func desembrulhaInteiro (apelido variavelOpcional : Int?) -> Int{
    guard let constanteDeVerificacao = variavelOpcional else{
        //aqui, deve-se fazer um tratamento caso a variavel opcional tenha um valor nulo (return ou throw)
        return 0
    }
    return constanteDeVerificacao //aqui, define-se o que será retornado caso a variável opcional não seja nula
}
//Agora uma função sem retorno:
func desembrulhaInteiro (apelido variavelOpcional : Int?) {
    guard let constanteDeVerificacao = variavelOpcional else{
        //aqui, deve-se fazer um tratamento caso a variavel opcional tenha um valor nulo (return ou throw)
        return
    }
    print("Fim da função sem retorno")
    return
}

    //(4) Operador de Coalescência Nula
let opcionalUsandoCoalescenciaNula : Int? = nil
var variavel_armazena_valor = opcionalUsandoCoalescenciaNula ?? 0
print(variavel_armazena_valor)

var meuNome: String?
print(meuNome ?? "faiô")
//A variavel criada para armazenar o valor do opcional o fará caso esse opcional possua um valor dentro dele. Caso contrário, armazenará um valor de backup caso o opcional seja nulo, neste caso será 0
/*
 Basicamente, o operador ?? verifica se a variável possui um valor diferente de nulo.
 Se sim, executa o comando pedido no primeiro momento.
 Se não, ou seja, se armazena um valor nulo, executa o que está em seguida.
*/

    //(5) Encadeamento Opcional
        //Trata-se, basicamente, de utilizar a variável opcional (seja dentro de um comando print, seja usando um método, etc).
        //Quando usa-se as opcionais assim, sem fazer o desembrulho, o valor retornado estará dentro de um opcional ou nulo caso não seja possivel realizar uma operação com o valor do opcional dado. Ex.:
print("Exemplo de encadeamento opcional, usando um método em uma variável opcional: ")
var nome : String? = "Eduardo"
var nomeNulo : String?
var primeiraLetra = nome?.first //se tiver valor, realiza a função. Se não, segue o jogo
if let verifica = primeiraLetra{
    print("Primeira letra do nome: \(verifica)")
}

                                                                //Observações:
//1. Quando se usa o desembrulho por vinculação opcional com "if let" e "guard let", apenas as variáveis de verificação guardarão o valor. A variável opcional continua embrulhando o valor.
//2. O Mesmo tambem vale para o operador de coalescência nula
//3. Em alguns casos, o swift cria automaticamente variáveis opcionais. Um exemplo clássico é o exemplo de conversão de tipos. 


//Nao da pra desembrulhar o valor da opcional se o valor for nulo. Se tentar desembrulhar um valor nulo dá erro.
/*Por que variáveis opcionais são importantes e como são utilizadas pela própria linguagem para gerar segurança?
    Quando um usuário entra com dados do teclado, a variável que recolhe esse dado armazena uma string.
    Caso queira-se converter o valor digitado em inteiro, por exemplo, para fazer os tratamentos de inteiro, usa-se a conversão explícita.
    Quando a conversão é feita, o valor armazenado na variável estará embrulhado no caso de uma conversão correta e terá valor nulo caso a
    conversão não tenha sido feita corretamente.
 */


/*obs: É possível criar variáveis temporárias em vários casos em Swift:
 - Na estrutura if let, apenas para lidar com opcionais
 - Na estruthra switch case
 - Na estrutura for
 */
