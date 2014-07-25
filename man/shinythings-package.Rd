\name{shinythings-package}
\alias{shinythings-package}
\alias{shinythings}
\docType{package}
\title{
Inputs and outputs for Shiny apps
}
\description{
Shiny Things makes various input and output components and widgets available for Shiny applications.  New inputs include a password input field.  Outputs include a suite of NVD3 outputs.
}
\details{
\tabular{ll}{
Package: \tab shinythings\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2014-07-25\cr
License: \tab GLP-3\cr
}
Input and output functions should be included in the ui.R file of a Shiny application.
}
\author{
Duane Currier
}
\references{
%% Literature or other references for background information 
}

\keyword{ package }
\keyword{ shiny }
\seealso{
\code{\link[shiny:shinyUI]{shinyUI}}
}
\examples{
passwordInput('inputId', label='Input Label', value='')
}
