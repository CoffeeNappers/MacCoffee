package com.vkontakte.android;

import android.app.PendingIntent;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.vk.core.util.Screen;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.media.video.VideoEncoderSettings;
import com.vkontakte.android.ui.Font;
import com.vkontakte.android.upload.Upload;
import com.vkontakte.android.upload.VideoUploadTask;
/* loaded from: classes2.dex */
public final class VideoUploadDialog extends AppCompatActivity {
    private static final String EXTRA_OWNER_ID = "ownerId";
    private static final String EXTRA_VIDEO_URI = "videoUri";
    private static final String KEY_DESC = "desc";
    private static final String KEY_TITLE = "title";
    public static final String TAG = VideoUploadDialog.class.getName();
    private static final String URI_VIDEOS = "vkontakte://vk.com/videos";
    EditText descInputView;
    EditText titleInputView;

    public static void show(@NonNull Context context, int ownerId, @NonNull Uri videoUri) {
        Intent intent = new Intent(context, VideoUploadDialog.class);
        intent.putExtra(EXTRA_OWNER_ID, ownerId);
        intent.putExtra(EXTRA_VIDEO_URI, videoUri);
        context.startActivity(intent);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityGingerbread, android.app.Activity
    public void onCreate(@Nullable Bundle savedInstanceState) {
        DialogInterface.OnClickListener onClickListener;
        super.onCreate(savedInstanceState);
        overridePendingTransition(0, 0);
        TextView titleView = new TextView(this);
        titleView.setIncludeFontPadding(false);
        titleView.setText(R.string.share_video_title);
        titleView.setTextSize(1, 20.0f);
        titleView.setTypeface(Font.Medium.typeface);
        titleView.setTextColor(ContextCompat.getColor(this, R.color.gray_title));
        int pad = Screen.dp(24);
        titleView.setPadding(pad, pad, pad, 0);
        LinearLayout contentView = new LinearLayout(this);
        contentView.setOrientation(1);
        contentView.setPadding(pad, Screen.dp(20), pad, pad);
        this.titleInputView = new EditText(this);
        this.titleInputView.setTypeface(Font.Regular.typeface);
        this.titleInputView.setIncludeFontPadding(false);
        this.titleInputView.setHint(R.string.share_video_name);
        this.titleInputView.setMaxLines(1);
        this.titleInputView.setTextSize(1, 16.0f);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-1, -2);
        params.bottomMargin = Screen.dp(8);
        contentView.addView(this.titleInputView, params);
        this.descInputView = new EditText(this);
        this.descInputView.setTypeface(Font.Regular.typeface);
        this.descInputView.setIncludeFontPadding(false);
        this.descInputView.setHint(R.string.share_video_description);
        this.descInputView.setMaxLines(4);
        this.descInputView.setTextSize(1, 16.0f);
        contentView.addView(this.descInputView, new LinearLayout.LayoutParams(-1, -2));
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setCustomTitle(titleView);
        builder.setView(contentView);
        builder.setOnDismissListener(VideoUploadDialog$$Lambda$1.lambdaFactory$(this));
        builder.setPositiveButton(R.string.ok, VideoUploadDialog$$Lambda$2.lambdaFactory$(this));
        onClickListener = VideoUploadDialog$$Lambda$3.instance;
        builder.setNegativeButton(R.string.cancel, onClickListener);
        builder.show();
    }

    public /* synthetic */ void lambda$onCreate$0(DialogInterface dialog) {
        finish();
    }

    public /* synthetic */ void lambda$onCreate$1(DialogInterface dialog, int which) {
        startUploading();
    }

    public static /* synthetic */ void lambda$onCreate$2(DialogInterface dialog, int which) {
    }

    @Override // android.app.Activity
    public void finish() {
        super.finish();
        overridePendingTransition(0, 0);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onSaveInstanceState(@NonNull Bundle outState) {
        outState.putString("title", val(this.titleInputView));
        outState.putString(KEY_DESC, val(this.descInputView));
        super.onSaveInstanceState(outState);
    }

    @Override // android.app.Activity
    protected void onRestoreInstanceState(@NonNull Bundle savedInstanceState) {
        super.onRestoreInstanceState(savedInstanceState);
        val(this.titleInputView, savedInstanceState.getString("title"));
        val(this.descInputView, savedInstanceState.getString(KEY_DESC));
    }

    private void startUploading() {
        int ownerID = getIntent().getIntExtra(EXTRA_OWNER_ID, VKAccountManager.getCurrent().getUid());
        PendingIntent intent = PendingIntent.getActivity(this, 0, new Intent("android.intent.action.VIEW", Uri.parse(URI_VIDEOS + ownerID)), 0);
        VideoUploadTask task = new VideoUploadTask(this, getIntent().getParcelableExtra(EXTRA_VIDEO_URI).toString(), val(this.titleInputView), val(this.descInputView), VideoEncoderSettings.p720, false, ownerID, true);
        task.setDoneNotification(getString(R.string.video_upload_ok), getString(R.string.video_upload_ok_long), intent);
        Upload.start(this, task);
    }

    @NonNull
    private static String val(@NonNull EditText input) {
        return input.getText().toString().trim();
    }

    private static void val(@NonNull EditText input, @Nullable String value) {
        input.setText(value);
    }
}
