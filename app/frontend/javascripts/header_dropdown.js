(function () {
  $(document).on("turbolinks:load", function () {
    if (!!$("#header").length) {
      // HTML記述をロードした時の状態でセーブ
      var defaultHTML;
      function DefaultSave() {
        defaultHTML = document.getElementById("header").innerHTML;
      }
      DefaultSave();
      // レスポンシブで切り替える
      function handleWindowResize() {
        //
        // PCサイズの時だけheaderのdropdownを使えるようにする
        //
        // min-width 以上になったら（タブレット以上になったら）
        if (window.matchMedia("screen and (min-width: 1024px)").matches) {

          $(".l-gnav__avatar").attr({
            'aria-expanded' : 'false',
            'data-toggle' : 'dropdown',
            'id' : 'dropdownUserLink',
            'href' : '#',
            'class' : 'l-gnav__avatar dropdown-toggle'
          });
          $(".l-gnav__user-menu").attr({
            'aria-labelledby' : 'dropdownUserLink',
            'class' : 'l-gnav__user-menu dropdown-menu'
          });
          $(".l-gnav__news").attr({
            'aria-expanded' : 'false',
            'data-toggle' : 'dropdown',
            'id' : 'dropdownNewsLink',
            'href' : '#',
            'class' : 'l-gnav__news dropdown-toggle'
          });
          $(".l-gnav__news-menu").attr({
            'aria-labelledby' : 'dropdownNewsLink',
            'class' : 'l-gnav__news-menu dropdown-menu'
          });

        } else if (window.matchMedia("screen and (max-width:1023px)").matches) {
          // Tabletサイズ以下の時だけ発火
          // HTML記述を初期状態に戻す
          function HTMLRestore() {
            document.getElementById("header").innerHTML = defaultHTML;
          }
          HTMLRestore();
        }
      }
      handleWindowResize();
      window.addEventListener("resize", handleWindowResize);
    }
  });
})();
