function State(attributes) {
  this.name = attributes.name;
  this.id = attributes.id;
}

$(function(){
  $("form#new_city").on("submit", City.formSubmit)
})
