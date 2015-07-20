library(datasets)
library(ggplot2)
summary(ToothGrowth)
# supp
OJ <- ToothGrowth$len[1:30]
VC <- ToothGrowth$len[31:60]

mOJ <- mean(OJ); mVC <- mean(VC)
sdOJ <- sqrt(var(OJ)); sdVC <- sqrt(var(VC))
nOJ <- length(OJ); nVC <- length(VC)

# T-test for supp
# OJ = VC, unequal variance
#Confidence Interval
df <- (sdOJ^2/nOJ + sdVC^2/nVC)^2/((sdOJ^2/30)^2/(30-1) + (sdVC^2/30)^2/(30-1))
CI <- mOJ - mVC + c(-1,1) * qt(0.975, df) * sqrt(sdOJ^2/nOJ + sdVC^2/nVC)
t.test(OJ, VC, paired = FALSE, var.equal = FALSE)

# dose
mean <- with(ToothGrowth, tapply(len, dose, mean))
var <- with(ToothGrowth, tapply(len, dose, var))
n <- with(ToothGrowth, tapply(len, dose, length))

ToothGrowth2 <- ToothGrowth[order(ToothGrowth$dose), ]
d1 <- ToothGrowth2$len[1:20]; d2 <- ToothGrowth2$len[21:40]; d3 <- ToothGrowth2$len[41:60];
m1 <- as.vector(mean[1]); m2 <- as.vector(mean[2]); m3 <- as.vector(mean[3])
sd1 <- as.vector(sqrt(var[1])); sd2 <- as.vector(sqrt(var[2])); sd3 <- as.vector(sqrt(var[3]));
n1 <- as.vector(n[1]); n2 <- as.vector(n[2]); n3 <- as.vector(n[3]);
# T-test for dose
# dose0.5 = dose1, equal variance
# Confidence Interval
Sp2 <- ((n1-1)*sd1^2 + (n2-1)*sd2^2)/(n1+n2-2)
CI <- m1 - m2 + c(-1,1)*qt(0.975, n1+n2-2)*sqrt(Sp2*(1/n1 + 1/n2))
Dose12 <- subset(ToothGrowth, dose %in% c(0.5,1))
t.test(len ~ dose, paired = FALSE, var.equal = TRUE, data = Dose12)
# dose0.5 = dose2, unequal variance
df <- (sd1^2/n1 + sd3^2/n3)^2/((sd1^2/n1)^2/(n1-1) + (sd3^2/n3)^2/(n3-1))
CI <- m1 - m3 + c(-1,1) * qt(0.975, df) * sqrt(sd1^2/n1 + sd3^2/n3)
Dose13 <- subset(ToothGrowth, dose %in% c(0.5,2))
t.test(len ~ dose, paired = FALSE, var.equal = FALSE, data = Dose13)
# dose1 = dose2, unequal variance
df <- (sd2^2/n2 + sd3^2/n3)^2/((sd2^2/n2)^2/(n2-1) + (sd3^2/n3)^2/(n3-1))
CI <- m2 - m3 + c(-1,1) * qt(0.975, df) * sqrt(sd2^2/n1 + sd3^2/n3)
Dose23 <- subset(ToothGrowth, dose %in% c(1,2))
t.test(len ~ dose, paired = FALSE, var.equal = FALSE, data = Dose23)