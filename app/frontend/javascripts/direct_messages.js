document.addEventListener('DOMContentLoaded', () => {
  const messageInput = document.querySelector('.message-input');
  if (messageInput) {
    messageInput.addEventListener('keydown', (e) => {
      if (e.key === 'Enter' && !e.shiftKey) {
        e.preventDefault();
        const form = e.target.closest('form');
        form.submit();
      }
    });

    // 自動でスクロールを一番下へ
    const messagesList = document.querySelector('.messages-list');
    if (messagesList) {
      messagesList.scrollTop = messagesList.scrollHeight;
    }
  }
});