\name{passwordInput}
\alias{passwordInput}
\title{Password Input for a Shiny UI}
\usage{
passwordInput(inputId, label, value)
}
\arguments{
  \item{inputId}{Specifies the input slot that will be used
  to access the value.}

  \item{label}{The contents of the button--usually a text
  label, but you could also use any other HTML, like an
  image.}

  \item{value}{The initial value of the input - a default password,
  for instance.}
}
\description{
Creates a password input.  Please note that this function does not
provide any password encryption.  The value entered is passed to the 
server as plain, un-encrypted text.  This input widget is designed to 
provide privacy from those around you, not security from those with 
malicious intent.  It should be treated as a normal text input with 
the benefit of hiding it's contents from onlookers.
}
\seealso{
Other ShinyThings Elements: \code{\link[shinythings]{actionButton}};
Related packages: \code{\link[shinysky]{shinysky}}, \code{\link[shiny]{shiny}}
}
\examples{
passwordInput("pass", label="Choose a Password", value="")
}