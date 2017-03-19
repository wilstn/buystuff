namespace :products do
  desc "Prints all the available products with quantity left"
  task :print => :environment do
    Product.all.each do |product|
      puts "Product Name: #{product.name}, Left: #{product.remaining_quantity}"
      puts "-----------------------"
    end
  end

  desc "Prints all the available products with quantity left in csv"
  task :print_csv => :environment do
    puts "Product Name,Remaining_quantity"
    Product.all.each do |product|
      puts "#{product.name},#{product.remaining_quantity}"
    end
  end
end
