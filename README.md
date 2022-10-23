# My-Docker-Images
- A collection of my frequently used docker images.
- These are used in my projects, applications testing and as my primary workspace. 

# Instructions to setup the docker image.

### 1. **Make sure to run all the commands from the project root directory.**

```sh
cd /My-Docker-Images
```

### 2. **Select an Image from the list.**

```sh
MyDockerImage="ros-melodic"
```

### 3. **Build the docker image 'leetcode' from the docker file leetcode.Dockerfile.**

```sh
docker build -t $MyDockerImage -f $MyDockerImage/$MyDockerImage.Dockerfile $MyDockerImage
```        
*```Building the image may take 5 to 15 mins. This is done only for the first time.```*

### 4. **Run a container called leetcode from the built image.**

*```  For windows cmd  ```*
```sh      
docker run --rm -d -t --name $MyDockerImage -v %cd%:/home/mount $MyDockerImage 
```        

*```For Mac terminal OR windows powershell```*
```sh
docker run --rm -d -t --name $MyDockerImage -v ${PWD}:/home/mount $MyDockerImage
```

*``` For linux terminal ```*
```sh
docker run --rm -d -t --name $MyDockerImage -v $(pwd):/home/mount $MyDockerImage
```

### 5. **Open a interactive terminal from the running leetcode container.**

```sh
docker exec -ti $MyDockerImage bash
```


