namespace :db do
  task seed: :environment do
    load(File.join(Rails.root, "db", "seeds.rb"))
  end
end
