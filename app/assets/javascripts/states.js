function State(attributes) {
  this.name = attributes.name;
  this.id = attributes.id;
  this.cities = attributes.cities.sort(function(a, b) {
    if(a.name < b.name) return -1;
    if(a.name > b.name) return 1;
    return 0;
  })
}

$(function(){
  $("form#new_city").on("submit", City.formSubmit)
})

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
