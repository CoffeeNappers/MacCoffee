package com.vkontakte.android.ui.adapters;

import android.content.Context;
import android.support.annotation.Nullable;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.vk.attachpicker.SelectionContext;
import com.vk.attachpicker.adapter.OnItemClickAdapter;
import com.vk.attachpicker.holder.MediaStoreItemSmallHolder;
import com.vk.attachpicker.mediastore.MediaStoreEntry;
import com.vkontakte.android.R;
import java.util.ArrayList;
import java.util.List;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class PhotoSmallPickerAdapter extends OnItemClickAdapter<RecyclerView.ViewHolder> {
    private static final int MAX_IMAGES = 20;
    private static final int TYPE_ITEM = 0;
    private static final int TYPE_OPEN_GALLERY = 1;
    private final Context context;
    @Nullable
    private MediaStoreEntry galleryEntry;
    private final List<MediaStoreEntry> images = new ArrayList(20);
    private final SelectionContext selectionContext;
    private boolean singleMode;

    public PhotoSmallPickerAdapter(Context context, SelectionContext selectionContext, boolean singleMode) {
        this.context = context;
        this.selectionContext = selectionContext;
        this.singleMode = singleMode;
        setHasStableIds(true);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    /* renamed from: onCreateViewHolder */
    public RecyclerView.ViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
        int size = V.dp(100.0f);
        RecyclerView.LayoutParams params = new RecyclerView.LayoutParams(size, size);
        if (viewType == 1) {
            View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.row_picker_gallery_open_layout, parent, false);
            view.setLayoutParams(params);
            return wrapHolder(new PickPhotoGalleryViewHolder(view));
        }
        int radius = V.dp(6.0f);
        MediaStoreItemSmallHolder holder = new MediaStoreItemSmallHolder(this.context, this.selectionContext, this, this.singleMode, true, radius);
        holder.itemView.setLayoutParams(params);
        return wrapHolder(holder);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public void onBindViewHolder(RecyclerView.ViewHolder viewHolder, int position) {
        MediaStoreEntry mediaStoreEntry = this.images.get(position);
        if (viewHolder instanceof MediaStoreItemSmallHolder) {
            ((MediaStoreItemSmallHolder) viewHolder).update(mediaStoreEntry);
        } else if (viewHolder instanceof PickPhotoGalleryViewHolder) {
            ((PickPhotoGalleryViewHolder) viewHolder).onBind(mediaStoreEntry);
        }
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public int getItemCount() {
        return this.images.size();
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public long getItemId(int position) {
        return this.images.get(position).id;
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public int getItemViewType(int position) {
        return this.images.size() + (-1) == position ? 1 : 0;
    }

    public void setImages(List<MediaStoreEntry> images) {
        if (images != null) {
            this.images.clear();
            for (MediaStoreEntry entry : images) {
                this.images.add(entry);
                if (this.images.size() > 20) {
                    break;
                }
            }
            if (images.size() <= 20) {
                if (this.galleryEntry == null && this.images.size() > 0) {
                    this.galleryEntry = this.images.get(this.images.size() - 1);
                }
                if (this.galleryEntry != null) {
                    this.images.add(this.galleryEntry);
                }
            }
            notifyDataSetChanged();
        }
    }

    public MediaStoreEntry getItem(int position) {
        return this.images.get(position);
    }

    public void addItem(MediaStoreEntry entry) {
        this.images.remove(entry);
        this.images.add(0, entry);
        notifyDataSetChanged();
    }
}
