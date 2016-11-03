SpreeBloggingSpree
==================

[![Build Status](https://travis-ci.org/stefansenk/spree-blogging-spree.png?branch=master)](https://travis-ci.org/stefansenk/spree-blogging-spree)

A basic blogging solution for use with the [Spree](http://github.com/spree/spree/) E-Commerce platform.

The blog is found under /blog on the website font end. Blog entries have fields for title, body, summary, date published, and author. Each blog entry can also have categories and tags associated with it. 

The [Spree Editor](http://github.com/spree/spree_editor/) extension can be used to provide a rich text experience when editing the body of a blog entry.

The author is an instance of `Spree.user_class`, typically a `Spree::User`. The author can be selected from users with the `blogger` role when editing a blog entry in the admin. Some additional fields, including nickname, website URL, and Google Plus URL are added to the user model. Google Authorship information is added to the page head when the Google Plus URL is set.

There is no commenting system yet. One option for adding comments is to override the `spree/blog_entries/comments` partial and include and external commenting system, such as [Disqus](http://disqus.com/).

Admin users can preview blog entries before they're made publicly visible.

This fork differs significantly from the original, it started out as a newly generated extension for Spree 1.2 with the logic copied over and tests moved to RSpec.

Screenshot
----------

This screenshot shows some example blog entries with the widgets in the left sidebar:

![Screenshot](https://raw.github.com/stefansenk/spree-blogging-spree/master/screenshot.png)


Installation
------------

Add to your Gemfile:

```ruby
gem 'spree_blogging_spree', github: 'krazedkrish/spree-blogging-spree', branch: '3-0-stable'
```

Bundle your dependencies and run the installation generator:

```shell
    bundle install
    rake railties:install:migrations
    rake db:migrate
```

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_blogging_spree/factories'
```

TODO
----

Some additional features could include:

- Allow searching for blog entries within the admin.
- Allow searching for blog entries from the shop front end.
- Get default per page from preferences.
- Allow images to be uploaded and inserted. Currently, images (other than the featured image) must be uploaded via other means.
- Add comments (including mechanisms for dealing with spam).
- Add abilities for the 'blogger' role, so a blogger can only manage their own blog entries within the admin.
- Add Twitter Cards meta tags.
- Add Facebook Open Graph meta tags.


Copyright (c) 2014 Stefan Senk, released under the New BSD License
