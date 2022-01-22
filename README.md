# MyBonJob - Clean Architecture
```
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
https://levelup.gitconnected.com/fix-password-authentication-github-3395e579ce74
```

## clone le projet
Faite un cd dans votre répertoire www/, puis git clone le projet
```bash
$ git clone git@gitlab.com:bocasay/symfony/onerba.git
```


## Build du docker-compose
Pour build et up le service
```bash
# mettez-vous dans le dossier racine du projet
$ ./docker/php/docker-compose-1.23 -f docker-compose.yml -f local.yml up --build -d
```
