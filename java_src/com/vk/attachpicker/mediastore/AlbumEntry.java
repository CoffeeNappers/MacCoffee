package com.vk.attachpicker.mediastore;

import java.util.ArrayList;
/* loaded from: classes2.dex */
public class AlbumEntry {
    private final int bucketId;
    private final String bucketName;
    private MediaStoreEntry mediaStoreEntry;
    private final ArrayList<MediaStoreEntry> bucketImages = new ArrayList<>();
    private boolean isCameraBucket = false;

    public AlbumEntry(int id, String name) {
        this.bucketId = id;
        this.bucketName = name;
    }

    public int getId() {
        return this.bucketId;
    }

    public String getName() {
        return this.bucketName;
    }

    public int getImagesCount() {
        if (this.bucketImages == null) {
            return 0;
        }
        return this.bucketImages.size();
    }

    public boolean isCameraBucket() {
        return this.isCameraBucket;
    }

    public void setCameraBucket(boolean isCameraBucket) {
        this.isCameraBucket = isCameraBucket;
    }

    public MediaStoreEntry getMediaStoreEntry() {
        return this.mediaStoreEntry;
    }

    public void setMediaStoreEntry(MediaStoreEntry mediaStoreEntry) {
        this.mediaStoreEntry = mediaStoreEntry;
    }

    public ArrayList<MediaStoreEntry> getBucketImages() {
        return this.bucketImages;
    }

    public void addImage(MediaStoreEntry mediaStoreEntry) {
        this.bucketImages.add(mediaStoreEntry);
    }

    public void addImageToBeginning(MediaStoreEntry mediaStoreEntry) {
        this.bucketImages.add(0, mediaStoreEntry);
    }

    public String toString() {
        return "AlbumEntry{bucketId=" + this.bucketId + ", bucketName='" + this.bucketName + "', isCameraBucket=" + this.isCameraBucket + ", bucketImages=" + this.bucketImages + '}';
    }
}
