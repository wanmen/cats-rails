$(document).ready(function() {
    var href = window.location.href.replace(/&page=\d*/, ''),
      total = $('.pagination').data('total');

    if($('.pagination a').eq(1).text() == 1) {
      $('.pagination a').first().addClass('wm-hidden');
    }
    if($('.pagination a').eq(-2).text() == total) {
      $('.pagination a').last().addClass('wm-hidden');
    }
    if(total <= 5) {
      $('.pagination a').first().addClass('wm-hidden');
      $('.pagination a').last().addClass('wm-hidden');
    }

    $('.pagination a').on('click', function() {
      var text = $(this).text(),
        title = $(this).attr('title'),
        current = +$('.pagination .active').text();
      if(title == '上一页') {
        text = current - 1;
      } else if(title == '下一页') {
        text = current + 1;
      }
      if(!$(this).parent().hasClass('active')) {
        window.location = href + '&page=' + text;
      }
      return false;
    });
    
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
