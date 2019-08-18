# nnet.R

sigmoid <- function(x){
	return (1/(1+exp(-x)))
}

diff_sigmoid <- function(t){
	return (t*(1-t))
}

od <- function(t,y){
	return (diff_sigmoid(t)*(y-t))
}

nn_error <- function(x,w1,w2,y){
	h <- sigmoid(x%*%w1)
	t <- sigmoid(h%*%w2)
	return (sum((y-t)^2))
}

#x <- c(10,30,20)
x <- c(1.5,2,1,3.5,3,4,3,1,2,4,3,2)
x <- matrix(x,ncol=2)
x <- cbind(x,1)
size_x = dim(x)

#y <- c(1,0)
y <- c(0,0,0,1,1,1)
y <- matrix(y,ncol=1)
size_y = dim(y)

size_h = 2

#w11 <- c(.2,-.1,.4)
#w12 <- c(.7,-1.2,1.2)
#w1 <- cbind(w11,w12)

w1 <- rnorm(size_x[2]*size_h)
w1 <- matrix(w1,nrow=size_x[2],ncol=size_h)

#w21 <- c(1.1,.1)
#w22 <- c(3.1,1.17)
#w2 <- cbind(w21,w22)

w2 <- rnorm(size_h*size_y[2])
w2 <- matrix(w2,nrow=size_h,ncol=size_y[2])

err_prev <- 100
print(x)
print(w1)
print(w2)

for (n in 1:10000) {

err <- nn_error(x,w1,w2,y)
print(paste(n,err))
if (err>err_prev)
break

err_prev = err

for (i in 1:size_x[1]){

h <- sigmoid(x[i,]%*%w1)
t <- sigmoid(h%*%w2)

d_o <- od(t,y[i,])

backp <- d_o%*%t(w2)

d_h <- h*(1-h)*backp

a=0.3

for (j in 1:size_x[2]){
d_w1 <- a * x[i,j] * d_h
w1[j,] <- w1[j,] + d_w1
}

for (j in 1:size_h){
d_w2 <- a * h[j] * d_o
w2[j,] <- w2[j,] + d_w2
}
}
}

h <- sigmoid(x%*%w1)
t <- sigmoid(h%*%w2)
w1
w2
t



