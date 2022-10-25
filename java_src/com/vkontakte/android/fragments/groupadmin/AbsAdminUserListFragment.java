package com.vkontakte.android.fragments.groupadmin;

import android.support.annotation.LayoutRes;
import android.view.View;
import android.view.ViewGroup;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.fragments.AbsUserListFragment;
import com.vkontakte.android.functions.VoidF2;
import com.vkontakte.android.ui.holder.UserHolder;
import com.vkontakte.android.ui.recyclerview.CardItemDecoration;
import me.grishka.appkit.utils.V;
/* loaded from: classes2.dex */
public abstract class AbsAdminUserListFragment extends AbsUserListFragment {
    VoidF2<View, UserProfile> mAction = AbsAdminUserListFragment$$Lambda$1.lambdaFactory$(this);

    public void onItemButtonClick(View button, UserProfile user) {
    }

    @Override // com.vkontakte.android.fragments.AbsUserListFragment, com.vkontakte.android.fragments.base.GridFragment
    protected int getColumnsCount() {
        return 1;
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment
    protected CardItemDecoration onCreateCardDecorator() {
        int padding;
        CardItemDecoration decorator = new CardItemDecoration(null, !this.isTablet);
        if (this.scrW >= 1024) {
            padding = V.dp(12.0f);
        } else {
            padding = 0;
        }
        int paddingTop = V.dp(8.0f) + padding;
        int margin = this.scrW >= 924 ? V.dp(Math.min(32, ((this.scrW - 840) - 84) / 2)) : 0;
        this.list.setPadding(margin + padding, paddingTop, margin + padding, padding);
        decorator.setPadding(padding, paddingTop, padding, padding);
        return decorator;
    }

    /* loaded from: classes2.dex */
    protected static abstract class Holder<T extends UserProfile> extends UserHolder<T> {
        private final AbsAdminUserListFragment mFragment;

        /* JADX WARN: Multi-variable type inference failed */
        @Override // com.vkontakte.android.ui.holder.UserHolder, com.vkontakte.android.ui.holder.RecyclerHolder
        public /* bridge */ /* synthetic */ void onBind(Object obj) {
            onBind((Holder<T>) ((UserProfile) obj));
        }

        /* JADX INFO: Access modifiers changed from: protected */
        public Holder(AbsAdminUserListFragment fragment, ViewGroup parent, @LayoutRes int layout) {
            super(parent, layout, true, false, true);
            this.mFragment = fragment;
        }

        @Override // com.vkontakte.android.ui.holder.UserHolder
        public void onBind(T user) {
            super.onBind((Holder<T>) user);
            this.mSubtitle.setText(user.university);
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // com.vkontakte.android.ui.holder.UserHolder, android.view.View.OnClickListener
        public void onClick(View view) {
            super.onClick(view);
            if (view == this.mActionButton && this.mFragment.mAction != null) {
                this.mFragment.mAction.f(view, getItem());
            }
        }
    }
}
