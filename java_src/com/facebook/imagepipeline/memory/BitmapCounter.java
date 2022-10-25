package com.facebook.imagepipeline.memory;

import android.graphics.Bitmap;
import android.os.Build;
import com.facebook.common.internal.Preconditions;
import com.facebook.common.internal.Throwables;
import com.facebook.common.references.CloseableReference;
import com.facebook.common.references.ResourceReleaser;
import com.facebook.imagepipeline.common.TooManyBitmapsException;
import com.facebook.imagepipeline.nativecode.Bitmaps;
import com.facebook.imageutils.BitmapUtil;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.concurrent.GuardedBy;
/* loaded from: classes.dex */
public class BitmapCounter {
    @GuardedBy("this")
    private int mCount;
    private final int mMaxCount;
    private final int mMaxSize;
    @GuardedBy("this")
    private long mSize;
    private final ResourceReleaser<Bitmap> mUnpooledBitmapsReleaser;

    public BitmapCounter(int maxCount, int maxSize) {
        boolean z = true;
        Preconditions.checkArgument(maxCount > 0);
        Preconditions.checkArgument(maxSize <= 0 ? false : z);
        this.mMaxCount = maxCount;
        this.mMaxSize = maxSize;
        this.mUnpooledBitmapsReleaser = new ResourceReleaser<Bitmap>() { // from class: com.facebook.imagepipeline.memory.BitmapCounter.1
            @Override // com.facebook.common.references.ResourceReleaser
            public void release(Bitmap value) {
                try {
                    BitmapCounter.this.decrease(value);
                } finally {
                    value.recycle();
                }
            }
        };
    }

    public synchronized boolean increase(Bitmap bitmap) {
        boolean z;
        int bitmapSize = BitmapUtil.getSizeInBytes(bitmap);
        if (this.mCount < this.mMaxCount) {
            if (this.mSize + bitmapSize <= this.mMaxSize) {
                this.mCount++;
                this.mSize += bitmapSize;
                z = true;
            }
        }
        z = false;
        return z;
    }

    public synchronized void decrease(Bitmap bitmap) {
        boolean z = true;
        synchronized (this) {
            int bitmapSize = BitmapUtil.getSizeInBytes(bitmap);
            Preconditions.checkArgument(this.mCount > 0, "No bitmaps registered.");
            if (bitmapSize > this.mSize) {
                z = false;
            }
            Preconditions.checkArgument(z, "Bitmap size bigger than the total registered size: %d, %d", Integer.valueOf(bitmapSize), Long.valueOf(this.mSize));
            this.mSize -= bitmapSize;
            this.mCount--;
        }
    }

    public synchronized int getCount() {
        return this.mCount;
    }

    public synchronized long getSize() {
        return this.mSize;
    }

    public ResourceReleaser<Bitmap> getReleaser() {
        return this.mUnpooledBitmapsReleaser;
    }

    public List<CloseableReference<Bitmap>> associateBitmapsWithBitmapCounter(List<Bitmap> bitmaps) {
        int countedBitmaps = 0;
        while (countedBitmaps < bitmaps.size()) {
            try {
                Bitmap bitmap = bitmaps.get(countedBitmaps);
                if (Build.VERSION.SDK_INT < 21) {
                    Bitmaps.pinBitmap(bitmap);
                }
                if (increase(bitmap)) {
                    countedBitmaps++;
                } else {
                    throw new TooManyBitmapsException();
                }
            } catch (Exception exception) {
                if (bitmaps != null) {
                    for (Bitmap bitmap2 : bitmaps) {
                        int countedBitmaps2 = countedBitmaps - 1;
                        if (countedBitmaps > 0) {
                            decrease(bitmap2);
                        }
                        bitmap2.recycle();
                        countedBitmaps = countedBitmaps2;
                    }
                }
                throw Throwables.propagate(exception);
            }
        }
        List<CloseableReference<Bitmap>> ret = new ArrayList<>(bitmaps.size());
        for (Bitmap bitmap3 : bitmaps) {
            ret.add(CloseableReference.of(bitmap3, this.mUnpooledBitmapsReleaser));
        }
        return ret;
    }
}
