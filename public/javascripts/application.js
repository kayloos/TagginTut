$(function() {
  var timeout;
  $(".text").live("keyup", function() {
    // Capture instance of text, so we can use it when $(this) is overriden
    var text_instance = $(this);
    var text = $(this).val();

    clearTimeout(timeout);
    // If there's no input, dont make a request
    if (text != "") {
      timeout = setTimeout(function() {doGet()}, 500);

      // Wrapper so we can use setTimeout
      function doGet() {
        $.get("/images/tag_suggestions/" + text, function(data) {
          if ($("#suggestions") != undefined) $("#suggestions").remove();
          text_instance.parents(".caption").append(data);

          $(".add_tag").click(function() {
            text_instance.val($(this).html());
            $("#suggestions").remove();
            return false;
          });
        });
      }
    }
    else
      $("#suggestions").remove();
  });
  $(document).click(function(){
    if($("#suggestions") != undefined) $("#suggestions").remove();
  });
});
