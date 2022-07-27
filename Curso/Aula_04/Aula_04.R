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

# BASE DE DADOS ----------------------------------------------------------------

# A base de dados iris é uma das mais utilizadas no R para fins pedago'gicos
# Representa os comprimentos e larguras de se'palas e peta'las para 150
# flores diferentes.

bd = iris   # Carregar o banco
dim(bd)     # Ver a dimensao (150 observacoes e 5 variaveis)
names(bd)   # Nome das varia'veis
str(bd)     # Classe do objetos e das vari'aveis

# Ja' sabemos que as quatros primeiras variáveis são númericas, nesse caso, 
# podemos tirar algumas estati'stiscas ba'sicas. 

# Com a funcao summary() e' possível tirar estati'sticas descritivas de 
# todo o banco.
summary(iris)

# O mesmo pode ser feito para as varia'veis de forma separada
summary(iris$Sepal.Length)

summary(iris[[1]]) # Outra forma de fazer
summary(iris[,1])  # Outra alternativa

### ESTATI'STICAS DESCRITIVAS --------------------------------------------------

# Podemos tambe'm analisar apenas algumas estati'sticas que nos interessam: 

# Para a me'dia:
mean(iris$Petal.Length)

# Para a mediana:
median(iris$Petal.Length)

# Para a variancia:
var(iris$Petal.Length)

# Para i desvio padrao:
sd(iris$Petal.Length)

# Para o valor ma'xima:
max(iris$Petal.Length)

# Para o valor mi'nimo:
min(iris$Petal.Length)

# Para trabalhar com varia'veis catego'ricas, as estrate'gias devem ser outras.
# Podemos utilizar o pacote "descr" para algumas ana'lises.
# As varia'veis de classe factor sao varia'veis catego'ricas. 
# Nessa classe, cada categoria tem um label. 
# Podemos criar uma varia'vel catego'rica entrando com os dados e 
# definindo os labels, por exemplo:

# Carregar o pacote
library(descr)

# Criar uma variável catego'rica
sexo <- factor(x = c("Feminino",
                     "Masculino",
                     "Feminino",
                     "Masculino",
                     "Feminino",
                     "Feminino"), 
               levels = c("Feminino","Masculino"))

sexo

# Ha' uma funcao excelente implementada no pacote descr para tabela
# de frequencias de uma varia'vel catego'rica. Trata-se da funcao freq().

# A funcao que vamos utilizar é a freq(). 
# Ela e' utilzada para gerar uma tabela de frequencia de uma varia'vel.

freq(iris$Species) 

freq(sexo)

# Perceba que ao lado, foi gerado um gra'fico automatico. 
# Para que isso nao acontenca,
# basta utilizar um parametro da funcao: 
?freq

freq(iris$Species, plot = F)

freq(sexo, plot = F)

### MANIPULACAO COM OS DADOS USANDO PIPE ---------------------------------------

# Ler bibliotecas 
library(tidyverse)

# O pipe (%>%) e' um operador para indicar as operacoes que serao
# feitas com o banco.

# Por exemplo, se quisermos a me'dia das se'palas somente da espe'cie "setosa"
iris %>% select(Sepal.Length, Species) %>% 
  filter(Species == "setosa") %>% 
  summarise(media = mean(Sepal.Length))

# Ou da versicolor
iris %>% select(Sepal.Length, Species) %>% 
  filter(Species == "versicolor") %>% 
  summarise(media = mean(Sepal.Length))

# Ou da virginica
iris %>% select(Sepal.Length, Species) %>% 
  filter(Species == "virginica") %>% 
  summarise(media = mean(Sepal.Length))

# Podemos calcular a media de Sepal.Length para as três espe'cies de flor
# utilizando o group_by()

# Vamos guardar os resultados num objeto chamado tabela

tabela = iris %>% 
  group_by(Species) %>% 
  summarise(m = mean(Sepal.Length))

tabela = iris %>% 
  group_by(Species) %>% 
  summarise(m = mean(Sepal.Length)) %>% 
  mutate(m2 = m^2) 

# Verificar os resultados

tabela

# Agora vamos calcular todas as estati'sticas descritivas para a varia'vel
# que indica a largura das pe'talas (Petal.Width)
iris %>% summarise(m = mean(Petal.Width),
                   med = median(Petal.Width),
                   variancia = var(Petal.Width),
                   desv = sd(Petal.Width))

# Fazendo um exerci'cio semelhante, mas considerando o resultado por espe'cie
iris %>% 
  group_by(Species) %>% 
  summarise(m = mean(Petal.Width),
            med = median(Petal.Width),
            variancia = var(Petal.Width),
            desv = sd(Petal.Width))

### EXERCI'CIO -----------------------------------------------------------------

# Como exemplo, vamos utilizar uma base que conte'm a votacao de cada 
# candidato/a a deputado/a federal apenas na cidade de BH em 2014.
# A varia'vel "TOTAL_VOTOS" representa a quantidade de votos.

# Carregar o pacote da funcao read_csv
library(readr)

# Carregar o pacote que define o direto'rio deste arquivo
library(here)

# Carregar a base de dados
dados_eleicao <- read_csv(here("dados_eleicao.csv"))

# 1 - Qual foi o deputado com maior nu'mero de votos? --------------------------

