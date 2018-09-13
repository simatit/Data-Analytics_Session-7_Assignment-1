# 1. Histogram for all variables in a dataset mtcars. Write a program to create histograms 
# for all columns.
library(tidyr)
library(ggplot2)
mtcars %>% gather() %>% head()
ggplot(gather(mtcars), aes(value)) +
  geom_histogram(bins = 10) +
  facet_wrap(~key, scales = 'free_x')

# 2. Check the probability distribution of all variables in mtcars.
plots<- list()
cars<- rownames(mtcars)
columnName<- colnames(mtcars)
par(mfrow = c(3,4))
for(i in 1:ncol(mtcars))
  local({
    i <- i
    tempVect <-  mtcars[,i]
    names(tempVect) <- cars
    p1<- ggplot(mtcars,aes(x = mtcars[,i]))+geom_density(fill='lightblue')
    plots[[i]] <<- p1
    p1
  })

# 3. Write a program to create boxplot for all variables.
boxplot(mtcars$mpg, mtcars$cyl, mtcars$disp, mtcars$hp, mtcars$drat, mtcars$wt, mtcars$qsec, 
        mtcars$vs, mtcars$am, mtcars$gear, mtcars$carb, 
        main = "multiple boxplot", at = c(1,2,3,4,5,6,7,8,9,10,11), 
        names = c("mpg","cyl","disp","hp","drat","wt","qsec","vs","am","gear","carb"), 
        col = heat.colors(5),horizontal = FALSE,notch = TRUE)

