package net.hockeyapp.android.objects;
/* loaded from: classes3.dex */
public enum CrashManagerUserInput {
    CrashManagerUserInputDontSend(0),
    CrashManagerUserInputSend(1),
    CrashManagerUserInputAlwaysSend(2);
    
    private final int mValue;

    CrashManagerUserInput(int value) {
        this.mValue = value;
    }

    public int getValue() {
        return this.mValue;
    }
}
