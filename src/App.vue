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
    <input type="text" v-model="docId" name="docID" id="docID" style="height: 20px; width: 200px;"/>
    <br />
    <button id="document-search-submit" v-on:click="submitDoc(docId)">Submit</button>
    <br />
    <div v-if="isError">
   {{msg}}
    </div>
    <div v-if="!isError">
    <div class="">
    DOC ID: = {{resultMsg.docID}}
    </div>
    <div class="">
    link: = {{resultMsg.link}}
    </div>
    </div>

  </div>
</template>

<script>
import Axios from 'axios'
export default {
  
  name: 'app',
  data () {
    return {
       msg: 'Welcome to DMS App',
       docId:'',
       resultMsg : {
         docID:'',
         link:''
       },
       isError:true
    }
  },
  methods: {
    success (docData) {
      this.msg = "DOC ID: = " + docData.data.body.id + "link: =" + docData.data.body.link
      this.resultMsg.docID = docData.data.body.id 
      this.resultMsg.link = docData.data.body.link
    },
    failed (docData) {
      this.msg = "DOC ID NOT FOUND"
    },
    submitDoc (id) {
      if (id == ""){
         this.msg = "Please Enter DOC ID!!!"
      }
      else 
      {
        let baseURL = "http://172.17.35.66:8080" 
        Axios.get(baseURL + "/document/"+id)
        .then( (response)=>{
          let returnCode = response.data.header.code
          if (returnCode == "200") {
            this.success (response)
            this.isError = false
          } else {
            this.isError = true
            this.failed (response)
            }
          //alert(returnCode)
          // let docID = (response.data.id + " " + response.data.user + " " + response.data. + " " +response.data.description)  
          //this.msg = response
          // alert(docID)
          // alert (" " + "id:3, link:http://archive.xom.com/jlkajsdfjiwep;oij/~kjkljdfj/new_doc_3.docx")
          
          // this.msg = ("id:3 \n link:http://archive.xom.com/jlkajsdfjiwep;oij/~kjkljdfj/new_doc_3.docx") 
          console.log(response)
        })
      }
      
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
