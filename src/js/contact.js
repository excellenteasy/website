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
}).call(this);
