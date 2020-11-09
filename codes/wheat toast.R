#barplot for rye toast

wwheat_toast_bar <- bread_vit %>% filter(sample == "White Wheat") %>%  ggbarplot(x = "component", y = "folate",
                                                                            fill = "treatment", color = "white", palette = "jco", add.params = list(color = "black"), 
                                                                            add = "mean_sd", title = "", position = position_dodge(0.8), xlab = "", 
                                                                            ylab = "Folate (µg/100g FM)", x.text.angle = 30) + theme(plot.title = element_text(hjust = 0), 
                                                                                                                                     axis.text = element_text(size = 10), legend.position = c(0.8, 1), legend.title = element_blank(), 
                                                                                                                                     legend.text = element_text(size = 10),axis.title.y = element_text(size = 11)) +
  annotate('text',x = c("PGA", "10-HCO-H2", "10-HCO-PGA", "H4", "5-CH3-H4", "5-HCO-H4","5,10-CH+-H4"), 
           y = c(2, 5, 6.5, 5, 1, 4.5, 5), label = c(" ", "*", "**", "", "**", "**", " "))

#piechart for rye toast
wwheat_toast_p1 <- bread_vit_mean %>% filter(Group.1 == "White Wheat" & Group.2 == "Bread") %>% 
  ggpie("x",  fill = "Group.3", color = "white",palette = "npg") + 
  ggtitle("Bread") + theme(plot.title = element_text(hjust = 0.5)) + 
  theme(legend.position = "right")  + theme_void() + theme(legend.title = element_blank())

wwheat_toast_p2 <- bread_vit_mean %>% filter(Group.1 == "White Wheat" & Group.2 == "Bread Digesta") %>% 
  ggpie("x",  fill = "Group.3", color = "white",palette = "npg") + 
  ggtitle("Digesta") + theme(plot.title = element_text(hjust = 0.5)) + 
  theme(legend.position = "right")  + theme_void() + theme(legend.title = element_blank())

wwheat_toast_pie <- ggarrange(wwheat_toast_p1, wwheat_toast_p2, ncol = 1, nrow = 2, 
                           common.legend = TRUE, legend = "right")

wwheat_toast <- ggarrange(wwheat_toast_bar, wwheat_toast_pie, widths = c(2, 1), labels = c("C a) Wheat, Toast", "b)"),
                          label.x = -0.1, font.label = list(size = 11))
