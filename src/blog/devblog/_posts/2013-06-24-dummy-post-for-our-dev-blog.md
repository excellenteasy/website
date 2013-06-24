---
category: dev
layout: post
author: stephan
title: Dummy Post for our Dev Blog
---
{% include JB/setup %}

{% highlight coffeescript linenos=table %}
if this is that
  this
else
  that

class Bar
  buddy: 'biznass'
  constructor: (yeah) ->
    buddy
{% endhighlight %}

{% highlight javascript linenos=table %}
if (this === that) {
  return this;
} else {
  return that;
}
{% endhighlight %}

{% highlight css linenos=table %}
#yeahbuddy {
  foo: bar;
}
{% endhighlight %}

{% highlight css linenos=table %}
#yeahbuddy {
  foo: bar;
  #bar {
    bar: boo;
  }
}
{% endhighlight %}

*iOS* and *Android* are the **world's two largest mobile operating systems** [empowering over 90% of smartphones and tablets](http://en.wikipedia.org/wiki/Usage_share_of_operating_systems#Mobile_devices). However the differences in the user experience, distribution of the apps as well as the operating systems is quite distinct.

Many people have a hard time transitioning from one platform to another. It is not unlike the experience of going from a Blackberry to an iPhone when the elegant iPhone touchscreen first emerged. When you ask a loyal *iOS* user to switch to an *Android*-powered device, you are more likely to come across a face filled with bafflement and disorientation rather than bliss.

{% image ios_devices.jpg %}
  title: different iOS devices lying on a table
  alt: different iOS devices lying on a table
  caption: Photo by [Blake Patterson](http://www.flickr.com/photos/35448539@N00/4773693893) [CC BY 2.0](http://creativecommons.org/licenses/by/2.0/)
{% endimage %}

This reaction is not surprising but it does not mean that we are trapped in a dead end. Simply understanding the differences between *iOS* and *Android* would certainly allow us to appreciate – and soon – conquer them both.

## The Skin-Deep Divide

First things first – these two ubiquitous operating systems were birthed by equally distinct giants when it comes to the digital and mobile technology industry. <!-- more --><span id="more"></span>[*Android* is a product of Google](http://www.android.com/) while [*iOS* is created by Apple](http://www.apple.com/iphone/ios/).

As trivial as it may seem at first glance, the divergence when it comes to the manufacturers of the operating systems is far greater than the appearance of the devices on the store shelves or their price difference.

What most consumers don't realize is that the operating systems are quite different from a programming language perspective. Google's *Android* mobile devices are built upon the Java programming language, while apps for iPhones and iPads are powered with Objective-C.

To put it in simpler terms, apps that were developed for an *Android* powered device can not be simply moved to an *iOS*-powered device and vice versa. The apps simply won't work. For instance, it's impossible to run apps with a *.apk* file extension on an iPhone or a *.ipa* file on an *Android* device.

The user experience difference between both devices are even more pronounced. In particular, *Android*'s graphical user interface clearly diverges from *iOS*' UIKit touch interfaces.

The graphical user interface (GUI) experienced using *Android* devices utilizes particular images as signals to perform certain commands. To illustrate this, [picture yourself unlocking the screen of an *Android*](http://www.android.com/about/ice-cream-sandwich/#face-unlock). When asked to slide your fingers, the line that you create is the image that signals your device to unlock its screen – allowing you then to perform other graphical or image-based functions.

{% image gestures.jpg %}
  title: unlocking an Android devices with a swipe gesture
  alt: unlocking an Android devices with a swipe gesture
  caption: Photo by [Robert Bejil](http://www.flickr.com/photos/28618109@N05/6783731870/) [CC BY 2.0](http://creativecommons.org/licenses/by/2.0/)
{% endimage %}

Like *Android*, *iOS* has a gesture recognition system, but it is fundamentally different. Instead of creating an image of a vertical line, you are prompted to create a horizontal line to unlock an *iPhone*. This is known as the "slide to unlock" gesture.

These characteristics diverge further when you look at the millions of apps published for these devices. Apple has a very strict process of reviewing the apps that are sold in the *App Store*. Furthermore, the *App Store* is the only commercial distribution hub for *iOS* apps. On the other hand, Google distributes *Android* apps through *Google Play* and allows you to install them from any source you like. There are little to no restrictions on how *Android* apps are distributed and furthermore there is no review process.

{% image mobile_devices.jpg %}
  title: different mobile devices
  alt: different mobile devices
  caption: Photo by [Jeremy Keith](http://www.flickr.com/photos/74105777@N00/7753864240/) [CC BY 2.0](http://creativecommons.org/licenses/by/2.0/)
{% endimage %}

Both companies limit the distribution of their apps to certain devices but their are philosophical and distribution differences here too. *iOS* is limited to only Apple platforms such as the *iPhone*, *iPod Touch* & *iPad*. Only Apple makes *iOS* devices. However *Android* follows a similar line of reasoning that Microsoft adopted with Windows allowing numerous hardware suppliers to adopt their operating system. Therefore the *Android* market is larger because several leading manufacturers such as Samsung, HTC, Acer, Lenovo, LG, and such have adopted it as their mobile operating system. While you can reach much more devices and therefore people with Android, it's proportionally more difficult to support all the different screen sizes and hardware differences.

## Breaking the boundaries between Android and iOS

As previously mentioned, despite the obvious differences between *iOS* and *Android*, we are not trapped in a dead end. There is a way to erase the line that separates *Android* from *iOS* for app publishers.

Most of the cross-platform solutions offered don't take into account all of the fine differences we have explored. They simply ship the same looking app for both platforms. This produces a lowest common denominator app that attempts to fit into both worlds while leaving the user disappointed.

At *excellenteasy* we specialize in converting existing iOS applications to Android. This means you can develop a native iOS application with an outstanding experience and we will translate all the fine details to a carefully crafted Android app.
