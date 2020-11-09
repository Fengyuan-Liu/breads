#barplot for rye toast

oat_toast_bar <- bread_vit %>% filter(sample == "Whole Oat") %>%  ggbarplot(x = "component", y = "folate",
fill = "treatment", color = "white", palette = "jco", add.params = list(color = "black"), add = "mean_sd", title = "", position = position_dodge(0.8), xlab = "", 
ylab = "Folate (µg/100g FM)", x.text.angle = 30) + theme(plot.title = element_text(hjust = 0), 
axis.text = element_text(size = 10), legend.position = c(0.8, 1), legend.title = element_blank(), 
legend.text = element_text(size = 10),axis.title.y = element_text(size = 11)) + 
annotate('text',x = c("PGA", "10-HCO-H2", "10-HCO-PGA", "H4", "5-CH3-H4", "5-HCO-H4","5,10-CH+-H4"), 
y = c(2, 5, 9.5, 7, 5, 7.5, 5), label = c(" ", "**", "*", "", "*", "*", " "))

#piechart for rye toast
oat_toast_p1 <- bread_vit_mean %>% filter(Group.1 == "Whole Oat" & Group.2 == "Bread") %>% ggpie("x",  fill = "Group.3", color = "white",palette = "npg") + 
  ggtitle("Bread") + theme(plot.title = element_text(hjust = 0.5)) + 
  theme(legend.position = "right")  + theme_void() + theme(legend.title = element_blank())

oat_toast_p2 <- bread_vit_mean %>% filter(Group.1 == "Whole Oat" & Group.2 == "Bread Digesta") %>% 
  ggpie("x",  fill = "Group.3", color = "white",palette = "npg") + 
  ggtitle("Digesta") + theme(plot.title = element_text(hjust = 0.5)) + 
  theme(legend.position = "right")  + theme_void() + theme(legend.title = element_blank())

oat_toast_pie <- ggarrange(oat_toast_p1, oat_toast_p2, ncol = 1, nrow = 2, 
                           common.legend = TRUE, legend = "right")

oat_toast <- ggarrange(oat_toast_bar, oat_toast_pie, widths = c(2, 1), labels = c("B a) Oat, Toast", "b)"),
                       label.x = -0.1, font.label = list(size = 11))