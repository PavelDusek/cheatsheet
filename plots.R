library(tidyverse)
library(ggplot)

t <- theme(
	  legend.position = "none",
	  axis.text = element_text( size = 16 ),
	  axis.title = element_text( size = 30 )
	  )

#fct_reorder(var1, var2, .fun = mean)
g <- df |>
	ggplot( aes( x = fct_reorder(var1, var2), y = var2 ) ) +
	geom_violin(aes( color = var1 ) ) + 
	geom_boxplot(width = 0.3) +
	geom_jitter(aes( fill = var1 ), height = 0, width = 0.3, size = 3, alpha = 0.8 ) +
	xlab( "x label" ) +
	ylab( "y label" ) +
	labs( title = "Title", subtitle = "Subtitle" ) +
	xlims( 1, 20 ) +
	ylims( 10, 20 ) +
	t

g2 <- df |>
	ggplot( aes( x = var1, y = var2 ) ) +
	geom_point( size = 3, alpha = 0.8 ) +
	geom_text( aes( label = var3 ), vjust = 0, nudge_y = 1, alpha = 0.8 ) +
	#geom_text( aes( label = var3 ), hjust = 0, nudge_x ) +
	annotate("segment", x = 5, xend = 5, y = 2.5, yend = 1.2, arrow = arrow( type = "closed", length = unit(0.02, "npc") ), color = "black" ) +
	annotate("text", x = 7.5, y = 8, label = "some text", color = "black", size = 18 ) +
	t
