This is the new statically generated version of my personal website.
The contents of this repo are responsible for generating both the
[GitLab Pages] and the [Neocities] versions of it.

[GitLab Pages]: https://kirbykevinson.gitlab.io/
[Neocities]: https://kirbykevinson.neocities.org/

## Dependencies

* Hugo
* Neocities CLI - optional

## How to deploy

```
make gitlab neocities[-with-images]
```

See `Makefile` for more details.

## How to customize

The website uses a custom Hugo theme designed specifically for this
website. Even though I tried to make it behave like an actual theme,
it may still be difficult to change something and/or use it for a
different website. So if you decide to, good luck.

## Where is the old version

It's avaiable [here](https://gitlab.com/kirbykevinson/old-website).
