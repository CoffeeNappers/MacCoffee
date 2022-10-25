package com.vkontakte.android.attachments;

import android.content.Context;
import android.os.Bundle;
import android.view.View;
import com.facebook.drawee.drawable.ScalingUtils;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import com.vkontakte.android.attachments.StickerAttachment;
import com.vkontakte.android.data.orm.StickerStockItem;
import com.vkontakte.android.fragments.gifts.ProfileGiftsFragment;
import com.vkontakte.android.fragments.stickers.StickersDetailsFragment;
import com.vkontakte.android.navigation.Navigate;
import com.vkontakte.android.stickers.Stickers;
import com.vkontakte.android.ui.FlowLayout;
import com.vkontakte.android.utils.Serializer;
/* loaded from: classes2.dex */
public class GiftAttachment extends Attachment implements ImageAttachment {
    public static final Serializer.Creator<GiftAttachment> CREATOR = new Serializer.CreatorAdapter<GiftAttachment>() { // from class: com.vkontakte.android.attachments.GiftAttachment.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public GiftAttachment mo1087createFromSerializer(Serializer in) {
            return new GiftAttachment(in);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public GiftAttachment[] mo1088newArray(int size) {
            return new GiftAttachment[size];
        }
    };
    private static final int SIZE = 352;
    private StickerAttachment.Callback callback;
    public int id;
    public String[] images;
    public int packID;

    public GiftAttachment() {
    }

    public GiftAttachment(int _id, String[] _images, int pack) {
        this.id = _id;
        this.images = _images;
        this.packID = pack;
    }

    public GiftAttachment(Serializer in) {
        this.id = in.readInt();
        this.images = in.createStringArray();
        this.packID = in.readInt();
    }

    public void setCallback(StickerAttachment.Callback c) {
        this.callback = c;
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeInt(this.id);
        s.writeStringArray(this.images);
        s.writeInt(this.packID);
    }

    public boolean hasPackId() {
        return this.packID != 0;
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getFullView(final Context context) {
        VKImageView iv = new VKImageView(context) { // from class: com.vkontakte.android.attachments.GiftAttachment.2
            @Override // com.vk.imageloader.view.GenericVKImageView, android.widget.ImageView, android.view.View
            public void onMeasure(int wms, int hms) {
                setMeasuredDimension(Global.scale(352.0f) / 2, (Global.scale(352.0f) / 2) + Global.scale(8.0f));
            }
        };
        iv.setPlaceholderImage(R.drawable.sticker_placeholder);
        iv.setActualScaleType(ScalingUtils.ScaleType.FIT_START);
        if (this.packID != 0) {
            iv.setOnClickListener(GiftAttachment$$Lambda$1.lambdaFactory$(this, context));
        } else {
            iv.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.attachments.GiftAttachment.3
                @Override // android.view.View.OnClickListener
                public void onClick(View v) {
                    Navigate.to(ProfileGiftsFragment.class, new Bundle(), context);
                }
            });
        }
        return iv;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$getFullView$0(Context context, View v) {
        StickerStockItem item = Stickers.get().getById(this.packID);
        if (item != null && ((item.active || item.promoted) && this.callback != null)) {
            this.callback.openStickerKeyboard(this.packID);
        } else if (item == null) {
            StickersDetailsFragment.show(this.packID, "message", context);
        } else {
            item.referrer = "message";
            StickersDetailsFragment.show(item, context);
        }
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
        int stickerSize = Global.displayDensity > 1.0f ? 2 : 1;
        return this.images[stickerSize];
    }

    @Override // com.vkontakte.android.attachments.ImageAttachment
    public void bind(View view) {
        ((VKImageView) view).load(getImageURL());
    }
}
