This is my ReadMe file.

In this project, I will be analyzing the data of many different soccer players, across various professional teams. It was my initial my goal to determine which league has the best players, and if that makes this league the best league (or not!)

Please see my Makefile to run all code for this project.

First, clone my git repository to obtain all code required for the project. (as a note, I used a BIOS VM for this project) 

1. git clone https://github.com/tobiama/Bios611


Next, I did things a little bit differently, but rather than being in the work directory, I mounted the parent directory of the project rather than the directory of the project itself. 

Run the following lines of code: 

1. cd 611
2. docker build . -t 611

611 is the folder in which all of my code is stored.
 
(On Mac and Linux machines) run the following code to open a Rstudio window in your browser. 

1. docker run -ti -e USERID=$(id -u) -e GROUPID=$(id -g) -e PASSWORD=pw -p 8787:8787 -v $(pwd):/home/rstudio/work 611 

In the browser, open localhost:8787.  Enter username = rstudio, password = pw 


Go into the terminal in Rstudio.  

1. cd work 

Now run the following lines of code from my makefile:

1.  make clean
2.  make .created_directories
3.  make Figures/cor_plot.jpeg Figures/cluster_plot.jpeg Figures/PL_age.jpeg Figures/zoom_goals_p_league.jpeg Figures/prog_stats_p_league.jpeg
4.  make Report.pdf

My final report is located in Report.pdf.
