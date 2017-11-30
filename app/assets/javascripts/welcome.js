var citiesLink = document.getElementById('load_cities_index'), count = 0;

var statesLink = document.getElementById('load_states_index'), count = 0;

var peopleLink = document.getElementById('load_people_index'), count = 0;

var patriarchsAndMatriarchsLink = document.getElementById('load_patriarchs_and_matriarchs_index'), count = 0


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
  count += 1
  if (count % 2 === 0) {
    closeIndex("states")
  } else {
    $.get("/states.json", function(items) {
      $("#states").append(`<h4><a href="#" onclick="closeIndex('states')">Close</a></h4>`)
      items.forEach(function(item) {
        var state = new State(item)
        $("#states").append(HandlebarsTemplates['states/index'](state))
      })
    })
  }
}
function loadCitiesIndex() {
  count += 1
  if (count % 2 === 0) {
    closeIndex("cities")
  } else {
    $.get("/cities.json", function(items) {
      items.forEach(function(item) {
        var city = new City(item)
        $("div#cities").append(HandlebarsTemplates['cities/index'](city))
      })
    })
  }
}

function loadStateInfo(data) {
  var id = data["dataset"]["id"]
  var url = "/states/" + id
  $.get(url + ".json", function(item) {
    $("#more-states-" + id ).append(`<a href=${url}>View on Separate Page</a><div>`)
    $("#more-states-" + id + "-cities").append("Cities in the database:<br>")
    if(item["cities"].length > 0) {
      item["cities"].forEach(function (city){
        $("#more-states-" + id + "-cities").append(`<a href="/cities/${city["id"]}">${city["name"]}</a>`)
      })
    } else {
      $("#more-states-" + id + "-cities").append("there are no cities in the database yet")
    }
  })
}
