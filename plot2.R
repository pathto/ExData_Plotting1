df_file = '/Users/tianyixu/Documents/coursera/R Programming/Exploratory_data_analysis/household_power_consumption.txt'
df <- read.table(df_file, header = TRUE, sep = ';', as.is = TRUE)

sub_df <- subset(df, Date == '1/2/2007' | Date == '2/2/2007')
sub_df[, 'Global_active_power'] <- as.numeric(sub_df[, 'Global_active_power'])
times <- strptime(paste(sub_df[,1], sub_df[,2]), '%d/%m/%Y %H:%M:%S')

png('plot2.png')
plot(times, sub_df[,'Global_active_power'],
     xlab='', ylab = 'Global Active Power (kilowatts)', type = 'n')
lines(times, sub_df[,'Global_active_power'])
dev.off()