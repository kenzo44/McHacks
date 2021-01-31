<template>
  <div class="app">
    <div class="container">
      <div class="row header">
        <h1 class="col s6 offset-s3 center-align teal-text">What did you do today?</h1>
      </div>
      <div class="row">
        <form @submit.prevent="submitTodo" class="col s6 offset-s3">
          <div class="input-field">
            <i class="material-icons prefix"></i>
            <textarea v-model="newTodo" id="icon_prefix2" class="inputarea"></textarea>
            <label for="icon_prefix2"></label>
          </div>
          <button class="btn waves-effect col s12">Add</button>
        </form>
      </div>
      <div class="row">
        <div class="list">
        <ul class="collection col">
          <li class="collection-item" v-for="todo in todos" :key="todo.id">
            <p>
              <label>
                <span>{{todo.title}}</span>
                  <select name = "type" id = "type">
                    <option value = "towards">Towards</option>
                    <option value = "away">Away</option>
                  </select>
                <span>
                  <a @click.prevent="deleteTodo(todo)">
                    <i class="material-icons right delete-text">X</i>
                  </a>
                </span>
              </label>
            </p>
          </li>
          </ul>
        <button @click.prevent="submit()" class="btn waves-effect col s12">Submit</button>
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

      //this.todos.forEach(element => fuck.postTask(69, element))
    },
  },
};
</script>
<style lang="scss">


.header{
  margin-top: 100px;
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

<<<<<<< HEAD
.list-content {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
=======
.collection {
  justify-content: left;
  line-height: 20px;
  padding: 10px;
  flex-direction: column;

}

.col {
  justify-content: left;
}

.collection-item {
  flex-direction: row;
  justify-content: space-around;

>>>>>>> 286440fdc28d8c7264c047ab8d003f03835fadc8
}

label {
  width: 100%;
  justify-content: space-between;
}

.content {
  flex-grow: 1;
}

</style>
