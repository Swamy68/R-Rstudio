library(readxl)
#Reading data
prsm <- read_excel("D:/Python_DataScience/Data_Sets/Loan Data Sets/prsm_cleaned.xlsx")
str(prsm)
View(prsm)
prsm$Commision_pc <- prsm$Commission.Upfront/prsm$Total.Amt.to.be.Repaid
prsm$Annual_Payroll_to_Empolyment <- prsm$Annual.Payroll.in.Zip.Code/prsm$Employment.in.Zip.Code
prsm$Currnt_Previous_Dlnqnt_Lines <- prsm$Current.Delinquent.Credit.Lines+prsm$Previous.Delinquent.Credit.Lines
prsm$log_Avg_House_Value <- log(prsm$Average.House.Value.in.Zip.Code)
prsm$log_Nominal_Amnt <- log(prsm$Nominal.Loan.Amount)
prsm$log_Total_Amnt <- log(prsm$Total.Amt.to.be.Repaid)
model <- lm(PRSM~.-CaseNumber,data = prsm )
summary(model)
colnames(prsm)
prsm_1 <- prsm[c(2,9,10,13,25,27,28,29,30)]
str(prsm_1)
colnames(prsm_1)
model1 <- lm(PRSM~.,data = prsm_1)
summary(model1)


model1 <- lm(PRSM~.-CaseNumber -Total.Amt.to.be.Repaid -Nominal.Loan.Amount -Repayment.Percentage
                      -Validated.Monthly.Batch -Historical.Monthly.Credit.Card.Receipts
                      -Years.In.Business -Num.of.Credit.Lines -Num.of.Paid.off.Credit.Lines
                      -Previous.Delinquent.Credit.Lines -Business.Entity.Type -Num.of.Derog.Legal.Item
                      -Population.in.Zip.Code -Median.Age.in.Zip.Code -Bus.Establishments.in.Zip.Code
                      -Loan.Size.Class, data = prsm)
summary(model1)
model2 <- lm(PRSM~.-CaseNumber -Total.Amt.to.be.Repaid -Nominal.Loan.Amount -Repayment.Percentage
             -Validated.Monthly.Batch -Historical.Monthly.Credit.Card.Receipts
             -Years.In.Business -Num.of.Credit.Lines -Num.of.Paid.off.Credit.Lines
             -Previous.Delinquent.Credit.Lines -Business.Entity.Type -Num.of.Derog.Legal.Item
             -Population.in.Zip.Code -Median.Age.in.Zip.Code -Bus.Establishments.in.Zip.Code
             -Loan.Size.Class -Commission.Upfront -Annual.Payroll.in.Zip.Code, data = prsm)
summary(model2)
model3 <- lm(PRSM~.-CaseNumber -Total.Amt.to.be.Repaid -Nominal.Loan.Amount -Repayment.Percentage
             -Validated.Monthly.Batch -Historical.Monthly.Credit.Card.Receipts
             -Years.In.Business -Num.of.Credit.Lines -Num.of.Paid.off.Credit.Lines
             -Previous.Delinquent.Credit.Lines -Business.Entity.Type -Num.of.Derog.Legal.Item
             -Population.in.Zip.Code -Median.Age.in.Zip.Code -Bus.Establishments.in.Zip.Code
             -Loan.Size.Class -Commission.Upfront -Annual.Payroll.in.Zip.Code
             -Employment.in.Zip.Code, data = prsm)
summary(model3)
predicted <- predict(model3, prsm)
str(predicted)
RMSE(prsm$PRSM,predicted)
library("caret")
library(lattice)
library(ggplot2)
