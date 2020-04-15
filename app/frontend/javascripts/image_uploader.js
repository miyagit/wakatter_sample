window.ImageUploader = (function() {
  function ImageUploader(button) {
    this.button = button;
    this.execute();
  }

  ImageUploader.prototype.execute = function() {
    this.button.on('click', function(e) {
      image_preview = $(e.target).next();
      $(this).prev('.js-file-field').click();
      return false;
    });

    $('.js-file-field').change(function() {
      if (this.files && this.files[0]) {
        if(this.files[0].type.indexOf("image") < 0){
          alert('画像を選択してください');
          $(this).val('');
          return false;
        }
        let reader = new FileReader();
        let filename = this.files[0].name;
        image_preview.css('display', 'block');

        reader.onload = function (e) {
         image_preview.attr({
            src: e.target.result,
            alt: filename
          });
        }
        reader.readAsDataURL(this.files[0]);
      }
    });
  }

  return ImageUploader;
})();
