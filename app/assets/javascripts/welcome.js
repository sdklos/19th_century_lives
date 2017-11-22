function closeIndex(div) {
    $("#" + div).html("")
}

function loadPeopleIndex(path) {
  $.get("/" + path + ".json", function(items) {
    $("#" + path).append(`<h4><a href="#" onclick="closeIndex(id)" id="${path}">Close</a></h4>`)
    items.forEach(function(item) {
      $("#" + path).append(`<p><a href="/${path}/${item["id"]}">` + item["given_name"] + " " + item["name"] + `</a></p><div id="more-${item["id"]}"></div>`)
    })
  })
}

function loadStatesIndex() {
  $.get("/states.json", function(items) {
    $("#states").append(`<h4><a href="#" onclick="closeIndex('states')">Close</a></h4>`)
    items.forEach(function(item) {
      $("#states").append(`<p><a href="/states/${item["id"]}">` + item["name"] + `</a></p><div id="more-${item["id"]}"></div>`)
    })
  })
}

function loadCitiesIndex() {
  $.get("/cities.json", function(items) {
      $("#cities").append(`<h4><a href="#" onclick="closeIndex('cities')">Close</a></h4>`)
    items.forEach(function(item) {
      $("#cities").append(`<p><a href="/cities/${item["id"]}">` + item["name"] + "," + " " + item["state"]["abbreviation"] + `</a></p><div id="more-${item["id"]}"></div>`)
    })
  })
}
