package com.vkontakte.android.audio.http;

import android.content.Context;
import android.text.TextUtils;
import com.vk.core.network.Network;
import com.vkontakte.android.audio.utils.Utils;
import com.vkontakte.android.utils.L;
import java.io.IOException;
import java.net.SocketException;
import java.net.SocketTimeoutException;
import java.util.concurrent.atomic.AtomicInteger;
import okhttp3.Request;
import okhttp3.Response;
/* loaded from: classes2.dex */
public final class HttpExecutor {
    private static final AtomicInteger COUNTER = new AtomicInteger();

    private HttpExecutor() {
    }

    public static <T> T execute(Context context, Request request, HttpResponseHandler<T> responseHandler) throws Exception {
        int number = COUNTER.incrementAndGet();
        if (context != null) {
            try {
                if (!Utils.isNetworkAvailable(context)) {
                    throw new IOException("No connection");
                }
            } catch (Exception e) {
                L.e(e, Integer.valueOf(number));
                throw e;
            }
        }
        int retryCount = 2;
        while (true) {
            try {
                L.d(request.url());
                Response response = Network.getDefaultClient().newCall(request).execute();
                L.d(Integer.valueOf(response.code()));
                T result = responseHandler.mo941handleResponse(context, response);
                if (result == null) {
                    return null;
                }
                return result;
            } catch (Exception e2) {
                if (isTimeoutException(e2)) {
                    int retryCount2 = retryCount - 1;
                    if (retryCount <= 0) {
                        throw e2;
                    }
                    L.e(e2, Integer.valueOf(number));
                    retryCount = retryCount2;
                } else {
                    throw e2;
                }
            }
        }
    }

    private static boolean isTimeoutException(Exception e) {
        if (e instanceof SocketTimeoutException) {
            return true;
        }
        if (e instanceof SocketException) {
            String message = e.getMessage();
            if (!TextUtils.isEmpty(message) && message.contains("ETIMEDOUT")) {
                return true;
            }
        }
        return false;
    }
}
