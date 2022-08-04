### ===============================
### INTRODUCAO AO R BASICO - Aula 4
### ===============================

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

# CARREGA PACOTES --------------------------------------------------------------

# Se os pacotes necessários não estiverem instalados, faça a instalação
if (! "writexl" %in% installed.packages()) install.packages("writexl")
if (! "readr" %in% installed.packages()) install.packages("readr")
if (! "janitor" %in% installed.packages()) install.packages("janitor")
if (! "readxl" %in% installed.packages()) install.packages("readxl")
if (! "questionr" %in% installed.packages()) install.packages("questionr")
if (! "foreign" %in% installed.packages()) install.packages("foreign")



# carregando os pacotes
library(dplyr) # A Grammar of Data Manipulation
library(tidyverse)

library(janitor)
library(readxl) #  Read Excel Files
library(questionr) # Functions to Make Surveys Processing Easier
library(foreign) # Leitura de arquivos (ex: SPSS, dta - Stata)
library(writexl) # Exporta em Excel
library(readr) # Write Data frame in different formats

# Tira notação cientifica
options(scipen = 999)

# ------------------------------------------------------------------------------

## Revisão das funções do Dplyr:
# rename
# select
# filter
# mutate
# group_by
# summarize
# arrange
# 
## Criar tabelas com summarize e table
# 
## Estatisticas descritivas:
# min, max, sd, var, median, mean
# freq
# describe

# IMPORTAÇÃO DE DADOS ----------------------------------------------------------

# Explicar as várias formas de importar e exportar dados

# carregar banco de bados iris (inato do r)
bd = iris

# ver o diretorio de trabalho
getwd()
# setar diretório de trabalho
setwd("C:/Users/Virgilio/Desktop/Intro_R_2021/Aulas/Aula 02")

# OU PROJETO

# carrega banco em formato CSV com separador ";"
bd = read.csv2("dados_eleicao.csv")
# carrega banco em formato CSV com separador ","
bd = read.csv("dados_eleicao.csv")

# salva em formato CSV com separador ";"
write_csv2(bd, "teste.csv")
# salva em formato CSV com separador ","
write_csv(bd, "teste.csv")


# carrega banco em formato excel
bd = read_excel("banco.xlsx")
# quando há mais de uma sheet ou aba no arquivo excel, 
# usar o comando ", sheet = <nome.da.aba>"
write_xlsx(bd , "teste.xlsx")

# carrega banco em formato RDS
bd = readRDS("teste.RDS")
# Salva em formato RDS
write_rds(bd, "teste.RDS") # da funçao readr - mais eficiente
saveRDS(bd, "teste.RDS") # R Base

# Pacote Janitor -------------------------------------------------------------------

# clean_names()

bd = read_excel("banco.xlsx") %>% clean_names()

# TRATANDO NAs -----------------------------------------------------------------


# soma quantos NAs tem no banco ou variavel
sum(is.na(bd$ANO_ELEICAO))

# achando NA: missing
which(is.na(bd$ANO_ELEICAO)) # Encontra NA pela posição

# detectando padrões:
str_detect(bd$NOME_CANDIDATO, "NA")

# tranformando NA em 0
bd[, 1:4][is.na(bd_data[, 1:4])] <- 0


# tirando na do banco
bd <- na.omit(bd)

# TRATANDO VARIAVEIS -----------------------------------------------------------


# Tirando espaço em branco no inicio e no final
ob = " oi, meu nome é Pablo! "
str_trim(ob, side = "left")
str_trim(ob, side = "right")
str_trim(ob, side = "both")


# Padronização

# str_replace(x, pattern, replacement) #replaces the matches with new text.

bd$SIGLA_UF <- stringr::str_replace_all(bd$SIGLA_UF, "MG", "_MG_")
bd$SIGLA_UF[1:20]

bd$NOME_MUNICIPIO <- stringr::str_replace_all(bd$NOME_MUNICIPIO, " BELO HORIZONTE ", "BELO HORIZONTE")
bd$NOME_MUNICIPIO[10:20]


# str_detect(x, pattern) #tells you if there’s any match to the pattern.
bd$NOME_MUNICIPIO[str_detect(bd$NOME_MUNICIPIO, " BELO HORIZONTE|BELO HORIZONTE | BELO HORIZONTE ")] = "BELO HORIZONTE"



# CASE WHEN---------------------------------------------------------------------

# banco voto e eleições
# criar variavel de eleito e não eleito a partir da quantidade de votos
# suport que mais de 500 votos foram eleitos

bd <- bd %>% 
  mutate(eleito = case_when(
    TOTAL_VOTOS > 2000 ~ "Não eleito",
    TOTAL_VOTOS <= 2000 ~ "Eleito"
  ))

bd <- bd %>% 
  mutate(mineiro = case_when(
    SIGLA_UF == "MG" & SIGLA_PARTIDO == "PT" ~ "Mineiro Petista",
    SIGLA_UF == "MG" & SIGLA_PARTIDO != "PT" ~ "Resto"
  ))

# ESTATISTICAS DESCRITIVAS -----------------------------------------------------

# Mostra os nomes das variaveis
names(bd)

# Dimensões do bd
dim(bd)

# mostra os 6 primeiros casos
head(bd)

# mostra os 6 ultimos casos
tail(bd)

# tira a classe da variavel
class(bd$Petal.Length)
# tirar a classe do banco
class(bd)

# estrutura do bd
str(bd)

# tira media 
mean(bd$Petal.Length, na.rm = T)

# tirar mediana
median(bd$Sepal.Width, na.rm = T)

# desvio padrão
sd(bd$Petal.Width, na.rm = T)

# max
max(bd$Sepal.Width)

# min
min(bd$Sepal.Length)

# resume as informações da varaivel
summary(bd$Sepal.Length)

# Visualização do banco
View(bd)

# Olhada rápida
glimpse(bd)

# Frequencia
freq(bd$variavel)

# Describe
describe(banco)

# Fim --------------------------------------------------------------