---
category: dev
layout: post
author: stephan
title: How to target physical pixels on retina screens with CSS
---
{% include JB/setup %}

*As announced last week [we have recreated the iOS 7 UI with CSS](/blog/posts/how-the-web-empowered-us-to-ship-ios-7-ui-only-7-days-after-its-announcement/) for use in our internal mobile app framework. Today I want to share a technical challenge I encountered along the way and its solution.*

When you try to get the available width of an iPhone with retina screen the browser reports back 320 pixels, even though it has 640 physical pixels. Web developers don't need to adjust every webpage for retina screens, because the content is just displayed in the same physical size, but much sharper. This works for everything except images/bitmaps, but in the past we have read and learned everything on how to tackle this problem. I mean there is an entire [book](http://retinafy.me/) about this topic.

You might think that in the meantime handling retina is old news, but think again. With Apple's latest version of iOS they dropped support for the iPhone 3GS and now it runs exclusivly on retina phones. This seems to be reason enough for them to target physical pixels within their UI.

{% image clock_app_upscaled.png %}
  title: Upscaled Clock app
  alt: Upscaled screenshot of the Apple Clock app
  caption: The (upscaled) iOS 7 Clock.app
{% endimage %}
> You can't simply specify a border of 0.5px

The navigation bar now has border at the bottom that is one physical pixel thick. Trying to do the same with CSS adds a whole new complexity level to the retina problem.<!-- more --><span id="more"></span> Not long ago I was super happy that I didn't have to handle different pixel ratios and now this. The abstraction is far advanced and there is no sub-pixel support in CSS, so you can't simply specify a border of 0.5px.

After a moment's consideration I realized the only way to address real pixels were downscaled images. Nonetheless using a bitmap was unthinkable for me, because it would defeat the purpose of dynamic web design. What comes in handy here is that you can use gradients as images in CSS so without further ado here is my solution.

{% highlight css linenos=table %}
.physical-pixel-border {
  background-image: linear-gradient(0deg, #f2f2f2, #f2f2f2 50%, transparent 50%);
  background-size: 100% 1px;
  background-repeat: no-repeat;
  background-position: bottom;
}
{% endhighlight %}
*I'll refer to physical pixels as ppx and CSS-pixels as px to ease the explanation*. I defined a linear bottom-to-top gradient as the background image with a height of 1px. Remember on retina screens it is 2ppx high. As it is an image it can target ppx and therefore is rendered as a 1ppx gray line at the bottom of the container with a 1ppx transparent line right above it. Mission accomplished.

What I love about the solution is its flexibility and functional compliance to real borders. CSS3 allows you to define multiple background images, so it wouldn't be a problem to define top, left, right, bottom border all at the same time. There is a caveat though: Don't use this on low-res screens because it causes unpredictable results. Use media queries to activate it on retina screens only. Here is a full-fledged demo and I'd love to hear your thoughts and see your forks.

<pre class="codepen" data-height="300" data-type="result" data-href="tvJkI" data-user="boennemann" data-safe="true"><code></code><a href="http://codepen.io/boennemann/pen/tvJkI">Check out this Pen!</a></pre>
<script async src="//codepen.io/assets/embed/ei.js"></script>
