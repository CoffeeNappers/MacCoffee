package com.vkontakte.android.attachments;

import android.content.Context;
import android.support.annotation.Nullable;
import android.view.View;
import com.facebook.drawee.drawable.ScalingUtils;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import com.vkontakte.android.data.orm.StickerStockItem;
import com.vkontakte.android.fragments.stickers.StickersDetailsFragment;
import com.vkontakte.android.stickers.Stickers;
import com.vkontakte.android.stickers.StickersConfig;
import com.vkontakte.android.ui.FlowLayout;
import com.vkontakte.android.utils.Serializer;
/* loaded from: classes2.dex */
public class StickerAttachment extends Attachment implements ImageAttachment {
    public static final Serializer.Creator<StickerAttachment> CREATOR = new Serializer.CreatorAdapter<StickerAttachment>() { // from class: com.vkontakte.android.attachments.StickerAttachment.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public StickerAttachment mo1087createFromSerializer(Serializer in) {
            return new StickerAttachment(in);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public StickerAttachment[] mo1088newArray(int size) {
            return new StickerAttachment[size];
        }
    };
    private Callback callback;
    public int height;
    public int id;
    public String[] images;
    public int packID;
    @Nullable
    public String stickerReferrer;
    public int width;

    /* loaded from: classes2.dex */
    public interface Callback {
        void openStickerKeyboard(int i);
    }

    public StickerAttachment() {
    }

    public StickerAttachment(int _id, String[] _images, int _width, int _height, int pack) {
        this.id = _id;
        this.images = _images;
        this.width = _width;
        this.height = _height;
        this.packID = pack;
    }

    public StickerAttachment(Serializer in) {
        this.id = in.readInt();
        this.images = in.createStringArray();
        this.width = in.readInt();
        this.height = in.readInt();
        this.packID = in.readInt();
    }

    public void setCallback(Callback c) {
        this.callback = c;
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer p) {
        p.writeInt(this.id);
        p.writeStringArray(this.images);
        p.writeInt(this.width);
        p.writeInt(this.height);
        p.writeInt(this.packID);
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getFullView(final Context context) {
        int resultHeight;
        int resultWidth;
        VKImageView iv = new VKImageView(context);
        int width = this.width;
        int height = this.height;
        if (width == 0 || height == 0) {
            height = StickersConfig.STICKER_SIZE;
            width = height;
        }
        if (width > height) {
            resultWidth = StickersConfig.STICKER_SIZE;
            resultHeight = (int) ((resultWidth * height) / width);
        } else {
            resultHeight = StickersConfig.STICKER_SIZE;
            resultWidth = (int) ((resultHeight * width) / height);
        }
        iv.setFixedSize(resultWidth, Global.scale(8.0f) + resultHeight);
        iv.setPlaceholderImage(R.drawable.sticker_placeholder);
        iv.setActualScaleType(ScalingUtils.ScaleType.FIT_START);
        iv.setMaxWidth(StickersConfig.STICKER_SIZE);
        iv.setMaxHeight(StickersConfig.STICKER_SIZE + Global.scale(8.0f));
        iv.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.attachments.StickerAttachment.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                StickerStockItem item = Stickers.get().getById(StickerAttachment.this.packID);
                if (item != null && ((item.active || item.promoted) && StickerAttachment.this.callback != null)) {
                    StickerAttachment.this.callback.openStickerKeyboard(StickerAttachment.this.packID);
                } else if (item == null) {
                    StickersDetailsFragment.show(StickerAttachment.this.packID, "message", context);
                } else {
                    item.referrer = "message";
                    StickersDetailsFragment.show(item, context);
                }
            }
        });
        return iv;
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public FlowLayout.LayoutParams overrideLayoutParams() {
        return null;
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getViewForList(Context context, View reuse) {
        return getFullView(context);
    }

    @Override // com.vkontakte.android.attachments.ImageAttachment
    public String getImageURL() {
        return getUrl();
    }

    @Override // com.vkontakte.android.attachments.ImageAttachment
    public void bind(View view) {
        ((VKImageView) view).load(getImageURL());
    }

    private String getUrl() {
        StickerStockItem item = Stickers.get().getById(this.packID);
        if (item != null) {
            return item.getServerStickerViewURL(this.id);
        }
        int stickerSize = Global.displayDensity > 1.0f ? 2 : 1;
        return this.images[stickerSize];
    }
}
