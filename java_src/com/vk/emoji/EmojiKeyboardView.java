package com.vk.emoji;

import android.content.Context;
import android.graphics.Typeface;
import android.support.annotation.AttrRes;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.widget.FrameLayout;
import com.vk.emoji.EmojiRecyclerView;
/* loaded from: classes2.dex */
public class EmojiKeyboardView extends FrameLayout {
    private EmojiAdapter adapter;
    private EmojiKeyboardListener emojiKeyboardListener;
    private EmojiRecyclerView emojisRecyclerView;
    private FastScroller fastScroller;
    private Typeface headersTypeface;
    private RecyclerView.OnScrollListener onScrollListener;
    private final RecentItemStore recentStore;

    public EmojiKeyboardView(@NonNull Context context) {
        super(context);
        this.recentStore = new RecentItemStore(getContext(), "recents_v3", 50, true);
        init(context);
    }

    public EmojiKeyboardView(@NonNull Context context, @Nullable AttributeSet attrs) {
        super(context, attrs);
        this.recentStore = new RecentItemStore(getContext(), "recents_v3", 50, true);
        init(context);
    }

    public EmojiKeyboardView(@NonNull Context context, @Nullable AttributeSet attrs, @AttrRes int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.recentStore = new RecentItemStore(getContext(), "recents_v3", 50, true);
        init(context);
    }

    private void init(Context context) {
        setBackgroundColor(-986638);
        LayoutInflater.from(context).inflate(R.layout.emoji_keyboard_view, this);
        this.fastScroller = (FastScroller) findViewById(R.id.fast_scroller);
        this.emojisRecyclerView = (EmojiRecyclerView) findViewById(R.id.rv_emoji);
        this.adapter = new EmojiAdapter(context, this.emojisRecyclerView, this.recentStore, this.emojiKeyboardListener, this.headersTypeface);
        this.emojisRecyclerView.setHeaderInfoProvider(this.adapter);
        this.emojisRecyclerView.setLayoutManager(new GridLayoutManager(context, 1));
        this.emojisRecyclerView.setAdapter(this.adapter);
        if (this.onScrollListener != null) {
            this.emojisRecyclerView.addOnScrollListener(this.onScrollListener);
        }
        this.emojisRecyclerView.setOnSpanCountChangeListener(new EmojiRecyclerView.OnSpanCountChangeListener() { // from class: com.vk.emoji.EmojiKeyboardView.1
            @Override // com.vk.emoji.EmojiRecyclerView.OnSpanCountChangeListener
            public void onSpanCountChanged(int spanCount) {
                if (EmojiKeyboardView.this.adapter != null) {
                    EmojiKeyboardView.this.adapter.updateRecents();
                }
            }
        });
        this.fastScroller.setRecyclerView(this.emojisRecyclerView, this.adapter);
    }

    public void setFastScrollBarColor(int color) {
        this.fastScroller.setTrackColor(color);
    }

    public void setFastScrollHandleColor(int color) {
        this.fastScroller.setHandleColor(color);
    }

    public void setFastScrollPaddingTopAndBottom(int paddingTop, int paddingBottom) {
        this.fastScroller.setPadding(0, paddingTop, 0, paddingBottom);
    }

    public void setHeadersTypeface(Typeface headersTypeface) {
        this.headersTypeface = headersTypeface;
        this.adapter.setHeadersTypeface(headersTypeface);
    }

    public void setEmojiKeyboardListener(EmojiKeyboardListener emojiKeyboardListener) {
        this.emojiKeyboardListener = emojiKeyboardListener;
        this.adapter.setEmojiKeyboardListener(emojiKeyboardListener);
    }

    public void setOnScrollListener(RecyclerView.OnScrollListener listener) {
        if (this.emojisRecyclerView != null && this.onScrollListener != null) {
            this.emojisRecyclerView.removeOnScrollListener(this.onScrollListener);
        }
        if (this.emojisRecyclerView != null) {
            this.emojisRecyclerView.addOnScrollListener(listener);
        }
        this.onScrollListener = listener;
    }

    public FastScroller getFastScroller() {
        return this.fastScroller;
    }

    public void updateRecents() {
        if (this.adapter != null) {
            this.adapter.updateRecents();
        }
    }
}
