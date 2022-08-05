
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


# limpa environment
rm(list = ls())


# CARREGA PACOTES --------------------------------------------------------------

# Se os pacotes necessários não estiverem instalados, faça a instalação
if (! "writexl" %in% installed.packages()) install.packages("writexl")
if (! "readr" %in% installed.packages()) install.packages("readr")
if (! "janitor" %in% installed.packages()) install.packages("janitor")
if (! "readxl" %in% installed.packages()) install.packages("readxl")
if (! "questionr" %in% installed.packages()) install.packages("questionr")
if (! "foreign" %in% installed.packages()) install.packages("foreign")



# carregar pacotes
library(tidyverse)
library(janitor)
library(readxl)
library(readr)
library(questionr)
library(writexl)
library(foreign)

# Tira a notação cientifica
options(scipen = 999)

# Importação do banco de dados -------------------------------------------------


# Funções de importação

# read.csv tem o separador ","
bd <- read.csv("dados_eleicao_NA.csv")

# read.csv2 tem o separador ";"
bd1 <- read.csv2("dados_eleicao_NA.csv")

# tem o separador ","
bd2 <- read_csv("dados_eleicao_NA.csv")

# tem o separador ";"
bd3 <- read_csv2("dados_eleicao_NA.csv")

# exportar .xlsx
write_xlsx(bd, "banco_teste.xlsx")

# importar .xslx
bd4 <- read_excel("banco_teste.xlsx")
bd5 <- read_xlsx("banco_teste.xlsx")

# exportar .csv:
# separador ","
write.csv(bd, "teste1.csv")
write_csv(bd, "teste2.csv")
# separador ";"
write.csv2(bd, "teste3.csv")
write_csv2(bd, "teste4.csv")

# Formato Rds

# exporta rds
write_rds(bd, "teste2.rds") # readr

saveRDS(bd, "teste1.rds") # base


# importar rds
bd6 <- readRDS("teste1.rds")

# Pacote Janitor ---------------------------------------------------------------

# Limpa environment
rm(list = ls())

# read.csv tem o separador ","
bd <- read.csv("dados_eleicao_NA.csv") %>% clean_names()

# Ctrl + Shif + M %>% 

# TRATANDO NAS -----------------------------------------------------------------


# nomes da variaveis
names(bd)

# structure
str(bd)

# classe
classe(bd$ano_eleicao)

# sumario
summary(bd)

# valores únicos
unique(bd$ano_eleicao)
unique(bd$sigla_uf)
unique(bd$nome_municipio)
unique(bd$sigla_partido)


# Outras 

# soma quantos NAs existem em uma variavel
sum(is.na(bd$ano_eleicao))
# soma quantos NAs existem no BANCO
sum(is.na(bd))

# identificar a posição do NA
which(is.na(bd$ano_eleicao))
which(is.na(bd$nome_candidato))
which(is.na(bd$sigla_partido))
which(is.na(bd$total_votos))

# banco[linha, coluna]
bd[106, ]
bd[13, ]
bd[624,]

# Identificando casos
bd %>% 
  filter(sigla_partido == "UFMG")

bd %>% 
  filter(is.na(sigla_partido))

# tirando o NA do banco
bd1 = bd


bd1 <- na.omit(bd)

# substituir o NA por 0
bd1[ , 7][is.na(bd1[ , 7])] <- 0

bd1[ , 1:7][is.na(bd1[ , 1:7])] <- 0

bd2 <- na.rm(bd)


# tidyr: drop_na()
bd3 <- bd %>% 
  drop_na()

# TRATANDO VARIAVEIS -----------------------------------------------------------


# valores únicos
unique(bd$ano_eleicao)
unique(bd$sigla_uf)
unique(bd$nome_municipio)
unique(bd$sigla_partido)

# Eliminar espacos em branco no inicio ou final 
texto <- " Hoje a aula está cansativa! "
texto

str_trim(texto, side = "left")
str_trim(texto, side = "right")
str_trim(texto, side = "both")

# outra forma:
bd$nome_municipio <- stringr::str_replace(bd$nome_municipio, "BELO HORIZONTE ", "BELO HORIZONTE")
bd$nome_municipio <- stringr::str_replace(bd$nome_municipio, " ", "_")

# detecta o padrao textual
str_detect(bd$nome_municipio, "BELO HOR")

# identificar o padrão textual e subtstitur pelo padrão correta
bd$nome_municipio[str_detect(bd$nome_municipio, "BELO HOR")] <- "BELO HORIZONTE"

unique(bd$nome_municipio)


bd$sigla_uf[str_detect(bd$sigla_uf, "MG")] <- "Minas Gerais"
bd$sigla_uf[str_detect(bd$sigla_uf, "1")] <- "Outro"


texto <- "Hoje a AULA está cansativa!"

#
str_to_lower(texto)
str_to_upper(texto)
str_to_sentence(texto)



# CASE WHEN --------------------------------------------------------------------

names(bd)

summary(bd$total_votos)

bd <- bd %>% 
  mutate(eleito = case_when(
    total_votos > 2000 ~ "Eleito",
    total_votos <= 2000 & total_votos > 1000 ~ "Quase elegeu",
    total_votos <= 1000 ~ "Não eleito",
    TRUE ~ "Não se aplica"
  ))


unique(bd$eleito)



