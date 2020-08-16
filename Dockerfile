FROM mcr.microsoft.com/powershell:latest

LABEL maintainer="ericghoubiguian@live.fr"

COPY . /UniversalWeatherPowershell

WORKDIR /UniversalWeatherPowershell/samples/integratedSamples

SHELL ["powershell"]
