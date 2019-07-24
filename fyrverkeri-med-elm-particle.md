---
description: I denne seksjonen skal vi se på Elm-particle-biblioteket.
---

# Fyrverkeri med Elm-particle

## Generativ kunst

Det er mye gøy en kan gjøre med tilfeldighet. For eksempel er tilfeldighet i diverse former hovedingrediensen i _generativ kunst:_ å lage kunstverk ved hjelp av algoritmer. Sjekk for eksempel ut noen av de kule bildene til bekkeren Kjetil [her](https://www.kode24.no/guider/kodekunst/70911037). 

### Elm-particle

I denne delen av workshopen skal vi begynne å bruke Elm-particle biblioteket. Dette biblioteket hjelper oss med å animere, you guessed it, partikler. Han som har laget biblioteket, Brian Hicks, har en [talk](https://www.youtube.com/watch?v=goL7LeDHFi4) fra Oslo Elm Day der han snakker om dette.

### Oppgave

1. Gå inn i fila `index.js` og kommenter ut linja under Oppgave 1, og fjern kommentar under Oppgave 2.
2. Gå tilbake til `localhost:3000` og se at du har fått et helt nytt skjermbilde!
3. Avfyr en rakett. Litt kjedlig enda, right?
4. Gå deretter til src/Oppgave2/Fireworks.elm og prøv deg fram med å generer random verdier for å få til litt annerledes fyrverkeri.  



{% hint style="info" %}
Et par hint til å komme i gang med biblioteket.

Du har tilgang til en drøss med funksjoner av typen   
[withSpeed](https://package.elm-lang.org/packages/BrianHicks/elm-particle/latest/Particle#withSpeed) : Generator Float -&gt; Generator \([Particle](https://package.elm-lang.org/packages/BrianHicks/elm-particle/latest/Particle#Particle) a\) -&gt; Generator \([Particle](https://package.elm-lang.org/packages/BrianHicks/elm-particle/latest/Particle#Particle) a\)  
som setter en hastighet på en partikkel. Tilsvarende fins   
[withDirection](https://package.elm-lang.org/packages/BrianHicks/elm-particle/latest/Particle#withDirection) : Generator Float -&gt; Generator \([Particle](https://package.elm-lang.org/packages/BrianHicks/elm-particle/latest/Particle#Particle) a\) -&gt; Generator \([Particle](https://package.elm-lang.org/packages/BrianHicks/elm-particle/latest/Particle#Particle) a\)

Se på linje 28 i Oppgave2/Fireworks.elm for å få et hint til hvordan disse funksjonene kan brukes!  
{% endhint %}



### Bonus!

1. Gå inn i fila `index.js` og kommenter inn/ut.
2. Gå inn i src/Ekstraoppgave/Main.elm og få til noe kult! Vi prøvde å leke litt her, men vi forventer og håper at dere får til noe mye fetere!



