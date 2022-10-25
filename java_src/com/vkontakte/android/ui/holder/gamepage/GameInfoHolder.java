package com.vkontakte.android.ui.holder.gamepage;

import android.content.Context;
import android.graphics.Rect;
import android.support.annotation.NonNull;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.Global;
import com.vkontakte.android.Photo;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.data.ApiApplication;
import com.vkontakte.android.fragments.userlist.GamesFriendFragment;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import java.util.ArrayList;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class GameInfoHolder extends RecyclerHolder<Ref> implements View.OnClickListener {
    private static final int[] IMAGE_IDS = {R.id.image0, R.id.image1, R.id.image2, R.id.image3};
    private final UsableRecyclerView.Adapter adapter;
    private AppAdapter appAdapter;
    private View friendsBlock;
    private VKImageView[] imageViews;
    private TextView textDescription;
    private TextView textViewPlayingFriends;
    private View viewDivider;
    private View viewExpandText;

    /* loaded from: classes3.dex */
    public static class Ref {
        ApiApplication application;
        boolean isExpand = false;
        ArrayList<UserProfile> userProfiles;

        public Ref(ApiApplication application, ArrayList<UserProfile> userProfiles) {
            this.application = application;
            this.userProfiles = userProfiles;
        }

        public int getUsersCount() {
            return Math.min(this.userProfiles.size(), GameInfoHolder.IMAGE_IDS.length);
        }

        public String getProfilePhoto(int position) {
            if (position < 0 || position >= this.userProfiles.size()) {
                return null;
            }
            return this.userProfiles.get(position).photo;
        }
    }

    public GameInfoHolder(@NonNull Context context, UsableRecyclerView.Adapter adapter) {
        super((int) R.layout.apps_info_item, context);
        this.appAdapter = new AppAdapter();
        this.imageViews = new VKImageView[IMAGE_IDS.length];
        this.adapter = adapter;
        $(R.id.friends_block).setOnClickListener(this);
        this.textViewPlayingFriends = (TextView) $(R.id.text_playing_friends);
        this.viewDivider = $(R.id.divider);
        for (int i = 0; i < IMAGE_IDS.length; i++) {
            this.imageViews[i] = (VKImageView) $(IMAGE_IDS[i]);
        }
        LinearLayoutManager layoutManager = new LinearLayoutManager(getContext(), 0, false);
        RecyclerView recyclerView = (RecyclerView) $(R.id.recycle);
        recyclerView.setHasFixedSize(true);
        recyclerView.setLayoutManager(layoutManager);
        recyclerView.addItemDecoration(new SpacesItemDecoration(Global.scale(4.0f)));
        recyclerView.setAdapter(this.appAdapter);
        this.friendsBlock = $(R.id.friends_block);
        this.textDescription = (TextView) $(R.id.description);
        this.viewExpandText = $(R.id.text_expand);
        this.textDescription.setOnClickListener(this);
        this.viewExpandText.setOnClickListener(this);
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(Ref data) {
        boolean isNeedExpand = true;
        this.appAdapter.setUrls(data.application.screenshot);
        if (data.userProfiles.size() > 1) {
            this.friendsBlock.setVisibility(0);
            this.viewDivider.setVisibility(0);
        } else {
            this.friendsBlock.setVisibility(8);
            this.viewDivider.setVisibility(8);
        }
        for (int i = 0; i < this.imageViews.length; i++) {
            VKImageView imageView = this.imageViews[i];
            if (i < data.userProfiles.size()) {
                imageView.setVisibility(0);
                imageView.load(data.getProfilePhoto(i));
            } else {
                imageView.setVisibility(8);
            }
        }
        this.textViewPlayingFriends.setText(getQuantityString(R.plurals.games_friends_played, data.userProfiles.size(), Integer.valueOf(data.userProfiles.size())));
        if (data.application.description == null || data.application.shortDescription == null || data.application.description.length() > data.application.shortDescription.length() + 1) {
            isNeedExpand = false;
        }
        if (data.isExpand || isNeedExpand) {
            this.textDescription.setText(data.application.description);
            this.viewExpandText.setVisibility(8);
            return;
        }
        this.textDescription.setText(data.application.shortDescription);
        this.viewExpandText.setVisibility(0);
    }

    /* loaded from: classes3.dex */
    public static class SpacesItemDecoration extends RecyclerView.ItemDecoration {
        private int space;

        public SpacesItemDecoration(int space) {
            this.space = space;
        }

        @Override // android.support.v7.widget.RecyclerView.ItemDecoration
        public void getItemOffsets(Rect outRect, View view, RecyclerView parent, RecyclerView.State state) {
            outRect.left = parent.getChildLayoutPosition(view) > 0 ? this.space : 0;
        }
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        if (v.getId() == R.id.friends_block) {
            new GamesFriendFragment.Builder(getItem().userProfiles).go(v.getContext());
        } else if (!getItem().isExpand) {
            getItem().isExpand = true;
            this.adapter.notifyDataSetChanged();
        }
    }

    /* loaded from: classes3.dex */
    public class AppAdapter extends UsableRecyclerView.Adapter<ViewHolder> {
        private ArrayList<Photo> urls = new ArrayList<>();

        public AppAdapter() {
        }

        /* loaded from: classes3.dex */
        public class ViewHolder extends UsableRecyclerView.ViewHolder {
            public VKImageView imageView;

            public ViewHolder(View v) {
                super(v);
                this.imageView = (VKImageView) v.findViewById(R.id.image);
            }
        }

        public void setUrls(ArrayList<Photo> urls) {
            if (urls == null) {
                urls = new ArrayList<>();
            }
            this.urls = urls;
            notifyDataSetChanged();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public ViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new ViewHolder(LayoutInflater.from(parent.getContext()).inflate(R.layout.apps_screenshot, parent, false));
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(ViewHolder holder, int position) {
            Photo.Image image = this.urls.get(position).getImage('h');
            if (image != null && image.height != 0) {
                holder.imageView.setAspectRatio(image.width, image.height);
                holder.imageView.load(image.url);
            }
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return this.urls.size();
        }
    }
}
