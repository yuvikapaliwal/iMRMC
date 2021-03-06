% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/iMRMC.R
\name{doIMRMC}
\alias{doIMRMC}
\title{doIMRMC takes ROC data as a data frame and runs a multi-reader multi-case analysis
based on U-statistics as described in the following papers
Gallas2006_Acad-Radiol_v13p353 (single-modality),
Gallas2008_Neural-Networks_v21p387 (multiple modalities, arbitrary study designs),
Gallas2009_Commun-Stat-A-Theor_v38p2586 (framework paper).}
\usage{
doIMRMC(dFrame.imrmc, iMRMCjarFullPath = NULL, cleanUp = TRUE,
  show.output.on.console = FALSE)
}
\arguments{
\item{dFrame.imrmc}{[data.frame] the variables contained in this data frame are
readerID       [Factor] w/ nR levels "reader1", "reader2", ...
caseID         [Factor] w/ nC levels "case1", "case2", ...
modalityID     [Factor] w/ 1 level simRoeMetz.config$modalityID
score          [num] reader score
each row of this data frame corresponds to an observation
for every caseID, there must be a row corresponding to the truth observation
  the readerID for a truth observation is "truth"
  the modalityID for a truth observation is "truth"
  the score for a truth observation must be either 0 (signal-absent) or 1 (signal-present)}

\item{iMRMCjarFullPath}{[char] this string identifies the location of the iMRMC.jar file
this jar file can be downloaded from https://github.com/DIDSR/iMRMC/releases
this R program supports version iMRMC-v3p2.jar}

\item{cleanUp}{[logi] this logical determines whether or not the iMRMC analysis results}

\item{show.output.on.console}{[logi] this logical determines whether or iMRMC console output
is written to the console}
}
\value{
iMRMCoutput [list] the objects of this list are described in detail in the iMRMC documentation
           which can be found at http://didsr.github.io/iMRMC/000_iMRMC/userManualHTML/index.htm

           Here is a quick summary:
           perReader [data.frame] this data frame contains the performance results for each reader.
             Key variables of this data frame are AUCA, AUCB, AUCAminusAUCB and the corresponding
             variances, confidence intervals, degrees of freedom and p-values.
           Ustat [data.frame] this data frame contains the reader-average performance results.
             The analysis results are based on U-statistics and the papers listed above.
             Key variables of this data frame are AUCA, AUCB, AUCAminusAUCB and the corresponding
             variances, confidence intervals, degrees of freedom and p-values.
           MLEstat [data.frame] this data frame contains the reader-average performance results.
             The analysis results are based on V-statistics, which approximates the true distribution with
             the empirical distribution. The empirical distribution equals the nonparametric MLE
             estimate of the true distribution, which is also equivalent to the ideal bootstrap estimate.
             PLease refer to the papers listed above.
             Key variables of this data frame are AUCA, AUCB, AUCAminusAUCB and the corresponding
             variances, confidence intervals, degrees of freedom and p-values.
           ROC [list] each object of this list is an object containing an ROC curve.
             There is an ROC curve for every combination of reader and modality.
             For every modality, there are also four average ROC curves. These are discussed in
               Chen2014_Br-J-Radiol_v87p20140016
               The diagonal average averages the reader-specific ROC curves along y = -x + b for b in (0,1)
               The horizontal average averages the reader specific ROC curves along y = b for b in (0,1)
               The vertical average averages the reader specific ROC curves along x = b for b in (0,1)
               The pooled average ignores readerID and pools all the scores together to create one ROC curve.
           varDecomp [list] the objects of this list are different decompositions of the total variance
             Please refer to Gallas2009_Commun-Stat-A-Theor_v38p2586 (framework paper).
             The different decompositions are BCK, BDG, DBM, MS, OR.
}
\description{
In detail, this procedure writes the ROC data frame to the local file system formatted
for the iMRMC program (found at https://github.com/DIDSR/iMRMC/releases), it executes the iMRMC
program which writes the results to the local files system, it reads the analysis results from
the local file system, packs the analysis results into a list object, deletes the data and analysis results
from the local file system, and returns the list object.
}
\examples{


}
