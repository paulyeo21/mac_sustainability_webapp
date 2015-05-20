trash_data <- read.csv("~/Google Drive/MAC_Sustainability/Master-5-11-15.csv")
dates <- trash_data$Months.Materials
values <- trash_data[,-1]
timeseries_trash_data <- ts(values, start=c(2006, 9), frequency=12)
xts_trash_data <- as.xts(timeseries_trash_data)
# xts_trash_data <- as.xts(values, order.by = as.Date(dates, "%Y%m%d"))

# Only diversion rate
diversionValues <- trash_data$Diversion.Rate..includes.food.scraps * 100
timeseries_diversion_data <- ts(diversionValues, start=c(2006,9), frequency=12)
# dygraph(timeseries_diversion_data, main="Macalester College Trash Diversion Rate") %>%
#   dyAxis("y", label = "Diversion Rate (%)") %>%
#   dyOptions(axisLineWidth = 3, fillGraph = TRUE) %>%
#   dyLegend(show = "always", hideOnMouseOut = FALSE) %>%
#   dySeries("V1", label = "Diversion %")

# Only Recycling, Compost, Pig Food
othersValues <- trash_data[,c(2,3,4,5,6,12)]
timeseries_others_data <- ts(othersValues, start=c(2006, 9), frequency=12)
# dygraph(timeseries_others_data, main="Macalester College Trash Composition") %>%
#   dyOptions(colors = RColorBrewer::brewer.pal(5, "Set1")) %>%
#   dyAxis("y", label = "Pounds (lb)") %>%
#   dyHighlight(highlightSeriesOpts = list(strokeWidth = 1), 
#               highlightCircleSize = 5, 
#               highlightSeriesBackgroundAlpha = 0.3, 
#               hideOnMouseOut = FALSE) %>%
#   dyLegend(width = 950)

plotDict <- vector(mode="list", length=2)
names(plotDict) <- c("Diversion Rate", "Waste Types")
plotDict[[2]] <-     dygraph(timeseries_others_data, main="Macalester College Waste Types") %>%
     dyOptions(colors = RColorBrewer::brewer.pal(5, "Set1")) %>%
     dyAxis("y", label = "Pounds (lb)") %>%
     dyHighlight(highlightSeriesOpts = list(strokeWidth = 1), 
                highlightCircleSize = 5, 
                highlightSeriesBackgroundAlpha = 0.3, 
                hideOnMouseOut = FALSE)
plotDict[[1]] <-     dygraph(timeseries_diversion_data, main="Macalester College Trash Diversion Rate") %>%
     dyAxis("y", label = "Diversion Rate (%)") %>%
     dyOptions(axisLineWidth = 3, fillGraph = TRUE) %>%
     #   dyLegend(show = "always", hideOnMouseOut = FALSE) %>%
     dySeries("V1", label = "Diversion %")

