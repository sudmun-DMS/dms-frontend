import Vue from 'vue'
import App from './App.vue'
import VueProgressBar from 'vue-progressbar'

const options = {
  color: '#0099ff',
  failedColor: '#ff3200',
  thickness: '5px',
  transition: {
    speed: '0.2s',
    opacity: '0.6s',
    termination: 300
  },
  autoRevert: true,
  location: 'top',
  inverse: false
}

Vue.use(VueProgressBar, options)


new Vue({
  el: '#app',
  render: h => h(App)
})
