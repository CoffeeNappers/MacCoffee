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
public class WikiAttachment extends Attachment {
    public static final Serializer.Creator<WikiAttachment> CREATOR = new Serializer.CreatorAdapter<WikiAttachment>() { // from class: com.vkontakte.android.attachments.WikiAttachment.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public WikiAttachment mo1087createFromSerializer(Serializer in) {
            return new WikiAttachment(in.readString(), in.readString(), in.readInt(), in.readInt());
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public WikiAttachment[] mo1088newArray(int size) {
            return new WikiAttachment[size];
        }
    };
    int oid;
    int pid;
    public transient String refer = "";
    String section;
    String title;

    public WikiAttachment(String title, String section, int oid, int pid) {
        this.title = title;
        this.section = section;
        this.oid = oid;
        this.pid = pid;
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer p) {
        p.writeString(this.title);
        p.writeString(this.section);
        p.writeInt(this.oid);
        p.writeInt(this.pid);
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getFullView(Context context) {
        return getViewForList(context, null);
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getViewForList(Context context, View reuse) {
        View v = reuse == null ? getReusableView(context, "common") : reuse;
        ((ImageView) v.findViewById(R.id.attach_icon)).setImageResource(ViewUtils.getResFromTheme(context, R.attr.ic_attach_link));
        ((TextView) v.findViewById(R.id.attach_title)).setText(this.title);
        ((TextView) v.findViewById(R.id.attach_subtitle)).setText(R.string.attach_wiki);
        v.setOnClickListener(WikiAttachment$$Lambda$1.lambdaFactory$(this));
        return v;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$getViewForList$0(View v1) {
        new WikiViewFragment.Builder().setOid(this.oid).setPid(this.pid).setTitle(this.title).setSection(this.section).setRefer(this.refer).go(v1.getContext());
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public FlowLayout.LayoutParams overrideLayoutParams() {
        return null;
    }
}
