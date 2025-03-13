# How to install this project
- clone the project with git clone url
- npm init -y    to instsall all packages and dependencies
- npm start     to start the project on your localhost


# Docker file
- to build the image use this
  `docker build -t my-node-app .`
  - to runt the image and simultanesouly create container for it
     `docker run -d -p 5000:5000 --name node-container my-node-app`
      - `-d` distress mode means run in background.
      - `-p 5000:5000` port assign
      - `--name node-container` assign name to container
      - `my-node-app` name of image
