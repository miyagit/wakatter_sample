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
  { username: 'ぴっかちゃん', email: 'user1@example.com', password: 'password', job: 'プログラマー', profile: 'Ruby、Railsを中心にWeb開発を行っています。新しい技術を学ぶのが好きです。' },
  { username: 'pikawaka', email: 'user2@example.com', password: 'password', job: 'エンジニア', profile: 'フロントエンドからバックエンドまで幅広く開発しています。学習したことをアウトプットするのが趣味です。' },
  { username: 'あの', email: 'user3@example.com', password: 'password', job: 'デザイナー', profile: 'UI/UXデザインとフロントエンド開発を担当しています。美しいデザインと使いやすさを追求しています。' },
  { username: 'コード太郎', email: 'user4@example.com', password: 'password', job: '学生', profile: '情報系の大学生です。プログラミングを勉強中で、将来はエンジニアになりたいと思っています。' },
  { username: 'テック花子', email: 'user5@example.com', password: 'password', job: 'データサイエンティスト', profile: 'Python、R、機械学習を使ってデータ分析を行っています。統計学とプログラミングが専門です。' },
  { username: 'ウェブ次郎', email: 'user6@example.com', password: 'password', job: 'フリーランス', profile: 'Web制作とシステム開発のフリーランスエンジニアです。新しい技術のキャッチアップを心がけています。' },
  { username: 'プログラミング初心者', email: 'user7@example.com', password: 'password', job: '会社員', profile: '営業職ですが、業務効率化のためにプログラミングを学び始めました。基礎から頑張っています。' },
  { username: 'AIエンジニア', email: 'user8@example.com', password: 'password', job: 'AIエンジニア', profile: '機械学習とディープラーニングの研究開発を行っています。最新のAI技術に関心があります。' }
]

users.each do |user|
  User.find_or_create_by!(email: user[:email]) do |u|
    u.username = user[:username]
    u.password = user[:password]
    u.job = user[:job]
    u.profile = user[:profile]
  end
end

