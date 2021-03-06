% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nma.diag.R
\name{nma.diag}
\alias{nma.diag}
\title{Trace plots and convergence diagnostics for MCMC chains}
\usage{
nma.diag(
  nma,
  trace = TRUE,
  gelman.rubin = TRUE,
  geweke = TRUE,
  params = "all",
  thin = 1,
  ncol = 1,
  nrow = 3,
  plot_prompt = TRUE,
  geweke_frac1 = 0.1,
  geweke_frac2 = 0.5
)
}
\arguments{
\item{nma}{A \code{BUGSnetRun} object produced by \code{nma.run()}}

\item{trace}{If TRUE, outputs trace plots. Default is TRUE.}

\item{gelman.rubin}{If TRUE, runs Gelman-Rubin diagnostic. Default is TRUE.}

\item{geweke}{If TRUE, runs Geweke diagnostic. Default is TRUE.}

\item{params}{Integer or character vector which specifies which parameters to produce trace plots for when trace is set to TRUE.
Default is "all" which plots every monitored parameter.}

\item{thin}{Thinning factor for the mcmc chains when producing trace plots. Default is 1.}

\item{ncol}{Number of columns in each batch of trace plots}

\item{nrow}{Number rows in each batch of trace plots}

\item{plot_prompt}{If TRUE, prompts the user to hit enter before plotting each additional batch of trace plots. Default is TRUE.}

\item{geweke_frac1}{Fraction to use from beginning of chain. Default is 0.1.}

\item{geweke_frac2}{Fraction to use from end of chain. Default is 0.5.}
}
\value{
\code{gelman.rubin} An object of class \code{gelman.rubin.results} containing the Gelman-Rubin diagnostic results.
A formatted table with custom PSRF threshold can be printed using \code{print(x, gelman.rubin.threshold = 1.2)}.

\code{geweke} An object of class \code{geweke.results} containing the Geweke diagnostic results. A formatted table
with custom significance level can be printed using \code{print(x, alpha = 0.05)}.
}
\description{
Produces trace plots and Gelman-Rubin and Geweke convergence diagnostics for the MCMC chains obtained from
\code{nma.run()}. The Gelman-Rubin and Geweke diagnostics are implemented using functions from the \code{coda} package.
}
\examples{
data(thrombolytic)
dich.slr <- data.prep(arm.data = thrombolytic, varname.t = "treatment", 
                      varname.s = "study")
random_effects_model <- nma.model(data=dich.slr, outcome="events", 
                                  N="sampleSize", reference="SK",
                                  family="binomial", link="log", 
                                  effects="random")
random_effects_results <- nma.run(random_effects_model, n.adapt=100, 
                                  n.burnin=0, n.iter=100)
nma.diag(random_effects_results)
}
\seealso{
\code{\link{nma.run}}
}
