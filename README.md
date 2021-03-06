# WebTours-Demo-Windows-Docker
This docker file helps you to run Web Tours application in Windows container. Web Tours is the sample application to learn Micro Focus LoadRunner Professional.

## Prerequisite

Before you begin building this image, you must download Web Tours application from [Micro Focus Marketplace](https://marketplace.microfocus.com/appdelivery/content/web-tours-sample-application).

* Download only the WebTours.zip file
* Docker for Windows

DO NOT download the Strawberry Perl installation package.

## Build

* Clone this repository
* Place the downloaded WebTours.zip inside the repository
* Launch powershell or cmd prompt to build this image

You must build this image to run Web Tours application. This image is not available in Docker Hub.

`docker build -t webtours-demo .`

## How to run Web Tours docker image in Windows?

Once the image is built, you can issue below command to run the docker container.

`docker run -d -p 1080:1080 webtours-demo`

## Validate Web Tours Container

Issue the below command to check the running container.

`docker ps`

![WebTours-Docker-Check](WebTours-Docker-Check.png)

## Validate Web Tours Sample Application

By default Web Tours opens 1080 port in the container. Open your browser and launch http://127.0.0.1:1080/WebTours/.

![WebTours-HomePage](WebTours-HomePage.png)

## Stopping the container

Issue the below command to stop the container.

`docker stop <container-id>`

# Donate
<a target="_blank" href="https://www.buymeacoffee.com/qainsights"><img src="https://cdn.buymeacoffee.com/buttons/bmc-new-btn-logo.svg" alt="Buy me a tea"><span style="margin-left:15px;font-size:28px !important;">Buy me a tea</span></a>