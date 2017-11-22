$(document).ready(function() {
  attachListeners();
})

function attachListeners() {
  peopleIndexListener()
  statesIndexListener()
  citiesIndexListener()
}

function closeListener() {
  $("a.js-close").on("click", function() {
    var name = $(this).data("name");
    $("#" + name).html("")
  })
}

function moreListener() {
  $(".js-more").on("click", function() {

    var id = $(this).data("id")
    var path = $(this).data("path")
    $.get("/" + path + "/" + id + ".json", function(item) {
      $("#more-" + id ).html("hi?")
    })

  })
}

function peopleIndexListener() {
  $(".js-people-index").on("click", function(e) {
    var path = $(this).data("path");
    $.get("/" + path + ".json", function(items) {
      $("#" + path).append(`<h4><a href="#" class="js-close" data-name="${path}">Close</a></h4>`)
      items.forEach(function(item) {
        $("#" + path).append(`<p><a href="#" class="js-more" data-id="${item["id"]}" data-path="${path}">` + item["given_name"] + " " + item["name"] + `</a></p><div id="more-${item["id"]}"></div>`)
      })
      closeListener()
      moreListener()
    })
  })
}

function statesIndexListener() {
  $("#js-states-index").on("click", function() {
    var path = $(this).data("path");
    $.get("/" + path + ".json", function(items) {
      $("#" + path).append(`<h4><a href="#" class="js-close" data-name="${path}">Close</a></h4>`)
      items.forEach(function(item) {
        $("#" + path).append(`<p><a href="#" class="js-more" data-id="item["id"]" data-path="${path}">` + item["name"] + `</a></p><div id="more-${item["id"]}"></div>`)
      })
      closeListener()
      moreListener()
    })
  })
}

function citiesIndexListener() {
  $("#js-cities-index").on("click", function() {
    var path = $(this).data("path");
    $.get("/" + path + ".json", function(items) {
      $("#" + path).append(`<h4><a href="#" class="js-close" data-name="${path}">Close</a></h4>`)
      items.forEach(function(item) {
        $("#" + path).append(`<p><a href="#" class="js-more" data-id="${item["id"]}" data-path="${path}">` + item["name"] + "," + " " + item["state"]["abbreviation"] + `</a></p><div id="more-${item["id"]}"></div>`)
      })
      closeListener()
      moreListener()
    })
  })
}
