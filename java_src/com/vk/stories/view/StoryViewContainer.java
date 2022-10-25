package com.vk.stories.view;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.content.Context;
import android.content.Intent;
import android.graphics.PorterDuff;
import android.media.AudioManager;
import android.os.Handler;
import android.os.Looper;
import android.support.v4.view.ViewPager;
import android.text.TextUtils;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.google.android.exoplayer2.util.MimeTypes;
import com.vk.attachpicker.events.NotificationListener;
import com.vk.attachpicker.util.Utils;
import com.vk.attachpicker.widget.ViewPagerAdapter;
import com.vk.core.util.Screen;
import com.vk.core.util.TimeoutLock;
import com.vk.core.util.ToastUtils;
import com.vk.core.widget.OnSwipeTouchListener;
import com.vk.core.widget.OnTouchDownListener;
import com.vk.core.widget.ViewShower;
import com.vk.imageloader.ImageSize;
import com.vk.imageloader.transform.StoryPreviewPostProcessor;
import com.vk.imageloader.view.VKImageView;
import com.vk.sharing.Sharing;
import com.vk.sharing.action.Actions;
import com.vk.sharing.attachment.Attachments;
import com.vk.stories.StoriesController;
import com.vk.stories.model.GetStoriesResponse;
import com.vk.stories.model.StoriesContainer;
import com.vk.stories.model.StoryEntry;
import com.vk.stories.view.StoryView;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.stories.StoriesGetById;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.fragments.messages.ChatFragment;
import com.vkontakte.android.fragments.messages.DialogsFragment;
import io.reactivex.android.schedulers.AndroidSchedulers;
import java.util.ArrayList;
import java.util.concurrent.TimeUnit;
/* loaded from: classes2.dex */
public class StoryViewContainer extends FrameLayout implements StoryView.StoryViewCallback {
    private static final int MESSAGE_REQUEST_CODE = 77;
    private static final Handler handler = new Handler(Looper.getMainLooper());
    private static final Handler volumeHandler = new Handler(Looper.getMainLooper());
    private final int BACK_AREA_WIDTH;
    private StoriesPagerAdapter adapter;
    private final ControlCallback containerCallback;
    private int currentIdlePagerPosition;
    private int currentPagerState;
    private final boolean enabledSwipeDownToClose;
    private ImageView errorImage;
    private LinearLayout errorMessageView;
    private TextView errorText;
    private final Runnable hideVolumeControl;
    private VKImageView loadingAvatar;
    private VKImageView loadingBackgroundImage;
    private View loadingClose;
    private FrameLayout loadingLayout;
    private ProgressBar loadingProgress;
    private TextView loadingTitle;
    private String messageText;
    private OnSwipeTouchListener onSwipeTouchListener;
    private final String openStory;
    private final int openStoryUid;
    private StoriesViewPager pager;
    private UserProfile recipient;
    private final Runnable showVolumeControl;
    private final StoriesController.SourceType sourceType;
    private ArrayList<StoriesContainer> storiesContainers;
    private final TimeoutLock swipeClickLock;
    private final NotificationListener<StoriesController.StoryUpload> uploadDoneListener;
    private final NotificationListener<StoriesController.StoryUpload> uploadErrorListener;
    private final NotificationListener<StoriesController.StoryUpload> uploadProgressListener;
    private VolumeControlView volumeControlView;
    private ViewShower volumeControlViewShower;

    /* loaded from: classes2.dex */
    public interface ControlCallback {
        void finish();

        boolean noDragGestureInProgress();

        void scrollStoriesListToAuthorId(int i);

        void startForResult(Intent intent, int i);
    }

    /* loaded from: classes2.dex */
    public interface StoryViewCallback {
        void storyView(StoryView storyView);
    }

    public /* synthetic */ void lambda$new$0(int eventType, int eventId, StoriesController.StoryUpload eventArgs) {
        dispatchUploadProgress(eventArgs);
    }

    public /* synthetic */ void lambda$new$1(int eventType, int eventId, StoriesController.StoryUpload eventArgs) {
        dispatchUploadDone(eventArgs);
    }

