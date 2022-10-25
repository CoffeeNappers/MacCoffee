package com.vkontakte.android.upload;
/* loaded from: classes3.dex */
public class BadUploadServerException extends UploadException {
    public BadUploadServerException() {
    }

    public BadUploadServerException(String detailMessage) {
        super(detailMessage);
    }

    public BadUploadServerException(String detailMessage, Throwable throwable) {
        super(detailMessage, throwable);
    }

    public BadUploadServerException(Throwable throwable) {
        super(throwable);
    }
}
