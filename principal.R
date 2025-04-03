## código principal


# pacotes

{
  if(!require(pacman)) install.packages('pacman')
  
  p_load(readxl,dplyr,summarytools)
}


## carregar planilha

## SE SOUBER CAMINHO
caminho_arquivo <- 'C:\mark'


# Abre a janela para seleção de arquivos
## A JANELA SE ESCONDE AS VEZES, MINIMIZAR O R E PROCURAR
(caminho_arquivo <- file.choose())


# arquivo em .xlsx
# FIZ UM TRATAMENTO PARA LEITURA DAS COLUNAS


df = readxl::read_excel(caminho_arquivo,
                        col_types = c('text','numeric','numeric','numeric','numeric','numeric',
'numeric','text','numeric','numeric','numeric','numeric','numeric','numeric','text','text','text',
'text','text','text','text','text','text','text','text','text','text','text',
'text','text','text','text','text','text','text','text','text','text','text','text',
'text','numeric'),
                        na = c("Ignorado","Não aplicável"))

## descritiva da coluna
## 
## AS VARIAVEIS COMEÇADAS COM NUMEROS SAO PROBLEMATICAS NO R, COLOQUEI O ACENTO PARA
## QUE NÃO DÊ ERROS
## df$`2012_A2` - FORMA DE USAR A COLUNA 2012_A2, POR EXEMPLO


# NUMEROS
summarytools::dfSummary(df$`2012_A2`)

summarytools::descr(df$`2012_A2`)


# CATEGORIAS
summarytools::dfSummary(df$`2012_A8`)

summarytools::freq(df$`2012_A8`)

# PORTE DO MUNICIPIO
summarytools::dfSummary(df$`2012_A538`)

summarytools::freq(df$`2012_A538`)

##### CRUZAMENTO DE VARIAVEIS CATEGORICAS

summarytools::ctable(df$`2012_A538`,df$`2012_A8`)

# coluna com menos categorias primeiro - senao vai atrapalhar a leitura na tela do console do R



# para visualização como mandei na foto

# NUMERO
stview(descr(df$`2012_A2`))

#CATEGORIA
stview(freq(df$`2012_A538`))
stview(dfSummary(df$`2012_A538`))




