package com.vkontakte.android.ui.holder;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.R;
import com.vkontakte.android.RequestUserProfile;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.functions.VoidF1;
import com.vkontakte.android.functions.VoidF2Int;
import com.vkontakte.android.ui.PhotoStripView;
/* loaded from: classes3.dex */
public class FriendRequestHolder extends RecyclerHolder<RequestUserProfile> implements View.OnClickListener {
    @Nullable
    private VoidF2Int<RequestUserProfile, Boolean> mAcceptListener;
    private final TextView mInfo;
    private final TextView mMessage;
    private final TextView mNegativeButton;
    private final VKImageView mPhoto;
    private final TextView mPositiveButton;
    private final TextView mSubtitle;
    private final TextView mTitle;
    @Nullable
    private VoidF1<UserProfile> mUserListener;
    private final TextView mUserMessage;
    private final PhotoStripView mUsers;

    public FriendRequestHolder(@NonNull ViewGroup parent) {
        super((int) R.layout.friend_request_item, parent);
        this.mTitle = (TextView) $(R.id.title);
        this.mSubtitle = (TextView) $(R.id.subtitle);
        this.mUserMessage = (TextView) $(R.id.user_message);
        this.mInfo = (TextView) $(R.id.info);
        this.mPhoto = (VKImageView) $(R.id.photo);
        this.mUsers = (PhotoStripView) $(R.id.users);
        this.mPositiveButton = (TextView) $(R.id.positive);
        this.mNegativeButton = (TextView) $(R.id.negative);
        this.mMessage = (TextView) $(R.id.message);
        this.mPositiveButton.setOnClickListener(this);
        this.mNegativeButton.setOnClickListener(this);
        this.itemView.setOnClickListener(this);
    }

    public FriendRequestHolder attach(@Nullable VoidF1<UserProfile> usersListener, @Nullable VoidF2Int<RequestUserProfile, Boolean> acceptListener) {
        this.mUserListener = usersListener;
        this.mAcceptListener = acceptListener;
        return this;
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(RequestUserProfile item) {
        int i = 0;
        this.mPhoto.load(item.photo);
        this.mTitle.setText(item.fullName);
        this.mSubtitle.setText(item.info);
        this.mSubtitle.setVisibility(TextUtils.isEmpty(item.info) ? 8 : 0);
        this.mNegativeButton.setText(item.isOutgoing ? R.string.profile_friend_cancel : R.string.friends_decline);
        this.mUserMessage.setVisibility(TextUtils.isEmpty(item.message) ? 8 : 0);
        this.mUserMessage.setText(item.message);
        if (item.numMutualFriends > 0) {
            this.mInfo.setVisibility(0);
            this.mUsers.setVisibility(0);
            String info = (String) item.getTag();
            if (info == null) {
                info = getResources().getQuantityString(R.plurals.num_mutual_friends_req, item.numMutualFriends, Integer.valueOf(item.numMutualFriends));
                item.setTag(info);
            }
            this.mInfo.setText(info);
            this.mUsers.setCount(item.mutualFriends.length);
            this.mUsers.setCount(item.mutualFriends.length);
            for (int i2 = 0; i2 < item.mutualFriends.length; i2++) {
                this.mUsers.load(i2, item.mutualFriends[i2].photo);
            }
        } else {
            this.mInfo.setVisibility(8);
            this.mUsers.setVisibility(8);
            this.mUsers.reset();
        }
        if (item.sent != null) {
            this.mPositiveButton.setVisibility(8);
            this.mNegativeButton.setVisibility(8);
            this.mMessage.setVisibility(0);
            this.mMessage.setText(getMessageTitleResId(item));
            return;
        }
        this.mNegativeButton.setVisibility(0);
        TextView textView = this.mPositiveButton;
        if (item.isOutgoing) {
            i = 8;
        }
        textView.setVisibility(i);
        this.mMessage.setVisibility(8);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        if (v == this.itemView) {
            if (this.mUserListener != null) {
                this.mUserListener.f(getItem());
            }
        } else if (v == this.mPositiveButton) {
            if (this.mAcceptListener != null) {
                this.mAcceptListener.f(getItem(), Boolean.TRUE, getAdapterPosition());
            }
        } else if (v == this.mNegativeButton && this.mAcceptListener != null) {
            this.mAcceptListener.f(getItem(), Boolean.valueOf(getItem().isOutgoing), getAdapterPosition());
        }
    }

    private static int getMessageTitleResId(RequestUserProfile item) {
        if (item.isOutgoing) {
            return R.string.friend_request_canceled;
        }
        return item.isSuggesting ? item.sent.booleanValue() ? R.string.friend_req_sent : R.string.friend_suggest_declined : item.sent.booleanValue() ? R.string.friend_req_accepted : R.string.friend_req_declined;
    }
}
