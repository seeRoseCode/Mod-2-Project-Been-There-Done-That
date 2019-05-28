require 'json'

flags_file = File.read("flags.json")
flags_hash = JSON.parse(flags_file)