$(function() {
  console.log("shdhshsf");
  $('#registerBtn, #loginBtn').click (function(event) {
    console.log(event);
    console.log(event.target.id);
    var target = event.target.id;
    console.log("callback");
    event.preventDefault();
    var url;
    var title;
    target == 'registerBtn' ? (url = '/register', title= 'Sign Up') : (url = '/login', title = 'Log In')
    // if (target == 'registerBtn') {
    //   url = '/register';s
    // }
    // if (target == 'loginBtn') {
    //   url = '/login';
    // }
    $("#registerLoginModal .modal-body").load(url, function() {
      $("#registerLoginModal").modal('show');
    });
    
    $('#registerLoginTitle').text(title);
  });
});