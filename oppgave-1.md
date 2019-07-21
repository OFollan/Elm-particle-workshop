# Oppgave 1

## Trille terning \(woopetiwoopwoop\)

Før vi er klare for å bruke randomness til å mekke nå sjuki stuff, må vi hente fram støttehjula. For å dra inn såkalte "skitne" elementer inn i det rene og funksjonelle miljøet Elm er, trenger man å ta i bruk noe som kalles Commands. Man kan tenke på Commands som en slags "oppskrift" på en oppgave som Elm gir videre til en ekstern verden. Dette gjør at vi kan skrive funksjoner som returnerer oppskrifter \(Commands\). Altså returnerer våre Elm funksjoner samme resultat hver gang, selve oppskriften. Hvordan verden utenfor tolker og behandler oppskriften er en helt annen sak.

I dag skal vi titte på et eksempel på en slik funksjon som returnerer Commands, nemlig Random.generate, som ser slik ut.

```text
Random.generate : (a -> msg) -> Generator a -> Cmd msg
```

Oi, dette så litt komplisert ut. Men vi ser tydelig ut ifra deklarasjonen \(Type Annotation\) at den returnerer en Cmd, kort for Command. Vi ser også type-variabelen `a`, som er en generisk plassholder. Her kan man gi funksjonen hva som helst, så lenge man bruker den samme typen på begge plassene der `a` står. Argument nummer to,  `Generator a`, er en funksjon som beskriver hvordan man ønsker å generere tilfeldige verdier av typen `a`. Det finnes mange generatorer man kan benytte seg av, for eksempel Random.int

```javascript
myGenerator : Generator Int
myGenerator = Random.int 1 6
```

Denne gjør nøyaktig det man forventer. Dette er en generator som genererer et tilfeldig heltall mellom 1 og 6. Nå som vi har definert `myGenerator`, kan denne brukes i funksjonen `Random.generate` som parameter nummer 2. Nå mangler vi bare parameter nummer 1, så har vi en funksjon vi kan bruke for å lage Commands!

Vi ser at parameter nummer 1 er en funksjon \(absolutt ALT i Elm er funksjoner, men vi får spare denne diskusjonen til senere\), og denne funksjonen forventer å få inn en `a` og produsere en `msg`  



Så er det opp til "omverdenen" å omsette denne oppskrifta til et resultat.



