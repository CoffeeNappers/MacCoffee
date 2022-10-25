package com.vkontakte.android.ui.util;

import android.support.annotation.Nullable;
import android.util.SparseIntArray;
import com.vkontakte.android.ui.util.Segmenter;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes3.dex */
public class SectionSegmenter implements Segmenter {
    private int mSegmentsCount;
    private final List<CharSequence> mSegments = new ArrayList();
    private final List mData = new ArrayList();
    private final SparseIntArray mSegmentToPositionProjection = new SparseIntArray();
    private final SparseIntArray mPositionToSegmentProjection = new SparseIntArray();
    private final SparseIntArray mSegmentItemsCount = new SparseIntArray();

    public void addSection(List data, CharSequence title, int start, int end) {
        int sectionNumber = this.mSegments.size();
        int positionNumber = this.mData.size();
        this.mSegments.add(title);
        this.mSegmentToPositionProjection.put(sectionNumber, positionNumber);
        this.mSegmentItemsCount.put(sectionNumber, end - start);
        this.mSegmentsCount++;
        int positionNumber2 = positionNumber + 1;
        addItem(title, positionNumber, sectionNumber);
        while (start < end) {
            addItem(data.get(start), positionNumber2, sectionNumber);
            start++;
            positionNumber2++;
        }
    }

    public void addSection(List data, CharSequence title) {
        addSection(data, title, 0, data.size());
    }

    public void addItems(List data) {
        addItems(data, true);
    }

    public void addItems(List data, boolean clear) {
        if (clear) {
            clear();
        }
        this.mData.addAll(data);
    }

    private void addItem(Object item, int positionNumber, int sectionNumber) {
        this.mData.add(item);
        this.mPositionToSegmentProjection.put(positionNumber, sectionNumber);
    }

    @Override // com.vkontakte.android.ui.util.Segmenter
    public int getItemCount() {
        return this.mData.size();
    }

    @Override // com.vkontakte.android.ui.util.Segmenter
    public <T> T getItem(int position) {
        return (T) this.mData.get(position);
    }

    @Override // com.vkontakte.android.ui.util.Segmenter
    public void clear() {
        this.mSegments.clear();
        this.mData.clear();
        this.mSegmentToPositionProjection.clear();
        this.mPositionToSegmentProjection.clear();
        this.mSegmentItemsCount.clear();
        this.mSegmentsCount = 0;
    }

    @Override // com.vkontakte.android.ui.util.Segmenter
    public CharSequence getSegment(int section) {
        return this.mSegments.get(section);
    }

    @Override // com.vkontakte.android.ui.util.Segmenter
    public boolean isHeader(int position) {
        return getSegmentIndex(position, -1) == position;
    }

    @Override // com.vkontakte.android.ui.util.Segmenter
    public int getPositionForSegment(int segment) {
        return this.mSegmentToPositionProjection.get(segment);
    }

    @Override // com.vkontakte.android.ui.util.Segmenter
    public int getSegmentForPosition(int position) {
        return this.mPositionToSegmentProjection.get(position);
    }

    @Override // com.vkontakte.android.ui.util.Segmenter
    public int getSegmentIndex(int position) {
        return getSegmentIndex(position, 0);
    }

    private int getSegmentIndex(int position, int fallback) {
        return this.mSegmentToPositionProjection.get(this.mPositionToSegmentProjection.get(position, fallback), fallback);
    }

    @Override // com.vkontakte.android.ui.util.Segmenter
    public int getSegmentItemsCount(int segment) {
        return this.mSegmentItemsCount.get(segment);
    }

    @Override // com.vkontakte.android.ui.util.Segmenter
    public int getSegmentsCount() {
        return this.mSegmentsCount;
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
