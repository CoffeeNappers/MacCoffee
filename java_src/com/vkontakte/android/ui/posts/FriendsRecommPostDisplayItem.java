package com.vkontakte.android.ui.posts;

import android.content.Context;
import android.graphics.Rect;
import android.os.Bundle;
import android.os.Looper;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.R;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.execute.SetSubscriptionStatus;
import com.vkontakte.android.api.friends.FriendsGetRecommendations;
import com.vkontakte.android.api.friends.FriendsHideSuggestion;
import com.vkontakte.android.attachments.FriendsRecommAttachment;
import com.vkontakte.android.cache.NewsfeedCache;
import com.vkontakte.android.data.Analytics;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKFromList;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.fragments.friends.FriendsImportFragment;
import com.vkontakte.android.navigation.Navigate;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.util.List;
import me.grishka.appkit.utils.Preloader;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class FriendsRecommPostDisplayItem extends PostDisplayItem {
    public FriendsRecommAttachment att;
    public int listPosition;
    private int position;
    private int positionOffset;
    private NewsEntry post;

    public FriendsRecommPostDisplayItem(FriendsRecommAttachment att, NewsEntry post, int listPosition) {
        super(post);
        this.att = att;
        this.post = post;
        this.listPosition = listPosition;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public int getType() {
        return 13;
    }

    public static View createView(Context context) {
        View v = View.inflate(context, R.layout.post_friends_recomm, null);
        UsableRecyclerView r = (UsableRecyclerView) v.findViewById(R.id.recom_friends_list);
        r.setLayoutManager(new LinearLayoutManager(context, 0, false));
        r.addItemDecoration(new RecyclerView.ItemDecoration() { // from class: com.vkontakte.android.ui.posts.FriendsRecommPostDisplayItem.1
            @Override // android.support.v7.widget.RecyclerView.ItemDecoration
            public void getItemOffsets(Rect outRect, View view, RecyclerView parent, RecyclerView.State state) {
                if (parent.getChildAdapterPosition(view) < parent.mo1204getAdapter().getItemCount() - 1) {
                    outRect.right = V.dp(8.0f);
                }
            }
        });
        r.setSelector(R.drawable.highlight_post);
        r.setDrawSelectorOnTop(true);
        v.findViewById(R.id.recom_friends_btn).setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.ui.posts.FriendsRecommPostDisplayItem.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v2) {
                Bundle args = new Bundle();
                Navigate.to(FriendsImportFragment.class, args, v2.getContext());
            }
        });
        return v;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public void onBindView(View view) {
        final UsableRecyclerView r = (UsableRecyclerView) view.findViewById(R.id.recom_friends_list);
        final FriendsRecommAdapter adapter = new FriendsRecommAdapter(this.att.profiles);
        r.setAdapter(adapter);
        r.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() { // from class: com.vkontakte.android.ui.posts.FriendsRecommPostDisplayItem.3
            @Override // android.view.View.OnAttachStateChangeListener
            public void onViewAttachedToWindow(View v) {
                ((LinearLayoutManager) r.getLayoutManager()).scrollToPositionWithOffset(FriendsRecommPostDisplayItem.this.position, FriendsRecommPostDisplayItem.this.positionOffset);
                r.setListener(adapter);
            }

            @Override // android.view.View.OnAttachStateChangeListener
            public void onViewDetachedFromWindow(View v) {
                int i = 0;
                FriendsRecommPostDisplayItem.this.position = r.getChildCount() > 0 ? r.getChildAdapterPosition(r.getChildAt(0)) : 0;
                FriendsRecommPostDisplayItem friendsRecommPostDisplayItem = FriendsRecommPostDisplayItem.this;
                if (r.getChildCount() > 0) {
                    i = r.getChildAt(0).getLeft();
                }
                friendsRecommPostDisplayItem.positionOffset = i;
                r.removeOnAttachStateChangeListener(this);
            }
        });
        Analytics.track("view_block").collapse().unique().addParam("blocks", "friends_recomm|" + this.listPosition + "|" + this.post.time).commit();
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public int getImageCount() {
        return 0;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public String getImageURL(int image) {
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class FriendsRecommViewHolder extends RecyclerHolder<UserProfile> implements UsableRecyclerView.Clickable {
        private ImageView button;
        private ImageView hide;
        private TextView name;
        private UsableRecyclerView parent;
        private VKImageView photo;
        private ProgressBar progress;
        private TextView subtitle;

        public FriendsRecommViewHolder(Context context, ViewGroup parent) {
            super(context, R.layout.friends_recomm_item, parent);
            this.name = (TextView) this.itemView.findViewById(R.id.name);
            this.subtitle = (TextView) this.itemView.findViewById(R.id.subtitle);
            this.photo = (VKImageView) this.itemView.findViewById(R.id.photo);
            this.button = (ImageView) this.itemView.findViewById(R.id.button);
            this.hide = (ImageView) this.itemView.findViewById(R.id.button_hide);
            this.progress = (ProgressBar) this.itemView.findViewById(R.id.progress);
            this.parent = (UsableRecyclerView) parent;
            this.button.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.ui.posts.FriendsRecommPostDisplayItem.FriendsRecommViewHolder.1
                @Override // android.view.View.OnClickListener
                public void onClick(View v) {
                    final boolean needSubscribe;
                    if (((UserProfile) FriendsRecommViewHolder.this.item).online != 2 && ((UserProfile) FriendsRecommViewHolder.this.item).online != -2) {
                        if (((UserProfile) FriendsRecommViewHolder.this.item).online == 0) {
                            ((UserProfile) FriendsRecommViewHolder.this.item).online = 2;
                            FriendsRecommViewHolder.this.bind(FriendsRecommViewHolder.this.item);
                            needSubscribe = true;
                        } else {
                            ((UserProfile) FriendsRecommViewHolder.this.item).online = -2;
                            FriendsRecommViewHolder.this.bind(FriendsRecommViewHolder.this.item);
                            needSubscribe = false;
                        }
                        SetSubscriptionStatus.createSetSubscriptionStatusAndSendAllStats(((UserProfile) FriendsRecommViewHolder.this.item).uid, needSubscribe).setCallback(new SimpleCallback<Integer>(v.getContext()) { // from class: com.vkontakte.android.ui.posts.FriendsRecommPostDisplayItem.FriendsRecommViewHolder.1.1
                            @Override // com.vkontakte.android.api.Callback
                            public void success(Integer result) {
                                ((UserProfile) FriendsRecommViewHolder.this.item).online = needSubscribe ? 1 : 0;
                                FriendsRecommViewHolder.this.bind(FriendsRecommViewHolder.this.item);
                                NewsfeedCache.replaceOne(FriendsRecommPostDisplayItem.this.post);
                            }

                            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
                            public void fail(VKAPIRequest.VKErrorResponse err) {
                                ((UserProfile) FriendsRecommViewHolder.this.item).online = needSubscribe ? 0 : 1;
                                FriendsRecommViewHolder.this.bind(FriendsRecommViewHolder.this.item);
                                super.fail(err);
                            }
                        }).exec(v.getContext());
                    }
                }
            });
            this.hide.setOnClickListener(FriendsRecommPostDisplayItem$FriendsRecommViewHolder$$Lambda$1.lambdaFactory$(this, parent));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$new$0(ViewGroup parent, View v) {
            FriendsRecommPostDisplayItem.this.att.profiles.remove(this.item);
            NewsfeedCache.replaceOne(FriendsRecommPostDisplayItem.this.post);
            ((FriendsRecommAdapter) ((RecyclerView) parent).mo1204getAdapter()).preloader.getData().remove(this.item);
            ((RecyclerView) parent).mo1204getAdapter().notifyItemRemoved(getAdapterPosition());
            new FriendsHideSuggestion(((UserProfile) this.item).uid).setCallback(new ResultlessCallback(v.getContext()) { // from class: com.vkontakte.android.ui.posts.FriendsRecommPostDisplayItem.FriendsRecommViewHolder.2
                @Override // com.vkontakte.android.api.ResultlessCallback
                public void success() {
                }
            }).persist(null, null).exec(v);
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(UserProfile item) {
            boolean added;
            this.photo.load(item.photo);
            this.name.setText(item.fullName);
            this.subtitle.setText(item.extra.getString("description"));
            if (item.online == 0) {
                added = item.isFriend;
            } else {
                added = item.online > 0;
            }
            if (item.online == 2 || item.online == -2) {
                this.progress.setVisibility(0);
                this.button.setVisibility(4);
            } else {
                this.progress.setVisibility(8);
                this.button.setVisibility(0);
                this.button.setImageResource(added ? R.drawable.ic_recommendation_added : R.drawable.ic_recommendations_add_friend);
            }
            if (!Analytics.isLogged("friend_recomm_view" + FriendsRecommPostDisplayItem.this.post.time + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + item.uid)) {
                Analytics.track("show_user_rec").collapse().unique().map(1).addParam(ServerKeys.USER_IDS, FriendsRecommPostDisplayItem.this.post.time + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + item.uid).commit();
                Analytics.logEvent("friend_recomm_view" + FriendsRecommPostDisplayItem.this.post.time + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + item.uid, TimeUtils.DAY);
            }
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
        public void onClick() {
            new ProfileFragment.Builder(((UserProfile) this.item).uid).setReferrer("user_rec").go(this.itemView.getContext());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class FriendsRecommAdapter extends UsableRecyclerView.Adapter<FriendsRecommViewHolder> implements Preloader.Callback<UserProfile>, UsableRecyclerView.Listener {
        private Preloader<UserProfile> preloader = new Preloader<>(this, 20);
        private boolean dataLoading = false;

        public FriendsRecommAdapter(List<UserProfile> initialList) {
            this.preloader.onDataLoaded(initialList, true);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public FriendsRecommViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new FriendsRecommViewHolder(parent.getContext(), parent);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(FriendsRecommViewHolder holder, int position) {
            holder.bind(this.preloader.getData().get(position));
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return this.preloader.getData().size();
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int position) {
            return 1;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int position, int image) {
            return this.preloader.getData().get(position).photo;
        }

        @Override // me.grishka.appkit.utils.Preloader.Callback
        public void updateList() {
            notifyDataSetChanged();
        }

        @Override // me.grishka.appkit.utils.Preloader.Callback
        public void loadData(int offset, int count) {
            this.dataLoading = true;
            new FriendsGetRecommendations(FriendsRecommPostDisplayItem.this.att.nextFrom, count).setCallback(new Callback<VKFromList<UserProfile>>() { // from class: com.vkontakte.android.ui.posts.FriendsRecommPostDisplayItem.FriendsRecommAdapter.1
                @Override // com.vkontakte.android.api.Callback
                public void success(VKFromList<UserProfile> result) {
                    boolean z = false;
                    FriendsRecommAdapter.this.dataLoading = false;
                    FriendsRecommPostDisplayItem.this.att.nextFrom = result.from();
                    FriendsRecommPostDisplayItem.this.att.profiles.addAll(result);
                    Preloader preloader = FriendsRecommAdapter.this.preloader;
                    if (!TextUtils.isEmpty(result.from())) {
                        z = true;
                    }
                    preloader.onDataLoaded(result, z);
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    FriendsRecommAdapter.this.dataLoading = false;
                }
            }).exec(Looper.getMainLooper());
        }

        @Override // me.grishka.appkit.utils.Preloader.Callback
        public void onAppendItems(List<UserProfile> items) {
        }

        @Override // me.grishka.appkit.utils.Preloader.Callback
        public void onClearItems() {
        }

        @Override // me.grishka.appkit.utils.Preloader.Callback
        public boolean isDataLoading() {
            return this.dataLoading;
        }

        @Override // me.grishka.appkit.utils.Preloader.Callback
        public boolean isRefreshing() {
            return false;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Listener
        public void onScrolledToLastItem() {
            this.preloader.onScrolledToLastItem();
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Listener
        public void onScrollStarted() {
        }
    }
}
