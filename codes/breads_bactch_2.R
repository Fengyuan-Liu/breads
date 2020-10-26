#concert the negative number to zero
Extraction_bread <- Extraction %>% mutate(folate = if_else(folate < 0, 0, folate))

#Get the means of all the group
Extraction_bread_mean <- aggregate(Extraction_bread$folate, list(Extraction_bread$weight, Extraction_bread$component, Extraction_bread$treatment), mean) 

#get datasets for each bread type
oat_p <- pancreatin %>% filter(sample == "Oat")
oat_squre <- bread_1 %>% filter(sample == "Germinated Rye Flat")
roll_afteroven <- bread_2 %>% filter(brand == "After Oven")
roll_yeat <- bread_2 %>% filter(brand == "Yeast")
roll_noyeast <- bread_2 %>% filter(brand == "No Yeast")

#create a vector for the component
vitamins <- c('H4', 'PGA', '5,10-CH+-H4', '10-HCO-PGA', '5-CH3-H4', '10-HCO-H2', '5-HCO-H4', "Total")

#t test
data_empty <-data.frame()
for (i in vitamins) {
  data_empty<- filter(wholerye_toast, component == i )
  print(i)
  print(t.test(data_empty$folate ~ data_empty$treatment))
}

#ploting
Extraction_bread %>% ggbarplot(x = "component", y = "folate",fill = "code", color = "white", 
palette = "jco", add.params = list(color = "black"), add = "mean_sd", title = "", 
position = position_dodge(0.8), xlab = "", ylab = "Folate Content (µg/100g FW)", x.text.angle = 30) + theme(plot.title = element_text(hjust = 0.5)
, axis.text = element_text(size = 10), legend.position = c(0, 0.9), legend.title = element_blank(), 
legend.text = element_text(size = 10),axis.title.y = element_text(size = 11)) + annotate("text", 
x = c('PGA', '10-HCO-H2', '10-HCO-PGA', 'H4', '5-CH3-H4', '5-HCO-H4', '5,10-CH+-H4'), y = c(1.8, 5, 7, 2.5, 5.8, 7, 2.5), 
label = c("", "", "**", "", "**", "", "")) 

#extract the total value
bread_2_total <- bread_2 %>% filter(component == "Total") 
bread_1_total <- bread_1 %>% filter(component == "Total") 
legumes_total <- legumes %>% filter(component == "Total") 
laboat_total <- oat_bread %>% filter(component == "Total")

#get the means and sd of total 
ltm <- aggregate(legumes_total$folate, list(legumes_total$main_ingredient, legumes_total$sample), mean) 
ltsd <- aggregate(legumes_total$folate, list(legumes_total$main_ingredient, legumes_total$sample), sd) 

STD %>%  ggbarplot(x = "component", y = "folate",fill = "treatment", color = "white", palette = "jco", add.params = list(color = "black"), 
add = "mean_sd", position = position_dodge(0.6), xlab = "", ylab = "Folate (ng)", x.text.angle = 30) + 
theme(plot.title = element_text(hjust = 0.5), axis.text = element_text(size = 10), legend.position = c(0.85, 0.85), 
legend.title = element_blank(), legend.text = element_text(size = 10),axis.title.y = element_text(size = 11)) + scale_y_continuous(breaks = 2500)

# get the correct order
component_order <- c("Total", 'PGA', '10-HCO-H2', '10-HCO-PGA', 'H4', '5-CH3-H4', '5-HCO-H4', '5,10-CH+-H4')
legend_order <- c("No", "5min Boiling", "Affinity after Boiling", "Oral Digestion", "Gastric Digestion", "Intestinal Digestion", "Extraction after Intistinal Digestion")

STD$component <- factor(STD$component, levels = component_order)
STD$treatment <- factor(STD$treatment, levels = legend_order)
