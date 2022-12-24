
/*global $*/
$(document).on('turbolinks:load', function () {
  // 各項目を初期化
  $('.sidenav').sidenav();
  $('.parallax').parallax();
  $('.dropdown-trigger').dropdown();
  $('.modal').modal();
});

// sidenavだけは、進む/戻るで動かなくなるので都度destroyが必要
$(document).on("turbolinks:before-cache", function () {
  $('.sidenav').sidenav('destroy');
  $('.dropdown-trigger').dropdown('destroy');
  $('.modal').modal('destroy');
});

$(document).ready(function(){
    $('select').formSelect();
});
