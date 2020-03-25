## Download GraphDB from Ontotext

Download as a stand-alone server free version (zip)at https://ontotext.com/products/graphdb/ and place it in the root of this git repository.

## Build

Provide the version of the downloaded GraphDB installation file, e.g. for version `9.1.1`

```bash
docker build -t graphdb:9.1.1 --build-arg version=9.1.1 .
```

## Run

```bash
docker run -d --name graphdb -p 7200:7200 -v /data/graphdb:/opt/graphdb/home -v /data/graphdb-import:/root/graphdb-import graphdb
```

> Access at http://localhost:7200

> Import folder shared in `/data/graphdb-import` and GraphDB home folder shared in `/data/graphdb`

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