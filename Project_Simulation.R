library(ggplot2)
mns <- NULL
for (i in 1:1000) mns <- c(mns, mean(rexp(40, rate = 0.2)))
hist(mns, xlim = c(2,8), main = "Results of one thousand simulations", xlab = "x", ylab = "Count")
abline(v = mean(mns), lwd = 3)
x <- seq(2, 8, length = 1000)
y <- dnorm(x, mean = 5, sd = 5/sqrt(40))
par(new = T)
plot(x, y, type = "l", lwd = 3, xaxt = "n", yaxt = "n", xlab = "", ylab = "", col = "blue")
axis(4, col = "blue", col.axis = "blue")
abline(v = mean(mns), col = "blue", lwd = 3)
legend("topright", pch = 20, col = c("black", "blue"), c("Simulations", "Normal distribution"), cex = 0.7)

hist(mns, xlim = c(2,8))
x <- seq(2, 8, length = 1000)
y <- dnorm(x, mean = 5, sd = 5/sqrt(40))
par(new = T)
plot(x, y, type = "l", xaxt = "n", yaxt = "n", 
     xlab = "", ylab = "", col = "red")
axis(4, col = "red", col.axis = "red")
ssd <- 5 + c(-1, 1) * sqrt(var(mns))
abline(v = ssd)
tsd <- 5 + c(-1, 1) * sqrt(5^2/40)
abline(v = tsd, col = "red")
legend("topright", pch = 20, col = c("black", "red"), 
       c("Simulations", "Normal distribution"), cex = 0.65)

meanmns <- NULL
varmns <- NULL
for (i in 1:1000) {
        mns <- c(mns, mean(rexp(40, rate = 0.2)))
        meanmns <- c(meanmns, mean(mns))
        varmns <- c(varmns, var(mns))
}
g1 <- ggplot(data.frame(x = 1:1000, y = meanmns), aes(x=x, y=y))
g1 <- g1 + geom_hline(yintercept = 5.0) + geom_line(size = 2)
g1 <- g1 + labs(x = "Number of observations", y = "Cumulative mean")
g1

g2 <- ggplot(data.frame(x = 2:1000, y = varmns[2:1000]), aes(x=x, y=y)) # Omit the first y value since it is NA
g2 <- g2 + geom_hline(yintercept = 5^2/40) + geom_line(size = 2)
g2 <- g2 + labs(x = "Number of observations", y = "Cumulative variance")
g2