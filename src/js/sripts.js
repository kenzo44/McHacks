/**************************
* File for major functions
**************************/

// Site adress
var site = 'http://localhost:8079'

/****************
* Get requests *
****************/
// Returns a user by ID
export function getUser(id) {
 var url = site + '/users/'
 getData(url, id)
}

// Returns user days
export function getDay(id) {
  var url = site + '/days/'
  getData(url, id)
}

// Returns a specific day
export function getDayStamp(id, day) {
  var url = site + '/day/' + id + '/'
  getData(url, day)
}

// Returns list of tasks
export function getTasks(id) {
  var url = site + '/tasks/'
  getData(url, id)
}

// Returns list of goals
export function getGoals(id) {
  var url = site + '/goals/'
  getData(url, id)
}

// Returns a resource
export function getRes(name) {
  var url = site + '/resources/'
  getData(url, name)
}
/*******************
* Patch requests *
*******************/
// Updates a user
export function patchUser(id) {
  var url = site + '/users/'
  patchData(url, id)
}

// Updates a task
export function patchTask(userID, taskID) {
  var url = site + '/tasks/' + userID + '/'
  patchData(url, taskID)
}

// Updates a goal
export function patchGoal(userID, goalID) {
  var url = site + '/goals/' + userID + '/'
  patchData(url, goalID)
}
/*******************
* Post requests *
*******************/
// Creates new user
export function postUser() {
// DO THIS SHIT LATER
}

// Creates new task
export function postTask(userID, task) {
  const url = site + '/tasks/new'// + userID + '/new'
  postData(url, task)
}

// Create new goal
export function postGoal() {
  // DO THIS SHIT LATER
}
/*******************
* Delete requests *
*******************/
// Deletes a user
export function powerWordKill(id) {
  var url = site + '/user/' + id
  delData(url)
  .catch(rejected => {
    alert("powerWordKill failed")
    console.log(rejected)
  })
}

// Deletes a task
export function delTask(userID, taskID) {
  var url = site + '/users/' + userID + '/tasks/' + taskID
  delData(url)
  .catch(rejected => {
    alert("delTask failed")
    console.log(rejected)
  })
}

// Deletes a goal
export function delGoal(userID, goalID) {
  var url = site + '/users/' + userID + 'goals/' + goalID
  delData(url)
  .catch(rejected => {
    alert("delGOal failed")
    console.log(rejected)
  })
}

/*******************
* Helper Functions *
*******************/

// Used for post request
async function postData(url = '', data = {}) {
  const response = await fetch(url, {
    body: JSON.stringify(data),
    method: 'POST',
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    },
    "Access-Control-Allow-Origin":"*"
  })
  //return await response.json()
}

// Used for get request
async function getData(url = '', data) {
  // Gets the data back
  fetch(url + data)
  .then((resp) => resp.json())
  .then(data => {
    // Handle data feedback here
    return(data["result"])
  })
  // Display error here
  .catch(rejected => {
    // Handle error here
    console.log("Error: " + rejected)
    alert("Could not get " + data)
  })
}

// Used for put request
async function putData(url = '', data) {
  const response = await fetch(url, {
    method: 'PUT',
    mode: 'cors',
    body: JSON.stringify(data)
  })
}

// Used for delete request
async function delData(url = '') {
    fetch(url, {
      method: 'DELETE',
      mode: 'cors'
    })
}

// Used for patch request
async function patchData(url = '', data) {
  const response = await fetch(url, {
    method: 'PATCH',
    mode: 'cors',
    body: JSON.stringify(data)
  })
}
