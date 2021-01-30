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
<script src = "../js/scripts.js"></script>
<script>
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
      this.todos.forEach(element => postTask(element))
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
  flex-grow: 1;
}

.btn {
  display: flex;
  flex-grow: none;
}

.inputarea {
  width: 80%;
}

.collection {
  flex-direction: column;
  justify-content: space-between;
}

.list-content {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
}

.delete-text {
  color: red;
  font-size: 20px;
  justify-content: right;
}

</style>
