var $ = function (selector) {
  var obj = typeof selector === "string"
          ? document.querySelector(selector)
          : selector;

  obj.ready = function (listener) {
    obj.addEventListener("DOMContentLoaded", listener);
  };

  obj.click = function (listener) {
    obj.addEventListener("click", listener);
  };

  obj.hide = function () {
    obj.style.display = "none";
  };

  obj.show = function () {
    obj.style.display = "block";
  };

  return obj;
};

$(document).ready(function (event) {
  var addQuestion = $(".btn-add_question");
  var cancelQuestion = $(".btn-cancel_question");
  var panel = $(".add_question");

  addQuestion.click(function (event) {
    panel.show();
    addQuestion.hide();
    event.preventDefault();
  });

  cancelQuestion.click(function (event) {
    panel.hide();
    addQuestion.show();
    event.preventDefault();
  });
});

// $(document).ready(function(){
//   $(".btn-add_question").click(function(e) {
//     e.preventDefault();
//     $(this).fadeOut(400);
//     $(".add_question").slideDown(400);
//   });
//   $(".btn-cancel_question").click(function(e) {
//     e.preventDefault();
//     $(".btn-add_question").fadeIn(400);
//     $(".add_question").slideUp(400);
//   })
// });
