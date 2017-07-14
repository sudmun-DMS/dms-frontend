<template>
  <div id="app">
    <label for="from">Enter DOC ID DEPLOY LA</label>
    <br />
    <input type="text" v-model="docId" name="docID" id="docID" style="height: 20px; width: 200px;"/>
    <br />
    <button id="document-search-submit" v-on:click="submitDoc(docId)">Submit</button>
    <br /><br />
    <div v-if="isError" id="errorMSG">
   {{msg}}
    </div>
    <div v-if="!isError" >
    <div class="" id="docIdResult">
    DOC ID: = {{resultMsg.docID}}
    </div>
    <div class="" id="link">
    link: = {{resultMsg.link}}
    </div>
    <div class="" id="status">
    Status: = {{resultMsg.status}}
    </div>
    <div class="" id="user">
    User: = {{resultMsg.user}}
    </div>
    <div class="" id="description" >
    Description: = {{resultMsg.description}}
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
         link:'',
         user:'',
         status:'',
         description:''
       },
       isError:true
    }
  },
  methods: {
    success (docData) {
      //this.msg = "DOC ID: = " + docData.data.body.id + "link: =" + docData.data.body.link
      this.resultMsg.docID = docData.data.body.id 
      this.resultMsg.link = docData.data.body.link
      this.resultMsg.user = docData.data.body.user
      this.resultMsg.status = docData.data.body.status
      this.resultMsg.description = docData.data.body.description
    },
    failed (docData) {
      let errorCode = docData.data.header.code
      switch (errorCode){
        case 404: 
          this.msg = "DOC ID NOT FOUND" 
          break;
        case 500: 
          this.msg = "Please check Database connection" 
          break;
        default: 
          this.msg = "Error. Please check with administrator";
      }
      
    },
    submitDoc (id) {
      if (!id.match(/\S/)){
         this.msg = "Please Enter DOC ID!!!"
      }
      else 
      {
        let baseURL = "http://188.166.218.202"         
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
          console.log(response)
        })
        .catch(error => {
          console.log(error)
          alert(error)
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
