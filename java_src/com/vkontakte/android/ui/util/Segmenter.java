package com.vkontakte.android.ui.util;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
/* loaded from: classes3.dex */
public interface Segmenter {
    void clear();

    @Nullable
    Footer getFooter();

    <T> T getItem(int i);

    int getItemCount();

    int getPositionForSegment(int i);

    CharSequence getSegment(int i);

    int getSegmentForPosition(int i);

    int getSegmentIndex(int i);

    int getSegmentItemsCount(int i);

    int getSegmentsCount();

    boolean isHeader(int i);

    void onScrollToLastItem();

    /* loaded from: classes3.dex */
    public static class Footer {
        @NonNull
        State mState;
        @Nullable
        String mText;

        /* loaded from: classes3.dex */
        public enum State {
            Loading,
            Error,
            Message
        }

        @NonNull
        public State getState() {
            return this.mState;
        }

        public String toString() {
            return TextUtils.isEmpty(this.mText) ? super.toString() : this.mText;
        }
    }
}
