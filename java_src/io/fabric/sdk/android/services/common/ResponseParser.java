package io.fabric.sdk.android.services.common;
/* loaded from: classes3.dex */
public class ResponseParser {
    public static final int ResponseActionDiscard = 0;
    public static final int ResponseActionRetry = 1;

    public static int parse(int statusCode) {
        if (statusCode < 200 || statusCode > 299) {
            if (statusCode >= 300 && statusCode <= 399) {
                return 1;
            }
            if (statusCode >= 400 && statusCode <= 499) {
                return 0;
            }
            return statusCode >= 500 ? 1 : 1;
        }
        return 0;
    }
}
