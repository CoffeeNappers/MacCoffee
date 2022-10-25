package com.vkontakte.android.activities;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.res.Configuration;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.support.v4.content.LocalBroadcastManager;
import android.support.v7.widget.PopupMenu;
import android.support.v7.widget.Toolbar;
import android.text.ClipboardManager;
import android.text.TextUtils;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.animation.Interpolator;
import android.widget.Toast;
import com.facebook.common.util.UriUtil;
import com.facebook.share.internal.ShareConstants;
import com.vk.core.util.ToastUtils;
import com.vk.sharing.Sharing;
import com.vk.sharing.action.Actions;
import com.vk.sharing.attachment.Attachments;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.R;
import com.vkontakte.android.ReportContentActivity;
import com.vkontakte.android.RepostActivity;
import com.vkontakte.android.VKActivity;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.api.video.VideoAdd;
import com.vkontakte.android.api.video.VideoDelete;
import com.vkontakte.android.api.video.VideoGetById;
import com.vkontakte.android.api.video.VideoIsAdded;
import com.vkontakte.android.attachments.VideoAttachment;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.Posts;
import com.vkontakte.android.data.PrivacySetting;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.PostViewFragment;
import com.vkontakte.android.fragments.videos.VideoAddHelper;
import com.vkontakte.android.fragments.videos.Videos;
import com.vkontakte.android.media.AbsVideoPlayer;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.ui.CubicBezierInterpolator;
import com.vkontakte.android.ui.drawable.RecoloredDrawable;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public abstract class BaseVideoActivity extends VKActivity {
    protected static Interpolator interpolatorIn = new CubicBezierInterpolator(0.58d, 0.77d, 0.5d, 1.0d);
    protected static Interpolator interpolatorOut = new CubicBezierInterpolator(0.5d, 0.0d, 0.48d, 0.33d);
    PopupMenu addMenu;
    protected int addedID;
    private boolean adding;
    View bottomPanel;
    protected boolean changingSysUiVisibility;
    private int errorCode;
    private VideoFile file;
    boolean hideInitialUI;
    private boolean loadLikes;
    private NewsEntry post;
    String referrer;
    Toolbar toolbar;
    boolean landscape = updateConfiguration(VKApplication.context);
    private final BroadcastReceiver receiver = new BroadcastReceiver() { // from class: com.vkontakte.android.activities.BaseVideoActivity.1
        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            if (BaseVideoActivity.this.file != null) {
                String action = intent.getAction();
                if (Posts.ACTION_POST_UPDATED_BROADCAST.equals(action) && BaseVideoActivity.this.file.oid == intent.getIntExtra("owner_id", 0) && BaseVideoActivity.this.file.vid == intent.getIntExtra(ShareConstants.WEB_DIALOG_RESULT_PARAM_POST_ID, 0) && 2 == intent.getIntExtra("post_type", 0)) {
                    boolean liked = intent.getBooleanExtra("liked", false);
                    if (liked != BaseVideoActivity.this.file.liked) {
                        BaseVideoActivity.this.file.liked = liked;
                        VideoFile videoFile = BaseVideoActivity.this.file;
                        videoFile.likes = (BaseVideoActivity.this.file.liked ? 1 : -1) + videoFile.likes;
                        if (BaseVideoActivity.this.post != null) {
                            BaseVideoActivity.this.post.numLikes = BaseVideoActivity.this.file.likes;
                            BaseVideoActivity.this.post.flag(8, BaseVideoActivity.this.file.liked);
                        }
                        BaseVideoActivity.this.onLikeStateChanged();
                        BaseVideoActivity.this.invalidateOptionsMenu();
                        BaseVideoActivity.this.bindInfo(BaseVideoActivity.this.file);
                    }
                } else if (Videos.ACTION_VIDEO_MOVED.equals(action)) {
                    BaseVideoActivity.this.updateAddedState();
                }
            }
        }
    };
    private int fileIndex = -1;
    protected int systemUILayoutFlag = 1792;

    abstract void addVideo();

    abstract void bindInfo(VideoFile videoFile);

    abstract void blockingSetUIVisibility(boolean z);

    abstract void cancelHideUI();

    abstract void createUI(Bundle bundle);

    abstract int getHideDelay();

    abstract void hideUIDelayed(int i);

    abstract void onAddedStateChanged();

    abstract void onLikeStateChanged();

    abstract void setUIVisibility(boolean z);

    abstract void startFile(VideoFile videoFile);

    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityGingerbread, android.app.Activity
    public void onCreate(Bundle b) {
        super.onCreate(b);
        updateConfiguration(this);
        this.file = (VideoFile) getIntent().getParcelableExtra(UriUtil.LOCAL_FILE_SCHEME);
        this.post = this.file.convertToPost();
        this.fileIndex = getIntent().getIntExtra("file_index", -1);
        this.referrer = getIntent().getStringExtra(ArgKeys.REFERRER);
        this.loadLikes = getIntent().getBooleanExtra("load_likes", this.loadLikes);
        this.hideInitialUI = getIntent().getBooleanExtra("hide_ui", this.hideInitialUI);
        createUI(b);
        initSystemView();
        this.toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(this.toolbar);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().setHomeAsUpIndicator(R.drawable.picker_ic_close_24dp);
        getSupportActionBar().setTitle((CharSequence) null);
        findViewById(R.id.likes).setOnClickListener(BaseVideoActivity$$Lambda$1.lambdaFactory$(this));
        findViewById(R.id.shares).setOnClickListener(BaseVideoActivity$$Lambda$2.lambdaFactory$(this));
        findViewById(R.id.comments).setOnClickListener(BaseVideoActivity$$Lambda$3.lambdaFactory$(this));
        this.bottomPanel = findViewById(R.id.bottom_panel);
        bindInfo(this.file);
        if (this.file.oid != VKAccountManager.getCurrent().getUid()) {
            updateAddedState();
        }
        registerReceiver(this.receiver, new IntentFilter(Posts.ACTION_POST_UPDATED_BROADCAST), "com.vkontakte.android.permission.ACCESS_DATA", null);
        LocalBroadcastManager.getInstance(this).registerReceiver(this.receiver, new IntentFilter(Videos.ACTION_VIDEO_MOVED));
        if (this.file.contentRestricted) {
            displayError(6);
        } else if (!this.file.isExternal() && (this.file.processing || (TextUtils.isEmpty(this.file.url240) && TextUtils.isEmpty(this.file.urlHls) && TextUtils.isEmpty(this.file.urlEmbed) && TextUtils.isEmpty(this.file.urlExternal)))) {
            blockingSetUIVisibility(false);
            new VideoGetById(this.file.oid, this.file.vid, this.file.accessKey).setCallback(new Callback<VideoFile>() { // from class: com.vkontakte.android.activities.BaseVideoActivity.2
                @Override // com.vkontakte.android.api.Callback
                public void success(VideoFile video) {
                    if (video == null) {
                        Toast.makeText(BaseVideoActivity.this, (int) R.string.post_not_found, 0).show();
                        BaseVideoActivity.this.finish();
                    } else if (!video.processing || !TextUtils.isEmpty(video.url240)) {
                        BaseVideoActivity.this.setVideo(video);
                        BaseVideoActivity.this.bindInfo(video);
                        BaseVideoActivity.this.invalidateOptionsMenu();
                        BaseVideoActivity.this.blockingSetUIVisibility(true);
                        BaseVideoActivity.this.startFile(video);
                    } else {
                        BaseVideoActivity.this.displayError(4);
                    }
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    BaseVideoActivity.this.displayError(-1);
                }
            }).exec((Context) this);
        } else {
            startFile(this.file);
            if (this.loadLikes && !isFinishing()) {
                new VideoGetById(this.file.oid, this.file.vid, this.file.accessKey).setCallback(new Callback<VideoFile>() { // from class: com.vkontakte.android.activities.BaseVideoActivity.3
                    @Override // com.vkontakte.android.api.Callback
                    public void success(VideoFile video) {
                        BaseVideoActivity.this.setVideo(video);
                        BaseVideoActivity.this.bindInfo(video);
                        BaseVideoActivity.this.invalidateOptionsMenu();
                    }

                    @Override // com.vkontakte.android.api.Callback
                    public void fail(VKAPIRequest.VKErrorResponse error) {
                    }
                }).exec((Context) this);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreate$0(View v) {
        toggleLike();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreate$1(View v) {
        share();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreate$2(View v) {
        openPost();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onDestroy() {
        super.onDestroy();
        unregisterReceiver(this.receiver);
        LocalBroadcastManager.getInstance(this).unregisterReceiver(this.receiver);
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onResume() {
        super.onResume();
        if (this.errorCode != 0) {
            displayError(this.errorCode);
        }
    }

    @Override // android.app.Activity
    public boolean onCreateOptionsMenu(Menu menu) {
        int i = -7225358;
        boolean z = false;
        getMenuInflater().inflate(R.menu.video_player, menu);
        menu.findItem(R.id.add).setVisible(this.file.canAdd);
        menu.findItem(R.id.share).setVisible(this.landscape && this.file.canRepost);
        menu.findItem(R.id.like).setVisible(this.landscape);
        menu.findItem(R.id.add).setIcon(new RecoloredDrawable(getResources().getDrawable(R.drawable.ic_add_24dp), (this.addedID != 0 || this.file.oid == VKAccountManager.getCurrent().getUid()) ? -7225358 : -1));
        MenuItem findItem = menu.findItem(R.id.like);
        Drawable drawable = getResources().getDrawable(R.drawable.ic_like_24dp);
        if (!this.file.liked) {
            i = -1;
        }
        findItem.setIcon(new RecoloredDrawable(drawable, i));
        menu.findItem(R.id.share).setIcon(new RecoloredDrawable(getResources().getDrawable(R.drawable.ic_share_24dp), -1));
        menu.findItem(R.id.report).setVisible(this.file.oid != VKAccountManager.getCurrent().getUid());
        boolean canUseLink = this.file.vid != 0 && ((this.file.privacy.size() == 1 && PrivacySetting.ALL.equals(this.file.privacy.get(0))) || this.file.privacy.isEmpty());
        menu.findItem(R.id.copy_link).setVisible(canUseLink);
        menu.findItem(R.id.open_in_browser).setVisible(canUseLink);
        MenuItem findItem2 = menu.findItem(R.id.send_to_friend);
        if (this.file.vid != 0 && VKAccountManager.getCurrent().getUid() > 0) {
            z = true;
        }
        findItem2.setVisible(z);
        return true;
    }

    @Override // com.vkontakte.android.VKActivity, android.app.Activity
    public final boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case 16908332:
                onBackPressed();
                break;
            case R.id.copy_link /* 2131755023 */:
                copyLink();
                break;
            case R.id.add /* 2131755184 */:
                showAddMenu();
                break;
            case R.id.share /* 2131755721 */:
                share();
                break;
            case R.id.send_to_friend /* 2131756510 */:
                openShareDialog();
                break;
            case R.id.report /* 2131756532 */:
                report();
                break;
            case R.id.open_in_browser /* 2131756538 */:
                openInBrowser();
                break;
            case R.id.like /* 2131756543 */:
                toggleLike();
                break;
            default:
                return super.onOptionsItemSelected(item);
        }
        return true;
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.app.Activity, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        updateConfiguration(newConfig);
        if (this.file != null) {
            bindInfo(this.file);
        }
        ViewUtils.dismissDialogSafety(this.addMenu);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final VideoFile getVideo() {
        return this.file;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final int getVideoIndex() {
        return this.fileIndex;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setBottomPanelVisible(boolean visible) {
        if (this.landscape) {
            this.bottomPanel.setVisibility(8);
        } else {
            this.bottomPanel.setVisibility(visible ? 0 : 4);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void addVideo(final boolean completed) {
        this.adding = true;
        cancelHideUI();
        if (this.addedID == 0) {
            new VideoAdd(this.file.oid, this.file.vid).setCallback(new SimpleCallback<Integer>(this) { // from class: com.vkontakte.android.activities.BaseVideoActivity.4
                @Override // com.vkontakte.android.api.Callback
                public void success(Integer vid) {
                    BaseVideoActivity.this.addedID = vid.intValue();
                    ToastUtils.showToast(BaseVideoActivity.this.getResources().getString(R.string.video_added, BaseVideoActivity.this.file.title));
                    BaseVideoActivity.this.invalidateOptionsMenu();
                    BaseVideoActivity.this.onAddedStateChanged();
                    if (!completed) {
                        BaseVideoActivity.this.hideUIDelayed(1000);
                    }
                    BaseVideoActivity.this.adding = false;
                }

                @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    super.fail(error);
                    if (!completed) {
                        BaseVideoActivity.this.hideUIDelayed(1000);
                    }
                    BaseVideoActivity.this.adding = false;
                }
            }).exec((Context) this);
        } else {
            new VideoDelete(this.file.oid, this.file.vid, VKAccountManager.getCurrent().getUid()).setCallback(new ResultlessCallback(this) { // from class: com.vkontakte.android.activities.BaseVideoActivity.5
                @Override // com.vkontakte.android.api.ResultlessCallback
                public void success() {
                    BaseVideoActivity.this.updateAddedState();
                    BaseVideoActivity.this.invalidateOptionsMenu();
                    BaseVideoActivity.this.onAddedStateChanged();
                    if (!completed) {
                        BaseVideoActivity.this.hideUIDelayed(1000);
                    }
                    BaseVideoActivity.this.adding = false;
                }

                @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse err) {
                    super.fail(err);
                    if (!completed) {
                        BaseVideoActivity.this.hideUIDelayed(1000);
                    }
                    BaseVideoActivity.this.adding = false;
                }
            }).exec((Context) this);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void addToAlbum() {
        VideoAddHelper helper = new VideoAddHelper(this);
        helper.showAlbumsDialog(VKAccountManager.getCurrent().getUid(), this.file);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void toggleLike() {
        Posts.like(this.post, !this.file.liked, this, null);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final boolean postRunnable(Runnable runnable, int delayMillis) {
        return getWindow().getDecorView().postDelayed(runnable, delayMillis);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final boolean cancelRunnable(Runnable runnable) {
        return getWindow().getDecorView().removeCallbacks(runnable);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void displayError(int errCode) {
        if (isResumedImpl()) {
            int stringR = AbsVideoPlayer.getErrorString(errCode);
            if (stringR != 0) {
                new VKAlertDialog.Builder(this).setTitle(R.string.error).setMessage(stringR).setPositiveButton(R.string.ok, BaseVideoActivity$$Lambda$4.lambdaFactory$(this)).setOnCancelListener(BaseVideoActivity$$Lambda$5.lambdaFactory$(this)).show();
            }
            this.errorCode = 0;
            return;
        }
        this.errorCode = errCode;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$displayError$3(DialogInterface dialog, int which) {
        finish();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$displayError$4(DialogInterface dialog) {
        finish();
    }

    private void report() {
        Intent intent = new Intent(this, ReportContentActivity.class);
        intent.putExtra("itemID", this.file.vid);
        intent.putExtra("ownerID", this.file.oid);
        intent.putExtra(ServerKeys.TYPE, "video");
        intent.putExtra("refer", this.referrer);
        startActivity(intent);
    }

    private void openShareDialog() {
        NewsEntry e = new NewsEntry();
        e.attachments = new ArrayList<>();
        e.attachments.add(new VideoAttachment(this.file));
        e.type = 1;
        Intent intent = new Intent(this, RepostActivity.class);
        intent.putExtra(ArgKeys.POST, e);
        intent.putExtra("msg", true);
        startActivity(intent);
    }

    private void copyLink() {
        String ln = "https://vk.com/video" + this.file.oid + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.file.vid;
        ClipboardManager cm = (ClipboardManager) getSystemService("clipboard");
        cm.setText(ln);
        Toast.makeText(this, (int) R.string.link_copied, 0).show();
    }

    private void openInBrowser() {
        String ln = "https://vk.com/video" + this.file.oid + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.file.vid;
        Intent intent = new Intent("android.intent.action.VIEW", Uri.parse(ln));
        intent.addFlags(268435456);
        startActivity(intent);
        overridePendingTransition(17432576, 17432577);
    }

    private void share() {
        Sharing.from(this).withAttachment(Attachments.createInfo(this.file, this.referrer)).withActions(Actions.createInfo(this.file)).share();
    }

    private void openPost() {
        Intent intent = new PostViewFragment.Builder(this.post).setRefer(this.referrer).resetScroll(true).intent(this);
        intent.putExtra("from_video", this.file.toString());
        startActivity(intent);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setVideo(VideoFile video) {
        this.file = video;
        this.post = video.convertToPost();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateAddedState() {
        new VideoIsAdded(VKAccountManager.getCurrent().getUid(), this.file.oid, this.file.vid).setCallback(new SimpleCallback<Boolean>() { // from class: com.vkontakte.android.activities.BaseVideoActivity.6
            @Override // com.vkontakte.android.api.Callback
            public void success(Boolean result) {
                BaseVideoActivity.this.addedID = result.booleanValue() ? 1 : 0;
                BaseVideoActivity.this.invalidateOptionsMenu();
                BaseVideoActivity.this.onAddedStateChanged();
            }
        }).exec((Context) this);
    }

    private void showAddMenu() {
        if (!this.adding) {
            if (this.file.oid == VKAccountManager.getCurrent().getUid()) {
                addToAlbum();
                return;
            }
            if (Build.VERSION.SDK_INT >= 21) {
            }
            this.addMenu = new PopupMenu(this, findViewById(R.id.add), 53);
            this.addMenu.getMenu().add(0, 0, 0, this.addedID == 0 ? R.string.video_add_to_added : R.string.video_remove_from_added);
            this.addMenu.getMenu().add(0, 1, 0, R.string.video_add_to_album);
            this.addMenu.show();
            cancelHideUI();
            hideUIDelayed(getHideDelay());
            this.addMenu.setOnDismissListener(BaseVideoActivity$$Lambda$6.lambdaFactory$(this, null));
            this.addMenu.setOnMenuItemClickListener(BaseVideoActivity$$Lambda$7.lambdaFactory$(this));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$showAddMenu$5(View anchor, PopupMenu popupMenu) {
        hideUIDelayed(1000);
        if (anchor != null) {
            ((ViewGroup) getWindow().getDecorView()).removeView(anchor);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ boolean lambda$showAddMenu$6(MenuItem menuItem) {
        if (menuItem.getItemId() == 1) {
            addToAlbum();
        } else {
            addVideo();
        }
        return true;
    }

    private boolean updateConfiguration(Configuration configuration) {
        boolean z = configuration.orientation == 2;
        this.landscape = z;
        return z;
    }

    private boolean updateConfiguration(Context context) {
        return updateConfiguration(context.getResources().getConfiguration());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void playEmbed() {
        Intent intent = new Intent(this, VideoEmbedPlayerActivity.class);
        intent.putExtras(getIntent());
        startActivity(intent);
        overridePendingTransition(17432576, 17432577);
        finish();
    }

    private void initSystemView() {
        Window window = getWindow();
        if (Build.VERSION.SDK_INT >= 21) {
            window.addFlags(Integer.MIN_VALUE);
            window.setStatusBarColor(0);
            window.setNavigationBarColor(0);
        } else if (Build.VERSION.SDK_INT >= 19) {
            window.addFlags(201326592);
        }
        if (Build.VERSION.SDK_INT < 16) {
            window.addFlags(1024);
        }
        window.getDecorView().setSystemUiVisibility(this.systemUILayoutFlag);
        window.getDecorView().setOnSystemUiVisibilityChangeListener(BaseVideoActivity$$Lambda$8.lambdaFactory$(this, window));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$initSystemView$8(Window window, int visibility) {
        if (this.changingSysUiVisibility) {
            this.changingSysUiVisibility = false;
        } else if ((visibility & 2) == 0) {
            window.getDecorView().post(BaseVideoActivity$$Lambda$9.lambdaFactory$(this));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$null$7() {
        setUIVisibility(true);
        hideUIDelayed(getHideDelay());
    }
}
