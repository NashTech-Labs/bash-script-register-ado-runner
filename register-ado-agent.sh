#!/bin/sh

set -o errexit
set -o xtrace  # used for debugging

ADOURI=$ADOURI
PAT=$ADOPAT
POOLNAME=$POOLNAME
AGENTNAME=$AGENTNAME

echo "Downloading agent package"

cd ~
wget https://vstsagentpackage.azureedge.net/agent/3.220.5/vsts-agent-linux-x64-3.220.5.tar.gz

if [ $? -eq 0 ]
then
    echo "Agent Package downloaded successfully"
else
    echo "Error downloading the agent package"
fi

echo "\n"
echo "--------------------------------"
echo "\n"

echo "Extracting agent package"

cd ~
mkdir myagent && cd myagent

tar zxvf ~/vsts-agent-linux-x64-3.220.5.tar.gz

if [ $? -eq 0 ]
then
    echo "Agent Package extracted successfully"
else
    echo "Error extracting the agent package"
fi

echo "\n"
echo "--------------------------------"
echo "\n"

echo "Configuring the agent"

./config.sh --unattended --url $ADOURI --auth pat --token $PAT --pool $POOLNAME --agent $AGENTNAME --work _work

if [ $? -eq 0 ]
then
    echo "Agent Configured"
else
    echo "Error Configuring the agent"
fi

echo "\n"
echo "--------------------------------"
echo "\n"

echo "removing the agent package"
rm -f ~/vsts-agent-linux-x64-3.220.5.tar.gz

if [ $? -eq 0 ]
then
    echo "Agent Package Deleted"
else
    echo "Error deleting the agent package"
fi

echo "\n"
echo "--------------------------------"
echo "\n"

echo "Installing agent as systemd service"
sudo ./svc.sh install $USER

if [ $? -eq 0 ]
then
    echo "Agent installed as systemd service"
else
    echo "Error installing agent as systemd service"
fi

echo "\n"

echo "Starting systemd service"
sudo ./svc.sh start

if [ $? -eq 0 ]
then
    echo "Agent Service Started"
else
    echo "Error starting the service"
fi
