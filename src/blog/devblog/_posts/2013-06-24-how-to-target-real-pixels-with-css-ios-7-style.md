---
category: dev
layout: post
author: stephan
title: How to target physical pixels on retina screens with CSS
---
{% include JB/setup %}

*As we announed last week [we have recreated the iOS 7 UI with CSS](/blog/posts/how-the-web-empowered-us-to-ship-ios-7-ui-only-7-days-after-its-announcement/) for use in our internal mobile app framework. Today I want to share a challenge we encountered along the way and how we solved it.*

When you try to get the available width of an iPhone with retina screen the browser reports back 320 pixels, even though it has 640 physical pixels. Web developers don't need to adjust every webpage for retina screens, because the content is just displayed in the same physical size, but much sharper. This works for everything except images, but in the past we have read and learned everything on how to tackle this problem. I mean there is an entire [book](http://retinafy.me/) about this topic.

You might think that in the mean time handling retina is old news, but think again. With Apple's latest version of iOS they dropped support for the iPhone 3GS and now it runs exclusivly on retina phones. This seems to be reason enough for them to target physical pixels within their UI.

{% image clock_app_upscaled.png %}
  title: Upscaled Clock app
  alt: Upscaled screenshot of the Apple Clock app
  caption: The (upscaled) iOS 7 Clock.app. One physical pixel border at the bottom of the navigation bar.
{% endimage %}

> You can't simply specify a border of 0.5px

Trying to do the same with CSS adds a whole new complexity level to the retina problem.<!-- more --><span id="more"></span> Not long ago we were so happy that we didn't have to handle different pixel ratios and now this. The abstraction is far advanced and there is no sub-pixel support in CSS, so you can't simply specify a border of 0.5px.

The only way I could think of were downscaled images, but that would defeat the whole purpose of fast and responsive web design.

What comes in handy here is that you can use gradients as images in CSS so without further ado here is my solution.

{% highlight css linenos=table %}
.physical-pixel-border {
  background-image: linear-gradient(#f2f2f2, #f2f2f2 50%, transparent 50%);
  background-size: 1px 1px;
  background-repeat: repeat no-repeat;
  background-position: left bottom;
}
{% endhighlight %}
