package com.google.android.exoplayer2.source.dash.manifest;

import android.net.Uri;
import com.google.android.exoplayer2.util.UriUtil;
/* loaded from: classes.dex */
public final class RangedUri {
    private int hashCode;
    public final long length;
    private final String referenceUri;
    public final long start;

    public RangedUri(String referenceUri, long start, long length) {
        this.referenceUri = referenceUri == null ? "" : referenceUri;
        this.start = start;
        this.length = length;
    }

    public Uri resolveUri(String baseUri) {
        return UriUtil.resolveToUri(baseUri, this.referenceUri);
    }

    public String resolveUriString(String baseUri) {
        return UriUtil.resolve(baseUri, this.referenceUri);
    }

    public RangedUri attemptMerge(RangedUri other, String baseUri) {
        RangedUri rangedUri = null;
        long j = -1;
        String resolvedUri = resolveUriString(baseUri);
        if (other != null && resolvedUri.equals(other.resolveUriString(baseUri))) {
            if (this.length != -1 && this.start + this.length == other.start) {
                long j2 = this.start;
                if (other.length != -1) {
                    j = this.length + other.length;
                }
                rangedUri = new RangedUri(resolvedUri, j2, j);
            } else if (other.length != -1 && other.start + other.length == this.start) {
                long j3 = other.start;
                if (this.length != -1) {
                    j = other.length + this.length;
                }
                rangedUri = new RangedUri(resolvedUri, j3, j);
            }
        }
        return rangedUri;
    }

    public int hashCode() {
        if (this.hashCode == 0) {
            int result = ((int) this.start) + 527;
            this.hashCode = (((result * 31) + ((int) this.length)) * 31) + this.referenceUri.hashCode();
        }
        return this.hashCode;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        RangedUri other = (RangedUri) obj;
        return this.start == other.start && this.length == other.length && this.referenceUri.equals(other.referenceUri);
    }
}
