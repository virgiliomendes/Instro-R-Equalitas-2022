
### ===============================
### INTRODUCAO AO R BASICO - Aula 5
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
if (! "tidyverse" %in% installed.packages()) install.packages("tidyverse")
if (! "RColorBrewer" %in% installed.packages()) install.packages("RColorBrewer")
if (! "gridExtra" %in% installed.packages()) install.packages("gridExtra")
if (! "ggthemes" %in% installed.packages()) install.packages("ggthemes")


# Lendo o Pacote:
## Assim como na aula do Dplyr, temos duas formas de fazer isso:
### 1) ggplot2 está contido no pacote tidyverse, então podemos simplesmente carregar o pacote tidyverse:
library(tidyverse)

### 2) Ou podemos simplesmente chamar o pacote diretamente:
library(ggplot2)

# carregar pacotes extras:
library(RColorBrewer) # paleta de cores
library(gridExtra) # plots multiplos
library(gghighlight) # destacar elementos do grafico
library(ggthemes) # temas para o ggplot

# Tira a notação cientifica
options(scipen = 999)

# Paleta de Cores:
# https://htmlcolorcodes.com/
# https://www.color-hex.com/


# Importação do banco de dados -------------------------------------------------

# Importa bancos:
bd <- iris

datasets::swiss

datasets::mtcars

# Entendendo o banco: EXPLORATORIA

# nomes das variaveis
names(bd)

# soma NAs no banco
sum(is.na(bd))

# estrutura
str(bd)

# sumario
summary(bd)

# valores unicos
unique(bd$Species)

# TRATANDO VARIAVEIS -----------------------------------------------------------

bd <- bd %>%
  rename(c(sep_comp = Sepal.Length,
           sep_larg = Sepal.Width, 
           pet_comp = Petal.Length,
           pet_larg = Petal.Width,
           tipo = Species))

# nomes das variaveis
names(bd)

# GRAFICOS ---------------------------------------------------------------------

?ggplot()


# DISPERSÃO --------------------------------------------------------------------

# "building blocks”, adicionamos layers sobre layers 
# até que resulte na visualização gráfica desejada.


# Data +
#   Aesthetics + (mapeia um plano de dados, o plano cartesiano)
#   Geometries + (geometria que comportara os dados)
#   Facets + (ver como os dados se comportam a depender do tipo de informação)
#   Statistics + (geom_smoth)
#   Coordinates + (coord_flip ou polar)
#   Theme (customização)


# São justamente essas camadas que vão definir qual tipo de gráfico estamos querendo plotar.
# Camadas são adicionadas usando "+"

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) + # Função Base
  geom_point(size = 2, shape = 1) # 1a Camada: Definindo o tipo de gráfico

# E se quisermos complementa-lo, colorindo de acordo com os tipos de planta?

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, col = Species)) +
  geom_point(size = 2, shape = 1)


# Para acrescentarmos um título adicionamos uma camada chamda "ggtitle()":
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(aes(col =  Species, shape = Species, size = Species), size = 3) +
  ggtitle("Grafico de Dispersão")

# Fill e Shape
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(aes(col =  Species, fill = Species, size = Species), size = 3) +
  ggtitle("Grafico de Dispersão")

# SALVANDO UM GRAFICO ----------------------------------------------------------

# Por fim, para salvar um gráfico podemos adicionar uma camada com 
# a seguinte função: 
ggsave(filename = "grafico.png", height = 8, width = 8, dpi = 300)


## BOXPLOT ---------------------------------------------------------------------

# outliers
# Maximo
# Terceiro Quartil
# Mediana
# Primeiro Quartil: do valor minimo ate o 1 quartil 25% das observações estão aqui
# Minimo


ggplot(iris, aes(x = Species, y = Sepal.Width)) +
  geom_boxplot()

# Para preenchermos o gráfico, podemos usar o parâmetro fill()

ggplot(iris, aes(x = Species, y = Sepal.Width, fill = Species)) +
  geom_boxplot()# geom_violin()

# No entanto, usar um boxplot básico pode ser perigoso, devido a uma possível ilusão da distribuição
# dos dados

