import './main.css';
// Oppgave 1
import { Elm } from './Oppgave1/Main.elm';

//Oppgave 2
// import { Elm } from './Oppgave2/Fireworks.elm';

//Ekstraoppgave
// import { Elm } from './Ekstraoppgave/Main.elm';

import registerServiceWorker from './registerServiceWorker';

Elm.Main.init({
  node: document.getElementById('root')
});

registerServiceWorker();
