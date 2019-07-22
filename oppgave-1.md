# Oppgave 1

## Trille terning \(woopetiwoopwoop\)

Før vi er klare for å bruke randomness til å mekke nå sjuki stuff, må vi hente fram støttehjula. For å dra inn såkalte "skitne" elementer inn i det rene og funksjonelle miljøet Elm er, trenger man å ta i bruk noe som kalles Commands. Man kan tenke på Commands som en slags "oppskrift" på en oppgave som Elm gir videre til en ekstern verden. Dette gjør at vi kan skrive funksjoner som returnerer oppskrifter \(Commands\). 

For eksempel, man kan se for seg en verden der Ragnhild drar på en restaurant og alltid returnerer taco når en kelner kaller funksjonen

```text
RagnhildsBestilling : String -> String 
RagnhildsBestilling kelnerensAnbefaling 
    = "TACO"
```

Dette er en helt prima Elm-funksjon. Men, det kan sammenlignes med en Command, fordi Ragnhild kan på ingen måte garantere at den tacoen hun får servert er like god som på nabo-restauranten. Ragnhild har oppført seg eksemplarisk, og gir samme output ved samme input, men den påfølgende middagsopplevelsen er utenfor hennes kontroll! 

På denne måten bryter ikke dette med det funksjonelle kravet om at samme funksjon med samme input alltid returnerer det samme, siden Commanden er lik, det er bare omverdenen som reagerer forskjellig på Commanden. 

I dag skal vi titte på et eksempel på en slik funksjon som returnerer Commands, nemlig Random.generate, som ser slik ut.

```text
Random.generate : (a -> msg) -> Generator a -> Cmd msg
```

Oi, dette så litt komplisert ut. Men vi ser tydelig ut ifra deklarasjonen \(Type Annotation\) at den returnerer en Cmd, kort for Command. Vi ser også type-variabelen `a`, som er en generisk plassholder. Her kan man gi funksjonen hva som helst, så lenge man bruker den samme typen på begge plassene der `a` står. Argument nummer to,  `Generator a`, er en funksjon som beskriver hvordan man ønsker å generere tilfeldige verdier av typen `a`. Det finnes mange generatorer man kan benytte seg av, for eksempel Random.int

```javascript
myGenerator : Generator Int
myGenerator = Random.int 1 6
```

Denne gjør nøyaktig det man forventer. Dette er en generator som genererer et tilfeldig heltall mellom 1 og 6. Nå som vi har definert `myGenerator`, kan denne brukes i funksjonen `Random.generate` som parameter nummer 2, der vår generiske type `a` nå er spesifisert som `Int`. Nå mangler vi bare parameter nummer 1, så har vi en funksjon vi kan bruke for å lage Commands!

Vi ser at parameter nummer 1 er en funksjon \(absolutt ALT i Elm er funksjoner, men vi får spare denne diskusjonen til senere\), og denne funksjonen forventer å få inn en `a` , som nå er `Int`, og produsere en `msg`. Dette er noe vi har sett før! Fra workshop'ene tidligere i sommer så vi på 

```text
type Msg = CardClicked Card
```

Dette er omtrent akkurat hva vi trenger nå. Vi trenger en Msg som har en konstruktør som tar inn en Int.

```
type Msg = NewDiceFace Int
```

Nå er vi nesten i mål! Konstruktøren  `NewDiceFace` er en funksjon  `(Int -> Msg)`  og `myGenerator` er av typen `Generator Int`.  Da gjenstår det bare å gi disse parameterne til funksjonen `Random.generate`  og vi har lagd vår første Command!

Etter at Commanden er utført av omverdenen, snapper Elm runtimen opp resultatet i `Update`, og da nettopp i formen av en `Msg` av typen `NewDiceFace`.

### Oppgave

1. Klon [repoet ](https://github.com/OFollan/Elm-particle-workshop)og kjør programmet med `elm-app start`.  Da skal du få opp terning som alltid viser 1. 
2.  Gå deretter til src/Oppgave1/Main.elm og skriv om fila slik at vi får tilfeldig tall når vi triller terningen.   

