---
title: "Things I hate, part 2"
firstParagraphIsDescription: true
date: 2020-06-27

slug: "things-i-hate-part-2"
---

This time, let's cover a little bit more controversial topics.

## Windows font rendering

As usual, the elephant in the room. Fonts in Microsoft Windows don't
look as good as they do everywhere else. I know the difference is not
that big, it's all just a matter of preference, and if you're used to
them, they'll look great, but who gives a shit. I'm no font expert,
but here are the problems I can see:

* The default fonts are not cute enough. Specifically, in my opinion,
  the default UI font, [Segoe UI], looks like an absolute ass compared
  to [Roboto], [San Francisco], and even [Cantarell].
* As far as I understand, the fonts are extremely hinted, pushing
  every glyph into the pixel boundaries and deforming the intended
  design. As far as I know, by default, no other operating system does
  that.
* Subpixel rendering is used, which while slightly improving the
  resoultion of the rendered glyphs, distorts their color. In addition
  to that, it makes it an absolute pain in the ass to edit the
  screenshots and is technically more difficult to implement and
  display properly. Most of other moder operating systems don't do
  that by default.

[Segoe UI]: https://en.wikipedia.org/wiki/Segoe#Segoe_UI
[Roboto]: https://en.wikipedia.org/wiki/Roboto
[San Francisco]: https://en.wikipedia.org/wiki/San_Francisco_(sans-serif_typeface)
[Cantarell]: https://en.wikipedia.org/wiki/Cantarell_(typeface)

## Apps working only on specific screens

Many cancerous proprietary apps nowadays are guilty for this one, and,
holy fuck, I hate it so much. Usually this problem manifests itself in
form of:

* The app just straight up refusing to switch to the landscape
  orientation
* The app showing an unclosable error message if you're using it in
  the wrong orientation or on the desktop/mobile
* The app going apeshit or refusing to work on low resolutions

I can kinda understand the last 2 - the developers may be lazy or
greedy as fuck or using some overengineered garbage to build the UI.
An ability to use the app somehow in any case would be nice, but
whatever. The first one, however, just doesn't make any goddamn sense.
If you've built your shit with a modern UI toolkit, there's no way it
can break completely after an orientation switch. Some minor things
can occur if you're building something really complex, but, come on,
you're not *that* lazy.

## Improper namespacing

Or, quite often, the complete lack of it. I'm talking here mostly
about variables in programing languages, but it can also apply to many
other things. Here are some examples:

* UNIX shell and classical PHP - everything is just dumped into the
  global namespace and requires careful naming.
* C - in addition to the problems of shell/PHP, careful naming is
  needed even more due to libraries, and the standard is fucked up
  (not only in terms of naming) and extremely long names can
  (theoretically) just not work on some compilers.
* UNIX file hierarchy - a lot of not the best naming and duplicated
  functionality; not that bad overall, but needs to be simplified.
* JavaScript - despite oppurtunities to properly separate everything
  into modules, the global namespace is fucking enormous and contains
  things you probably don't even know existed.
* DNS - it should've been in reverse.

## Printers

Ink problems aside, we live in the 21st century, so you have no excuse
for not using PDFs instead. Just stop wasting resources.

## WYSIWYG editors

I don't know, they just won't work for me. Complex ones like
{Microsoft ,Libre}Office break everything if you're trying to do
something really sophisticated, while simple ones like your favorite
note taking app are much less useful and rarely compatible with each
other. They also often produce horrendous and barely human-readable
plain text (or even worse, binary) markup, which is a pain in the ass
to correct by hand. It's easier to just use a plain text editor and
type Markdown if you need something simple and HTML+CSS if you need
something cool, which I do.
