complete <- function(directory, id = 1:332) {
    
    #initialize storage vectors
    monitors <- numeric()
    nobs <- numeric()
    
    #iterate throught the files
    for(monitor in id){
        
        #clean up id and directory and create path
        path <- paste(directory, "/", sprintf("%03d", monitor), ".csv", sep = "");
        
        #Open the file 
        currentFile <- read.csv(path)
        
        #add values to storage vectors
        monitors <- c(monitors, monitor)
        nobs <- c(nobs, dim(currentFile[complete.cases(currentFile),])[1])
    }
    
    #repurpose id for the data frame
    id <- monitors
    
    #create data frame
    data.frame(id, nobs)
}