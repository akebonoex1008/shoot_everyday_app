$(function(){
	$('.js-modal-open').each(function(){
		$(this).on('click',function(){
			var target = $(this).data('target');
			var modal = document.getElementById(target);
			$(modal).fadeIn();
			return false;
		});
	});
	$('.js-modal-close').on('click',function(){
		$('.js-modal').fadeOut();
		return false;
	}); 

	//　コメントの改行で高さを変える
	// $(function() {
	// 	var $textarea = $('comment-textarea');
	// 	var lineHeight = parseInt($textarea.css('lineHeight'));
	// 	$textarea.on('input', function(evt) {
	// 		var lines = ($(this).val() + '\n').match(/\n/g).length;
	// 		$(this).height(lineHeight * lines);
	// 	});
	// 	console.log($textarea)
	// });

	$('.post-comment-icon').click(function() {
		$('.comment-textarea').focus();
		return false;
	});
});