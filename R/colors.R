#' Complete list of palettes
#'
#' Use \code{\link{duke_palette}} to construct palettes of desired length.
#'
#' @export
duke_palettes <- list(
    PrimaryBlues = c("#001A57", "#003366"),
    SecondaryBlues = c("#0736A4", "#235F9C",
                       "#0680CD", "#339999"),
    SecondaryColor = c("#728302", "#A1B70D",
                       "#EBF0CC", "#F6EAB8",
                       "#FFD960", "#F09905",
                       "#CC3300", "#993399"),
    Neutrals = c("#988675", "#DAD0C6",
                 "#262626", "#666666",
                 "#B5B5B5", "#E5E5E5")
)


#' An implementaion of Duke Color Palette
#'
#' These are official color palettes from Duke University
#'
#' @param n Number of colors desired. Currently, there are 4 palettes that
#'   have 2, 4, 6, or 8 colors. All color schemes are copied from Duke University Styleguide
#'   \href{https://styleguide.duke.edu/color-palette/}{Duke Color Palettes}.
#'   If omitted, uses all colours.
#' @param name Name of desired palette. Choices are:
#'   \code{PrimaryBlues}, \code{SecondaryBlues},  \code{SecondaryColor},
#'   \code{Neutrals}
#' @param type Either "continuous" or "discrete". Use continuous if you want
#'   to automatically interpolate between colours.
#' @importFrom graphics rgb rect par image text
#' @return A vector of colours.
#' @export
#' @keywords colors
#' @examples
#' duke_palette("PrimaryBlues")
#' duke_palette("SecondaryBlues")
#' duke_palette("SecondaryColor")
#' duke_palette("Neutrals", 3)
#'
#' # If you need more colours than normally found in a palette, you
#' # can use a continuous palette to interpolate between existing
#' # colours
#' pal <- duke_palette(name = "SecondaryBlues", n = 21, type = "continuous")
#' image(volcano, col = pal)
duke_palette <- function(name, n, type = c("discrete", "continuous")) {
    type <- match.arg(type)

    pal <- duke_palettes[[name]]
    if (is.null(pal))
        stop("Palette not found.")

    if (missing(n)) {
        n <- length(pal)
    }

    if (type == "discrete" && n > length(pal)) {
        stop("Number of requested colors greater than what palette can offer")
    }

    out <- switch(type,
                  continuous = grDevices::colorRampPalette(pal)(n),
                  discrete = pal[1:n]
    )
    structure(out, class = "palette", name = name)
}

#' @export
#' @importFrom graphics rect par image text
#' @importFrom grDevices rgb
print.palette <- function(x, ...) {
    n <- length(x)
    old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
    on.exit(par(old))

    image(1:n, 1, as.matrix(1:n), col = x,
          ylab = "", xaxt = "n", yaxt = "n", bty = "n")

    rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
    text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1, family = "sans")
}
