corr <- function(directory, threshold=0, id = 1:332){
    
    #initialize output vector
    values <- numeric()
    
    #iterate throught the files
    for(monitor in id){
        
        #clean up id and directory and create path
        path <- paste(directory, "/", sprintf("%03d", monitor), ".csv", sep = "");
        
        #Open the file 
        currentFile <- read.csv(path)
        
        #filter down to complete cases
        complete <- currentFile[complete.cases(currentFile),]
        
        #only act if number of complete cases is above the threshold
        if(dim(complete)[1] > threshold){
            
            #add the correllation to the output vector
            values <- c(values, cor(complete$sulfate, complete$nitrate))
        }
    }
    
    values
}