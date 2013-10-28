(function() {
  var setSubCount = (function() {
    var REQUIRED_SUBSCRIBERS = 1000;
    var $subcount = $('#subcount');
    var $progressbar = $('#progressbar');
    return function (subscribers) {
      $subcount.text(subscribers);
      var percentage = subscribers / (REQUIRED_SUBSCRIBERS / 100);
      percentage = Math.round(percentage);
      if (percentage < 1) percentage = 1;
      else if (percentage > 100) percentage = 100;
      $progressbar.attr({
        style: 'width:' + percentage + '%',
        'aria-valuenow': percentage
      }).children().text(percentage + '% complete');
    };
  })();

  var count;
  if ((count = localStorage.getItem('count'))) setSubCount(count);
  $.get('https://excellenteasy-services.herokuapp.com/newsletter/angular/subscribers/').then(function(data){
    count = data.subscribers || 0;
    localStorage.setItem('count', count);
    setSubCount(count);
  });

  var $button = $('#mc-embedded-subscribe')
    .attr('disabled','disabled')
    .css('opacity','1');
  window.submitted = function() {
    $button
      .text('Thanks for your subscription')
      .attr('disabled','disabled');
    setSubCount(++count);
    _gaq.push(['_trackEvent', 'Subscription', 'Subscribe', 'The user subscribed']);
  };

  metrics = [['#mce-EMAIL', 'email', 'Please fill in a valid E-Mail Address']];
  options = { helpSpanDisplay: 'help-block' };
  $('#mc-embedded-subscribe-form').nod(metrics, options);

  var loadDisqus = (function() {
    var disqus_shortname="excellenteasy";
    var disqus_identifier="Angular Mobile Newsletter";
    var disqus_title="Angular Mobile Newsletter";
    var disqus_url="https://excellenteasy.com/angular-mobile-newsletter/";
    var $window = $(window);
    var treshold = ($('body').height()*0.3);
    return function(e) {
      if ($window.scrollTop() >= treshold) {
        $window.off('scroll', loadDisqus);
        (function() {
          var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
          dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
          (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
        })();
      }
    };
  })();
  $(window).on('scroll', loadDisqus);
}).call(this);
