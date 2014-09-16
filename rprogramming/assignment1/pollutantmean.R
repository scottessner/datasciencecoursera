pollutantmean <- function(directory, pollutant, id = 1:332) {
    
    values <- numeric()
    
    #iterate throught the files g
    for(monitor in id){
        
        #clean up id and directory and create path
        path <- paste(directory, "/", sprintf("%03d", monitor), ".csv", sep = "");
        
        #Open the file 
        currentFile <- read.csv(path)

        #Append the values from this file into the stored variable
        values <- c(values, t(currentFile[pollutant]))
    }
    
    #Compute the mean without the NA values
    mean(values, na.rm = TRUE)
}