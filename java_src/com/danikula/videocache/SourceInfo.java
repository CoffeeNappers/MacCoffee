package com.danikula.videocache;
/* loaded from: classes.dex */
public class SourceInfo {
    public final int length;
    public final String mime;
    public final String url;

    public SourceInfo(String url, int length, String mime) {
        this.url = url;
        this.length = length;
        this.mime = mime;
    }

    public String toString() {
        return "SourceInfo{url='" + this.url + "', length=" + this.length + ", mime='" + this.mime + "'}";
    }
}
