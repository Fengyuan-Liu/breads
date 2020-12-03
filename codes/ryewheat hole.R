ryewheat_hole_bar <- bread_vit2 %>% filter(sample == "Hole Rye wheat") %>%  ggbarplot(x = "component", y = "folate",
                                                                           fill = "treatment", color = "white", palette = "jco", add.params = list(color = "black"), 
                                                                           add = "mean_sd", title = "", position = position_dodge(0.8), xlab = "", 
                                                                           ylab = "Folate (µg/100g FM)", x.text.angle = 30) + theme(plot.title = element_text(hjust = 0), 
                                                                                                                                    axis.text = element_text(size = 10), legend.position = c(0.8, 1), legend.title = element_blank(), 
                                                                                                                                    legend.text = element_text(size = 10),axis.title.y = element_text(size = 11)) +
  annotate('text',x = c("PGA", "10-HCO-H2", "10-HCO-PGA", "H4", "5-CH3-H4", "5-HCO-H4","5,10-CH+-H4"), 
           y = c(2, 14, 10.5, 3, 1, 4, 2), label = c(" ", " ", "*", "", " ", "**", "*"))

#piechart 
ryewheat_hole_p1 <- bread_vit_mean2 %>% filter(Group.1 == "Hole Rye wheat" & Group.2 == "Bread") %>% 
  ggpie("x",  fill = "Group.3", color = "white",palette = "npg") + 
  ggtitle("Bread") + theme(plot.title = element_text(hjust = 0.5)) + 
  theme(legend.position = "right")  + theme_void() + theme(legend.title = element_blank())

ryewheat_hole_p2 <- bread_vit_mean2 %>% filter(Group.1 == "Hole Rye wheat" & Group.2 == "Bread Digesta") %>% 
  ggpie("x",  fill = "Group.3", color = "white",palette = "npg") + 
  ggtitle("Digesta") + theme(plot.title = element_text(hjust = 0.5)) + 
  theme(legend.position = "right")  + theme_void() + theme(legend.title = element_blank())

ryewheat_hole_pie <- ggarrange(ryewheat_hole_p1, ryewheat_hole_p2, ncol = 1, nrow = 2, 
                          common.legend = TRUE, legend = "right")

ryewheat_hole <- ggarrange(ryewheat_hole_bar, ryewheat_hole_pie, widths = c(2, 1), labels = c("I a) Rye, Roll (added wheat)", "b)"),
                           label.x = -0.1, font.label = list(size = 11))
