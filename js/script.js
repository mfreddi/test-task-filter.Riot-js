var getRequest = function(type, url, cb){
  var xhr = new XMLHttpRequest();
  xhr.open(type, url, true);
  xhr.send();
  xhr.onreadystatechange = function() {
    if (xhr.readyState != 4) return;
    if (xhr.status != 200) {
      cb({error: xhr.status + ': ' + xhr.statusText });
    } else {
      cb(JSON.parse(xhr.responseText));
    }
  }

}
