package com.vkontakte.android.fragments.feedback;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.style.ForegroundColorSpan;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
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
import com.vkontakte.android.ui.Font;
import com.vkontakte.android.ui.PhotoStripView;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.utils.UriUtil;
import java.util.ArrayList;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes2.dex */
public class UsersHolder extends RecyclerHolder<Notification> implements View.OnClickListener, PhotoStripView.OnPhotoClickListener, UsableRecyclerView.Clickable {
    private static final String EMPTY_STRING = "";
    private static final int TAG_POST_URL = 0;
    private ImageView action;
    private final String[][][] mActions;
    @Nullable
    private VoidF1Int<Notification> mNewsAction;
    @Nullable
    private VoidF1<UserProfile> mUserAction;
    private VKImageView photo;
    private VKImageView postPhoto;
    private TextView subtitle;
    private TextView title;
    private PhotoStripView users;

    public UsersHolder(@NonNull ViewGroup parent, @NonNull String[][][] actions) {
        super((int) R.layout.notifications_item_users, parent);
        this.title = (TextView) $(R.id.title);
        this.subtitle = (TextView) $(R.id.subtitle);
        this.photo = (VKImageView) $(R.id.photo);
        this.postPhoto = (VKImageView) $(R.id.post_photo);
        this.action = (ImageView) $(R.id.action);
        this.users = (PhotoStripView) $(R.id.users);
        this.mActions = actions;
        this.photo.setOnClickListener(this);
        this.postPhoto.setOnClickListener(this);
        this.users.setListener(this);
    }

