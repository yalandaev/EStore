from jetbrains/teamcity-agent:2020.2.3
echo "hello"
CMD dotnet --list-sdks
CMD wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
CMD dpkg -i packages-microsoft-prod.deb
CMD apt-get update;
CMD apt-get install -y apt-transport-https &&
CMD apt-get update
CMD apt-get install -y dotnet-sdk-5.0
CMD dotnet --list-sdks