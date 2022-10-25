package com.vkontakte.android.ui.holder;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.SpannableStringBuilder;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.R;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.api.GroupInvitation;
import com.vkontakte.android.functions.VoidF1;
import com.vkontakte.android.functions.VoidF2Int;
import com.vkontakte.android.ui.drawables.CenteredImageSpan;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;
import java.util.Locale;
/* loaded from: classes3.dex */
public class GroupInvitationHolder extends RecyclerHolder<GroupInvitation> implements View.OnClickListener {
    private static final DecimalFormat sFormatter = (DecimalFormat) NumberFormat.getInstance(Locale.US);
    @Nullable
    private VoidF2Int<GroupInvitation, Boolean> mAcceptListener;
    @Nullable
    private VoidF1<Group> mGroupListener;
    private final TextView mInfo;
    private final TextView mMessage;
    private final TextView mNegativeButton;
    private final VKImageView mPhoto;
    private final TextView mPositiveButton;
    private final TextView mSubtitle;
    private final TextView mTitle;

    static {
        DecimalFormatSymbols symbols = sFormatter.getDecimalFormatSymbols();
        symbols.setGroupingSeparator(' ');
        sFormatter.setDecimalFormatSymbols(symbols);
    }

    public GroupInvitationHolder(@NonNull ViewGroup parent) {
        super((int) R.layout.groups_invite_item, parent);
        this.mTitle = (TextView) $(R.id.title);
        this.mSubtitle = (TextView) $(R.id.subtitle);
        this.mInfo = (TextView) $(R.id.info);
        this.mPhoto = (VKImageView) $(R.id.photo);
        this.mPositiveButton = (TextView) $(R.id.positive);
        this.mNegativeButton = (TextView) $(R.id.negative);
        this.mMessage = (TextView) $(R.id.message);
        this.mPositiveButton.setOnClickListener(this);
        this.mNegativeButton.setOnClickListener(this);
        this.mPhoto.setPlaceholderImage(R.drawable.group_placeholder);
        this.itemView.setOnClickListener(this);
    }

    public GroupInvitationHolder attach(@Nullable VoidF1<Group> groupClickListener, @Nullable VoidF2Int<GroupInvitation, Boolean> acceptListener) {
        this.mGroupListener = groupClickListener;
        this.mAcceptListener = acceptListener;
        return this;
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(GroupInvitation item) {
        if (item.group.stringMembersCount == null) {
            item.group.stringMembersCount = getQuantityString(R.plurals.groups_followers, item.group.members_count, sFormatter.format(item.group.members_count));
        }
        this.mPhoto.load(item.group.photo);
        this.mTitle.setText(item.group.name);
        this.mSubtitle.setText(item.group.stringMembersCount);
        this.mInfo.setText(getString(item.inviter.f ? R.string.invited_by_f : R.string.invited_by_m, item.inviter.fullName));
        this.mPositiveButton.setText(item.group.type == 1 ? R.string.group_inv_event_positive : R.string.group_inv_accept);
        if (item.group.verified) {
            SpannableStringBuilder title = (SpannableStringBuilder) item.getTag();
            if (title == null) {
                title = new SpannableStringBuilder(item.group.name);
                title.append((char) 160);
                title.append((char) 160);
                title.setSpan(new CenteredImageSpan(getContext(), R.drawable.ic_verified), title.length() - 1, title.length(), 0);
            }
            item.setTag(title);
            this.mTitle.setText(title);
        } else {
            this.mTitle.setText(item.group.name);
        }
        if (item.sent != null) {
            this.mPositiveButton.setVisibility(8);
            this.mNegativeButton.setVisibility(8);
            this.mMessage.setVisibility(0);
            this.mMessage.setText(item.sent.booleanValue() ? R.string.friend_req_accepted : R.string.friend_req_declined);
            return;
        }
        this.mPositiveButton.setVisibility(0);
        this.mNegativeButton.setVisibility(0);
        this.mMessage.setVisibility(8);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        if (v == this.itemView) {
            if (this.mGroupListener != null) {
                this.mGroupListener.f(getItem().group);
            }
        } else if (v == this.mPositiveButton) {
            if (this.mAcceptListener != null) {
                this.mAcceptListener.f(getItem(), Boolean.TRUE, getAdapterPosition());
            }
        } else if (v == this.mNegativeButton && this.mAcceptListener != null) {
            this.mAcceptListener.f(getItem(), Boolean.FALSE, getAdapterPosition());
        }
    }
}
