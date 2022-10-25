package com.vkontakte.android.attachments;

import android.content.Context;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.view.View;
import android.widget.ImageView;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ui.FlowLayout;
import com.vkontakte.android.upload.MessagesPhotoUploadTask;
import com.vkontakte.android.upload.PhotoUploadTask;
import com.vkontakte.android.upload.Upload;
import com.vkontakte.android.upload.WallPhotoUploadTask;
import com.vkontakte.android.utils.Serializer;
/* loaded from: classes2.dex */
public class PendingPhotoAttachment extends Attachment implements ThumbAttachment, PendingAttachment {
    public static final Serializer.Creator<PendingPhotoAttachment> CREATOR = new Serializer.CreatorAdapter<PendingPhotoAttachment>() { // from class: com.vkontakte.android.attachments.PendingPhotoAttachment.2
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public PendingPhotoAttachment mo1087createFromSerializer(Serializer s) {
            return new PendingPhotoAttachment(s);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public PendingPhotoAttachment[] mo1088newArray(int size) {
            return new PendingPhotoAttachment[size];
        }
    };
    private boolean breakAfter;
    private int displayH;
    private int displayW;
    public String fileUri;
    private boolean floating;
    public int h;
    public int id;
    private int ownerId;
    private boolean paddingAfter;
    public int w;
    private boolean wallPhoto;

    public PendingPhotoAttachment(String file) {
        this.fileUri = file;
        this.id = Upload.getNewID();
        fillSize();
    }

    public PendingPhotoAttachment(String file, int id) {
        this.fileUri = file;
        this.id = id;
        fillSize();
    }

    private void fillSize() {
        try {
            BitmapFactory.Options opts = new BitmapFactory.Options();
            opts.inJustDecodeBounds = true;
            Uri u = Uri.parse(this.fileUri);
            ParcelFileDescriptor fd = VKApplication.context.getContentResolver().openFileDescriptor(u, "r");
            BitmapFactory.decodeFileDescriptor(fd.getFileDescriptor(), null, opts);
            fd.close();
            this.w = opts.outWidth;
            this.h = opts.outHeight;
        } catch (Exception e) {
        }
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getFullView(Context context) {
        float f = 2.0f;
        View v = new ImageView(context) { // from class: com.vkontakte.android.attachments.PendingPhotoAttachment.1
            @Override // android.widget.ImageView, android.view.View
            public void onMeasure(int wms, int hms) {
                setMeasuredDimension(PendingPhotoAttachment.this.displayW, PendingPhotoAttachment.this.displayH);
            }
        };
        v.setBackgroundResource(R.drawable.photo_placeholder);
        int scale = Global.scale(2.0f);
        if (this.paddingAfter) {
            f = 10.0f;
        }
        FlowLayout.LayoutParams params = new FlowLayout.LayoutParams(scale, Global.scale(f));
        if (this.breakAfter || this.floating) {
            params.breakAfter = this.breakAfter;
            params.floating = this.floating;
        }
        v.setLayoutParams(params);
        return v;
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getViewForList(Context context, View reuse) {
        return getFullView(context);
    }

    @Override // com.vkontakte.android.attachments.ThumbAttachment
    public float getRatio() {
        return this.w / this.h;
    }

    @Override // com.vkontakte.android.attachments.ThumbAttachment
    public void setViewSize(float width, float height, boolean breakAfter, boolean floating) {
        this.displayW = (int) width;
        this.displayH = (int) height;
        this.breakAfter = breakAfter;
        this.floating = floating;
    }

    @Override // com.vkontakte.android.attachments.ThumbAttachment
    public int getWidth() {
        return this.w;
    }

    @Override // com.vkontakte.android.attachments.ThumbAttachment
    public int getHeight() {
        return this.h;
    }

    @Override // com.vkontakte.android.attachments.ThumbAttachment
    public String getThumbURL() {
        return null;
    }

    @Override // com.vkontakte.android.attachments.ThumbAttachment
    public int getWidth(char size) {
        return this.w;
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public FlowLayout.LayoutParams overrideLayoutParams() {
        return null;
    }

    public void setWallPhoto(boolean wallPhoto) {
        this.wallPhoto = wallPhoto;
    }

    public void setOwnerId(int ownerId) {
        this.ownerId = ownerId;
    }

    @Override // com.vkontakte.android.attachments.PendingAttachment
    public void setId(int id) {
        this.id = id;
    }

    @Override // com.vkontakte.android.attachments.PendingAttachment
    /* renamed from: createUploadTask */
    public PhotoUploadTask<PhotoAttachment> mo901createUploadTask(Context context) {
        PhotoUploadTask<PhotoAttachment> task;
        if (this.wallPhoto) {
            task = new WallPhotoUploadTask(context, this.fileUri, this.ownerId);
        } else {
            task = new MessagesPhotoUploadTask(context, this.fileUri, this.id);
        }
        this.id = task.getID();
        return task;
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeString(this.fileUri);
        s.writeInt(this.id);
        s.writeInt(this.w);
        s.writeInt(this.h);
    }

    private PendingPhotoAttachment(Serializer in) {
        this.fileUri = in.readString();
        this.id = in.readInt();
        this.w = in.readInt();
        this.h = in.readInt();
    }

    @Override // com.vkontakte.android.attachments.PendingAttachment
    public int getUploadId() {
        return this.id;
    }

    @Override // com.vkontakte.android.attachments.PendingAttachment
    public String getUrl() {
        return this.fileUri;
    }
}
