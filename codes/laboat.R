laboat <- Breads_batch_2_extracted_with_smaller_sample_size %>% mutate(folate = if_else(folate < 0, 0, folate))

#get the mean

laboat_vit <- laboat %>% filter(component != "Total") 
laboat_vit_mean <- aggregate(laboat_vit$folate, list(laboat_vit$sample, laboat_vit$treatment, laboat_vit$component), mean)
laboat_vit_mean$Group.3 <- factor(laboat_vit_mean$Group.3, levels = comp_ord)

# perttu
#barplot 

perttu_bar <- laboat_vit %>% filter(sample == "Oat_perttu") %>%  ggbarplot(x = "component", y = "folate",
fill = "treatment", color = "white", palette = "jco", add.params = list(color = "black"), 
add = "mean_sd", title = "", position = position_dodge(0.8), xlab = "", 
ylab = "Folate (µg/100g FM)", x.text.angle = 30) + theme(plot.title = element_text(hjust = 0), 
axis.text = element_text(size = 10), legend.position = c(0.8, 1), legend.title = element_blank(), 
legend.text = element_text(size = 10),axis.title.y = element_text(size = 11)) +
  annotate('text',x = c("PGA", "10-HCO-H2", "10-HCO-PGA", "H4", "5-CH3-H4", "5-HCO-H4","5,10-CH+-H4"), 
y = c(1.8, 2, 7, 3, 3, 3.5, 5), label = c("*", " ", "**", " ", "**", "**", " "))

#piechart 
perttu_p1 <- laboat_vit_mean %>% filter(Group.1 == "Oat_perttu" & Group.2 == "Bread") %>% 
  ggpie("x",  fill = "Group.3", color = "white",palette = "npg") + 
  ggtitle("Bread") + theme(plot.title = element_text(hjust = 0.5)) + 
  theme(legend.position = "right")  + theme_void() + theme(legend.title = element_blank())

perttu_p2 <- laboat_vit_mean %>% filter(Group.1 == "Oat_perttu" & Group.2 == "Bread Digesta") %>% 
  ggpie("x",  fill = "Group.3", color = "white",palette = "npg") + 
  ggtitle("Digesta") + theme(plot.title = element_text(hjust = 0.5)) + 
  theme(legend.position = "right")  + theme_void() + theme(legend.title = element_blank())

perttu_pie <- ggarrange(perttu_p1, perttu_p2, ncol = 1, nrow = 2, 
                           common.legend = TRUE, legend = "right")

perttu <- ggarrange(perttu_bar, perttu_pie, widths = c(2, 1), labels = c("A a) Oat_perttu", "b)"),
                       label.x = -0.1, font.label = list(size = 11))
perttu

# meeri
meeri_bar <- laboat_vit %>% filter(sample == "Oat_meeri") %>%  ggbarplot(x = "component", y = "folate",
                                                                           fill = "treatment", color = "white", palette = "jco", add.params = list(color = "black"), 
                                                                           add = "mean_sd", title = "", position = position_dodge(0.8), xlab = "", 
                                                                           ylab = "Folate (µg/100g FM)", x.text.angle = 30) + theme(plot.title = element_text(hjust = 0), 
                                                                                                                                    axis.text = element_text(size = 10), legend.position = c(0.8, 1), legend.title = element_blank(), 
                                                                                                                                    legend.text = element_text(size = 10),axis.title.y = element_text(size = 11)) +
  annotate('text',x = c("PGA", "10-HCO-H2", "10-HCO-PGA", "H4", "5-CH3-H4", "5-HCO-H4","5,10-CH+-H4"), 
           y = c(1, 5, 5, 3, 5.5, 5, 5), label = c("**", "**", " ", "**", "*", "**", " "))

#piechart 
meeri_p1 <- laboat_vit_mean %>% filter(Group.1 == "Oat_meeri" & Group.2 == "Bread") %>% 
  ggpie("x",  fill = "Group.3", color = "white",palette = "npg") + 
  ggtitle("Bread") + theme(plot.title = element_text(hjust = 0.5)) + 
  theme(legend.position = "right")  + theme_void() + theme(legend.title = element_blank())

meeri_p2 <- laboat_vit_mean %>% filter(Group.1 == "Oat_meeri" & Group.2 == "Bread Digesta") %>% 
  ggpie("x",  fill = "Group.3", color = "white",palette = "npg") + 
  ggtitle("Digesta") + theme(plot.title = element_text(hjust = 0.5)) + 
  theme(legend.position = "right")  + theme_void() + theme(legend.title = element_blank())

meeri_pie <- ggarrange(meeri_p1, meeri_p2, ncol = 1, nrow = 2, 
                        common.legend = TRUE, legend = "right")

meeri <- ggarrange(meeri_bar, meeri_pie, widths = c(2, 1), labels = c("A a) Oat_meeri", "b)"),
                    label.x = -0.1, font.label = list(size = 11))
meeri

# peppi
peppi_bar <- laboat_vit %>% filter(sample == "Oat_peppi") %>%  ggbarplot(x = "component", y = "folate",
                                                                           fill = "treatment", color = "white", palette = "jco", add.params = list(color = "black"), 
                                                                           add = "mean_sd", title = "", position = position_dodge(0.8), xlab = "", 
                                                                           ylab = "Folate (µg/100g FM)", x.text.angle = 30) + theme(plot.title = element_text(hjust = 0), 
                                                                                                                                    axis.text = element_text(size = 10), legend.position = c(0.8, 1), legend.title = element_blank(), 
                                                                                                                                    legend.text = element_text(size = 10),axis.title.y = element_text(size = 11)) +
  annotate('text',x = c("PGA", "10-HCO-H2", "10-HCO-PGA", "H4", "5-CH3-H4", "5-HCO-H4","5,10-CH+-H4"), 
           y = c(2, 2, 6, 6, 6, 2, 5), label = c(" ", " ", " ", " ", "**", " ", " "))

#piechart 
peppi_p1 <- laboat_vit_mean %>% filter(Group.1 == "Oat_peppi" & Group.2 == "Bread") %>% 
  ggpie("x",  fill = "Group.3", color = "white",palette = "npg") + 
  ggtitle("Bread") + theme(plot.title = element_text(hjust = 0.5)) + 
  theme(legend.position = "right")  + theme_void() + theme(legend.title = element_blank())

peppi_p2 <- laboat_vit_mean %>% filter(Group.1 == "Oat_peppi" & Group.2 == "Bread Digesta") %>% 
  ggpie("x",  fill = "Group.3", color = "white",palette = "npg") + 
  ggtitle("Digesta") + theme(plot.title = element_text(hjust = 0.5)) + 
  theme(legend.position = "right")  + theme_void() + theme(legend.title = element_blank())

peppi_pie <- ggarrange(peppi_p1, peppi_p2, ncol = 1, nrow = 2, 
                        common.legend = TRUE, legend = "right")

peppi <- ggarrange(peppi_bar, peppi_pie, widths = c(2, 1), labels = c("A a) Oat_peppi", "b)"),
                    label.x = -0.1, font.label = list(size = 11))
peppi