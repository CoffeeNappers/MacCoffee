package com.vkontakte.android.attachments;

import android.content.Context;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.utils.Serializer;
/* loaded from: classes2.dex */
public class BoardTopicAttachment extends Attachment {
    public View.OnClickListener clickListener;
    public String title;

    public BoardTopicAttachment(String title) {
        this.title = title;
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getFullView(Context context) {
        return null;
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getViewForList(Context context, View reuse) {
        View v = reuse == null ? getReusableView(context, "common") : reuse;
        ((ImageView) v.findViewById(R.id.attach_icon)).setImageResource(R.drawable.ic_attach_post);
        ((TextView) v.findViewById(R.id.attach_title)).setText(this.title);
        ((TextView) v.findViewById(R.id.attach_subtitle)).setText(VKApplication.context.getResources().getString(R.string.topic_in_post_list));
        v.setOnClickListener(this.clickListener);
        return v;
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
    }
}
