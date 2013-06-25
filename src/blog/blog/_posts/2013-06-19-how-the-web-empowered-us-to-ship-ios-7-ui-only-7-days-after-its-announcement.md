---
category: blog
layout: post
author: david
title: How the web empowered us to ship iOS 7 UI only 7 days after its announcement
---
{% include JB/setup %}

Unfortunately, the idea of creating mobile apps with HTML, CSS and JavaScript still gets this “*If it's cheap, it can't be any good*” look. This mindset is incorrect and outdated. I want to demonstrate in this article why betting on the web is the right decision and what unexpected advantages this approach holds. *HTML5 is ready for prime time*.

{% image ios7_conversation.jpg %}
  title: A conversation about iOS 7
  caption: Photo by [William Hook](http://www.flickr.com/photos/83542829@N00/9017190514/) [CC BY SA 2.0](http://creativecommons.org/licenses/by-sa/2.0/)
{% endimage %}
Since we started to exclusively focus on mobile web apps over two years ago, we’ve seen the release of iOS 5 and 6. And every iteration has pushed the boundaries of what the browser and WebView can do. The same is true for the evolving Android versions as well. For each OS version, *we created a set of UI elements that our users can not tell apart from their native counterparts*.

The introduction of iOS 7 is a departure from the UI schemes we created for iOS 5 and 6. So while the transition from iOS 5 to 6 was relatively trivial <!-- more --><span id="more"></span>since the primary change was only a changed gradient, *the transition from iOS 6 to 7 appears to be way more dramatic*.

<blockquote class="twitter-tweet"><p>Mobile web apps that try to look &quot;native&quot; are going to look very dated when iOS 7 comes out.</p>&mdash; <a href="https://twitter.com/markdalgleish/statuses/346484438101794818">Mark Dalgleish (@markdalgleish)</a></blockquote>

With iOS 7, the UI design has radically changed (some say “flattened”) and a lot of people have claimed that web developers are going to be in a world of trouble if they tried to create User Interface elements that look and feel native. This is assumed, because now all UI elements need to be updated from the iOS 6 to the iOS 7 look. But rather than looking at this as a problem, we actually see it as *a great opportunity to demonstrate that the web is the right choice*.

For comparison when you start with native development, you start with a set of UI elements supplied by the operating system (e.g. UIKit). If you want to create a button, you just call the UIButton class and the button will be there. But when choosing web development, you start with a blank, white canvas. There is nothing there in the beginning and you have to create everything from scratch. And this is precisely the reason why we have created a framework for our apps, because we don’t want to repeat all the foundation building steps over and over again. Instead, we want to have a solid foundation that helps us build great apps that are on par or go beyond of what native apps can do. *Our framework provides the same level of abstraction as our native counterparts*. So, for example, we have a Button class for buttons, a NavigationBar class for navigation bars, etc. In a nutshell, our framework also supplies a UI for web apps just like UIKit supplies a UI for iOS native apps.

> With a 7 day turn around time we created an app that runs […] unreleased iOS 7 UI today.

On Monday, June 10th, when iOS 7 was announced and demonstrated at WWDC 2013, we already thought about how we could bring this to our framework and customers. Just 48-hours later, *we had updated our UI framework significantly*. This is what it looked like after less than two days:

{% image uicing_ios7_plainTableView.png %}
  title: Our updated UI library for iOS 7
{% endimage %}
Once this was done, *we started converting one of our clients’ apps* called [LaunchTracker](https://itunes.apple.com/us/app/dockmaster-launchtracker/id581697493?mt=8) to iOS 7. It took us 7-days from the moment that iOS 7 was announced on stage at WWDC by Apple’s VP of Engineering, Craig Federighi to the submission of the updated app to the AppStore. After additional three days the App is even ["Available on the App Store"](https://itunes.apple.com/us/app/dockmaster-launchtracker/id581697493?mt=8).

*So with a 7 day turn around time we created an app that runs on iOS 5 or 6 with the latest, unreleased iOS 7 UI today*. I want to see a native developer do that. Of course we could still deploy our iOS 6 UI, but our customers have the choice how their apps look and behave on different platforms and operating system versions. This is what the app looks like, before and after:

{% image launchtracker_ios6_ios7.png %}
  title: LaunchTracker iOS 6 and iOS 7 comparison
  caption: Fullsize: [Customers iOS7](https://d2b0jc4z1uybmh.cloudfront.net/website/blog/images/lt_ios7_customers_660.png) – [Customers iOS6](https://d2b0jc4z1uybmh.cloudfront.net/website/blog/images/lt_ios6_customers_660.png) – [Ticket iOS7](https://d2b0jc4z1uybmh.cloudfront.net/website/blog/images/lt_ios7_ticket_660.png) – [Ticket iOS6](https://d2b0jc4z1uybmh.cloudfront.net/website/blog/images/lt_ios6_ticket_660.png)
{% endimage %}
The web is a great opportunity. And not just because we can deploy to multiple platforms. But it’s also an opportunity because we can do excellent work. What I want to show with this post is that this is not a contradiction. *You can make amazing apps that go beyond what the average native app can do*. Or beyond of what the average native user experience is like. You can create an experience that is just great for the customer.

Of course, it takes time to learn and you need to have the right tools, but time is on our side. The browsers are getting better every day and everyone is committed to pushing the web forward. Apple announced at WWDC that a lot of their own apps are making heavy use of WebViews, the App Store, for example. *If you start now, make a bet on the web*.
