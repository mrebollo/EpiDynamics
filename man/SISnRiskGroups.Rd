% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SISnRiskGroups.R
\name{SISnRiskGroups}
\alias{SISnRiskGroups}
\title{SIS model with multiple risk groups (P 3.2).}
\usage{
SISnRiskGroups(pars = NULL, init = NULL, time = NULL, ...)
}
\arguments{
\item{pars}{\code{\link{list}} with: the number of risk groups, a (m x m) matrix with the transmission rates, a \code{\link{vector}} with the recovery rates (one for each risk group) and a \code{\link{vector}} with the proportions of the population that are in each risk group. The names of these elements must be "m", "beta", "gamma" and "n", respectively (see example). All rates are specified in years.}

\item{init}{\code{\link{vector}} with m * 2 values: the initial proportions of susceptibles and infectious in each risk group. The names of these values must be "S1",..., "Sm" and "I1",..., "Im", respectively (see example). All initial states must be positive and Si + Ii = ni, i= 1, ..., m.}

\item{time}{time sequence for which output is wanted; the first value of times must be the initial time.}

\item{...}{further arguments passed to \link[deSolve]{ode} function.}
}
\value{
\code{\link{list}}. The first element, \code{*$model}, is the model function. The second, third and fourth elements are the vectors (\code{*$pars}, \code{*$init}, \code{*$time}, containing the \code{pars}, \code{init} and \code{time} arguments of the function. The fifth element \code{*$results} is a \code{\link{data.frame}} with up to as many rows as elements in time. First column contains the time. The following columns contain the proportion of susceptibles and infectious of each risk group.
}
\description{
Solves a SIS model with n different risk-groups.
}
\details{
This is the R version of program 3.2 from page 64 of "Modeling Infectious Disease in humans and animals" by Keeling & Rohani.

All parameters must be positive, and  ni <= 1,  sum(ni) = 1, i = 1, ..., m.
}
\examples{
# Parameters and initial conditions.
tmp <-matrix(c(0, 3, 10, 60, 100))
beta <- 0.0016 * tmp \%*\% t(tmp)
parameters <- list(m = 5, beta = beta, 
                   gamma = c(0.2, 0.2, 0.2, 0.2, 0.2),
                   n = c(0.06, 0.31, 0.52, 0.08, 0.03))
initials <- c(I = c(0, 0, 0, 0, 1e-5))

# Solve and plot.
sis.n.riks.groups <- SISnRiskGroups(pars = parameters, 
                                    init = initials, 
                                    time = 0:30)
PlotMods(sis.n.riks.groups, grid = FALSE)

}
\references{
Keeling, Matt J., and Pejman Rohani. Modeling infectious diseases in humans and animals. Princeton University Press, 2008.
\href{http://www.modelinginfectiousdiseases.org/}{Modeling Infectious Diseases in Humans and Animals}
}
\seealso{
\link[deSolve]{ode}.
}

