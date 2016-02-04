(function($) {
  $.fn.menumaker = function(options) {
    var menu = $(this), settings = $.extend({
      format: "dropdown",
      sticky: false
    }, options);

    return this.each(function() {
      menu.prepend('<div id="menu-button">' + '</div>');
      $(this).find("#menu-button").on('click', function(){
        $(this).toggleClass('menu-opened');
        var mainmenu = $(this).next('ul');
        if (mainmenu.hasClass('open')) {
          mainmenu.hide().removeClass('open');
        }
        else {
          mainmenu.show().addClass('open');
          if (settings.format === "dropdown") {
            mainmenu.find('ul').show();
          }
        }
      });

      if (settings.sticky === true) menu.css('position', 'fixed');

      resizeFix = function() {
        if ($( window ).width() > 3000) {
          menu.find('ul').show();
        }

        if ($(window).width() <= 768) {
          menu.find('ul').hide().removeClass('open');
        }
      };
      resizeFix();
      return $(window).on('resize', resizeFix);

    });
  };
})(jQuery);

(function($){
  $(document).ready(function(){

    $(document).ready(function() {
      $("#dropdown-menu").menumaker({
        format: "multitoggle"
      });

      $("#dropdown-menu").prepend("<div id='menu-line'></div>");

      var foundActive = false, activeElement, linePosition = 0, menuLine = $("#menu #menu-line"), lineWidth, defaultPosition, defaultWidth;

      $("#dropdown-menu > ul > li").each(function() {
        if ($(this).hasClass('active')) {
          activeElement = $(this);
          foundActive = true;
        }
      });

      if (foundActive === false) {
        activeElement = $("#dropdown-menu > ul > li").first();
      }

      defaultWidth = lineWidth = activeElement.width();

      defaultPosition = linePosition = activeElement.position().left;

      menuLine.css("width", lineWidth);
      menuLine.css("left", linePosition);

      $("#dropdown-menu > ul > li").hover(function() {
        activeElement = $(this);
        lineWidth = activeElement.width();
        linePosition = activeElement.position().left;
        menuLine.css("width", lineWidth);
        menuLine.css("left", linePosition);
      },
      function() {
        menuLine.css("left", defaultPosition);
        menuLine.css("width", defaultWidth);
      });
    });
  });
})(jQuery);
