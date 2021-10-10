# simple_pomodoro

Keeps records of pomodoros and creates alerts about breaks using fortunes and sounds


## Requirements 

The script uses the following packages: 'sox', 'libsox-fmt-all', 'fortunes', 'fortune-anarchism', 'fortune-bofh-excuses', and 'zenity'. The following command can be used to install them

'''
$ sudo apt-get install sox libsox-fmt-all fortunes fortune-anarchism fortune-bofh-excuses zenity
'''


## Usage

Run the following and introduce the name of the project. The pomodoros are recorder in the file 'register.csv'
'''
sh pomodoro.sh
'''
The script records sessions with 4 pomodoros, which are followed by a break. Each pomodoro lasts 25 minutes and the breaks last 5 minutes, except for the last one, wich lasts 15 minutes. One pomodoro cycle lasts 130 minutes.


## Output

The script records the podoros in a CSV file. The follwoing is an example:

| Date | Time | Project |
| ---- | ---- | ------- |
2021-10-10 | 00:04 | Pomodoro |
|  ---- | ---- | ------- |
2021-10-10 | 00:34 | Pomodoro |
|  ---- | ---- | ------- |
2021-10-10 | 01:06 | Pomodoro |
|  ---- | ---- | ------- |
2021-10-10 | 01:36 | Pomodoro |




# To Do

* Allow flexible duration of the pomodoros and breaks
* Includ ea menu to select among past projects recorded
* Enable the use of other quotes, such as 'display-dhammapada'


