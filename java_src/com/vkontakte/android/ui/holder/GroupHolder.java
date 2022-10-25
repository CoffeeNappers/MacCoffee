package com.vkontakte.android.ui.holder;

import android.support.annotation.Nullable;
import android.text.SpannableStringBuilder;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.R;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.functions.VoidF1;
import com.vkontakte.android.ui.drawables.CenteredImageSpan;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;
import java.util.Locale;
/* loaded from: classes3.dex */
public class GroupHolder extends RecyclerHolder<Group> implements View.OnClickListener {
    private static final DecimalFormat sFormatter = (DecimalFormat) NumberFormat.getInstance(Locale.US);
    private VKImageView mImage;
    @Nullable
    private TextView mInfo;
    @Nullable
    private VoidF1<Group> mListener;
    private TextView mSubtitle;
    private TextView mTitle;

    static {
        DecimalFormatSymbols symbols = sFormatter.getDecimalFormatSymbols();
        symbols.setGroupingSeparator(' ');
        sFormatter.setDecimalFormatSymbols(symbols);
    }

    public GroupHolder(ViewGroup parent) {
        super((int) R.layout.group_item, parent.getContext());
        this.mTitle = (TextView) $(R.id.title);
        this.mSubtitle = (TextView) $(R.id.subtitle);
        this.mInfo = (TextView) $(R.id.info);
        this.mImage = (VKImageView) $(R.id.photo);
        this.mImage.setPlaceholderImage(R.drawable.group_placeholder);
        this.itemView.setOnClickListener(this);
    }

    public GroupHolder onClick(VoidF1<Group> listener) {
        this.mListener = listener;
        return this;
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(Group group) {
        if (group.stringMembersCount == null) {
            group.stringMembersCount = getQuantityString(R.plurals.groups_followers, group.members_count, sFormatter.format(group.members_count));
        }
        this.mImage.load(group.photo);
        this.mTitle.setText(group.name);
        this.mSubtitle.setText(group.activity);
        if (this.mInfo != null) {
            this.mInfo.setText(group.stringMembersCount);
        }
        if (group.verified) {
            SpannableStringBuilder title = (SpannableStringBuilder) group.getTag();
            if (title == null) {
                title = new SpannableStringBuilder(group.name);
                title.append((char) 160);
                title.append((char) 160);
                title.setSpan(new CenteredImageSpan(getContext(), R.drawable.ic_verified), title.length() - 1, title.length(), 0);
            }
            group.setTag(title);
            this.mTitle.setText(title);
            return;
        }
        this.mTitle.setText(group.name);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        if (this.mListener != null) {
            this.mListener.f(getItem());
        }
    }
}
