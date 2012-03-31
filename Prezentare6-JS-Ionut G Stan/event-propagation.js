// small alias function
var $ = function (selector) {
  return document.querySelector(selector);
};

// window.addEventListener("load", ...);
document.addEventListener("DOMContentLoaded", function () {

  document.addEventListener("click", function (event) {
    console.group("capture document");
    console.log(event.target);
    console.log(event.currentTarget);
    console.groupEnd();
  }, true);

  $(".level-1").addEventListener("click", function (event) {
    console.group("capture level 1");
    console.log(event.target);
    console.log(event.currentTarget);
    console.groupEnd();
  }, true);

  $(".level-2").addEventListener("click", function (event) {
    console.group("capture level 2");
    console.log(event.target);
    console.log(event.currentTarget);
    console.groupEnd();
  }, true);

  $(".level-3").addEventListener("click", function (event) {
    console.group("capture level 3");
    console.log(event.target);
    console.log(event.currentTarget);
    console.groupEnd();
    event.preventDefault();
  }, true);

  document.addEventListener("click", function (event) {
    console.group("bubbling document");
    console.log(event.target);
    console.log(event.currentTarget);
    console.groupEnd();
  }, false);

  $(".level-1").addEventListener("click", function (event) {
    console.group("bubbling level 1");
    console.log(event.target);
    console.log(event.currentTarget);
    console.groupEnd();


    // break the event propagation
    event.stopPropagation();


  }, false);

  $(".level-2").addEventListener("click", function (event) {
    console.group("bubbling level 2");
    console.log(event.target);
    console.log(event.currentTarget);
    console.groupEnd();
  }, false);

  $(".level-3").addEventListener("click", function (event) {
    console.group("bubbling level 3");
    console.log(event.target);
    console.log(event.currentTarget);
    console.groupEnd();


    // prevent default action when clicking on a link, i.e. navigation to
    // that URL.
    event.preventDefault();


  }, false);

});
