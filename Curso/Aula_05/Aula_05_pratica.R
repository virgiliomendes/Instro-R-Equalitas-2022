

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

# limpar environment
rm(list = ls())



# Se os pacotes necessários não estiverem instalados, faça a instalação
if (! "tidyverse" %in% installed.packages()) install.packages("tidyverse")
if (! "RColorBrewer" %in% installed.packages()) install.packages("RColorBrewer")
if (! "gridExtra" %in% installed.packages()) install.packages("gridExtra")
if (! "ggthemes" %in% installed.packages()) install.packages("ggthemes")


# carrega os pacotes
library(tidyverse)
library(RColorBrewer) # paleta de cores
library(gridExtra) # plots multiplos
library(ggthemes) # temas para o ggplot

# tirar notação cientifica
options(scipen = 999)


# Banco de dados ---------------------------------------------------------------

# iris
datasets::iris
# mtcars
datasets::mtcars
# swiss
datasets::swiss

# MANIPULAÇÃO DE DADOS ---------------------------------------------------------

names(iris)

bd = iris %>% 
  rename(sep_com = Sepal.Length,
         sep_larg = Sepal.Width,
         pet_com = Petal.Length,
         pet_larg = Petal.Width,
         tipo = Species)

names(bd)

# GGPLOT -----------------------------------------------------------------------

?ggplot2

# dados +
# aesthetics +
#   geometry +
#   facets +
#   estatisticas +
#   cordenadas +
#   temas

# Dispersão --------------------------------------------------------------------

ggplot(data = bd, aes(x = sep_com, y = pet_com, col = tipo)) +
  geom_point(size = 3, shape = 3) + # tamanho do ponto, forma
  ggtitle("Gráfico de Dispersão") # titulo

# Salvar -----------------------------------------------------------------------

ggsave(filename = "grafico.png", height = 8, width = 8, dpi = 300)

# Boxplot ----------------------------------------------------------------------

ggplot(bd, aes(x = tipo, y = sep_larg)) +
  geom_boxplot() +
  geom_jitter() +
  ggtitle("Boxplot")

# Histograma -------------------------------------------------------------------

ggplot(bd, aes(x = sep_com, fill = factor(tipo))) +
  geom_histogram(bins = 10, col = "white")



ggplot(bd, aes(x = sep_com)) +
  geom_histogram(bins = 20, col = "black") +
  ggtitle("Histograma")

# Barras -----------------------------------------------------------------------

# mtcars
datasets::mtcars
names(mtcars)
unique(mtcars$gear)


ggplot(mtcars, aes(x = gear, fill = factor(carb))) +
  geom_bar(size = 1.5, colour = "white", alpha = .6)

ggplot(mtcars, aes(gear, fill = factor(carb))) +
  geom_bar(size = 1.5, colour = "white", position = "dodge") +
  ggtitle("Gráfico de barras")

# Densidade --------------------------------------------------------------------

bd %>% 
  ggplot(aes(sep_com, fill = tipo)) +
  geom_density(alpha = .7)

# Linha ------------------------------------------------------------------------

# swiss
datasets::swiss

# [,3]	Examination	% draftees receiving highest mark on army examination
# [,4]	Education	% education beyond primary school for draftees.

swiss %>% 
  ggplot(aes(x = Examination, y = Education)) +
  geom_line(size = 1, col = "red", linetype = 2)

# CUSTOMIZAÇÃO -----------------------------------------------------------------


ggplot(bd, aes(x = sep_com, fill = factor(tipo))) +
  geom_histogram(bins = 10, col = "white")

bd %>% 
  ggplot(aes(sep_com, fill = factor(tipo))) +
  geom_histogram(bins = 10, col = "black") +
  ggtitle("Histograma")
  