ggplot(iris, aes(x = Species, y = Sepal.Width, fill = Species)) +
  geom_boxplot() +
  geom_jitter(size = 1) +
  ggtitle("Boxplot")


# HISTOGRAMA -------------------------------------------------------------------
### Variável: Numérica

# No entanto, não definimos a variável Y, pois a utilizada
# é uma frequência simples da variável observada (x). Note que adicionamos a variável Sepal.Length como
# um fator juntamente do parâmetro "fill()"

ggplot(iris, aes(x = Sepal.Length, fill = factor(Sepal.Length))) + 
  geom_histogram(bins = 10, col = "white")

# Aqui temos o parâmetro "bins()" e "col()" dentro da camada "geom_histogram()":
# bins -> o número de "barras", de intervalos que teremos em nosso gráfico;
# col -> a cor do contorno de cada barra;
ggplot(iris, aes(x = Sepal.Length,fill = factor(Sepal.Length))) + 
  geom_histogram(bins = 37, col = "black") +
  ggtitle("Histograma")


## BARRAS ----------------------------------------------------------------------
### Variável: Categórica

# Parâmetros:
# "size", "colour" e "alpha", que representa a opacidade das bordas das barras.

# mtcars é um banco de dados que diz respeito ao consumo de combustível e outras 10 características
# de 32 carros.
names(mtcars)

# Vamos plotar um gráfico de barras de número de marchas por número de carburadores:
ggplot(mtcars, aes(x = gear, fill = factor(carb))) +
  geom_bar(size = 1.5, colour = "white", alpha = 0.6)

ggplot(mtcars, aes(x = gear, fill = factor(carb))) +
  geom_bar(size = .5, colour = "black", alpha = 1, position = "dodge")


# DENSIDADE --------------------------------------------------------------------

# O gráfico de Densidade plota a densidade e a distribuição dos casos observados no banco por uma variável
# específica, no caso, uma variável contínua.

ggplot(iris, aes(x = Sepal.Length, fill = Species)) +
  geom_density(alpha = 0.5) 


# LINHA ------------------------------------------------------------------------

# swiss é um banco de dados sobre fertilidade e indicadores socio-economicos para cada uma das 47 provincias
# da Suíça que falam francês.

# Vamos plotar, então, um gráfico de linhas de Educação por "Examination" (% de selecionados que receberam
# as maiores notas nos exames do exército):

ggplot(swiss, aes(x = Examination, y = Education)) +
  geom_line(size = 1)

# Parametros: size, col e linetype
ggplot(swiss, aes(x = Examination, y = Education)) +
  geom_line(size = 1, col = "blue", linetype = 2)

# CUSTOMIZAÇÃO -----------------------------------------------------------------

## Histograma:
### labs() - Camada para definir os labels, os rótulos do gráfico:
## title > Título do gráfico;
## subtitle > Subtítulo do Gráfico;
## x = Rótulo do Eixo X;
## y = Rótulo do Eixo Y;

ggplot(iris, aes(x = Sepal.Length, fill = Species)) + 
  geom_histogram(bins = 10, col = "white", position = "dodge") +
  labs(title = "Histograma de Comprimento da Sépala",
       subtitle = "Gráfico", x = "Comprimento da Sépala",
       y = "Frequência") + 
  facet_wrap(~Species)

# ou 

ggplot(iris, aes(x = Sepal.Length, fill = Species)) + 
  geom_histogram(bins = 10, col = "white", position = "dodge") +
  labs(title = "Histograma de Comprimento da Sépala",
       subtitle = "Gráfico", x = "Comprimento da Sépala",
       y = "Frequência") + 
  facet_grid(Species~.) # facet_grid(.~census_region)

## Gráfico de Barras:
ggplot(mtcars, aes(x = gear, fill = factor(carb))) +
  geom_bar(size = .5, colour = "black", alpha = 1, width = .5) +
  scale_x_continuous(breaks = mtcars$gear,
                     labels = mtcars$gear) +
  labs(title = "Grafico de Barras de Número de Marchas por Número de Carburadores",
       subtitle = "Melhor Curso de R do Brasil",
       x = "Número de Marchas",
       y = "Contagem",
       fill = "Número de Carburadores") +
  theme_minimal() + 
  theme(legend.position = "top") +  scale_fill_brewer(palette = "YlOrBr") 





