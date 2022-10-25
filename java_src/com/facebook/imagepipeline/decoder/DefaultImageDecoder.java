package com.facebook.imagepipeline.decoder;

import android.graphics.Bitmap;
import com.facebook.common.internal.Closeables;
import com.facebook.common.references.CloseableReference;
import com.facebook.imageformat.DefaultImageFormats;
import com.facebook.imageformat.ImageFormat;
import com.facebook.imageformat.ImageFormatChecker;
import com.facebook.imagepipeline.animated.factory.AnimatedImageFactory;
import com.facebook.imagepipeline.common.ImageDecodeOptions;
import com.facebook.imagepipeline.image.CloseableImage;
import com.facebook.imagepipeline.image.CloseableStaticBitmap;
import com.facebook.imagepipeline.image.EncodedImage;
import com.facebook.imagepipeline.image.ImmutableQualityInfo;
import com.facebook.imagepipeline.image.QualityInfo;
import com.facebook.imagepipeline.platform.PlatformDecoder;
import java.io.InputStream;
import java.util.Map;
import javax.annotation.Nullable;
/* loaded from: classes.dex */
public class DefaultImageDecoder implements ImageDecoder {
    private final AnimatedImageFactory mAnimatedImageFactory;
    private final Bitmap.Config mBitmapConfig;
    @Nullable
    private final Map<ImageFormat, ImageDecoder> mCustomDecoders;
    private final ImageDecoder mDefaultDecoder;
    private final PlatformDecoder mPlatformDecoder;

    public DefaultImageDecoder(AnimatedImageFactory animatedImageFactory, PlatformDecoder platformDecoder, Bitmap.Config bitmapConfig) {
        this(animatedImageFactory, platformDecoder, bitmapConfig, null);
    }

    public DefaultImageDecoder(AnimatedImageFactory animatedImageFactory, PlatformDecoder platformDecoder, Bitmap.Config bitmapConfig, @Nullable Map<ImageFormat, ImageDecoder> customDecoders) {
        this.mDefaultDecoder = new ImageDecoder() { // from class: com.facebook.imagepipeline.decoder.DefaultImageDecoder.1
            @Override // com.facebook.imagepipeline.decoder.ImageDecoder
            public CloseableImage decode(EncodedImage encodedImage, int length, QualityInfo qualityInfo, ImageDecodeOptions options) {
                ImageFormat imageFormat = encodedImage.getImageFormat();
                if (imageFormat == DefaultImageFormats.JPEG) {
                    return DefaultImageDecoder.this.decodeJpeg(encodedImage, length, qualityInfo, options);
                }
                if (imageFormat == DefaultImageFormats.GIF) {
                    return DefaultImageDecoder.this.decodeGif(encodedImage, options);
                }
                if (imageFormat == DefaultImageFormats.WEBP_ANIMATED) {
                    return DefaultImageDecoder.this.decodeAnimatedWebp(encodedImage, options);
                }
                if (imageFormat == ImageFormat.UNKNOWN) {
                    throw new IllegalArgumentException("unknown image format");
                }
                return DefaultImageDecoder.this.decodeStaticImage(encodedImage, options);
            }
        };
        this.mAnimatedImageFactory = animatedImageFactory;
        this.mBitmapConfig = bitmapConfig;
        this.mPlatformDecoder = platformDecoder;
        this.mCustomDecoders = customDecoders;
    }

    @Override // com.facebook.imagepipeline.decoder.ImageDecoder
    public CloseableImage decode(EncodedImage encodedImage, int length, QualityInfo qualityInfo, ImageDecodeOptions options) {
        ImageDecoder decoder;
        ImageFormat imageFormat = encodedImage.getImageFormat();
        if (imageFormat == null || imageFormat == ImageFormat.UNKNOWN) {
            imageFormat = ImageFormatChecker.getImageFormat_WrapIOException(encodedImage.getInputStream());
            encodedImage.setImageFormat(imageFormat);
        }
        return (this.mCustomDecoders == null || (decoder = this.mCustomDecoders.get(imageFormat)) == null) ? this.mDefaultDecoder.decode(encodedImage, length, qualityInfo, options) : decoder.decode(encodedImage, length, qualityInfo, options);
    }

    public CloseableImage decodeGif(EncodedImage encodedImage, ImageDecodeOptions options) {
        CloseableImage decodeStaticImage;
        InputStream is = encodedImage.getInputStream();
        if (is == null) {
            return null;
        }
        try {
            if (!options.forceStaticImage && this.mAnimatedImageFactory != null) {
                decodeStaticImage = this.mAnimatedImageFactory.decodeGif(encodedImage, options, this.mBitmapConfig);
            } else {
                decodeStaticImage = decodeStaticImage(encodedImage, options);
                Closeables.closeQuietly(is);
            }
            return decodeStaticImage;
        } finally {
            Closeables.closeQuietly(is);
        }
    }

    public CloseableStaticBitmap decodeStaticImage(EncodedImage encodedImage, ImageDecodeOptions options) {
        CloseableReference<Bitmap> bitmapReference = this.mPlatformDecoder.decodeFromEncodedImage(encodedImage, options.bitmapConfig);
        try {
            return new CloseableStaticBitmap(bitmapReference, ImmutableQualityInfo.FULL_QUALITY, encodedImage.getRotationAngle());
        } finally {
            bitmapReference.close();
        }
    }

    public CloseableStaticBitmap decodeJpeg(EncodedImage encodedImage, int length, QualityInfo qualityInfo, ImageDecodeOptions options) {
        CloseableReference<Bitmap> bitmapReference = this.mPlatformDecoder.decodeJPEGFromEncodedImage(encodedImage, options.bitmapConfig, length);
        try {
            return new CloseableStaticBitmap(bitmapReference, qualityInfo, encodedImage.getRotationAngle());
        } finally {
            bitmapReference.close();
        }
    }

    public CloseableImage decodeAnimatedWebp(EncodedImage encodedImage, ImageDecodeOptions options) {
        return this.mAnimatedImageFactory.decodeWebP(encodedImage, options, this.mBitmapConfig);
    }
}
