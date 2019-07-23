import './main.css';
import { Elm } from './Ekstraoppgave/Main.elm';
import registerServiceWorker from './registerServiceWorker';

Elm.Main.init({
  node: document.getElementById('root')
});

registerServiceWorker();
