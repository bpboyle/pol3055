library(ggplot2)
library(dplyr)
library(colorBlindness)
library(colorblindcheck)
library(MetBrewer)


# Lets create a bar chart

iris_plot <- iris |> 
  group_by(Species) |> 
  summarise(mean_petal_l = mean(Petal.Length)) |> 
  ggplot(aes(x = Species, y = mean_petal_l, fill = Species)) +
  geom_col() +
  labs(x = '\nSpecies', y = 'Mean Petal Length\n', 
       title = 'Mean Petal Length by Species') +
  theme_minimal() 


# We can add some colour
iris_plot <- iris_plot +
  scale_y_continuous(limits = c(0, 6), breaks  = 1:6) +
  scale_fill_manual(values = met.brewer(name = 'VanGogh2', n = 3)) +
  guides(fill = 'none')

 # scale_fill_manual(values = c('red', 'deepskyblue2', 'green'))

# We can ues the colourBlindness package to check out plot
cvdPlot(iris_plot)



# We can also see just palettes under different types of colourblindness
pal <-  c('#006400', '#00CED1', '#8A2BE2')
palette_check(pal, plot = T)

pal_van <- met.brewer(name = 'VanGogh2', n = 3)
palette_check(pal_van, plot = T)


## Resources
# R named and hexidecimal colours
# https://r-charts.com/colors/

# MET Colour Palette
# https://www.blakerobertmills.com/my-work/met-brewer

# Okabe Ito Colour Palette
# https://easystats.github.io/see/reference/scale_color_okabeito.html

# Colour Picker tool
# https://imagecolorpicker.com/color-code/faa61a