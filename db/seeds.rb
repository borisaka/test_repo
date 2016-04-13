# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Rails.logger = Logger.new(STDOUT)

class Seed
  class << self
    def run!(file)
      Rails.logger.info "#{Time.now.strftime("%Y/%m/%d %H:%M:%S")} SEEDING #{file}"
      require File.join(Rails.root, "db", "seed", "#{file}.rb")
    end
  end
end

files = []

skip = (ENV["SKIP"] || []).split(",")

(files - skip).each do |file|
  Seed.run!(file)
end
