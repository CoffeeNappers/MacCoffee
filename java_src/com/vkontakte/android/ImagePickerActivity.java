package com.vkontakte.android;

import android.app.Activity;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.support.v4.util.Pair;
import com.facebook.common.util.UriUtil;
import com.vk.attachpicker.AttachIntent;
import com.vk.attachpicker.PhotoEditorActivity;
import com.vk.attachpicker.PhotoVideoAttachActivity;
import com.vk.attachpicker.Picker;
import com.vk.attachpicker.util.CameraUtils;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.activities.LogoutReceiver;
import com.vkontakte.android.attachments.PhotoAttachment;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.PhotosFragment;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.navigation.Navigate;
import io.reactivex.annotations.SchedulerSupport;
import java.io.File;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class ImagePickerActivity extends Activity {
    private static final int ALBUM_RESULT = 51;
    private static final int GALLERY_RESULT = 50;
    private static final Handler handler = new Handler(Looper.getMainLooper());
    private boolean crop = false;
    private boolean forceThumb = false;
    private LogoutReceiver logoutReceiver = null;

    @Override // android.app.Activity
    public void onCreate(Bundle b) {
        super.onCreate(b);
        this.logoutReceiver = LogoutReceiver.register(this);
        overridePendingTransition(0, 0);
        this.crop = getIntent().getBooleanExtra("crop", false);
        this.forceThumb = getIntent().getBooleanExtra(AttachIntent.INTENT_THUMB, false);
        ArrayList<String> items = new ArrayList<>();
        ArrayList<String> acts = new ArrayList<>();
        items.add(getResources().getString(R.string.add_photo_gallery));
        acts.add("g");
        items.add(getResources().getString(R.string.add_photo_camera));
        acts.add("c");
        if (getIntent().getBooleanExtra("allow_album", true)) {
            items.add(getResources().getString(R.string.add_photo_from_album));
            acts.add("a");
        }
        if (getIntent().hasExtra(SchedulerSupport.CUSTOM)) {
            items.addAll(getIntent().getStringArrayListExtra(SchedulerSupport.CUSTOM));
        }
        if (getIntent().getIntExtra(ServerKeys.TYPE, -1) == 0) {
            dispatchTakePictureIntent();
        } else if (getIntent().getIntExtra(ServerKeys.TYPE, -1) == 1) {
            startGallery();
        } else {
            new VKAlertDialog.Builder(this).setTitle(R.string.attach_photo).setItems((CharSequence[]) items.toArray(new String[items.size()]), ImagePickerActivity$$Lambda$1.lambdaFactory$(this, acts)).setOnCancelListener(ImagePickerActivity$$Lambda$2.lambdaFactory$(this)).show();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreate$0(ArrayList acts, DialogInterface dialog, int which) {
        if (which < acts.size()) {
            String a = (String) acts.get(which);
            if ("g".equals(a)) {
                startGallery();
                return;
            } else if ("c".equals(a)) {
                dispatchTakePictureIntent();
                return;
            } else if ("a".equals(a)) {
                startAlbum();
                return;
            } else {
                return;
            }
        }
        customSelected(which - 2);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreate$1(DialogInterface dialog) {
        finish();
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        this.logoutReceiver.unregister();
        super.onDestroy();
    }

    private void dispatchTakePictureIntent() {
        Intent takePictureIntent = new Intent("android.media.action.IMAGE_CAPTURE");
        if (takePictureIntent.resolveActivity(getPackageManager()) != null) {
            Pair<Integer, File> request = CameraUtils.getCameraRequestData(false);
            takePictureIntent.putExtra("output", Uri.fromFile(request.second));
            startActivityForResult(takePictureIntent, request.first.intValue());
        }
    }

    private void startGallery() {
        Intent intent = new Intent(this, PhotoVideoAttachActivity.class);
        intent.putExtra(AttachIntent.INTENT_SELECTION_LIMIT, getIntent().getIntExtra(ArgKeys.LIMIT, 100));
        if (getIntent().getIntExtra(ArgKeys.LIMIT, 0) == 1) {
            intent.putExtra(AttachIntent.INTENT_SINGLE_MODE, true);
        }
        if (intent.getBooleanExtra("no_thumbs", false)) {
            intent.putExtra("no_thumbs", true);
        }
        if (this.forceThumb) {
            intent.putExtra(AttachIntent.INTENT_THUMB, true);
        }
        startActivityForResult(intent, 50);
    }

    private void startAlbum() {
        Bundle args = new Bundle();
        args.putBoolean(ArgKeys.SELECT, true);
        args.putBoolean("need_system", true);
        Navigate.forResult(PhotosFragment.class, args, this, 51);
    }

    private void customSelected(int idx) {
        Intent intent = new Intent();
        intent.putExtra("option", idx);
        setResult(1, intent);
        finish();
    }

    @Override // android.app.Activity
    public void onActivityResult(int reqCode, int result, Intent data) {
        if (result == -1) {
            if (reqCode == 50 && data != null && data.hasExtra(AttachIntent.RESULT_ATTACHMENTS)) {
                Bundle imagesResult = data.getBundleExtra(AttachIntent.RESULT_ATTACHMENTS);
                ArrayList<String> files = new ArrayList<>();
                if (imagesResult.containsKey(AttachIntent.RESULT_FILES) && imagesResult.containsKey(AttachIntent.RESULT_VIDEO_FLAGS)) {
                    ArrayList<Uri> uris = imagesResult.getParcelableArrayList(AttachIntent.RESULT_FILES);
                    boolean[] videoFlags = imagesResult.getBooleanArray(AttachIntent.RESULT_VIDEO_FLAGS);
                    for (int i = 0; i < videoFlags.length; i++) {
                        Uri u = uris.get(i);
                        if (!videoFlags[i]) {
                            files.add(u.toString());
                        }
                    }
                }
                Intent res = new Intent();
                if (files.size() == 1) {
                    res.putExtra(UriUtil.LOCAL_FILE_SCHEME, files.get(0));
                } else {
                    res.putExtra("files", files);
                }
                if (this.forceThumb) {
                    res.putExtra("cropLeft", data.getFloatExtra("cropLeft", 0.0f));
                    res.putExtra("cropTop", data.getFloatExtra("cropTop", 0.0f));
                    res.putExtra("cropRight", data.getFloatExtra("cropRight", 0.0f));
                    res.putExtra("cropBottom", data.getFloatExtra("cropBottom", 0.0f));
                }
                setResult(-1, res);
                finish();
            }
            if (CameraUtils.isRequestValid(reqCode)) {
                File file = CameraUtils.getFileById(reqCode);
                if (file != null) {
                    CameraUtils.addMediaToGallery(Picker.getContext(), file, null);
                    Intent editorIntent = new Intent(this, PhotoEditorActivity.class);
                    editorIntent.putExtra(UriUtil.LOCAL_FILE_SCHEME, file);
                    editorIntent.putExtra(AttachIntent.INTENT_THUMB, this.forceThumb);
                    startActivityForResult(editorIntent, 50);
                } else {
                    finish();
                }
            }
            if (reqCode == 51) {
                Photo photo = (Photo) data.getParcelableExtra("photo");
                Intent intent = new Intent();
                intent.putExtra("attachment", new PhotoAttachment(photo));
                setResult(-1, intent);
                finish();
                return;
            }
            return;
        }
        setResult(0);
        finish();
    }
}
