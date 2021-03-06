#' Active Learning with Random Querying
#'
#' The method of active learning is used to query the labels of observations from
#' unlabeled training data in a classification context from a (this is often
#' assumed) gold-standard 'oracle', who is able to provide the correct labels for
#' any unlabeleled observation that we query. Typically, with our ability to
#' collect large quantities of data, we end up with a large collection of
#' unlabeled data. Labeling the data is usually time-consuming, expensive, and
#' often requires an expert. Hence, it is imperative that we query unlabeled
#' observations in a smart manner, so that we get the biggest bang for the buck
#' in terms of understanding the data-generating system as well as to maximize
#' our future classification performance.
#'
#' A simple, naive approach is to query unlabeled observations chosen at random.
#' Although naive, one might argue that random queries provide some efficacy
#' because we will always be learning more about the system if the oracle is
#' truly infallible. However, random querying is often a baseline to which
#' proposed active learning methods are compared: if a method is far more
#' complex than random querying in both methodology and computation runtime,
#' why would we employ it if it hardly improves performance?
#'
#' This function provides the baseline random querying. We only require the
#' vector of labels for each observation. Unlabeled observations in \code{y} are
#' assumed to have \code{NA} for a label.
#'
#' It is often convenient to query unlabeled observations in batch. With the
#' \code{num_query} the user can specify the number of observations to return in
#' batch.
#'
#' @param y a vector of the classification labels for each observation in a data
#' set. Use \code{NA} for unlabeled observations.
#' @param num_query the number of observations to be be queried.
#' @return a list that contains the least_certain observation and miscellaneous
#' results. See above for details.
random_query <- function(y, num_query = 1) {
	unlabeled <- which_unlabeled(y)
  if (length(unlabeled) <= 1 || length(unlabeled) <= num_query) {
    query <- unlabeled
  } else {
    query <- sample(unlabeled, num_query)
  }
	list(query = query, unlabeled = unlabeled)
}
