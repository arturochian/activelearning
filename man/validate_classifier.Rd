\name{validate_classifier}
\alias{validate_classifier}
\title{Validates the classifier specified from the 'caret' package}
\usage{
  validate_classifier(classifier, posterior_prob = FALSE)
}
\arguments{
  \item{classifier}{string that contains the supervised
  classifier as given in the \code{caret} package.}

  \item{posterior_prob}{Are posterior probabilities
  required? If so, set to \code{TRUE}. By default, set to
  \code{FALSE}.}
}
\value{
  \code{TRUE} invisibly if no errors occur.
}
\description{
  We ensure that the specified classifier is a valid
  classifier in the \code{caret} package.
}
\examples{
validate_classifier('lda')
validate_classifier('What else floats? ... Very small rocks. ... Gravy.')
}

