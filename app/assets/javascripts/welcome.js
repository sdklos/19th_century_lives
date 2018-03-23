

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
      if (items.length > 0) {
        items.forEach(function(item) {
          var person = new Person(item)
          $("#people").append(HandlebarsTemplates['people/index'](person))
        })
      } else {
        $("#people").append(`<p>There are no people in the database</p>`)
      }
      if (Cookies.get('signed_in') === "true") {
        $("#people").prepend(`<a href="/people/new">Add a person</a>`)
      } else {
        $("#people").prepend(`<a href="/users/sign_in">Sign in to add a person</a>`)
      }
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
      if (items.length > 0) {
        items.forEach(function(item) {
          var person = new Person(item)
          $("#patriarchs_and_matriarchs").append(HandlebarsTemplates['people/index'](person))
        })
      } else {
        $("#patriarchs_and_matriarchs").append(`<p>There are no patriarchs or matriarchs in the database</p>`)
      }
      if (Cookies.get('signed_in') === "true") {
        $("#patriarchs_and_matriarchs").prepend(`<a href="/people/new">Add a person</a>`)
      } else {
        $("#patriarchs_and_matriarchs").prepend(`<a href="/users/sign_in">Sign in to add a person</a>`)
      }
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
  if (data.dataset.active === 'true') {
    closeIndex(`state-${id}-cities`)
    data.dataset.active = 'false'
  } else {
    $.get(url + ".json", function(item) {
      var state = new State(item)
      if(state.cities.length > 0) {
        $("#state-" + id + "-cities").append(HandlebarsTemplates['states/show'](state))
      } else {
        $("#state-" + id + "-cities").append(`<p>There are no cities in ${state.name} in the database yet</p>`)
      }
      if (Cookies.get('signed_in') === "true") {
        $("#state-" + id + "-cities").prepend(`<a href="/states/${id}">Add cities to ${state.name}</a>`)
      } else {
        $("#state-" + id + "-cities").prepend(`<a href="/users/sign_in">Sign in to add a city to ${state.name}</a>`)
      }
  })
  data.dataset.active = 'true'
  }
}

function loadCitiesIndex() {
  if (this.dataset.active === 'true') {
    closeIndex("cities")
    this.dataset.active = 'false'
  } else {
    $.get("/cities.json", function(items) {
      if (items.length > 0) {
        items.forEach(function(item) {
          var city = new City(item)
          $("#cities").append(HandlebarsTemplates['cities/index'](city))
        })
      } else {
        $("#cities").append(`<p>There are no cities in the database</p>`)
      }
      if (Cookies.get('signed_in') === 'true') {
        $("#cities").prepend(`<a href="/cities/new">Add a city</a>`)
      } else {
        $("#cities").prepend(`<a href="/users/sign_in">Sign in to add a city</a>`)
      }
      this.dataset.active = 'true'
    }.bind(this))
  }
}
