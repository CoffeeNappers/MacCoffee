package com.vkontakte.android.api.stats;

import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class StatsTrackDownloadServerState extends ResultlessAPIRequest {
    public StatsTrackDownloadServerState(String patternType, String url, long byteSize, long loadTimeMilliseconds, int responseCode, @Nullable Exception exception) {
        super("stats.trackDownloadServerState");
        String msg;
        param("pattern_type", patternType);
        param("download_url", url);
        param("state", exception == null ? "success" : "error");
        if (responseCode != 0) {
            param("http_status", responseCode);
        }
        if (exception != null) {
            StackTraceElement[] trace = exception.getStackTrace();
            String line = (trace == null || trace.length == 0) ? "" : ":" + trace[0].toString();
            String name = exception.getClass().getSimpleName();
            if (exception.getCause() == null) {
                msg = exception.getMessage();
            } else {
                msg = exception.getMessage() + "\n" + exception.getCause();
            }
            param("error_msg", TextUtils.isEmpty(msg) ? name + line : name + line + "\n" + msg);
        }
        if (loadTimeMilliseconds > 0) {
            param("time", loadTimeMilliseconds);
        }
        if (byteSize > 0) {
            param("file_size", byteSize);
        }
    }
}
