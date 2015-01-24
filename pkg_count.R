pkg_count <- function(date) {
  year <- as.POSIXlt(date)$year + 1900
  urls <- paste0('http://192.168.56.101/cran-log/', year, '/', date, '.csv.gz')
  download.file(urls, destfile = sprintf("%s.csv.gz", date))
  data <- read.table(sprintf("%s.csv.gz", date), header = TRUE, sep = ",")
  sort(table(data$package), decreasing = TRUE)
}