(function() {
  var metrics,
      options,
      $button = $('button[type=submit]#submit-button'),
      $form   = $('form#contact-form');
  window.submitted = function() {
    $button
      .text('Thanks for your submission')
      .removeClass('btn-primary btn-danger')
      .addClass('btn-success')
      .attr('disabled','disabled');
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
    ['#entry_30214035', 'presence', 'This is a required field'],
    ['#entry_2031663475', 'presence', 'This is a required field'],
    ['#entry_2135121452', 'presence', 'This is a required field']
  ];
  options = {
    helpSpanDisplay: 'help-block'
  };
  $form.nod(metrics, options);
  $('#order').click(function(){
    $('.row.pricing, .row.order').hide();
    $('#contact-form').show();
    $('#entry_30214035').focus();
  });
  //hide logo
  setTimeout(function() {
    $('#brand').removeClass('hover');
  }, 1000);
}).call(this);
