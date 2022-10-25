package com.vkontakte.android.ui.holder;

import android.support.annotation.CallSuper;
import android.support.annotation.LayoutRes;
import android.support.annotation.Nullable;
import android.text.SpannableStringBuilder;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CompoundButton;
import android.widget.ImageView;
import android.widget.TextView;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.functions.VoidF1;
import com.vkontakte.android.functions.VoidF1Bool;
import com.vkontakte.android.ui.drawables.CenteredImageSpan;
/* loaded from: classes.dex */
public class UserHolder<T extends UserProfile> extends RecyclerHolder<T> implements View.OnClickListener, CompoundButton.OnCheckedChangeListener {
    @Nullable
    protected final View mActionButton;
    @Nullable
    protected VoidF1<UserProfile> mActionListener;
    @Nullable
    protected final CompoundButton mCheckButton;
    @Nullable
    protected VoidF1Bool<UserProfile> mCheckListener;
    protected final int mConfig;
    public final VKImageView mImage;
    @Nullable
    private VoidF1<UserProfile> mListener;
    protected final ImageView mOnline;
    @Nullable
    protected final TextView mSubtitle;
    protected final TextView mTitle;

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    @CallSuper
    public /* bridge */ /* synthetic */ void onBind(Object obj) {
        onBind((UserHolder<T>) ((UserProfile) obj));
    }

    public static <T extends UserProfile> UserHolder<T> actionable(ViewGroup parent, @LayoutRes int layout) {
        return new UserHolder<>(parent, layout, false, false, true);
    }

    public static <T extends UserProfile> UserHolder<T> checkable(ViewGroup parent, @LayoutRes int layout) {
        return new UserHolder<>(parent, layout, false, true, false);
    }

    public static <T extends UserProfile> UserHolder<T> simple(ViewGroup parent, @LayoutRes int layout) {
        return new UserHolder<>(parent, layout, false, false, false);
    }

    public static <T extends UserProfile> UserHolder<T> actionable(ViewGroup parent) {
        return actionable(parent, R.layout.user_item_removable);
    }

    public static <T extends UserProfile> UserHolder<T> checkable(ViewGroup parent) {
        return checkable(parent, R.layout.user_item_checkable);
    }

    public static <T extends UserProfile> UserHolder<T> simple(ViewGroup parent) {
        return simple(parent, R.layout.user_item);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public UserHolder(ViewGroup parent, @LayoutRes int layout, boolean subtitle, boolean check, boolean action) {
        super(layout, parent.getContext());
        this.mTitle = (TextView) $(R.id.title);
        this.mImage = (VKImageView) $(R.id.photo);
        this.mOnline = (ImageView) $(R.id.online);
        this.mSubtitle = subtitle ? (TextView) $(R.id.subtitle) : null;
        if (action) {
            this.mActionButton = $(R.id.action);
            if (this.mActionButton != null) {
                this.mActionButton.setOnClickListener(this);
            }
        } else {
            this.mActionButton = null;
        }
        if (check) {
            this.mCheckButton = (CompoundButton) $(R.id.check);
            if (this.mCheckButton != null) {
                this.mCheckButton.setOnCheckedChangeListener(this);
            }
        } else {
            this.mCheckButton = null;
        }
        this.itemView.setOnClickListener(this);
        if (this.mOnline != null) {
            Object tag = this.mOnline.getTag();
            if (tag instanceof String) {
                this.mConfig = Integer.parseInt((String) tag);
                return;
            } else {
                this.mConfig = 0;
                return;
            }
        }
        this.mConfig = 0;
    }

    @Deprecated
    protected UserHolder(ViewGroup parent, @LayoutRes int layout) {
        super(layout, parent.getContext());
        this.mTitle = (TextView) $(R.id.title);
        this.mSubtitle = (TextView) $(R.id.subtitle);
        this.mImage = (VKImageView) $(R.id.photo);
        this.mOnline = (ImageView) $(R.id.online);
        this.mActionButton = $(R.id.action);
        if (this.mActionButton != null) {
            this.mActionButton.setOnClickListener(this);
        }
        this.mCheckButton = (CompoundButton) $(R.id.check);
        if (this.mCheckButton != null) {
            this.mCheckButton.setOnCheckedChangeListener(this);
        }
        this.itemView.setOnClickListener(this);
        if (this.mOnline != null) {
            Object tag = this.mOnline.getTag();
            if (tag instanceof String) {
                this.mConfig = Integer.parseInt((String) tag);
                return;
            } else {
                this.mConfig = 0;
                return;
            }
        }
        this.mConfig = 0;
    }

    public UserHolder<T> onClick(VoidF1<UserProfile> listener) {
        this.mListener = listener;
        return this;
    }

    @CallSuper
    public void onBind(T user) {
        if (user.verified) {
            SpannableStringBuilder title = (SpannableStringBuilder) user.getTag();
            if (title == null) {
                title = new SpannableStringBuilder(user.fullName);
                title.append((char) 160);
                title.append((char) 160);
                title.append((char) 160);
                title.setSpan(new CenteredImageSpan(getContext(), R.drawable.ic_verified), title.length() - 1, title.length(), 0);
            }
            user.setTag(title);
            this.mTitle.setText(title);
        } else {
            this.mTitle.setText(user.fullName);
        }
        updateOnlineImage(this.mOnline, user, this.mConfig);
        if (this.mCheckButton != null) {
            this.mCheckButton.setChecked(user.isSelected);
        }
        this.mImage.load(user.photo);
    }

    public static void updateOnlineImage(@Nullable ImageView imageView, @Nullable UserProfile user, int imageDpSize) {
        if (imageView != null && user != null) {
            if (user.online == 0 || user.uid < (-2000000000) || user.uid >= 2000000000) {
                imageView.setVisibility(8);
                return;
            }
            imageView.setVisibility(0);
            switch (imageDpSize) {
                case 48:
                    imageView.setImageResource(user.online == 1 ? R.drawable.ic_online_overlay_for_48dp : R.drawable.ic_online_overlay_mobile_for_48dp);
                    return;
                case 64:
                    imageView.setImageResource(user.online == 1 ? R.drawable.ic_online_overlay_for_64dp : R.drawable.ic_online_overlay_mobile_for_64dp);
                    return;
                case 128:
                    imageView.setImageResource(user.online == 1 ? R.drawable.ic_online_overlay_for_128dp : R.drawable.ic_online_overlay_mobile_for_128dp);
                    return;
                default:
                    return;
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // android.widget.CompoundButton.OnCheckedChangeListener
    public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
        if (((UserProfile) getItem()).isSelected != isChecked) {
            ((UserProfile) getItem()).isSelected = isChecked;
            if (this.mCheckListener != null) {
                this.mCheckListener.f(getItem(), isChecked);
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public void onClick(View view) {
        if (view == this.itemView) {
            if (this.mCheckButton != null) {
                this.mCheckButton.toggle();
            } else if (this.mListener != null) {
                this.mListener.f(getItem());
            }
        } else if (this.mActionButton != null && view == this.mActionButton && this.mActionListener != null) {
            this.mActionListener.f(getItem());
        }
    }

    public UserHolder<T> onAction(VoidF1<UserProfile> listener) {
        this.mActionListener = listener;
        return this;
    }

    public UserHolder<T> onCheck(VoidF1Bool<UserProfile> listener) {
        this.mCheckListener = listener;
        return this;
    }
}
