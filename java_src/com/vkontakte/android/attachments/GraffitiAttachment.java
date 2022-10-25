package com.vkontakte.android.attachments;

import android.content.Context;
import android.net.Uri;
import android.view.View;
import com.facebook.drawee.drawable.ScalingUtils;
import com.vk.core.util.Screen;
import com.vk.imageloader.ImageSize;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import com.vkontakte.android.api.Document;
import com.vkontakte.android.cache.LruCache;
import com.vkontakte.android.ui.FlowLayout;
import com.vkontakte.android.utils.Serializer;
import io.fabric.sdk.android.services.events.EventsFilesManager;
/* loaded from: classes2.dex */
public class GraffitiAttachment extends Attachment implements ImageAttachment {
    public String access_key;
    public int height;
    public int id;
    public int ownerId;
    public String url;
    public int width;
    private static final LruCache<String, String> docToLocalFileMap = new LruCache<>(10);
    public static final int GRAFFITI_SIZE = (int) (Screen.realWidth() * 0.7f);
    public static final Serializer.Creator<GraffitiAttachment> CREATOR = new Serializer.CreatorAdapter<GraffitiAttachment>() { // from class: com.vkontakte.android.attachments.GraffitiAttachment.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public GraffitiAttachment mo1087createFromSerializer(Serializer in) {
            return new GraffitiAttachment(in);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public GraffitiAttachment[] mo1088newArray(int size) {
            return new GraffitiAttachment[size];
        }
    };

    public static void put(int id, int ownerId, String path) {
        if (!path.startsWith("file://")) {
            path = "file://" + path;
        }
        docToLocalFileMap.put(id + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + ownerId, path);
    }

    public static String get(int id, int ownerId) {
        return docToLocalFileMap.get(id + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + ownerId);
    }

    public GraffitiAttachment() {
    }

    public GraffitiAttachment(Document doc) {
        this(doc.did, doc.oid, doc.url, doc.width, doc.height, doc.access_key);
    }

    public GraffitiAttachment(int id, int ownerId, String url, int width, int height, String access_key) {
        this.id = id;
        this.ownerId = ownerId;
        this.url = url;
        this.width = width;
        this.height = height;
        this.access_key = access_key;
    }

    public GraffitiAttachment(Serializer in) {
        this.id = in.readInt();
        this.ownerId = in.readInt();
        this.url = in.readString();
        this.width = in.readInt();
        this.height = in.readInt();
        this.access_key = in.readString();
    }

    public String toString() {
        return "doc" + this.ownerId + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.id + (this.access_key != null ? EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.access_key : "");
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer p) {
        p.writeInt(this.id);
        p.writeInt(this.ownerId);
        p.writeString(this.url);
        p.writeInt(this.width);
        p.writeInt(this.height);
        p.writeString(this.access_key);
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getFullView(Context context) {
        int viewSize;
        int resultHeight;
        int resultWidth;
        View.OnClickListener onClickListener;
        VKImageView iv = new VKImageView(context);
        int width = this.width;
        int height = this.height;
        if (width < GRAFFITI_SIZE && height < GRAFFITI_SIZE) {
            float scale = Math.min(1.7f, GRAFFITI_SIZE / Math.max(width, height));
            viewSize = (int) (Math.max(width, height) * scale);
        } else {
            viewSize = GRAFFITI_SIZE;
        }
        if (width == 0 || height == 0) {
            height = viewSize;
            width = viewSize;
        }
        if (width > height) {
            resultWidth = viewSize;
            resultHeight = (int) ((resultWidth * height) / width);
        } else {
            resultHeight = viewSize;
            resultWidth = (int) ((resultHeight * width) / height);
        }
        iv.setFixedSize(resultWidth, Global.scale(8.0f) + resultHeight);
        iv.setPlaceholderImage(R.drawable.sticker_placeholder);
        iv.setActualScaleType(ScalingUtils.ScaleType.FIT_START);
        iv.setMaxWidth(GRAFFITI_SIZE);
        iv.setMaxHeight(GRAFFITI_SIZE + Global.scale(8.0f));
        onClickListener = GraffitiAttachment$$Lambda$1.instance;
        iv.setOnClickListener(onClickListener);
        return iv;
    }

    public static /* synthetic */ void lambda$getFullView$0(View v) {
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
        return this.url;
    }

    @Override // com.vkontakte.android.attachments.ImageAttachment
    public void bind(View view) {
        String local = get(this.id, this.ownerId);
        if (local == null) {
            ((VKImageView) view).load(this.url, ImageSize.MID);
        } else {
            ((VKImageView) view).load(Uri.parse(local), ImageSize.MID, Uri.parse(this.url), ImageSize.MID);
        }
    }
}
