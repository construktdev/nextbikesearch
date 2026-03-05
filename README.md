# nextbikesearch
Mostly vibe coded Python Script to search Nextbikes by Number

## Usage

### Python Script

1. Start Script
2. Enter your desired number (e.g. 930209)
3. If the script finds it, it'll let you know

### Web Version

1. Open the `web.html` file
2. Enter your desired number (e.g. 930209)
3. If it's found it will be pin pointed on the map

### Docker

1. Clone Repo
2. `cd` into the cloned repo
3. Run `docker build --tag <tag> .` (Replace <tag> with tag/name (e.g. `construkter/nextbikesearch.latest`))
4. Once it's built start with `docker run --detach --publish 80:80 --name nbs <tag>`
    - You can also use other ports (e.g. 8080:80)
5. Open your Browser and visit `localhost:<port>` (<port> should be the first number you wrote after --publish)

> [!IMPORTANT]
> It only works with MobiBikes (Dresden) <br>
> Es funktioniert nur mit MobiBikes (Dresden)

> [!WARNING]
> Mein Aufwand hierbei war minimal <br>
> Das meiste haben KIs übernommen
