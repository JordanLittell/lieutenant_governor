# Lieutenant Governor

**Project Objective**: To make it simple to define your endpoints once in your ```routes.rb``` file and have them automatically generated for use on the client.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lieutenant_governor'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lieutenant_governor
    

## API

Creating a basic URL

```js
// questions/:questions_id

// questions function is created and exported by lieutenant governor
const url = paths.questions({

  // params to be used in the url
  // number of params must match number in url
  params: [ 1 ],
  
});

console.log(url);
// questions/1

```


Creating a URL with query strings appended

```js
// questions/:questions_id

const url = paths.questions({

  params: [ 1 ],
  
  // query strings to be appended to the url
  query: {
    firstName: 'Fred',
    lastName: 'Flintstone'
  }
});

console.log(url);
// questions/1?firstName=Fred&lastName=Flintstone

```


Creating a nested URL
Lieutenant governor creates the function name by appending model names in sequential order. The last model is pluralized.

```js
// questions/:questions_id/answers/:answer_id/votes

const url = paths.questionAnswerVotes({

  params: [ 1, 'abc' ],
  
  query: {
    firstName: 'Fred',
    lastName: 'Flintstone'
  }
});

console.log(url);
// questions/1/answers/abc/votes?firstName=Fred&lastName=Flintstone

```


## Requirements

1. Build system must support transpiling ES6


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jordanlittell/lieutenant_governor. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

