package com.vk.attachpicker.adapter;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.vk.attachpicker.SelectionContext;
import com.vk.attachpicker.holder.MediaStoreItemSmallHolder;
import com.vk.attachpicker.mediastore.MediaStoreEntry;
import com.vk.core.util.TimeoutLock;
import com.vkontakte.android.R;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class PhotoSmallAdapter extends OnItemClickAdapter<RecyclerView.ViewHolder> {
    public static final int TYPE_HEADER = 0;
    public static final int TYPE_ITEM = 1;
    private final Context context;
    private View.OnClickListener photoClickListener;
    private final SelectionContext selectionContext;
    private boolean singleMode;
    private View.OnClickListener videoClickListener;
    private final ArrayList<MediaStoreEntry> images = new ArrayList<>();
    private boolean cameraEnabled = true;
    private boolean emptyEnabled = false;

    public PhotoSmallAdapter(Context context, SelectionContext selectionContext, boolean singleMode) {
        this.context = context;
        this.selectionContext = selectionContext;
        this.singleMode = singleMode;
        setHasStableIds(true);
    }

    public boolean isCameraEnabled() {
        return this.cameraEnabled;
    }

    public void setCameraEnabled(boolean cameraEnabled) {
        this.cameraEnabled = cameraEnabled;
        notifyDataSetChanged();
    }

    public boolean isEmptyEnabled() {
        return this.emptyEnabled;
    }

    public void setEmptyEnabled(boolean emptyEnabled) {
        this.emptyEnabled = emptyEnabled;
        notifyDataSetChanged();
    }

    public View.OnClickListener getPhotoClickListener() {
        return this.photoClickListener;
    }

    public void setPhotoClickListener(View.OnClickListener photoClickListener) {
        this.photoClickListener = photoClickListener;
    }

    public View.OnClickListener getVideoClickListener() {
        return this.videoClickListener;
    }

    public void setVideoClickListener(View.OnClickListener videoClickListener) {
        this.videoClickListener = videoClickListener;
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    /* renamed from: onCreateViewHolder */
    public RecyclerView.ViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
        return viewType == 0 ? new CameraHeaderHolder(this.context) : wrapHolder(new MediaStoreItemSmallHolder(this.context, this.selectionContext, this, this.singleMode));
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public void onBindViewHolder(RecyclerView.ViewHolder holder, int position) {
        if (holder.getClass() == MediaStoreItemSmallHolder.class) {
            ((MediaStoreItemSmallHolder) holder).update(this.images.get(position - delta()));
        } else if (holder.getClass() == CameraHeaderHolder.class) {
            ((CameraHeaderHolder) holder).update(this.cameraEnabled, this.emptyEnabled);
        }
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public int getItemCount() {
        return this.images.size() + delta();
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public long getItemId(int position) {
        if ((this.cameraEnabled || this.emptyEnabled) && position == 0) {
            return 1L;
        }
        return this.images.get(position - delta()).id;
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public int getItemViewType(int position) {
        return ((this.cameraEnabled || this.emptyEnabled) && position == 0) ? 0 : 1;
    }

    public int delta() {
        return (this.cameraEnabled || this.emptyEnabled) ? 1 : 0;
    }

    public void setImages(ArrayList<MediaStoreEntry> images) {
        if (images != null) {
            this.images.clear();
            this.images.addAll(images);
            notifyDataSetChanged();
        }
    }

    public int getImagesCount() {
        return this.images.size();
    }

    public MediaStoreEntry getItem(int position) {
        return this.images.get(position);
    }

    public ArrayList<MediaStoreEntry> getItemsCopy() {
        return new ArrayList<>(this.images);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class CameraHeaderHolder extends RecyclerView.ViewHolder {
        private final TimeoutLock cameraLock;
        private View cameraView;
        private View emptyView;

        public CameraHeaderHolder(Context context) {
            super(LayoutInflater.from(context).inflate(R.layout.picker_layout_camera_header, (ViewGroup) null));
            this.cameraLock = new TimeoutLock(500L);
            this.cameraView = this.itemView.findViewById(R.id.ll_camera);
            this.emptyView = this.itemView.findViewById(R.id.tv_empty);
            this.cameraView.findViewById(R.id.fl_photo_camera).setOnClickListener(PhotoSmallAdapter$CameraHeaderHolder$$Lambda$1.lambdaFactory$(this));
            this.cameraView.findViewById(R.id.fl_video_camera).setOnClickListener(PhotoSmallAdapter$CameraHeaderHolder$$Lambda$2.lambdaFactory$(this));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$new$0(View v) {
            if (!this.cameraLock.isLocked()) {
                this.cameraLock.lock();
                if (PhotoSmallAdapter.this.photoClickListener != null) {
                    PhotoSmallAdapter.this.photoClickListener.onClick(v);
                }
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$new$1(View v) {
            if (!this.cameraLock.isLocked()) {
                this.cameraLock.lock();
                if (PhotoSmallAdapter.this.videoClickListener != null) {
                    PhotoSmallAdapter.this.videoClickListener.onClick(v);
                }
            }
        }

        public void update(boolean camera, boolean empty) {
            if (camera) {
                this.cameraView.setVisibility(0);
            } else {
                this.cameraView.setVisibility(8);
            }
            if (empty) {
                this.emptyView.setVisibility(0);
            } else {
                this.emptyView.setVisibility(8);
            }
        }
    }
}
