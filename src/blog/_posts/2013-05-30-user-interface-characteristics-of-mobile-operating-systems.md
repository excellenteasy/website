---
layout: post
author: stephan
title: User Interface Characteristics of Mobile Operating Systems
published: false
---
{% include JB/setup %}

Imagine two smartphones, one running Apple's *iOS* and the other running Google's *Android*. While these two devices might look similar, especially for unexperienced users, you know it litteraly feels different once you get to use them. This is caused by **fundamentally diverging User Interface concepts** that underlie these mobile operating system. Let's have an in-depth look at the main differentiators.

## Navigation

{% image ios_back_button.png %}
  title: iOS back button
  alt: iOS back button in the contacts app
{% endimage %}

The way **iOS handles navigation** is through its navigation bar. It's located on the top of the screen, just below the status bar. In the navigation bar is the *title of the current page* that you are on and *controls specific to the content* like Submit, Cancel or Done. The most interesting part, especially in comparison to Android, it the *back button* that can take you to the the hierarchical parent of the page. To elaborate, for each page of any app, there is a hierarchy that you navigate through. If you go to a specific contact from the list of contacts in your addressbook, then press back it will take you back to the contacts.

{% image android_back_button.png %}
  title: Android navigation concept
  alt: Android navigation concept
{% endimage %}
[Image Source](http://developer.android.com/design/patterns/navigation.html)

**Navigation for Android** is slightly different. <!-- more --><span id="more"></span>Phones and tablets feature a hardware back button as well as a software up button. The back button directly relates to the page that you just came from, this means that there is no hierarchy related to the back button. If you are on Facebook and switch to a contact in the contacts apps the back button will bring you right back to Facebook. Instead the up button does use a hierarchy so it would bring you – just as iOS – to the contacts list.

{% image ios_tool_and_tab_bar.png %}
  title: iOS tool bar and tab bar
  alt: iOS tool bar and tab bar
{% endimage %}

Items on the **iOS tool bar** perform actions related to what is on the screen, e.g. Share. The **iOS tab bar** however  allows you to switch to different sub-tasks, modes, or views. For example you can switch from your alarm to a stopwatch from the tab-bar.

{% image android_action_bar.png %}
 title: Android action bar
 alt: Android action bar
{% endimage %}

 **Android's action bar** is like a combination of the two. Both tools and tabs are placed inside an action bar.
 While there is a dropdown of tabs on the left side (Listen Now) the tools that are used more often are placed on the right side of the bar, and the ones that are used less often are placed in yet another dropdown menu hidden behind a more button (Search, More).

*Android* has its phones and tablets come with a **multi-pane view**. With a smaller device, clicking on something might take you to a detailed view of the page. How the multi-pane layout works though is that with a tablet if you click on that same thing you will have the detailed view appear on screen next to the original view. *iOS* does not really have a multi-pane layout so it takes a bit of reorganization to transfer information.

## Skeuomorphism vs. Flat Design

With *iOS*'s design that focuses on [skeuomorphism](http://en.wikipedia.org/wiki/Skeuomorph), you have apps that look like their real-life counterparts. For example, the notes app on *iOS* has the look of a real notebook. *Android* on the other hand, has more of a [flat design](http://fltdsgn.com/), where there are no real-life analogies associated to their UI elements.

{% image skeuomorphism_vs_flat_design.png %}
 title: Skeuomorphism vs. Flat Design
 alt: Skeuomorphism vs. Flat Design
{% endimage %}

*iOS* has some areas on the interface that if you tap nothing will happen, like blank metal surfaces on an old analog radio. Android focuses more on allowing you to tap anywhere because almost every space on a page should be useable.

## Converting apps from one system to another

Even though there is only a slight difference it takes a bit of reorganizing to get your app to work well when you transfer it from one operating system to the other.

We at *excellenteasy* have specialized in converting existing iOS applications to Android. This means you can develop a native iOS application with an outstanding experience and we’ll translate all the fine details to a carefully crafted Android app afterwards.
