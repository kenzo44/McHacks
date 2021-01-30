/**************************
* File for helper functions
**************************/

// Used for post request
async function postData(url = '', data) {
  const response = await fetch(url, {
    method: 'POST',
    mode: 'no-cors',
    body: JSON.stringify(data)
  })
  return await response.json()
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
