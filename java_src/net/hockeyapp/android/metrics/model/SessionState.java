package net.hockeyapp.android.metrics.model;
/* loaded from: classes3.dex */
public enum SessionState {
    START(0),
    END(1);
    
    private final int value;

    SessionState(int value) {
        this.value = value;
    }

    public int getValue() {
        return this.value;
    }
}
