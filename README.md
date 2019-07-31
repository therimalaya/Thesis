# Exploration of Multi-response Multivariate Methods

A linear regression model defines a linear relationship between two or more random variables. The random variables that depend on other random variables are often called response variables and the independent random variables are called predictor variables. In most cases not all variation is relevant for regression, i.e. only a certain amount of the variation in the predictors is relevant and only so for a part of the variation in the response. This leads to a reduction of the linear regression model where one can imagine a subspace of the space spanned by the predictor variables that contains all the relevant information for a subspace of the space spanned by the response variables.
In this thesis we attempt to compare some new methods which are based on the envelope model and some established methods such as principal components regression (PCR) and partial least squares regression (PLS). The comparison tests these methods on their performance of producing minimum prediction and estimation error while modelling data simulated with specifically designed properties. For the simulation we have also created an R-package called simrel with a web interface.

A simulation model for a multi-response multivariate linear model, on which the simulation tool is based, is discussed in the first paper. This paper prepares a basic foundation for the simulations with the concept of reduction of regression models. The second paper discusses the similarities of the envelope, PCR and PLS population models. This paper compares the prediction performance of several multivariate methods using a model with a single response.

The final two papers make an extensive investigation evaluating the prediction and estimation performance of established (PCR, PLS1 and PLS2) and newly developed envelope based (Xenv and Senv) methods. Unsurprisingly the study found that not one method dominates in all situations, but their performance depend on the properties of the data they model. However, the envelope based methods have shown remarkable performance in many cases, both in prediction and estimation. The study also recommend researchers to use and evaluate the envelope methods.

## Relevant Links

**R-package:**
: [`https://github.com/simulatr/simrel`](https://github.com/simulatr/simrel)

**Shiny Application:**
: [`https://github.com/simulatr/AppSimulatr`](https://github.com/simulatr/AppSimulatr)

**Thesis GitHub Repository:**
: [`https://github.com/therimalaya/Thesis`](https://github.com/therimalaya/Thesis)

**Paper 1:**
: [`https://github.com/therimalaya/simrel-m`](https://github.com/therimalaya/simrel-m)

**Paper 2:**
: [`https://github.com/therimalaya/model-comparison-paper`](https://github.com/therimalaya/model-comparison-paper)

**Paper 3:**
: [`https://github.com/therimalaya/03-prediction-comparison`](https://github.com/therimalaya/03-prediction-comparison)

**Paper 4:**
: [`https://github.com/therimalaya/04-estimation-comparison`](https://github.com/therimalaya/04-estimation-comparison)

## Reproducing the study 

The `Makefile` can compile different version of this study including `html` through _bookdown_, `pdf` using _LaTeX_ and `epub` format. All the files are in _Rmarkdown_ format together with integrated R-code and a separate function and simulated data files. The repository should be cloned and following required R-packages and their dependencies need to be installed in order to run `make all` successfully.

### Required R-packages
```r
req_pkgs <- c("tidyverse", "pls", "simrel", "Renvlp", "kableExtra", "rmarkdown", "knitr")
for (pkg in req_pkgs) require(pkg, character.only = TRUE, quietly = TRUE, warn.conflicts = FALSE)
```

One can also use Docker image to reproduce the document by creating the environment and attaching the cloned repository as follows. You need to install docker in your system.

```sh
# Make the docker Image Ready
docker pull therimalaya/rocker:latest

# Clone the thesis repository and change to that directory
git clone https://github.com/therimalaya/Thesis.git Thesis
cd Thesis

# Run the docker Image with the cloned repository mounted using docker-compose
# User can edit the docker-compose file accordingly
docker run -d -v $(PWD):/home/therimalaya/thesis --name thesis therimalaya/rocker:latest

# Execute the make command inside the docker
docker exec --workdir=/home/therimalaya/thesis thesis make all
```
