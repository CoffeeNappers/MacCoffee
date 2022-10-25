package com.facebook.login;

import com.facebook.internal.NativeProtocol;
/* loaded from: classes.dex */
public enum DefaultAudience {
    NONE(null),
    ONLY_ME(NativeProtocol.AUDIENCE_ME),
    FRIENDS("friends"),
    EVERYONE(NativeProtocol.AUDIENCE_EVERYONE);
    
    private final String nativeProtocolAudience;

    DefaultAudience(String protocol) {
        this.nativeProtocolAudience = protocol;
    }

    public String getNativeProtocolAudience() {
        return this.nativeProtocolAudience;
    }
}
