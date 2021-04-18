from jetbrains/teamcity-agent:2020.2.3
USER root
RUN apt-get update
RUN apt install wget
RUN wget https://packages.microsoft.com/config/ubuntu/20.10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN apt-get update; \
  apt-get install -y apt-transport-https && \
  apt-get update && \
  apt-get install -y dotnet-sdk-5.0
RUN chown -R buildagent:buildagent /services && dotnet help
USER buildagent