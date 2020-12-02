#change the leged order
legend_ord <- c("No", "5min Boiling", "Affinity after Boiling", "Oral Digestion","Gastric Digestion",
                "Intestinal Digestion", "Extraction after Intistinal Digestion")
STD$treatment <- factor(STD$treatment, levels = legend_ord)

#change the oreder of x-axid
x_ord <- c ("Total", "PGA", "10-HCO-H2", "10-HCO-PGA", "H4", "5-CH3-H4", "5-HCO-H4", "5,10-CH+-H4")
STD$component <- factor(STD$component, levels = x_ord)


STD %>% ggbarplot(x = "component", y = "folate",fill = "treatment", color = "white", palette = "jco",
add.params = list(color = "black"), add = "mean_sd", title = "", 
position = position_dodge(0.8), xlab = "", ylab = "Folate (ng)", x.text.angle = 30) + 
theme(plot.title = element_text(hjust = 0.5),axis.text = element_text(size = 12), 
legend.position = c(0.83,0.9), legend.title = element_blank(),legend.text = element_text(size = 12),
axis.title.y = element_text(size = 12)) + annotate('text',x = c("Total", "PGA", "10-HCO-H2", "10-HCO-PGA", "H4", "5-CH3-H4", "5-HCO-H4","5,10-CH+-H4"), 
y = c(8000, 1000, 3500, 1250, 1250, 1250, 1350, 1800), 
label = c(" a a a a  b b b", " a a a a a a a", " a a a a b c c", " a a a a a a a", "a b c d        ", " a a b b b c d", " a a b b c d d", " a a b b c d d"))


# SUBSET GROUP

data_empty <-data.frame()
for (i in x_ord) {
  data_empty <- STD %>% filter(component == i)
  print(i)
  oneway_aov <- aov(data_empty$folate ~ data_empty$treatment)
  print(TukeyHSD(oneway_aov))
}

H4 <- STD %>% filter(component == "H4") %>% filter(folate != 0)
aov_h4 <- aov(H4$folate ~ H4$treatment)
TukeyHSD(aov_h4)
