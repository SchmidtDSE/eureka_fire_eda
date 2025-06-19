# Rocker base image for R with geospatial capabilities
FROM ghcr.io/rocker-org/geospatial:4.4.3 AS base

# Install renv
RUN R -e "install.packages('renv')"
RUN R -e "install.packages('languageserver')"

# Copy renv files
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/ renv/

# Restore packages
RUN R -e "renv::restore()"