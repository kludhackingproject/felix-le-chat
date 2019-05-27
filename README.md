# README

PROTOCOLE DU SOIR : 

```$ git checkout dev-tonnom```

 => #Branch DEV-TONNOM
```$ git merge [les branches perso de travail de ta journée]```
```$ git push origin dev-tonnom```
```$ git checkout development```

=> #Branch DEVELOPMENT
```$ git merge dev-tonnom```
```$ git push origin development```
```$ git checkout master```

=> #Branch MASTER
```$ git merge development```
```$ git push origin master```
```$ git push heroku master```

PROTOCOLE DU MATIN : 

```$ git checkout master```

=> #Branch MASTER  
```$ git pull origin master```
```$ git checkout development```

=> #Branch DEVELOPMENT 
```$ git merge master```
```$ git checkout dev-tonnom```

=> #Branch DEV-TONNOM
```$ git merge master```
