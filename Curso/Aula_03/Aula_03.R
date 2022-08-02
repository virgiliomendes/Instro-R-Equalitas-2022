### ============================
### INTRODUCAO AO R BASICO - Aula 3
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

# Se os pacotes necessários não estiverem instalados, faça a instalação
#if (! "dplyr" %in% installed.packages()) install.packages("dplyr")
#if (! "tidyverse" %in% installed.packages()) install.packages("tidyverse")
library(dplyr)
library(tidyverse) # conjunto de pacotes

# Limpando nosso ambiente:
rm(list = ls())

# Setar Diretório (se não estiver usando um projeto)
setwd(choose.dir())
setwd()
getwd()

##------------------------------------------------------------------------------

# Banco de Dados:

# pacote com datasets no R
datasets::mtcars

## Para essa aula usaremos o banco de dados IRIS, já presente no R:
## O banco de dados IRIS contem a classificação de diferentes tipos da planta Íris, 
## baseado em quatro atributos.
iris = iris

names(iris)
dim(iris)
str(iris)
summary(iris)

# Revisão da Aula Manipulação de dados I ---------------------------------------

# Funções Vistas:
## Glimpse e Arrange
## Select e Filter
## Mutate e Rename
## Pipe : %>%

## Split, Apply e Combine: -----------------------------------------------------


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

### Summarise com outras aplicações

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

# StringR: Manipulação de Texto ------------------------------------------------
# https://stringr.tidyverse.org/
# Instalado junto com o Tidyverse
  
# Funções voltadas para manipulação e tratamento de strings (dados textuais)
library(stringr)

# Principais funções
str_length(x) # calcula quantidade de characteres

str_c(x, collapse = ", ") # junta dois ou mais vetores em um so

str_detect(x, pattern) #tells you if there’s any match to the pattern.

str_count(x, pattern) #counts the number of patterns.

str_extract(x, pattern) #extracts the text of the match.

str_replace(x, pattern, replacement) #replaces the matches with new text.

str_split(x, pattern) #splits up a string into multiple pieces.
# Tabelas ----------------------------------------------------------------------


# comando para tirar tabelas de frequencia e proporção
table(bd$Species)

# funções do Questionr
freq(bd$Species)
describe(bd$Species)

# Cruzamentos de variaveis
t1 = table(bd$Sepal.Width, bd$Species) # tabela de numeros absolutos

# para calcular percentual
prop.table(t1)*100 
# ou 
prop.table(table(bd$Sepal.Width, bd$Species))*100

# para calcular 100% fechando na linha, 
# usamos o parâmetro margin = 1
t2 = round(prop.table(t1, margin = 1)*100, 2) # o numero 2 

# por defaul t2 é formato "table"
# para exportar temos que converter em dataframe
t2 = as.data.frame(t2)

class(t2)

# Salvando a tabela em Excel
write_xlsx(t2 , "tabela1.xlsx")
write_csv(t2 , "tabela1.csv")
write_csv(t2 , "tabela1.csv")


##------------------------------------------------------------------------------

# Exercícios:

# Carregue o banco de dados que enviamos por email.
# O banco de dados é uma base contendo a votação de cada candidato/a a deputado/a federal
# apenas na cidade de BH em 2014. As variáveis são auto-explicativas, não deve ter nenhum problema.
# No entanto, casa haja alguma dúvida, só enviar um email para os monitores.
# Para carregalo, primeiro instale o pacote para exportarmos arquivos .csv:
install.packages("readr")
# Após feita a instalação, só carrega-lo:
library(readr)


# 1o: Abra o banco de dados

# Antes de irmos para os exercícios, verifique se há NA's na base.
# Caso tenhamos algum valor NA, delete-o do banco!

# Agora vamos por as mãos na massa!
# Lembre-se: Não há uma forma correta de fazer os exercícios, R é uma linguagem bem livre, logo, 
# existem diversas formas de chegar ao mesmo resultado! No entanto, o ideal seria utilizarmos o que foi
# ensinado na aula. Caso você vá por um caminho diferente não tem problema nenhum! Tudo faz parte do
# processo de aprendizado!

# No final do documento temos as respostas para os exercícios, casa haja alguma dúvida você pode enviar
# um email para um dos monitores e elxs irão te auxiliar!


## Exercícios:
# 1) Carregue o Banco de Dados

# 2) Qual foi o deputado com o maior número de votos? Filtre o banco de dados pelo deputado que recebeu
# O maior número de votos


# 3) Qual foi o deputado com o menor número de votos? Filtre o banco de dados pelo deputado que recebeu
# o menor número de votos;


# 4) Usando a lógica do Split, Apply e Combine, agrupe o banco por partidos, ordene de maneira crescente 
# e responda: qual partido teve mais candidatos nas eleições de 2014?


# 5) Selecione o partido e o número de votos total, qual a média de votos do PT?


# 6) E quanto ao PSDB, qual foi sua média de votos?

# 7) Ou melhor, usando a lógica do Split, Apply, Combine, porque não pegar a média de voto de todos os 
# partidos? Quais foram os 2 mais votados? E os 4 menos votados?















# RESPOSTAS


##----- 2
max(ele$TOTAL_VOTOS)

ele %>% filter(TOTAL_VOTOS == max(TOTAL_VOTOS))


##----- 3
ele %>% filter(TOTAL_VOTOS == min(TOTAL_VOTOS))



##----- 4
ele %>%
  group_by(SIGLA_PARTIDO) %>%
  summarise(cont = n()) %>%
  arrange(cont) 

##----- 5
ele %>%
  select(SIGLA_PARTIDO, TOTAL_VOTOS) %>%
  filter(SIGLA_PARTIDO == "PT") %>%
  summarise(media = mean(TOTAL_VOTOS))


##----- 6
ele %>%
  select(SIGLA_PARTIDO, TOTAL_VOTOS) %>%
  filter(SIGLA_PARTIDO == "PSDB") %>%
  summarise(media = mean(TOTAL_VOTOS))



##----- 7
ele %>%
  group_by(SIGLA_PARTIDO) %>%
  summarise(media = mean(TOTAL_VOTOS)) %>%
  arrange(media)