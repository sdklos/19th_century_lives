var citiesLink = document.getElementById('load_cities_index'), count = 0;

var statesLink = document.getElementById('load_states_index'), count = 0;


function closeIndex(div) {
    $("#" + div).html("")
    $("#close-index-" + div).html("")
}

function loadPeopleIndex(path) {
  $(`#${path}`).prepend(`<a href="#" id="close-index-${path}" onclick="closeIndex('${path}')">Close List</a>`)
  $.get("/" + path + ".json", function(items) {
    items.forEach(function(item) {
      var person = new Person(item)
      $(`#${path}`).append(HandlebarsTemplates['people/index'](person))
    })
  })
}

function loadStatesIndex() {
  count += 1
  if (count % 2 === 0) {
    closeIndex("states")
  } else {
    $.get("/states.json", function(items) {
      items.forEach(function(item) {
        var state = new State(item)
        $("#states").append(HandlebarsTemplates['states/index'](state))
      })
    })
  }
}

function loadStateInfo(data) {
  var id = data["dataset"]["id"]
  var url = "/states/" + id
  $.get(url + ".json", function(item) {
    var state = new State(item)
    if(state.cities.length > 0) {
      $("#state-" + id + "-cities").prepend(`<a href="#" id="close-index-state-${id}-cities" onclick="closeIndex('state-${id}-cities')">Close List</a>`)
      $("#state-" + id + "-cities").append(HandlebarsTemplates['states/show'](state))
    } else {
      $("#state-" + id + "-cities").append(`<a href="/states/${id}">Add Cities to ${name}></a>`)
    }
  })
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
