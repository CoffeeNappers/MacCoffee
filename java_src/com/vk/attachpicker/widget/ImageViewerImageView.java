package com.vk.attachpicker.widget;

import android.content.Context;
import com.facebook.drawee.generic.GenericDraweeHierarchyBuilder;
import com.vk.attachpicker.mediastore.MediaStoreEntry;
import com.vk.imageloader.ImageSize;
import com.vk.imageloader.view.VKZoomableImageView;
/* loaded from: classes2.dex */
public class ImageViewerImageView extends VKZoomableImageView {
    private int currentPositionInImageViewer;
    private MediaStoreEntry entry;
    private final int position;

    public ImageViewerImageView(Context context, int position) {
        super(context);
        this.currentPositionInImageViewer = 0;
        this.position = position;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vk.imageloader.view.VKImageView, com.vk.imageloader.view.GenericVKImageView
    public void buildHierarchy(GenericDraweeHierarchyBuilder builder) {
        builder.setFadeDuration(0);
    }

    public MediaStoreEntry getEntry() {
        return this.entry;
    }

    public void displayImage(MediaStoreEntry image) {
        this.entry = image;
        load(image.path, ImageSize.SMALL, ImageSize.VERY_BIG);
    }

    public int getPosition() {
        return this.position;
    }

    public int getCurrentPositionInImageViewer() {
        return this.currentPositionInImageViewer;
    }

    public void setCurrentPositionInImageViewer(int currentPositionInImageViewer) {
        this.currentPositionInImageViewer = currentPositionInImageViewer;
    }

    public void updatePhotoViewAttacher() {
        if (hasImage()) {
            super.update(getImageWidth(), getImageHeight());
        }
    }
}
