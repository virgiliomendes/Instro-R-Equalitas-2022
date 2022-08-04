### ===============================
### INTRODUCAO AO R BASICO - Aula 3
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

# Definir diretório

choose.dir()
setwd("C:\\Users\\queir\\OneDrive\\Documents\\CursoR\\Intro-R-Equalitas-2022")

# Carregar a base
bd <- iris

# Comandos iniciais para entender melhor o banco
dim(bd)               # Encontra as dimensões do nosso banco de dados
names(bd)             # Tiramos os nomes do nosso bd
str(bd)               # Encontra as classes de cada uma das variáveis
summary(bd)           # Sintetiza algumas informações principais das variáveis

# Manipular a base para deixar da maneira como queremos analisar

# Ler o pacote
library(tidyverse)

bd_traduzida <- bd %>%
  rename(sepala_comprimento = Sepal.Length,   # Renomear
         sepala_largura = Sepal.Width,
         petala_comprimento = Petal.Length,
         petala_largura = Petal.Width,
         especies = Species) %>% 
  select(especies, everything()) %>%   # Selecionar/Excluir/Organizar as variáveis
  select(especies, sepala_comprimento, petala_comprimento) %>% 
  mutate(indice_flor = sepala_comprimento*petala_comprimento) # Criar nova variável

# Vamos analisar a média das sépalas somente da espécie "setosa"
med_sepalas_setosa <- bd_traduzida %>% 
  filter(especies == "setosa") %>%  # Filtrar as observações
  summarise(media = mean(sepala_comprimento))
  
# Vamos analisar a média das sépalas somente da espécie "versicolor"
bd_traduzida %>% 
  filter(especies == "versicolor") %>%  # Filtrar as observações
  summarise(media = mean(sepala_comprimento))

# Vamos analisar a desvio padrão das sépalas somente da espécie "setosa"
bd_traduzida %>% 
  filter(especies == "setosa") %>%  # Filtrar as observações
  summarise(dp = sd(sepala_comprimento))

# Agrupamento
# Group_by

tabela <- bd_traduzida %>%
  group_by(especies) %>% 
  summarise(media = mean(sepala_comprimento)) %>% 
  mutate(m2 = media^2)
  
#########################

med_sepalas_setosa <- bd_traduzida %>% 
  filter(especies == "setosa") %>%  
  summarise(media = mean(sepala_comprimento)) %>% 
  mutate(especies = "setosa") %>% 
  select(especies, media)

med_sepalas_versicolor <- bd_traduzida %>% 
  filter(especies == "versicolor") %>%  
  summarise(media = mean(sepala_comprimento)) %>% 
  mutate(especies = "versicolor") %>% 
  select(especies, media)

med_sepalas_virginica <- bd_traduzida %>% 
  filter(especies == "virginica") %>%  
  summarise(media = mean(sepala_comprimento)) %>% 
  mutate(especies = "virginica") %>% 
  select(especies, media)

tabela_x <- rbind(med_sepalas_setosa,
                  med_sepalas_versicolor,
                  med_sepalas_virginica)

##########################################################################

# Para mediana
median(bd_traduzida$sepala_comprimento)

# Para variância 
var(bd_traduzida$sepala_comprimento)

# Desvio Padrão
sd(bd_traduzida$sepala_comprimento)

# Valor Máximo
max(bd_traduzida$sepala_comprimento)

# Valor Mínimo
min(bd_traduzida$sepala_comprimento)

# Tirar a média, a variância e o desvio padrão por espécie 
tabela <- bd_traduzida %>%
  group_by(especies) %>% 
  summarise(media = mean(sepala_comprimento),
            variancia = var(sepala_comprimento),
            dp = sd(sepala_comprimento)) 

###############################################################################

# Instalar o pacote
#install.packages('questionr')

# Ler o pacote
library(questionr)

# Função freq()
freq(bd_traduzida$especies)

# Função describe()
describe(bd_traduzida$especies)

# Tabela 
t1 <- table(bd_traduzida$especies, bd_traduzida$sepala_comprimento) # Cria uma tabela de frequência relacionando as variáveis que a gente indica

# as.data.frame()
t1_df <- t1 %>% 
  as.data.frame() %>% 
  rename(especies = Var1,
         sepala_comprimento = Var2,
         frequencia = Freq)

# prop.table()
prop.table(t1)*100 # Valores percentuais da frequência

# round() -> Arredondamento das casas decimais
t2 = round(prop.table(t1)*100,2)

################################################################################

# Exportar as tabelas que a gente cria

# Pacote 'openxlsx' -> Importar e exportar arquivos para xlsx
install.packages('openxlsx')
library(openxlsx)

write.xlsx(t1_df, 'table.xlsx')

# Carregar a base
bd_eleicoes <- read.csv('dados_eleicao.csv')

### EXERCI'CIO -----------------------------------------------------------------

# Como exemplo, vamos utilizar uma base que conte'm a votacao de cada 
# candidato/a a deputado/a federal apenas na cidade de BH em 2014.
# A varia'vel "TOTAL_VOTOS" representa a quantidade de votos.

# 1 - Qual foi o deputado com maior nu'mero de votos? --------------------------

library(tidyverse)

max(bd_eleicoes$TOTAL_VOTOS)
dados_max <- bd_eleicoes %>% 
  filter(TOTAL_VOTOS == "80262")

dados_max <- bd_eleicoes %>% 
  # filter(SIGLA_PARTIDO == "PT") %>% 
  arrange(-TOTAL_VOTOS)         # ordena os valores de acordo com a variável que a gente define

dados_max %>% slice(1)

# 2 - Qual foi o deputado com menor número de votos? ---------------------------

dados_min <- bd_eleicoes %>%
  arrange(TOTAL_VOTOS)  # ordena os valores de acordo com a variável que a gente define

dados_min %>% slice(1)

# 3 - Quais são os deputados top 5? --------------------------------------------

dados_max %>% slice(1:5)

# 4 - Qual a média de votação? -------------------------------------------------

mean(dados_max$TOTAL_VOTOS)

# 5 - Considere que quem teve 0 voto, seja NA ou não esteja na base. 
# Qual seria a média? ----------------------------------------------------------

dados_min_filtro <- dados_min %>% 
  filter(TOTAL_VOTOS != 0)

mean(dados_min_filtro$TOTAL_VOTOS)

# 6 - Quais partidos tiveram maior quantidade de deputados? --------------------

# Calcular a frequência de cada partido

library(questionr)

t <- freq(bd_eleicoes$SIGLA_PARTIDO)

t <- t %>% arrange(-n)

# 7 - Qual a média de votação do PT? -------------------------------------------

bd_eleicoes %>% 
  filter(SIGLA_PARTIDO == "PT") %>% 
  summarise(media_pt = mean(TOTAL_VOTOS))

# 8 - Qual a média de votação do PSDB? -----------------------------------------

bd_eleicoes %>% 
  filter(SIGLA_PARTIDO == "PSDB") %>% 
  summarise(media_psdb = mean(TOTAL_VOTOS))

# 7 e 8 ------------------------------------------------------------------------

bd_eleicoes %>% 
  # filter(SIGLA_PARTIDO == "PT" | SIGLA_PARTIDO == "PSDB") %>% 
  group_by(SIGLA_PARTIDO) %>% 
  summarise(media = mean(TOTAL_VOTOS)) %>% 
  arrange(-media) 


