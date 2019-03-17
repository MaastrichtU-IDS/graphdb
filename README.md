## Download GraphDB from Ontotext

Download as a stand-alone server (zip): https://ontotext.com/products/graphdb/



## Build GraphDB

```shell
docker build -t "graphdb:8.8.1" .
docker run -it "graphdb:8.8.1" .

# Alex's script to run it
./run.sh
```



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

