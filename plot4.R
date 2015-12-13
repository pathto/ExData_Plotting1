df_file = '/Users/tianyixu/Documents/coursera/R Programming/Exploratory_data_analysis/household_power_consumption.txt'
df <- read.table(df_file, header = TRUE, sep = ';', as.is = TRUE)

sub_df <- subset(df, Date == '1/2/2007' | Date == '2/2/2007')
sub_df[, 'Global_active_power'] <- as.numeric(sub_df[, 'Global_active_power'])
times <- strptime(paste(sub_df[,1], sub_df[,2]), '%d/%m/%Y %H:%M:%S')

png('plot4.png')
par(mfrow = c(2,2))

plot(times, sub_df[,'Global_active_power'],
     xlab='', ylab = 'Global Active Power', type = 'n')
lines(times, sub_df[,'Global_active_power'])

plot(times, sub_df[,5],
     xlab='datetime', ylab = 'Voltage', type = 'n')
lines(times, sub_df[,5])

plot(times, sub_df[,7],
     xlab='', ylab = 'Energy sub metering', type = 'n')
lines(times, sub_df[,7], col = 'black')
lines(times, sub_df[,8], col = 'red')
lines(times, sub_df[,9], col = 'blue')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
       lty = c(1,1,1), col = c('black', 'red', 'blue'), bty = 'n')

plot(times, sub_df[,4],
     xlab='datetime', ylab = 'Global_reactive_power', type = 'n')
lines(times, sub_df[,4])

dev.off()
