package com.vkontakte.android.fragments.videos;

import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.support.design.widget.TabLayout;
import android.text.TextUtils;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.SubMenu;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;
import com.facebook.common.util.UriUtil;
import com.facebook.internal.AnalyticsEvents;
import com.facebook.internal.NativeProtocol;
import com.vk.attachpicker.AttachActivity;
import com.vk.attachpicker.AttachIntent;
import com.vk.attachpicker.PhotoVideoAttachActivity;
import com.vk.attachpicker.SupportExternalToolbarContainer;
import com.vk.core.network.Network;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.VideoUploadDialog;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.VideoAlbum;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.api.video.VideoGetById;
import com.vkontakte.android.api.video.VideoGetTabs;
import com.vkontakte.android.api.video.VideoSave;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.background.AsyncTask;
import com.vkontakte.android.data.Groups;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.dialogs.PromptDialog;
import com.vkontakte.android.fragments.BackListener;
import com.vkontakte.android.fragments.VkTabbedLoaderFragment;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.ui.SearchViewWrapper;
import com.vkontakte.android.upload.UploadUtils;
import java.net.MalformedURLException;
import org.json.JSONObject;
/* loaded from: classes3.dex */
public class VideosFragment extends VkTabbedLoaderFragment implements BackListener, SupportExternalToolbarContainer {
    static final int CREATE_RESULT = 104;
    static final int VIDEO_EXISTING_RESULT = 235;
    static final int VIDEO_NEW_RESULT = 234;
    private AddedVideosFragment mAddedVideosFragment;
    boolean mAdmin;
    boolean mCanUploadVideo;
    SearchViewWrapper mSearchView;
    boolean mSelectMode;
    private TaggedVideosFragment mTaggedVideosFragment;
    String mTitle;
    private UploadedVideosFragment mUploadedVideosFragment;
    private VideoAlbumsFragment mVideoAlbumsFragment;
    final Handler mTimerHandler = new Handler(Looper.getMainLooper());
    int mOwnerId = VKAccountManager.getCurrent().getUid();

    public VideosFragment() {
        setTabsLayout(R.layout.tabs_with_search);
        setTabsAutoLoad(false);
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment
    protected void doLoadData() {
        new VideoGetTabs(this.mOwnerId).setCallback(new SimpleCallback<VideoGetTabs.Result>(this) { // from class: com.vkontakte.android.fragments.videos.VideosFragment.1
            {
                VideosFragment.this = this;
            }

            @Override // com.vkontakte.android.api.Callback
            public void success(VideoGetTabs.Result result) {
                if (result.uploadedCount > 0) {
                    VideosFragment.this.mUploadedVideosFragment = UploadedVideosFragment.newInstance(VideosFragment.this.mOwnerId, VideosFragment.this.mSelectMode);
                    VideosFragment.this.addTab(VideosFragment.this.getTabsCount(), VideosFragment.this.mUploadedVideosFragment, VideosFragment.this.getString(R.string.video_album_uploaded));
                } else if (VideosFragment.this.mUploadedVideosFragment != null) {
                    VideosFragment.this.removeTab(VideosFragment.this.mUploadedVideosFragment);
                    VideosFragment.this.mUploadedVideosFragment = null;
                }
                if (result.userVideosCount <= 0 || VideosFragment.this.mOwnerId <= 0) {
                    if (VideosFragment.this.mTaggedVideosFragment != null) {
                        VideosFragment.this.removeTab(VideosFragment.this.mTaggedVideosFragment);
                        VideosFragment.this.mTaggedVideosFragment = null;
                    }
                } else {
                    VideosFragment.this.mTaggedVideosFragment = TaggedVideosFragment.newInstance(VideosFragment.this.mOwnerId, VideosFragment.this.mSelectMode);
                    String title = VKAccountManager.isCurrentUser(VideosFragment.this.mOwnerId) ? VideosFragment.this.getString(R.string.videos_of_me) : VideosFragment.this.getString(R.string.videos_of_user, new Object[]{VideosFragment.this.getArguments().getCharSequence("username_ins")});
                    VideosFragment.this.addTab(VideosFragment.this.getTabsCount(), VideosFragment.this.mTaggedVideosFragment, title);
                }
                if (result.albumsCount > 0 || VKAccountManager.isCurrentUser(VideosFragment.this.mOwnerId) || (VideosFragment.this.mOwnerId < 0 && Groups.getAdminLevel(-VideosFragment.this.mOwnerId) >= 1)) {
                    VideosFragment.this.mVideoAlbumsFragment = VideoAlbumsFragment.newInstance(VideosFragment.this.mOwnerId, VideosFragment.this.mSelectMode);
                    VideosFragment.this.addTab(VideosFragment.this.getTabsCount(), VideosFragment.this.mVideoAlbumsFragment, VideosFragment.this.getString(R.string.video_albums));
                } else if (VideosFragment.this.mVideoAlbumsFragment != null) {
                    VideosFragment.this.removeTab(VideosFragment.this.mVideoAlbumsFragment);
                    VideosFragment.this.mVideoAlbumsFragment = null;
                }
                VideosFragment.this.disableRefreshIfNeeded();
                VideosFragment.this.dataLoaded();
            }
        }).exec((Context) getActivity());
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.mOwnerId = getArguments().getInt(ArgKeys.UID, this.mOwnerId);
        this.mCanUploadVideo = getArguments().getBoolean("can_upload_video");
        this.mAdmin = VKAccountManager.isCurrentUser(this.mOwnerId) || this.mOwnerId == 0 || (this.mOwnerId < 0 && Groups.isGroupAdmin(-this.mOwnerId));
        this.mTitle = getArguments().getString("title", getString(R.string.videos));
        this.mSelectMode = getArguments().getBoolean(ArgKeys.SELECT);
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        this.mTimerHandler.removeCallbacksAndMessages(null);
    }

    @Override // me.grishka.appkit.fragments.TabbedLoaderFragment, android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        boolean z = true;
        if (this.mSearchView != null) {
            this.mSearchView.onCreateOptionsMenu(menu);
        }
        if ((this.mAdmin || this.mCanUploadVideo) && !this.mSelectMode) {
            inflater.inflate(R.menu.videos, menu);
            MenuItem add = menu.findItem(R.id.add);
            if (add != null) {
                SubMenu subMenu = add.getSubMenu();
                ViewUtils.colorizeSubmenu(subMenu, -5525581);
                MenuItem findItem = subMenu.findItem(R.id.add_album);
                if (!VKAccountManager.isCurrentUser(this.mOwnerId) && (this.mOwnerId >= 0 || Groups.getAdminLevel(-this.mOwnerId) < 1)) {
                    z = false;
                }
                findItem.setVisible(z);
            }
        }
        super.onCreateOptionsMenu(menu, inflater);
    }

