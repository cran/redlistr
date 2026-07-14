## ----Loading packages, message=FALSE------------------------------------------
library(terra)
library(redlistr)

## ----Loading our example distributions----------------------------------------
mangrove.2000 <- rast(system.file("extdata", "example_distribution_2000.tif", 
                                    package = "redlistr"))
mangrove.2017 <- rast(system.file("extdata", "example_distribution_2017.tif", 
                                    package = "redlistr"))

## ----Plotting the two rasters, fig.show='hold', fig.width=7, fig.height=7, fig.alt='Overlay of two mangrove distribution maps'----
plot(mangrove.2000, col = "grey30", legend = FALSE, main = "Mangrove Distribution")
plot(mangrove.2017, add = T, col = "darkorange", legend = FALSE)

## ----Checking CRS-------------------------------------------------------------
is.lonlat(mangrove.2000) 
is.lonlat(mangrove.2017)
# If TRUE, they must be transformed to a projected coordinate system

crs(mangrove.2000) == crs(mangrove.2017)

## ----Calculate area of rasters, eval = F--------------------------------------
#  a.2000 <- getArea(mangrove.2000)
#  a.2000
#  a.2017 <- getArea(mangrove.2017)
#  a.2017

## ----Calculate area of multiple rasters, eval = F-----------------------------
#  a <- getArea(c(mangrove.2000, mangrove.2017))

## ----Using getAreaChange, eval = F--------------------------------------------
#  # input rasters
#  area.change <- getAreaChange(mangrove.2000, mangrove.2017)
#  
#  # input data frames
#  # value is the column that identifies the ecosystem in both tables.
#  
#  area.change <- getAreaChange(a.2000, a.2017, value)

## ----Using getDeclineStats----------------------------------------------------
decline <- declineForecast(mangrove.2000,   # ecosystem at time 1
                           mangrove.2017,   # ecosystem at time 2
                           t1 = 2000,       # year of time 1
                           year_diff = 17,  # difference between time 1 and time 2 in years
                           forecast_year = 2050)  # year of desired forecast, defaults to t1+50
decline

## ----Make EOO, eval = F-------------------------------------------------------
#  EOO.polygon <- getEOO(mangrove.2017)

## ----View EOO, fig.width=7, fig.height=7, eval = F----------------------------
#  
#  #summarise and plot
#  summary(EOO.polygon)
#  plot(EOO.polygon)
#  
#  #area
#  EOO.area <- getAreaEOO(EOO.polygon)
#  EOO.area

## ----Creating AOO grid, eval = F----------------------------------------------
#  AOO.grid <- getAOO(mangrove.2017, cell_size = 10000)
#  

## ----view and summarise AOO, eval = F, fig.width=7, fig.height=7--------------
#  # summary
#  summary(AOO.grid)
#  
#  # handy plotting function
#  plot(AOO.grid)

## ----Getting number of AOO grids, eval = FALSE, fig.alt='histogram of values generated with the jitter function'----
#  
#  # jplot
#  jplot(AOO.grid)
#  
#  # histogram of values generated with each rep
#  hist(AOO.grid)
#  

## ----increase iterations, eval = F--------------------------------------------
#  # increase the number of iterations, if desired
#  AOO.grid_n150 <- getAOO(mangrove.2017, cell_size = 10000, n_jitter = 150)
#  
#  # You can rerun diagnostics here to check for improvement
#  jplot(AOO.grid_n150)
#  hist(AOO.grid_n150)

## ----One percent grid, eval = F-----------------------------------------------
#  AOO.grid.keep.all <- getAOO(mangrove.2017, cell_size = 10000,
#                              bottom_1pct_rule = F, n_jitter = 150)
#  AOO.grid.5.pct <- getAOO(mangrove.2017, cell_size = 10000,
#                           bottom_1pct_rule = T, n_jitter = 150, percent = 5)
#  

## ----View percent rule results, fig.width=14, fig.height=5, eval = TRUE, fig.alt='Testing options of AOO metric for 2017 mangrove distribution map', eval = F----
#  par(mfrow = c(1,3))
#  plot(AOO.grid.keep.all, title = "Keep all")
#  plot(AOO.grid_n150, title = "Remove bottom 1% (default)")
#  plot(AOO.grid.5.pct, title = "Remove bottom 5%")
#  par(mfrow = c(1,1))
#  