    public /* synthetic */ void lambda$new$2(int eventType, int eventId, StoriesController.StoryUpload eventArgs) {
        dispatchUploadError(eventArgs);
    }

    public StoryViewContainer(Context context, StoriesController.SourceType sourceType, boolean enabledSwipeDownToClose, ControlCallback containerCallback, ArrayList<StoriesContainer> storiesContainers, int openStoryUid, String openStory) {
        super(context);
        this.BACK_AREA_WIDTH = Screen.dp(88);
        this.swipeClickLock = new TimeoutLock(30L);
        this.showVolumeControl = new Runnable() { // from class: com.vk.stories.view.StoryViewContainer.1
            {
                StoryViewContainer.this = this;
            }

            @Override // java.lang.Runnable
            public void run() {
                StoryViewContainer.this.volumeControlViewShower.show();
            }
        };
        this.hideVolumeControl = new Runnable() { // from class: com.vk.stories.view.StoryViewContainer.2
            {
                StoryViewContainer.this = this;
            }

            @Override // java.lang.Runnable
            public void run() {
                StoryViewContainer.this.volumeControlViewShower.hide(false);
            }
        };
        this.uploadProgressListener = StoryViewContainer$$Lambda$1.lambdaFactory$(this);
        this.uploadDoneListener = StoryViewContainer$$Lambda$2.lambdaFactory$(this);
        this.uploadErrorListener = StoryViewContainer$$Lambda$3.lambdaFactory$(this);
        this.sourceType = sourceType;
        this.enabledSwipeDownToClose = enabledSwipeDownToClose;
        this.containerCallback = containerCallback;
        this.storiesContainers = storiesContainers;
        this.openStoryUid = openStoryUid;
        this.openStory = openStory;
        StoriesController.notificationCenter().addListener(103, this.uploadProgressListener);
        StoriesController.notificationCenter().addListener(102, this.uploadDoneListener);
        StoriesController.notificationCenter().addListener(104, this.uploadErrorListener);
        init();
    }

