package com.vkontakte.android.attachments;

import android.content.Context;
import android.graphics.drawable.ColorDrawable;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.ImageView;
import android.widget.TextView;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.Photo;
import com.vkontakte.android.R;
import com.vkontakte.android.attachments.PhotoAttachment;
import com.vkontakte.android.data.GoodAlbum;
import com.vkontakte.android.fragments.market.MarketFragment;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.ui.FixedSizeFrameLayout;
import com.vkontakte.android.ui.FlowLayout;
import com.vkontakte.android.utils.Serializer;
import me.grishka.appkit.utils.V;
/* loaded from: classes2.dex */
public class MarketAlbumAttachment extends Attachment implements ThumbAttachment, ImageAttachment {
    public static final Serializer.Creator<MarketAlbumAttachment> CREATOR = new Serializer.CreatorAdapter<MarketAlbumAttachment>() { // from class: com.vkontakte.android.attachments.MarketAlbumAttachment.2
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public MarketAlbumAttachment mo1087createFromSerializer(Serializer in) {
            return new MarketAlbumAttachment((GoodAlbum) in.readSerializable(GoodAlbum.class.getClassLoader()));
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public MarketAlbumAttachment[] mo1088newArray(int size) {
            return new MarketAlbumAttachment[size];
        }
    };
    public boolean breakAfter;
    public int displayH;
    public int displayW;
    public boolean floating;
    GoodAlbum goodAlbum;
    public boolean hasSize;

    public MarketAlbumAttachment(GoodAlbum goodAlbum) {
        this.goodAlbum = goodAlbum;
        fillEmptyImages();
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getFullView(Context context) {
        return getViewForList(context, null);
    }

    private void fillEmptyImages() {
        Photo.Image image = this.goodAlbum.photo.getImage('x');
        if (image != null && image.width == 0 && image.height == 0 && image.url != null && image.url.endsWith(".gif")) {
            image.width = 432;
            image.height = 249;
            this.displayW = image.width;
            this.displayH = image.height;
        }
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getViewForList(Context context, View reuse) {
        PhotoAttachment.FixedSizeImageView iv = (PhotoAttachment.FixedSizeImageView) getReusableView(context, "market_album");
        iv.setImageResource(R.drawable.photo_placeholder);
        iv.setId(1);
        if (this.displayW == 0) {
            this.displayW = 135;
        }
        if (this.displayH == 0) {
            this.displayH = 100;
        }
        iv.setMinimumHeight(this.displayH);
        iv.setMaxHeight(this.displayH);
        iv.setMinimumWidth(this.displayW);
        iv.setMaxWidth(this.displayW);
        iv.setFixedSize(this.displayW, this.displayH);
        FlowLayout.LayoutParams params = FlowLayout.LayoutParams.CreateLayoutParamsForZhukovsLayout();
        if (this.breakAfter || this.floating) {
            params.breakAfter = this.breakAfter;
            params.floating = this.floating;
        }
        iv.setLayoutParams(params);
        iv.setOnClickListener(MarketAlbumAttachment$$Lambda$1.lambdaFactory$(this));
        iv.setId(R.id.attach_album_image);
        final View view = Attachment.getReusableView(context, ArgKeys.ALBUM);
        ((TextView) view.findViewById(R.id.attach_title)).setText(this.goodAlbum.title);
        ((TextView) view.findViewById(R.id.attach_subtitle)).setText(context.getResources().getQuantityString(R.plurals.goods_count, this.goodAlbum.count, Integer.valueOf(this.goodAlbum.count)));
        ((TextView) view.findViewById(R.id.attach_duration)).setText((CharSequence) null);
        if (((ViewGroup) view).getChildAt(0) instanceof ImageView) {
            ((ViewGroup) view).removeViewAt(0);
        }
        ((ViewGroup) view).addView(iv, 0);
        ((FixedSizeFrameLayout) view).setSize(this.displayW, this.displayH);
        ((ImageView) view.findViewById(R.id.attach_album_image)).setImageDrawable(new ColorDrawable(-855310));
        view.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vkontakte.android.attachments.MarketAlbumAttachment.1
            @Override // android.view.ViewTreeObserver.OnPreDrawListener
            public boolean onPreDraw() {
                view.getViewTreeObserver().removeOnPreDrawListener(this);
                if (view.getWidth() < V.dp(120.0f)) {
                    view.findViewById(R.id.attach_album_info).setVisibility(4);
                    view.findViewById(R.id.attach_duration).setVisibility(0);
                    return true;
                }
                view.findViewById(R.id.attach_album_info).setVisibility(0);
                view.findViewById(R.id.attach_duration).setVisibility(4);
                return true;
            }
        });
        return view;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$getViewForList$0(View v) {
        new MarketFragment.Builder(this.goodAlbum.owner_id).setAlbum(this.goodAlbum.id).go(v.getContext());
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeSerializable(this.goodAlbum);
    }

    @Override // com.vkontakte.android.attachments.ImageAttachment
    public String getImageURL() {
        return getThumbURL();
    }

    @Override // com.vkontakte.android.attachments.ImageAttachment
    public void bind(View view) {
        ((VKImageView) view.findViewById(R.id.attach_album_image)).load(getImageURL());
    }

    @Override // com.vkontakte.android.attachments.ThumbAttachment
    public float getRatio() {
        return 1.5f;
    }

    @Override // com.vkontakte.android.attachments.ThumbAttachment
    public void setViewSize(float width, float height, boolean breakAfter, boolean floating) {
        this.displayW = Math.round(width);
        this.displayH = Math.round(height);
        this.breakAfter = breakAfter;
        this.floating = floating;
        this.hasSize = true;
    }

    @Override // com.vkontakte.android.attachments.ThumbAttachment
    public int getWidth() {
        return this.displayW;
    }

    @Override // com.vkontakte.android.attachments.ThumbAttachment
    public int getHeight() {
        return this.displayH;
    }

    @Override // com.vkontakte.android.attachments.ThumbAttachment
    public String getThumbURL() {
        return this.goodAlbum.photo.getImageByWidth(getWidth()).url;
    }

    @Override // com.vkontakte.android.attachments.ThumbAttachment
    public int getWidth(char size) {
        return this.goodAlbum.photo.getImage(size).width;
    }
}
