package com.google.firebase.remoteconfig;
/* loaded from: classes2.dex */
public class FirebaseRemoteConfigSettings {
    private final boolean blp;

    /* loaded from: classes2.dex */
    public static class Builder {
        private boolean blp = false;

        public FirebaseRemoteConfigSettings build() {
            return new FirebaseRemoteConfigSettings(this);
        }

        public Builder setDeveloperModeEnabled(boolean z) {
            this.blp = z;
            return this;
        }
    }

    private FirebaseRemoteConfigSettings(Builder builder) {
        this.blp = builder.blp;
    }

    public boolean isDeveloperModeEnabled() {
        return this.blp;
    }
}
