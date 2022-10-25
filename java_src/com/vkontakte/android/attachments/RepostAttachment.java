package com.vkontakte.android.attachments;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.view.View;
import android.widget.TextView;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.R;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.ui.FlowLayout;
import com.vkontakte.android.utils.Serializer;
import io.fabric.sdk.android.services.events.EventsFilesManager;
/* loaded from: classes2.dex */
public class RepostAttachment extends Attachment implements ImageAttachment {
    public static final Serializer.Creator<RepostAttachment> CREATOR = new Serializer.CreatorAdapter<RepostAttachment>() { // from class: com.vkontakte.android.attachments.RepostAttachment.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public RepostAttachment mo1087createFromSerializer(Serializer in) {
            return new RepostAttachment(in);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public RepostAttachment[] mo1088newArray(int size) {
            return new RepostAttachment[size];
        }
    };
    public String name;
    public int ownerID;
    public String photo;
    public int postID;
    public int time;
    public int type;

    public RepostAttachment(int _ownerID, int _postID, int _time, String _name, String _photo, int _type) {
        this.ownerID = _ownerID;
        this.time = _time;
        this.name = _name;
        this.photo = _photo;
        this.postID = _postID;
        this.type = _type;
    }

    public RepostAttachment(Serializer p) {
        this.ownerID = p.readInt();
        this.postID = p.readInt();
        this.time = p.readInt();
        this.name = p.readString();
        this.photo = p.readString();
        this.type = p.readInt();
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer p) {
        p.writeInt(this.ownerID);
        p.writeInt(this.postID);
        p.writeInt(this.time);
        p.writeString(this.name);
        p.writeString(this.photo);
        p.writeInt(this.type);
    }

    @Override // com.vkontakte.android.attachments.ImageAttachment
    public String getImageURL() {
        return this.photo;
    }

    @Override // com.vkontakte.android.attachments.ImageAttachment
    public void bind(View view) {
        VKImageView imageView = (VKImageView) view.findViewById(R.id.wall_retweet_photo);
        imageView.setPlaceholderImage(this.ownerID < 0 ? R.drawable.group_placeholder : R.drawable.user_placeholder);
        imageView.load(getImageURL());
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getFullView(Context context) {
        return getViewForList(context, null);
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getViewForList(Context context, View reuse) {
        View v = getReusableView(context, "repost");
        ((TextView) v.findViewById(R.id.wall_retweet_name)).setText(this.name);
        ((TextView) v.findViewById(R.id.wall_retweet_time)).setText(TimeUtils.langDate(this.time) + (this.type == 0 ? "" : MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + context.getResources().getString(R.string.ntf_to_post)));
        v.setBackgroundDrawable(null);
        v.setOnClickListener(RepostAttachment$$Lambda$1.lambdaFactory$(this));
        v.setFocusable(false);
        v.setFocusableInTouchMode(false);
        return v;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$getViewForList$0(View v1) {
        Intent intent = new Intent("android.intent.action.VIEW", Uri.parse("vkontakte://vk.com/wall" + this.ownerID + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.postID));
        v1.getContext().startActivity(intent);
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public FlowLayout.LayoutParams overrideLayoutParams() {
        return null;
    }
}
