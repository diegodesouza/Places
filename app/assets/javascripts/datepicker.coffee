$('.datepicker-from').datepicker
  dateFormat: 'yy-mm-dd'
  minDate: 0
  onClose: (selectedDate) ->
    nextDay = new Date(selectedDate)
    nextDay.setDate(nextDay.getDate() + 1)
    $('.datepicker-to').datepicker 'option', 'minDate', nextDay 

$('.datepicker-to').datepicker
  dateFormat: 'yy-mm-dd'
  onClose: (selectedDate) ->
    $('.datepicker-from').datepicker 'option', 'maxDate', selectedDate
