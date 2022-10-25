package com.vk.stories;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.BitmapFactory;
import android.graphics.PorterDuff;
import android.graphics.drawable.BitmapDrawable;
import android.os.Bundle;
import android.support.v4.content.ContextCompat;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.TextView;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vk.core.util.KeyboardUtils;
import com.vk.imageloader.view.VKImageView;
import com.vk.stories.model.StoryUploadParams;
import com.vk.stories.util.VideoCompressor;
import com.vk.stories.view.ShareStoryRecyclerView;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKActivity;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.fragments.friends.SearchIndexer;
import com.vkontakte.android.functions.VoidF1Bool;
import com.vkontakte.android.ui.SearchViewWrapper;
import com.vkontakte.android.ui.holder.UserHolder;
import com.vkontakte.android.utils.OsUtil;
import java.io.File;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes2.dex */
public class ShareStoryActivity extends VKActivity {
    public static final String INTENT_IMAGE_FILE = "image_file";
    public static final String INTENT_STORY_UPLOAD_PARAM = "story_upload_param";
    public static final String INTENT_VIDEO_RENDER_PARAMS = "video_render_params";
    private ShareUsersAdapter adapter;
    private TextView emptyView;
    private View header;
    private File imageFile;
    private ShareStoryRecyclerView list;
    private VKImageView myAvatar;
    private TextView nonEmptyView;
    private SearchViewWrapper searchView;
    private TextView sendButton;
    private CheckBox storyShareCheckBox;
    private StoryUploadParams storyUploadParams;
    private Toolbar toolbar;
    private VideoCompressor.VideoCompressorParameters videoCompressorParameters;
    private SearchIndexer<UserProfile> searchIndexer = new SearchIndexer<>(new SearchIndexer.SimpleProvider<UserProfile>() { // from class: com.vk.stories.ShareStoryActivity.1
        @Override // com.vkontakte.android.fragments.friends.SearchIndexer.Provider
        public char[] getIndexChar(UserProfile from) {
            char c = ' ';
            char[] cArr = new char[2];
            cArr[0] = TextUtils.isEmpty(from.firstName) ? ' ' : Character.toLowerCase(from.firstName.charAt(0));
            if (!TextUtils.isEmpty(from.lastName)) {
                c = Character.toLowerCase(from.lastName.charAt(0));
            }
            cArr[1] = c;
            return cArr;
        }

        @Override // com.vkontakte.android.fragments.friends.SearchIndexer.Provider
        public boolean matches(String q, UserProfile item) {
            return item.fullName.toLowerCase().startsWith(q) || item.firstName.toLowerCase().startsWith(q) || item.lastName.toLowerCase().startsWith(q);
        }
    });
    private final ArrayList<UserProfile> users = new ArrayList<>();
    private final HashSet<UserProfile> selectedUsers = new HashSet<>();
    private boolean shareToNews = true;

    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityGingerbread, android.app.Activity
    @SuppressLint({"NewApi"})
    public void onCreate(Bundle b) {
        super.onCreate(b);
        this.videoCompressorParameters = (VideoCompressor.VideoCompressorParameters) getIntent().getParcelableExtra(INTENT_VIDEO_RENDER_PARAMS);
        this.imageFile = (File) getIntent().getSerializableExtra(INTENT_IMAGE_FILE);
        this.storyUploadParams = (StoryUploadParams) getIntent().getParcelableExtra(INTENT_STORY_UPLOAD_PARAM);
        if (this.storyUploadParams == null) {
            this.storyUploadParams = new StoryUploadParams();
        }
        setContentView(R.layout.activity_story_share_share_user);
        this.list = (ShareStoryRecyclerView) findViewById(R.id.list);
        this.list.setPadding(0, V.dp(8.0f), 0, 0);
        this.adapter = new ShareUsersAdapter(this);
        this.list.setLayoutManager(new GridLayoutManager(this, 1));
        this.list.setAdapter(this.adapter);
        this.list.addOnScrollListener(new RecyclerView.OnScrollListener() { // from class: com.vk.stories.ShareStoryActivity.2
            @Override // android.support.v7.widget.RecyclerView.OnScrollListener
            public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
                if (dy > 2) {
                    KeyboardUtils.hideKeyboard(ShareStoryActivity.this);
                }
            }
        });
        this.toolbar = (Toolbar) findViewById(R.id.toolbar);
        this.toolbar.setNavigationIcon(new BitmapDrawable(getResources(), BitmapFactory.decodeResource(getResources(), R.drawable.ic_ab_back)));
        this.toolbar.getNavigationIcon().setColorFilter(ContextCompat.getColor(this, R.color.picker_dark_icon), PorterDuff.Mode.MULTIPLY);
        this.toolbar.setNavigationOnClickListener(new View.OnClickListener() { // from class: com.vk.stories.ShareStoryActivity.3
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                ShareStoryActivity.this.finish();
            }
        });
        this.toolbar.setTitle(R.string.share);
        this.toolbar.setTitleTextAppearance(this, R.style.StoryToolbarTitleBig);
        this.toolbar.setSubtitleTextAppearance(this, R.style.StoryToolbarSubtitle);
        if (OsUtil.isAtLeastL()) {
            this.toolbar.setElevation(0.0f);
        }
        this.toolbar.setOnClickListener(new View.OnClickListener() { // from class: com.vk.stories.ShareStoryActivity.4
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                if (ShareStoryActivity.this.list != null) {
                    ShareStoryActivity.this.list.scrollToPosition(0);
                }
            }
        });
        this.searchView = new SearchViewWrapper(this, new SearchViewWrapper.SearchListener() { // from class: com.vk.stories.ShareStoryActivity.5
            @Override // com.vkontakte.android.ui.SearchViewWrapper.SearchListener
            public void onQueryConfirmed(String query) {
            }

            @Override // com.vkontakte.android.ui.SearchViewWrapper.SearchListener
            public void onQuerySubmitted(String query) {
            }

            @Override // com.vkontakte.android.ui.SearchViewWrapper.SearchListener
            public void onQueryChanged(String query) {
                boolean ns = query != null && query.trim().length() > 0;
                if (ns) {
                    ShareStoryActivity.this.emptyView.setText(R.string.nothing_found);
                    ShareStoryActivity.this.adapter.setData(ShareStoryActivity.this.searchIndexer.search(query.trim()));
                    return;
                }
                ShareStoryActivity.this.emptyView.setText(R.string.no_friends);
                ShareStoryActivity.this.adapter.setData(ShareStoryActivity.this.users);
            }
        });
        this.searchView.onCreateOptionsMenu(this.toolbar.getMenu());
        this.searchView.setShowVoiceOnEmpty(false);
        this.header = getLayoutInflater().inflate(R.layout.layout_my_story_header, (ViewGroup) null);
        this.header.setOnClickListener(new View.OnClickListener() { // from class: com.vk.stories.ShareStoryActivity.6
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                ShareStoryActivity.this.shareToNews = !ShareStoryActivity.this.shareToNews;
                ShareStoryActivity.this.storyShareCheckBox.setChecked(ShareStoryActivity.this.shareToNews);
                ShareStoryActivity.this.checkUIState();
            }
        });
        this.storyShareCheckBox = (CheckBox) this.header.findViewById(R.id.check);
        this.storyShareCheckBox.setChecked(true);
        this.storyShareCheckBox.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() { // from class: com.vk.stories.ShareStoryActivity.7
            @Override // android.widget.CompoundButton.OnCheckedChangeListener
            public void onCheckedChanged(CompoundButton compoundButton, boolean b2) {
                ShareStoryActivity.this.shareToNews = b2;
                ShareStoryActivity.this.checkUIState();
            }
        });
        this.emptyView = (TextView) this.header.findViewById(R.id.tv_empty);
        this.nonEmptyView = (TextView) this.header.findViewById(R.id.tv_send_with_message);
        this.myAvatar = (VKImageView) this.header.findViewById(R.id.photo);
        this.myAvatar.load(VKAccountManager.getCurrent().getPhoto());
        this.sendButton = (TextView) findViewById(R.id.btn_send);
        this.sendButton.setOnClickListener(new View.OnClickListener() { // from class: com.vk.stories.ShareStoryActivity.8
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (ShareStoryActivity.this.shareToNews || ShareStoryActivity.this.selectedUsers.size() > 0) {
                    ArrayList<Integer> usersIds = new ArrayList<>();
                    Iterator it = ShareStoryActivity.this.selectedUsers.iterator();
                    while (it.hasNext()) {
                        UserProfile up = (UserProfile) it.next();
                        usersIds.add(Integer.valueOf(up.uid));
                    }
                    ShareStoryActivity.this.storyUploadParams.setAddToNews(ShareStoryActivity.this.shareToNews).setUserIds(usersIds);
                    if (ShareStoryActivity.this.imageFile != null) {
                        StoriesController.startStoryUpload(ShareStoryActivity.this.imageFile, ShareStoryActivity.this.storyUploadParams);
                        ShareStoryActivity.this.setResult(-1);
                        ShareStoryActivity.this.finish();
                    } else if (ShareStoryActivity.this.videoCompressorParameters != null) {
                        StoriesController.startStoryUpload(ShareStoryActivity.this.videoCompressorParameters, ShareStoryActivity.this.storyUploadParams);
                        ShareStoryActivity.this.setResult(-1);
                        ShareStoryActivity.this.finish();
                    }
                }
            }
        });
        checkUIState();
        doLoadData();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void checkUIState() {
        StringBuilder subtitleBuilder = new StringBuilder();
        if (this.shareToNews) {
            subtitleBuilder.append(getString(R.string.my_story));
        }
        if (this.selectedUsers.size() > 0) {
            ArrayList<UserProfile> users = new ArrayList<>(this.selectedUsers);
            if (this.shareToNews) {
                if (users.size() == 1) {
                    subtitleBuilder.append(", ").append(users.get(0).firstName);
                } else {
                    subtitleBuilder.append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).append(getString(R.string.stories_and)).append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).append(users.size()).append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).append(getResources().getQuantityString(R.plurals.stories_share_n_friend, users.size()));
                }
            } else if (users.size() <= 3) {
                for (int i = 0; i < users.size(); i++) {
                    subtitleBuilder.append(users.get(i).firstName);
                    if (i < users.size() - 1) {
                        subtitleBuilder.append(", ");
                    }
                }
            } else {
                subtitleBuilder.append(users.get(0).firstName).append(", ").append(users.get(1).firstName).append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).append(getString(R.string.stories_and)).append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).append(users.size() - 2).append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).append(getResources().getQuantityString(R.plurals.stories_share_n_friend, users.size() - 2));
            }
        }
        if (subtitleBuilder.length() > 0) {
            this.toolbar.setTitleTextAppearance(this, R.style.StoryToolbarTitleSmall);
            this.toolbar.setSubtitle(subtitleBuilder.toString());
        } else {
            this.toolbar.setTitleTextAppearance(this, R.style.StoryToolbarTitleBig);
            this.toolbar.setSubtitle((CharSequence) null);
        }
        if (this.shareToNews || this.selectedUsers.size() > 0) {
            this.sendButton.setBackgroundResource(R.drawable.btn_send_story);
            this.sendButton.setTextColor(-1);
            return;
        }
        this.sendButton.setBackgroundColor(-1644826);
        this.sendButton.setTextColor(-7301991);
    }

    private void doLoadData() {
        Friends.getFriends(this.users);
        this.searchIndexer.bind(this.users);
        this.searchIndexer.build();
        this.adapter.setData(this.users);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class ShareUsersAdapter extends UsableRecyclerView.Adapter<UsableRecyclerView.ViewHolder> implements VoidF1Bool<UserProfile> {
        private final Context context;
        private final int TYPE_HEADER = 0;
        private final int TYPE_USER = 1;
        private final ArrayList<UserProfile> users = new ArrayList<>();
        private boolean isEmpty = false;

        public ShareUsersAdapter(Context context) {
            this.context = context;
            setHasStableIds(true);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public UsableRecyclerView.ViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            if (viewType != 0) {
                return UserHolder.checkable(ShareStoryActivity.this.list).onCheck(this);
            }
            return new HeaderHolder();
        }

        @Override // com.vkontakte.android.functions.VoidF1Bool
        public void f(UserProfile userProfile, boolean b) {
            if (b) {
                ShareStoryActivity.this.selectedUsers.add(userProfile);
            } else {
                ShareStoryActivity.this.selectedUsers.remove(userProfile);
            }
            ShareStoryActivity.this.checkUIState();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(UsableRecyclerView.ViewHolder holder, int position) {
            if (holder instanceof UserHolder) {
                UserProfile u = this.users.get(position - 1);
                u.isSelected = ShareStoryActivity.this.selectedUsers.contains(u);
                ((UserHolder) holder).bind(u);
            } else if (holder instanceof HeaderHolder) {
                ((HeaderHolder) holder).setIsEmpty(this.isEmpty);
            }
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return this.users.size() + 1;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            return position == 0 ? 0 : 1;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public long getItemId(int position) {
            if (position == 0) {
                return 0L;
            }
            return this.users.get(position - 1).uid;
        }

        public void setData(ArrayList<UserProfile> docs) {
            this.users.clear();
            if (docs != null) {
                this.users.addAll(docs);
            }
            notifyDataSetChanged();
            this.isEmpty = this.users.size() == 0;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class HeaderHolder extends UsableRecyclerView.ViewHolder {
        public HeaderHolder() {
            super(ShareStoryActivity.this.header);
        }

        public void setIsEmpty(boolean isEmpty) {
            if (isEmpty) {
                ShareStoryActivity.this.nonEmptyView.setVisibility(8);
                ShareStoryActivity.this.emptyView.setVisibility(0);
                return;
            }
            ShareStoryActivity.this.nonEmptyView.setVisibility(0);
            ShareStoryActivity.this.emptyView.setVisibility(8);
        }
    }
}
