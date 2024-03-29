data<-read.csv('student.csv')
label<-c("Understanding","Analyze","Remember","Apply")
count<-0
for(count in 0:4)
{
  start<-(3*count+1)
  end<-(3*count+3)
  std<-data[start:end,3:6]
  co1<-cbind(as.integer(cbind(std[1,])))
  co2<-cbind(as.integer(cbind(std[2,])))
  co3<-cbind(as.integer(cbind(std[3,])))
  pct1 <- round(co1/sum(co1)*100)
  label1 <- paste(label, pct1)
  label2 <- paste(label1,"%",sep="")
  pie(co1,label2,main="Co1 student mask",col=rainbow(length(label)))
  pct2 <- round(co2/sum(co2)*100)
  label3 <- paste(label, pct2)
  label4 <- paste(label3,"%",sep="")
  pie(co2,label4,main="Co2 student mask",col=rainbow(length(label)))
  pct3 <- round(co3/sum(co3)*100)
  label5 <- paste(label, pct3)
  label6 <- paste(label5,"%",sep="")
  pie(co3,label6,main="Co3 student mask",col=rainbow(length(label)))
  final<-cbind(mean(as.integer(std[1:3,1])),mean(as.integer(std[1:3,2])),mean(as.integer(std[1:3,3])),mean(as.integer(std[1:3,4])))
  pct4 <- round(final/sum(final)*100)
  label7 <- paste(label, pct4)
  label8 <- paste(label7,"%",sep="")
  pie(final,label8,main="final student mask",col=rainbow(length(label)))
}
total<-c(min(as.integer(data[,3])),min(as.integer(data[,4])),min(as.integer(data[,5])),min(as.integer(data[,6])))
barplot(total,names.arg=label,xlab="Bloom knowledge",ylab="score",col="Green",
        main="Overall chart",border="red")
new_data<-t(rbind(c(mean(as.integer(data[1,3:6]))),c(as.integer(data[4,3:6])),c(as.integer(data[7,3:6])),c(as.integer(data[10,3:6])),c(as.integer(data[14,3:6]))))
colors = c("green","blue","yellow","red")
students<- c("harsh","shubham","shivam","parth","vipul")
barplot(new_data, main = "final chart", names.arg = students, xlab = "Students", ylab = "score", col = colors)
legend("topleft", label, cex = .5, fill = colors)

