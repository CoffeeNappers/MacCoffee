package com.vkontakte.android.attachments;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.view.View;
import android.widget.TextView;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import com.vkontakte.android.utils.Serializer;
/* loaded from: classes2.dex */
public class ChronicleAttachment extends Attachment implements ImageAttachment {
    public static final Serializer.Creator<ChronicleAttachment> CREATOR = new Serializer.CreatorAdapter<ChronicleAttachment>() { // from class: com.vkontakte.android.attachments.ChronicleAttachment.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public ChronicleAttachment mo1087createFromSerializer(Serializer s) {
            return new ChronicleAttachment(s);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public ChronicleAttachment[] mo1088newArray(int size) {
            return new ChronicleAttachment[size];
        }
    };
    public String appName;
    public String appPackage;
    public String caption;
    public int id;
    public String label;
    public int ownerID;
    public String src;
    public String srcBig;

    public ChronicleAttachment(int _id, int _ownerID, String _appName, String _caption, String _appPackage, String _label, String _src, String _srcBig) {
        this.id = _id;
        this.ownerID = _ownerID;
        this.appName = _appName;
        this.appPackage = _appPackage;
        this.caption = _caption;
        this.label = _label;
        this.src = _src;
        this.srcBig = _srcBig;
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getFullView(Context context) {
        View view = View.inflate(context, R.layout.attach_chronicle, null);
        ((VKImageView) view.findViewById(R.id.photo)).setAspectRatio(0.75f);
        ((TextView) view.findViewById(R.id.app_name)).setText(this.appName);
        ((TextView) view.findViewById(R.id.photo_label)).setText(this.label);
        view.findViewById(R.id.photo_label).setVisibility(this.srcBig.length() > 0 ? 4 : 0);
        view.setOnClickListener(ChronicleAttachment$$Lambda$1.lambdaFactory$(this));
        return view;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$getFullView$0(View view1) {
        if (Global.isAppInstalled(view1.getContext(), this.appPackage)) {
            Intent intent = new Intent("com.vk.action.OPEN_SECRET_MESSAGE");
            intent.setPackage(this.appPackage);
            intent.putExtra("SECRET_MESSAGE_ID", this.id);
            intent.putExtra("SECRET_MESSAGE_OWNER_ID", this.ownerID);
            view1.getContext().startActivity(intent);
            return;
        }
        try {
            view1.getContext().startActivity(new Intent("android.intent.action.VIEW", Uri.parse("market://details?id=" + this.appPackage)));
        } catch (ActivityNotFoundException e) {
            view1.getContext().startActivity(new Intent("android.intent.action.VIEW", Uri.parse("http://play.google.com/store/apps/details?id=" + this.appPackage)));
        }
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getViewForList(Context context, View reuse) {
        return getFullView(context);
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeInt(this.id);
        s.writeInt(this.ownerID);
        s.writeString(this.appName);
        s.writeString(this.caption);
        s.writeString(this.appPackage);
        s.writeString(this.label);
        s.writeString(this.src);
        s.writeString(this.srcBig);
    }

    @Override // com.vkontakte.android.attachments.ImageAttachment
    public String getImageURL() {
        return this.srcBig.length() > 0 ? this.srcBig : "B|7|" + this.src;
    }

    @Override // com.vkontakte.android.attachments.ImageAttachment
    public void bind(View view) {
        ((VKImageView) view.findViewById(R.id.photo)).load(getImageURL());
    }

    private ChronicleAttachment(Serializer in) {
        this.id = in.readInt();
        this.ownerID = in.readInt();
        this.appName = in.readString();
        this.caption = in.readString();
        this.appPackage = in.readString();
        this.label = in.readString();
        this.src = in.readString();
        this.srcBig = in.readString();
    }
}
