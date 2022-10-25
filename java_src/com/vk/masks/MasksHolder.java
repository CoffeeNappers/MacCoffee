package com.vk.masks;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.vk.core.util.TimeoutLock;
import com.vk.imageloader.ImageSize;
import com.vk.imageloader.view.VKImageView;
import com.vk.masks.model.Mask;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
public class MasksHolder extends RecyclerView.ViewHolder {
    private static final TimeoutLock lock = new TimeoutLock(200);
    private static final MasksController masksController = MasksController.getInstance();
    private final View downloadView;
    private final VKImageView image;
    private Mask mask;
    private final View maskDisabled;
    private final View selectionView;
    private final View unsupportedView;

    public MasksHolder(Context context, final MasksAdapter adapter) {
        super(LayoutInflater.from(context).inflate(R.layout.layout_mask, (ViewGroup) null));
        this.itemView.setOnClickListener(new View.OnClickListener() { // from class: com.vk.masks.MasksHolder.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                if (!MasksHolder.lock.checkAndMaybeLock() && MasksHolder.this.mask.isSupported()) {
                    adapter.getOnMaskSelectedListener().onMaskSelected(adapter.getSectionId(), MasksHolder.this.mask);
                }
            }
        });
        this.image = (VKImageView) this.itemView.findViewById(R.id.iv_image);
        this.image.setHasOverlappingRendering(false);
        this.downloadView = this.itemView.findViewById(R.id.view_download);
        this.unsupportedView = this.itemView.findViewById(R.id.view_unsupported);
        this.selectionView = this.itemView.findViewById(R.id.view_selected_bg);
        this.maskDisabled = this.itemView.findViewById(R.id.view_intrigue);
    }

    public void update(Mask mask, boolean selected) {
        int i = 0;
        this.mask = mask;
        this.image.load(mask.preview, ImageSize.VERY_SMALL);
        if (selected) {
            this.selectionView.setVisibility(0);
            this.downloadView.setVisibility(4);
            this.unsupportedView.setVisibility(4);
            this.maskDisabled.setVisibility(4);
            return;
        }
        this.selectionView.setVisibility(8);
        if (mask.isSupported() && !mask.isDisabled()) {
            this.image.setAlpha(1.0f);
            this.itemView.setEnabled(true);
            View view = this.downloadView;
            if (!masksController.needDownload(mask)) {
                i = 4;
            }
            view.setVisibility(i);
            this.unsupportedView.setVisibility(4);
            this.maskDisabled.setVisibility(4);
        } else if (mask.isSupported() && mask.isDisabled()) {
            this.image.setAlpha(0.3f);
            this.itemView.setEnabled(true);
            this.unsupportedView.setVisibility(4);
            this.downloadView.setVisibility(4);
            this.maskDisabled.setVisibility(0);
        } else {
            this.image.setAlpha(0.3f);
            this.itemView.setEnabled(false);
            this.unsupportedView.setVisibility(0);
            this.downloadView.setVisibility(4);
            this.maskDisabled.setVisibility(4);
        }
    }
}
