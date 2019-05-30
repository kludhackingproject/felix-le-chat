namespace :friendly_id do
  desc "TODO"
  task my_task1: :environment do
  	Item.find_each(&:save)
  end

  desc "TODO"
  task my_task2: :environment do
  	User.find_each(&:save)
  end

end
