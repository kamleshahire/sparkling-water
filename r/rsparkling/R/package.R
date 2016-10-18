#Set Sparkling Water version. Default is 1.6.7
sw_version <- getOption("rsparkling.sparklingwater.version", default = "1.6.7")

#' @import sparklyr h2o utils
NULL

# define required spark packages
spark_dependencies <- function(spark_version, scala_version,sw_version, ...) {
  sparklyr::spark_dependency(packages = c(
    sprintf("ai.h2o:sparkling-water-core_%s:%s", scala_version,sw_version),
    sprintf("ai.h2o:sparkling-water-ml_%s:%s", scala_version,sw_version),
    sprintf("ai.h2o:sparkling-water-repl_%s:%s", scala_version,sw_version)
  ))
}

.onLoad <- function(libname, pkgname) {
  sparklyr::register_extension(pkgname)
}

