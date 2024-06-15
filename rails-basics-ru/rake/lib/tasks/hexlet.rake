# frozen_string_literal: true

require 'csv'

namespace :hexlet do
  desc 'Import users from CSV file'
  task :import_users, [:file_name] => :environment do |_, args|
    print "Task started...\n"
    file_name = args[:file_name]
    CSV.foreach(file_name, headers: true) do |row|
      data = row.to_hash
      data['birthday'] = Date.strptime(data['birthday'], '%m/%d/%Y')
      User.create!(data)
    end
    print "\n...done\n"
  end
end
