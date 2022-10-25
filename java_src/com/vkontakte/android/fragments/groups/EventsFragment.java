package com.vkontakte.android.fragments.groups;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.View;
import android.view.ViewGroup;
import com.vkontakte.android.R;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.Groups;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.fragments.base.SegmenterFragment;
import com.vkontakte.android.functions.VoidF1;
import com.vkontakte.android.ui.holder.GroupHolder;
import com.vkontakte.android.ui.util.SectionSegmenter;
import com.vkontakte.android.ui.util.Segmenter;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes2.dex */
public class EventsFragment extends SegmenterFragment<Group> {
    public static final String USER_ID = "user_id";
    private SectionSegmenter mData = new SectionSegmenter();
    private VoidF1<Group> mSelectionListener;
    private int mUserId;

    public static EventsFragment newInstance(int userId) {
        EventsFragment fragment = new EventsFragment();
        Bundle args = new Bundle();
        args.putInt("user_id", userId);
        fragment.setArguments(args);
        return fragment;
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.mUserId = getArguments().getInt("user_id");
        setRefreshEnabled(VKAccountManager.isCurrentUser(this.mUserId));
    }

    @Override // com.vkontakte.android.fragments.base.SegmenterFragment, com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        updateList();
        if (this.loaded) {
            dataLoaded();
        }
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, android.support.v4.widget.SwipeRefreshLayout.OnRefreshListener
    public void onRefresh() {
        Groups.reload(true);
    }

    @Override // com.vkontakte.android.fragments.base.SegmenterFragment
    protected SegmenterFragment<Group>.GridAdapter<Group, ?> createAdapter() {
        return new Adapter();
    }

    @Override // com.vkontakte.android.fragments.base.SegmenterFragment
    protected int getColumnsCount() {
        return this.isTablet ? 2 : 1;
    }

    public void setData(ArrayList<Group> data, boolean isTablet) {
        this.data.clear();
        this.data.addAll(data);
        List<Group> mUpcomingEvents = new ArrayList<>();
        List<Group> mPastEvents = new ArrayList<>();
        int now = TimeUtils.getCurrentTime();
        for (int i = 0; i < data.size(); i++) {
            Group event = data.get(i);
            if (event.startTime > now) {
                mUpcomingEvents.add(event);
            } else {
                mPastEvents.add(event);
            }
        }
        this.mData.clear();
        if (!mUpcomingEvents.isEmpty()) {
            this.mData.addSection(mUpcomingEvents, VKApplication.context.getString(R.string.groups_upcoming_events));
        }
        if (!mPastEvents.isEmpty()) {
            List<Group> mPastEvents2 = new ArrayList<>(mPastEvents.size());
            for (int i2 = mPastEvents.size() - 1; i2 >= 0; i2--) {
                mPastEvents2.add(mPastEvents.get(i2));
            }
            this.mData.addSection(mPastEvents2, VKApplication.context.getString(R.string.groups_past_events));
        }
        mo1066getAdapter().setData(this.mData);
        this.loaded = true;
        if (this.list != null) {
            updateList();
            dataLoaded();
            refreshDone();
        }
    }

    @Override // com.vkontakte.android.fragments.base.SegmenterFragment
    protected Segmenter getSegmenter() {
        return this.mData;
    }

    public EventsFragment setSelectionListener(@Nullable VoidF1<Group> l) {
        this.mSelectionListener = l;
        return this;
    }

    public void openGroupDetails(Group group) {
        new ProfileFragment.Builder(-group.id).go(getActivity());
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class Adapter extends SegmenterFragment<Group>.GridAdapter<Group, GroupHolder> {
        private VoidF1<Group> mClickListener;

        private Adapter() {
            super();
            this.mClickListener = EventsFragment$Adapter$$Lambda$1.lambdaFactory$(this);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$new$0(Group group) {
            if (EventsFragment.this.mSelectionListener != null) {
                EventsFragment.this.mSelectionListener.f(group);
            } else {
                EventsFragment.this.openGroupDetails(group);
            }
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.vkontakte.android.fragments.base.SegmenterFragment.GridAdapter
        /* renamed from: createViewHolder */
        public GroupHolder mo1074createViewHolder(ViewGroup parent) {
            return new GroupHolder(parent).onClick(this.mClickListener);
        }

        @Override // com.vkontakte.android.fragments.base.SegmenterFragment.GridAdapter
        public int getImagesCountForItem(int position) {
            return 1;
        }

        @Override // com.vkontakte.android.fragments.base.SegmenterFragment.GridAdapter
        public String getImageUrl(int position, int image) {
            return getItem(position).photo;
        }
    }
}