    private void init() {
        View.OnClickListener onClickListener;
        LayoutInflater.from(getContext()).inflate(R.layout.activity_view_story, this);
        initTouchListener();
        this.adapter = new StoriesPagerAdapter();
        this.pager = (StoriesViewPager) findViewById(R.id.pager);
        this.pager.setAdapter(this.adapter);
        this.pager.setPageTransformer(true, new StoryPageTransformer());
        this.pager.addOnPageChangeListener(new ViewPager.OnPageChangeListener() { // from class: com.vk.stories.view.StoryViewContainer.3
            {
                StoryViewContainer.this = this;
            }

            @Override // android.support.v4.view.ViewPager.OnPageChangeListener
            public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
            }

            @Override // android.support.v4.view.ViewPager.OnPageChangeListener
            public void onPageSelected(int position) {
                StoryViewContainer.this.resetStoryTimers();
            }

            @Override // android.support.v4.view.ViewPager.OnPageChangeListener
            public void onPageScrollStateChanged(int state) {
                StoryViewContainer.this.currentPagerState = state;
                StoryViewContainer.this.hideBackGradient();
                if (state == 1) {
                    StoryViewContainer.this.pager.setScrollDurationFactor(1.0d);
                } else if (state == 0) {
                    StoryViewContainer.this.pager.setScrollDurationFactor(1.5d);
                }
                if (state == 0) {
                    StoryViewContainer.this.containerCallback.scrollStoriesListToAuthorId(((StoriesContainer) StoryViewContainer.this.storiesContainers.get(StoryViewContainer.this.pager.getCurrentItem())).getAuthorId());
                    StoryViewContainer.this.currentIdlePagerPosition = StoryViewContainer.this.pager.getCurrentItem();
                }
                if (state == 0 && !StoryViewContainer.this.containerCallback.noDragGestureInProgress()) {
                    StoryViewContainer.this.playStory();
                } else {
                    StoryViewContainer.this.pauseStory();
                }
            }
        });
        this.volumeControlView = (VolumeControlView) findViewById(R.id.vcv_volume_control_view);
        this.volumeControlViewShower = new ViewShower(this.volumeControlView);
        this.loadingLayout = (FrameLayout) findViewById(R.id.fl_loading_view);
        FrameLayout frameLayout = this.loadingLayout;
        onClickListener = StoryViewContainer$$Lambda$4.instance;
        frameLayout.setOnClickListener(onClickListener);
        this.loadingAvatar = (VKImageView) this.loadingLayout.findViewById(R.id.iv_avatar);
        this.loadingTitle = (TextView) this.loadingLayout.findViewById(R.id.tv_name);
        this.loadingBackgroundImage = (VKImageView) this.loadingLayout.findViewById(R.id.iv_loading_bg);
        this.errorMessageView = (LinearLayout) this.loadingLayout.findViewById(R.id.ll_expired_message);
        this.errorImage = (ImageView) this.errorMessageView.findViewById(R.id.iv_error_image);
        this.errorText = (TextView) this.errorMessageView.findViewById(R.id.tv_error_text);
        this.loadingProgress = (ProgressBar) this.loadingLayout.findViewById(R.id.pb_loading);
        this.loadingProgress.getIndeterminateDrawable().setColorFilter(-1, PorterDuff.Mode.MULTIPLY);
        this.loadingClose = findViewById(R.id.iv_close);
        this.loadingClose.setOnClickListener(StoryViewContainer$$Lambda$5.lambdaFactory$(this));
        if (this.storiesContainers != null) {
            for (int i = 0; i < this.storiesContainers.size(); i++) {
                if (this.storiesContainers.get(i).getAuthorId() == this.openStoryUid) {
                    this.pager.setCurrentItem(i, false);
                    this.currentIdlePagerPosition = i;
                    return;
                }
            }
        } else if (!TextUtils.isEmpty(this.openStory)) {
            this.loadingLayout.setVisibility(0);
            new StoriesGetById(this.openStory).toObservable().delay(500L, TimeUnit.MILLISECONDS).observeOn(AndroidSchedulers.mainThread()).subscribe(StoryViewContainer$$Lambda$6.lambdaFactory$(this), StoryViewContainer$$Lambda$7.lambdaFactory$(this));
        } else {
            this.containerCallback.finish();
        }
    }

    public static /* synthetic */ void lambda$init$3(View view) {
    }

    public /* synthetic */ void lambda$init$4(View view) {
        this.containerCallback.finish();
    }

    public /* synthetic */ void lambda$init$6(Throwable throwable) throws Exception {
        ToastUtils.showToast((int) R.string.story_loading_error);
        this.containerCallback.finish();
    }

    /* renamed from: showStory */
    public void lambda$init$5(GetStoriesResponse result) {
        if (result != null && result.storiesResponse != null) {
            if (result.storiesResponse.size() == 0 || !result.storiesResponse.get(0).hasValidStories()) {
                ToastUtils.showToast((int) R.string.story_deleted);
                this.containerCallback.finish();
                return;
            } else if (result.storiesResponse.get(0).storyEntries.get(0).expired || result.storiesResponse.get(0).storyEntries.get(0).isPrivate) {
                StoriesContainer sc = result.storiesResponse.get(0);
                this.loadingAvatar.load(sc.getAuthorAvatarUrl());
                this.loadingTitle.setText(sc.getAuthorFullName());
                this.loadingBackgroundImage.setVisibility(0);
                this.errorMessageView.setVisibility(0);
                this.loadingProgress.setVisibility(8);
                if (result.storiesResponse.get(0).storyEntries.get(0).expired) {
                    this.errorImage.setImageResource(R.drawable.ic_story_expired_72dp);
                    this.errorText.setText(R.string.story_expired);
                } else {
                    this.errorImage.setImageResource(R.drawable.ic_story_access_denied_72dp);
                    this.errorText.setText(R.string.story_private_error);
                }
                this.loadingBackgroundImage.setPostprocessor(StoryPreviewPostProcessor.INSTANCE_5);
                this.loadingBackgroundImage.load(sc.storyEntries.get(0).getImageSmall(false), ImageSize.BIG);
                View.OnClickListener openProfileListener = StoryViewContainer$$Lambda$8.lambdaFactory$(this, sc);
                this.loadingAvatar.setOnClickListener(openProfileListener);
                this.loadingTitle.setOnClickListener(openProfileListener);
                this.loadingLayout.setOnTouchListener(this.onSwipeTouchListener);
                return;
            } else {
                this.storiesContainers = result.storiesResponse;
                this.adapter.notifyDataSetChanged();
                this.loadingLayout.animate().alpha(0.0f).setListener(new AnimatorListenerAdapter() { // from class: com.vk.stories.view.StoryViewContainer.4
                    {
                        StoryViewContainer.this = this;
                    }

                    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                    public void onAnimationEnd(Animator animation) {
                        StoryViewContainer.this.loadingLayout.setVisibility(8);
                    }
                }).setDuration(225L).start();
                return;
            }
        }
        this.containerCallback.finish();
    }

    public /* synthetic */ void lambda$showStory$7(StoriesContainer sc, View view) {
        new ProfileFragment.Builder(sc.getAuthorId()).go(getContext());
    }

    /* renamed from: com.vk.stories.view.StoryViewContainer$5 */
    /* loaded from: classes2.dex */
    public class AnonymousClass5 implements OnTouchDownListener.DownUpListener {
        AnonymousClass5() {
            StoryViewContainer.this = this$0;
        }

        @Override // com.vk.core.widget.OnTouchDownListener.DownUpListener
        public void onDown(int x, int y) {
            StoryViewContainer.this.pauseStory();
            if (x < StoryViewContainer.this.BACK_AREA_WIDTH) {
                StoryViewContainer.this.showBackGradient();
            }
        }

        @Override // com.vk.core.widget.OnTouchDownListener.DownUpListener
        public void onUp(int x, int y) {
            if (StoryViewContainer.this.currentPagerState == 0 && !StoryViewContainer.this.containerCallback.noDragGestureInProgress()) {
                StoryViewContainer.this.playStory();
            }
            StoryViewContainer.this.hideBackGradient();
        }

        @Override // com.vk.core.widget.OnTouchDownListener.DownUpListener
        public synchronized void onClick(int x, int y) {
            StoryViewCallback storyViewCallback;
            StoryViewCallback storyViewCallback2;
            if (StoryViewContainer.this.currentPagerState == 0 && !StoryViewContainer.this.swipeClickLock.isLocked()) {
                StoryViewContainer.this.swipeClickLock.lock();
                if (x < StoryViewContainer.this.BACK_AREA_WIDTH) {
                    StoryViewContainer storyViewContainer = StoryViewContainer.this;
                    storyViewCallback2 = StoryViewContainer$5$$Lambda$1.instance;
                    storyViewContainer.iterateAllStoryViews(storyViewCallback2);
                } else {
                    StoryViewContainer storyViewContainer2 = StoryViewContainer.this;
                    storyViewCallback = StoryViewContainer$5$$Lambda$2.instance;
                    storyViewContainer2.iterateAllStoryViews(storyViewCallback);
                }
            }
        }
    }

    private void initTouchListener() {
        this.onSwipeTouchListener = new OnSwipeTouchListener(getContext(), new AnonymousClass5());
        this.onSwipeTouchListener.setGestureListener(new OnSwipeTouchListener.OnSwipeGestureListener() { // from class: com.vk.stories.view.StoryViewContainer.6
            {
                StoryViewContainer.this = this;
            }

            @Override // com.vk.core.widget.OnSwipeTouchListener.OnSwipeGestureListener
            public void onSwipeLeft() {
            }

            @Override // com.vk.core.widget.OnSwipeTouchListener.OnSwipeGestureListener
            public void onSwipeTop() {
                if (StoryViewContainer.this.enabledSwipeDownToClose) {
                    StoryViewContainer.this.containerCallback.finish();
                }
            }

            @Override // com.vk.core.widget.OnSwipeTouchListener.OnSwipeGestureListener
            public void onSwipeRight() {
            }

            @Override // com.vk.core.widget.OnSwipeTouchListener.OnSwipeGestureListener
            public void onSwipeBottom() {
                if (StoryViewContainer.this.enabledSwipeDownToClose) {
                    StoryViewContainer.this.containerCallback.finish();
                }
            }
        });
    }

    public void showBackGradient() {
        StoryViewCallback storyViewCallback;
        storyViewCallback = StoryViewContainer$$Lambda$9.instance;
        iterateAllStoryViews(storyViewCallback);
    }

    public void hideBackGradient() {
        StoryViewCallback storyViewCallback;
        storyViewCallback = StoryViewContainer$$Lambda$10.instance;
        iterateAllStoryViews(storyViewCallback);
    }

    public int getCurrentStoryAuthorUid() {
        try {
            return this.storiesContainers.get(getCurrentIdlePagerPosition()).getAuthorId();
        } catch (Exception e) {
            return 0;
        }
    }

    public boolean doDispatchKeyEvent(KeyEvent event) {
        int newVolumeLevel;
        int action = event.getAction();
        int keyCode = event.getKeyCode();
        if (keyCode == 24 || keyCode == 25) {
            try {
                AudioManager am = (AudioManager) getContext().getSystemService(MimeTypes.BASE_TYPE_AUDIO);
                int maxLevel = am.getStreamMaxVolume(3);
                int volumeLevel = am.getStreamVolume(3);
                if (keyCode == 24 && action == 0) {
                    newVolumeLevel = Utils.clamp(volumeLevel + 1, 0, maxLevel);
                } else if (keyCode == 25 && action == 0) {
                    newVolumeLevel = Utils.clamp(volumeLevel - 1, 0, maxLevel);
                } else {
                    newVolumeLevel = volumeLevel;
                }
                float levelNormalized = newVolumeLevel / maxLevel;
                am.setStreamVolume(3, newVolumeLevel, 0);
                this.volumeControlView.setVolumeLevel(levelNormalized);
                volumeHandler.removeCallbacksAndMessages(null);
                volumeHandler.post(this.showVolumeControl);
                volumeHandler.postDelayed(this.hideVolumeControl, 2000L);
            } catch (Exception e) {
            }
            return true;
        }
        return false;
    }

    public void onActivityResult(int reqCode, int resCode, Intent data) {
        if (reqCode == 77 && resCode == -1) {
            this.recipient = (UserProfile) data.getParcelableExtra("profile");
            openNewMessage(this.messageText);
        }
    }

    public void onResume() {
        StoryViewCallback storyViewCallback;
        com.vk.camera.Utils.keepScreenOn(com.vkontakte.android.utils.Utils.castToActivity(getContext()), true);
        resetStoryTimers();
        storyViewCallback = StoryViewContainer$$Lambda$11.instance;
        iterateAllStoryViews(storyViewCallback);
    }

    public void onPause() {
        StoryViewCallback storyViewCallback;
        com.vk.camera.Utils.keepScreenOn(com.vkontakte.android.utils.Utils.castToActivity(getContext()), false);
        storyViewCallback = StoryViewContainer$$Lambda$12.instance;
        iterateAllStoryViews(storyViewCallback);
    }

    public void onDestroy() {
        StoryViewCallback storyViewCallback;
        StoriesController.notificationCenter().removeListener(this.uploadProgressListener);
        StoriesController.notificationCenter().removeListener(this.uploadDoneListener);
        StoriesController.notificationCenter().removeListener(this.uploadErrorListener);
        storyViewCallback = StoryViewContainer$$Lambda$13.instance;
        iterateAllStoryViews(storyViewCallback);
    }

    @Override // com.vk.stories.view.StoryView.StoryViewCallback
    public void finish() {
        this.containerCallback.finish();
    }

    @Override // com.vk.stories.view.StoryView.StoryViewCallback
    public int getCurrentIdlePagerPosition() {
        return this.currentIdlePagerPosition;
    }

    @Override // com.vk.stories.view.StoryView.StoryViewCallback
    public void shareStory(String name, String photo, StoryEntry entry) {
        Sharing.from(getContext()).withAttachment(Attachments.createInfo(name, photo, entry, "stories")).withActions(Actions.createInfoExcludeRepost()).share();
    }

    @Override // com.vk.stories.view.StoryView.StoryViewCallback
    public void prevStory() {
        if (this.pager.getCurrentItem() > 0) {
            this.pager.setCurrentItem(this.pager.getCurrentItem() - 1, true);
            this.pager.lockTouches();
        }
    }

    @Override // com.vk.stories.view.StoryView.StoryViewCallback
    public void nextStory() {
        if (this.pager.getCurrentItem() < this.adapter.getCount() - 1) {
            this.pager.setCurrentItem(this.pager.getCurrentItem() + 1, true);
            this.pager.lockTouches();
            return;
        }
        this.containerCallback.finish();
    }

    @Override // com.vk.stories.view.StoryView.StoryViewCallback
    public void deleteStory(StoriesContainer storiesContainer) {
        if (this.adapter.getCount() == 0 || this.adapter.getCount() == 1) {
            this.containerCallback.finish();
            return;
        }
        this.storiesContainers.remove(0);
        this.adapter.notifyDataSetChanged();
    }

    private void openNewMessage(String text) {
        if (this.recipient == null) {
            this.messageText = text;
            this.containerCallback.startForResult(new DialogsFragment.Builder().setSelectMode().intent(getContext()), 77);
            return;
        }
        ChatFragment.Builder builder = new ChatFragment.Builder(this.recipient.uid, this.recipient.fullName).setPhoto(this.recipient.photo).setText(text);
        builder.go(getContext());
    }

    public void playStory() {
        StoryViewCallback storyViewCallback;
        storyViewCallback = StoryViewContainer$$Lambda$14.instance;
        iterateAllStoryViews(storyViewCallback);
    }

    public void pauseStory() {
        StoryViewCallback storyViewCallback;
        storyViewCallback = StoryViewContainer$$Lambda$15.instance;
        iterateAllStoryViews(storyViewCallback);
    }

    public void resetStoryTimers() {
        StoryViewCallback storyViewCallback;
        storyViewCallback = StoryViewContainer$$Lambda$16.instance;
        iterateAllStoryViews(storyViewCallback);
    }

    private void dispatchUploadProgress(StoriesController.StoryUpload su) {
        iterateAllStoryViews(StoryViewContainer$$Lambda$17.lambdaFactory$(su));
    }

    private void dispatchUploadDone(StoriesController.StoryUpload su) {
        iterateAllStoryViews(StoryViewContainer$$Lambda$18.lambdaFactory$(su));
    }

    private void dispatchUploadError(StoriesController.StoryUpload su) {
        iterateAllStoryViews(StoryViewContainer$$Lambda$19.lambdaFactory$(su));
    }

    public void iterateAllStoryViews(StoryViewCallback storyViewCallback) {
        for (int i = 0; i < this.pager.getChildCount(); i++) {
            StoryView sv = (StoryView) this.pager.getChildAt(i);
            storyViewCallback.storyView(sv);
        }
    }

    /* loaded from: classes2.dex */
    public class StoriesPagerAdapter extends ViewPagerAdapter {
        private StoriesPagerAdapter() {
            StoryViewContainer.this = r1;
        }

        @Override // android.support.v4.view.PagerAdapter
        public int getItemPosition(Object object) {
            return -2;
        }

        @Override // android.support.v4.view.PagerAdapter
        public int getCount() {
            if (StoryViewContainer.this.storiesContainers != null) {
                return StoryViewContainer.this.storiesContainers.size();
            }
            return 0;
        }

        @Override // com.vk.attachpicker.widget.ViewPagerAdapter
        public View getView(int position, ViewPager pager) {
            StoryView storyView = new StoryView(StoryViewContainer.this.getContext(), false, StoryViewContainer.this.sourceType, position, StoryViewContainer.this.onSwipeTouchListener, (StoriesContainer) StoryViewContainer.this.storiesContainers.get(position), StoryViewContainer.this);
            return storyView;
        }
    }
}
