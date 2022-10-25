package com.vkontakte.android.attachments;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.view.View;
import android.widget.TextView;
import com.vkontakte.android.R;
import com.vkontakte.android.utils.Serializer;
/* loaded from: classes2.dex */
public class SignatureLinkAttachment extends LinkAttachment {
    public static final Serializer.Creator<SignatureLinkAttachment> CREATOR = new Serializer.CreatorAdapter<SignatureLinkAttachment>() { // from class: com.vkontakte.android.attachments.SignatureLinkAttachment.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public SignatureLinkAttachment mo1087createFromSerializer(Serializer in) {
            return new SignatureLinkAttachment(in.readString(), in.readString());
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public SignatureLinkAttachment[] mo1088newArray(int size) {
            return new SignatureLinkAttachment[size];
        }
    };

    public SignatureLinkAttachment(String _url, String _title) {
        super(_url, _title, "");
    }

    @Override // com.vkontakte.android.attachments.LinkAttachment, android.view.View.OnClickListener
    public void onClick(View v) {
        v.getContext().startActivity(new Intent("android.intent.action.VIEW", Uri.parse("vklink://view/?" + this.url)));
    }

    @Override // com.vkontakte.android.attachments.LinkAttachment, com.vkontakte.android.attachments.Attachment
    public View getViewForList(Context context, View reuse) {
        View v = reuse == null ? getReusableView(context, "signature") : reuse;
        this.title = String.valueOf(this.title);
        ((TextView) v.findViewById(R.id.attach_title)).setText(this.title.length() > 0 ? this.title : context.getResources().getString(R.string.attach_link));
        ((TextView) v.findViewById(R.id.attach_title)).setCompoundDrawablesWithIntrinsicBounds(R.drawable.ic_post_signature, 0, 0, 0);
        v.setOnClickListener(this);
        return v;
    }

    @Override // com.vkontakte.android.attachments.LinkAttachment, com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeString(this.url);
        s.writeString(this.title);
    }
}
