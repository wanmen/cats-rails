$(document).ready(function() {
    var href = window.location.href;
    
    $('.wm-inline-search li a').on('click', function() {
      window.location = href.replace(/&sortby=[^&]*/, '') +
        '&' + $(this).attr('href').slice(1);
      return false;
    });

    $('.wm-lg-left :checkbox').on('change', function() {
      var title = href.match(/&title=.+$/),
        type = [],
        list = [];
      $('.wm-lg-left :checkbox').each(function() {
        var id = $(this).attr('id');
        if(this.checked) {
          if(id.slice(-4) != 'list') {
            type.push(id);
          } else {
            list.push(id.slice(0, -4));
          }
        }
      });
      window.location = '/search?type=' + type.join() + '&list=' + list.join() +
        (title ? title : '');
      return false;
    });

    $('.wm-search-type :checkbox').on('click', function() {
      $(this).parentsUntil('aside').find(':checkbox')
        .prop('checked', (this.checked ? true : false));
      $('.wm-lg-left :checkbox').change();
    });
    $('.wm-lg-left :checkbox').on('click', function() {
      var $_parent = $(this).parentsUntil('section');
      $(this).parentsUntil('aside').find('.wm-search-type :checkbox')
        .prop('checked', $_parent.find('input:checked').length ==
           $_parent.find('input').length);
    });

});
