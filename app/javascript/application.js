import "@hotwired/turbo-rails";
import "./controllers";
import consumer from './channels/consumer';
import CableReady from "cable_ready";
import mrujs from "mrujs";
import { CableCar } from "mrujs/plugins";
import { Notyf } from 'notyf';
import * as ActiveStorage from "@rails/activestorage"
import "trix"
import "@rails/actiontext"

ActiveStorage.start()
mrujs.start({
  plugins: [
    new CableCar(CableReady)
  ]
})

window.Notyf = Notyf
