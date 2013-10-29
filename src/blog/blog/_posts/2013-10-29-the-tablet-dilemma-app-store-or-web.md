---
category: blog
layout: post
author: david
title: "The Tablet Dilemma: App Store or Web"
---
{% include JB/setup %}

A couple of days ago, a customer asked me about my opinion on a delicate question. Assuming you already have a "classic" web app, made for desktop computers, is it worth investing the time and money to create a separate mobile app and publish it on the App Store? The alternative is, of course, not to leave the user alone with a desktop web app, but optimize this app to a certain degree for mobile devices. In this case, it was specifically about tablets.

In my opinion, the focus on tablets make the question much more interesting. While I can see that the user experience often suffers a lot on smartphones of smaller sizes when using websites instead of apps from the app store, a lot of people are using tablets mainly for browsing the web. So what is the better alternative, especially in regards to the user experience?

Obviously, it depends entirely on the use case. It is also possible that use cases differ for different users of the same app. But I want to give you a more meaningful answer than just "it depends".

In an ideal world with unlimited resources you would probably do both.<!-- more --><span id="more"></span> You would have an app in the app store for iPads (I'm using Apple products as a synonym for tablets and app stores) and you would have an optimized version of the web app for iPad as well, just for the reason of being everywhere. However, we don't live in that world. So, the first question is what exactly are the differences between the two approaches (_what_ are we talking about) and the second questions is _how_ one or the other solution would impact the users' experience. Ultimately this will boil down to the question of _why_ you are doing this piece of software for this device in the first place.

<blockquote><p>People don't buy what you do, they buy why you do it.</p>&mdash; <a href="http://www.ted.com/talks/simon_sinek_how_great_leaders_inspire_action.html">Simon Sinek</a></blockquote>

So, in more concrete terms, why do we need this software on the iPad? The answer is always to solve problem X for customers Y. X and Y have to be defined before we can even argue about pros and cons of web app or app store.

Nonetheless, some comments on the differences that I can think of at the top of my head:

## Offline usage
How useful is your app when not connected to internet? Can you still do meaningful tasks with it or is it dependent on the network? Important question, but it's true that we have much better possibilities for offline support in an app container than in just a web app. Still, basic functions can be kept available for web apps as well. It's not a black and white issue.

## Discoverability
_iPad + Software = App Store_ for most people. The idea of a web app is still far from being widespread. People will type "{{your app name}}" into the app store search. What is the strategy for discoverability?

## Deployment and Distribution
Web apps can be updated and "deployed" to users in real time. No delay. No review. You can run split tests, tracking etc. much easier and faster.

## Timing and long-term view
My feeling is that time plays in the hands of those who are betting on the web. Web technologies get better and better every month while nothing really new has happened inside the walled gardens. If you have a web app for desktops anyways, it is almost a must to at least use responsive design and other simple optimizations to make the app more usable on phones and tablets. Over time, more and more such specific optimizations can be added to create an experience that is virtually indistinguishable from a native app (browser navigation and device hardware components aside).

## Usage of hardware
Obviously, an app in the app store, be it phonegap or "native", can use more hardware functions than a simple website. But, you'd be surprised what we have access to in iOS 7, for example, just using a website:

* Offline web applications
* audio element
* Geolocation
* Web Sockets
* File API
* Clipboard API
* Camera (take a picture, choose existing)

Just to name a few. In the end, though, I really believe that if you are seriously debating this question, it's just a symptom of not having your strategic questions answered clearly. Again: Why are you doing this in the first place? What will your users do with it? How will they find your app? If you have a detailed, written (write it down!) answer to these questions, choosing should be easy.
