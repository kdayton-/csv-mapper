# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'csv-mapper/version'

Gem::Specification.new do |gem|
  gem.name          = "csv-mapper"
  gem.version       = Csv::Mapper::VERSION
  gem.authors       = ["Luke Pillow"]
  gem.email         = ["lpillow@gmail.com"]
  gem.description   = %Q{CSV Mapper makes it easy to import data from CSV files directly to a collection of any type of Ruby object. The simplest way to create mappings is declare the names of the attributes in the order corresponding to the CSV file column order.}
  gem.summary       = %Q{CsvMapper is a small library intended to simplify the common steps involved with importing CSV files to a usable form in Ruby.}
  gem.homepage      = "http://github.com/pillowfactory/csv-mapper"

  gem.add_dependency 'fastercsv'
  gem.add_development_dependency "rspec", ">= 1.2.9"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
