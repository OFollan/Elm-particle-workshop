# Oppgave 1

## Trille terning \(woopetiwoopwoop\)

Før vi er klare for å bruke randomness til å mekke nå sjuki stuff, må vi hente fram støttehjula. For å få dratt randomness \(og andre skitne elementer som for eksempel HTTP-kall\) trenger man å ta i bruk noe som kalles Commands. En måte å tenke på Commands, er at de er en slags "oppskrift på en oppgave" som Elm gir videre til en ekstern verden. Dette gjør at vi kan skrive funksjoner som returnerer oppskrifter \(Commands\).  

Random.generate er en funksjon som returnerer en Command, og har denne signaturen.

```text
Random.generate : (a -> msg) -> Generator a -> Cmd msg
```

Oi, dette så litt komplisert ut. 

```javascript
value : Random.Generator Int
value = Random.int 1 6 
```



Så er det opp til "omverdenen" å omsette denne oppskrifta til et resultat.

```
$ give me super-powers
```

{% hint style="info" %}
 Super-powers are granted randomly so please submit an issue if you're not happy with yours.
{% endhint %}

Once you're strong enough, save the world:

```
// Ain't no code for that yet, sorry
echo 'You got to trust me on this, I saved the world'
```



