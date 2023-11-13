### Time series of land cover change visualisation

# please change the path to your directory
setwd("D:/Isa/Task_Savanna/Landcover/")

library(terra)
library(sf)
library(dplyr)
library(tidyr)
library(ggplot2)

#### EIA

LC1992 <- st_read("./LC_1992_ElA_diagramm.shp")
LC2001 <- st_read("./LC_2001_ElA_diagramm.shp")
LC2011 <- st_read("./LC_2011_ElA_diagramm.shp")
LC2019 <- st_read("./LC_2019_ElA_diagramm.shp")

# Convert to df
LC1992_df <- as.data.frame(LC1992)
LC2001_df <- as.data.frame(LC2001)
LC2011_df <- as.data.frame(LC2011)
LC2019_df <- as.data.frame(LC2019)


# Add columns
LC1992_df$Year <- 1992
LC2001_df$Year <- 2001
LC2011_df$Year <- 2011
LC2019_df$Year <- 2019



# Define the class names based on the Class IDs
LC1992_df <- LC1992_df %>%
  mutate(ClassName = case_when(
    Class == 11 ~ "Herbaceous Cover",
    Class == 12 ~ "Tree or Shrub Cover",
    Class == 60 ~ "Tree Cover (broadleved, deciduous, closed to open)",
    Class == 61 ~ "Tree Cover (broadleaved, deciduous, closed)",
    Class == 62 ~ "Tree Cover (broadleaved, deciduous, open)",
    Class == 100 ~ "Tree and Shrubs / Herbaceous Cover",
    Class == 110 ~ "Herbaceous Cover / Tree and Shrubs",
    Class == 120 ~ "Shrubland",
    Class == 122 ~ "Deciduous Shrubland",
    Class == 130 ~ "Grassland",
    Class == 180 ~ "Shrub or Herbaceous Cover (flooded)",
    Class == 200 ~ "Bare Areas",
    TRUE ~ as.character(Class)  
  ))

LC2001_df <- LC2001_df %>%
  mutate(ClassName = case_when(
    Class == 11 ~ "Herbaceous Cover",
    Class == 12 ~ "Tree or Shrub Cover",
    Class == 60 ~ "Tree Cover (broadleved, deciduous, closed to open)",
    Class == 61 ~ "Tree Cover (broadleaved, deciduous, closed)",
    Class == 62 ~ "Tree Cover (broadleaved, deciduous, open)",
    Class == 100 ~ "Tree and Shrubs / Herbaceous Cover",
    Class == 110 ~ "Herbaceous Cover / Tree and Shrubs",
    Class == 120 ~ "Shrubland",
    Class == 122 ~ "Deciduous Shrubland",
    Class == 130 ~ "Grassland",
    Class == 180 ~ "Shrub or Herbaceous Cover (flooded)",
    Class == 200 ~ "Bare Areas",
    TRUE ~ as.character(Class)  
  ))

LC2011_df <- LC2011_df %>%
  mutate(ClassName = case_when(
    Class == 11 ~ "Herbaceous Cover",
    Class == 12 ~ "Tree or Shrub Cover",
    Class == 60 ~ "Tree Cover (broadleved, deciduous, closed to open)",
    Class == 61 ~ "Tree Cover (broadleaved, deciduous, closed)",
    Class == 62 ~ "Tree Cover (broadleaved, deciduous, open)",
    Class == 100 ~ "Tree and Shrubs / Herbaceous Cover",
    Class == 110 ~ "Herbaceous Cover / Tree and Shrubs",
    Class == 120 ~ "Shrubland",
    Class == 122 ~ "Deciduous Shrubland",
    Class == 130 ~ "Grassland",
    Class == 180 ~ "Shrub or Herbaceous Cover (flooded)",
    Class == 200 ~ "Bare Areas",
    TRUE ~ as.character(Class)  
  ))

