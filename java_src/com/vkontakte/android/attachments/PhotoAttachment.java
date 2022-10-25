package com.vkontakte.android.attachments;

import android.content.Context;
import android.graphics.PointF;
import android.view.View;
import android.widget.ImageView;
import com.facebook.drawee.drawable.ScalingUtils;
import com.facebook.drawee.generic.GenericDraweeHierarchyBuilder;
import com.google.android.exoplayer2.text.ttml.TtmlNode;
import com.vk.core.util.Screen;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.Global;
import com.vkontakte.android.Photo;
import com.vkontakte.android.R;
import com.vkontakte.android.ui.FlowLayout;
import com.vkontakte.android.utils.L;
import com.vkontakte.android.utils.Serializer;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;
/* loaded from: classes2.dex */
public class PhotoAttachment extends Attachment implements ThumbAttachment, ImageAttachment {
    public static final Serializer.Creator<PhotoAttachment> CREATOR = new Serializer.CreatorAdapter<PhotoAttachment>() { // from class: com.vkontakte.android.attachments.PhotoAttachment.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public PhotoAttachment mo1087createFromSerializer(Serializer in) {
            int nImgs = in.readInt();
            Image[] imgs = new Image[nImgs];
            for (int i = 0; i < nImgs; i++) {
                imgs[i] = new Image((char) in.readInt(), in.readString(), in.readInt(), in.readInt());
            }
            return new PhotoAttachment(imgs, in.readInt(), in.readInt(), in.readInt(), in.readString(), in.readInt(), in.readInt(), in.readString(), in.readInt(), in.readDouble(), in.readDouble());
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public PhotoAttachment[] mo1088newArray(int size) {
            return new PhotoAttachment[size];
        }
    };
    public String accessKey;
    public int aid;
    public boolean breakAfter;
    public int date;
    public String descr;
    public int displayH;
    public int displayW;
    public boolean floating;
    public boolean hasSize;
    public HashMap<String, Image> images;
    public double lat;
    public double lon;
    public int oid;
    public int pid;
    public int postID;
    public float ratio;
    public String srcBig;
    public String srcThumb;
    public String thumbType;
    public int uid;

    public PhotoAttachment(Image[] _images, int _oid, int _pid, int _aid, String _descr, int _uid, int _date, String akey, int post, double lat, double lon) {
        this.images = new HashMap<>();
        this.thumbType = "m";
        this.lat = -9000.0d;
        this.lon = -9000.0d;
        for (Image img : _images) {
            if (img.url != null) {
                this.images.put(img.type + "", img);
            }
        }
        this.pid = _pid;
        this.oid = _oid;
        this.aid = _aid;
        this.descr = _descr;
        this.uid = _uid;
        this.date = _date;
        this.accessKey = akey;
        this.postID = post;
        Image im = this.images.get("x");
        if (im != null && im.width > 0 && im.height > 0) {
            this.ratio = im.width / im.height;
        } else {
            this.ratio = -1.0f;
        }
        if (this.images.containsKey("x")) {
            this.srcBig = this.images.get(((Global.displayDensity > 1.0f || Screen.isTablet()) && this.images.containsKey("y")) ? "y" : "x").url;
        } else {
            this.srcBig = "http://vk.com/images/x_null.gif";
        }
        this.srcThumb = this.images.containsKey("m") ? this.images.get("m").url : "http://vk.com/images/x_null.gif";
        this.lat = lat;
        this.lon = lon;
    }

    public PhotoAttachment(HashMap<String, Image> _images, int _oid, int _pid, int _aid, String _descr) {
        this.images = new HashMap<>();
        this.thumbType = "m";
        this.lat = -9000.0d;
        this.lon = -9000.0d;
        this.images.putAll(_images);
        this.pid = _pid;
        this.oid = _oid;
        this.aid = _aid;
        this.descr = _descr;
        Image im = this.images.get("x");
        if (im.width > 0 && im.height > 0) {
            this.ratio = im.width / im.height;
        } else {
            this.ratio = -1.0f;
        }
        if (this.images.containsKey("x")) {
            this.srcBig = this.images.get(((Global.displayDensity > 1.0f || Screen.isTablet()) && this.images.containsKey("y")) ? "y" : "x").url;
        }
        this.srcThumb = this.images.get("m").url;
    }

    public PhotoAttachment(Photo photo) {
        this.images = new HashMap<>();
        this.thumbType = "m";
        this.lat = -9000.0d;
        this.lon = -9000.0d;
        this.pid = photo.id;
        this.oid = photo.ownerID;
        this.aid = photo.albumID;
        this.uid = photo.userID;
        this.date = photo.date;
        this.descr = photo.descr;
        Iterator<Photo.Image> it = photo.sizes.iterator();
        while (it.hasNext()) {
            Photo.Image im = it.next();
            Image i = new Image();
            i.height = im.height;
            i.width = im.width;
            i.url = im.url;
            i.type = im.type;
            this.images.put(i.type + "", i);
        }
        Image im2 = this.images.get("x");
        if (im2 != null && im2.width > 0 && im2.height > 0) {
            this.ratio = im2.width / im2.height;
        } else {
            this.ratio = -1.0f;
        }
        this.accessKey = photo.accessKey;
        this.postID = photo.postID;
        this.lat = photo.lat;
        this.lon = photo.lon;
    }

