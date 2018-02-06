
$(document).ready(function() {
  var statesLink = document.querySelector('#load_states_index')
  var citiesLink = document.querySelector('#load_cities_index')
  var peopleLink = document.querySelector('#load_people_index')
  var patriarchsLink = document.querySelector('#load_patriarchs_and_matriarchs_index')
  if (statesLink) {
    statesLink.addEventListener('click', loadStatesIndex)
  }
  if (citiesLink) {
    citiesLink.addEventListener('click', loadCitiesIndex)
  }
  if (peopleLink) {
    peopleLink.addEventListener('click', loadPeopleIndex)
  }
  if (patriarchsLink) {
    patriarchsLink.addEventListener('click', loadPatriarchsIndex)
  }
})

function closeIndex(div) {
    $("#" + div).html("")
    $("#close-index-" + div).html("")
}

function loadPeopleIndex() {
  if (this.dataset.active === 'true') {
    closeIndex("people")
    this.dataset.active = 'false'
  } else {
    $.get("/people.json", function(items) {
      items.forEach(function(item) {
        var person = new Person(item)
        $("#people").append(HandlebarsTemplates['people/index'](person))
      })
      this.dataset.active = 'true'
    }.bind(this))
  }
}

function loadPatriarchsIndex() {
  if (this.dataset.active === 'true') {
    closeIndex("patriarchs_and_matriarchs")
    this.dataset.active = 'false'
  } else {
    $.get("/patriarchs_and_matriarchs.json", function(items) {
      items.forEach(function(item) {
        var person = new Person(item)
        $("#patriarchs_and_matriarchs").append(HandlebarsTemplates['people/index'](person))
      })
      this.dataset.active = 'true'
    }.bind(this))
  }
}

function loadStatesIndex() {
  if (this.dataset.active === 'true') {
    closeIndex("states")
    this.dataset.active = 'false'
  } else {
    $.get("/states.json", function(items) {
      items.forEach(function(item) {
        var state = new State(item)
        $("#states").append(HandlebarsTemplates['states/index'](state))
      })
      this.dataset.active = 'true'
    }.bind(this))
  }
}

function loadStateInfo(data) {
  var id = data.dataset.id
  var url = "/states/" + id
  $.get(url + ".json", function(item) {
    var state = new State(item)
    if(state.cities.length > 0) {
      $("#state-" + id + "-cities").prepend(`<a href="#" id="close-index-state-${id}-cities" onclick="closeIndex('state-${id}-cities')">Close List</a>`)
      $("#state-" + id + "-cities").append(HandlebarsTemplates['states/show'](state))
    } else {
      $("#state-" + id + "-cities").append(`<a href="/states/${id}">Add Cities to ${state.name}</a>`)
    }
  })
}

function loadCitiesIndex() {
  if (this.dataset.active === 'true') {
    closeIndex("cities")
    this.dataset.active = 'false'
  } else {
    $.get("/cities.json", function(items) {
      items.forEach(function(item) {
        var state = new City(item)
        $("#cities").append(HandlebarsTemplates['cities/index'](city))
      })
      this.dataset.active = 'true'
    }.bind(this))
  }
}
