
# ZPA Connector Image

This repository contains a Docker container image for Zscaler Private Access (ZPA) Connector based on UBI 8.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Configuration](#configuration)

## Introduction

The ZPA Connector facilitates secure communication between your applications and the Zscaler Private Access (ZPA) cloud. This image is built on UBI 9, ensuring compatibility and security.

## Features

- Based on UBI 9
- Automated deployment and configuration
- Secure and scalable

## Prerequisites

Before you begin, ensure you have the following:

- Docker installed
- Access to Zscaler Private Access (ZPA) platform

## Installation

Clone the repository and build the Docker image:

```bash
git clone https://github.com/truestory1/zpa-connector-image.git
cd zpa-connector-image
docker build -t zpa-connector .
```

## Usage

Run the container with the necessary environment variables:

```bash
docker run -d   -e ZPA_CLOUD_NAME=<your_cloud_name>   -e ZPA_CLIENT_ID=<your_client_id>   -e ZPA_CLIENT_SECRET=<your_client_secret>   zpa-connector
```

## Configuration

Configuration details can be found in the [ZPA Connector Deployment Guide](https://help.zscaler.com/zpa/connector-deployment-guide-centos-oracle-and-redhat).
