#1
refine$company = tolower(refine$company)
refine$company = stringr::str_replace_all(refine$company, "0", "o")
refine$company = gsub(" ", "", refine$company)
refine$company = gsub("phillips", "philips", refine$company)
refine$company = gsub("phllips", "philips", refine$company)
refine$company = gsub("phillps", "philips", refine$company)
refine$company = gsub("phlips", "philips", refine$company)
refine$company = gsub("fillips", "philips", refine$company)
refine$company = gsub("unilver", "unilever", refine$company)

#2
productsplit = strsplit(refine$`Product code / number`, "-")

x = 1
y = 2
product_code = c()
product_number = c()
for (i in 1:length(productsplit)) {
  product_code = c(product_code, unlist(productsplit)[x])
  product_number = c(product_number, unlist(productsplit)[y])
  x = x + 2
  y = y + 2
}

refine$product_code = product_code
refine$product_number = product_number


#3
for (i in 1:length(productsplit)) {
  if (refine$product_code[i] == "p") { refine$category[i] = "Smartphone" }
  if (refine$product_code[i] == "v") { refine$category[i] = "TV" }
  if (refine$product_code[i] == "x") {refine$category[i] = "Laptop" }
  if (refine$product_code[i] == "q") {refine$category[i] = "Tablet" }
}

for (i in 1:length(refine$company)) {
  refine$full_address = paste(refine$address, refine$city, refine$country, " ")  
}



#4
refine$full_address = paste(refine$address, refine$city, refine$country, sep=", ")


#5
for (i in 1:length(refine$company)) {
  ifelse (refine$company[i] == "philips", refine$company_philips[i] <- 1, refine$company_philips[i] <- 0)
  ifelse (refine$company[i] == "akzo", refine$company_akzo[i] <- 1, refine$company_akzo[i] <- 0)
  ifelse (refine$company[i] == "vanhouten", refine$company_van_houten[i] <- 1, refine$company_van_houten[i] <- 0)
  ifelse (refine$company[i] == "unilever", refine$company_unilever[i] <- 1, refine$company_unilever[i] <- 0)
}


