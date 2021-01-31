<template>
  <div class="app">
    <div class="container">
      <div class="text-div">
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
      <div class="row">
        <div class="list">
        <ul class="collection col">
          <li class="collection-item" v-for="todo in todos" :key="todo.id">
            <p>
              <label>
                <span>{{todo.title}} </span>
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
          score: '0',
          description: element.title,
          datestamp: '20110911'
        }
        fuck.postTask(69, data)
        })
      while(this.todos.length != 0) {
        this.deleteTodo(0)
      }
    },
  },
};
</script>
<style lang="scss">


.header{
  margin-top: 100px;
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
}

.nice-btns {
  width: 9em;
  height: 4.5em;
  font-size: 15px;
  line-height: 24px;
  margin-top: -3px;
  border-radius: 10;
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
  color: red;
  font-size: 20px;
  justify-content: right;
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
  margin: 10px 0;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}

.col {
  justify-content: left;
}

.collection-item {
  flex-direction: row;
  justify-content: space-around;

}

.btn {
  background-image: linear-gradient(#340088, #1CB5E0);
  color: #fff;
  // background-color: #3a0d9b;
}

.text-div {
  margin-top: 50px;
  margin-bottom: -60px;
}


label {
  width: 100%;
  justify-content: space-between;
}

.content {
  flex-grow: 1;
}
.text-div {
  margin-top: 50px;
  margin-bottom: -60px;
}

</style>
