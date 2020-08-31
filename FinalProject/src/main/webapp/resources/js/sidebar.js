$(function(){
		var duration = 800;
		var $side = $('#sidebar');
		var $sidebt = $side.find('#side_btn').on('click', function(){
			$side.toggleClass('open');
			if($side.hasClass('open')) {
				$side.stop(true).animate({left:'0px'}, duration);
			}else{
				$side.stop(true).animate({left:'-400px'}, duration);
			};
		});
	});