package com.vkontakte.android.audio.http;

import java.io.IOException;
/* loaded from: classes2.dex */
public class ResponseException extends IOException {
    private final int mStatusCode;

    public ResponseException(String message, int statusCode) {
        super(message);
        this.mStatusCode = statusCode;
    }

    public int getStatusCode() {
        return this.mStatusCode;
    }
}
