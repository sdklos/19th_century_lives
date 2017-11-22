function loadMorePerson(data) {
  var id = data["dataset"]["id"]
  var path = data["dataset"]["path"]
  var url = "/" + path + "/" + id
  $.get("/" + path + "/" + id + ".json", function(item) {
      $("#more-" + id ).append(`<a href=${url}>View on Separate Page</a><div>${item["year_of_birth"]} + "-" + ${item["year_of_death"]}</div>`)
  })
}
