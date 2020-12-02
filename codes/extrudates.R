Extrudate <- Extrudate %>% mutate(dry = if_else(dry < 0, 0, dry))

ord1 <- c("Flour", "Extrudate", "Extrudate Digesta")


# S2
s2 <- Extrudate %>% filter(main_ingredient == "S2")

s2$component <- factor(s2$component, levels = x_ord)
s2$sample <- factor(s2$sample, levels = ord1)

s2 %>% ggbarplot(x = "component", y = "dry",fill = "sample", color = "white", palette = "jco",
                    add.params = list(color = "black"), add = "mean_sd", title = "S2", 
                    position = position_dodge(0.8), xlab = "", ylab = "Folate (µg/100g DM)", x.text.angle = 30) + 
  theme(plot.title = element_text(hjust = 0.5),axis.text = element_text(size = 10), 
        legend.position = c(0.83,0.9), legend.title = element_blank(),legend.text = element_text(size = 10),
        axis.title.y = element_text(size = 11))

# S4
s4 <- Extrudate %>% filter(main_ingredient == "S4")

s4$component <- factor(s2$component, levels = x_ord)
s4$sample <- factor(s2$sample, levels = ord1)

s4 %>% ggbarplot(x = "component", y = "dry",fill = "sample", color = "white", palette = "jco",
                 add.params = list(color = "black"), add = "mean_sd", title = "S4", 
                 position = position_dodge(0.8), xlab = "", ylab = "Folate (µg/100g DM)", x.text.angle = 30) + 
  theme(plot.title = element_text(hjust = 0.5),axis.text = element_text(size = 10), 
        legend.position = c(0.83,0.9), legend.title = element_blank(),legend.text = element_text(size = 10),
        axis.title.y = element_text(size = 11))

#l
l <- Extrudate %>% filter(main_ingredient == "L")
ord2 <- c("Flour", "Extrudate 40", "Extrudate 40 Digesta", "Extrudate 80", "Extrudate 80 Digesta")

l$component <- factor(l$component, levels = x_ord)
l$sample <- factor(l$sample, levels = ord2)

l %>% ggbarplot(x = "component", y = "dry",fill = "sample", color = "white", palette = "jco",
                 add.params = list(color = "black"), add = "mean_sd", title = "L", 
                 position = position_dodge(0.8), xlab = "", ylab = "Folate (µg/100g DM)", x.text.angle = 30) + 
  theme(plot.title = element_text(hjust = 0.5),axis.text = element_text(size = 10), 
        legend.position = c(0.83,0.9), legend.title = element_blank(),legend.text = element_text(size = 10),
        axis.title.y = element_text(size = 11))