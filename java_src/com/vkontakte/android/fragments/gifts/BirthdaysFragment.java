package com.vkontakte.android.fragments.gifts;

import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.cache.Cache;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.fragments.base.SegmenterFragment;
import com.vkontakte.android.functions.VoidF1;
import com.vkontakte.android.ui.drawable.RecoloredDrawable;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.holder.UserHolder;
import com.vkontakte.android.ui.recyclerview.BottomDividerDecoration;
import com.vkontakte.android.ui.recyclerview.CardItemDecoration;
import com.vkontakte.android.ui.util.SectionSegmenter;
import com.vkontakte.android.ui.util.Segmenter;
import java.util.List;
import me.grishka.appkit.utils.V;
/* loaded from: classes2.dex */
public class BirthdaysFragment extends SegmenterFragment<Cache.BirthdayEntry> implements VoidF1<UserProfile> {
    boolean mActive;
    List<Cache.BirthdayEntry> mTodayBirthdays;
    List<Cache.BirthdayEntry> mTomorrowBirthdays;
    List<Cache.BirthdayEntry> mUpcomingBirthdays;
    final BottomDividerDecoration mBottomDividerDecoration = new BottomDividerDecoration(mo1066getAdapter(), Math.max(1, V.dp(0.5f)), 251658240, V.dp(8.0f));
    final VoidF1<UserProfile> mSendGiftCallback = BirthdaysFragment$$Lambda$1.lambdaFactory$(this);
    final SectionSegmenter mData = new SectionSegmenter();

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setRefreshEnabled(false);
    }

    @Override // com.vkontakte.android.fragments.base.SegmenterFragment, com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        setTitle(R.string.birthdays_title);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.fragments.base.SegmenterFragment
    public CardItemDecoration onCreateCardDecorator() {
        CardItemDecoration cardItemDecoration = super.onCreateCardDecorator();
        this.list.addItemDecoration(this.mBottomDividerDecoration.setPadding(this.margin, this.margin));
        return cardItemDecoration;
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onStart() {
        super.onStart();
        this.mActive = true;
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onStop() {
        super.onStop();
        this.mActive = false;
    }

    @Override // com.vkontakte.android.fragments.base.SegmenterFragment
    protected Segmenter getSegmenter() {
        return this.mData;
    }

    @Override // com.vkontakte.android.fragments.base.SegmenterFragment
    protected SegmenterFragment<Cache.BirthdayEntry>.GridAdapter<Cache.BirthdayEntry, ?> createAdapter() {
        return new SegmenterFragment<Cache.BirthdayEntry>.GridAdapter<Cache.BirthdayEntry, RecyclerHolder<Cache.BirthdayEntry>>() { // from class: com.vkontakte.android.fragments.gifts.BirthdaysFragment.1
            @Override // com.vkontakte.android.fragments.base.SegmenterFragment.GridAdapter
            /* renamed from: createViewHolder */
            public RecyclerHolder<Cache.BirthdayEntry> mo1074createViewHolder(ViewGroup parent) {
                return new Holder(parent).onClick(BirthdaysFragment.this).onAction(BirthdaysFragment.this.mSendGiftCallback);
            }

            @Override // com.vkontakte.android.fragments.base.SegmenterFragment.GridAdapter
            public String getImageUrl(int position, int image) {
                return ((UserProfile) BirthdaysFragment.this.getSegmenter().getItem(position)).photo;
            }

            @Override // com.vkontakte.android.fragments.base.SegmenterFragment.GridAdapter
            public int getImagesCountForItem(int position) {
                return 1;
            }
        };
    }

    @Override // com.vkontakte.android.fragments.base.SegmenterFragment
    protected int getColumnsCount() {
        return this.isTablet ? 2 : 1;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vkontakte.android.fragments.gifts.BirthdaysFragment$2  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass2 extends Thread {
        AnonymousClass2() {
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            BirthdaysFragment.this.mTodayBirthdays = Cache.getTodayBirthdays();
            BirthdaysFragment.this.mTomorrowBirthdays = Cache.getTomorrowBirthdays();
            BirthdaysFragment.this.mUpcomingBirthdays = Cache.getUpcomingBirthdays();
            if (BirthdaysFragment.this.mTodayBirthdays != null && !BirthdaysFragment.this.mTodayBirthdays.isEmpty()) {
                BirthdaysFragment.this.mData.addSection(BirthdaysFragment.this.mTodayBirthdays, VKApplication.context.getString(R.string.today_cap));
            }
            if (BirthdaysFragment.this.mTomorrowBirthdays != null && !BirthdaysFragment.this.mTomorrowBirthdays.isEmpty()) {
                BirthdaysFragment.this.mData.addSection(BirthdaysFragment.this.mTomorrowBirthdays, VKApplication.context.getString(R.string.tomorrow_cap));
            }
            if (BirthdaysFragment.this.mUpcomingBirthdays != null && !BirthdaysFragment.this.mUpcomingBirthdays.isEmpty()) {
                BirthdaysFragment.this.mData.addSection(BirthdaysFragment.this.mUpcomingBirthdays, VKApplication.context.getString(R.string.upcoming_birthdays));
            }
            if (BirthdaysFragment.this.mActive) {
                BirthdaysFragment.this.getActivity().runOnUiThread(BirthdaysFragment$2$$Lambda$1.lambdaFactory$(this));
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$run$0() {
            BirthdaysFragment.this.loaded = true;
            BirthdaysFragment.this.dataLoaded();
            BirthdaysFragment.this.updateList();
        }
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        new AnonymousClass2().start();
    }

    @Override // com.vkontakte.android.fragments.base.SegmenterFragment, me.grishka.appkit.fragments.ContainerFragment, android.app.DialogFragment, android.app.Fragment
    public void onActivityCreated(Bundle state) {
        super.onActivityCreated(state);
        if (!this.loaded) {
            loadData();
        }
    }

    @Override // com.vkontakte.android.functions.VoidF1
    public void f(UserProfile profile) {
        if (profile != null) {
            openProfile(profile.uid);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void showGiftsCatalog(UserProfile user) {
        GiftsCatalogFragment.start(getActivity(), user);
    }

    void openProfile(int user_id) {
        new ProfileFragment.Builder(user_id).go(getActivity());
    }

    /* loaded from: classes2.dex */
    private class Holder extends UserHolder<Cache.BirthdayEntry> {
        private final TextView mInfo;

        protected Holder(ViewGroup parent) {
            super(parent, R.layout.user_item_birthday, true, false, true);
            this.mInfo = (TextView) $(R.id.info);
            if (this.mActionButton instanceof TextView) {
                ((TextView) this.mActionButton).setCompoundDrawablesWithIntrinsicBounds(new RecoloredDrawable(getResources().getDrawable(R.drawable.ic_ab_gift), -11435592), (Drawable) null, (Drawable) null, (Drawable) null);
            } else if (this.mActionButton instanceof ImageView) {
                ((ImageView) this.mActionButton).setImageDrawable(new RecoloredDrawable(getResources().getDrawable(R.drawable.ic_ab_gift), -11435592));
            }
        }

        @Override // com.vkontakte.android.ui.holder.UserHolder, com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(Cache.BirthdayEntry user) {
            int i = 0;
            super.onBind((Holder) user);
            if (this.mInfo != null) {
                this.mSubtitle.setText(user.date);
                this.mInfo.setText(user.upcoming);
                this.mInfo.setVisibility(TextUtils.isEmpty(user.upcoming) ? 8 : 0);
            } else {
                this.mSubtitle.setText(user.subtitle);
            }
            View view = this.mActionButton;
            if (!user.isToday) {
                i = 8;
            }
            view.setVisibility(i);
        }
    }
}
