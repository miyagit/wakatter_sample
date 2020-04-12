categories = []
['Ruby', 'Rails', 'HTML5・CSS3', 'JavaScript', 'IT用語', 'お役立ち情報', 'その他'].each do |category_name|
  category = Category.new(name: category_name)
  categories << category
end
Category.import categories
