setwd("~/Desktop/NPS/Fireseverity/validation_EurekaFire")

library(tidyverse)
library(sf)
library(terra)


vegetation_classes = sf::st_read('JOTR_VegPolys.shp')

fire_polygon = terra::rast('refined_rbr.tif') %>%
  terra::project(terra::crs(vegetation_classes)) %>%
  terra::as.polygons() %>%
  sf::st_as_sf(terra::as.polygons(burn_severity))

vegetation_classes_fire = vegetation_classes %>%
  sf::st_intersection(fire_polygon) %>%
  group_by(MapUnit_Na) %>%
  summarise(geometry = sf::st_union(geometry)) %>%
  mutate(area_m2 = st_area(geometry),
         area_percent = 100*area_m2/sum(area_m2),
         VegetationType = paste0(MapUnit_Na, ': ', round(area_percent, 2), 
                                 '% (', round(area_m2/10000, 2), ' ha)'))

ggplot() + 
  geom_sf(data = vegetation_classes_fire, aes(fill = as.factor(VegetationType))) +
  scico::scale_fill_scico_d(name = 'Vegetation Type') +
  theme(legend.position = 'bottom',
        legend.direction = 'vertical')


#########

