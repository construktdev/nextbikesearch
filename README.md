# 🚲 NextBikeSearch 

A mostly vibe-coded Python script and web app designed to locate specific Nextbikes by their unique identification number. 

![Map interface showing a pinned MobiBike location in Dresden](https://cdn.construkter.de/nextbike-screenshot.png)

> **⚠️ DISCLAIMERS & IMPORTANT INFO**
> * **Not Affiliated:** This project is not affiliated with NextBike. Visit the [official NextBike Dresden page](https://www.nextbike.de/dresden/de/standorte/).
> * **Location Limited:** It only works with MobiBikes (Dresden). / *Es funktioniert nur mit MobiBikes (Dresden).*
> * **Vibe-Coded:** My effort here was minimal; AIs handled most of the coding. / *Mein Aufwand hierbei war minimal. Das meiste haben KIs übernommen.*

---

## 🛠️ Usage 

You can run this project in three different ways depending on your workflow. 

### Python Script (Terminal)

1. Start the Python script in your terminal.
2. Enter your desired bike number when prompted (e.g., `930209`).
3. The script will output the location data if the bike is found.

### Web Version (Browser)

1. Open the `web.html` file in any modern web browser.
2. Enter your desired bike number (e.g., `930209`) into the search field.
3. The application will pinpoint the bike's exact location on an interactive map.

### Docker (Container)

#### Manual (more control)

1. Clone this repository to your local machine.
2. Open your terminal and `cd` into the cloned repository.
3. Build the Docker image by running: `docker build --tag <your-tag-name> .` (e.g., `construkter/nextbikesearch:latest`).
4. Start the container by running: `docker run --detach --publish 80:80 --name nbs <your-tag-name>`.
5. Open your browser and visit `http://localhost`. 
   * **Note on Ports:** If you change the publish port (e.g., `--publish 8080:80`), make sure to visit `localhost:8080` instead.
  
#### Automatic (beginners)

1. Copy or download `auto-deploy.sh`
2. Run it with `sh auto-deploy.sh`
3. Enter host port (the port you will be visiting on your local machine)
4. Enter the name for the container (must be unique to the other containers)
5. Visit `localhost:<your-port>`
