/* javascript */
 
$(function () {
 
  $("#rateYo").rateYo()
              .on("rateyo.change", function (e, data) {
 
                var rating = data.rating;
                $(this).next().text(rating);
              });
});