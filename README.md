`time_calculator` is an engine which calculate time left to your birthday.

## Installation

Gemfile:

```ruby
gem 'time_calculator'
```

Run:

  $ bundle install

Or install it yourself as:
```bash
$ gem install time_calculator
```

## Usage

Visit `/time_calculator/calculator` and select birthday

or 

Create an instance of `TimeCalculator`, which accepts your birthday date as string or `DateTime` object.

Use method `time_to_next_date` to calculate time left to your birthday. It returns `Struct` with keys `[:days, :hours, :minutes]`.

