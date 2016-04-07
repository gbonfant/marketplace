Requirements
======

* Bundler 10.x
* Ruby 2.x

Set up
====

`bundle install`

Running tests
====
` rspec spec`

The `spec/integration` tests cover the given test data examples.

How to use
======

```bash
$ irb
> Dir["app/models/*.rb"].each { |file| require_relative file }
> promotional_rules = [BulkPurchaseDiscount.new, LargePurchaseDiscount.new]
> # play around
```
