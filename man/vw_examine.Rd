% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/examine.R
\name{vw_examine}
\alias{vw_examine}
\title{Examine vegaspec}
\usage{
vw_examine(
  spec,
  mode = "view",
  modes = c("view", "code", "form", "text", "tree"),
  ...,
  width = NULL,
  height = NULL,
  elementId = NULL
)
}
\arguments{
\item{spec}{An object to be coerced to \code{vegaspec}, a Vega/Vega-Lite specification}

\item{mode}{\code{string} for the initial view from modes.
\code{'view'} is the default.}

\item{modes}{string \code{c('view','code', 'form', 'text', 'tree')}
will be the default, since these are all the modes
currently supported by \strong{\code{jsoneditor}}.}

\item{...}{\code{list} of other options for \code{jsoneditor}.  This is a temporary way
of trying other options in \code{jsoneditor}.  In the future, this will be eliminated
in favor of specific, more self-documenting and helpful arguments.}

\item{width}{integer in pixels defining the width of the \code{div} container.}

\item{height}{integer in pixels defining the height of the \code{div} container.}

\item{elementId}{character to specify valid \code{CSS} id of the
htmlwidget for special situations in which you want a non-random
identifier.}
}
\value{
S3 object of class \code{jsonedit} and \code{htmlwidget}
}
\description{
This is a thin wrapper to \code{\link[listviewer:jsonedit]{listviewer::jsonedit()}},
use to interactively examine a Vega or Vega-Lite specification.
}
\examples{
  vw_examine(spec_mtcars)

  spec_mtcars_autosize <-
    spec_mtcars \%>\%
    vw_autosize(width = 300, height = 300)

  vw_examine(spec_mtcars_autosize)
}
