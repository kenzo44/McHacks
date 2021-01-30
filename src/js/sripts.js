/**************************
* File for major functions
**************************/

// Site adress
var site = 'http://localhost:8080'

/****************
* Get requests *
****************/
// Returns a user by ID
function getUser(id) {
 var url = site + '/users/'
 getData(url, id)
}

// Returns user days
function getDay(id) {
  var url = site + '/days/'
  getData(url, id)
}

// Returns a specific day
function getDayStamp(id, day) {
  var url = site + '/day/' + id + '/'
  getData(url, day)
}

// Returns list of tasks
function getTasks(id) {
  var url = site + '/tasks/'
  getData(url, id)
}

// Returns list of goals
function getGoals(id) {
  var url = site + '/goals/'
  getData(url, id)
}

// Returns a resource
function getRes(name) {
  var url = site + '/resources/'
  getData(url, name)
}
/*******************
* Patch requests *
*******************/
// Updates a user
function patchUser(id) {
  var url = site + '/users/'
  patchData(url, id)
}

// Updates a task
function patchTask(userID, taskID) {
  var url = site + '/tasks/' + userID '/'
  patchData(url, taskID)
}

// Updates a goal
function patchGoal(userID, goalID) {
  var url = site + '/goals/' + userID + '/'
  patchData(url, goalID)
}
/*******************
* Post requests *
*******************/
// Creates new user
function postUser() {
// DO THIS SHIT LATER
}

// Creates new task
function postTask(userID, task) {
  const url = site + '/tasks/' + userID + '/new'
  postData(url, task)
}

// Create new goal
function postGoal() {
  // DO THIS SHIT LATER
}
/*******************
* Delete requests *
*******************/
// Deletes a user
function powerWordKill(id) {
  var url = site + '/user/' + id
  delData(url)
  .catch(rejected => {
    alert("powerWordKill failed")
    console.log(rejected)
  })
}

// Deletes a task
function delTask(userID, taskID) {
  var url = site + '/users/' + userID + '/tasks/' + taskID
  delData(url)
  .catch(rejected => {
    alert("delTask failed")
    console.log(rejected)
  })
}

// Deletes a goal
function delGoal(userID, goalID) {
  var url = site + '/users/' + userID + 'goals/' + goalID
  delData(url)
  .catch(rejected => {
    alert("delGOal failed")
    console.log(rejected)
  })
}
