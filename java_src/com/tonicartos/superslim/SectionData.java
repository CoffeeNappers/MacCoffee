package com.tonicartos.superslim;

import android.text.TextUtils;
import android.view.View;
import com.tonicartos.superslim.LayoutManager;
/* loaded from: classes.dex */
public class SectionData {
    public final int contentEnd;
    public final int contentStart;
    public final int firstPosition;
    public final boolean hasHeader;
    public final int headerHeight;
    LayoutManager.LayoutParams headerParams;
    public final int headerWidth;
    final int marginEnd;
    final int marginStart;
    public final int minimumHeight;
    public final String sectionManager;
    public final int sectionManagerKind;

    public SectionData(LayoutManager lm, View first) {
        int paddingStart = lm.getPaddingStart();
        int paddingEnd = lm.getPaddingEnd();
        this.headerParams = (LayoutManager.LayoutParams) first.getLayoutParams();
        if (this.headerParams.isHeader) {
            this.headerWidth = lm.getDecoratedMeasuredWidth(first);
            this.headerHeight = lm.getDecoratedMeasuredHeight(first);
            if (!this.headerParams.isHeaderInline() || this.headerParams.isHeaderOverlay()) {
                this.minimumHeight = this.headerHeight;
            } else {
                this.minimumHeight = 0;
            }
            if (this.headerParams.headerStartMarginIsAuto) {
                if (this.headerParams.isHeaderStartAligned() && !this.headerParams.isHeaderOverlay()) {
                    this.marginStart = this.headerWidth;
                } else {
                    this.marginStart = 0;
                }
            } else {
                this.marginStart = this.headerParams.headerMarginStart;
            }
            if (this.headerParams.headerEndMarginIsAuto) {
                if (this.headerParams.isHeaderEndAligned() && !this.headerParams.isHeaderOverlay()) {
                    this.marginEnd = this.headerWidth;
                } else {
                    this.marginEnd = 0;
                }
            } else {
                this.marginEnd = this.headerParams.headerMarginEnd;
            }
        } else {
            this.minimumHeight = 0;
            this.headerHeight = 0;
            this.headerWidth = 0;
            this.marginStart = this.headerParams.headerMarginStart;
            this.marginEnd = this.headerParams.headerMarginEnd;
        }
        this.contentEnd = this.marginEnd + paddingEnd;
        this.contentStart = this.marginStart + paddingStart;
        this.hasHeader = this.headerParams.isHeader;
        this.firstPosition = this.headerParams.getTestedFirstPosition();
        this.sectionManager = this.headerParams.sectionManager;
        this.sectionManagerKind = this.headerParams.sectionManagerKind;
    }

    public int getTotalMarginWidth() {
        return this.marginEnd + this.marginStart;
    }

    public boolean sameSectionManager(LayoutManager.LayoutParams params) {
        return params.sectionManagerKind == this.sectionManagerKind || TextUtils.equals(params.sectionManager, this.sectionManager);
    }
}
