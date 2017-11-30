$(function() {
  console.log("shdhshsf");
  $('#registerBtn, #loginBtn').click (function(event) {
    console.log(event);
    console.log(event.target.id);
    var target = event.target.id;
    console.log("callback");
    event.preventDefault();
    var url;
    target == 'registerBtn' ? url = '/register' : url = '/login'
    // if (target == 'registerBtn') {
    //   url = '/register';
    // }
    // if (target == 'loginBtn') {
    //   url = '/login';
    // }
    $("#registerLoginModal .modal-body").load(url, function() {
      $("#registerLoginModal").modal('show');
    });
  });
});