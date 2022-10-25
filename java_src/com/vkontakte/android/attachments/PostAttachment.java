package com.vkontakte.android.attachments;

import android.content.Context;
import android.text.TextUtils;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import com.vk.webapp.ReportAppInputData;
import com.vkontakte.android.Log;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.fragments.PostViewFragment;
import com.vkontakte.android.ui.FlowLayout;
import com.vkontakte.android.utils.Serializer;
import io.fabric.sdk.android.services.events.EventsFilesManager;
/* loaded from: classes2.dex */
public class PostAttachment extends Attachment {
    public static final Serializer.Creator<PostAttachment> CREATOR = new Serializer.CreatorAdapter<PostAttachment>() { // from class: com.vkontakte.android.attachments.PostAttachment.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public PostAttachment mo1087createFromSerializer(Serializer in) {
            NewsEntry post = (NewsEntry) in.readSerializable(NewsEntry.class.getClassLoader());
            Log.i("vk", "read from parcel " + post);
            return new PostAttachment(post);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public PostAttachment[] mo1088newArray(int size) {
            return new PostAttachment[size];
        }
    };
    public NewsEntry post;

    public PostAttachment(NewsEntry entry) {
        this.post = entry;
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeSerializable(this.post);
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getFullView(Context context) {
        return getViewForList(context, null);
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getViewForList(Context context, View reuse) {
        String str;
        View v = reuse == null ? getReusableView(context, "common") : reuse;
        ((ImageView) v.findViewById(R.id.attach_icon)).setImageResource(ViewUtils.getResFromTheme(context, R.attr.ic_attach_post));
        ((TextView) v.findViewById(R.id.attach_title)).setText(VKApplication.context.getResources().getString(R.string.attach_wall_post));
        if (this.post != null) {
            TextView textView = (TextView) v.findViewById(R.id.attach_subtitle);
            if (TextUtils.isEmpty(this.post.displayablePreviewText)) {
                str = this.post.attachments.size() > 0 ? Attachment.getLocalizedDescription(this.post.attachments) : "";
            } else {
                str = ((Object) this.post.displayablePreviewText) + "";
            }
            textView.setText(str);
        }
        v.setOnClickListener(PostAttachment$$Lambda$1.lambdaFactory$(this));
        return v;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$getViewForList$0(View v1) {
        new PostViewFragment.Builder(this.post).go(v1.getContext());
    }

    public String toString() {
        Integer num = null;
        StringBuilder append = new StringBuilder().append(ReportAppInputData.REPORT_TYPE_WALL).append(this.post == null ? null : Integer.valueOf(this.post.ownerID)).append(EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR);
        if (this.post != null) {
            num = Integer.valueOf(this.post.postID);
        }
        return append.append(num).toString();
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public FlowLayout.LayoutParams overrideLayoutParams() {
        return null;
    }
}
