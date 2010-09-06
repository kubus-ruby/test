# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

User.create!(:name => 'admin', :password => 'admin')
Product.create!(:price => 10, :title => 'Agile web development', :description => 'blablabla', :photo => File.open(File.join(Rails.root, 'db', 'fixtures', 'image.jpg')))
Comment.create!(:product_id => 1, :name => 'root', :body => 'root', :parent_id => nil, :lft => 1, :rgt => 2)
