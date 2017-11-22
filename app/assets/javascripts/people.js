$(document).on('page:change', function() {
  attachListeners();
})

function attachListeners() {
  closeListener()
}

function closeListener() {

  $("a.js-close").on("click", function(e) {
    var name = $(this).data("name");
    $("#" + name).html("")
    console.log(name)
  })
}
