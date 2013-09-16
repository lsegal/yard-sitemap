# YARD Sitemap

A [YARD][1] plugin to build a sitemap.xml for generated HTML documentation.

## Installation

Add this line to your application's Gemfile:

    gem 'yard-sitemap'

And then execute:

    bundle

Or install it yourself as:

    gem install yard-sitemap

## Usage

Simply activate the plugin when running YARD, setting the SITEMAP_BASEURL
environment variable with the base URL of your site:

    SITEMAP_BASEURL=http://example.org yard doc --plugin sitemap

[1]: http://yardoc.org