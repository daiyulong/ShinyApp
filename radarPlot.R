library(ggradar)

suppressPackageStartupMessages(library(dplyr))
library(scales)
library(tibble)

mtcars %>%
  rownames_to_column( var = "group" ) %>%
  mutate_at(vars(-group),funs(rescale)) %>%
  tail(4) %>% select(1:10) -> mtcars_radar

ggradar(mtcars_radar, gridline.min.linetype = "longdash",grid.line.width = 1, 
       gridline.mid.linetype = "longdash", 
        gridline.max.linetype = "solid", gridline.min.colour = "#007A87", gridline.mid.colour = "#007A87",
       gridline.max.colour = "#007A87",group.line.width = 0.5,
       group.point.size = 2) 