LC2019_df <- LC2019_df %>%
  mutate(ClassName = case_when(
    Class == 11 ~ "Herbaceous Cover",
    Class == 12 ~ "Tree or Shrub Cover",
    Class == 60 ~ "Tree Cover (broadleved, deciduous, closed to open)",
    Class == 61 ~ "Tree Cover (broadleaved, deciduous, closed)",
    Class == 62 ~ "Tree Cover (broadleaved, deciduous, open)",
    Class == 100 ~ "Tree and Shrubs / Herbaceous Cover",
    Class == 110 ~ "Herbaceous Cover / Tree and Shrubs",
    Class == 120 ~ "Shrubland",
    Class == 122 ~ "Deciduous Shrubland",
    Class == 130 ~ "Grassland",
    Class == 180 ~ "Shrub or Herbaceous Cover (flooded)",
    Class == 200 ~ "Bare Areas",
    TRUE ~ as.character(Class)  
  ))



# Combine the data frames into one
combined_df <- bind_rows(LC1992_df, LC2001_df, LC2011_df, LC2019_df)


#### NoEIA

LC1992N <- st_read("./LC_1992_NoElA_diagramm.shp")
LC2001N <- st_read("./LC_2001_NoElA_diagramm.shp")
LC2011N <- st_read("./LC_2011_NoElA_diagramm.shp")
LC2019N <- st_read("./LC_2019_NoElA_diagramm.shp")

# Convert to df
LC1992N_df <- as.data.frame(LC1992N)
LC2001N_df <- as.data.frame(LC2001N)
LC2011N_df <- as.data.frame(LC2011N)
LC2019N_df <- as.data.frame(LC2019N)


# Add columns
LC1992N_df$Year <- 1992
LC2001N_df$Year <- 2001
LC2011N_df$Year <- 2011
LC2019N_df$Year <- 2019


# Define the class names based on the Class IDs
LC1992N_df <- LC1992N_df %>%
  mutate(ClassName = case_when(
    Class == 11 ~ "Herbaceous Cover",
    Class == 12 ~ "Tree or Shrub Cover",
    Class == 60 ~ "Tree Cover (broadleved, deciduous, closed to open)",
    Class == 61 ~ "Tree Cover (broadleaved, deciduous, closed)",
    Class == 62 ~ "Tree Cover (broadleaved, deciduous, open)",
    Class == 100 ~ "Tree and Shrubs / Herbaceous Cover",
    Class == 110 ~ "Herbaceous Cover / Tree and Shrubs",
    Class == 120 ~ "Shrubland",
    Class == 122 ~ "Deciduous Shrubland",
    Class == 130 ~ "Grassland",
    Class == 180 ~ "Shrub or Herbaceous Cover (flooded)",
    Class == 200 ~ "Bare Areas",
    TRUE ~ as.character(Class)  
  ))

LC2001N_df <- LC2001N_df %>%
  mutate(ClassName = case_when(
    Class == 11 ~ "Herbaceous Cover",
    Class == 12 ~ "Tree or Shrub Cover",
    Class == 60 ~ "Tree Cover (broadleved, deciduous, closed to open)",
    Class == 61 ~ "Tree Cover (broadleaved, deciduous, closed)",
    Class == 62 ~ "Tree Cover (broadleaved, deciduous, open)",
    Class == 100 ~ "Tree and Shrubs / Herbaceous Cover",
    Class == 110 ~ "Herbaceous Cover / Tree and Shrubs",
    Class == 120 ~ "Shrubland",
    Class == 122 ~ "Deciduous Shrubland",
    Class == 130 ~ "Grassland",
    Class == 180 ~ "Shrub or Herbaceous Cover (flooded)",
    Class == 200 ~ "Bare Areas",
    TRUE ~ as.character(Class)  
  ))

