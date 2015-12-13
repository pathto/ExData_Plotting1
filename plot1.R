df_file = '/Users/tianyixu/Documents/coursera/R Programming/Exploratory_data_analysis/household_power_consumption.txt'
df <- read.table(df_file, header = TRUE, sep = ';', as.is = TRUE)

sub_df <- subset(df, Date == '1/2/2007' | Date == '2/2/2007')
sub_df[, 'Global_active_power'] <- as.numeric(sub_df[, 'Global_active_power'])

png('plot1.png')
hist(sub_df[,'Global_active_power'], col = 'red', 
     xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power')
dev.off()