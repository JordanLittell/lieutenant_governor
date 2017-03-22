# Lieutenant Governor

**Objective**: A rails gem to make it simple to define your endpoints once in your ```routes.rb``` file and have them automatically generated for use on the client.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lieutenant_governor'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lieutenant_governor

The lieutenant_governor gem uses your applications routes to construct a javascript module for making requests to the server. Hence, the routes need to be loaded before you invoke the generate method like so:

```ruby
config.after_initialize do
    Rails.application.reload_routes!
    LieutenantGovernor::Generator.generate(path_to_js_helper) #path_to_js_helper is a string 
    #to the desired location of the JS module that gets generated.
end
```
We recommend doing this in `config/environments/development.rb`

## Example Usage

Creating a basic URL

```js
// questions/:questions_id

import * as paths from 'paths';

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

import * as paths from 'paths';

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

```js
// questions/:questions_id/answers/:answer_id/votes

import * as paths from 'paths';

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

## API

Lieutentant governor parses ```routes.rb``` and  generates client side functions to create paths

Route                   | Controller Method      | Generated Function
----------------------- | ---------------------- | -----------
`/api/answer`           | `api_answer`   | paths.apiAnswer
`/api/answers`          | `api_answers`  | paths.apiAnswers
`/api/questions/:question_id/answers`              | `api_question_answers`  | paths.apiQuestionAnswers



When creating the path, the function takes an object so that the developer can specify params and query strings

```js
paths#generatedFunction({ 
   params: [],
   query: {},
});
```

Key                  | Type      | Description
-------------------- | --------- | -----------
`params`             | `array`   | Params to be used in the url. Length must equal count of params expected in url.
`query`              | `object`  | Query strings to be appended to the url


## Requirements

1. Build system must support transpiling ES6


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jordanlittell/lieutenant_governor. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

