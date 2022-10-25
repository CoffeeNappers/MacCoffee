package com.vk.emoji;

import android.content.Context;
import android.view.View;
/* loaded from: classes2.dex */
final class EmojiItemHolder extends EmojiHolder implements View.OnClickListener {
    private final Context context;
    private String emojiCode;
    private final EmojiKeyboardListener emojiKeyboardListener;
    private final EmojiKeyboardImageView imageView;
    private final RecentItemStore recentStore;

    public EmojiItemHolder(Context context, RecentItemStore recentStore, EmojiKeyboardListener emojiKeyboardListener) {
        super(new EmojiKeyboardImageView(context));
        this.context = context;
        this.recentStore = recentStore;
        this.emojiKeyboardListener = emojiKeyboardListener;
        this.imageView = (EmojiKeyboardImageView) this.itemView;
        this.imageView.setOnClickListener(this);
    }

    public void update(String emojiCode) {
        this.emojiCode = emojiCode;
        this.imageView.setEmoji(emojiCode);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        this.recentStore.add(this.emojiCode);
        if (this.emojiKeyboardListener != null) {
            this.emojiKeyboardListener.onEmojiSelected(this.emojiCode);
        }
    }
}
