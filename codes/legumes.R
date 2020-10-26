extraction <- extraction %>% mutate(folate = if_else(folate < 0, 0, folate))

#Get the means of all the group
mix_mean <- aggregate(STD$folate, list(STD$treatment, STD$component), mean) 
mix_std <- aggregate(STD$folate, list(STD$treatment, STD$component),sd)

#get datasets for each bread type
faba_e <- extraction %>% filter(main_ingredient == "Faba Bean")
roll_ryewheat <- bread_2 %>% filter(brand == "With Wheat")
roll_afteroven <- bread_2 %>% filter(brand == "After Oven")
roll_yeat <- bread_2 %>% filter(brand == "Yeast")
roll_noyeast <- bread_2 %>% filter(brand == "No Yeast")

#create a vector for the component
vitamins <- c('H4', 'PGA', '5,10-CH+-H4', '10-HCO-PGA', '5-CH3-H4', '10-HCO-H2', '5-HCO-H4', "Total")

#t test
data_empty <-data.frame()
for (i in vitamins) {
  data_empty<- filter(faba_e, component == i )
  print(i)
  print(t.test(data_empty$folate ~ data_empty$treatment))
}

#ploting
faba_e_bar <- faba_e %>% ggbarplot(x = "component", y = "folate",fill = "treatment", color = "white", 
palette = "jco", add.params = list(color = "black"), add = "mean_sd", title = "Faba Bean", 
position = position_dodge(0.8), xlab = "", ylab = "Folate (µg/100g FM)", x.text.angle = 30) + theme(plot.title = element_text(hjust = 0.5)
, axis.text = element_text(size = 10), legend.position = c(0.02, 1), legend.title = element_blank(),
legend.text = element_text(size = 10),axis.title.y = element_text(size = 11)) + annotate("text", 
x = c('PGA', '10-HCO-H2', '10-HCO-PGA', 'H4', '5-CH3-H4', '5-HCO-H4', '5,10-CH+-H4', "Total"), y = c(10, 4, 8, 9, 4, 30, 4, 110), 
label = c("**", "", "", "", "", "**", "", "*")) 

