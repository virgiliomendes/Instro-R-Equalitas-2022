### ============================
### INTRODUCAO AO R BASICO - Aula 2
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
# ------------------------------------------------------------------------------


# Material de Apoio:
# Dplyr Website: https://dplyr.tidyverse.org/
# Dplyr Cheat Sheet: https://rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf
#

## PREAMBULO -------------------------------------------------------------------

# Instalando o Dplyr:
#install.packages("dplyr")

library(dplyr)


# Limpando nosso ambiente:
rm(list = ls())

# Setar Diretório (se não estiver usando um projeto)
setwd(choose.dir())
getwd()

##------------------------------------------------------------------------------

# Banco de Dados:
## Para essa aula usaremos o banco de dados IRIS, já presente no R:
## O banco de dados IRIS contem a classificação de diferentes tipos da planta Íris, 
## baseado em quatro atributos.
iris = iris

names(iris)
dim(iris)
str(iris)
summary(iris)


# pacote com datasets no R
datasets::mtcars


##------------------------------------------------------------------------------

# Dplyr:

# Banco de Dados: iris

## Glimpse e Arrange:


### Glimpse nos oferece um resumo, bem direto, do banco de dado:
## "Olhada Rápida":
glimpse(iris)

### dbl: números reais;
### int: inteiros;
### fct: factor 

### Arrange: serve para reordenar as linhas de acordo com os valores de uma coluna:
arrange(iris, Sepal.Width)
arrange(iris, desc(Sepal.Width))


## Select e Filter
### Selecionando as variáveis desejadas:
select()
select(iris, c(Sepal.Length, Sepal.Width, Species))

db <- select(iris, Sepal.Length, Sepal.Width, Species)

class(db)
dim(db)
names(db)

### Se, ao invés de selecionar todas, o objetivo for apenas deletar uma, ou duas:
db_n <- select(iris, -Sepal.Length, Species)
db_n <- select(db, - c(Petal.Length, Petal.Width))

dim(db_n)
names(db_n)

## Filter:
db_n <- filter(iris, Species == "versicolor" & Petal.Length > 4.3)


## Podemos também combinar essas duas funções:
### Por exemplo: Imagine que estamos estudando as pétalas da íris de tipo versicolor;
### Vamos filtrar o banco para obtermos APENAS as plantas do tipo "Versicolor" e
### aquelas que possuem Petalas de comprimento MAIOR que 4.35; além disso precisamos apenas das
### variáveis Species, Petal.Length e Petal.Width

db_n <- filter(iris, Species == "versicolor" & Petal.Length > 4.3)
db_n <- select(db_n, Species, Petal.Length, Petal.Width)
db_n <- select(db_n, Petal.Length, Petal.Width,  Species)

db_n
View(db_n)


## Mutate e Rename:

### Rename: Usamos para renomear determinadas colunas de um Data Frame:
rename(iris, Largura_Sepala = Sepal.Width)
rename(iris, largura.sepala = Sepal.Width,
       teste = Species)

### Usando Rename para Renomear as Variáveis, mundando de Inglês para Português
db_pt <- rename(iris, c(Largura_Sepala = Sepal.Width, Comprimento_Sepala = Sepal.Length,
                        Largura_Petala = Petal.Width, Comprimento_Petala = Petal.Length,
                        Tipo = Species))

names(db_pt)


db_pt

### Mutate: Usamos para criar novas variáveis
mutate(iris, sepala = Sepal.Width + comprimento_sepala)
mutate(iris, sepala = mean(Sepal.Width))
mutate(iris, sepala = mean(Sepal.Width))

db_pt <- mutate(iris, x1 = sqrt(Sepal.Width), x2 = sqrt(comprimento_sepala))
db_pt <- rename(iris, raiz_quadrada_larg_sepala = x1,
                raiz_quadrada_comp_sepala = x2)

View(db_pt)

## Mutate: rowMeans:
#?rowMeans : (x) 
mutate(iris, sepala = rowMeans(select(iris, Sepal.Width, Sepal.Length)))


## Pipe : %>%
### Pipe (%>%) faz com que o objeto da esquerda seja o primeiro argumento, ou o objeto ao que
### o que está na direita será aplicado sobre:

x %>% sum()
1:10 %>% sum() 
# sum(1:10)

### Logo, o código: 
db_n <- filter(iris, Species == "versicolor" & Petal.Length > 4.3)
### Pode ser escrito dessa forma:
db_n <- iris %>%
  filter(Species == "versicolor" & Petal.Length > 4.3)

### A função principal do operador %>%, além de facilitar a escrita do código, é torna-lo mais
### fácil de ler, por exemplo:
#### Nosso código antigo:
db_n <- filter(iris, Species == "versicolor" & Petal.Length > 4.3)
db_n <- select(db_n, Petal.Length, Petal.Width, Species)

#### Pode ser escrito, usando %>%, da seguinte maneira:
db_n <- iris %>%
  filter(Species == "versicolor" & Petal.Length > 4.3) %>%
  select(Petal.Length, Petal.Width, Species)

db_n


rm(list = ls())






# A partir daqui é extra, não sei se dá tempo seria: group_by, case_when, summarize

##------------------------------------------------------------------------------

## Split, Apply e Combine:


### Split, Apply e Combine é um dos processos mais comuns de análise de dados. 
### Em tradução livre: dividir, aplicar e combinar.
### No Dplyr, esse processo é representado pelas funções "group_by()" e "summarise()".
### No entanto, antes vamos aprender o que essas funções fazem:

### Group_by(): Agrupa os dados por variáveis fornecidas. Sozinho, o group_by não muda como os dados são
### mostrados. A mudança vem apenas quando combinado com outros verbos do Dplyr:
View(group_by(iris, Species))
View(iris)

# Já o ungroup(): desfaz o agrupamento
# ungroup(db)

### Summarise(): resume os dados em uma unica linha de valores
summarise(iris, avg = mean(Sepal.Length))
mean(iris$Sepal.Length)

summarise(iris, cont = n())

### Contagem: n()
db %>% 
  group_by(Species, Petal.Width) %>%
  summarise(cont = n()) 



rm(list = ls())



## Frequencia

bd %>%
  group_by(x) %>%
  summarise(n = n()) %>%
  mutate(freq = n / sum(n))

iris %>%
  group_by(Sepal.Length) %>%
  summarise(n = n()) %>%
  mutate(perc = round(prop.table(n)*100, 0))


