function City(attributes) {
  this.name = attributes.name;
  this.id = attributes.id;
  this.state_name = attributes.state.name
  this.state_id = attributes.state.id
  this.state_abbreviation = attributes.state.abbreviation
}

City.success = function(json){
  var city = new City(json);
  var cityLi = city.renderLI()
  $("div#new_city").append(cityLi)
}

$(".states.show").ready(function() {
  City.templateSource = $("#entry-template").html()
  City.template = Handlebars.compile(City.templateSource)
})

City.prototype.renderLI = function(){
  return City.template(this)
}

City.formSubmit = function(e) {
  e.preventDefault()
  var $form = $(this);
  var action = $form.attr("action")
  var params = $form.serialize()

  $.ajax({
    url: action,
    method: "POST",
    data: params,
    dataType: "json"
  })
  .success(City.success)
}

$(function(){
  $("form#new_city").on("submit", City.formSubmit)
})
