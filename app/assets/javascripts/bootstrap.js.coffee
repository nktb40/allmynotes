jQuery ->
  $(".add_to_group_btn").popover({
  animation: true,
  placement: 'bottom',
  html: true, 
  trigger: 'click'})
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()
  