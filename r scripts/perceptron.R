# perceptron.R

x <- c(1.5,2,1,3.5,3,4,3,1,2,4,3,2)
x <- matrix(x,nrow=6,ncol=2)
x <- cbind(x,1)

size = dim(x)

y <- c(0,0,0,1,1,1)


x_test <- c(2,3,1,3)
x_test <- matrix(x_test,nrow=2,ncol=2)
x_test <- cbind(x_test,1)

#w <- c(.5,-.1,.2)
w <- rnorm(3)
w_prev <- c(0,0,0)

a = 0.1

for (n in 1:100) {
if (sum(w-w_prev)==0)
break
w_prev = w
for (i in 1:size[1]){
pred <- x[i,]%*%w
print(pred)

if(pred>0) {
pred=1
} else {
pred=0
}

print(pred)

w = w + a * (y[i]-pred)*x[i,]
print(w) 

plot(x[,1],x[,2],xlim=c(-5,5),ylim=c(-5,5))
x1 = -5:5
y1 = (-w[1]*x1-w[3])/w[2]
matlines(x1,y1)
Sys.sleep(.1)
}
}

#w0*x+w1*y+w2 = 0
#
# y=1.4x - .7




