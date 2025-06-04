[
  { id: 1, name: 'Ruby' },
  { id: 2, name: 'Rails' },
  { id: 3, name: 'HTML5・CSS3' },
  { id: 4, name: 'JavaScript' },
  { id: 5, name: 'IT用語' },
  { id: 6, name: 'お役立ち情報' },
  { id: 7, name: 'その他' }
].each do |category|
  Category.find_or_create_by!(id: category[:id]) do |c|
    c.name = category[:name]
  end
end

# ユーザー作成
users = [
  { username: 'ぴっかちゃん', email: 'user1@example.com', password: 'password' },
  { username: 'pikawaka', email: 'user2@example.com', password: 'password' },
  { username: 'あの', email: 'user3@example.com', password: 'password' }
]

users.each do |user|
  User.find_or_create_by!(email: user[:email]) do |u|
    u.username = user[:username]
    u.password = user[:password]
  end
end

# 投稿作成
posts = [
  { title: 'Rubyの基本', url: 'https://ruby-lang.org', description: 'Rubyに興味がある方や、これから学び始めたいと考えている方におすすめの公式サイトをご紹介します。

「Ruby公式サイト」では、Rubyの特徴や理念、インストール方法、開発環境の整え方などがわかりやすくまとめられています。さらに、最新バージョンの情報やリファレンス、関連ツールの紹介も充実しており、初学者はもちろん、経験者にとっても役立つ情報源となっています。

Rubyの魅力や可能性を知るきっかけとして、まずはこちらの公式サイトをご覧になることをおすすめします。', category_id: 5, user_id: User.first.id },
  { title: '基本のカレーライス', url: 'https://www.sbfoods.co.jp/recipe/movie/curry/007.html', description: 'カレー粉を使って、昔ながらの手作りカレーライスに挑戦してみたい方におすすめのレシピをご紹介します。

エスビー食品の「カレー粉で作る基本のカレーライス」は、ルウから手作りする本格的なカレーの作り方を、丁寧に解説した動画付きのレシピです。炒め玉ねぎの甘みとスパイスの香りが調和した、懐かしくも深みのある味わいが特徴です。

特に、カレー粉を加えるタイミングやルウの作り方など、香りを引き立てるための工夫が紹介されており、スパイスの魅力を存分に楽しむことができます。

市販のルウでは味わえない、手作りならではの風味豊かなカレーをぜひ一度お試しください。', category_id: 7, user_id: User.third.id },
  { title: 'Railsのチュートリアル', url: 'https://railstutorial.jp/', description: 'Ruby on Railsを使ってWebアプリケーション開発を学びたい方におすすめの学習サイトをご紹介します。

「Railsチュートリアル」は、SNSのようなWebサービスを実際に作りながら、開発の流れを体系的に学べる教材です。開発環境の構築から始まり、ユーザー登録、ログイン機能、テスト、デプロイまで、実践的な内容が網羅されています。

このチュートリアルは、大学や企業の研修でも採用されており、信頼性の高い教材として評価されています。テキストだけでなく、解説動画や電子書籍も用意されており、自分の学習スタイルに合わせて進めることができます。

Ruby on Railsを基礎からしっかり学びたい方や、実際のプロダクト開発を体験したい方にとって、非常に有益なサイトです。ぜひ一度ご覧ください。
', category_id: 2, user_id: User.second.id },
  { title: 'Pay Palの使い方', url: 'https://pikawaka.com/tips/paypal', description: 'PayPalの仕組みや使い方を基礎から学びたい方にぴったりの解説記事をご紹介します。

「ピカワカ」のこちらのページでは、PayPalの基本的な概要からアカウントの作成方法、送金や支払いの手順、注意点までをわかりやすく解説しています。実際の画面付きで手順が説明されているため、初めての方でも迷わず操作を進めることができます。

オンラインでの取引や個人間送金の手段としてPayPalを検討している方にとって、事前に知っておきたい情報がコンパクトにまとまっている便利なページです。

これからPayPalを使ってみたい方は、ぜひ参考にしてみてください。HTML5の新機能について解説', category_id: 3, user_id: User.third.id },
  { title: 'ゼロからのPythin入門講座', url: 'https://www.python.jp/train/index.html', description: 'Pythonを基礎からしっかり学びたい方におすすめのサイトがあります。
  「Python学習講座」では、プログラミング初心者にもわかりやすい解説で、Pythonの基本文法から応用的な内容まで丁寧に紹介されています。
  
  実際のコード例が豊富に掲載されており、手を動かしながら学習できる構成になっているため、独学でも無理なく進めることができます。
  学習の進度に合わせて段階的に内容を深めていけるので、初学者から中級者まで幅広く対応しています。
<br>Pythonをこれから始める方、あるいは基礎をしっかり固め直したい方にとって、とても有益なサイトです。
ぜひ一度こちらのページをご覧ください。', category_id: 7, user_id: User.first.id }
]

posts.each do |post|
  Post.find_or_create_by!(title: post[:title]) do |p|
    p.url = post[:url]
    p.description = post[:description]
    p.category_id = post[:category_id]
    p.user_id = post[:user_id]
  end
end
