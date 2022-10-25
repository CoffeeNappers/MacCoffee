package com.google.android.now;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Looper;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.now.INowAuthService;
import java.io.IOException;
import java.io.InterruptedIOException;
/* loaded from: classes2.dex */
public class NowAuthService {
    static final String AUTH_SERVICE_ACTION = "com.google.android.now.NOW_AUTH_SERVICE";
    private static final Intent AUTH_SERVICE_INTENT = new Intent(AUTH_SERVICE_ACTION).setPackage("com.google.android.googlequicksearchbox");
    static final int ERROR_DISABLED = 3;
    static final int ERROR_HAVE_TOKEN_ALREADY = 2;
    static final int ERROR_TOO_MANY_REQUESTS = 1;
    static final int ERROR_UNAUTHORIZED = 0;
    static final String EXTRA_ACCESS_TOKEN = "access-token";
    static final String EXTRA_AUTH_CODE = "auth-code";
    static final String EXTRA_ERROR = "error";
    static final String EXTRA_NEXT_RETRY_TIMESTAMP_MILLIS = "next-retry-timestamp-millis";
    private static final String TAG = "NowAuthService";
    static boolean sThreadCheckDisabled;

    /* loaded from: classes2.dex */
    public static class DisabledException extends Exception {
    }

    /* loaded from: classes2.dex */
    public static class UnauthorizedException extends Exception {
    }

    public static String getAuthCode(Context context, String clientId) throws IOException, UnauthorizedException, TooManyRequestsException, HaveTokenAlreadyException, DisabledException {
        checkNotMainThread();
        BlockingServiceConnection bsc = new BlockingServiceConnection();
        try {
            if (context.bindService(AUTH_SERVICE_INTENT, bsc, 1)) {
                try {
                    INowAuthService service = INowAuthService.Stub.asInterface(bsc.getService());
                    Bundle response = service.getAuthCode(clientId, context.getPackageName());
                    if (response == null) {
                        throw new IOException("Unexpected response from Google Now app");
                    }
                    if (response.containsKey("error")) {
                        int error = response.getInt("error");
                        switch (error) {
                            case 0:
                                throw new UnauthorizedException();
                            case 1:
                                throw new TooManyRequestsException(response.getLong(EXTRA_NEXT_RETRY_TIMESTAMP_MILLIS));
                            case 2:
                                throw new HaveTokenAlreadyException(response.getString(EXTRA_ACCESS_TOKEN));
                            case 3:
                                throw new DisabledException();
                            default:
                                Log.e(TAG, new StringBuilder(26).append("Unknown error: ").append(error).toString());
                                throw new IOException(new StringBuilder(49).append("Unexpected error from Google Now app: ").append(error).toString());
                        }
                    }
                    return response.getString(EXTRA_AUTH_CODE);
                } catch (RemoteException exc) {
                    throw new IOException("Call to Google Now app failed", exc);
                } catch (InterruptedException exc2) {
                    Log.w(TAG, "Interrupted", exc2);
                    throw new InterruptedIOException("Interrupted while contacting Google Now app");
                }
            }
            throw new IOException("Failed to contact Google Now app");
        } finally {
            bsc.unbindServiceIfConnected(context);
        }
    }

    private static void checkNotMainThread() {
        if (Looper.myLooper() == Looper.getMainLooper() && !sThreadCheckDisabled) {
            throw new IllegalStateException("Cannot call this API from the main thread");
        }
    }

    /* loaded from: classes2.dex */
    public static class TooManyRequestsException extends Exception {
        private final long mNextRetryTimestampMillis;

        public TooManyRequestsException(long nextRetryTimestampMillis) {
            this.mNextRetryTimestampMillis = nextRetryTimestampMillis;
        }

        public long getNextRetryTimestampMillis() {
            return this.mNextRetryTimestampMillis;
        }
    }

    /* loaded from: classes2.dex */
    public static class HaveTokenAlreadyException extends Exception {
        private final String mAccessToken;

        public HaveTokenAlreadyException(String accessToken) {
            this.mAccessToken = accessToken;
        }

        public String getAccessToken() {
            return this.mAccessToken;
        }
    }
}