    public UsersHolder attach(@Nullable VoidF1<UserProfile> userAction, @Nullable VoidF1Int<Notification> newsAction) {
        this.mUserAction = userAction;
        this.mNewsAction = newsAction;
        return this;
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(Notification entry) {
        int index2;
        int strId;
        if (entry.feedBackUsers != null && entry.feedBackUsers.size() > 0) {
            this.photo.load(entry.feedBackUsers.get(0).photo);
            if (entry.feedBackUsers.size() > 1) {
                int count = Math.min(6, Math.max(0, entry.feedBackUsers.size() - 1));
                this.users.setCount(count);
                for (int i = 1; i < count + 1; i++) {
                    this.users.load(i - 1, entry.feedBackUsers.get(i).photo);
                }
            }
        }
        this.users.setVisibility(entry.feedBackUsers.size() > 1 ? 0 : 8);
        this.postPhoto.load(getPostImageURL(entry));
        this.title.setMaxLines(entry.type.activity == Notification.Activity.MoneyTransfer ? 3 : 2);
        SpannableStringBuilder titleText = (SpannableStringBuilder) entry.getTag();
        if (titleText == null) {
            titleText = entry.feedBackUsers.size() > 0 ? new SpannableStringBuilder(entry.feedBackUsers.get(0).fullName) : new SpannableStringBuilder();
            titleText.setSpan(new Font.TypefaceSpan(Font.Medium, -12094296), 0, titleText.length(), 0);
            if (entry.feedBackUsers.size() > 1) {
                titleText.append(' ');
                String moreUsers = getResources().getQuantityString(R.plurals.ntf_x_more_users, entry.feedBackUsers.size() - 1, Integer.valueOf(entry.feedBackUsers.size() - 1));
                int start = moreUsers.indexOf("<b>");
                String moreUsers2 = moreUsers.replace("<b>", "");
                int end = moreUsers2.indexOf("</b>");
                String moreUsers3 = moreUsers2.replace("</b>", "");
                int offset = titleText.length();
                titleText.append((CharSequence) moreUsers3);
                titleText.setSpan(new Font.TypefaceSpan(Font.Medium), start + offset, end + offset, 0);
            }
            int index1 = 0;
            int index3 = 0;
            switch (entry.type.activity) {
                case Like:
                    index1 = 0;
                    this.action.setImageResource(R.drawable.ic_feedback_like);
                    break;
                case Copy:
                    index1 = 1;
                    this.action.setImageResource(R.drawable.ic_feedback_repost);
                    break;
                case Follow:
                    index1 = 2;
                    this.action.setImageResource(R.drawable.ic_feedback_add);
                    break;
                case FriendAccepted:
                    index1 = 3;
                    this.action.setImageResource(R.drawable.ic_feedback_added);
                    break;
                case MoneyTransfer:
                    index1 = -1;
                    this.action.setImageResource((entry.moneyTransfer.status != 2 || entry.moneyTransfer.isIncoming()) ? R.drawable.ic_feedback_money_green : R.drawable.ic_feedback_money_red);
                    break;
            }
            boolean isFemale = false;
            boolean isGroup = false;
            if (entry.feedBackUsers.size() == 1) {
                index2 = entry.feedBackUsers.get(0).f ? 1 : 0;
                isFemale = index2 == 1;
                isGroup = entry.feedBackUsers.get(0).getIsGroup();
            } else {
                index2 = 2;
            }
            switch (entry.type.parentType) {
                case Post:
                    index3 = 0;
                    break;
                case Photo:
                    index3 = 1;
                    break;
                case Video:
                    index3 = 2;
                    break;
                case Comment:
                    index3 = 3;
                    break;
            }
            titleText.append(' ');
            if (index1 >= 0) {
                titleText.append((CharSequence) this.mActions[index1][index2][index3]);
            } else {
                if (entry.moneyTransfer.isIncoming()) {
                    if (isGroup) {
                        strId = R.string.money_transfer_ntf_sent_neutral;
                    } else if (isFemale) {
                        strId = R.string.money_transfer_ntf_sent_female;
                    } else {
                        strId = R.string.money_transfer_ntf_sent_male;
                    }
                } else if (entry.moneyTransfer.status == 2) {
                    if (isGroup) {
                        strId = R.string.money_transfer_ntf_declined_neutral;
                    } else if (isFemale) {
                        strId = R.string.money_transfer_ntf_declined_female;
                    } else {
                        strId = R.string.money_transfer_ntf_declined_male;
                    }
                } else if (isGroup) {
                    strId = R.string.money_transfer_ntf_accepted_neutral;
                } else if (isFemale) {
                    strId = R.string.money_transfer_ntf_accepted_female;
                } else {
                    strId = R.string.money_transfer_ntf_accepted_male;
                }
                String str = getResources().getString(strId, entry.moneyTransfer.getAmountWithCurrencyFormatted());
                titleText.append((CharSequence) str);
            }
            if (entry.link != null) {
                titleText.append(' ');
                int start2 = titleText.length();
                titleText.append(entry.link);
                titleText.setSpan(new ForegroundColorSpan(-12094296), start2, titleText.length(), 33);
            }
            entry.setTag(titleText);
        } else {
            switch (entry.type.activity) {
                case Like:
                    this.action.setImageResource(R.drawable.ic_feedback_like);
                    break;
                case Copy:
                    this.action.setImageResource(R.drawable.ic_feedback_repost);
                    break;
                case Follow:
                    this.action.setImageResource(R.drawable.ic_feedback_add);
                    break;
                case FriendAccepted:
                    this.action.setImageResource(R.drawable.ic_feedback_added);
                    break;
                case MoneyTransfer:
                    this.action.setImageResource((entry.moneyTransfer.status != 2 || entry.moneyTransfer.isIncoming()) ? R.drawable.ic_feedback_money_green : R.drawable.ic_feedback_money_red);
                    break;
            }
        }
        this.title.setText(titleText);
        this.subtitle.setText(TimeUtils.langDateRelative(entry.date, getResources()));
        this.postPhoto.setVisibility(TextUtils.isEmpty(getPostImageURL(entry)) ? 8 : 0);
    }

    public static String getImageURL(Notification e, int index) {
        return index < Math.min(7, e.feedBackUsers.size()) ? e.feedBackUsers.get(index).photo : getPostImageURL(e);
    }

    public static int getImagesCount(Notification entry) {
        return (TextUtils.isEmpty(getPostImageURL(entry)) ? 0 : 1) + Math.min(entry.feedBackUsers.size(), 7);
    }

    public static String getPostImageURL(Notification entry) {
        ArrayList<Attachment> attachments;
        if (entry.type == Notification.Type.MoneyTransferAccepted || entry.type == Notification.Type.MoneyTransferDeclined || entry.type == Notification.Type.MoneyTransferReceived) {
            return UriUtil.resourceToUri(R.drawable.payment_snippet);
        }
        String url = (String) entry.getTag(0);
        if (url == null) {
            boolean found = false;
            if (entry.parentPost != null && (attachments = entry.parentPost.attachments) != null) {
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
            }
            if (!found) {
                entry.setTag(0, "");
                return "";
            }
            return url;
        }
        return url;
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        if (v == this.photo) {
            if (this.mUserAction != null) {
                this.mUserAction.f(getItem().feedBackUsers.get(0));
            }
        } else if (this.mNewsAction != null) {
            this.mNewsAction.f(getItem(), getAdapterPosition());
        }
    }

    @Override // com.vkontakte.android.ui.PhotoStripView.OnPhotoClickListener
    public void onPhotoClick(PhotoStripView view, int index) {
        if (view == this.users && this.mUserAction != null) {
            this.mUserAction.f(getItem().feedBackUsers.get(index + 1));
        }
    }

    @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
    public void onClick() {
        if (this.mNewsAction != null) {
            this.mNewsAction.f(getItem(), getAdapterPosition());
        }
    }
}
