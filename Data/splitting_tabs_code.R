getwd()
setwd("C:/Users/Frederik Stallaert/Documents/Universiteit/Master/Masterthesis/data")

library(readxl)

read_excel_allsheets <- function(filename) {
  sheets <- readxl::excel_sheets(filename)
  x <-    lapply(sheets, function(X) readxl::read_excel(filename, sheet = X))
  names(x) <- sheets
  x
}

all_sheets <- read_excel_allsheets('fishkind_monthlyresults2016.xls')

sheets <- names(all_sheets)

for (counter in 2:13){
  write.table(all_sheets[[counter]], file= paste(sheets[counter], '.csv', sep='') , sep=',')
}

