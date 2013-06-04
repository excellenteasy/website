---
layout: post
author: stephan
title: User Interface Characteristics of Mobile Operating Systems
---
{% include JB/setup %}

Imagine two smartphones, one running Apple's *iOS* and the other running Google's *Android*. While these two devices might look similar, especially for inexperienced users, you know it literally feels different once you get to use them. This is caused by **fundamentally diverging User Interface concepts** that underlie these mobile operating system. Let's take an in-depth look at the main differentiators.

## Navigation Observations

{% image ios_back_button.png %}
  title: iOS back button
  alt: iOS back button in the contacts app
{% endimage %}

The way **iOS handles navigation** is through its navigation bar. It's located on the top of the screen, just below the status bar. In the navigation bar is the title of the current page that you are on and controls specific to the content like Submit, Cancel or Done. The most interesting part, especially in comparison to Android, is that the *back button* can take you to the the hierarchical parent of the page. To elaborate, for each page of any app, there is a hierarchy that you navigate through. If you go to a specific contact from the list of contacts in your address book and press back it will take you back to the contacts.

{% image android_back_button.png %}
  title: Android navigation concept
  caption: [Image Source](http://developer.android.com/design/patterns/navigation.html)
{% endimage %}

**Navigation for Android** is slightly different. <!-- more --><span id="more"></span>Android phones and tablets feature a hardware *back button* as well as a software *up button*. The back button directly relates to the page that you just came from, this means that there is no hierarchy related to the back button. If you are on Facebook and switch to a contact in the Contacts app the back button will bring you right back to Facebook. However the *up button* does use a hierarchy so it would bring you – just as with iOS – to the contacts list.

{% image ios_tool_and_tab_bar.png %}
  title: iOS tool bar and tab bar
{% endimage %}

Items on the *iOS tool bar* perform actions related to what is on the screen, e.g. Share. However the *iOS tab bar* allows you to switch to different sub-tasks, modes, or views. For example you can switch from your alarm to a stopwatch from the tab bar.

{% image android_action_bar.png %}
 title: Android action bar
{% endimage %}

**Android's action bar** is like a combination of the two. Both tools and tabs are placed inside an action bar. While there is a dropdown of tabs on the left side (e.g. Listen Now) the tools that are used more often are placed on the right side of the bar, and the ones that are used less often are placed in yet another dropdown menu hidden behind a *More button* (e.g. Search, More).

*Android* phones and tablets come with a **multi-pane view**. With a smaller device, tapping on something might take you to a detailed view of the page. On a tablet, if you click on that same thing in the multi-pane layout you will have the detailed view appear on screen next to the original view. *iOS* does not really have a multi-pane layout so it takes a bit of reorganization to transfer information.


## Skeuomorphism vs. Flat Design

*iOS* is based on a concept called [skeuomorphism](http://en.wikipedia.org/wiki/Skeuomorph), whereby objects (UI elements) are designed to resemble their real-life counterparts, textures or materials. For example, the Notes app on *iOS* has the look of a real notebook. *Android* leans more to a [flat design](http://fltdsgn.com/). The UI elements are very distinctly "digital" and therefore are not meant to resemble real-life objects.

{% image skeuomorphism_vs_flat_design.png %}
 title: Skeuomorphism vs. Flat Design
{% endimage %}

*iOS* has some areas on the interface that if you tap nothing will happen, like blank metal surfaces on an old analog radio. Android focuses more on allowing you to tap anywhere because almost every space on a page should be useable.

In some areas of the *iOS* interface when you tap nothing will happen. This is similar to the blank metal surfaces of an old analog radio. Only the knobs are usable. Android focuses more on allowing you to tap anywhere on the surface/pane because the philosophy based on flat design principles is that almost every space on a page should be usable.

## Converting apps from one system to another

Even though there is only a slight difference it takes a bit of reorganizing to get your app to work well when you transfer it from one operating system to the other.

At *excellenteasy* we specialize in converting existing iOS applications to Android. This means you can develop a native iOS application with an outstanding experience and we will translate all the fine details to a carefully crafted Android app.
