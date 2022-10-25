package io.fabric.sdk.android.services.settings;
/* loaded from: classes3.dex */
public class BetaSettingsData {
    public final int updateSuspendDurationSeconds;
    public final String updateUrl;

    public BetaSettingsData(String updateUrl, int updateSuspendDurationSeconds) {
        this.updateUrl = updateUrl;
        this.updateSuspendDurationSeconds = updateSuspendDurationSeconds;
    }
}
