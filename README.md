# Guard::Focus

Guard::Focus allows you to automatically run RSpec and Cucumber features in a
style one might call "Focus Driven Development".

It replaces guard-rspec & guard-cucumber with a stripped down version that will
run with `--tag @focus` if any examples or scenarios are tagged with `focus`.

It is currently very early stage with no tests. It has been verfied to work on
only one machine & project. As I put it through it's paces on other projects at
Hashrocket I hope to improve this situation. If you take it for a spin I'd love
to hear any problems/feedback.


## Features

Guard::Focus is very minimal. It only has 3 features:

* If a file change results in running a spec/feature without a `focus` tag, it
  will run with `rspec spec/path_to_file_spec.rb`
* If a file change results in running a spec/feature that contains a `focus`
  tag it will run with `--tag @focus appended.`
* When running all guards via `enter` it will run with the focus tag if any of
  the specs/features contains a focus tag. If not, the suite will be run
  normally.

## Install

Install gem directly:

    $ gem install guard-focus

Or add it to your Gemfile:

    group :test, :development do
      gem 'guard-focus'
    end

## Guardfile

Guard::Focus comes with a Guardfile template you can install with:

    $ guard init focus

It gives you focused guards for both rspec & cucumber.

    guard 'focus', on: :rspec do
      watch(%r{^spec/.+_spec\.rb})
      watch(%r{^app/(.+)\.rb})                           { |m| "spec/#{m[1]}_spec.rb" }
      watch(%r{^lib/(.+)\.rb})                           { |m| "spec/#{m[1]}_spec.rb" }
      watch(%r{^app/controllers/(.+)_(controller)\.rb})  { |m| "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb" }
    end

    guard 'focus', on: :cucumber do
      watch(%r{^features/.+\.feature$})
    end

## Credits & Thanks

* [Veezus Kriest](http://twitter.com/veezus): When I first said "I'd autotest if..." he made it so in his 'testify' watchr config.
* [Dave Lyon](htt://twitter.com/daveisonthego): For his 'vanguard' implementation using guard-rspec & guard-cucumber.
