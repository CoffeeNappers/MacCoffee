package com.vkontakte.android.api.stats;

import com.vkontakte.android.api.ResultlessAPIRequest;
import io.sentry.DefaultSentryClientFactory;
/* loaded from: classes2.dex */
public class StatsTrackUploadServerStateAPIRequest extends ResultlessAPIRequest {

    /* loaded from: classes2.dex */
    public static class Args {
        public String fileName;
        public long fileSize;
        public String httpError;
        public int httpStatus;
        public String methodName;
        public State state;
        public String uploadUrl;
    }

    /* loaded from: classes2.dex */
    public enum State {
        SUCCESS,
        UNKNOWN,
        TIMEOUT,
        NO_NETWORK,
        BAD_SERVER,
        BAD_RESPONSE
    }

    public StatsTrackUploadServerStateAPIRequest(Args args) {
        super("stats.trackUploadServerState");
        String state;
        if (args == null) {
            throw new IllegalArgumentException("args is null");
        }
        if (args.methodName == null) {
            throw new IllegalArgumentException("methodName is null or empty");
        }
        if (args.uploadUrl == null) {
            throw new IllegalArgumentException("uploadUrl is null or empty");
        }
        if (args.state == null) {
            throw new IllegalArgumentException("state is null");
        }
        if (args.fileName == null) {
            throw new IllegalArgumentException("fileName is null or empty");
        }
        param("method_name", args.methodName);
        param("upload_url", args.uploadUrl);
        switch (args.state) {
            case SUCCESS:
                state = "success";
                break;
            case TIMEOUT:
                state = DefaultSentryClientFactory.TIMEOUT_OPTION;
                break;
            case NO_NETWORK:
                state = "no_network";
                break;
            case BAD_SERVER:
                state = "bad_server";
                break;
            case BAD_RESPONSE:
                state = "bad_response";
                break;
            default:
                state = "unknown";
                break;
        }
        param("state", state);
        param("http_status", args.httpStatus);
        param("http_error", args.httpError == null ? "" : args.httpError);
        if (args.fileSize >= 0) {
            param("file_size", args.fileSize);
        }
        param("file_name", args.fileName == null ? "" : args.fileName);
    }
}
