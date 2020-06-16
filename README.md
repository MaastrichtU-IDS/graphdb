## Download GraphDB from Ontotext

Download as a stand-alone server free version (zip)at https://ontotext.com/products/graphdb/ and place it in the root of this git repository.

## Build

Provide the version of the downloaded GraphDB installation file at build ⚙️

```bash
docker build -t graphdb --build-arg version=9.3.0 .
```

> Using the GraphDB installation file `graphdb-free-9.3.0-dist.zip`

## Run

```bash
docker run -d --name graphdb -p 7200:7200 -v /data/graphdb:/opt/graphdb/home -v /data/graphdb-import:/root/graphdb-import graphdb
```

> Access at http://localhost:7200

> Import folder shared in `/data/graphdb-import` and GraphDB home folder shared in `/data/graphdb`

## Use docker-compose

### Preload repository

Go to the `preload` subfolder to run the GraphDB preload

```bash
cd preload/
```

By default it will:

* Create a repository defined in the `graphdb-repo-config.ttl` file (can be changed manually)

* upload a test ntriple files in the `graphdb-preload/import` subfolder. Feel free to change the import folder path in the `docker-compose.yml`

Change the filepath in the `preload/.env` file:

```bash
IMPORT_FOLDER=./import
REPOSITORY_CONFIG_FILE=./graphdb-repo-config.ttl
```

Build and run:

```bash
docker-compose build
docker-compose up -d
```

> GraphDB data will go to `/data/graphdb`

### Start GraphDB

To start GraphDB run the following **from the root of the git repository**:

```bash
docker-compose up -d
```

> It will use the repo created by the preload in `/data/graphdb/data`

## Create GraphDB repo and users

- Go to http://localhost:7200/
- Setup > Repositories > Create new repository
  - Repository ID: **test** (or whatever you want it to be, but you will need to change data2services default config)
  - Check `Use context index`
  - Create
- Setup > Users and access
  - Edit **admin** user > Enter a new **password** > Save
  - Click on `Security is off` 
  - Create new user
    - User name: **import_user**
    - Password: **test**
    - Repository rights > Write right on `Any data repository`
    - Click `Create`

## See also

Ontotext GraphDB official Docker images for free version: https://github.com/Ontotext-AD/graphdb-docker

Ontotext GraphDB on DockerHub: https://hub.docker.com/r/ontotext/graphdb/

GraphDB inspired by https://github.com/manasRK/graphdb-free