# demowebWithsimpleDocker

**Name:** GitHub Copilot  
## Requirements

- **Docker** (version 20.x or higher recommended)  
  Install from: [https://docs.docker.com/get-docker/](https://docs.docker.com/get-docker/)  

- **Docker Compose** (version 1.27.x or higher recommended)  
  Install from: [https://docs.docker.com/compose/install/](https://docs.docker.com/compose/install/)  

- **Node.js** (version 16.x or higher recommended)  
  Required if you want to run or build the React frontend outside Docker.  
  Install from: [https://nodejs.org/](https://nodejs.org/)  

- **React** (frontend framework)  
  Used for building the frontend UI. Comes installed via `package.json` dependencies.

- Basic knowledge of command line / terminal to run Docker and Node commands  

> Note: This project is primarily designed to run inside Docker containers. Node.js and React are only required if running or developing the frontend locally outside Docker.


## How to Run the Application with Docker Compose

1. Ensure you have [Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/install/) installed.  
2. Clone this repository:
    ```bash
    git clone https://github.com/kiwabc123/demowebWithsimpleDocker
    cd portalDemo
    ```
3. Build and start the application:
    ```bash
    docker-compose up --build
    ```
4. The application will be available at [http://localhost:8000](http://localhost:8000) (or the port specified in `docker-compose.yml`).

## Technical Choices & Architecture

- **Backend:** Python (FastAPI)  
- **Containerization:** Docker for consistent environment  
- **Orchestration:** Docker Compose for managing multi-container setup (app + database)  
- **Assumptions:**  
  - Application is stateless  
  - Environment variables are set in `docker-compose.yml`  


## 🔄 Resetting the Environment

To fully reset your app (including database data), run:

```bash
docker-compose down -v
docker-compose up --build --force-recreate -d
