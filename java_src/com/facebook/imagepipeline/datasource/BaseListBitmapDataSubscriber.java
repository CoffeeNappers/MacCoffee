package com.facebook.imagepipeline.datasource;

import android.graphics.Bitmap;
import com.facebook.common.references.CloseableReference;
import com.facebook.datasource.BaseDataSubscriber;
import com.facebook.datasource.DataSource;
import com.facebook.imagepipeline.image.CloseableBitmap;
import com.facebook.imagepipeline.image.CloseableImage;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes.dex */
public abstract class BaseListBitmapDataSubscriber extends BaseDataSubscriber<List<CloseableReference<CloseableImage>>> {
    protected abstract void onNewResultListImpl(List<Bitmap> list);

    @Override // com.facebook.datasource.BaseDataSubscriber
    public void onNewResultImpl(DataSource<List<CloseableReference<CloseableImage>>> dataSource) {
        if (dataSource.isFinished()) {
            List<CloseableReference<CloseableImage>> imageRefList = dataSource.mo479getResult();
            if (imageRefList == null) {
                onNewResultListImpl(null);
                return;
            }
            try {
                List<Bitmap> bitmapList = new ArrayList<>(imageRefList.size());
                for (CloseableReference<CloseableImage> closeableImageRef : imageRefList) {
                    if (closeableImageRef != null && (closeableImageRef.get() instanceof CloseableBitmap)) {
                        bitmapList.add(((CloseableBitmap) closeableImageRef.get()).getUnderlyingBitmap());
                    } else {
                        bitmapList.add(null);
                    }
                }
                onNewResultListImpl(bitmapList);
            } finally {
                for (CloseableReference<CloseableImage> closeableImageRef2 : imageRefList) {
                    CloseableReference.closeSafely(closeableImageRef2);
                }
            }
        }
    }
}
