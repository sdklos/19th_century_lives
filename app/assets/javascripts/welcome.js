function closeIndex(div) {
    $("#" + div).html("")
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

function loadPeopleIndex(path) {
  $.get("/" + path + ".json", function(items) {
    $("#" + path).append(`<h4><a href="#" onclick="closeIndex(id)" id="${path}">Close</a></h4>`)
    items.forEach(function(item) {
      $("#" + path).append(`<p><a href="#" class="js-more" data-id="${item["id"]}" data-path="${path}">` + item["given_name"] + " " + item["name"] + `</a></p><div id="more-${item["id"]}"></div>`)
    })
  })
}

function loadStatesIndex() {
  $.get("/states.json", function(items) {
    $("#states").append(`<h4><a href="#" onclick="closeIndex('states')">Close</a></h4>`)
    items.forEach(function(item) {
      $("#states").append(`<p><a href="#" class="js-more" data-id="item["id"]" data-path="states">` + item["name"] + `</a></p><div id="more-${item["id"]}"></div>`)
    })
  })
}

function loadCitiesIndex() {
  $.get("/cities.json", function(items) {
      $("#cities").append(`<h4><a href="#" onclick="closeIndex('cities')">Close</a></h4>`)
    items.forEach(function(item) {
      $("#cities").append(`<p><a href="#" class="js-more" data-id="${item["id"]}" data-path="cities">` + item["name"] + "," + " " + item["state"]["abbreviation"] + `</a></p><div id="more-${item["id"]}"></div>`)
    })
  })
}
