package com.vkontakte.android.attachments;

import android.content.Context;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.fragments.WikiViewFragment;
import com.vkontakte.android.ui.FlowLayout;
import com.vkontakte.android.utils.Serializer;
/* loaded from: classes2.dex */
public class NoteAttachment extends Attachment {
    public static final Serializer.Creator<NoteAttachment> CREATOR = new Serializer.CreatorAdapter<NoteAttachment>() { // from class: com.vkontakte.android.attachments.NoteAttachment.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public NoteAttachment mo1087createFromSerializer(Serializer in) {
            return new NoteAttachment(in.readString(), in.readInt(), in.readInt());
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public NoteAttachment[] mo1088newArray(int size) {
            return new NoteAttachment[size];
        }
    };
    int nid;
    int oid;
    String title;

    public NoteAttachment(String _title, int _oid, int _nid) {
        this.title = _title;
        this.oid = _oid;
        this.nid = _nid;
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeString(this.title);
        s.writeInt(this.oid);
        s.writeInt(this.nid);
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getFullView(Context context) {
        return getViewForList(context, null);
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getViewForList(Context context, View reuse) {
        View v = reuse == null ? getReusableView(context, "common") : reuse;
        ((ImageView) v.findViewById(R.id.attach_icon)).setImageResource(ViewUtils.getResFromTheme(context, R.attr.ic_attach_note));
        ((TextView) v.findViewById(R.id.attach_title)).setText(this.title);
        ((TextView) v.findViewById(R.id.attach_subtitle)).setText(R.string.attach_note);
        v.setOnClickListener(NoteAttachment$$Lambda$1.lambdaFactory$(this, context));
        return v;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$getViewForList$0(Context context, View v1) {
        new WikiViewFragment.Builder().setOid(this.oid).setNid(this.nid).setTitle(this.title).go(context);
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public FlowLayout.LayoutParams overrideLayoutParams() {
        return null;
    }
}
