package com.facebook.imagepipeline.platform;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.MemoryFile;
import com.facebook.common.internal.ByteStreams;
import com.facebook.common.internal.Closeables;
import com.facebook.common.internal.Preconditions;
import com.facebook.common.internal.Throwables;
import com.facebook.common.references.CloseableReference;
import com.facebook.common.streams.LimitedInputStream;
import com.facebook.common.webp.WebpSupportStatus;
import com.facebook.imagepipeline.image.EncodedImage;
import com.facebook.imagepipeline.memory.PooledByteBuffer;
import com.facebook.imagepipeline.memory.PooledByteBufferInputStream;
import java.io.FileDescriptor;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Method;
import javax.annotation.Nullable;
/* loaded from: classes.dex */
public class GingerbreadPurgeableDecoder extends DalvikPurgeableDecoder {
    private static Method sGetFileDescriptorMethod;

    @Override // com.facebook.imagepipeline.platform.DalvikPurgeableDecoder, com.facebook.imagepipeline.platform.PlatformDecoder
    public /* bridge */ /* synthetic */ CloseableReference decodeFromEncodedImage(EncodedImage encodedImage, Bitmap.Config config) {
        return super.decodeFromEncodedImage(encodedImage, config);
    }

    @Override // com.facebook.imagepipeline.platform.DalvikPurgeableDecoder, com.facebook.imagepipeline.platform.PlatformDecoder
    public /* bridge */ /* synthetic */ CloseableReference decodeJPEGFromEncodedImage(EncodedImage encodedImage, Bitmap.Config config, int i) {
        return super.decodeJPEGFromEncodedImage(encodedImage, config, i);
    }

    @Override // com.facebook.imagepipeline.platform.DalvikPurgeableDecoder
    public /* bridge */ /* synthetic */ CloseableReference pinBitmap(Bitmap bitmap) {
        return super.pinBitmap(bitmap);
    }

    @Override // com.facebook.imagepipeline.platform.DalvikPurgeableDecoder
    protected Bitmap decodeByteArrayAsPurgeable(CloseableReference<PooledByteBuffer> bytesRef, BitmapFactory.Options options) {
        return decodeFileDescriptorAsPurgeable(bytesRef, bytesRef.get().size(), null, options);
    }

    @Override // com.facebook.imagepipeline.platform.DalvikPurgeableDecoder
    protected Bitmap decodeJPEGByteArrayAsPurgeable(CloseableReference<PooledByteBuffer> bytesRef, int length, BitmapFactory.Options options) {
        byte[] suffix = endsWithEOI(bytesRef, length) ? null : EOI;
        return decodeFileDescriptorAsPurgeable(bytesRef, length, suffix, options);
    }

    private static MemoryFile copyToMemoryFile(CloseableReference<PooledByteBuffer> bytesRef, int inputLength, @Nullable byte[] suffix) throws IOException {
        int outputLength = inputLength + (suffix == null ? 0 : suffix.length);
        MemoryFile memoryFile = new MemoryFile(null, outputLength);
        memoryFile.allowPurging(false);
        PooledByteBufferInputStream pbbIs = null;
        LimitedInputStream is = null;
        OutputStream os = null;
        try {
            PooledByteBufferInputStream pbbIs2 = new PooledByteBufferInputStream(bytesRef.get());
            try {
                LimitedInputStream is2 = new LimitedInputStream(pbbIs2, inputLength);
                try {
                    os = memoryFile.getOutputStream();
                    ByteStreams.copy(is2, os);
                    if (suffix != null) {
                        memoryFile.writeBytes(suffix, 0, inputLength, suffix.length);
                    }
                    CloseableReference.closeSafely(bytesRef);
                    Closeables.closeQuietly(pbbIs2);
                    Closeables.closeQuietly(is2);
                    Closeables.close(os, true);
                    return memoryFile;
                } catch (Throwable th) {
                    th = th;
                    is = is2;
                    pbbIs = pbbIs2;
                    CloseableReference.closeSafely(bytesRef);
                    Closeables.closeQuietly(pbbIs);
                    Closeables.closeQuietly(is);
                    Closeables.close(os, true);
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                pbbIs = pbbIs2;
            }
        } catch (Throwable th3) {
            th = th3;
        }
    }

    private synchronized Method getFileDescriptorMethod() {
        if (sGetFileDescriptorMethod == null) {
            try {
                sGetFileDescriptorMethod = MemoryFile.class.getDeclaredMethod("getFileDescriptor", new Class[0]);
            } catch (Exception e) {
                throw Throwables.propagate(e);
            }
        }
        return sGetFileDescriptorMethod;
    }

    private FileDescriptor getMemoryFileDescriptor(MemoryFile memoryFile) {
        try {
            Object rawFD = getFileDescriptorMethod().invoke(memoryFile, new Object[0]);
            return (FileDescriptor) rawFD;
        } catch (Exception e) {
            throw Throwables.propagate(e);
        }
    }

    protected Bitmap decodeFileDescriptorAsPurgeable(CloseableReference<PooledByteBuffer> bytesRef, int inputLength, byte[] suffix, BitmapFactory.Options options) {
        MemoryFile memoryFile = null;
        try {
            try {
                memoryFile = copyToMemoryFile(bytesRef, inputLength, suffix);
                FileDescriptor fd = getMemoryFileDescriptor(memoryFile);
                Bitmap bitmap = WebpSupportStatus.sWebpBitmapFactory.decodeFileDescriptor(fd, null, options);
                return (Bitmap) Preconditions.checkNotNull(bitmap, "BitmapFactory returned null");
            } catch (IOException e) {
                throw Throwables.propagate(e);
            }
        } finally {
            if (memoryFile != null) {
                memoryFile.close();
            }
        }
    }
}
