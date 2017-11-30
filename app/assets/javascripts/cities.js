function City(attributes) {
  this.name = attributes.name;
  this.id = attributes.id;
  this.state_name = attributes.state.name
  this.state_id = attributes.state.id
  this.state_abbreviation = attributes.state.abbreviation
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

City.success = function(json){
  var city = new City(json);
  $("div#new_city").prepend(HandlebarsTemplates['states/show_new_city'](city))
  $("#name_input").val("")
}
