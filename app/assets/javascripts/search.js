$(function() {
  $('.js-searchFrmNameSearch').on('click', function() {
    searchFormHandler()
  })


  $('.js-searchFrmNameInp').keypress(function (e) {
    if (e.which === 13) {
      searchFormHandler()
    }
  });

  $('.js-detailsRow').on('click', function() {
    window.location = $(this).data('href')
  })

  var searchFormHandler = function() {
    var nameInpVal = $('.js-searchFrmNameInp').val()
    $('#q_name_cont').val(nameInpVal)
    $('form#dog_search').submit()
  }
})