# Forma 1.1
max(dados_eleicao$TOTAL_VOTOS)
dados_max = filter(dados_eleicao, `TOTAL_VOTOS` == 80262)
dados_max

# Forma 1.2
dados_max = filter(dados_eleicao, 
                   TOTAL_VOTOS == max(dados_eleicao$TOTAL_VOTOS))
dados_max

# Forma 1.3
dados_eleicao %>% 
  filter(TOTAL_VOTOS == 80262)

# Forma 1.4
dados_max <- arrange(dados_eleicao, -TOTAL_VOTOS) # Ordena de acordo com o 
                                                  # nu'mero de votos

slice(dados_max, 1)   # Apresenta so' a primeira linha
head(dados_max)       # Apresenta os primeiros
dados_max[1,]         # Mostra a primeira linha

# 2 - Qual foi o deputado com menor número de votos? ---------------------------

min(dados_eleicao$TOTAL_VOTOS)

dados_min = filter(dados_eleicao,
                   TOTAL_VOTOS == min(dados_eleicao$TOTAL_VOTOS))

summary(dados_eleicao$TOTAL_VOTOS)

# 3 - Quais são os deputados top 5? --------------------------------------------

dados_top5 <- arrange(dados_eleicao, -TOTAL_VOTOS)
slice(dados_top5, 1:5)

# 4 - Qual a média de votação?

mean(dados_eleicao$TOTAL_VOTOS)

# 5 - Considere que quem teve 0 votos, seja NA ou não esteja na base. 
# Qual seria a média? ----------------------------------------------------------

dados_med = filter(dados_eleicao, TOTAL_VOTOS > 0)   # Filtra somente > 0

dados_med = filter(dados_eleicao, TOTAL_VOTOS != 0)  # Filtra somente diferente
                                                     # de 0 

mean(dados_med$TOTAL_VOTOS) # Sobe de 1.747 para 1.818

# 6 - Quais partidos tiveram maior quantidade de deputados? --------------------

# Calcula a frequencia de cada partido
t <- freq(dados_eleicao$SIGLA_PARTIDO, plot = F) 

t = as.data.frame(t)        # Transforma em Data Frame
arrange(t, -Frequência)     # Ordena do maior para o menor

# 7 - Qual a média de votação do PT? -------------------------------------------

dados_pt = filter(dados, SIGLA_PARTIDO == "PT") # Filtra somente o PT
mean(dados_pt$TOTAL_VOTOS)                      # Calculamos a me'dia

# Outra forma de calcular
dados_eleicao %>% 
  select(TOTAL_VOTOS, SIGLA_PARTIDO) %>% 
  filter(SIGLA_PARTIDO == "PT") %>% 
  summarise('Média de votos do PT' = mean(TOTAL_VOTOS))

# 8 - Qual a média de votação do PSDB? -----------------------------------------

dados_pt = filter(dados, SIGLA_PARTIDO == "PSDB") # Filtra somente o PSDB
mean(dados_pt$TOTAL_VOTOS)                      # Calculamos a me'dia

# Outra forma de calcular
dados_eleicao %>% 
  select(TOTAL_VOTOS, SIGLA_PARTIDO) %>% 
  filter(SIGLA_PARTIDO == "PSDB") %>% 
  summarise('Média de votos do PSDB' = mean(TOTAL_VOTOS))

# 7 e 8 ------------------------------------------------------------------------

# Tirar a me'dia de todos os partidos
tabela <- dados_eleicao %>% 
  group_by(SIGLA_PARTIDO) %>% 
  summarise(media = mean(TOTAL_VOTOS))

tabela  

# Ordenar de acordo com a me'dia
arrange(tabela, -media)

# Filtrar somente PT e PSDB
resposta = filter(tabela, SIGLA_PARTIDO == "PT" | SIGLA_PARTIDO == "PSDB")

resposta

# GERAR TABELA (EXTRA) ---------------------------------------------------------

# Para transformar os dataframes que geramos em tabelas, podemos utilizar
# o pacote "flextable". Para instalar, basta rodar no console:
# install.packages("flextable"). 

# As funções desse pacote formatam as tabelas e as deixam no ponto para
# serem exportadas para o Word.

# Vamos testar com o exemplo das estati'sticas descritivas dos tres tipos
# de flor vistos anteriormente

# Criamos uma data frame (objeto chamado df) com as estati'sticas
df <- iris %>% 
  group_by(Species) %>% 
  summarise(media = mean(Petal.Width),
            mediana = median(Petal.Width),
            variancia = var(Petal.Width),
            desvio_padrao = sd(Petal.Width))

# Ler o pacote
library(flextable)

# Criamos um objeto chamado 'tabela' que sera' o nosso resultado
tabela <- df %>% 
  flextable() %>%                     # Funcao para gerar a tabela
  theme_vanilla() %>%                 # Tema escolhido
  align_nottext_col('center') %>%     # Centraliza o texto
  autofit()                           # Compacta a tabela de acordo com as informacoes

# Ver o resultado
tabela

# Para salvar em Word, o pacote oferece a funcao save_as_docx()

save_as_docx(
  # Título = objeto resultante(tabela)
  'Tabela - Flores' = tabela,           # Definimos o título da tabela
  path = here('TabelaFlores.docx'))     # Definimos onde ficara' salva e 
                                        # o nome do arquivo

# Um arquivo 'docx' e' gerado no local especificado