LC2011N_df <- LC2011N_df %>%
  mutate(ClassName = case_when(
    Class == 11 ~ "Herbaceous Cover",
    Class == 12 ~ "Tree or Shrub Cover",
    Class == 60 ~ "Tree Cover (broadleved, deciduous, closed to open)",
    Class == 61 ~ "Tree Cover (broadleaved, deciduous, closed)",
    Class == 62 ~ "Tree Cover (broadleaved, deciduous, open)",
    Class == 100 ~ "Tree and Shrubs / Herbaceous Cover",
    Class == 110 ~ "Herbaceous Cover / Tree and Shrubs",
    Class == 120 ~ "Shrubland",
    Class == 122 ~ "Deciduous Shrubland",
    Class == 130 ~ "Grassland",
    Class == 180 ~ "Shrub or Herbaceous Cover (flooded)",
    Class == 200 ~ "Bare Areas",
    TRUE ~ as.character(Class)  
  ))

LC2019N_df <- LC2019N_df %>%
  mutate(ClassName = case_when(
    Class == 11 ~ "Herbaceous Cover",
    Class == 12 ~ "Tree or Shrub Cover",
    Class == 60 ~ "Tree Cover (broadleved, deciduous, closed to open)",
    Class == 61 ~ "Tree Cover (broadleaved, deciduous, closed)",
    Class == 62 ~ "Tree Cover (broadleaved, deciduous, open)",
    Class == 100 ~ "Tree and Shrubs / Herbaceous Cover",
    Class == 110 ~ "Herbaceous Cover / Tree and Shrubs",
    Class == 120 ~ "Shrubland",
    Class == 122 ~ "Deciduous Shrubland",
    Class == 130 ~ "Grassland",
    Class == 180 ~ "Shrub or Herbaceous Cover (flooded)",
    Class == 200 ~ "Bare Areas",
    TRUE ~ as.character(Class)  
  ))



# Combine the data frames into one
combinedN_df <- bind_rows(LC1992N_df, LC2001N_df, LC2011N_df, LC2019N_df)


#### Visualisation

## Plot EIA
plot_LC_EIA <- ggplot(data = combined_df %>% filter(ClassPerc > 0.5), aes(x = Year, y = ClassPerc, color = factor(ClassName))) +
  geom_line() +
  geom_text(data = subset(combined_df, Year %in% c(1992, 2019) & ClassPerc > 6), 
            aes(label = as.character(ClassPerc)),
            vjust = -0.5, hjust = 0, size = 3) +
  labs(title = "Land Cover Change over Time within EIAs (Classes > 0.5%)",
       x = "Year",
       y = "Percentage") +
  scale_color_manual(name = "Land Cover Class",
                     values = c("Herbaceous Cover" = "#FFFF64",
                                "Tree or Shrub Cover" = "#F0F036",
                                "Tree Cover (broadleved, deciduous, closed to open)" = "#00A000",
                                "Tree Cover (broadleaved, deciduous, closed)" = "#137813",
                                "Tree Cover (broadleaved, deciduous, open)" = "#B0EE02",
                                "Tree and Shrubs / Herbaceous Cover" = "#8DA000",
                                "Herbaceous Cover / Tree and Shrubs" = "#BE9600",
                                "Shrubland" = "#966400",
                                "Deciduous Shrubland" = "#5B410A",
                                "Grassland" = "#FFB432",
                                "Shrub or Herbaceous Cover (flooded)" = "#00DC83",
                                "Bare Areas" = "#F1DA96")) +  
  scale_x_continuous(breaks = c(1992, 2001, 2011, 2019)) + 
  guides(color = guide_legend(override.aes = list(label = ""))) +  
  theme(axis.text.x = element_text(size = 8),  
        legend.text = element_text(size = 8))

print(plot_LC_EIA)

ggsave("./Report/Graphs_Trend/LC_EIAs.pdf", plot_LC_EIA, width = 13, height = 10, dpi = 300, limitsize = F)


