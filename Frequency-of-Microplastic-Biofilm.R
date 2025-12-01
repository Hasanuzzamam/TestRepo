> library(tidyverse)
#Read the CSV with Correct Column Names

> biofilm_cols <- c("Microplastics", "Composition_of_Biofilms", "Size", "Study_Area_Condition",                    +                   "Methods", "Incubation_Period", "Reference")
> biofilm <- read_csv("D:/Microplastic pollution for research/Microplastic-file/biofilm.csv", col_names =    biofilm_cols, skip = 1)

#Clean and Split Microplastics

> microplastics <- biofilm %>%
  +   select(Microplastics) %>%
  +   mutate(Microplastics = str_split(Microplastics, ",")) %>%
  +   unnest(Microplastics) %>%
  +   mutate(Microplastics = str_trim(Microplastics)) %>%
  +   filter(!is.na(Microplastics), Microplastics != "")

#Plot the Histogram

> microplastics %>%
  +     count(Microplastics) %>%
  +     ggplot(aes(x = Microplastics, y = n)) +
  +     geom_bar(stat = "identity", fill = "steelblue") +
  +     labs(title = "Frequency of Microplastic Types in Biofilm Dataset",
             +          x = "Microplastic Type",
             +          y = "Count") +
  +     theme_minimal() +
  +     theme(axis.text.x = element_text(angle = 45, hjust = 1))

  
  
  
  
  
  