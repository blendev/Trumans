(function ( $ ) {
$.fn.responsiveMenu = function(options) {
	var opts = $.extend( {}, $.fn.responsiveMenu.defaults, options );
	
	this.each(function(index) {
		/* prepend menu icon */
		var curr_el		= $(this);

		var menu_icon	= $('<div>');
		menu_icon.addClass("wrap menu-icon");

		var menu_slash	= $('<div>');
		menu_slash.addClass("menu_slash");

		var menu_text	= $('<div>');
		menu_text.addClass("menu_text");
		menu_text.text(opts.openText);
		
		menu_icon.append(menu_slash);
		menu_icon.append(menu_text);
		
		curr_el.wrapInner('<div class="responsive_wrap wrap" />');
		
		curr_el.prepend(menu_icon);
		
		/* toggle nav */
		$(menu_icon).click(function() {
			curr_el.find('.responsive_wrap').slideToggle();
			$(this).toggleClass("active");
		});
	});
}

$.fn.responsiveMenu.defaults = {
	openText: 'Menu'
}
}( jQuery ));