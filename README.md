# bash-script-register-ado-runner

This techhub contains the bash script to download the azure devops agent, install the agent, configure it nad run the agent as a daemon service

## Pre-requsties

- Export the following variables on the terminal using command `export ADOURI='https://dev.azure.com/<organisationName>'`:
  - ADOURI - URL of the Azure DevOps Organisation
  - ADOPAT - PAT registered for the Azure DevOps Organisation
  - POOLNAME - Pool name for the Azure DevOps Organisation where the agent needs to be registered
  - AGENTNAME - Name of the agent to be registered

## How to run the script

- Run the script using command `./register-ado-agent.sh`
