% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/methods_quantify.R
\name{quantify}
\alias{quantify}
\alias{quantify.default}
\alias{quantify.APA_discovery}
\alias{quantify.PESCAn_discovery}
\alias{quantify.CSCAn_discovery}
\alias{quantify.ATA_discovery}
\alias{quantify.ARA_discovery}
\alias{quantify.saddle_discovery}
\alias{quantify.IIT_discovery}
\title{Quantification of results}
\usage{
quantify(discovery, ...)

\method{quantify}{APA_discovery}(
  discovery,
  size = 3,
  metric = "median",
  shape = "center_vs_quadrants",
  IDX = NULL,
  ...
)

\method{quantify}{PESCAn_discovery}(
  discovery,
  size = 5,
  metric = "median",
  shape = "circle",
  IDX = NULL,
  ...
)

\method{quantify}{CSCAn_discovery}(
  discovery,
  size = 5,
  metric = "median",
  shape = "circle",
  IDX = NULL,
  ...
)

\method{quantify}{ATA_discovery}(
  discovery,
  size = 3,
  metric = "median",
  shape = "insulation",
  IDX = NULL,
  ...
)

\method{quantify}{ARA_discovery}(discovery, size = 3, shape = "ARA", ...)

\method{quantify}{saddle_discovery}(discovery, ...)

\method{quantify}{IIT_discovery}(discovery, ...)
}
\arguments{
\item{discovery}{A \code{discovery} object as returned by GENOVA analysis functions.}

\item{...}{further arguments passed to or from other methods.
take the middle 3x3 matrix of the APA).}

\item{size}{An \code{integer} of length one to determine the size of features
of interest in bins.}

\item{metric}{Either \code{"median"} or \code{"mean"} to summarise features.}

\item{shape}{A character of length 1 specifying what shape to use. See the 
section shapes.}

\item{IDX}{The \code{IDX} part of a contacts object. Used only in converting 
features expressed in bins back to genomic space. This is rarely needed,
but is useful for APAs ran with extended loops where features aren't 1:1
traceable to the input.}
}
\description{
A good amount of \code{discovery} objects can be quantified.
What exactly is to be quantified differs per \code{discovery} type.
\describe{
  \item{saddle disoveries}{can be used to compute compartment strengths.}
  \item{ARMLA discoveries}{such as APA, PE-SCAn, ATA and ARA compare
  different regions of their outputs.}
  \item{IIT discoveries}{summarise their values by neighbours.}
}
}
\section{Shapes}{


The quantification of ARMLA discoveries require a shape to distinguish 
regions to quantify.

\subsection{ARA, PESCAn and CSCAn}{
APA, PESCAn and CSCAn require one of the following:
\itemize{
  \item{\code{"center_vs_quadrants"}}
  \item{\code{"center_vs_rest"}}
  \item{\code{"circle"}}
}
The \code{size} parameter determines the number of bins of the central 
foreground.

In the illustrations below, red is considered foreground and blue is 
considered background.

The \code{"center_vs_quadrants"} option does not include region directly
horizontal or vertical of the centre as background.

\if{html}{
  \out{<div style="text-align: center">}\figure{quant-center-vs-quandrants.png}{options: style="width:62px;max-width:100\%;"}\out{</div>}
  }
\if{latex}{
  \out{\begin{center}}\figure{quant-center-vs-quandrants.png}\out{\end{center}}
  }

The \code{"center_vs_rest"} option sees everything but the centre as background.

\if{html}{
  \out{<div style="text-align: center">}\figure{quant-center-vs-rest.png}{options: style="width:62px;max-width:100\%;"}\out{</div>}
  }
\if{latex}{
  \out{\begin{center}}\figure{quant-center-vs-rest.png}\out{\end{center}}
  }

The \code{"circle"} option is like \code{"center_vs_rest"} but rounds corners 
of the central foreground. Note that for \code{size <= 3} these two options 
are equivalent.


\if{html}{
  \out{<div style="text-align: center">}\figure{quant-circle.png}{options: style="width:62px;max-width:100\%;"}\out{</div>}
  }
\if{latex}{
  \out{\begin{center}}\figure{quant-circle.png}\out{\end{center}}
  }
}

\subsection{ATA}{
ATA requires one of the following:
\itemize{
  \item{\code{"insulation"}}
  \item{\code{"cornerpeak"}}
  \item{\code{"checker"}}
}

In the illustrations below, red is considered foreground and blue is 
considered background. The line indicates the diagonal.

The \code{"insulation"} option compares within-TAD contacts to between-TAD
contacts.

\if{html}{
  \out{<div style="text-align: center">}\figure{quant-insulation.png}{options: style="width:62px;max-width:100\%;"}\out{</div>}
  }
\if{latex}{
  \out{\begin{center}}\figure{quant-insulation.png}\out{\end{center}}
  }

The \code{"cornerpeak"} option compares the intersection of boundaries versus
within-TAD contacts.

\if{html}{
  \out{<div style="text-align: center">}\figure{quant-cornerpeak.png}{options: style="width:62px;max-width:100\%;"}\out{</div>}
  }
\if{latex}{
  \out{\begin{center}}\figure{quant-cornerpeak.png}\out{\end{center}}
  }
  
The \code{"checker"} option compares the within-TAD contacts to the 
contacts between it's immediate neighbours.

\if{html}{
  \out{<div style="text-align: center">}\figure{quant-checker.png}{options: style="width:62px;max-width:100\%;"}\out{</div>}
  }
\if{latex}{
  \out{\begin{center}}\figure{quant-checker.png}\out{\end{center}}
  }
}

\subsection{ARA}{
ARA requires one of the following:
\itemize{
  \item{\code{"ARA"}}
  \item{\code{"stripes"}}
}
The \code{size} argument controls the width of the stripes.

The \code{"ARA"} option reports about both 3' and 5' stripes and regions as
well as the bins that span the locus. They are indicated in different colours 
below.

\if{html}{
  \out{<div style="text-align: center">}\figure{quant-ARA.png}{options: style="width:62px;max-width:100\%;"}\out{</div>}
  }
\if{latex}{
  \out{\begin{center}}\figure{quant-ARA.png}\out{\end{center}}
  }

The \code{"stripes"} options reports the values and distances of the stripes.
The 5' distances are encoded as negative, whereas 3' distances are positive.

\if{html}{
  \out{<div style="text-align: center">}\figure{quant-stripes.png}{options: style="width:62px;max-width:100\%;"}\out{</div>}
  }
\if{latex}{
  \out{\begin{center}}\figure{quant-stripes.png}\out{\end{center}}
  }

}
}

\examples{
NULL
}
