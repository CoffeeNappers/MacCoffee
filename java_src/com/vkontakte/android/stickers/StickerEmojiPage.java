package com.vkontakte.android.stickers;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.drawable.Drawable;
import android.support.v4.content.ContextCompat;
import android.support.v7.widget.RecyclerView;
import android.util.Property;
import android.view.View;
import com.vk.attachpicker.util.Fonts;
import com.vk.emoji.EmojiKeyboardListener;
import com.vk.emoji.EmojiKeyboardView;
import com.vk.emoji.FastScroller;
import com.vkontakte.android.R;
import com.vkontakte.android.data.orm.StickerStockItem;
import com.vkontakte.android.ui.drawable.RecoloredDrawable;
/* loaded from: classes3.dex */
class StickerEmojiPage extends StickersViewPage {
    boolean bottomTabsVisible;
    ObjectAnimator currentTabsAnimation;
    final EmojiKeyboardListener mListener;
    RecyclerView.OnScrollListener mScrollListener;
    final Drawable mTitleDrawable;
    EmojiKeyboardView mView;

    /* JADX INFO: Access modifiers changed from: package-private */
    public StickerEmojiPage(Context context, EmojiKeyboardListener listener) {
        this.mListener = listener;
        this.mTitleDrawable = new RecoloredDrawable(context.getResources().getDrawable(R.drawable.ic_smile_24dp), -7498855);
        this.mTitleDrawable.setAlpha(191);
    }

    public StickerEmojiPage attachToScroll(RecyclerView.OnScrollListener l) {
        this.mScrollListener = l;
        return this;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.vkontakte.android.stickers.StickersViewPage
    public View getView(Context context) {
        if (this.mView == null) {
            EmojiKeyboardView view = new EmojiKeyboardView(context);
            view.setHeadersTypeface(Fonts.getRobotoMedium());
            view.setEmojiKeyboardListener(this.mListener);
            view.setOnScrollListener(this.mScrollListener);
            view.setFastScrollBarColor(-3880756);
            view.setFastScrollHandleColor(ContextCompat.getColor(context, R.color.brand_primary));
            view.setFastScrollPaddingTopAndBottom(0, this.bottomTabsVisible ? StickersView.TABS_HEIGHT : 0);
            this.mView = view;
        }
        this.mView.updateRecents();
        return this.mView;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.vkontakte.android.stickers.StickersViewPage
    public String getIconURL() {
        return null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.vkontakte.android.stickers.StickersViewPage
    public Drawable getTitleDrawable() {
        return this.mTitleDrawable;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.vkontakte.android.stickers.StickersViewPage
    public String getServerBackgroundURL() {
        return null;
    }

    @Override // com.vkontakte.android.stickers.StickersViewPage
    void releaseView() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.vkontakte.android.stickers.StickersViewPage
    public void onConfigurationChanged(Configuration newConfig) {
        if (this.mView != null) {
            this.mView.dispatchConfigurationChanged(newConfig);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.vkontakte.android.stickers.StickersViewPage
    public void reload(StickerStockItem item) {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.vkontakte.android.stickers.StickersViewPage
    public int getId() {
        return -1;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.vkontakte.android.stickers.StickersViewPage
    public void reload() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.vkontakte.android.stickers.StickersViewPage
    public void onBottomTabsVisibilityChanged(boolean visible) {
        this.bottomTabsVisible = visible;
        if (this.mView != null) {
            if (this.currentTabsAnimation != null) {
                this.currentTabsAnimation.cancel();
            }
            FastScroller fastScroller = this.mView.getFastScroller();
            Property<FastScroller, Integer> property = FastScroller.PADDING_BOTTOM;
            int[] iArr = new int[1];
            iArr[0] = this.bottomTabsVisible ? StickersView.TABS_HEIGHT : 0;
            this.currentTabsAnimation = ObjectAnimator.ofInt(fastScroller, property, iArr);
            this.currentTabsAnimation.setInterpolator(StickersView.mInterpolator);
            this.currentTabsAnimation.setDuration(200L);
            this.currentTabsAnimation.addListener(new AnimatorListenerAdapter() { // from class: com.vkontakte.android.stickers.StickerEmojiPage.1
                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationEnd(Animator animation) {
                    StickerEmojiPage.this.currentTabsAnimation = null;
                }
            });
            this.currentTabsAnimation.start();
        }
    }
}
