\name{actionButton}
\alias{actionButton}
\title{Action Button input for a Shiny UI}

\description{
Creates an action button input with an initial value of zero.  Allows buttons to include icons and to be styled as default Bootstrap buttons.  This function is an extension of the actionButton from the shinysky package (\url{https://github.com/AnalytixWare/ShinySky}).
}
\usage{
actionButton(inputId, label, styleclass = "", size = "", 
  block = F, icon = NULL, icon.library = c("font awesome", 
  "bootstrap"), css.class = "", ...)
}
\arguments{
  \item{inputId}{Specifies the input slot that will be used to access the value.}

  \item{label}{The contents of the button--usually a text label, but you could also use any other HTML, like an image.}

  \item{styleclass}{The Bootstrap styling class of the
  button--options are primary, info, success, warning,
  danger, inverse, link or blank}

  \item{size}{The size of the button--options are large, small, mini}

  \item{block}{Whehter the button should fill the block}

  \item{icon}{Display an icon for the button}
  
  \item{icon.library}{Choose the icon library to source the icon from options are: \code{font awesome} and \code{bootstrap}.  See Details for more information about these icons sets.}
  
  \item{css.class}{Any additional CSS class one wishes to add to the action button supplied as a character string}
}
}
\details{
The \code{styleclass}, \code{size}, and \code{block} arguments enable the button class to be set according to the default Bootstrap button classes (\url{http://getbootstrap.com/2.3.2/base-css.html#buttons}).  

Icons can be included in your buttons by specifying the \code{icon} argument. Two icon sets are supported; the defualt, Font Awesome, contains a large number of icons that can be scaled and adapt to the button text color.  Bootstrap icons are provided by Glyphicons and the set is similar to Font Awesome with several exceptions; however, they do not adapt to button text color.  More information about icon sets and available icons: \code{font awesome} (\url{http://www.fontawesome.io/icons/}) and \code{bootstrap} (\url{http://getbootstrap.com/2.3.2/base-css.html#icons}).  Note that the icon name is specified by dropping the 'fa-' prefix from Font Awesome icons and the 'icon-' prefix from Bootstrap icons.

Using the \code{css.class} argument additional CSS classes can be supplied for the button.  For example, 'fa-spin' will cause the icon to rotate and 'fa-flip-horizontal' will flip the icon horizontally.  Using 'fa-lg', 'fa-2x', 'fa-3x', 'fa-4x', and 'fa-5x' will produce larger icons.  For more examples see \url{http:www.fontawesome.io/examples/}.
}
\seealso{
Other ShinyThings.elements: \code{\link{passwordInput}};
Related packages: \code{shinysky}, \code{shiny}
}

\examples{
actionButton('buttonId', label='My Button', styleclass='primary', 
  icon='home')
}
\keyword{ button }
\keyword{ bootstrap }
\keyword{ font awesome }
