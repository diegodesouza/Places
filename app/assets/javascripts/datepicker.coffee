$('.datepicker-from').datepicker
  minDate: 0
  onClose: (selectedDate) ->
    nextDay = new Date(selectedDate)
    nextDay.setDate(nextDay.getDate() + 1)
    $('.datepicker-to').datepicker 'option', 'minDate', nextDay 

$('.datepicker-to').datepicker
  onClose: (selectedDate) ->
    $('.datepicker-from').datepicker 'option', 'maxDate', selectedDate
