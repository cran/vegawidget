% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vegawidget.R
\name{vegawidget}
\alias{vegawidget}
\title{Create a Vega/Vega-Lite htmlwidget}
\usage{
vegawidget(
  spec,
  embed = NULL,
  width = NULL,
  height = NULL,
  elementId = NULL,
  base_url = NULL,
  ...
)
}
\arguments{
\item{spec}{An object to be coerced to \code{vegaspec}, a Vega/Vega-Lite specification}

\item{embed}{\code{list} to specify
\href{https://github.com/vega/vega-embed#options}{vega-embed} options,
see \strong{Details} on how this is set if \code{NULL}.}

\item{width}{\code{integer}, if specified, the total rendered width (in pixels)
of the chart - valid only for single-view charts and layered charts;
the default is to use the width in the chart specification}

\item{height}{\code{integer}, if specified, the total rendered height (in pixels)
of the chart - valid only for single-view charts and layered charts;
the default is to use the height in the chart specification}

\item{elementId}{\code{character}, explicit element ID for the vegawidget,
useful if you have other JavaScript that needs to explicitly
discover and interact with a specific vegawidget}

\item{base_url}{\code{character}, the base URL to prepend to data-URL elements
in the vegaspec. This could be the path
to a local directory that contains a local file referenced in the spec.
It could be the base for a remote URL. Please note that by specifying
the \code{base_url} here, you will override any \code{loader} that you specify
using \code{vega_embed()}. Please note that this does not work with
\code{knitr}. See examples.}

\item{...}{other arguments passed to \code{\link[htmlwidgets:createWidget]{htmlwidgets::createWidget()}}}
}
\value{
S3 object of class \code{vegawidget} and \code{htmlwidget}
}
\description{
The main use of this package is to render a \code{vegawidget},
which is also an \code{htmlwidget}. This function builds a \code{vegawidget}
using a \code{vegaspec}.
}
\details{
If \code{embed} is \code{NULL}, \code{vegawidget()} uses:
\itemize{
\item \code{getOption("vega.embed")}, if that is NULL:
\item an empty call to \code{\link[=vega_embed]{vega_embed()}}
}

The most-important arguments to \code{\link[=vega_embed]{vega_embed()}} are:
\itemize{
\item \code{renderer}, to specify \code{"canvas"} (default) or \code{"svg"}
\item \code{actions},  to specify action-links
for \code{export}, \code{source}, \code{compiled}, and \code{editor}
}

If either \code{width} or \code{height} is specified, the \code{autosize()} function
is used to override the width and height of the \code{spec}. There are some
important provisions:
\itemize{
\item Specifying \code{width} and \code{height} is
\href{https://vega.github.io/vega-lite/docs/size.html#limitations}{effective only for single-view charts and layered charts}.
It will not work for concatenated, faceted, or repeated charts.
\item In the \code{spec}, the default interpretation of width and height
is to describe the dimensions of the
\strong{plotting rectangle}, not including the space used by the axes, labels,
etc. Here, \code{width} and \code{height} describe the dimensions
of the \strong{entire} rendered chart, including axes, labels, etc.
}

Please note that if you are using a remote URL to refer to a dataset in
your vegaspec, it may not render properly in the RStudio IDE,
due to a security policy set by RStudio. If you open the chart in a
browser, it should render properly.
}
\examples{
  vegawidget(spec_mtcars, width = 350, height = 350)

  # vegaspec with a data URL
  spec_precip <-
    list(
      `$schema` = vega_schema(),
      data = list(url = "seattle-weather.csv"),
      mark = "tick",
      encoding = list(
        x = list(field = "precipitation", type = "quantitative")
      )
    ) \%>\%
    as_vegaspec()

  # define local path to file
  path_local <- system.file("example-data", package = "vegawidget")

  # render using local path (does not work with knitr)
  vegawidget(spec_precip, base_url = path_local)

\dontrun{
  # requires network-access

  # define remote path to file
  url_remote <- "https://vega.github.io/vega-datasets/data"

  # render using remote path
  # note: does not render in RStudio IDE; open using browser
  vegawidget(spec_precip, base_url = url_remote)
}
}
\seealso{
\href{https://github.com/vega/vega-embed#options}{vega-embed options},
\code{\link[=vega_embed]{vega_embed()}}, \code{\link[=vw_autosize]{vw_autosize()}}
}
