
### ============================
### INTRODUCAO AO R BASICO - Aula 2
### ============================


# ------------------------------------------------------------------------------
# Instrutores: 
#             
#             Arthur Queiroz  
#             queirozrarthur@gmail.com
#             
#             Virgilio Mendes
#             virgilioebm@gmail.com
#
# ------------------------------------------------------------------------------

# Se os pacotes necessários não estiverem instalados, faça a instalação
if (! "dplyr" %in% installed.packages()) install.packages("dplyr")

if (! "tidyverse" %in% installed.packages()) install.packages("tidyverse")

# Material de Apoio:
# Dplyr Website: https://dplyr.tidyverse.org/
# Dplyr Cheat Sheet: https://rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf
# https://www.tidyverse.org/
# https://nyu-cdsc.github.io/learningr/assets/data-transformation.pdf

# Comunidades: 
# R Brasil no Facebook e Telegram
# https://stackoverflow.com/


# Revisando --------------------------------------------------------------------

# Operações
# Sinal '<-'
# = é sinal de atribuição
# '==' e '!='
# Tipos de dados
# Vetores; Matrizes; Data frames
# Indexar: [Linhas, Colunas]

# ------------------------------------------------------------------------------

# limpar ambiente
rm(list = ls())

# Qual diretorio:
getwd()

# Setar diretorio:
setwd("C:/Users/Virgilio/Desktop/Projetos 2021/Intro-R-Equalitas-2022/Curso")
setwd("C:\\Users\\Virgilio\\Desktop\\Projetos 2021\\Intro-R-Equalitas-2022\\Curso")
setwd(choose.dir())

# Ultima: Projeto

# ------------------------------------------------------------------------------

# Carregar os pacotes:
library(dplyr)
# ou 
library(tidyverse)


# ------------------------------------------------------------------------------

# datasets inatos do R
datasets::airquality

?iris

# Dataset: Iris
banco <- iris



# View
View(banco)

# classe
class(banco$Sepal.Length)
class(banco$Species)

# estrutura
str(banco)

# Dplyr ------------------------------------------------------------------------

# Glimpse: "olhada rapida"

glimpse(banco)
# fct: factor
# dbl: reais

# Arrange: serve para reordenar os casos da variavel
banco1 <- arrange(banco, Sepal.Length)
arrange(banco, desc(Sepal.Length))

banco1

# Select: selecionar as variaveis desejadas
banco2 <- select(banco, Sepal.Length, Species)

select(banco, -Sepal.Length, -Species)

select(banco, -c(Sepal.Length, Species))




# Filter: casos, filtra as linhas

# Filtro incluindo o caso que eu quero
filter(banco2, Species == "versicolor")

# Filtro pela exclusão dos casos
filter(banco2, Species != "versicolor")

class(banco2$Sepal.Length)
class(banco2$Species)

banco2

# Filtrar var numericas
banco3 <- filter(banco2, Sepal.Length >= 5.3)
# organizar
arrange(banco3, Sepal.Length)


# maior ou igual que: >=
# menor ou igual que: <=


# Filtros com mais de uma condição:
banco3 <- filter(banco3, Sepal.Length < 6 & Species == "versicolor")

View(banco3)

# retorna nome das variaveis
names(banco3)
# retorna os valores unicos
unique(banco2$Species)
# maximo
max(banco2$Sepal.Length)
# minimo
min(banco2$Sepal.Length)

# Rename: renomear

# estrutura da função:
# rename(banco_de_dados, nome_novo = nome_antigo)

rename(banco, largura_sepala = Sepal.Width)

# renomear todas as variaveis do banco
banco <- rename(banco,
       comprimento_sepala = Sepal.Length,
       largura_sepala = Sepal.Width,
       comprimento_petala = Petal.Length,
       largura_petala = Petal.Width,
       especies = Species)

# retorna nome das variaveis
names(banco)

View(banco)

# Mutate: criar novas variaveis


banco <- mutate(banco, 
       raiz_sepala_largura = sqrt(largura_sepala),
       raiz_comp_petala = sqrt(comprimento_petala) + 2)

# funções
sqrt(1.4) #raiz quadrada
mean()
median()

# retorna nome das variaveis
names(banco)


# Pipe: %>% 
# canaliza as operações, sempre seguindo a ordem
# da esquerda para a direita

# Limpa environment
rm(list = ls())

# No exercicio de replicar o que foi visto na aula
# vamos refazer com a lógica do pipe ( %>% )

# Banco
banco <- iris

# names
names(banco)

banco_final <- banco %>% 
        rename(comprimento_sepala = Sepal.Length, #renomeio
               largura_sepala = Sepal.Width,
               comprimento_petala = Petal.Length,
               largura_petala = Petal.Width,
               especies = Species) %>% 
        mutate(raiz_sepala_largura = sqrt(largura_sepala), # crio variavel
               raiz_comp_petala = sqrt(comprimento_petala) + 2) %>% 
        select(-c(largura_sepala, comprimento_petala)) %>% # tira var
        filter(comprimento_sepala > 5) # filtro


# Visualizar
View(banco_final)

# Names
names(banco_final)
