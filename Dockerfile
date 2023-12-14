FROM rocker/verse


#ARG USER_ID
#ARG GROUP_ID


ARG USER_ID=1000

#  update UID and home directory ownership if USER_ID is different from current UID
RUN current_uid=$(id -u rstudio) && \
    if [ "$USER_ID" != "$current_uid" ]; then \
        usermod -u $USER_ID rstudio && \
        chown -R rstudio:rstudio /home/rstudio; \
    fi

#RUN usermod -u $USER_ID rstudio
#RUN chown -R rstudio:rstudio /home/rstudio

RUN apt update && apt install -y man-db && rm -rf /var/lib/apt/lists/*
#RUN yes|unminimize


RUN R -e "install.packages('rmarkdown', 'matlab', 'corrr', 'ggcorrplot', 'FactoMineR', 'factoextra')"
