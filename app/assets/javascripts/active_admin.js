//= require arctic_admin/base
//= require tinymce-jquery
$(document).ready(function() {
  initTinyMce()

  $('.has_many_add').click(function() { 
    setTimeout(initTinyMce, 50)
  })
})

function initTinyMce () {
  tinymce.init({
    selector: '.editor',
    height: 300,
    width : '50%',
    plugins: [
      'advlist autolink lists link charmap print preview anchor',
      'searchreplace visualblocks code fullscreen',
      'insertdatetime media table contextmenu paste code uploadimage textcolor'
    ],
    toolbar: 'bold italic underline | forecolor backcolor | bullist,numlist | alignleft aligncenter alignright alignjustify | undo redo'
  })
}
