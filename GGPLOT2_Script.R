qqplot(dd$price)
library(ggplot2)
ggplot(mpg, aes(x=displ, y=hwy))+
  geom_point(aes(colour = class))
mpg
colnames(mpg)
ggplot(mpg)+
  geom_point(aes(x=displ, y=hwy))
ggplot(data=mpg)
nrow(mpg)
ncol(mpg)
ggplot(mpg)+
geom_point(mapping = aes(x=displ, y=hwy), color = "blue")
ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ, y= hwy, color="blue"))
?glimpse
tibble::glimpse(mpg)
# the below syntax is used to split the variables based on data types and also provides count

split(names(mpg),sapply(mpg, function(x) paste(class(x), collapse="")))

#Split, Sapply

ggplot(mpg)+
  geom_point(mapping=aes(x=displ, y=hwy, color= displ < 5))
ggplot(data=mpg)+
  geom_point(mapping=aes(x=displ, y=hwy))+
  facet_wrap(~class,nrow=1)
ggplot(mpg)+
geom_point(mapping=aes(x=displ, y=hwy))+
  facet_grid(drv~.)
ggplot(mpg)+
  geom_point(mapping=aes(x=displ, y=hwy))+
  facet_wrap(~cty, nrow = 4)

ggplot(data=mpg)+
  geom_smooth(mapping=aes(x=displ,y=hwy,linetype=drv,color=drv))+
  geom_point(mapping=aes(x=displ,y=hwy,color=drv))

ggplot(data=mpg)+
  geom_smooth(mapping = aes(x=displ, y=hwy, group=drv))

ggplot(data=mpg, mapping = aes(x=displ, y=hwy))+
  geom_point(mapping = aes(color = class))+
  geom_smooth(data = filter(mpg, class == "subcompact"), se=FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy))+
       geom_point(mapping=aes(color=drv))+ 
       geom_smooth(mapping=aes(linetype = drv),se=FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy))+
  geom_point(mapping=aes(color=drv))+ 
  geom_smooth(se=FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy))+
  geom_point(mapping=aes(color=drv))
  
??stringr
