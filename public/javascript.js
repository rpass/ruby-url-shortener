let short_url_text = document.getElementById('short_url');
let url_input = document.getElementById('url');
let button = document.getElementById('submit');
const base_uri = 'http://localhost:4567/';

button.onclick = function() {
  fetch(base_uri, {
    method: 'POST',
    body: JSON.stringify({url: url_input.value})
  }).then(
  function(response){
    response.json().then(
      function(data){
        let link = 'http://localhost:4567/' + data["short_url"];
        short_url_text.textContent = link;
        short_url_text.href = link;
        console.log(link);
      })
  });
};