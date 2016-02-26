function calculate_height() {
    
	var body_height = jQuery('.wrapper').first().outerHeight();
	var top_bar		= jQuery('.top_bar').first().outerHeight();
	var footer		= jQuery('.main_footer').first().outerHeight();
	var mainbody	= body_height - top_bar - footer;
	mainbody		= mainbody + 'px';
	footer			= (footer + 20) + 'px';
	jQuery('.mainbody_height').first().css('min-height', mainbody);
	jQuery('.mainbody_inner').first().css('padding-bottom', footer);
}

jQuery(window).load(function() {
	calculate_height();
	jQuery( window ).resize(function() {
		calculate_height();
	});
});