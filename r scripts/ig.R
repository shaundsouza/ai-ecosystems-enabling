# ig.R

B <- function(q){
if(q==0 || q==1)
return (0)
else
return (-(q * log2(q) + (1 - q) * log2(1 - q)))
}

H <- function(q){
x <- unique(q)
#print(x)
h = 0
for (i in 1:length(x)){
p = sum(q==x[i])/length(q)
#print(paste(x[i],p))
h = h + p*log2(p)
}
return (-h)
}

remainder <- function(q,t){
x <- unique(q)
h = 0
for (i in 1:length(x)){
#print(x[i])
pknk = sum(q==x[i])
pk = sum(t[q==x[i]]=="Yes")
p = pknk/length(q) * B(pk/pknk)
#print(paste(pknk,pk,p))
h = h + p
}
return (h)
}

remainderH <- function(q,t){
x <- unique(q)
h = 0
for (i in 1:length(x)){
#print(x[i])
pknk = sum(q==x[i])
#pk = sum(t[q==x[i]]=="Yes")
p = pknk/length(q) * H(t[q==x[i]])
#print(paste(x[i],pknk,p))
h = h + p
}
return (h)
}

gain <- function(q,t){
b <- B(sum(t=="Yes")/length(t))
return (b-remainder(q,t))
}

gainH <- function(q,t){
return (H(t)-remainderH(q,t))
}

dataset <- read.csv("house/train.csv",header=TRUE)
size <- dim(dataset)

dataset[is.na(dataset)]=0

for (i in 1:size[2]) {
for (j in 1:size[2]) {
print(paste(names(dataset)[i],names(dataset)[j],gainH(dataset[,i],dataset[,j])))
}
}



