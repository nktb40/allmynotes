$(document).ready(function() {
	  $('.add-btn').click(function(e) { e.preventDefault(); });
	  //$('.search-btn').click(function(e) { e.preventDefault(); });
	  $('.list-btn').click(function(e) { e.preventDefault(); });
	  $('.th-btn').click(function(e) { e.preventDefault(); });
	  $('.preview-btn').click(function(e) { e.preventDefault(); });
	  $('.link-to-btn').click(function(e) { e.preventDefault(); });
	  $('.add_to_group_btn').click(function(e) { e.preventDefault(); });
	 });
   $('.item_note').click(function(e){
		$.ajax({
	   url: '/notes/'+id,
	   type: 'get',
	   dataType: 'json'
	   });
   });
