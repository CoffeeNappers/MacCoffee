package com.vk.attachpicker;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.annotation.Nullable;
import com.vk.attachpicker.events.NotificationCenter;
import com.vk.attachpicker.mediastore.MediaStoreEntry;
import com.vk.core.util.TimeoutLock;
import java.io.File;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class SelectionContext {
    public static final TimeoutLock globalCheckLock = new TimeoutLock(70);
    private final ArrayList<MediaStoreEntry> currentSelection = new ArrayList<>();
    private int limit = 10;
    private int requestCode;
    @Nullable
    private SelectionCallback selectionCallback;

    /* loaded from: classes2.dex */
    public interface SelectionCallback {
        void onSelect(int i);
    }

    /* loaded from: classes2.dex */
    public interface SelectionContextProvider {
        SelectionContext getSelectionContext();
    }

    public void setSelectListener(SelectionCallback selectListener) {
        this.selectionCallback = selectListener;
    }

    public static Intent packSingleEntry(MediaStoreEntry e) {
        ArrayList<Uri> files = new ArrayList<>(1);
        files.add(e.path);
        boolean[] videoFlags = {e.isVideo};
        Bundle bundle = new Bundle();
        bundle.putParcelableArrayList(AttachIntent.RESULT_FILES, files);
        bundle.putBooleanArray(AttachIntent.RESULT_VIDEO_FLAGS, videoFlags);
        Intent intent = packSelection(bundle);
        intent.setData(e.path);
        return intent;
    }

    public static Intent packSinglePhoto(File file) {
        ArrayList<Uri> files = new ArrayList<>(1);
        files.add(Uri.fromFile(file));
        boolean[] videoFlags = {false};
        Bundle bundle = new Bundle();
        bundle.putParcelableArrayList(AttachIntent.RESULT_FILES, files);
        bundle.putBooleanArray(AttachIntent.RESULT_VIDEO_FLAGS, videoFlags);
        return packSelection(bundle);
    }

    public static Intent packSingleVideo(Uri file) {
        ArrayList<Uri> files = new ArrayList<>(1);
        files.add(file);
        boolean[] videoFlags = {true};
        Bundle bundle = new Bundle();
        bundle.putParcelableArrayList(AttachIntent.RESULT_FILES, files);
        bundle.putBooleanArray(AttachIntent.RESULT_VIDEO_FLAGS, videoFlags);
        Intent intent = packSelection(bundle);
        intent.setData(file);
        return intent;
    }

    public static Intent packSelection(Bundle b) {
        Intent intent = new Intent();
        intent.putExtra(AttachIntent.RESULT_ATTACHMENTS, b);
        return intent;
    }

    public Intent getPackedSelection() {
        return packSelection(getSelection());
    }

    public Bundle getSelection() {
        ArrayList<Uri> files = new ArrayList<>(this.currentSelection.size());
        boolean[] videoFlags = new boolean[this.currentSelection.size()];
        for (int i = 0; i < videoFlags.length; i++) {
            MediaStoreEntry e = this.currentSelection.get(i);
            files.add(e.path);
            videoFlags[i] = e.isVideo;
        }
        Bundle bundle = new Bundle();
        bundle.putParcelableArrayList(AttachIntent.RESULT_FILES, files);
        bundle.putBooleanArray(AttachIntent.RESULT_VIDEO_FLAGS, videoFlags);
        return bundle;
    }

    public ArrayList<Uri> getSelectionPaths() {
        ArrayList<Uri> files = new ArrayList<>(this.currentSelection.size());
        for (int i = 0; i < this.currentSelection.size(); i++) {
            files.add(this.currentSelection.get(i).path);
        }
        return files;
    }

    public int getRequestCode() {
        return this.requestCode;
    }

    public void setRequestCode(int requestCode) {
        this.requestCode = requestCode;
    }

    public int getLimit() {
        return this.limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public int selectionCount() {
        return this.currentSelection.size();
    }

    public boolean isSelected(MediaStoreEntry entry) {
        if (entry == null) {
            return false;
        }
        return this.currentSelection.contains(entry);
    }

    public int findSelectionPosition(MediaStoreEntry entry) {
        for (int i = 0; i < this.currentSelection.size(); i++) {
            if (this.currentSelection.get(i).equals(entry)) {
                int pos = i;
                return pos;
            }
        }
        return -1;
    }

    public int addSelection(MediaStoreEntry entry) {
        if (this.currentSelection.size() == this.limit || isSelected(entry)) {
            return findSelectionPosition(entry);
        }
        this.currentSelection.add(entry);
        onSelectionChange();
        return this.currentSelection.size() - 1;
    }

    public boolean removeSelection(MediaStoreEntry entry) {
        if (isSelected(entry)) {
            this.currentSelection.remove(entry);
            onSelectionChange();
            return true;
        }
        return false;
    }

    public void clear() {
        this.currentSelection.clear();
        onSelectionChange();
    }

    private void onSelectionChange() {
        NotificationCenter.getInstance().fireEvent(1);
        if (this.selectionCallback != null) {
            this.selectionCallback.onSelect(selectionCount());
        }
    }
}
