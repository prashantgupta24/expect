## This script will let you run any command against a list of hosts using `ssh`, and it prompts for a password. 

**It is particularly helpful if the hosts are `only` accessable via a password prompt.**

In this script, I'm logging into a list of hosts and restarting tomcat on all of them.

## Usage

Have a `hosts.txt` file in the same folder as the script file, and have all the I.P's listed in that file, each on a new line.


`hosts.txt`

	10.11.12.13
  	10.12.34.56
  	12.44.66.77