    public PhotoAttachment(String thumb, String big, int _oid, int _pid, int _aid) {
        this(thumb, big, _oid, _pid, _aid, null);
    }

    public PhotoAttachment(String thumb, String big, int _oid, int _pid, int _aid, String _descr) {
        this(new Image[]{new Image('m', thumb, 0, 0), new Image('x', big, 0, 0)}, _oid, _pid, _aid, _descr, 0, 0, "", 0, -9000.0d, -9000.0d);
    }

    public void serializeTo(Serializer s) {
        Set<String> keys = this.images.keySet();
        s.writeInt(keys.size());
        for (String k : keys) {
            Image im = this.images.get(k);
            s.writeInt(k.charAt(0));
            s.writeString(im.url);
            s.writeInt(im.width);
            s.writeInt(im.height);
        }
        s.writeInt(this.oid);
        s.writeInt(this.pid);
        s.writeInt(this.aid);
        s.writeString(this.descr);
        s.writeInt(this.uid);
        s.writeInt(this.date);
        s.writeString(this.accessKey);
        s.writeInt(this.postID);
        s.writeDouble(this.lat);
        s.writeDouble(this.lon);
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getFullView(Context context) {
        return getViewForList(context, null);
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getViewForList(Context context, View reuse) {
        FixedSizeImageView iv = (FixedSizeImageView) getReusableView(context, "photo");
        iv.setImageResource(R.drawable.photo_placeholder);
        iv.setId(1);
        iv.setScaleType(this.hasSize ? ImageView.ScaleType.CENTER_CROP : ImageView.ScaleType.FIT_CENTER);
        if (this.displayW == 0) {
            this.displayW = Screen.dp(135);
        }
        if (this.displayH == 0) {
            this.displayH = Screen.dp(100);
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
        return iv;
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public FlowLayout.LayoutParams overrideLayoutParams() {
        return null;
    }

    /* loaded from: classes2.dex */
    public static class FixedSizeImageView extends VKImageView {
        public FixedSizeImageView(Context context) {
            super(context);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.vk.imageloader.view.VKImageView, com.vk.imageloader.view.GenericVKImageView
        public void buildHierarchy(GenericDraweeHierarchyBuilder builder) {
            builder.setPlaceholderImage(R.color.photo_placeholder);
        }
    }

    /* loaded from: classes2.dex */
    public static class FixedSizeImageViewTopCrop extends FixedSizeImageView {
        public FixedSizeImageViewTopCrop(Context context) {
            super(context);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.vkontakte.android.attachments.PhotoAttachment.FixedSizeImageView, com.vk.imageloader.view.VKImageView, com.vk.imageloader.view.GenericVKImageView
        public void buildHierarchy(GenericDraweeHierarchyBuilder builder) {
            builder.setActualImageScaleType(ScalingUtils.ScaleType.FOCUS_CROP);
            builder.setActualImageFocusPoint(new PointF(0.5f, 0.0f));
        }
    }

    public float getRatio() {
        return this.ratio;
    }

    @Override // com.vkontakte.android.attachments.ThumbAttachment
    public int getWidth(char sz) {
        return this.images.get(sz + "").width;
    }

    /* loaded from: classes2.dex */
    public static class Image implements Serializable {
        public int height;
        public char type;
        public String url;
        public int width;

        public Image() {
        }

        public Image(char type, String url, int w, int h) {
            this.type = type;
            this.url = url;
            this.width = w;
            this.height = h;
        }
    }

    private String getThumbType(int width, int height, HashMap<String, Image> imgs) {
        int max_s = Math.max(width, height);
        if (max_s <= 75) {
            return "s";
        }
        if (max_s < 130) {
            return "m";
        }
        if (imgs.containsKey("j") && max_s < 300) {
            return "j";
        }
        if (imgs.containsKey("o") && imgs.get("o").width >= width && imgs.get("o").height >= height) {
            return "o";
        }
        if (imgs.containsKey(TtmlNode.TAG_P) && imgs.get(TtmlNode.TAG_P).width >= width && imgs.get(TtmlNode.TAG_P).height >= height) {
            return TtmlNode.TAG_P;
        }
        if (imgs.containsKey("q") && imgs.get("q").width >= width && imgs.get("q").height >= height) {
            return "q";
        }
        if (imgs.containsKey("r") && imgs.get("r").width >= width && imgs.get("r").height >= height) {
            return "r";
        }
        return "x";
    }

    @Override // com.vkontakte.android.attachments.ThumbAttachment
    public void setViewSize(float width, float height, boolean breakAfter, boolean floating) {
        this.displayW = Math.round(width);
        this.displayH = Math.round(height);
        this.thumbType = getThumbType(this.displayW, this.displayH, this.images);
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
        try {
            return this.images.get(this.thumbType).url;
        } catch (Exception x) {
            L.e(x, new Object[0]);
            return null;
        }
    }

    public String toString() {
        return "photo" + this.oid + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.pid + (this.accessKey != null ? EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.accessKey : "");
    }

    @Override // com.vkontakte.android.attachments.ImageAttachment
    public String getImageURL() {
        return getThumbURL();
    }

    public void bind(View view) {
        ((VKImageView) view).load(getImageURL());
    }
}
