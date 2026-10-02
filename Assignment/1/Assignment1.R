#==========================================================
# AIR QUALITY DATA CLEANING USING R
# Beijing Multi-Site Air Quality Dataset
#==========================================================

# Install packages (Run once)
install.packages("ggplot2")

library(ggplot2)

#==========================================================
# Task 1 : Import and Inspect Dataset
#==========================================================

file_name <- "~/Documents/R Programming/Assignment/1/beijing+multi+site+air+quality+data/PRSA_Data_20130301-20170228/PRSA_Data_Aotizhongxin_20130301-20170228.csv"

air_data <- tryCatch(
  {
    read.csv(file_name)
  },
  error=function(e){
    stop(paste("Error:",e$message))
  })

cat("First Six Records\n")
head(air_data)

cat("\nStructure\n")
str(air_data)

cat("\nRows:",nrow(air_data),"\n")
cat("Columns:",ncol(air_data),"\n")

cat("\nContains Missing Values:",
    any(is.na(air_data)),"\n")

cat("Total Missing Values:",
    sum(is.na(air_data)),"\n")

#==========================================================
# Task 2 : Difference between NA, NULL and NaN
#==========================================================

temperature <- c(28,30,NA,32)
missing_object <- NULL
undefined_value <- 0/0

print(is.na(temperature))
print(is.null(missing_object))
print(is.nan(undefined_value))

#==========================================================
# Task 3 : Missing Summary Function
#==========================================================

missing_summary <- function(df, vars){
  
  result <- data.frame(
    Variable=character(),
    Total_Records=integer(),
    Missing_Values=integer(),
    Missing_Percentage=double()
  )
  
  for(v in vars){
    
    if(v %in% names(df)){
      
      total <- nrow(df)
      miss <- sum(is.na(df[[v]]))
      percent <- round((miss/total)*100,2)
      
      result <- rbind(result,
                      data.frame(
                        Variable=v,
                        Total_Records=total,
                        Missing_Values=miss,
                        Missing_Percentage=percent
                      ))
      
      if(percent>20){
        warning(paste(v,"contains more than 20% missing values"))
      }
      
    }
    
  }
  
  return(result)
  
}

selected_vars <- c("PM2.5","PM10","SO2","NO2","TEMP","WSPM","wd")

summary_before <- missing_summary(air_data,selected_vars)

print(summary_before)

#==========================================================
# Task 4 : Pollution Ratio
#==========================================================

air_data$pollution_ratio <- air_data$PM2.5 / air_data$PM10

cat("NA :",sum(is.na(air_data$pollution_ratio)),"\n")
cat("NaN :",sum(is.nan(air_data$pollution_ratio)),"\n")
cat("Infinite :",sum(is.infinite(air_data$pollution_ratio)),"\n")

air_data$pollution_ratio[
  is.nan(air_data$pollution_ratio) |
    is.infinite(air_data$pollution_ratio)
] <- NA

#==========================================================
# Task 5 : Replace Numerical Missing Values
#==========================================================

numeric_variables <- c("PM2.5","PM10","SO2","NO2","TEMP","WSPM")

before_missing <- c()

for(v in numeric_variables){
  
  if(v %in% names(air_data)){
    
    before <- sum(is.na(air_data[[v]]))
    before_missing <- c(before_missing,before)
    
    med <- median(air_data[[v]],na.rm=TRUE)
    
    air_data[[v]][is.na(air_data[[v]])] <- med
    
    after <- sum(is.na(air_data[[v]]))
    
    cat("\nVariable :",v,"\n")
    cat("Missing Before :",before,"\n")
    cat("Median :",med,"\n")
    cat("Missing After :",after,"\n")
    
  }
  
}

#==========================================================
# Task 6 : Handle Missing Categorical Values
#==========================================================

calculate_mode <- function(x){
  
  x <- x[!is.na(x)]
  
  uniq <- unique(x)
  
  uniq[which.max(tabulate(match(x,uniq)))]
  
}

before_wd <- sum(is.na(air_data$wd))

mode_wd <- calculate_mode(air_data$wd)

air_data$wd[is.na(air_data$wd)] <- mode_wd

after_wd <- sum(is.na(air_data$wd))

cat("\nWind Direction Mode :",mode_wd,"\n")
cat("Before :",before_wd,"\n")
cat("After :",after_wd,"\n")

#==========================================================
# Task 7 : Error Handling Function
#==========================================================

clean_variable <- function(df,var){
  
  tryCatch({
    
    if(!(var %in% names(df)))
      stop("Variable does not exist")
    
    if(!is.numeric(df[[var]]))
      stop("Variable is not numeric")
    
    if(all(is.na(df[[var]])))
      stop("Variable contains only missing values")
    
    med <- median(df[[var]],na.rm=TRUE)
    
    if(is.na(med))
      stop("Median cannot be calculated")
    
    df[[var]][is.na(df[[var]])] <- med
    
    return(df[[var]])
    
  },
  
  error=function(e){
    
    message(e$message)
    
    return(NULL)
    
  })
  
}

clean_variable(air_data,"PM2.5")

#==========================================================
# Task 8 : Comparison Table
#==========================================================

summary_after <- missing_summary(air_data,selected_vars)

comparison <- data.frame(
  
  Variable=summary_before$Variable,
  
  Missing_Before=summary_before$Missing_Values,
  
  Missing_After=summary_after$Missing_Values
  
)

comparison$Values_Replaced <-
  comparison$Missing_Before -
  comparison$Missing_After

print(comparison)

#==========================================================
# Task 9 : Visualization
#==========================================================

plot_data <- data.frame(
  
  Variable=rep(comparison$Variable,2),
  
  Missing=c(comparison$Missing_Before,
            comparison$Missing_After),
  
  Status=rep(c("Before","After"),
             each=nrow(comparison))
  
)

ggplot(plot_data,
       aes(x=Variable,
           y=Missing,
           fill=Status))+
  
  geom_bar(stat="identity",
           position="dodge")+
  
  ggtitle("Missing Values Before and After Cleaning")+
  
  xlab("Variables")+
  
  ylab("Missing Values")

#==========================================================
# Task 10 : Export Dataset
#==========================================================

write.csv(
  air_data,
  "cleaned_air_quality_data.csv",
  row.names=FALSE
)

cat("\nDataset exported successfully.\n")