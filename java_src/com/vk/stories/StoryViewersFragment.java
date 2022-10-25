package com.vk.stories;

import android.app.Activity;
import android.content.Context;
import android.graphics.BitmapFactory;
import android.graphics.PorterDuff;
import android.graphics.drawable.BitmapDrawable;
import android.os.Bundle;
import android.support.v4.content.ContextCompat;
import android.support.v7.widget.Toolbar;
import android.view.View;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vk.stories.model.StoryEntry;
import com.vk.stories.util.StoriesUtil;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.stories.StoriesGetViewers;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.fragments.AbsUserListFragment;
import com.vkontakte.android.navigation.Navigator;
import me.grishka.appkit.api.PaginatedList;
/* loaded from: classes2.dex */
public class StoryViewersFragment extends AbsUserListFragment {
    private static final String ARGS_STORY_OWNER_ID = "owner_id";
    private static final String ARGS_STORY_VIEWS_COUNT = "views_count";
    private int ownerId;
    private int storyId;
    private int viewersCount;

    /* loaded from: classes2.dex */
    public static class Builder extends Navigator {
        public Builder() {
            super(StoryViewersFragment.class);
            this.args.putInt("theme", R.style.WhiteTheme);
        }

        public Builder setStory(StoryEntry storyEntry) {
            this.args.putInt("owner_id", storyEntry.ownerId);
            this.args.putInt("id", storyEntry.id);
            this.args.putInt("views_count", storyEntry.viewsCount);
            return this;
        }
    }

    @Override // com.vkontakte.android.fragments.AbsUserListFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity act) {
        super.onAttach(act);
        if (getArguments() != null) {
            this.ownerId = getArguments().getInt("owner_id");
            this.storyId = getArguments().getInt("id");
            this.viewersCount = getArguments().getInt("views_count");
        }
        setTitleCount(this.viewersCount);
        setEmptyText(R.string.story_no_viewers);
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment, com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        Toolbar toolbar = getToolbar();
        if (toolbar != null) {
            toolbar.setNavigationIcon(new BitmapDrawable(getResources(), BitmapFactory.decodeResource(getResources(), R.drawable.ic_ab_clear)));
            toolbar.getNavigationIcon().setColorFilter(ContextCompat.getColor(toolbar.getContext(), R.color.picker_dark_icon), PorterDuff.Mode.MULTIPLY);
            toolbar.setNavigationOnClickListener(new View.OnClickListener() { // from class: com.vk.stories.StoryViewersFragment.1
                @Override // android.view.View.OnClickListener
                public void onClick(View view2) {
                    if (StoryViewersFragment.this.getActivity() != null) {
                        StoryViewersFragment.this.getActivity().finish();
                    }
                }
            });
        }
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        this.currentRequest = new StoriesGetViewers(this.ownerId, this.storyId, offset, count).setCallback(new SimpleCallback<VKList<UserProfile>>() { // from class: com.vk.stories.StoryViewersFragment.2
            @Override // com.vkontakte.android.api.Callback
            public void success(VKList<UserProfile> result) {
                if (result != null) {
                    StoryViewersFragment.this.setTitleCount(result.total());
                }
                StoryViewersFragment.this.onDataLoaded((PaginatedList) result);
            }
        }).exec((Context) getActivity());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setTitleCount(int count) {
        String title;
        try {
            if (count > 1000) {
                title = StoriesUtil.getCounterText(count) + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + getActivity().getResources().getQuantityString(R.plurals.views_counted, 10);
            } else {
                title = StoriesUtil.getCounterText(count) + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + getActivity().getResources().getQuantityString(R.plurals.views_counted, count);
            }
            setTitle(title);
        } catch (Exception e) {
        }
    }
}
