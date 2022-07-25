#**********************************************************************************************
#  @Nombre: Script para generar la hoja de vida del activo 
#  @Autor: Jorge Saavedra
#  @Fecha: 20220709
#  @Cambios:
#  @Ayudas:
#**********************************************************************************************

# Cargue de Librerias -------------------------------------------------------------------------
library(tidyverse)    # Transformaciones de datos
library(data.table)   # Transformaciones de datos
library(lubridate)    # Tratamiento de fechas
library(httr)         # Publicacion de notificaciones
options(scipen = 999)

# Cargue de Documentos de referencia ----------------------------------------------------------
# Para que el scrip funcione debe primero setear en la computadora lo siguiente:
# @keyring::key_set("DWGM", "TuUsuraio", "TuContraseña")

placa <- c("KYO810", "KYO480")
desde <- "2022-04-01"
hasta <- Sys.Date()

for (i in placa) {
  
  placa <- i
  
  rmarkdown::render(
    input = "HV Activo.Rmd",  
    output_file = stringr::str_glue("02 Outputs/{placa}_Report_{format(Sys.Date(), '%Y%m%d')}.html"),
    params = list(placa = placa, desde = desde, hasta = hasta))
  
}
