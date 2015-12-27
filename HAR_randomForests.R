data(vowel.train)
data(vowel.test) 
library(ggplot2);
names(vowel.train)
str(vowel.train)
str(vowel.test)
summary(vowel.train)
table(vowel.train$y)
vowel.train$y<-as.factor(vowel.train$y)
vowel.test$y<-as.factor(vowel.test$y)
library(caret)
training<-vowel.train
testing<-vowel.test
dim(testing);dim(training);
qplot(x.1,x.2,colour=y, data=training)
modFit<-train(y ~. ,method="rf", data=training,prox=T)
print(modFit)
getTree(modFit$finalModel,k=2)

pred<-predict(modFit,testing)
testing$predRight<-pred==testing$Species
table(pred,testing$Species)
qplot(Petal.Width,Sepal.Width,colour=predRight, data=testing)
