package com.vk.attachpicker;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.Fragment;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import com.vk.attachpicker.SelectionContext;
import com.vk.attachpicker.events.NotificationCenter;
import com.vk.attachpicker.events.NotificationListener;
import com.vk.attachpicker.fragment.GalleryFragment;
import com.vk.attachpicker.util.Utils;
import com.vk.attachpicker.widget.AttachCounterView;
import com.vk.attachpicker.widget.ToolbarContainer;
import com.vkontakte.android.R;
import com.vkontakte.android.VKActivity;
import com.vkontakte.android.utils.L;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class PhotoVideoAttachActivity extends VKActivity implements SelectionContext.SelectionContextProvider, AttachResulter {
    private AttachCounterView attachCounterView;
    private boolean bigPreviews;
    private boolean cameraEnabled;
    private View cancelView;
    private ArrayList<String> completeOptions;
    private ArrayList<String> completeSingleOptions;
    private GalleryFragment galleryFragment;
    private int mediaType;
    private long onlyLastNMilliseconds;
    private boolean preventStyling;
    private int requestCode;
    private boolean singleMode;
    private String staticHeaderTitle;
    private boolean thumb;
    private ToolbarContainer toolbarContainer;
    private final SelectionContext selectionContext = new SelectionContext();
    private boolean preventStylingPhoto = false;
    private boolean preventStylingVideo = false;
    private long videoMaxLengthMs = 0;
    private final NotificationListener<Void> onSelectionUpdate = new NotificationListener<Void>() { // from class: com.vk.attachpicker.PhotoVideoAttachActivity.3
        @Override // com.vk.attachpicker.events.NotificationListener
        public void onNotification(int eventType, int eventId, Void eventArgs) {
            if (PhotoVideoAttachActivity.this.selectionContext.selectionCount() > 0) {
                PhotoVideoAttachActivity.this.attachCounterView.setCount(PhotoVideoAttachActivity.this.selectionContext.selectionCount());
            } else {
                PhotoVideoAttachActivity.this.attachCounterView.setCount(1);
            }
            if (PhotoVideoAttachActivity.this.selectionContext.selectionCount() > 0) {
                PhotoVideoAttachActivity.this.hideCancelButton();
            } else {
                PhotoVideoAttachActivity.this.showCancelButton();
            }
        }
    };

    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityGingerbread, android.app.Activity
    public void onCreate(Bundle savedInstanceState) {
        ArrayList<String> arrayList = null;
        super.onCreate(savedInstanceState);
        Picker.init((Activity) this);
        Utils.setStatusBarColor(getWindow(), -8421505);
        this.preventStyling = getIntent().getBooleanExtra(AttachIntent.INTENT_PREVENT_STYLING, false);
        this.preventStylingPhoto = getIntent().getBooleanExtra(AttachIntent.INTENT_PREVENT_STYLING_PHOTO, false);
        this.preventStylingVideo = getIntent().getBooleanExtra(AttachIntent.INTENT_PREVENT_STYLING_VIDEO, false);
        this.videoMaxLengthMs = getIntent().getLongExtra(AttachIntent.INTENT_VIDEO_MAX_LENGTH_MS, 0L);
        this.staticHeaderTitle = getIntent().getStringExtra(AttachIntent.INTENT_STATIC_HEADER_TITLE);
        this.bigPreviews = getIntent().getBooleanExtra(AttachIntent.INTENT_BIG_PREVIEWS, false);
        this.singleMode = getIntent().getBooleanExtra(AttachIntent.INTENT_SINGLE_MODE, false);
        this.onlyLastNMilliseconds = getIntent().getLongExtra(AttachIntent.INTENT_ONLY_LAST_N_MILLISECONDS, 0L);
        this.cameraEnabled = getIntent().getBooleanExtra(AttachIntent.INTENT_CAMERA_ENABLED, true);
        this.mediaType = getIntent().getIntExtra("media_type", 222);
        this.thumb = getIntent().getBooleanExtra(AttachIntent.INTENT_THUMB, false);
        this.requestCode = getIntent().getIntExtra(AttachIntent.INTENT_REQUEST_CODE, 0);
        this.completeOptions = getIntent().hasExtra(AttachIntent.INTENT_ON_COMPLETE_OPTIONS) ? getIntent().getStringArrayListExtra(AttachIntent.INTENT_ON_COMPLETE_OPTIONS) : null;
        if (getIntent().hasExtra(AttachIntent.INTENT_ON_COMPLETE_OPTIONS_SINGLE)) {
            arrayList = getIntent().getStringArrayListExtra(AttachIntent.INTENT_ON_COMPLETE_OPTIONS_SINGLE);
        }
        this.completeSingleOptions = arrayList;
        this.selectionContext.setLimit(getIntent().getIntExtra(AttachIntent.INTENT_SELECTION_LIMIT, 10));
        this.selectionContext.setRequestCode(this.requestCode);
        setContentView(R.layout.picker_activity_photo_video_attach);
        this.toolbarContainer = (ToolbarContainer) findViewById(R.id.toolbar_container);
        this.attachCounterView = (AttachCounterView) findViewById(R.id.acv_bottom_panel_counter);
        this.cancelView = findViewById(R.id.tv_bottom_panel_cancel);
        this.attachCounterView.setOnClickListener(PhotoVideoAttachActivity$$Lambda$1.lambdaFactory$(this));
        this.cancelView.setOnClickListener(PhotoVideoAttachActivity$$Lambda$2.lambdaFactory$(this));
        Bundle args = new Bundle();
        args.putBoolean(AttachIntent.INTENT_PREVENT_STYLING, this.preventStyling);
        args.putBoolean(AttachIntent.INTENT_PREVENT_STYLING_PHOTO, this.preventStylingPhoto);
        args.putBoolean(AttachIntent.INTENT_PREVENT_STYLING_VIDEO, this.preventStylingVideo);
        args.putLong(AttachIntent.INTENT_VIDEO_MAX_LENGTH_MS, this.videoMaxLengthMs);
        args.putString(AttachIntent.INTENT_STATIC_HEADER_TITLE, this.staticHeaderTitle);
        args.putBoolean(AttachIntent.INTENT_BIG_PREVIEWS, this.bigPreviews);
        args.putLong(AttachIntent.INTENT_ONLY_LAST_N_MILLISECONDS, this.onlyLastNMilliseconds);
        args.putBoolean(AttachIntent.INTENT_SINGLE_MODE, this.singleMode);
        args.putBoolean(AttachIntent.INTENT_CAMERA_ENABLED, this.cameraEnabled);
        args.putInt("media_type", this.mediaType);
        args.putBoolean(AttachIntent.INTENT_THUMB, this.thumb);
        this.galleryFragment = new GalleryFragment();
        this.galleryFragment.setArguments(args);
        this.galleryFragment.setStaticHeaderTitle(this.staticHeaderTitle);
        this.toolbarContainer.addView(this.galleryFragment.provideToolbar(this));
        showFragment(this.galleryFragment);
        NotificationCenter.getInstance().addListener(1, this.onSelectionUpdate);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreate$0(View v) {
        setResultAndFinish(this.selectionContext.getPackedSelection());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreate$1(View v) {
        finish();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onDestroy() {
        super.onDestroy();
        NotificationCenter.getInstance().removeListener(this.onSelectionUpdate);
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onBackPressed() {
        if (this.selectionContext != null && this.selectionContext.selectionCount() > 0) {
            this.selectionContext.clear();
        } else {
            super.onBackPressed();
        }
    }

    private void showFragment(Fragment fr2) {
        try {
            getFragmentManager().beginTransaction().replace(R.id.fl_container, fr2).commitAllowingStateLoss();
        } catch (Exception e) {
            L.e(e, "PhotoVideoAttachActivity");
        }
    }

    @Override // com.vk.attachpicker.SelectionContext.SelectionContextProvider
    public SelectionContext getSelectionContext() {
        return this.selectionContext;
    }

    @Override // com.vk.attachpicker.AttachResulter
    public void setResultAndFinish(Intent result) {
        if (result == null) {
            setResult(0);
            finish();
        } else if (getCompleteOptionsSize() > 0) {
            showOptions(result);
        } else {
            setResult(-1, result);
            finish();
        }
    }

    private void showOptions(final Intent result) {
        CharSequence[] options = getCompleteOptions();
        if (options == null || options.length == 0) {
            finishActivity(-1);
            return;
        }
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setTitle(getResources().getQuantityString(R.plurals.picker_share_photo_plural, this.selectionContext.selectionCount()));
        builder.setItems(options, new DialogInterface.OnClickListener() { // from class: com.vk.attachpicker.PhotoVideoAttachActivity.1
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int i) {
                result.putExtra("chosen_option", i);
                PhotoVideoAttachActivity.this.setResult(-1, result);
                PhotoVideoAttachActivity.this.finish();
            }
        });
        builder.create().show();
    }

    public int getCompleteOptionsSize() {
        if (this.completeOptions == null || this.singleMode) {
            return 0;
        }
        return this.completeOptions.size();
    }

    public CharSequence[] getCompleteOptions() {
        int i = 0;
        if (this.completeOptions == null && this.completeSingleOptions == null) {
            return null;
        }
        boolean useOptions = this.completeOptions != null && !this.singleMode;
        boolean useSingleOptions = this.completeSingleOptions != null && (this.singleMode || this.selectionContext.selectionCount() <= 1);
        int size = useOptions ? this.completeOptions.size() : 0;
        if (useSingleOptions) {
            i = this.completeSingleOptions.size();
        }
        CharSequence[] sequences = new CharSequence[size + i];
        if (sequences.length != 0) {
            int j = 0;
            if (useOptions) {
                int i2 = 0;
                while (i2 < this.completeOptions.size()) {
                    sequences[j] = this.completeOptions.get(i2);
                    i2++;
                    j++;
                }
            }
            if (useSingleOptions) {
                int i3 = 0;
                while (i3 < this.completeSingleOptions.size()) {
                    sequences[j] = this.completeSingleOptions.get(i3);
                    i3++;
                    j++;
                }
                return sequences;
            }
            return sequences;
        }
        return sequences;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showCancelButton() {
        this.cancelView.setVisibility(0);
        this.cancelView.animate().alpha(1.0f).setListener(null).setDuration(200L).start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void hideCancelButton() {
        this.cancelView.animate().alpha(0.0f).setListener(new AnimatorListenerAdapter() { // from class: com.vk.attachpicker.PhotoVideoAttachActivity.2
            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                PhotoVideoAttachActivity.this.cancelView.setVisibility(8);
            }
        }).setDuration(200L).start();
    }
}
