
### ============================================
### INTRODUCAO AO R BASICO - Aula 1
### ============================================


# ----------------------------------------------
# Instrutores: 
#             
#             Arthur Queiroz  
#             queirozrarthur@gmail.com
#             
#             Virgilio Mendes
#             virgilioebm@gmail.com
#
# ----------------------------------------------

# Tudo que vem depois # é um comentário


# Regras de ouro:
# nomes minúsculos
# nunca use caracteres especiais (e.g: ç ã â)
# nomes de objetos sem espaço: meu_objeto
# nunca use numeros no começo: 1meuobjeto ou .objeto
# X é diferente x, Banco != banco

# Estilo

1+3+67-89 # como não fazer

1 + 3 + 67 - 89 # como fazer

# atribuição (preferencia de uso)
x <- 5

# outra forma =
y = 6 # É um operador de atribuição! Não é igual

# == teste lógico: igualdade
# != teste lógico: diferença


# Tipos dados ----

# 2 tipos de dados básicos:
# numeric: 1 , 56
# character: "texto"

# Objeto do tipo numeric
x <- 5
x

# Objeto do tipo character
y <- "Primeiro dia de curso"
y

# função para ver a classe de um objeto
class(y)
class(x)

# guardando mais de uma informação numérica em um objeto
sequencia <- 1:100

# chama vetor sequencia
sequencia

# c() é a função concatenar
c()

# vetor 
vetor <- c(0.1, 3.5, 100, 7500)

vetor

# retornando os elementos das posições dos vetores
vetor[1]
vetor[4]
# pode fazer operações com esses elementos
vetor[2] + vetor[3]


# Remover um objeto do Environment
codigo_ruim <- 111

# usa-se a função rm()
?rm()
# ou F1
rm(codigo_ruim)

# Limpa environment
rm(list = ls())

# ls() lista tudo que esta no environment
ls()

# rm() ou remove()

# Operadores Matemáticos ----------------------------------------------

# Operadores
2 + 2 # soma
5 - 5 # subtração
4 * 8 # multiplicação
10 / 2 # divisão
2^2 # exponencial
5 %% 2 # resto

# Funções
sqrt(100) # raiz quadrada
log(10)# Logaritmo
sum(2, 2, 4) # soma

# Operação com objetos
x <- 2
y <- 3

y * x # multiplicar
y^3 # exponencial
(x + y)/2

# print
print(x)

# Vetores ----------------------------


seq <- 1:100

seq

vetor <- c(0.1, 3.5, 100, 7500)

vetor

alunos <- c("Rafaela", "Ronan", "Luís", "Nathalia")

alunos

# indexando 
vetor[1]

alunos[2]

# Matrizes -------------------------------------------------------


# Linhas e Colunas - Estruturas de dados bidimensionais

matrix(data = 1:16, nrow = 4, ncol = 4, byrow = FALSE)

m <- matrix(data = 1:16, nrow = 4, ncol = 4, byrow = TRUE)

# [Linhas, Colunas]
m[1, ]
m[ ,2]
m[4,2]


# Data frames ----------------------------------------------------

nome <- c("Rafaela", "Ronan", "Luís", "Nathalia")
nome

idade <- c(23, 35, 18, 17)
idade

altura <- c(1.52, 1.90, 1.70, 1.75)
altura

# Criando banco data.frame
banco <- data.frame(nome, idade, altura)

banco

# class
class(banco)

# Visualizar
View(banco)

# Idexing
banco[1]

# banco[Linhas, Colunas]
banco[1, ]
banco[2,3]

# tambem pode identificar por nome
banco[ , "altura"]




# Pacote para instalar amanha:
#install.packages("dplyr")



