#!/bin/bash -x
#This script has several methods that can be used to download, parse, etc. FIRST data from various sources
#@author Adam_Tetelman

#URLs and whatnot used by github data
github_zip_url="https://github.com/the-blue-alliance/the-blue-alliance-data/archive/master.zip"
git_data_dir="the-blue-alliance-data-master"
git_data_zip="blue_data.zip"

#URLs and whatnot used by scraper
teams_file="teams.html"
events_file="events.html"
teams_list="teams.txt"
base_url="http://www.thebluealliance.com"
teams_url="${base_url}/teams"
events_url="${base_url}/events"

#Used to download and parse html files
def parse_file() {
    in_file=${1}
    out_file=${2}
    delim=${3}
    search=${4}
    
    #TODO: cut delim and grep search will not play nicely with quotes
    grep ${search} ${in_file} | cut -d${delim} -f2 | uniq > ${out_file}
}

#Download and extra data off github
pull_from_github() {
    #Download and unzip the blue alliance data dump
    curl ${github_zip_url} -o ${git_data_zip}
    unzip ${git_data_zip}
}

parse_from_github() {
    #TODO
    echo "Unimplemented"
}

#I threw this script together before I realized BlueAlliance had an API and a datashare on github
pull_from_bluealliance_via_scrape() {
    #Download the teams page
    curl ${teams_url} -o ${teams_file}

    #Download the eventspage
    curl ${events_url} -o ${events_file}

    #Parse the teams page into a list of all teams
    parse_file ${teams_file} ${teams_list} '"' '/team/'

    while read team; do   

        #Download a file for each team
        curl ${base_url}/${team} -o ${team}.html
    
        #Parse the team page into a list of all years they have results
        parse_file ${team}.html ${team}.years.txt '"' '/team/'  
        while read year; do

            #Download a file for each year the team has results
            curl ${base_url}/${team}.years.txt -o ${team}.${year}.html
        done < ${team}.years.txt
    done < ${teams_file}
}

parse_from_bluealliance_via_scrape() {
    #TODO
    echo "Unimplemented"
}

pull_from_bluealliance_via_api() {
    #TODO
    echo "Unimplemented"
}

parse_from_bluealliance_via_api() {
    #TODO
    echo "Unimplemented"
}

#pull_from_bluealliance_via_api
#parse_from_bluealliance_via_api
#pull_from_bluealliance_via_scrape
#parse_from_bluealliance_via_scrape
#pull_from_github
#parse_from_github
