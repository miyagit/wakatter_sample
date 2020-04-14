window.AutoResizer = (function() {
  function AutoResizer(target) {
    this.target = target;
    this.load();
    this.input();
  }

  AutoResizer.prototype.load = function() {
    var target = this.target;
    var ele = target.get(0);

    this.judgeOver(ele, target, this.notOver(ele, target));
  }

  AutoResizer.prototype.input = function() {
    this.target.on('input',function(evt){
      var ele = evt.target;
      var target = $(ele);

      this.judgeOver(ele, target, this.notOverInput(ele, target));

    }.bind(this));
  }

  AutoResizer.prototype.judgeOver = function(ele, target, func) {
    if(this.isOver(ele)){
      target.height(ele.scrollHeight);
    }else{
      func;
    }
  }

  AutoResizer.prototype.notOver = function(ele, target) {
    target.height(target.height() - this.lineHeight(target));
    if(this.isOver(ele)){
      target.height(ele.scrollHeight);
    }
  }

  AutoResizer.prototype.notOverInput = function(ele, target) {
    while (true){
      target.height(target.height() - this.lineHeight(target));
      if(this.isOver(ele)){
        target.height(ele.scrollHeight);
        break;
      }
    }
  }

  AutoResizer.prototype.isOver = function(target) {
    return target.scrollHeight > target.offsetHeight;
  }

  AutoResizer.prototype.lineHeight = function(target) {
    return Number(target.css('Height').split('px')[0]);
  }

  return AutoResizer;
})();
