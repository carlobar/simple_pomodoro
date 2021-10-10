#!/bin/sh 

# script to play alarms periodically

log_file='register.csv'

play_clip () {
    ls ./sounds/*.mp3 | shuf -n 1 | xargs -I % play % trim 0 15 2> /dev/null 
}

progress () {
    text=$( fortune wisdom art anarchism bofh-excuses )
    #text=$( display-dhammapada )
    time=$( date +"%F %X" )
    echo "Break: $(( $1/60 )) min"

    (
    i=0
    while [ $i -le $1 ]
    do
        sleep 1s
        i=$(( $i+1 ))
        echo $(( $i*100/$1 ))
    done
    ) |  zenity --progress --text "Take a break" --no-cancel --auto-close --title "Take a break" --width=600 --height=100  --text="Fortune:\n$text" --percentage=0

    time=$( date +"%F %X" )
    #echo "End: $time"
}

project_name () {
    name=$( zenity --entry --title "Pomodoro" --text "Current project:" )
    echo $name
}

register_pomodoro () {
    if [ ! -f "$log_file" ]
    then 
        echo "Date; Time; Project" > $log_file
    fi
    date=$( date +"%F" )
    time=$( date +"%H:%M" )
    echo "$date; $time; $project" >> $log_file
}


project=
pomodoros=0
while true
do
    if [ -z "$project" ]
    then 
        project=$( project_name )
            if [ -z "$project" ]
            then 
                break
            fi
            time=$( date +"%F %X" )
            echo "Starting a new project '$project' at $time"
            pomodoros=0
    fi
    pomodoros=$(( $pomodoros+1 ))

    zenity --notification --text="Beginning new pomodoro" 2> /dev/null
    echo "Pomodoro $pomodoros"
    register_pomodoro
    sleep 25m
    zenity --notification --text="Take a break" 2> /dev/null
    #play_clip
    if [ $pomodoros -eq 4 ]
    then
        progress 900
        project=
    else
        progress 300
    fi
done







# how do we reconfigure the times after suspending the computer?
