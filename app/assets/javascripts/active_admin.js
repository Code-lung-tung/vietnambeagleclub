//= require arctic_admin/base
//= require tinymce-jquery
$(document).ready(function() {
  tinymce.init({
    selector: '.editor',
    height: 300,
    width : '50%',
    plugins: [
      'advlist autolink lists link charmap print preview anchor',
      'searchreplace visualblocks code fullscreen',
      'insertdatetime media table contextmenu paste code uploadimage'
    ],
    toolbar: 'bold italic underline | bullist,numlist | alignleft aligncenter alignright alignjustify | undo redo'
  });
})