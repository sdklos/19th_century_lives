function State(attributes) {
  this.name = attributes.name;
  this.id = attributes.id;
  this.cities = attributes.cities
}

State.prototype.alphabetizeCities = function() {
  return this.cities.sort(function(a, b) {
    if(a.name < b.name) return -1;
    if(a.name > b.name) return 1;
    return 0;
  })
}

State.all = function() {

}

$(function(){
  $("form#add_city_to_state").on("submit", City.formSubmit)
})
