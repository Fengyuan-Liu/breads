
#for ginding experiment
w1 <- breads_g %>% filter(main_ingredient == "Whole Wheat")

r1 <- breads_g %>% filter(main_ingredient == "Rye")

w1_pic <- ggbarplot(w1, x = "component", y = "folate",
          fill = "Treatment", color = "white", palette = "jco", add.params = list(color = "black"), 
          add = "mean_range", title = "Whole Wheat Toast", position = position_dodge(0.8), xlab = "", 
          ylab = "Folate (µg/100g FM)", x.text.angle = 30) + 
  theme(plot.title = element_text(hjust = 0.5), axis.text = element_text(size = 10), 
        legend.position = c(0, 1), legend.title = element_blank(), 
      legend.text = element_text(size = 10),axis.title.y = element_text(size = 11))

r1_pic <- ggbarplot(r1, x = "component", y = "folate",
                    fill = "Treatment", color = "white", palette = "jco", add.params = list(color = "black"), 
                    add = "mean_range", title = "Rye Square", position = position_dodge(0.8), xlab = "", 
                    ylab = "Folate (µg/100g FM)", x.text.angle = 30) + 
  theme(plot.title = element_text(hjust = 0.5), axis.text = element_text(size = 10), 
        legend.position = c(0, 1), legend.title = element_blank(), 
        legend.text = element_text(size = 10),axis.title.y = element_text(size = 11)); r1_pic

#for lipase experiment
r2 <- breads_l %>% filter(main_ingredient == "Rye")

o1 <- breads_l %>% filter(main_ingredient == "Oat")

r2_pic <- ggbarplot(r2, x = "component", y = "folate",
                    fill = "Treatment", color = "white", palette = "jco", add.params = list(color = "black"), 
                    add = "mean_range", title = "Rye Toast", position = position_dodge(0.8), xlab = "", 
                    ylab = "Folate (µg/100g FM)", x.text.angle = 30) + 
  theme(plot.title = element_text(hjust = 0.5), axis.text = element_text(size = 10), 
        legend.position = c(0, 1), legend.title = element_blank(), 
        legend.text = element_text(size = 10),axis.title.y = element_text(size = 11)); r2_pic

o1_pic <- ggbarplot(o1, x = "component", y = "folate",
                    fill = "Treatment", color = "white", palette = "jco", add.params = list(color = "black"), 
                    add = "mean_range", title = "Oat Square", position = position_dodge(0.8), xlab = "", 
                    ylab = "Folate (µg/100g FM)", x.text.angle = 30) + 
  theme(plot.title = element_text(hjust = 0.5), axis.text = element_text(size = 10), 
        legend.position = c(0, 1), legend.title = element_blank(), 
        legend.text = element_text(size = 10),axis.title.y = element_text(size = 11)); o1_pic


