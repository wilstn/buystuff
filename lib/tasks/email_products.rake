namespace :email do
  desc "gets the top 2 selling products"
  task :top_product => :environment do
    query = "SELECT pd.name, COUNT(quantity) AS quantity FROM orders o
            INNER JOIN payments p ON p.order_id = o.id
            LEFT JOIN products pd ON pd.id = o.product_id
            GROUP BY pd.name
            ORDER BY quantity DESC
            LIMIT 2"
    results = Order.find_by_sql(query)

    top_product = []

    results.each do |item|
      top_product << [item.name, item.quantity]
    end

    email = ["luyiwigiv@12storage.com"]

    email.each do |email|
      UserMailer.top_product_email(top_product, email).deliver!
    end

  end
end
