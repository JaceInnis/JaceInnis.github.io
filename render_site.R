#!/usr/bin/env Rscript

options(warn = 1)

output_dir <- "docs"
pages <- c(
  "index.Rmd",
  "aboutme.Rmd",
  "visualizations.Rmd",
  "NewMachineLearningProject.Rmd",
  "DavosSixWeekPrediction.Rmd",
  "DiveLogs.Rmd",
  "Kelphabitatsurvey.Rmd",
  "Oil.Rmd",
  "Rain.Rmd",
  "rancho.Rmd",
  "Sanddollarsizing.Rmd",
  "Santa.Rmd",
  "shark.Rmd",
  "Shellfish.Rmd",
  "drone.Rmd"
)

args <- commandArgs(trailingOnly = TRUE)
dry_run <- "--dry-run" %in% args

if (!requireNamespace("rmarkdown", quietly = TRUE)) {
  stop("The rmarkdown package is required. Install it with install.packages('rmarkdown').")
}

if (!requireNamespace("distill", quietly = TRUE)) {
  stop("The distill package is required. Install it with install.packages('distill').")
}

if (!dir.exists(output_dir)) {
  dir.create(output_dir, recursive = TRUE)
}

if (!nzchar(Sys.getenv("RSTUDIO_PANDOC", unset = ""))) {
  rstudio_pandoc <- file.path(
    Sys.getenv("ProgramFiles", "C:/Program Files"),
    "RStudio",
    "resources",
    "app",
    "bin",
    "quarto",
    "bin",
    "tools"
  )
  if (file.exists(file.path(rstudio_pandoc, "pandoc.exe"))) {
    Sys.setenv(RSTUDIO_PANDOC = rstudio_pandoc)
  }
}

missing_pages <- pages[!file.exists(pages)]
if (length(missing_pages) > 0) {
  stop("Missing source page(s): ", paste(missing_pages, collapse = ", "))
}

if (dry_run) {
  cat("Would render", length(pages), "page(s) to", normalizePath(output_dir), "\n")
  cat(paste0(" - ", pages, "\n"), sep = "")
  quit(status = 0)
}

for (page in pages) {
  message("Rendering ", page)
  rmarkdown::render(
    input = page,
    output_dir = output_dir,
    envir = new.env(parent = globalenv())
  )
}

message("Rendered ", length(pages), " page(s) to ", normalizePath(output_dir))