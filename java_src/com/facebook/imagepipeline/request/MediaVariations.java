package com.facebook.imagepipeline.request;

import android.net.Uri;
import com.facebook.common.internal.Objects;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Nullable;
import javax.annotation.concurrent.Immutable;
@Immutable
/* loaded from: classes.dex */
public final class MediaVariations {
    private final boolean mForceRequestForSpecifiedUri;
    private final String mMediaId;
    @Nullable
    private final List<Variant> mVariants;

    private MediaVariations(Builder builder) {
        this.mMediaId = builder.mMediaId;
        this.mVariants = builder.mVariants;
        this.mForceRequestForSpecifiedUri = builder.mForceRequestForSpecifiedUri;
    }

    public String getMediaId() {
        return this.mMediaId;
    }

    @Nullable
    public List<Variant> getVariants() {
        return this.mVariants;
    }

    public boolean shouldForceRequestForSpecifiedUri() {
        return this.mForceRequestForSpecifiedUri;
    }

    public boolean equals(Object o) {
        if (!(o instanceof MediaVariations)) {
            return false;
        }
        MediaVariations otherVariations = (MediaVariations) o;
        return Objects.equal(this.mMediaId, otherVariations.mMediaId) && this.mForceRequestForSpecifiedUri == otherVariations.mForceRequestForSpecifiedUri && Objects.equal(this.mVariants, otherVariations.mVariants);
    }

    public int hashCode() {
        return Objects.hashCode(this.mMediaId, Boolean.valueOf(this.mForceRequestForSpecifiedUri), this.mVariants);
    }

    public String toString() {
        return String.format(null, "%s-%b-%s", this.mMediaId, Boolean.valueOf(this.mForceRequestForSpecifiedUri), this.mVariants);
    }

    /* loaded from: classes.dex */
    public static final class Variant {
        private final int mHeight;
        private final Uri mUri;
        private final int mWidth;

        public Variant(Uri uri, int width, int height) {
            this.mUri = uri;
            this.mWidth = width;
            this.mHeight = height;
        }

        public Uri getUri() {
            return this.mUri;
        }

        public int getWidth() {
            return this.mWidth;
        }

        public int getHeight() {
            return this.mHeight;
        }

        public boolean equals(Object o) {
            if (!(o instanceof Variant)) {
                return false;
            }
            Variant otherVariant = (Variant) o;
            return Objects.equal(this.mUri, otherVariant.mUri) && this.mWidth == otherVariant.mWidth && this.mHeight == otherVariant.mHeight;
        }

        public int hashCode() {
            int hashCode = this.mUri.hashCode();
            return (((hashCode * 31) + this.mWidth) * 31) + this.mHeight;
        }

        public String toString() {
            return String.format(null, "%dx%d %s", Integer.valueOf(this.mWidth), Integer.valueOf(this.mHeight), this.mUri);
        }
    }

    @Nullable
    public static MediaVariations forMediaId(@Nullable String mediaId) {
        if (mediaId == null || mediaId.isEmpty()) {
            return null;
        }
        return newBuilderForMediaId(mediaId).build();
    }

    public static Builder newBuilderForMediaId(String mediaId) {
        return new Builder(mediaId);
    }

    /* loaded from: classes.dex */
    public static class Builder {
        private boolean mForceRequestForSpecifiedUri;
        private final String mMediaId;
        private List<Variant> mVariants;

        private Builder(String mediaId) {
            this.mForceRequestForSpecifiedUri = false;
            this.mMediaId = mediaId;
        }

        public Builder addVariant(Uri uri, int width, int height) {
            if (this.mVariants == null) {
                this.mVariants = new ArrayList();
            }
            this.mVariants.add(new Variant(uri, width, height));
            return this;
        }

        public Builder setForceRequestForSpecifiedUri(boolean forceRequestForSpecifiedUri) {
            this.mForceRequestForSpecifiedUri = forceRequestForSpecifiedUri;
            return this;
        }

        public MediaVariations build() {
            return new MediaVariations(this);
        }
    }
}
