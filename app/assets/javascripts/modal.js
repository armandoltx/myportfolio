$(function() {
  console.log("shdhshsf");
  $('#registerBtn').click (function(event) {
    console.log("callback");
    event.preventDefault();
    $("#registerModal .modal-body").load('/register', function() {
      $("#registerModal").modal('show');
    });
  });
});