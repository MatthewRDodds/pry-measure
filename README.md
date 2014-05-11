# pry-measure
============

Adds `pry-measure` command for quick adhoc benchmarking.


## Installation

  ```ruby
  gem install pry-measure
  ```

or added to the Gemfile:
  ```ruby
  gem 'pry-measure'
  ```

## Usage

```ruby
pry-measure -t 1000 #{ "a"*1_000_000 }
```

The above passes the code `"a"*1_000_000` to Benchmark.measure to be evaluated 1000 times. Upon completion the command returns a results object:

```ruby
#<PryMeasure::Results:0x00000100a50748 @total_time=17.0, @user_cpu_time=16.44, @system_cpu_time=0.5599999999999999, @real_time=17.30274510383606>
```
