# A better approach than using this gem

Alternatively add something like this to your `.pryrc` file:

```ruby
def measure(execution_times, &b)
  require 'benchmark'
  
  Benchmark.bm do |x|
    execution_times.times do
      x.report yield
    end
  end
end
```


# pry-measure

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

  ```bash
  pry-measure -t 10 #{`curl http://google.com`}
  ```

The above passes the interpolated code to [Benchmark.measure](http://www.ruby-doc.org/stdlib-1.9.3/libdoc/benchmark/rdoc/Benchmark.html#method-c-measure) to be evaluated 10 times. Upon completion the command returns a results hash with the average times:

  ```ruby
  => {
    :real => 0.1958,
    :utime => 0.0,
    :stime => 0.002,
    :total => 0.056
  }
  ```

  ```bash
  pry-realtime #{`curl http://google.com`}
  => 0.6405
  ```


