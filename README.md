# CalVEX

This app allows users to perform simple visual analysis with data from the California Violence Experiences Survey (CalVEX).

## Commands to install requirements / packages (only need to do once):

** Make sure that in the terminal, you are already in the CalVEX-Data-Analysis folder!

create virtual environment
> python -m calvex_venv /CalVEX-Data-Analysis/

install requirements (all packages)
> pip install -r requirements.txt

install specific packages: 
> install.packages("[package name]")

## How to run the data from your personal computer:

venv activation: 
> calvex_venv/Scripts/activate
venv deactivation: 
> deactivate

stop script: 
> CTRL + C

run R: run app.R using the terminal run button
quit R: 
> q()

run app: 
> runApp("[folder name app.R is stored in]")
>> runApp("CalVEX-Data-Analysis")