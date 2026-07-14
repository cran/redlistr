## ----Loading packages, message=FALSE, echo=FALSE, results="hide"--------------
library(terra)
library(redlistr)
raster_file <- system.file("extdata", "example_distribution_2000.tif", 
                                    package = "redlistr")

## ----Loading our example distributions----------------------------------------
ecosystem_map <- rast(raster_file)
ecosystem_EOO <- getEOO(ecosystem_map)
summary(ecosystem_EOO)

