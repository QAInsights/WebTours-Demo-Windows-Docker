# escape=`
# Base Image
FROM mcr.microsoft.com/windows/servercore:ltsc2019

# Metadata indicating an image maintainer
LABEL maintainer="NaveenKumar Namachivayam" `
      website="www.qainsights.com"

ENV PERL_VERSION 5.10.1.0
ENV PERL_SHA1 0df90abe8388be2af2d66fd8aafb61249391adef

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# Downloading compatible Strawberry Perl, Extracting, and Configuring PATH
RUN Invoke-WebRequest $('http://strawberryperl.com/download/{0}/strawberry-perl-{0}.zip' -f $env:PERL_VERSION) -OutFile 'perl.zip' -UseBasicParsing ; `
    if ((Get-FileHash perl.zip -Algorithm sha1).Hash -ne $env:PERL_SHA1) { Write-Error 'SHA1 mismatch' } ; `
    Expand-Archive -Path perl.zip -DestinationPath C:\ -Force ; `
    rm perl.zip ; `
    setx /M PATH $('C:\c\bin;C:\perl\bin;{0}' -f $env:PATH)

# Copying WebTours and Shell Script to container
COPY / /

# Extracting Web Tours
RUN Expand-Archive -Path c:\WebTours.zip -DestinationPath c:\WebTours -Force

# Exposing the default port 1080 for Web Tours
EXPOSE 1080
USER ContainerAdministrator

# Setting up work dir
WORKDIR C:\WebTours

# Entrypoint to run StartServer.bat
ENTRYPOINT [ "powershell.exe","/entrypoint.ps1" ]