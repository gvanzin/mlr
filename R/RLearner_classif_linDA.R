#' @S3method makeRLearner classif.linDA
makeRLearner.classif.linDA = function() {
  makeRLearnerClassif(
    cl = "classif.linDA",
    package = "DiscriMiner",
    par.set = makeParamSet(
      #makeNumericVectorLearnerParam(id="prior", lower=0, upper=1, default=NULL),
      ),
    twoclass = TRUE,
    multiclass = TRUE,
    numerics = TRUE,
    factors = FALSE,
    missings = FALSE,
    prob = TRUE
  )
}

#' @S3method trainLearner classif.linDA
trainLearner.classif.linDA = function(.learner, .task, .subset, .weights,  ...) {
  d = getTaskData(.task, .subset, target.extra=TRUE)
  linDA(variables = d$data, group = d$target)
}

#' @S3method predictLearner classif.linDA
predictLearner.classif.linDA = function(.learner, .model, .newdata, ...) {
  m = .model$learner.model
  p = classify(m, newdata = .newdata)
  #p$scores #we loose this information
  p$pred_class
}