$(function() {
  $('.js-searchFrmNameSearch').on('click', function() {
    searchFormHandler()
  })


  $('.js-searchFrmNameInp').keypress(function (e) {
    if (e.which === 13) {
      searchFormHandler()
    }
  });

  var searchFormHandler = function() {
    var nameInpVal = $('.js-searchFrmNameInp').val()
    $('#q_name_cont').val(nameInpVal)
    $('form#dog_search').submit()
  }
})
