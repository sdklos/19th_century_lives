function City(attributes) {
  this.name = attributes.name;
  this.id = attributes.id;
  this.people = attributes.id;
  this.state = attributes.state
}

City.prototype.renderLI = function(){
  
}

$(function(){
  $("form#new_city").on("submit", function(e) {
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
    .success(function(json){
      var city = new City(json);
      var cityLi = city.renderLI()
      $("div#show_cities").append(cityLi)
      console.log(json)
    })
  })
})
