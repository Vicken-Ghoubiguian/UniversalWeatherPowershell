#Put the PowerShell image as image's base
FROM mcr.microsoft.com/powershell

#
LABEL maintainer="ericghoubiguian@live.fr"

#Define the Dockerfile argument 'fromExecMode' to specify if the githubConsultationModule will be installed in OS or not 
ARG fromExecMode

#Define the environment variable 'execMode' to take the 'fromExecMode' argument value and put it to run the app
ENV execMode=$fromExecMode

#Copy all the files and directories in the newly created directory githubConsultationModule
COPY . /usr/local/share/powershell/Modules/githubConsultationModule

#Copy all 'simpleSamples' of the project's 'samples' folder in the Docker image one
COPY ./samples/simpleSamples samples

#Define the current folder as 'samples'
WORKDIR samples

#
CMD ["pwsh", "-Command", "$ENV:PSModulePath"]