## Plot NoEIA
plot_LC_NoEIA <- ggplot(data = combinedN_df %>% filter(ClassPerc > 0.5), aes(x = Year, y = ClassPerc, color = factor(ClassName))) +
  geom_line() +
  geom_text(data = subset(combinedN_df, Year %in% c(1992, 2019) & ClassPerc > 3), 
            aes(label = as.character(ClassPerc)),
            vjust = -0.5, hjust = 0, size = 3) +
  labs(title = "Land Cover Change over Time in not EIAs (Classes > 0.5%)",
       x = "Year",
       y = "Percentage") +
  scale_color_manual(name = "Land Cover Class",
                     values = c("Herbaceous Cover" = "#FFFF64",
                                "Tree or Shrub Cover" = "#F0F036",
                                "Tree Cover (broadleved, deciduous, closed to open)" = "#00A000",
                                "Tree Cover (broadleaved, deciduous, closed)" = "#137813",
                                "Tree Cover (broadleaved, deciduous, open)" = "#B0EE02",
                                "Tree and Shrubs / Herbaceous Cover" = "#8DA000",
                                "Herbaceous Cover / Tree and Shrubs" = "#BE9600",
                                "Shrubland" = "#966400",
                                "Deciduous Shrubland" = "#5B410A",
                                "Grassland" = "#FFB432",
                                "Shrub or Herbaceous Cover (flooded)" = "#00DC83",
                                "Bare Areas" = "#F1DA96")) +  
  scale_x_continuous(breaks = c(1992, 2001, 2011, 2019)) + 
  guides(color = guide_legend(override.aes = list(label = ""))) +  
  theme(axis.text.x = element_text(size = 8),  
        legend.text = element_text(size = 8))


print(plot_LC_NoEIA)

ggsave("./Report/Graphs_Trend/LC_NoEIA.pdf", plot_LC_NoEIA, width = 13, height = 10, dpi = 300, limitsize = F)


## plot EIA & NoEIA together

# only show specific classes
included_classes <- c("Tree and Shrubs / Herbaceous Cover", "Tree Cover (broadleved, deciduous, closed to open)",
                      "Tree Cover (broadleaved, deciduous, open)", "Shrubland")

# create plot of EIA
EIA_Plot <- ggplot(data = combined_df %>% filter(ClassName %in% included_classes), aes(x = Year, y = ClassPerc, color = factor(ClassName))) +
  geom_line() +
  geom_text(data = subset(combined_df, Year %in% c(1992, 2019) & ClassName %in% included_classes & ClassPerc > 3),
            aes(label = as.character(ClassPerc)),
            vjust = -0.5, hjust = 0, size = 3) +
  labs(title = "Land Cover Change over Time ",
       subtitle = "within EIAs (solid) and the Rest of Kruger NP (dashed)",
       x = "Year",
       y = "Percentage") +
  scale_color_manual(name = "Land Cover Class",
                     values = c("Herbaceous Cover" = "#FFFF64",
                                "Tree or Shrub Cover" = "#F0F036",
                                "Tree Cover (broadleved, deciduous, closed to open)" = "#00A000",
                                "Tree Cover (broadleaved, deciduous, closed)" = "#137813",
                                "Tree Cover (broadleaved, deciduous, open)" = "#B0EE02",
                                "Tree and Shrubs / Herbaceous Cover" = "#8DA000",
                                "Herbaceous Cover / Tree and Shrubs" = "#BE9600",
                                "Shrubland" = "#966400",
                                "Deciduous Shrubland" = "#5B410A",
                                "Grassland" = "#FFB432",
                                "Shrub or Herbaceous Cover (flooded)" = "#00DC83",
                                "Bare Areas" = "#F1DA96")) +  
  scale_x_continuous(breaks = c(1992, 2001, 2011, 2019)) + 
  guides(color = guide_legend(override.aes = list(label = ""))) +
  theme(axis.text.x = element_text(size = 8),  
        legend.text = element_text(size = 8))


# add lines and text for NoEIA
plot_both <- EIA_Plot +
  geom_line(data = combinedN_df %>% filter(ClassName %in% included_classes), linetype = 2) +
  geom_text(data = subset(combinedN_df, Year %in% c(1992, 2019) & ClassName %in% included_classes & ClassPerc > 3),
            aes(label = as.character(ClassPerc)),
            vjust = 1, hjust = 0, size = 3) 


print(plot_both)

ggsave("./Report/Graphs_Trend/LC_Trend.pdf", plot_both, width = 13, height = 10, dpi = 300, limitsize = F)

