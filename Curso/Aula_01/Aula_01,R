### ============================
### INTRODUCAO AO R BASICO - Aula 1
### ============================


# ---------------------------------------------
# Instrutores: 
#             
#             Arthur Queiroz  
#             queirozrarthur@gmail.com
#             
#             Virgilio Mendes
#             virgilioebm@gmail.com
#
# ----------------------------------------------

# Limpar o environment

rm(list = ls())

### CONVENCOES NO R ------------------------------------------------------------

# Criar um novo objeto com o operador '<-'
x <- 1
y <- 2


# Mas perceba que, se nao colocarmos nada depois de '<-', o R retornara um erro
x <- 1


# Remove x e y da memoria (?rm para acessar a documentacao)
rm(x, y)

# Na nomeacao de objetos e' preciso evitar:
# - Nomes iguais ao de uma funcao: e.g. rm <- 1
# - Nomes que comecam por numero: 1x <- 1
# - Nomes que comecam com caracteres especiais: _a <- 1 ou .1 <- 1
# - Nomes com espaco: meu objeto <- 1
# - Tambem e' boa pratica nao usar letras maiusculas porque o R
# e' case sensitive.

### ESTILO ---------------------------------------------------------------------

# Para manter a legibilidade do codigo, e' sempre bom usar espacos
# entre argumentos, objetos e parametros. Exemplo:

x<-1 # Ruim
x <- 1 # Bom

2*1+4+2 # Ruim
2 * 1 + 4 + 2 # Bom

x+x+sum(x,x,na.rm=TRUE) # Ruim
x + x + sum(x, x, na.rm = TRUE) # Bom


# Tambem e' bom usar _ para espacar nomes dos objetos
meuobjeto <- 1 # Ruim
meu_objeto <- 1 # Bom


# E evitar acentos e caracters especiais, mesmo nos comentarios (porque pode abrir de 
# forma errada em outros computadores):

ação <- 1 # Ruim
acao <- 1 # Bom


# Por fim, uma boa pratica e' sempre pular uma linha entre codigos diferentes,
# do mesmo modo como este codigo esta organizado: cada bloco de codigo esta
# separado por dois espacos. Por exemplo:

x <- 2
y <- 3

print("Exemplo de texto nao relacionado com x e y.")

### TIPOS ----------------------------------------------------------------------

# O R tem dois tipos basicos de objetos principais:
# - numeric, para armazenar numeros; e
# - character, para armazenar caracteres e strings.

## O tipo numeric

# Podemos criar um vetor numerico de um a 100
vec <- 1:100


# Podemos criar vetores com casas decimais:
vec <- c(0.1, 3.5, 2.556, 5.1)


# E, com um vetor criado, podemos acessar apenas um ou mais elementos dele com []:
vec[1] # acessa o primeiro elemento do vetor 'vec'
vec[3] # acessa o terceiro elemento do vetor 'vec'
vec[1] + vec[3] # soma o primeiro e o terceiro elementos de 'vec'


# E usamos a funcao is.numeric() para verificarmos se um objeto
# e' numeric:
is.numeric("texto")

# A funcao retorna TRUE, que e' um outro tipo basico que nao vamos abordar
# agora. Basicamente, TRUE equivale a verdadeiro (o R testa uma afirmacao)
# e FALSE para negativo. 

# Character
k <- "Oi, você está fazendo um curso de R"
k/2 # Mostrar que nao podemos fazer operacoes com objetos do tipo character

### OPERADORES MATEMA'TICOS ----------------------------------------------------

2 + 2     # Soma
5 - 5     # Subtracao
2 * 10    # Multiplicacao
15 / 3    # Divisao
2^2       # Exponencial

sqrt(12)    # Raiz Quadrada
log(10)     # Logaritmo natural de 10
sum(2, 2)   # Funcao para somar
sum(2, 2)   # Erro, por falta da virgula. 

# Podemos relacionar objetos

x <- 2        
x <- 2 * 2

x + 4
x * 2

x * x
x^x

print(x) 

print(X)   # R e' case sensitive

### VETORES --------------------------------------------------------------------

x = c(6, 8, 10, 3) # Comando c() cria um vetor - funcao concatenar
y = c(4, 6, 3, 5) 

# Operacoes com vetores devem ter vetores com o mesmo numero de elementos

x + y 
x - y
x * y
x / y
z <- x + y + 10

# Vetores representam um conjunto de informação que é armazenado em uma ordem 
# especi'fica. Utilizamos a funcao “c()”, que significa “concatenar”, para criar 
# um vetor com multiplos valores, com virgulas os separando.
# Por exemplo, criaremos aqui um vetor com a populacao mundial estimada, de 
# acordo com levantamentos da ONU, dos anos de 1950 a 2010:

pop.mund <- c(2525779, 
              3026003, 
              3691173, 
              4449049, 
              5320817, 
              6127700,
              6916183)

pop.mund

# A funcao c() tambe'm pode ser usada para concatenar VETORES
pop.first <- c(2525779, 3026003, 3691173)
pop.second <- c(4449049, 5320817, 6127700)
pop.all <- c(pop.first, pop.second, 6916183)
pop.all

# MATRIZES ---------------------------------------------------------------------

# Linhas e colunas - Estruturas de dados bidimensionais

# Matrizes e bancos de dados
A = matrix(data = 1:16, 
           nrow = 4, 
           ncol = 4)

A # criando matrix 4 por 4 (numeros de 1 a 16)

# Linhas 
# representacao [1,]

# Colunas 
# representacao [,1]

A[2,4]

# DATA FRAMES ------------------------------------------------------------------

nome = c("Virgilio", "Arthur", "Equalitas")
idade = c(52, 24, 29)
altura = c(1.71, 1.76, 1.78)

banco = data.frame(nome, idade, altura)
?data.frame

class(banco$nome) # Tira classe da variavel

View(banco) # Visualiza df
banco

names(banco)

names(banco) <- c("Alunos", "Idade", "Altura")

names(banco)

# Indexing:
banco[1]
banco(1)

banco[1,1]

# Extraindo TODAS as linhas (ou observacoes) de uma determinada coluna:
banco[, 1]
banco[, "Alunos"]

# Extraindo um número X de linhas e TODAS as colunas:
banco[c(1, 2, 3), ]
banco[1:2, ]
banco[c(1,4), ] # Nao existe um 'quarto' aluno

# Extraindo um nu'mero X de linhas de UMA coluna especi'fica:
banco[c(1:3), "Idade"]

# MANIPULANDO TEXTO ------------------------------------------------------------

# funcoes ba'sicas para manipulacao de texto

nome = "Arthur"

sobrenome = "Queiroz"

paste(nome, sobrenome) # paste mostra objeto no console

p1 = "Eu"
p2 = "gosto"
p3 = "de"
p4 = "café"

paste(p1, p2, p3, p4)

paste(p1, p2, p3, p4, sep = ",") # atribuir separador

frase = paste(p1, p2, p3, p4)   # criando objeto da frase a partir do paste
tolower(frase)                  # todos os caracteres em minu'sculo
toupper(frase)                  # todos os caracteres em maiu'sculo
frase

grep("não!", frase)             # funcao de buscar padroes de texto
grep("gosto", frase)
grep("escola", frase)           # busca padroes textuais  
grep("café", frase)             # busca padroes textuais


gsub("gosto de", "odeio", frase)  # substituição de caracteres
gsub("de", "DE", frase)           # função de substituição de caracteres 
                                  # (substituição de "de" por "DE")

