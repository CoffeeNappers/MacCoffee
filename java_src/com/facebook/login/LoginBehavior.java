package com.facebook.login;
/* loaded from: classes.dex */
public enum LoginBehavior {
    NATIVE_WITH_FALLBACK(true, true),
    NATIVE_ONLY(true, false),
    WEB_ONLY(false, true);
    
    private final boolean allowsKatanaAuth;
    private final boolean allowsWebViewAuth;

    LoginBehavior(boolean allowsKatanaAuth, boolean allowsWebViewAuth) {
        this.allowsKatanaAuth = allowsKatanaAuth;
        this.allowsWebViewAuth = allowsWebViewAuth;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean allowsKatanaAuth() {
        return this.allowsKatanaAuth;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean allowsWebViewAuth() {
        return this.allowsWebViewAuth;
    }
}
