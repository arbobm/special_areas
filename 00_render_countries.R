

# packages ----------------------------------------------------------------

# load packages

library(readr)
library(stringr)


# countries list ----------------------------------------------------------

countries_list <- c(
  'Argentina',
  'Philippines',
  # 'Indonesia',
  'Cambodia',
  'Bangladesh',
  'Kyrgyzstan',
  'Kazakhstan',
  'Turkmenistan',
  'Ecuador'
) |> 
  sort()


# read template -----------------------------------------------------------

input  <- "template.qmd"            # your source .qmd

# create chapters for each country ----------------------------------------
## >>>> can I make this loop work in parallel? <<<<<<<<<
for (i in 1:length(countries_list)) {
  
  country <- countries_list[i]
  message(country)
  
  # Paths
  output <- paste0('countries_qmd/', str_to_lower(country), ".qmd")   # new file to write
  
  # Read as text (lines)
  lines <- read_file(input)
  
  # Replace: "windfarm" -> "wind farm" everywhere (case-sensitive)
  # Use gsub for global replacement
  lines_new <- gsub("'country_i'", country, lines)
  lines_new <- gsub("country_i", paste0("'", country, "'"), lines_new)
  
  # Write
  write_file(lines_new, output)
  
}


# final tasks -------------------------------------------------------------

# check if all countries are in _quarto.yml chapters

# render doc with chapters



# quarto::quarto_render(output_format = 'html')

# find . -size +100M -printf '%P\n' >> .gitignore
