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

$(function(){
  $("form#new_city").on("submit", City.formSubmit)
})
