package com.danikula.videocache;

import android.text.TextUtils;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
/* loaded from: classes.dex */
class GetRequest {
    private static final Pattern RANGE_HEADER_PATTERN = Pattern.compile("[R,r]ange:[ ]?bytes=(\\d*)-");
    private static final Pattern URL_PATTERN = Pattern.compile("GET /(.*) HTTP");
    public final boolean partial;
    public final long rangeOffset;
    public final String uri;

    public GetRequest(String request) {
        Preconditions.checkNotNull(request);
        long offset = findRangeOffset(request);
        this.rangeOffset = Math.max(0L, offset);
        this.partial = offset >= 0;
        this.uri = findUri(request);
    }

    public static GetRequest read(InputStream inputStream) throws IOException {
        BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
        StringBuilder stringRequest = new StringBuilder();
        while (true) {
            String line = reader.readLine();
            if (!TextUtils.isEmpty(line)) {
                stringRequest.append(line).append('\n');
            } else {
                return new GetRequest(stringRequest.toString());
            }
        }
    }

    private long findRangeOffset(String request) {
        Matcher matcher = RANGE_HEADER_PATTERN.matcher(request);
        if (matcher.find()) {
            String rangeValue = matcher.group(1);
            return Long.parseLong(rangeValue);
        }
        return -1L;
    }

    private String findUri(String request) {
        Matcher matcher = URL_PATTERN.matcher(request);
        if (matcher.find()) {
            return matcher.group(1);
        }
        throw new IllegalArgumentException("Invalid request `" + request + "`: url not found!");
    }

    public String toString() {
        return "GetRequest{rangeOffset=" + this.rangeOffset + ", partial=" + this.partial + ", uri='" + this.uri + "'}";
    }
}
