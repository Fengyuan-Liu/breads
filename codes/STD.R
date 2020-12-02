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
theme(plot.title = element_text(hjust = 0.5),axis.text = element_text(size = 10), 
legend.position = c(0.83,0.9), legend.title = element_blank(),legend.text = element_text(size = 10),
axis.title.y = element_text(size = 11))

# SUBSET GROUP