# 投稿作成
posts = [
  { title: 'Rubyの基本', url: 'https://ruby-lang.org', description: 'Rubyに興味がある方や、これから学び始めたいと考えている方におすすめの公式サイトをご紹介します。

「Ruby公式サイト」では、Rubyの特徴や理念、インストール方法、開発環境の整え方などがわかりやすくまとめられています。さらに、最新バージョンの情報やリファレンス、関連ツールの紹介も充実しており、初学者はもちろん、経験者にとっても役立つ情報源となっています。

Rubyの魅力や可能性を知るきっかけとして、まずはこちらの公式サイトをご覧になることをおすすめします。', category_id: 1, user_id: 1 },
  { title: '基本のカレーライス', url: 'https://www.sbfoods.co.jp/recipe/movie/curry/007.html', description: 'カレー粉を使って、昔ながらの手作りカレーライスに挑戦してみたい方におすすめのレシピをご紹介します。

エスビー食品の「カレー粉で作る基本のカレーライス」は、ルウから手作りする本格的なカレーの作り方を、丁寧に解説した動画付きのレシピです。炒め玉ねぎの甘みとスパイスの香りが調和した、懐かしくも深みのある味わいが特徴です。

特に、カレー粉を加えるタイミングやルウの作り方など、香りを引き立てるための工夫が紹介されており、スパイスの魅力を存分に楽しむことができます。

市販のルウでは味わえない、手作りならではの風味豊かなカレーをぜひ一度お試しください。', category_id: 7, user_id: 3 },
  { title: 'Railsのチュートリアル', url: 'https://railstutorial.jp/', description: 'Ruby on Railsを使ってWebアプリケーション開発を学びたい方におすすめの学習サイトをご紹介します。

「Railsチュートリアル」は、SNSのようなWebサービスを実際に作りながら、開発の流れを体系的に学べる教材です。開発環境の構築から始まり、ユーザー登録、ログイン機能、テスト、デプロイまで、実践的な内容が網羅されています。

このチュートリアルは、大学や企業の研修でも採用されており、信頼性の高い教材として評価されています。テキストだけでなく、解説動画や電子書籍も用意されており、自分の学習スタイルに合わせて進めることができます。

Ruby on Railsを基礎からしっかり学びたい方や、実際のプロダクト開発を体験したい方にとって、非常に有益なサイトです。ぜひ一度ご覧ください。
', category_id: 2, user_id: 2 },
  { title: 'Pay Palの使い方', url: 'https://pikawaka.com/tips/paypal', description: 'PayPalの仕組みや使い方を基礎から学びたい方にぴったりの解説記事をご紹介します。

「ピカワカ」のこちらのページでは、PayPalの基本的な概要からアカウントの作成方法、送金や支払いの手順、注意点までをわかりやすく解説しています。実際の画面付きで手順が説明されているため、初めての方でも迷わず操作を進めることができます。

オンラインでの取引や個人間送金の手段としてPayPalを検討している方にとって、事前に知っておきたい情報がコンパクトにまとまっている便利なページです。

これからPayPalを使ってみたい方は、ぜひ参考にしてみてください。HTML5の新機能について解説', category_id: 6, user_id: 3 },
  { title: 'ゼロからのPython入門講座', url: 'https://www.python.jp/train/index.html', description: 'Pythonを基礎からしっかり学びたい方におすすめのサイトがあります。
  「Python学習講座」では、プログラミング初心者にもわかりやすい解説で、Pythonの基本文法から応用的な内容まで丁寧に紹介されています。
  
  実際のコード例が豊富に掲載されており、手を動かしながら学習できる構成になっているため、独学でも無理なく進めることができます。
  学習の進度に合わせて段階的に内容を深めていけるので、初学者から中級者まで幅広く対応しています。
<br>Pythonをこれから始める方、あるいは基礎をしっかり固め直したい方にとって、とても有益なサイトです。
ぜひ一度こちらのページをご覧ください。', category_id: 7, user_id: 1 },
  { title: 'JavaScript初心者のためのMDN Web Docs', url: 'https://developer.mozilla.org/ja/docs/Web/JavaScript', description: 'JavaScriptを本格的に学びたい方におすすめの公式ドキュメントです。

MDN Web DocsのJavaScriptセクションは、基本的な構文から高度なプログラミング概念まで網羅的に解説されています。実用的なサンプルコードが豊富で、実際に動かしながら学習できるのが大きな特徴です。

ブラウザの互換性情報も充実しており、実際の開発で直面する問題の解決にも役立ちます。初心者から上級者まで、レベルに応じて活用できる信頼性の高いリソースです。', category_id: 4, user_id: 4 },
  { title: 'HTML5とCSS3の基礎を学ぶ', url: 'https://www.w3schools.com/html/', description: 'Web開発の基礎となるHTML5とCSS3を学びたい方におすすめの学習サイトです。

W3Schoolsでは、HTMLの基本タグから最新のHTML5機能まで、体系的に学習できます。各項目には実際のコード例と実行結果が表示されるため、理解しやすい構成になっています。

レスポンシブデザインやモダンなCSS機能についても詳しく解説されており、現代のWeb開発に必要な知識を効率的に身につけることができます。', category_id: 3, user_id: 3 },
  { title: 'Git入門ガイド', url: 'https://git-scm.com/book/ja/v2', description: 'バージョン管理システムGitの使い方を基礎から学べる公式ガイドです。

Pro Git bookでは、Gitの基本概念から実践的な使用方法まで詳細に解説されています。コマンドラインでの操作方法はもちろん、ブランチ戦略やチーム開発での活用方法も学べます。

プログラミングを学ぶ上で必須のスキルであるGitを、この一冊で体系的にマスターできます。初心者にもわかりやすい説明で、実際のプロジェクトですぐに活用できる知識が身につきます。', category_id: 5, user_id: 6 },
  { title: 'React公式チュートリアル', url: 'https://ja.reactjs.org/tutorial/tutorial.html', description: 'モダンなフロントエンド開発で人気のReactを学ぶなら、まずは公式チュートリアルがおすすめです。

三目並べゲームを作りながら、Reactの基本概念であるコンポーネント、state、propsの使い方を実践的に学べます。段階的に機能を追加していく構成で、初心者でも無理なく進められます。

関数コンポーネントとHooksの使い方も含まれており、現代的なReact開発の基礎をしっかりと身につけることができる優秀な教材です。', category_id: 4, user_id: 2 },
  { title: 'SQLの基礎を学ぶ', url: 'https://sqlzoo.net/', description: 'データベース操作に必須のSQLを実践的に学べるオンライン学習サイトです。

SQLZooでは、実際のデータベースを使ってクエリを実行しながら学習できるため、理論だけでなく実践的なスキルが身につきます。SELECT文から始まり、JOIN、集計関数、サブクエリまで段階的に学習できます。

各問題には詳しい解説とヒントが付いており、つまずいても安心して進められます。データベースを扱う全ての開発者におすすめの学習リソースです。', category_id: 5, user_id: 5 },
  { title: 'Adobe XDでUI/UXデザイン入門', url: 'https://helpx.adobe.com/jp/xd/tutorials.html', description: 'UI/UXデザインを学びたい方におすすめの Adobe XD 公式チュートリアルです。

デザインの基礎から始まり、ワイヤーフレーム作成、プロトタイプ制作、デザインシステムの構築まで学習できます。実際のアプリデザインを通して、デザイン思考とツールの使い方を同時に身につけられます。

開発者とデザイナーの連携についても触れられており、チーム開発での効率的なワークフローも学べる実践的な内容です。', category_id: 6, user_id: 3 },
  { title: 'Pythonでデータ分析入門', url: 'https://pandas.pydata.org/docs/getting_started/intro_tutorials/', description: 'データ分析に興味がある方におすすめのPandas公式チュートリアルです。

データの読み込みから始まり、データの加工、フィルタリング、グループ化、可視化まで、データ分析の一連の流れを実践的に学べます。実際のデータセットを使用しているため、現実的な問題解決スキルが身につきます。

JupyterNotebookでの実行環境の構築方法も含まれており、データサイエンスの第一歩として最適な学習リソースです。', category_id: 7, user_id: 5 },
  { title: 'Vue.js入門ガイド', url: 'https://jp.vuejs.org/v2/guide/', description: 'プログレッシブフレームワークVue.jsの公式ガイドです。

シンプルな構文と学習コストの低さで人気のVue.jsを、基礎から応用まで体系的に学習できます。リアクティブデータバインディングやコンポーネントシステムなど、モダンフロントエンド開発の重要な概念を理解できます。

実際のアプリケーション開発例も豊富で、学習した知識をすぐに実践に活かせるのが魅力です。フロントエンド開発を始めたい方に強くおすすめします。', category_id: 4, user_id: 6 },
  { title: 'AWSクラウド入門', url: 'https://aws.amazon.com/jp/getting-started/', description: 'クラウドコンピューティングを学びたい方におすすめのAWS公式入門ガイドです。

クラウドの基本概念から始まり、EC2、S3、RDSなどの主要サービスの使い方を実践的に学べます。無料利用枠を活用した実習も含まれており、コストを気にせずに学習を進められます。

モダンなWebアプリケーションの構築とデプロイについても詳しく解説されており、実際のプロダクト開発で必要な知識を効率的に習得できます。', category_id: 6, user_id: 8 },
  { title: 'Docker入門チュートリアル', url: 'https://docs.docker.com/get-started/', description: 'コンテナ技術Dockerの公式入門チュートリアルです。

Dockerの基本概念からコンテナの作成、イメージのビルド、Docker Composeを使った複数コンテナの管理まで段階的に学習できます。実際のアプリケーションをコンテナ化する実習を通して、実践的なスキルが身につきます。

開発環境の構築や本番環境へのデプロイにも活用できる知識が得られ、モダンな開発ワークフローを理解するのに最適なリソースです。', category_id: 5, user_id: 7 }
]

posts.each do |post|
  Post.find_or_create_by!(title: post[:title]) do |p|
    p.url = post[:url]
    p.description = post[:description]
    p.category_id = post[:category_id]
    p.user_id = post[:user_id]
  end
end

# コメント作成
post_comments = [
  { body: 'Ruby公式サイトは本当に分かりやすいですね！インストール方法も詳しく書いてあって助かりました。', user_id: 4, post_id: 1 },
  { body: 'Rubyを始めたばかりですが、このサイトで基本的な概念が理解できました。ありがとうございます！', user_id: 7, post_id: 1 },
  { body: 'カレーレシピありがとうございます！作ってみたら本当に美味しくできました。スパイスの香りが最高でした。', user_id: 2, post_id: 2 },
  { body: 'Railsチュートリアルは本当におすすめです。私もこれでRailsを覚えました。特にテストの書き方が勉強になります。', user_id: 5, post_id: 3 },
  { body: 'いま大学でRailsを学んでいるのですが、授業だけでは分からなかった部分がこのチュートリアルで理解できました。', user_id: 4, post_id: 3 },
  { body: 'PayPalの使い方、とても参考になりました。海外のクライアントとの取引で使う予定なので助かります。', user_id: 6, post_id: 4 },
  { body: 'JavaScript初心者には MDN が本当におすすめです。仕様の詳細まで載っているので辞書代わりにも使えます。', user_id: 2, post_id: 6 },
  { body: 'JavaScriptの非同期処理について調べていたら、このサイトで詳しい解説を見つけました。分かりやすくて助かりました。', user_id: 6, post_id: 6 },
  { body: 'HTML5とCSS3の基礎、W3Schoolsで学習中です。実際にコードを動かしながら学べるのがいいですね。', user_id: 7, post_id: 7 },
  { body: 'Web開発を始めたばかりですが、このサイトで基本的なタグの使い方がよく分かりました。', user_id: 4, post_id: 7 },
  { body: 'Gitは最初とっつきにくかったのですが、この公式ガイドで基本的な使い方がマスターできました。', user_id: 7, post_id: 8 },
  { body: 'チーム開発でGitを使うようになって、ブランチ戦略の部分がとても参考になりました。', user_id: 2, post_id: 8 },
  { body: 'Reactのチュートリアル、三目並べゲームを作りながら学べるのが楽しかったです。状態管理の概念が理解できました。', user_id: 3, post_id: 9 },
  { body: 'Hooksの使い方がようやく理解できました。関数コンポーネントの方が書きやすくて気に入っています。', user_id: 6, post_id: 9 },
  { body: 'SQLZooで実際にクエリを実行しながら学習できるのが素晴らしいです。JOINが苦手でしたが、練習問題のおかげで理解できました。', user_id: 4, post_id: 10 },
  { body: 'データベース設計を学んでいるので、SQLの基礎知識が必要でした。このサイトで効率的に学習できています。', user_id: 8, post_id: 10 },
  { body: 'Adobe XDでのプロトタイプ作成、とても参考になりました。クライアントとの打ち合わせで活用しています。', user_id: 1, post_id: 11 },
  { body: 'UI/UXデザインを学び始めましたが、ツールの使い方と一緒にデザイン思考も学べるのがいいですね。', user_id: 7, post_id: 11 },
  { body: 'Pandasを使ったデータ分析、業務で活用しています。この公式チュートリアルは基礎から応用まで網羅されていて素晴らしいです。', user_id: 1, post_id: 12 },
  { body: 'データサイエンスに興味があって学習を始めました。JupyterNotebookの使い方も一緒に学べて助かります。', user_id: 4, post_id: 12 },
  { body: 'Vue.jsはReactより学習コストが低いと聞いて始めました。確かに直感的で分かりやすいですね。', user_id: 7, post_id: 13 },
  { body: 'プロジェクトでVue.jsを使うことになったので勉強中です。公式ガイドが充実していて助かります。', user_id: 2, post_id: 13 },
  { body: 'AWSクラウド入門、とても分かりやすかったです。EC2でサーバーを立てることができました。', user_id: 6, post_id: 14 },
  { body: 'インフラの知識が必要になったので学習しています。無料利用枠があるのでコストを気にせず練習できますね。', user_id: 4, post_id: 14 },
  { body: 'Dockerの概念が最初は理解できませんでしたが、このチュートリアルで実際に手を動かして学べて良かったです。', user_id: 1, post_id: 15 },
  { body: '開発環境をDockerで統一することになったので勉強中です。チーム開発での便利さが実感できました。', user_id: 5, post_id: 15 }
]

post_comments.each do |comment|
  PostComment.find_or_create_by!(body: comment[:body], user_id: comment[:user_id], post_id: comment[:post_id])
end

# いいね作成
post_likes = [
  # Ruby/Rails関連の投稿にプログラマーがいいね
  { user_id: 1, post_id: 1 }, # ぴっかちゃん(プログラマー) → Rubyの基本
  { user_id: 2, post_id: 1 }, # pikawaka(エンジニア) → Rubyの基本
  { user_id: 4, post_id: 1 }, # コード太郎(学生) → Rubyの基本
  { user_id: 6, post_id: 1 }, # ウェブ次郎(フリーランス) → Rubyの基本
  
  { user_id: 1, post_id: 3 }, # ぴっかちゃん(プログラマー) → Railsのチュートリアル
  { user_id: 4, post_id: 3 }, # コード太郎(学生) → Railsのチュートリアル
  { user_id: 6, post_id: 3 }, # ウェブ次郎(フリーランス) → Railsのチュートリアル
  { user_id: 7, post_id: 3 }, # プログラミング初心者(会社員) → Railsのチュートリアル
  
  # JavaScript/フロントエンド関連の投稿にフロントエンド開発者がいいね
  { user_id: 2, post_id: 6 }, # pikawaka(エンジニア) → JavaScript MDN
  { user_id: 3, post_id: 6 }, # あの(デザイナー) → JavaScript MDN
  { user_id: 4, post_id: 6 }, # コード太郎(学生) → JavaScript MDN
  { user_id: 6, post_id: 6 }, # ウェブ次郎(フリーランス) → JavaScript MDN
  
  { user_id: 2, post_id: 7 }, # pikawaka(エンジニア) → HTML5/CSS3の基礎
  { user_id: 3, post_id: 7 }, # あの(デザイナー) → HTML5/CSS3の基礎
  { user_id: 4, post_id: 7 }, # コード太郎(学生) → HTML5/CSS3の基礎
  { user_id: 7, post_id: 7 }, # プログラミング初心者(会社員) → HTML5/CSS3の基礎
  
  { user_id: 2, post_id: 9 }, # pikawaka(エンジニア) → React公式チュートリアル
  { user_id: 3, post_id: 9 }, # あの(デザイナー) → React公式チュートリアル
  { user_id: 6, post_id: 9 }, # ウェブ次郎(フリーランス) → React公式チュートリアル
  
  { user_id: 2, post_id: 13 }, # pikawaka(エンジニア) → Vue.js入門ガイド
  { user_id: 3, post_id: 13 }, # あの(デザイナー) → Vue.js入門ガイド
  { user_id: 6, post_id: 13 }, # ウェブ次郎(フリーランス) → Vue.js入門ガイド
  { user_id: 7, post_id: 13 }, # プログラミング初心者(会社員) → Vue.js入門ガイド
  
  # Git関連は全ての開発者がいいね
  { user_id: 1, post_id: 8 }, # ぴっかちゃん(プログラマー) → Git入門ガイド
  { user_id: 2, post_id: 8 }, # pikawaka(エンジニア) → Git入門ガイド
  { user_id: 4, post_id: 8 }, # コード太郎(学生) → Git入門ガイド
  { user_id: 5, post_id: 8 }, # テック花子(データサイエンティスト) → Git入門ガイド
  { user_id: 6, post_id: 8 }, # ウェブ次郎(フリーランス) → Git入門ガイド
  { user_id: 8, post_id: 8 }, # AIエンジニア → Git入門ガイド
  
  # Python/データ分析関連にデータサイエンティスト、AIエンジニアがいいね
  { user_id: 4, post_id: 5 }, # コード太郎(学生) → Python入門講座
  { user_id: 5, post_id: 5 }, # テック花子(データサイエンティスト) → Python入門講座
  { user_id: 8, post_id: 5 }, # AIエンジニア → Python入門講座
  
  { user_id: 1, post_id: 12 }, # ぴっかちゃん(プログラマー) → Pythonでデータ分析入門
  { user_id: 4, post_id: 12 }, # コード太郎(学生) → Pythonでデータ分析入門
  { user_id: 5, post_id: 12 }, # テック花子(データサイエンティスト) → Pythonでデータ分析入門
  { user_id: 8, post_id: 12 }, # AIエンジニア → Pythonでデータ分析入門
  
  # SQL関連に開発者、データサイエンティストがいいね
  { user_id: 1, post_id: 10 }, # ぴっかちゃん(プログラマー) → SQLの基礎
  { user_id: 4, post_id: 10 }, # コード太郎(学生) → SQLの基礎
  { user_id: 5, post_id: 10 }, # テック花子(データサイエンティスト) → SQLの基礎
  { user_id: 8, post_id: 10 }, # AIエンジニア → SQLの基礎
  
  # デザイン関連にデザイナー、フロントエンド開発者がいいね
  { user_id: 1, post_id: 11 }, # ぴっかちゃん(プログラマー) → Adobe XDでUI/UXデザイン入門
  { user_id: 2, post_id: 11 }, # pikawaka(エンジニア) → Adobe XDでUI/UXデザイン入門
  { user_id: 3, post_id: 11 }, # あの(デザイナー) → Adobe XDでUI/UXデザイン入門
  { user_id: 7, post_id: 11 }, # プログラミング初心者(会社員) → Adobe XDでUI/UXデザイン入門
  
  # AWS/Docker関連にエンジニアがいいね
  { user_id: 1, post_id: 14 }, # ぴっかちゃん(プログラマー) → AWSクラウド入門
  { user_id: 2, post_id: 14 }, # pikawaka(エンジニア) → AWSクラウド入門
  { user_id: 6, post_id: 14 }, # ウェブ次郎(フリーランス) → AWSクラウド入門
  { user_id: 8, post_id: 14 }, # AIエンジニア → AWSクラウド入門
  
  { user_id: 1, post_id: 15 }, # ぴっかちゃん(プログラマー) → Docker入門チュートリアル
  { user_id: 2, post_id: 15 }, # pikawaka(エンジニア) → Docker入門チュートリアル
  { user_id: 5, post_id: 15 }, # テック花子(データサイエンティスト) → Docker入門チュートリアル
  { user_id: 6, post_id: 15 }, # ウェブ次郎(フリーランス) → Docker入門チュートリアル
  
  # 一般的な関心で料理レシピやPayPal、お役立ち情報にもいいね
  { user_id: 2, post_id: 2 }, # pikawaka(エンジニア) → カレーライス
  { user_id: 6, post_id: 2 }, # ウェブ次郎(フリーランス) → カレーライス
  { user_id: 7, post_id: 2 }, # プログラミング初心者(会社員) → カレーライス
  
  { user_id: 3, post_id: 4 }, # あの(デザイナー) → PayPalの使い方
  { user_id: 6, post_id: 4 }, # ウェブ次郎(フリーランス) → PayPalの使い方
  { user_id: 7, post_id: 4 }  # プログラミング初心者(会社員) → PayPalの使い方
]

post_likes.each do |like|
  PostLike.find_or_create_by!(user_id: like[:user_id], post_id: like[:post_id])
end