# Se quisermos mudar as cores que são usadas para preencher o gráfico, apesar de estarmos preenchendo ele
# com a variável "carb", podemos usar uma camada com a função scale_fill_brewer().

# Para isso, primeiramente temos que instalar o pacote RColorBrewer:


### Após feita a instalação, escolhemos a paleta de cor:
display.brewer.all()
### E depois acrescentamos a camada:

ggplot(mtcars, aes(x = gear, fill = factor(carb))) +
  geom_bar(size = .5, colour = "black", alpha = 1, width = .5, position = "dodge") +
  scale_x_continuous(breaks = mtcars$gear,
                     labels = mtcars$gear) +
  labs(title = "Grafico de Barras de Número de Marchas por Número de Carburadores",
       subtitle = "Melhor Curso de R do Brasil",
       x = "Número de Marchas",
       y = "Contagem",
       fill = "Número de Carburadores") +
  theme_minimal() + 
  theme(legend.position = "top") +  
  scale_fill_brewer(palette = "YlOrBr")


# Boxplot:

ggplot(iris, aes(x = Species, y = Sepal.Width, fill = Species)) +
  geom_boxplot() +
  geom_jitter(size = 1) +
  ggtitle("Boxplot") + 
  scale_fill_brewer(palette = "Set2", 
                    labels = c("Setosa", "Versicolor", "Virginica")) + 
  scale_x_discrete(lab = NULL) + 
  labs(title = "Boxplot Largura da Pétala por Tipo de Planta", 
       subtitle = "Melhor curso de R do Brasil",
       x = "", 
       y = "Largura da Pétala", 
       fill = "Tipo de Planta") + 
  theme_minimal() + 
  theme(plot.title = element_text(hjust = 0.5), 
        plot.subtitle = element_text(hjust = 0.5)) +
  ggthemes::theme_economist() # tema do Jornal Economist




# PLOT DUPLO -------------------------------------------------------------------

# Linha
g1 <- swiss %>% 
  ggplot(aes(Examination, Education)) +
  geom_line(size = .6, col = "blue") +
  labs(title = "Gráfico de Linha", # labs especifica nomes dos eixos e titulos
       subtitle = "Aula 05", 
       y = "Educação", 
       x = "Exames", 
       caption = "Intr. ao R - 2022") + # legenda
  theme_minimal() + # personalização do tema
  theme(plot.title = element_text(hjust = .5), # centraliza o titulo
        plot.subtitle = element_text(hjust = .5)) # centraliza o subtitulo


# Boxplot

g2 <- bd %>% 
  ggplot(aes(x = tipo, pet_comp, fill = tipo)) +
  geom_boxplot() +
  labs(title = "Boxplot", # labs especifica nomes dos eixos e titulos
       subtitle = "Aula 05", 
       y = "Comprimento da Pétala", 
       x = "Espécie", 
       caption = "Intr. ao R - 2022") + # legenda
  theme_minimal() + # personalização do tema
  theme(plot.title = element_text(hjust = .5), # centraliza o titulo
        plot.subtitle = element_text(hjust = .5),
        legend.position = "none") +# centraliza o subtitulo
  scale_fill_brewer(palette = "Set1",
                    labels = c("Setosa", "Versicolor", "Virginica"))


grafico_final <- grid.arrange(g1, g2)



ggsave("aula05_plot_duplo.png", height = 8, width = 8, dpi = 300)



# Extra ------------------------------------------------------------------------

#Geom_ Smooth - grafico de tendencia
ggplot(bd, aes(x = sep_comp, y = pet_comp)) +
  geom_point() +
  geom_smooth()

ggsave("grafico_tendencia.pdf", height = 8, width = 8, dpi = 300)

# grafico de tendencia por especie
ggplot(bd, aes(x = sep_comp, y = pet_comp, col = tipo)) +
  geom_point() +
  geom_smooth()

ggsave("grafico_tendencia_especie.pdf", height = 8, width = 8, dpi = 300)

