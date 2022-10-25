package com.vkontakte.android.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.text.Layout;
import android.text.StaticLayout;
import android.text.TextUtils;
import android.util.AttributeSet;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes3.dex */
public class EllipsizingTextView extends android.widget.TextView {
    private static final String ELLIPSIS = "...";
    private final List<EllipsizeListener> ellipsizeListeners;
    private String fullText;
    private boolean isEllipsized;
    private boolean isStale;
    private float lineAdditionalVerticalPadding;
    private float lineSpacingMultiplier;
    private int maxLines;
    private boolean programmaticChange;

    /* loaded from: classes3.dex */
    public interface EllipsizeListener {
        void ellipsizeStateChanged(boolean z);
    }

    public EllipsizingTextView(Context context) {
        super(context);
        this.ellipsizeListeners = new ArrayList();
        this.maxLines = -1;
        this.lineSpacingMultiplier = 1.0f;
        this.lineAdditionalVerticalPadding = 0.0f;
    }

    public EllipsizingTextView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.ellipsizeListeners = new ArrayList();
        this.maxLines = -1;
        this.lineSpacingMultiplier = 1.0f;
        this.lineAdditionalVerticalPadding = 0.0f;
    }

    public EllipsizingTextView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.ellipsizeListeners = new ArrayList();
        this.maxLines = -1;
        this.lineSpacingMultiplier = 1.0f;
        this.lineAdditionalVerticalPadding = 0.0f;
    }

    public void addEllipsizeListener(EllipsizeListener listener) {
        if (listener == null) {
            throw new NullPointerException();
        }
        this.ellipsizeListeners.add(listener);
    }

    public void removeEllipsizeListener(EllipsizeListener listener) {
        this.ellipsizeListeners.remove(listener);
    }

    public boolean isEllipsized() {
        return this.isEllipsized;
    }

    @Override // android.widget.TextView
    public void setMaxLines(int maxLines) {
        super.setMaxLines(maxLines);
        this.maxLines = maxLines;
        this.isStale = true;
    }

    @Override // android.widget.TextView
    public int getMaxLines() {
        return this.maxLines;
    }

    @Override // android.widget.TextView
    public void setLineSpacing(float add, float mult) {
        this.lineAdditionalVerticalPadding = add;
        this.lineSpacingMultiplier = mult;
        super.setLineSpacing(add, mult);
    }

    @Override // android.widget.TextView
    protected void onTextChanged(CharSequence text, int start, int before, int after) {
        super.onTextChanged(text, start, before, after);
        if (!this.programmaticChange) {
            this.fullText = text.toString();
            this.isStale = true;
        }
    }

    @Override // android.widget.TextView, android.view.View
    protected void onDraw(Canvas canvas) {
        if (this.isStale) {
            super.setEllipsize(null);
            resetText();
        }
        super.onDraw(canvas);
    }

    private void resetText() {
        int lastSpace;
        int maxLines = getMaxLines();
        String workingText = this.fullText;
        boolean ellipsized = false;
        if (maxLines != -1) {
            Layout layout = createWorkingLayout(workingText);
            if (layout.getLineCount() > maxLines) {
                String workingText2 = this.fullText.substring(0, layout.getLineEnd(maxLines - 1)).trim();
                while (createWorkingLayout(workingText2 + ELLIPSIS).getLineCount() > maxLines && (lastSpace = workingText2.lastIndexOf(32)) != -1) {
                    workingText2 = workingText2.substring(0, lastSpace);
                }
                workingText = workingText2 + ELLIPSIS;
                ellipsized = true;
            }
        }
        if (!workingText.equals(getText())) {
            this.programmaticChange = true;
            try {
                setText(workingText);
            } finally {
                this.programmaticChange = false;
            }
        }
        this.isStale = false;
        if (ellipsized != this.isEllipsized) {
            this.isEllipsized = ellipsized;
            for (EllipsizeListener listener : this.ellipsizeListeners) {
                listener.ellipsizeStateChanged(ellipsized);
            }
        }
    }

    private Layout createWorkingLayout(String workingText) {
        return new StaticLayout(workingText, getPaint(), (getWidth() - getPaddingLeft()) - getPaddingRight(), Layout.Alignment.ALIGN_NORMAL, this.lineSpacingMultiplier, this.lineAdditionalVerticalPadding, false);
    }

    @Override // android.widget.TextView
    public void setEllipsize(TextUtils.TruncateAt where) {
    }
}
