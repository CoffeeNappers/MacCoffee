package com.vkontakte.android.ui.util;

import android.support.annotation.Nullable;
import com.vkontakte.android.ui.util.Segmenter;
import java.util.List;
/* loaded from: classes3.dex */
public class ListSegmenter implements Segmenter {
    private List mData;

    public ListSegmenter bind(List data) {
        this.mData = data;
        return this;
    }

    @Override // com.vkontakte.android.ui.util.Segmenter
    public int getItemCount() {
        if (this.mData == null) {
            return 0;
        }
        return this.mData.size();
    }

    @Override // com.vkontakte.android.ui.util.Segmenter
    public int getSegmentItemsCount(int segment) {
        if (this.mData == null) {
            return 0;
        }
        return this.mData.size();
    }

    @Override // com.vkontakte.android.ui.util.Segmenter
    public int getSegmentsCount() {
        return 0;
    }

    @Override // com.vkontakte.android.ui.util.Segmenter
    public int getPositionForSegment(int segment) {
        return 0;
    }

    @Override // com.vkontakte.android.ui.util.Segmenter
    public int getSegmentForPosition(int position) {
        return 0;
    }

    @Override // com.vkontakte.android.ui.util.Segmenter
    public int getSegmentIndex(int position) {
        return 0;
    }

    @Override // com.vkontakte.android.ui.util.Segmenter
    public <T> T getItem(int position) {
        return (T) this.mData.get(position);
    }

    @Override // com.vkontakte.android.ui.util.Segmenter
    public CharSequence getSegment(int section) {
        return null;
    }

    @Override // com.vkontakte.android.ui.util.Segmenter
    public boolean isHeader(int position) {
        return false;
    }

    @Override // com.vkontakte.android.ui.util.Segmenter
    public void clear() {
        this.mData = null;
    }

    @Override // com.vkontakte.android.ui.util.Segmenter
    @Nullable
    public Segmenter.Footer getFooter() {
        return null;
    }

    @Override // com.vkontakte.android.ui.util.Segmenter
    public void onScrollToLastItem() {
    }
}
