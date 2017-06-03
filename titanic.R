#1 missing Embarked values - replace with "S"
for (i in 1:length(titanic$name)) {
  if (is.na(titanic$embarked[i])) { titanic$embarked[i] = "S" }
}

#2 missing Age values - calculate mean and replace them with mean
mean_age = mean(titanic$age, na.rm = TRUE)
for (i in 1:length(titanic$name)) {
  if (is.na(titanic$age[i])) { titanic$age[i] = mean_age }
}

#3 Lifeboat - if no boat listed, replace null values with "None"
for (i in 1:length(titanic$name)) {
  if (is.na(titanic$boat[i])) { titanic$boat[i] = "None"}
}

#4 Cabin - create separate binary variable representing if cabin # is listed or not.
for (i in 1:length(titanic$name)) {
  ifelse (!is.na(titanic$cabin[i]), titanic$has_cabin_number[i] <- 1, titanic$has_cabin_number[i] <- 0)
}