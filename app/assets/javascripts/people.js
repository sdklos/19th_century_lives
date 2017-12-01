function Person(attributes) {
  this.id = attributes.id
  this.name = attributes.name
  this.given_name = attributes.given_name
  this.year_of_birth = attributes.year_of_birth
  this.year_of_death = attributes.year_of_death
  this.children = attributes.children
  this.parents = attributes.parents
  this.spouses = attributes.spouses
  this.cities = attributes.cities
}

function loadPersonInfo(data) {
  var id = data["dataset"]["id"]
  var path = data["dataset"]["path"]
  var url = "/people/" + id
  $.get(url + ".json", function(item) {
    var person = new Person(item)
      $(`#${path}-${id}`).prepend(`<a href="#" id="close-index-${path}" onclick="closeIndex('${path}-${id}')">Close List</a><br>`)
      $(`#${path}-${id}`).append(HandlebarsTemplates['people/show'](person))
  })
}
