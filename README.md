# csv-mapper

## DESCRIPTION:

CsvMapper is a small library intended to simplify the common steps involved with importing CSV files to a usable form in Ruby.  CsvMapper is compatible with recent 1.8 versions of Ruby as well as Ruby 1.9+

## EXAMPLES:

The following example will import a CSV file to an Array of Struct[http://www.ruby-doc.org/core/classes/Struct.html] instances.

#### Example CSV File Structure
```
  First Name,Last Name,Age
  John,Doe,27
  Jane,Doe,26
  Bat,Man,52
  ...etc...
```

#### Simple Usage Example
```ruby
  results = CsvMapper.import('/path/to/file.csv') do
    start_at_row 1
    [first_name, last_name, age]
  end

  results.first.first_name  # John
  results.first.last_name   # Doe
  results.first.age         # 27
```

#### Automagical Attribute Discovery Example
```ruby
  results = CsvMapper.import('/path/to/file.csv') do
    read_attributes_from_file
  end

  results.first.first_name  # John
  results.first.last_name   # Doe
  results.first.age         # 27
```

#### Import to ActiveRecord Example
Although CsvMapper has no dependency on ActiveRecord; it's easy to import a CSV file to ActiveRecord models and save them.

```ruby
  # Define an ActiveRecord model
  class Person < ActiveRecord::Base; end

  results = CsvMapper.import('/path/to/file.csv') do
    map_to Person # Map to the Person ActiveRecord class (defined above) instead of the default Struct.
    after_row lambda{|row, person| person.save }  # Call this lambda and save each record after it's parsed.
    
    start_at_row 1
    [first_name, last_name, age]
  end
```
  
See CsvMapper for a more detailed description
  
## REQUIREMENTS:

FasterCSV[http://fastercsv.rubyforge.org/] on pre 1.9 versions of Ruby

## INSTALL:

* sudo gem install csv-mapper

## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2009 Luke Pillow. See LICENSE for details.
