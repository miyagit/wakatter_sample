// app/frontend/packs/dm_textarea.js
document.addEventListener('DOMContentLoaded', function() {
  const textarea = document.querySelector('.c-dm__textarea');
  
  if (textarea) {
    // 初期設定
    textarea.style.height = '40px';
    textarea.style.minHeight = '40px';
    textarea.style.maxHeight = '80px';
    
    // 入力時の自動リサイズ
    textarea.addEventListener('input', function() {
      // 一旦高さをリセット
      this.style.height = '40px';
      
      // スクロール高さに基づいて調整
      const scrollHeight = this.scrollHeight;
      const maxHeight = 80;
      
      if (scrollHeight <= maxHeight) {
        this.style.height = scrollHeight + 'px';
        this.style.overflowY = 'hidden';
      } else {
        this.style.height = maxHeight + 'px';
        this.style.overflowY = 'auto';
      }
    });
    
    // Enterキーでの送信（Shift+Enterで改行）
    textarea.addEventListener('keydown', function(e) {
      if (e.key === 'Enter' && !e.shiftKey) {
        e.preventDefault();
        const form = this.closest('form');
        if (this.value.trim() !== '') {
          form.submit();
        }
      }
    });
  }
});