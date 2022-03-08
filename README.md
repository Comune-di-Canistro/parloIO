# ParloIO

Il progetto nasce per facilitare la comunicazione di allerte meteo e/o notizie generiche da parte delle istituzioni con
il cittadino sfruttando i canali App IO e Telegram.

| app/msg           |  App IO  |  Telegram  |
|-------------------|:--------:|:----------:|
| Allerte Meteo     |    X     |     X      |
| Notizie Generiche |          |     X      |

## Installazione con Docker

### Avvio tramite Dockerfile

---

Viene fornito il file **Dockerfile** per un avvio rapido del progetto. Per un corretto funzionamento procedere come
segue:

- Eseguire il pull del repository
- Posizionarsi nella cartella principale del progetto
- Eseguire i seguenti comandi

    mvn package

    docker build -t parloIO:"<versione>" .

Creare un *volume* con il comando:

    docker volume create "<nome_volume>" &> /dev/null || true

Esecuzione dell'immagine:

    docker run -d --name "<nome_container>" --mount type=volume,source="<nome_volume>",target="/data" -p "<porta>:8080" parloIO:"<version>"

Al primo avvio, collegarsi al DB creato ed eseguire la query nel file *resources/db/changelog/changes/change_0.0.1.xml*

Il servizio sarà in ascolto sulla porta esposta sull'endpoint *http://...:porta/login*

### Variabili d'ambiente

---
Per una corretta esecuzione del progetto è necessaria la corretta impostazione di alcune variabili d'ambiente

    docker run [...] -e VAR1=value1 -e VAR2=value2 [...]

| Variabile                      | Obbligatorio |        Default        | Descrizione                                     |
|--------------------------------|:------------:|:---------------------:|-------------------------------------------------|
| `MUNICIPALITY_NAME`            |      X       |                       | Nome dell'ente                                  |
| `MUNICIPALITY_SUBTITLE`        |              |                       | Descrizione ente o portale                      |
| `MUNICIPALITY_LOGO`            |              |                       | Link al logo dell'ente (preferibilmente .png)   |
| `MUNICIPALITY_URL`             |              |                       | Link al sito web dell'ente                      |
| `AFFERENT_ADMINISTRATION_NAME` |              |                       | Nome dell'amministrazione afferente             |
| `AFFERENT_ADMINISTRATION_URL`  |              |                       | Link al sito web dell'amministrazione afferente |
| `DB_NAME`                      |              |      parloIO.db       | Nome del database                               |
| `BASE_URL`                     |              | http://localhost:8080 | Base url del portale                            |
| `PAGE_SIZE`                    |              |           5           | Elementi per pagina in tabella                  |
