# Live rgl demo for the CD4 semiparametric covariance surface.
#
# Run this in RStudio, for example:
#
#   source("cd4_rgl_live_demo.R")
#
# The final plot call uses spcovar's native rgl plotting route and should open
# an interactive rgl widget in the Viewer pane.

# spcovar is installed from GitHub until it is available on CRAN.  The
# remotes package is the lightweight installer route; devtools also works but
# installs a broader development toolkit than is needed for this demo.

if (!requireNamespace("spcovar", quietly = TRUE)) {
  if (!requireNamespace("remotes", quietly = TRUE)) {
    install.packages("remotes")
  }
  remotes::install_github("JeffreyRacine/spcovar")
}

# crs provides the NOMAD-backed tuning route used by the nonparametric fit.

required_packages <- c("refund", "rgl", "crs")
missing_packages <- required_packages[
  !vapply(required_packages, requireNamespace, logical(1), quietly = TRUE)
]

if (length(missing_packages)) {
  stop(
    "Please install the required package(s): ",
    paste(missing_packages, collapse = ", "),
    call. = FALSE
  )
}

library(spcovar)

## Load the CD4 cell count data from the refund package.

data(cd4, package = "refund")

## The data are in a matrix with rows corresponding to subjects and columns
## corresponding to time points.  We will convert the time points to the unit
## interval and create lists of time points and observations for each subject,
## which is the format required by spcovar.

times <- as.numeric(colnames(cd4))
times01 <- (times - min(times)) / diff(range(times))

Lt <- vector("list", nrow(cd4))
Ly <- vector("list", nrow(cd4))

for (i in seq_len(nrow(cd4))) {
  ok <- is.finite(cd4[i, ])
  Lt[[i]] <- times01[ok]
  Ly[[i]] <- as.numeric(cd4[i, ok])
}

## Estimate the mean, standard deviation, and covariance surface using spcovar.

fit_cd4_sp <- spcovar(Lt, Ly)

## Plot the mean, standard deviation, and covariance surface estimates.

plot(fit_cd4_sp)

## Plot the covariance surface estimate in an interactive rgl widget.

plot(fit_cd4_sp, view = "rgl")

## Estimate the mean, standard deviation, and fully nonparametric covariance
## surface using npcovar.

fit_cd4_np <- npcovar(Lt, Ly)

## Plot the mean, standard deviation, and covariance surface estimates.

plot(fit_cd4_np)

## Plot the fully nonparametric covariance surface estimate in an interactive
## rgl widget.

plot(fit_cd4_np, view = "rgl")
