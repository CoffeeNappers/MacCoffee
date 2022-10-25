package com.vkontakte.android.fragments.feedback;

import android.support.annotation.Nullable;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.method.LinkMovementMethod;
import android.text.style.ForegroundColorSpan;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.R;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.models.Notification;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.attachments.ImageAttachment;
import com.vkontakte.android.functions.VoidF1;
import com.vkontakte.android.functions.VoidF1Int;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import java.util.ArrayList;
import me.grishka.appkit.views.UsableRecyclerView;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class CommentHolder extends RecyclerHolder<Notification> implements UsableRecyclerView.Clickable, View.OnClickListener {
    private static final String EMPTY_STRING = "";
    private static final int TAG_POST_URL = 0;
    private final TextView info;
    private VoidF1Int<Notification> mNewsAction;
    private VoidF1<UserProfile> mUsersAction;
    private final VKImageView photo;
    private final VKImageView postPhoto;
    private final TextView subtitle;
    private final TextView title;

    public CommentHolder(ViewGroup parent) {
        super((int) R.layout.notifications_item_comment, parent);
        this.title = (TextView) $(R.id.title);
        this.subtitle = (TextView) $(R.id.subtitle);
        this.info = (TextView) $(R.id.info);
        this.photo = (VKImageView) $(R.id.photo);
        this.postPhoto = (VKImageView) $(R.id.post_photo);
        this.photo.setOnClickListener(this);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String getImageURL(Notification entry, int position) {
        return position == 0 ? entry.commentUser.photo : getPostImageURL(entry);
    }

    public CommentHolder attach(VoidF1<UserProfile> userAction, @Nullable VoidF1Int<Notification> newsAction) {
        this.mNewsAction = newsAction;
        this.mUsersAction = userAction;
        return this;
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(Notification e) {
        int i = 0;
        this.photo.load(e.commentUser.photo);
        this.postPhoto.load(getPostImageURL(e));
        this.title.setText(e.commentUser.fullName);
        this.subtitle.setText(e.getText());
        SpannableStringBuilder infoText = (SpannableStringBuilder) e.getTag();
        if (infoText == null) {
            infoText = new SpannableStringBuilder(TimeUtils.langDateRelative(e.date, getResources()));
            infoText.append(' ');
            int linkLen = e.link == null ? 0 : e.link.length();
            switch (e.type.parentType) {
                case Market:
                    infoText.append((CharSequence) getResources().getString(R.string.ntf_to_market));
                    infoText.append(' ');
                    break;
                case Post:
                    infoText.append((CharSequence) getResources().getString(R.string.ntf_to_post));
                    infoText.append(' ');
                    break;
                case Photo:
                    infoText.append((CharSequence) getResources().getString(R.string.ntf_to_photo));
                    break;
                case Video:
                    infoText.append((CharSequence) getResources().getString(R.string.ntf_to_video));
                    infoText.append(' ');
                    break;
                case Comment:
                    infoText.append((CharSequence) getResources().getString(R.string.ntf_to_comment));
                    infoText.append(' ');
                    break;
                case Topic:
                    infoText.append((CharSequence) getResources().getString(R.string.ntf_to_topic));
                    infoText.append(' ');
                    break;
            }
            if (linkLen > 0) {
                infoText.append(e.link);
                infoText.setSpan(new ForegroundColorSpan(-12094296), infoText.length() - linkLen, infoText.length(), 33);
            }
        }
        this.info.setText(infoText);
        this.info.setMovementMethod(LinkMovementMethod.getInstance());
        VKImageView vKImageView = this.postPhoto;
        if (TextUtils.isEmpty(getPostImageURL(e))) {
            i = 8;
        }
        vKImageView.setVisibility(i);
    }

    public static int getImagesCount(Notification entry) {
        return TextUtils.isEmpty(getPostImageURL(entry)) ? 1 : 2;
    }

    public static String getPostImageURL(Notification entry) {
        String url = (String) entry.getTag(0);
        if (url == null) {
            boolean found = false;
            ArrayList<Attachment> attachments = entry.parentPost.attachments;
            int i = 0;
            while (true) {
                if (i >= attachments.size()) {
                    break;
                }
                Attachment att = attachments.get(i);
                if (!(att instanceof ImageAttachment)) {
                    i++;
                } else {
                    url = ((ImageAttachment) att).getImageURL();
                    entry.setTag(0, url);
                    found = true;
                    break;
                }
            }
            if (!found) {
                entry.setTag(0, "");
                return "";
            }
            return url;
        }
        return url;
    }

    @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
    public void onClick() {
        if (this.mNewsAction != null) {
            this.mNewsAction.f(getItem(), getAdapterPosition());
        }
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        if (getItem() != null && this.mUsersAction != null) {
            this.mUsersAction.f(getItem().commentUser);
        }
    }
}
