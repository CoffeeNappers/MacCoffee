package com.vkontakte.android.attachments;

import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.text.TextUtils;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;
import com.vk.imageloader.view.VKSnippetImageView;
import com.vkontakte.android.ActivityUtils;
import com.vkontakte.android.Global;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.fragments.location.GeoPlaceFragment;
import com.vkontakte.android.ui.FlowLayout;
import com.vkontakte.android.utils.Serializer;
import com.vkontakte.android.utils.Utils;
/* loaded from: classes2.dex */
public class GeoAttachment extends Attachment implements ImageAttachment {
    public static final Serializer.Creator<GeoAttachment> CREATOR = new Serializer.CreatorAdapter<GeoAttachment>() { // from class: com.vkontakte.android.attachments.GeoAttachment.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public GeoAttachment mo1087createFromSerializer(Serializer in) {
            return new GeoAttachment(in);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public GeoAttachment[] mo1088newArray(int size) {
            return new GeoAttachment[size];
        }
    };
    public static final int STYLE_MAP = 0;
    public static final int STYLE_MAP_WITH_ADDRESS = 3;
    public static final int STYLE_ONE_LINE = 1;
    public static final int STYLE_TWO_LINES = 2;
    public String address;
    public int id;
    public double lat;
    public double lon;
    public String photo;
    public int style;
    public String title;

    public GeoAttachment() {
        this.id = -1;
        this.style = 0;
    }

    public GeoAttachment(double _lat, double _lon, String _title, String _address, int _id, String _photo, int _style) {
        this.id = -1;
        this.style = 0;
        this.lat = _lat;
        this.lon = _lon;
        this.id = _id;
        this.style = _style;
        if (_title != null && _title.length() > 0) {
            this.title = _title;
        }
        if (_address != null && _address.length() > 0) {
            this.address = _address;
        }
        if (_photo != null && _photo.length() > 0) {
            this.photo = _photo;
        }
    }

    private GeoAttachment(Serializer p) {
        this.id = -1;
        this.style = 0;
        this.lat = p.readDouble();
        this.lon = p.readDouble();
        this.title = p.readString();
        this.address = p.readString();
        this.id = p.readInt();
        this.photo = p.readString();
        this.style = p.readInt();
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeDouble(this.lat);
        s.writeDouble(this.lon);
        s.writeString(this.title);
        s.writeString(this.address);
        s.writeInt(this.id);
        s.writeString(this.photo);
        s.writeInt(this.style);
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getFullView(Context context) {
        return getViewForList(context, null);
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getViewForList(Context context, View reuse) {
        String title;
        if (this.style == 1) {
            View v = reuse == null ? Attachment.getReusableView(context, "signature") : reuse;
            if (!TextUtils.isEmpty(this.title) && !TextUtils.isEmpty(this.address)) {
                title = this.title + ", " + this.address;
            } else if (!TextUtils.isEmpty(this.title)) {
                title = this.title;
            } else if (!TextUtils.isEmpty(this.address)) {
                title = this.address;
            } else {
                title = context.getString(R.string.place);
            }
            ((TextView) v.findViewById(R.id.attach_title)).setText(title);
            ((TextView) v.findViewById(R.id.attach_title)).setCompoundDrawablesWithIntrinsicBounds(R.drawable.ic_checkin, 0, 0, 0);
            v.setOnClickListener(GeoAttachment$$Lambda$1.lambdaFactory$(this));
            return v;
        } else if (this.style == 2) {
            View v2 = reuse != null ? reuse : Attachment.getReusableView(context, "common");
            ((TextView) v2.findViewById(R.id.attach_title)).setText(this.title);
            ((TextView) v2.findViewById(R.id.attach_subtitle)).setText(this.address);
            ((ImageView) v2.findViewById(R.id.attach_icon)).setImageResource(ViewUtils.getResFromTheme(context, R.attr.ic_attach_checkin));
            v2.setOnClickListener(GeoAttachment$$Lambda$2.lambdaFactory$(this));
            return v2;
        } else if (this.style == 3) {
            View v3 = View.inflate(context, R.layout.attach_map, null);
            ((TextView) v3.findViewById(R.id.attach_title)).setText(this.title);
            ((TextView) v3.findViewById(R.id.attach_subtitle)).setText(this.address);
            v3.setOnClickListener(GeoAttachment$$Lambda$3.lambdaFactory$(this, context));
            FlowLayout.LayoutParams lp = new FlowLayout.LayoutParams();
            lp.width = NewsEntry.getMaxThumbsWidth() - (context.getResources().getDimensionPixelOffset(R.dimen.post_side_padding_btn) * 2);
            lp.height = -2;
            lp.center = true;
            v3.setLayoutParams(lp);
            return v3;
        } else {
            FrameLayout fl = new FrameLayout(context);
            VKSnippetImageView iv = new VKSnippetImageView(context);
            iv.setId(R.id.map);
            iv.setScaleType(ImageView.ScaleType.CENTER_CROP);
            iv.setLayoutParams(new FrameLayout.LayoutParams(Global.scale(300.0f), Global.scale(130.0f)));
            fl.addView(iv);
            ImageView marker = new ImageView(context);
            marker.setImageResource(R.drawable.map_marker);
            FrameLayout.LayoutParams mparams = new FrameLayout.LayoutParams(-2, -1);
            mparams.gravity = 49;
            mparams.topMargin = Global.scale(32.0f);
            marker.setLayoutParams(mparams);
            fl.addView(marker);
            fl.setOnClickListener(GeoAttachment$$Lambda$4.lambdaFactory$(this, context));
            return fl;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$getViewForList$0(View v1) {
        openMap(v1.getContext());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$getViewForList$1(View v1) {
        openMap(v1.getContext());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$getViewForList$2(Context context, View v1) {
        openMap(context);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$getViewForList$3(Context context, View v) {
        openMap(context);
    }

    private void openMap(Context context) {
        if (this.id > 0) {
            GeoPlaceFragment.start(this, false).go(context);
            return;
        }
        try {
            Intent intent = new Intent("android.intent.action.VIEW", Uri.parse("geo:" + this.lat + "," + this.lon + "?z=18&q=" + this.lat + "," + this.lon));
            context.startActivity(intent);
        } catch (Throwable th) {
            ActivityUtils.requireGoogleMaps(Utils.castToActivity(context), false);
        }
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public FlowLayout.LayoutParams overrideLayoutParams() {
        return null;
    }

    @Override // com.vkontakte.android.attachments.ImageAttachment
    public String getImageURL() {
        if (this.style == 1) {
            return null;
        }
        return this.id > 0 ? this.photo : Global.getStaticMapURL(this.lat, this.lon, 300, 130);
    }

    @Override // com.vkontakte.android.attachments.ImageAttachment
    public void bind(View view) {
        VKSnippetImageView iv = (VKSnippetImageView) view.findViewById(R.id.map);
        if (iv != null) {
            Drawable placeholder = null;
            switch (this.style) {
                case 0:
                    placeholder = new ColorDrawable(1140850688);
                    break;
                case 2:
                    placeholder = view.getContext().getResources().getDrawable(ViewUtils.getResFromTheme(view.getContext(), R.attr.ic_attach_checkin));
                    break;
                case 3:
                    placeholder = view.getContext().getResources().getDrawable(R.drawable.attach_fb_placeholder_gray);
                    break;
            }
            iv.setPlaceholderImage(placeholder);
            iv.load(getImageURL());
        }
    }
}