bd %>% 
  ggplot(aes(sep_com, fill = factor(tipo))) +
  geom_histogram(bins = 10, col = "black") +
  labs(title = "Histograma",
       subtitle = "Comprimento da Sépala",
       x = "Comprimento da Sépala",
       y = "Frequência") +
  facet_wrap(tipo) # facets na vertical

bd %>% 
  ggplot(aes(sep_com, fill = factor(tipo))) +
  geom_histogram(bins = 10, col = "black") +
  labs(title = "Histograma",
       subtitle = "Comprimento da Sépala",
       x = "Comprimento da Sépala",
       y = "Frequência") +
  facet_grid(tipo~.) # ~.facets na horizontal

# Barras

ggplot(mtcars, aes(gear, fill = factor(carb))) +
  geom_bar(size = 1.5, colour = "white", position = "dodge") +
  ggtitle("Gráfico de barras")

# Paleta: scale_fill_brewer()

mtcars %>% 
  ggplot(aes(gear, fill = factor(carb))) +
  geom_bar(size = 1.5, colour = "white", position = "dodge") +
  labs(title = "Gráfico de barras",
       subtitle = "Por carburador",
       x = "Gear",
       y = "Frequencia",
       caption = "Curso R - 2022: Autoria Própria",
       fill = "Número de Carburadores") +
  theme_minimal() +
  theme(legend.position = "top") +
  scale_fill_brewer(palette = "Yl0rBr")

ggsave("grafico1.png", height = 8, width = 12, dpi = 300)

# paletas de cores qualitativas
display.brewer.all()

# Boxplot


ggplot(bd, aes(x = tipo, y = sep_larg)) +
  geom_boxplot() +
  geom_jitter() +
  ggtitle("Boxplot")

bd %>% 
  ggplot(aes(tipo, sep_larg, fill = tipo)) +
  geom_boxplot() +
  geom_jitter() +
  theme_minimal() +
  labs(title = "Boxplot", subtitle = "Por espécie",
       x = "Espécie de Flor",
       y = "Largura da Sépala",
       caption = "Curso R - 2022: Autoria Própria",
       fill = "Tipo planta") +
  scale_x_discrete(lab = NULL) +
  scale_fill_brewer(palette = "Set2",
                    labels = c("Setosa", "Versicolor", "Virgínica")) +
  theme(legend.position = "top",
        plot.title = element_text(hjust = .5),
        plot.subtitle = element_text(hjust = .5))

ggsave("grafico2.png", height = 8, width = 12, dpi = 300)

# Plot Duplo

library(gridExtra) # plots multiplos

# Plot 1:
grafico1 <- bd %>% 
  ggplot(aes(tipo, sep_larg, fill = tipo)) +
  geom_boxplot() +
  geom_jitter() +
  theme_minimal() +
  labs(title = "Boxplot", subtitle = "Por espécie",
       x = "Espécie de Flor",
       y = "Largura da Sépala",
       caption = "Curso R - 2022: Autoria Própria",
       fill = "Tipo planta") +
  scale_x_discrete(lab = NULL) +
  scale_fill_brewer(palette = "Set2",
                    labels = c("Setosa", "Versicolor", "Virgínica")) +
  theme(legend.position = "top",
        plot.title = element_text(hjust = .5),
        plot.subtitle = element_text(hjust = .5))



# Plot 2:
grafico2 <- mtcars %>% 
  ggplot(aes(gear, fill = factor(carb))) +
  geom_bar(size = 1.5, colour = "white", position = "dodge") +
  labs(title = "Gráfico de barras",
       subtitle = "Por carburador",
       x = "Gear",
       y = "Frequencia",
       caption = "Curso R - 2022: Autoria Própria",
       fill = "Número de Carburadores") +
  theme_minimal() +
  theme(legend.position = "top") +
  scale_fill_brewer(palette = "Yl0rBr")

grid.arrange(grafico1, grafico2, ncol = 2)


grafico_final

ggsave("grafico_final.png", height = 8, width = 12, dpi = 300)













































