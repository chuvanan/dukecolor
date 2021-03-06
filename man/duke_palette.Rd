% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/colors.R
\name{duke_palette}
\alias{duke_palette}
\title{An implementaion of Duke Color Palette}
\usage{
duke_palette(name, n, type = c("discrete", "continuous"))
}
\arguments{
\item{name}{Name of desired palette. Choices are:
\code{PrimaryBlues}, \code{SecondaryBlues},  \code{SecondaryColor},
\code{Neutrals}}

\item{n}{Number of colors desired. Currently, there are 4 palettes that
have 2, 4, 6, or 8 colors. All color schemes are copied from Duke University Styleguide
\href{https://styleguide.duke.edu/color-palette/}{Duke Color Palettes}.
If omitted, uses all colours.}

\item{type}{Either "continuous" or "discrete". Use continuous if you want
to automatically interpolate between colours.}
}
\value{
A vector of colours.
}
\description{
These are official color palettes from Duke University
}
\examples{
duke_palette("PrimaryBlues")
duke_palette("SecondaryBlues")
duke_palette("SecondaryColor")
duke_palette("Neutrals", 3)

# If you need more colours than normally found in a palette, you
# can use a continuous palette to interpolate between existing
# colours
pal <- duke_palette(name = "SecondaryBlues", n = 21, type = "continuous")
image(volcano, col = pal)
}
\keyword{colors}
