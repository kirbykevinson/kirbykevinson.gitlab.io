---
title: "Things wrong with Wayland"
date: 2020-12-23

slug: "things-wrong-with-wayland"
---

I, as a person who tries to use cutting edge technology, am a Wayland
user, and ever since I started using it, I haven't been able to get
the thoughts about its problems out of my head. It's time to get this
thing off my chest. Here are the reasons Wayland is still not here:

## The main problem

You may think that it's the fact that it was decided to move from the
"there's only 1 display server" idea. You're wrong, as that would
invalidate the [core goals] of the project - to be just a protocol
that requires implementations.

[core goals]: https://wayland.freedesktop.org/

What can't be denied, however, is the fact that instead of creating a
full-featured "batteries included" set of protocols and a reference
implementation of a library, compositors based on which could compete
with X by being just as feature complete, there was created only a
[simple compositor], which can only satisfy the needs of a kiosk and
not a modern desktop environment. An unofficial version of [such a
library] didn't even appear until 2017.

[simple compositor]: https://gitlab.freedesktop.org/wayland/weston "weston"
[such a library]: https://github.com/swaywm/wlroots/ "wlroots"

## The consequences it has

### Feature incompleteness

After 12 years of development, the implementations of the protocol
still have a series of features incompletely implemented:

* Color management -
  [1](https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_requests/14),
  [2](https://github.com/swaywm/wlroots/pull/2353),
  [3](https://gitlab.gnome.org/GNOME/mutter/-/issues/1360),
  [4](https://invent.kde.org/plasma/kwin/-/issues/11)
* Variable refresh rate support -
  [1](https://gitlab.freedesktop.org/wayland/wayland/-/issues/84),
  [2](https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1154),
  [3](https://bugs.kde.org/show_bug.cgi?id=405912)
* High bit depth display support -
  [1](https://github.com/swaywm/wlroots/issues/1378),
  [2](https://gitlab.gnome.org/GNOME/mutter/-/issues/1391)
* DRM leasing -
  [1](https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_requests/49),
  [2](https://github.com/swaywm/wlroots/issues/1723)
* [Screencasting](https://github.com/obsproject/rfcs/pull/14)
* [Remote desktop](https://community.teamviewer.com/English/discussion/26340/state-of-wayland-teamviewer)
* [Input simulation and window control](https://github.com/ReimuNotMoe/ydotool)
* Client-side global hotkey binding
* Nvidia GPU support - yes it is indeed Nvidia's fault, but to the
  end user it makes no difference

As you can see, it's not so many, and the partial fault here is on
clients rather than servers.

### Implementation difficulty

On the server side, while it's true that Wayland makes implementing a
display server much easier, implementing a window manager is still a
nightmare. For example, even using a library, you need to write [a
thousand lines of code] to implement the absolute bare bones
compositor, which won't even support such critical things as damage
tracking, hi-DPI, graphical tablets, multiseat, and any input/output
configuration. X, on the other hand, allows you to write as few as [50
lines of code] because it handles most of things such as the ones
listed itself.

[a thousand lines of code]: https://github.com/swaywm/wlroots/tree/master/tinywl "tinywl"
[50 lines of code]: http://incise.org/tinywm.html "tinywm"

### Lack of standardization

Wayland's [core set of protocols] while covering a wide range things,
doesn't provide ones needed to build a modern desktop environment such
as a desktop shell protocol (to build such things as panels and
launchers), a protocol to simulate input and control windows, a
protocol to control the clipboard, and others, leaving that to the
compositors. While [such a set of protocols] does exist, it's not
adopted by the majority of the compositors. A similar problem is
happening to [the set of protocols] required to screenshot, screencast
and remote desktop - the adoption by clients is extremely low. This
makes working with Wayland and debugging it much less flexible and
compositor-dependable than X, and makes developing clients even
harder.

[core set of protocols]: https://gitlab.freedesktop.org/wayland/wayland-protocols/
[such a set of protocols]: https://github.com/swaywm/wlr-protocols/ "wlr-protocols"
[the set of protocols]: https://github.com/flatpak/xdg-desktop-portal "xdg-desktop-portal"

### Lack of configurability

In contrast to X.org, which has [a unified config system], each
Wayland compositor has to implement configuration separately. This
results in not only inconvenience when trying to move the config from
one compositor to another or describing how to configure something,
but also different feature coverage by different compositors. For
example, a compositor may not implement an input configuration such as
scrolling speed or graphical tablet mapping or an output configuration
such as display bit depth. [In some cases] the compositor may not even
implement any input configuration, which makes using it extremely
problematic, especially considering such a problem doesn't exist when
using X.

[a unified config system]: https://linux.die.net/man/5/xorg.conf
[In some cases]: https://github.com/Hjdskes/cage/issues/138

## Conclusion

Considering the listed problems, the Wayland's future doesn't look
that bright. But don't give up hope just yet, as long as we have
projects like wlroots pushing the innovation, not everything is lost!
