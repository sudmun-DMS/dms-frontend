<template>
  <div id="app">
 <!--     
    <img src="./assets/logo.png">
    <h1></h1>
    <h2>Essential Links</h2>
    <ul>
      <li><a href="https://vuejs.org" target="_blank">Core Docs</a></li>
      <li><a href="https://forum.vuejs.org" target="_blank">Forum</a></li>
      <li><a href="https://gitter.im/vuejs/vue" target="_blank">Gitter Chat</a></li>
      <li><a href="https://twitter.com/vuejs" target="_blank">Twitter</a></li>
    </ul>
    <h2>Ecosystem</h2>
    <ul>
      <li><a href="http://router.vuejs.org/" target="_blank">vue-router</a></li>
      <li><a href="http://vuex.vuejs.org/" target="_blank">vuex</a></li>
      <li><a href="http://vue-loader.vuejs.org/" target="_blank">vue-loader</a></li>
      <li><a href="https://github.com/vuejs/awesome-vue" target="_blank">awesome-vue</a></li>
    </ul> -->
    <label for="from">Enter DOC ID</label>
    <br />
    <input type="text" name="docID" id="docID" style="height: 20px; width: 200px;"/>
    <br />
    <button id="document-search-submit" v-on:click="submitDoc()">Submit</button>
    <br />
    {{msg}}

  </div>
</template>

<script>
import Axios from 'axios'
export default {
  
  name: 'app',
  data () {
    return {
       msg: 'Welcome to DMS App'
    }
  },
  methods: {
    submitDoc () {
      Axios.get("http://172.17.35.66:3000/saps/1")
      //Axios.get("http://172.17.35.66:8080/document/1")
      //.then( (response)=>{
        //let docID = (response.data.id + " " + response.data.user + " " + response.data. + " " +response.data.description)  
        //this.msg = response
        //alert(docID)
        alert (" " + "id:1, link:http://google.com")
        //console.log(response)
      //})
      
    }
  }
}
</script>

<style lang="scss">
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}

h1, h2 {
  font-weight: normal;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  display: inline-block;
  margin: 0 10px;
}

a {
  color: #42b983;
}
</style>
