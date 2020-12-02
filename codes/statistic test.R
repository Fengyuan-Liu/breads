vitamins <- c('H4', 'PGA', '5,10-CH+-H4', '10-HCO-PGA', '5-CH3-H4', '10-HCO-H2', '5-HCO-H4', "Total")

#t test
data_empty <-data.frame()
for (i in vitamins) {
  data_empty <- laboat %>% filter(sample == "Oat_perttu") %>% filter(component == i)
  print(i)
  print(t.test(data_empty$folate ~ data_empty$treatment))
}

#mean and std
bread1_mean <- aggregate(Breads_batch_1$folate, list(Breads_batch_1$sample, Breads_batch_1$treatment, Breads_batch_1$component), mean)
bread1_std <- aggregate(Breads_batch_1$folate, list(Breads_batch_1$sample, Breads_batch_1$treatment, Breads_batch_1$component), sd)

bread2_mean <- aggregate(Breads_batch_2$folate, list(Breads_batch_2$sample, Breads_batch_2$treatment, Breads_batch_2$component), mean)
bread2_std <- aggregate(Breads_batch_2$folate, list(Breads_batch_2$sample, Breads_batch_2$treatment, Breads_batch_2$component), sd)