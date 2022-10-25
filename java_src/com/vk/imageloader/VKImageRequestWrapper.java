package com.vk.imageloader;

import com.facebook.common.references.CloseableReference;
import com.facebook.datasource.DataSource;
import com.facebook.imagepipeline.image.CloseableImage;
/* loaded from: classes2.dex */
public class VKImageRequestWrapper {
    private DataSource<CloseableReference<CloseableImage>> dataSource;

    public void wrap(DataSource<CloseableReference<CloseableImage>> dataSource) {
        this.dataSource = dataSource;
    }

    public void cancel() {
        if (this.dataSource != null) {
            this.dataSource.close();
        }
    }

    public boolean isCanceled() {
        if (this.dataSource != null) {
            return this.dataSource.isClosed();
        }
        return false;
    }
}