    @Override // me.grishka.appkit.fragments.ContainerFragment, android.app.DialogFragment, android.app.Fragment
    public void onActivityCreated(Bundle state) {
        super.onActivityCreated(state);
        if (!this.loaded) {
            this.progress.setVisibility(8);
            this.dataLoading = true;
            doLoadData();
        }
    }

    @Override // me.grishka.appkit.fragments.TabbedLoaderFragment, android.app.Fragment
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case R.id.add_new_video /* 2131756544 */:
                Intent intent = new Intent("android.media.action.VIDEO_CAPTURE");
                intent.putExtra("android.intent.extra.sizeLimit", 2147483648L);
                startActivityForResult(intent, VIDEO_NEW_RESULT);
                break;
            case R.id.add_existed /* 2131756545 */:
                Intent intent2 = new Intent(getActivity(), PhotoVideoAttachActivity.class);
                intent2.putExtra("media_type", 333);
                intent2.putExtra(AttachIntent.INTENT_SINGLE_MODE, true);
                startActivityForResult(intent2, VIDEO_EXISTING_RESULT);
                break;
            case R.id.add_link /* 2131756546 */:
                showAddLinkDialog();
                break;
            case R.id.add_album /* 2131756547 */:
                createAlbum();
                break;
        }
        return true;
    }

    @Override // android.app.Fragment
    public void onActivityResult(int reqCode, int resCode, Intent data) {
        super.onActivityResult(reqCode, resCode, data);
        if (resCode == -1) {
            switch (reqCode) {
                case 104:
                    VideoAlbum album = (VideoAlbum) data.getParcelableExtra(ArgKeys.ALBUM);
                    Videos.notifyAlbumCreated(getActivity(), album);
                    return;
                case VIDEO_NEW_RESULT /* 234 */:
                case VIDEO_EXISTING_RESULT /* 235 */:
                    Uri uri = data.getData();
                    if (uri.getScheme().equals(UriUtil.LOCAL_CONTENT_SCHEME)) {
                        String path = UploadUtils.resolvePath(uri);
                        if (TextUtils.isEmpty(path)) {
                            Toast.makeText(getActivity(), (int) R.string.error, 0).show();
                            return;
                        }
                        uri = Uri.parse(path);
                    }
                    VideoUploadDialog.show(getContext(), this.mOwnerId, uri);
                    return;
                default:
                    return;
            }
        }
    }

    private boolean isInContextOfAttachActivity() {
        return getActivity() instanceof AttachActivity;
    }

    @Override // com.vkontakte.android.fragments.VkTabbedLoaderFragment, me.grishka.appkit.fragments.AppKitFragment
    public boolean canGoBack() {
        return !isInContextOfAttachActivity() && super.canGoBack();
    }

    @Override // com.vkontakte.android.fragments.VkTabbedLoaderFragment, me.grishka.appkit.fragments.AppKitFragment
    public boolean hasNavigationDrawer() {
        return !isInContextOfAttachActivity() && super.hasNavigationDrawer();
    }

    @Override // com.vkontakte.android.fragments.VkTabbedLoaderFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        getToolbar().setTitle(this.mTitle);
        View contentWrap = view.findViewById(R.id.tabs_wrap);
        View searchWrap = view.findViewById(R.id.search_wrap);
        if (isInContextOfAttachActivity()) {
            getToolbar().setVisibility(8);
            getView().setBackgroundColor(-1);
            TabLayout tabLayout = (TabLayout) view.findViewById(R.id.tabs);
            tabLayout.setBackgroundColor(-1);
            tabLayout.setTabTextColors(Color.parseColor("#B9CDE3"), getResources().getColor(R.color.brand_primary));
            tabLayout.setSelectedTabIndicatorColor(getResources().getColor(R.color.brand_primary));
            disableRefreshIfNeeded();
        }
        this.mAddedVideosFragment = AddedVideosFragment.newInstance(this.mOwnerId, this.mSelectMode);
        addTab(0, this.mAddedVideosFragment, getString(R.string.video_album_added));
        final SearchVideoListFragment searchFragment = SearchVideoListFragment.newInstance(this.mSelectMode);
        this.mSearchView = new SearchViewWrapper(getActivity(), new SearchViewWrapper.SearchListener() { // from class: com.vkontakte.android.fragments.videos.VideosFragment.2
            {
                VideosFragment.this = this;
            }

            @Override // com.vkontakte.android.ui.SearchViewWrapper.SearchListener
            public void onQueryConfirmed(String query) {
                if (query != null && query.length() > 0) {
                    searchFragment.setQuery(query);
                } else {
                    searchFragment.reset();
                }
            }

            @Override // com.vkontakte.android.ui.SearchViewWrapper.SearchListener
            public void onQuerySubmitted(String query) {
            }

            @Override // com.vkontakte.android.ui.SearchViewWrapper.SearchListener
            public void onQueryChanged(String query) {
            }
        }, SearchViewWrapper.CONFIRM_TIMEOUT);
        this.mSearchView.setStateListener(VideosFragment$$Lambda$1.lambdaFactory$(searchWrap, contentWrap, searchFragment));
        searchFragment.searchView = this.mSearchView;
        getInnerFragmentManager().beginTransaction().add(R.id.search_wrap, searchFragment).commit();
        setHasOptionsMenu(true);
    }

    public static /* synthetic */ void lambda$onViewCreated$0(View searchWrap, View contentWrap, SearchVideoListFragment searchFragment, boolean expanded) {
        int i = 8;
        ViewUtils.setVisibilityAnimated(searchWrap, expanded ? 0 : 8);
        if (!expanded) {
            i = 0;
        }
        ViewUtils.setVisibilityAnimated(contentWrap, i);
        if (!expanded) {
            searchFragment.reset();
        }
    }

    public void disableRefreshIfNeeded() {
        if (isInContextOfAttachActivity()) {
            if (this.mAddedVideosFragment != null) {
                this.mAddedVideosFragment.disableRefresh();
            }
            if (this.mUploadedVideosFragment != null) {
                this.mUploadedVideosFragment.disableRefresh();
            }
            if (this.mVideoAlbumsFragment != null) {
                this.mVideoAlbumsFragment.disableRefresh();
            }
            if (this.mTaggedVideosFragment != null) {
                this.mTaggedVideosFragment.disableRefresh();
            }
        }
    }

    @Override // com.vkontakte.android.fragments.BackListener
    public boolean onBackPressed() {
        boolean result = false;
        SearchVideoListFragment fragment = (SearchVideoListFragment) getInnerFragmentManager().findFragmentById(R.id.search_wrap);
        if (fragment != null) {
            result = fragment.onBackPressed();
        }
        if (this.mSearchView.isExpanded()) {
            this.mSearchView.setExpanded(false);
            return true;
        }
        return result;
    }

    void showAddLinkDialog() {
        new PromptDialog(getActivity()).setTitle(R.string.add_video).setHint(R.string.attach_link).requireText().setInputListener(VideosFragment$$Lambda$2.lambdaFactory$(this)).show();
    }

    public /* synthetic */ void lambda$showAddLinkDialog$1(CharSequence result) {
        addVideoByLink(result.toString());
    }

    void addVideoByLink(String link) {
        new AddVideoByLinkTask(link).execPool(new Void[0]);
    }

    void createAlbum() {
        AlbumEditorFragment.create(this.mOwnerId).forResult(this, 104);
    }

    @Override // android.support.v4.widget.SwipeRefreshLayout.OnRefreshListener
    public void onRefresh() {
    }

    @Override // com.vk.attachpicker.SupportExternalToolbarContainer
    public ViewGroup provideToolbar(Context context) {
        return getToolbar();
    }

    /* loaded from: classes3.dex */
    public class AddVideoByLinkTask extends AsyncTask<Void, Void, VideoSave.Result> {
        private final String mLink;
        private final ProgressDialog mProgressDialog;

        public AddVideoByLinkTask(String link) {
            VideosFragment.this = this$0;
            this.mLink = link;
            this.mProgressDialog = new ProgressDialog(this$0.getActivity());
            this.mProgressDialog.setMessage(this$0.getString(R.string.loading));
        }

        @Override // com.vkontakte.android.background.AsyncTask
        protected void onPreExecute() {
            this.mProgressDialog.show();
        }

        @Override // com.vkontakte.android.background.AsyncTask
        public VideoSave.Result doInBackground(Void... params) throws Exception {
            VideoSave.Result results = (VideoSave.Result) new VideoSave(VideosFragment.this.mOwnerId, 0, null, null, false, this.mLink).execSyncWithResult();
            byte[] bytes = Network.getURL(results.uploadUrl);
            JSONObject jo = new JSONObject(new String(bytes));
            if (jo.optInt(ServerKeys.RESPONSE, 0) != 1) {
                if (jo.optInt(NativeProtocol.BRIDGE_ARG_ERROR_CODE, 0) == 7) {
                    throw new MalformedURLException(jo.optString(AnalyticsEvents.PARAMETER_SHARE_ERROR_MESSAGE));
                }
                throw new Exception(jo.optString(AnalyticsEvents.PARAMETER_SHARE_ERROR_MESSAGE));
            }
            return results;
        }

        @Override // com.vkontakte.android.background.AsyncTask
        public void onPostExecute(VideoSave.Result results) {
            syncVideoEmbedWithServer(results.id, results.accessKey);
        }

        @Override // com.vkontakte.android.background.AsyncTask
        public void onError(Throwable t) {
            if (VideosFragment.this.getActivity() != null) {
                Toast.makeText(VideosFragment.this.getActivity(), t instanceof MalformedURLException ? R.string.video_wrong_link : R.string.error, 0).show();
            }
            this.mProgressDialog.cancel();
        }

        /* renamed from: com.vkontakte.android.fragments.videos.VideosFragment$AddVideoByLinkTask$1 */
        /* loaded from: classes3.dex */
        public class AnonymousClass1 extends SimpleCallback<VideoFile> {
            final /* synthetic */ String val$access_key;
            final /* synthetic */ int val$id;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            AnonymousClass1(Context context, int i, String str) {
                super(context);
                AddVideoByLinkTask.this = this$1;
                this.val$id = i;
                this.val$access_key = str;
            }

            @Override // com.vkontakte.android.api.Callback
            public void success(VideoFile video) {
                if (!TextUtils.isEmpty(video.urlExternal)) {
                    video.ownerName = VKAccountManager.getCurrent().getName();
                    Videos.notifyVideoAdded(VKApplication.context, video);
                    AddVideoByLinkTask.this.mProgressDialog.cancel();
                } else if (VideosFragment.this.getActivity() != null) {
                    VideosFragment.this.mTimerHandler.postDelayed(VideosFragment$AddVideoByLinkTask$1$$Lambda$1.lambdaFactory$(this, this.val$id, this.val$access_key), 1000L);
                }
            }

            public /* synthetic */ void lambda$success$0(int id, String access_key) {
                AddVideoByLinkTask.this.syncVideoEmbedWithServer(id, access_key);
            }

            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                super.fail(error);
                AddVideoByLinkTask.this.mProgressDialog.cancel();
            }
        }

        void syncVideoEmbedWithServer(int id, String access_key) {
            new VideoGetById(VideosFragment.this.mOwnerId, id, access_key).setCallback(new AnonymousClass1(VideosFragment.this.getActivity(), id, access_key)).exec((Context) VideosFragment.this.getActivity());
        }
    }
}
