jQuery ->
  $(".new-note-input").popover({
  animation: true,
  placement: 'bottom',
  html: true, 
  trigger: 'click'})
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()
  