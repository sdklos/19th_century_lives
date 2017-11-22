$(document).ready(function() {
  attachListeners();
})

function attachListeners() {

$(function() {
  document.querySelector("js-people-index").addEventListener('click', function(e) {
    
  })
  $(".js-people-index").on("click", function() {

    var path = $(this).data("path");
    $.get("/" + path + ".json", function(items) {
      $("#" + path).append(`<h4><a href="#" class="js-close" data-name="${path}">Close</a></h4>`)
      items.forEach(function(item) {
        $("#" + path).append(`<p><a href="#" class="js-more" data-id="${item["id"]}">` + item["given_name"] + " " + item["name"] + `</a></p><div id="more-${item["id"]}"></div>`)
      })
    })
  })
  $("#js-states-index").on("click", function() {
    var path = $(this).data("path");
    $.get("/" + path + ".json", function(items) {
      $("#" + path).append(`<h4><a href="#" class="js-close" data-name="${path}">Close</a></h4>`)
      items.forEach(function(item) {
        $("#" + path).append(`<p><a href="#" class="js-more" data-id="item["id"]">` + item["name"] + `</a></p>`)
      })
    })
  })

  $("#js-cities-index").on("click", function() {
    var path = $(this).data("path");
    $.get("/" + path + ".json", function(items) {
      $("#" + path).append(`<h4><a href="#" class="js-close" data-name="${path}">Close</a></h4>`)
      items.forEach(function(item) {
        $("#" + path).append(`<p><a href="#" class="js-more" data-id="${item["id"]}">` + item["name"] + "," + " " + item["state"]["abbreviation"] + `</a></p>`)
      })
    })
  })

  $(".js-close").on("click", function() {
    var path = $(this).data("path");
    $("#" + path).html("")
  })

  $(".js-more").on("click", function() {
    var id = $(this).data("id")
    debugger
    $("#more-" + id ).html("hi?")
  })

})
