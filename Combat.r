BiocManager::install("sva")

library(sva)
cdata <- read.xlsx("差异蛋白筛选结果.xlsx", sheet = "可信蛋白")
csif <- read.xlsx("sif.xlsx")#读取批次信息

modcombat = model.matrix(~1, data = csif)
batch = csif$batch
combat_edata = ComBat(dat=cdata[,-1:-3], batch=batch, mod=modcombat,par.prior=TRUE, prior.plots=FALSE)
#去除批次效应
write.table(combat_edata, "ComBat_data(all)(counts).txt", sep = "\t", quote = F,row.names = F)






