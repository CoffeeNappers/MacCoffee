package net.hockeyapp.android.objects;
/* loaded from: classes3.dex */
public enum FeedbackUserDataElement {
    DONT_SHOW(0),
    OPTIONAL(1),
    REQUIRED(2);
    
    private final int mValue;

    FeedbackUserDataElement(int value) {
        this.mValue = value;
    }

    public int getValue() {
        return this.mValue;
    }
}
