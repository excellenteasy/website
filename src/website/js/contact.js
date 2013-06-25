(function() {
  var metrics,
      options,
      $orderNow = $('.row.order .btn'),
      $button = $('button[type=submit]#submit-button'),
      $form   = $('form#contact-form');
  $form.hide();
  $orderNow.show();
  window.submitted = function() {
    $button
      .text('Thanks for your submission')
      .removeClass('btn-primary btn-danger')
      .addClass('btn-success')
      .attr('disabled','disabled');
      _gaq.push(['_trackEvent', 'Form', 'Submit', 'The user submitted the form']);
      setTimeout(function(){
        $('#contact-form').hide();
        $('#message').text('Thanks for your submission');
        var thanks = $('<div class="thanks">Thank you so much for interest in our Android conversion product. We will get back to you as soon as possible. ' +
          'If you have any question, please feel free to contact me at <a href="mailto:david@excellenteasy.com">david@excellenteasy.com</a>.<br/><br/>' +
          'Best Regards<br/><br/>' +
          'David Pfahler, Co-Founder excellenteasy</div>');
        $('#message').after(thanks);
      }, 600);
  };
  metrics = [
    ['#entry_1835425034', 'presence', 'Please fill in your name'],
    ['#entry_49035993', /^(?:[\w\!\#\$\%\&\'\*\+\-\/\=\?\^\`\{\|\}\~]+\.)*[\w\!\#\$\%\&\'\*\+\-\/\=\?\^\`\{\|\}\~]+@(?:(?:(?:[a-zA-Z0-9](?:[a-zA-Z0-9\-](?!\.)){0,61}[a-zA-Z0-9]?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9\-](?!$)){0,61}[a-zA-Z0-9]?)|(?:\[(?:(?:[01]?\d{1,2}|2[0-4]\d|25[0-5])\.){3}(?:[01]?\d{1,2}|2[0-4]\d|25[0-5])\]))$/, 'Please fill in a valid E-Mail Address'],
  ];
  options = {
    helpSpanDisplay: 'help-block'
  };
  $form.nod(metrics, options);
  $('#order').click(function(){
    _gaq.push(['_trackEvent', 'Form', 'Show', 'The user opened the form']);
    $('.row.pricing, .row.order').hide();
    $('#contact-form').show();
    $('#entry_30214035').focus();
  });
  //hide logo
  setTimeout(function() {
    $('#brand').removeClass('hover');
  }, 1000);
}).call(this);

(function() {
  var $next    = $('#reasons .next');
  var $reasons = $('#reasons .reason');

  $reasons.removeClass('active').first().addClass('active');

  $next.click(function(){
    _gaq.push(['_trackEvent', 'Content', 'Read', 'The user read through a content block on the page']);
    var $active = $('#reasons .reason.active');
    if ($active.length) {
      var $nextUp = $active.next();
      $active.removeClass('active');
      if ($nextUp.length) {
        $nextUp.addClass('active');
      } else {
        $reasons.first().addClass('active');
      }
    }
  });
}).call(this);
