package com.facebook.messenger;

import android.net.Uri;
import com.facebook.common.util.UriUtil;
import com.google.android.exoplayer2.util.MimeTypes;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
/* loaded from: classes.dex */
public class ShareToMessengerParams {
    public static final Set<String> VALID_EXTERNAL_URI_SCHEMES;
    public static final Set<String> VALID_MIME_TYPES;
    public static final Set<String> VALID_URI_SCHEMES;
    public final Uri externalUri;
    public final String metaData;
    public final String mimeType;
    public final Uri uri;

    static {
        Set<String> validMimeTypes = new HashSet<>();
        validMimeTypes.add("image/*");
        validMimeTypes.add("image/jpeg");
        validMimeTypes.add("image/png");
        validMimeTypes.add("image/gif");
        validMimeTypes.add("image/webp");
        validMimeTypes.add("video/*");
        validMimeTypes.add(MimeTypes.VIDEO_MP4);
        validMimeTypes.add("audio/*");
        validMimeTypes.add(MimeTypes.AUDIO_MPEG);
        VALID_MIME_TYPES = Collections.unmodifiableSet(validMimeTypes);
        Set<String> validUriSchemes = new HashSet<>();
        validUriSchemes.add(UriUtil.LOCAL_CONTENT_SCHEME);
        validUriSchemes.add("android.resource");
        validUriSchemes.add(UriUtil.LOCAL_FILE_SCHEME);
        VALID_URI_SCHEMES = Collections.unmodifiableSet(validUriSchemes);
        Set<String> validExternalUriSchemes = new HashSet<>();
        validExternalUriSchemes.add(UriUtil.HTTP_SCHEME);
        validExternalUriSchemes.add(UriUtil.HTTPS_SCHEME);
        VALID_EXTERNAL_URI_SCHEMES = Collections.unmodifiableSet(validExternalUriSchemes);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public ShareToMessengerParams(ShareToMessengerParamsBuilder builder) {
        this.uri = builder.getUri();
        this.mimeType = builder.getMimeType();
        this.metaData = builder.getMetaData();
        this.externalUri = builder.getExternalUri();
        if (this.uri == null) {
            throw new NullPointerException("Must provide non-null uri");
        }
        if (this.mimeType == null) {
            throw new NullPointerException("Must provide mimeType");
        }
        if (!VALID_URI_SCHEMES.contains(this.uri.getScheme())) {
            throw new IllegalArgumentException("Unsupported URI scheme: " + this.uri.getScheme());
        }
        if (!VALID_MIME_TYPES.contains(this.mimeType)) {
            throw new IllegalArgumentException("Unsupported mime-type: " + this.mimeType);
        }
        if (this.externalUri != null && !VALID_EXTERNAL_URI_SCHEMES.contains(this.externalUri.getScheme())) {
            throw new IllegalArgumentException("Unsupported external uri scheme: " + this.externalUri.getScheme());
        }
    }

    public static ShareToMessengerParamsBuilder newBuilder(Uri uri, String mimeType) {
        return new ShareToMessengerParamsBuilder(uri, mimeType);
    }
}
