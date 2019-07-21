import './main.css';
import { Elm } from './Oppgave2/Fireworks.elm';
import registerServiceWorker from './registerServiceWorker';

Elm.Main.init({
  node: document.getElementById('root')
});

registerServiceWorker();
