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

//A variável texto, que antes armazenava um valor nulo, passou a armazenar um valor do tipo String. Entretanto, mesmo possuindo um valor armazenado diferente de nulo, esse valor encontra-se embrulhado.

//Existem algumas formas para desembrulhar esse valor:

//Desembrulhamento forçado (não recomendado): para isso, basta colocar um ponto de exclamação após a variável.

print(texto!)

/*Entretanto, ao fazer esse desembrulho forçado, corre-se o risco de tentar desembrulhar um valor nulo, gerando um erro de execução e crashando a aplicação.
 Para que isso seja evitado, pode-se fazer um desembrulho seguro, como por exemplo:
 */

var texto2 : String?
if texto2 != nil{
    print(texto2!)
}
//O desembrulho não será feito, pois o valor armazenado em texto2 é igual a nil (é nulo)
texto2 = "Agora possui um valor armazenado"
if texto2 != nil {
    print(texto2!)
}

//Nao da pra desembrulhar o valor da opcional se o valor for nulo. Se tentar desembrulhar um valor nulo dá erro.

/*Por que variáveis opcionais são importantes e como são utilizadas pela própria linguagem para gerar segurança?
 
 
 */


