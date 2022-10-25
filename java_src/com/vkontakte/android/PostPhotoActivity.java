package com.vkontakte.android;

import android.app.Activity;
import android.app.PendingIntent;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import com.facebook.common.util.UriUtil;
import com.vk.attachpicker.AttachIntent;
import com.vk.attachpicker.PhotoVideoAttachActivity;
import com.vkontakte.android.activities.LogoutReceiver;
import com.vkontakte.android.api.PhotoAlbum;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.fragments.messages.ChatFragment;
import com.vkontakte.android.fragments.messages.DialogsFragment;
import com.vkontakte.android.fragments.news.NewPostFragment;
import com.vkontakte.android.fragments.photos.PhotoAlbumListFragment;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.navigation.Navigate;
import com.vkontakte.android.upload.AlbumPhotoUploadTask;
import com.vkontakte.android.upload.BatchUploadTask;
import com.vkontakte.android.upload.ProfilePhotoUploadTask;
import com.vkontakte.android.upload.Upload;
import com.vkontakte.android.upload.UploadTask;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
/* loaded from: classes2.dex */
public class PostPhotoActivity extends Activity {
    private static final int ALBUM_RESULT = 103;
    private static final int MESSAGE_RESULT = 102;
    private static final int PICKER_RESULT = 101;
    private int aid;
    private ArrayList<String> files;
    private LogoutReceiver logoutReceiver = null;
    private UserProfile msgReceiver;
    private int option;

    @Override // android.app.Activity
    public void onCreate(Bundle b) {
        super.onCreate(b);
        this.logoutReceiver = LogoutReceiver.register(this);
        if (getIntent().hasExtra("option")) {
            this.option = getIntent().getIntExtra("option", 0);
            processOption();
            return;
        }
        startPicker();
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        this.logoutReceiver.unregister();
        super.onDestroy();
    }

    private void processOption() {
        if (this.option == 0 || this.option == 3) {
            startPicker();
        } else if (this.option != 1 && this.option == 2) {
            Bundle args = new Bundle();
            args.putBoolean(ArgKeys.SELECT, true);
            args.putBoolean("select_album", true);
            Navigate.forResult(PhotoAlbumListFragment.class, args, this, 103);
        }
    }

    private void startPicker() {
        Intent intent = new Intent(this, PhotoVideoAttachActivity.class);
        if (!getIntent().hasExtra("option")) {
            ArrayList<String> al = new ArrayList<>();
            al.addAll(Arrays.asList(getString(R.string.share_photo_wall), getString(R.string.share_photo_msg), getString(R.string.share_photo_album)));
            intent.putExtra(AttachIntent.INTENT_ON_COMPLETE_OPTIONS, al);
            ArrayList<String> al2 = new ArrayList<>();
            al2.add(getString(R.string.share_photo_profile));
            intent.putExtra(AttachIntent.INTENT_ON_COMPLETE_OPTIONS_SINGLE, al2);
        }
        intent.putExtra(AttachIntent.INTENT_SELECTION_LIMIT, 10);
        startActivityForResult(intent, 101);
    }

    @Override // android.app.Activity
    public void onActivityResult(int reqCode, int resCode, Intent data) {
        if (reqCode == 101 && resCode == -1) {
            this.files = new ArrayList<>();
            Bundle resultBundle = data.getBundleExtra(AttachIntent.RESULT_ATTACHMENTS);
            if (resultBundle != null) {
                ArrayList<Uri> resultFiles = resultBundle.getParcelableArrayList(AttachIntent.RESULT_FILES);
                if (resultFiles != null) {
                    Iterator<Uri> it = resultFiles.iterator();
                    while (it.hasNext()) {
                        Uri uri = it.next();
                        if (UriUtil.LOCAL_FILE_SCHEME.equals(uri.getScheme()) || UriUtil.LOCAL_CONTENT_SCHEME.equals(uri.getScheme())) {
                            this.files.add(uri.toString());
                        }
                    }
                } else {
                    return;
                }
            }
            if (data.getIntExtra("chosen_option", -1) != -1) {
                this.option = data.getIntExtra("chosen_option", 0);
            }
            if (this.option == 0) {
                new NewPostFragment.Builder().attachPhotos(this.files).uid(getIntent().getIntExtra(ArgKeys.UID, VKAccountManager.getCurrent().getUid())).go(this);
                finish();
            }
            if (this.option == 1) {
                new DialogsFragment.Builder().setSelectMode().forResult(this, 102);
            }
            if (this.option == 2) {
                Bundle args = new Bundle();
                args.putBoolean(ArgKeys.SELECT, true);
                args.putBoolean("select_album", true);
                Navigate.forResult(PhotoAlbumListFragment.class, args, this, 103);
            }
            if (this.option == 3) {
                Upload.start(this, new ProfilePhotoUploadTask(this, this.files.get(0), VKAccountManager.getCurrent().getUid(), true));
                finish();
            }
        } else if (reqCode == 102 && resCode == -1) {
            this.msgReceiver = (UserProfile) data.getParcelableExtra("profile");
            ChatFragment.Builder builder = new ChatFragment.Builder(this.msgReceiver.uid, this.msgReceiver.fullName).setPhotos(this.files);
            if (this.msgReceiver.uid < 2000000000) {
                builder.setPhoto(this.msgReceiver.photo);
            }
            builder.go(this);
            finish();
        } else if (reqCode == 103 && resCode == -1) {
            PhotoAlbum album = (PhotoAlbum) data.getParcelableExtra(ArgKeys.ALBUM);
            ArrayList<UploadTask> tasks = new ArrayList<>();
            Iterator<String> it2 = this.files.iterator();
            while (it2.hasNext()) {
                String file = it2.next();
                tasks.add(new AlbumPhotoUploadTask(this, file, album.id, album.oid, "", false));
            }
            PendingIntent pIntent = PendingIntent.getActivity(this, 0, new Intent("android.intent.action.VIEW", Uri.parse("vkontakte://vk.com/album" + album.oid + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + album.id)), 0);
            Upload.start(this, new BatchUploadTask(this, tasks, getString(R.string.uploading_photo), getString(R.string.photos_upload_ok), getString(R.string.photos_upload_ok_long), pIntent));
            this.aid = album.id;
            finish();
        } else {
            finish();
        }
    }

    @Override // android.app.Activity
    public void onPause() {
        super.onPause();
        AppStateTracker.onActivityPaused();
    }

    @Override // android.app.Activity
    public void onResume() {
        super.onResume();
        AppStateTracker.onActivityResumed(this);
    }
}
