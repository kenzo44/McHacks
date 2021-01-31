<template>
<card>
  <div class="app">
    <div class="container">
      <div class="text-div">
      <h3>Daily Behaviors Activity Tracker</h3>
      <p class="some-text">Towards Moves – Actions that bring us closer to the person we truly want to be.
        These are actions that bring us closer to the people and experiences that matter most to us. </p>
      <p class="some-text">
        Away Moves – Actions that pull us off-course or further away from the person we truly want to be in a situation.
        In other words, doing things that will make a situation worse.</p>
      </div>
      <div class="row header">
        <h1 class="col s6 offset-s3 center-align teal-text">What did you do today?</h1>
      </div>
      <div class="row">
        <form @submit.prevent="submitTodo" class="col s6 offset-s3">
          <div class="input-field">
            <i class="material-icons prefix"></i>
            <input required placeholder="Create new task..." type="text" v-model="newTodo" id="icon_prefix2" class="inputarea">
            <input type="submit" value="Add" class="nice-btn">
          </div>
        </form>
      </div>
      <div class="row" style="color: #333;">
        <div class="list">
        <ul class="collection">
          <li class="collection-item" v-for="todo in todos" :key="todo.id">
            <p>
              <label>
                <span class="texty">{{todo.title}} </span>
                  <select name = "type" id = "type">
                    <option value = "towards">Towards</option>
                    <option value = "away">Away</option>
                  </select>
                <span style="font-size: 25px; padding: 40px;">
                  <a @click.prevent="deleteTodo(todo)">
                    <i class="material-icons right delete-text">X</i>
                  </a>
                </span>
              </label>
            </p>
          </li>
          </ul>
          <div class="submission">
        <input type="Submit" value ="Upload to DB" @click.prevent="submit()" class="nice-btns">
        </div>
      </div>
      </div>
    </div>
  </div>
  </card>
</template>
<script>
import * as fuck from '../js/sripts.js'
export default {
  name: 'app',
  data() {
    return {
      todos: [],
      newTodo: '',
    };
  },
  watch: {
    todos: {
      handler() {
        localStorage.todos = JSON.stringify(this.todos);
      },
      deep: true,
    },
  },
  mounted() {
    if (localStorage.todos) {
      this.todos = JSON.parse(localStorage.todos);
    }
  },
  methods: {
    submitTodo() {
      this.todos.push({
        title: this.newTodo,
        done: false,
      });
      this.newTodo = '';
    },
    deleteTodo(todo) {
      console.log('fuck')
      const todoIndex = this.todos.indexOf(todo);
      this.todos.splice(todoIndex, 1);
    },
    submit() {
      console.log("FUCK")
      this.todos.forEach(element =>{
        console.log(element.title)
        var data = {
          score: 2,
          userid: 69,
          description: element.title,
          datestamp: '20110911'
        }
      fuck.postTask(69, data)
        })
      if(this.todos.length == 0 ) {
        this.$notify({
          group: 'foo',
          title: 'Nothing to upload',
        })
      } else {
        while(this.todos.length != 0) {
          this.deleteTodo(0)
        }
        this.$notify({
          group: 'foo',
          title: 'Successfully uploaded to DB',
        })
      }
    },
  },
};
</script>
<style lang="scss">


.header{
  margin-top: 75px;
}
.inputarea{
  width: 60%;
  max-width: 45rem;
  padding: 1em;
  margin: 1em auto;
  overflow: auto;
  font-size: 20px;
  background-color: #fff;
  box-shadow: 0px 0.25rem 1rem rgba(0,0,0,0.25);
  line-height: 24px;
}

.better-way{
  list-style-type: none;
  padding: 30px;
  font-size: 30px;
}
.nice-btn {
  margin-left: 50px;
  width: 10em;
  height: 4.5em;
  font-size: 15px;
  line-height: 24px;
  margin-top: -3px;
  box-shadow: 0px 0.25rem 1rem rgba(0,0,0,0.25);
  background-color: #340088;
  color: #fff;
  border: none;
  border-radius: 5px;
}
.texty{
  color: #333;
  font-size: 18px;
  padding: 5px;
}
.nice-btns {
  width: 9em;
  height: 4.5em;
  font-size: 15px;
  line-height: 24px;
  margin-top: -3px;
  border-radius: 5px;
  color: #fff;
  border: none;
  background-color: #1CB5E0;
  text-align: center;

}

.col {
  display: flex;
  justify-content: space-around;
  width: 20%;
}

.input-field {
  flex-grow: 8;
}

.inputarea {
  width: 90%;

}

.delete-text {
  position: relative;
  color: red;
  font-size: 23px !important;
  float: right;
}

.main-panel {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.list-content {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
}

.collection {
  list-style-type: none;
  justify-content: left;
  line-height: 20px;
  padding: 10px;
  flex-direction: column;
}
.collection li{
  padding: 10px;
  background-color: #fff;
  color: #333;
  margin: 10px 0;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}

.collection-item {
  flex-direction: row;
  justify-content: space-around;

}

.btn {
  background-image: linear-gradient(#340088, #1CB5E0);
  color: #fff;
  border-radius: 5px;
  // background-color: #3a0d9b;
}


label {
  width: 100%;
  justify-content: space-between;
}

.content {
  flex-grow: 1;
}
.text-div {
  margin-bottom: -60px;
}

</style>
