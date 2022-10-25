package com.vkontakte.android.api;

import com.vkontakte.android.api.VKAPIRequest;
/* loaded from: classes2.dex */
public class APIException extends RuntimeException {
    public int code;
    public String descr;
    public VKAPIRequest.VKErrorResponse errorResponse;

    public APIException(int code, String descr) {
        super("#" + code + ": " + descr);
        this.code = 0;
        this.code = code;
        this.descr = descr;
    }

    public APIException(VKAPIRequest.VKErrorResponse errorResponse) {
        super("#" + errorResponse.getCode() + ": " + errorResponse.getCodeValue());
        this.code = 0;
        this.code = errorResponse.getCode();
        this.descr = errorResponse.description;
        this.errorResponse = errorResponse;
    }
}
