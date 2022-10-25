package com.vkontakte.android.sdk;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import com.vkontakte.android.AuthActivity;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKActivity;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.apps.SDKAppSendRequest;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.fragments.gifts.ProfileGiftsFragment;
import com.vkontakte.android.fragments.messages.ChatFragment;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.sdk.SDKInviteDialog;
import java.util.ArrayList;
/* loaded from: classes3.dex */
public class SDKInviteActivity extends VKActivity implements SDKInviteDialog.Listener {
    static final int REQUEST_AUTH = 100;
    static final int REQUEST_PICK_FRIEND = 42;
    private int mAppId;
    private ArrayList<Integer> mIds;
    private boolean mInviteSent = false;
    private CharSequence mLink;
    private CharSequence mMessage;
    private CharSequence mPhoto;
    private UserProfile mSelectedProfile;

    /* loaded from: classes3.dex */
    static class Extra {
        static final String APP_ID = "com.vkontakte.android.sdk.extra_app_id";
        static final String IDS = "com.vkontakte.android.sdk.extra_ids";
        static final String LINK = "com.vkontakte.android.sdk.extra_link";
        static final String MESSAGE = "com.vkontakte.android.sdk.extra_message";
        static final String MESSAGE_ID = "com.vkontakte.android.sdk.extra_mid";
        static final String PHOTO = "com.vkontakte.android.sdk.extra_photo";
        static final String USER_ID = "com.vkontakte.android.sdk.extra_user_id";

        Extra() {
        }
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityGingerbread, android.app.Activity
    public void onCreate(Bundle b) {
        super.onCreate(b);
        this.mIds = getIntent().getIntegerArrayListExtra("com.vkontakte.android.sdk.extra_ids");
        this.mMessage = getIntent().getCharSequenceExtra("com.vkontakte.android.sdk.extra_message");
        this.mPhoto = getIntent().getCharSequenceExtra("com.vkontakte.android.sdk.extra_photo");
        this.mLink = getIntent().getCharSequenceExtra("com.vkontakte.android.sdk.extra_link");
        this.mAppId = getIntent().getIntExtra("com.vkontakte.android.sdk.extra_app_id", 0);
        if (this.mIds == null) {
            setResult(0);
            finish();
        } else if (VKAccountManager.getCurrent().isReal()) {
            if (this.mSelectedProfile == null) {
                startFriendPickFragment(this.mIds);
            } else {
                startChatFragment(this.mSelectedProfile);
            }
        } else {
            startActivityForResult(new Intent(this, AuthActivity.class), 100);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == 42) {
            if (resultCode == -1) {
                this.mSelectedProfile = (UserProfile) data.getParcelableExtra(ProfileGiftsFragment.Extra.User);
                startChatFragment(this.mSelectedProfile);
                return;
            }
            finish();
        } else if (requestCode == 100) {
            if (resultCode == -1) {
                startFriendPickFragment(this.mIds);
                return;
            }
            setResult(0);
            finish();
        }
    }

    private void startFriendPickFragment(ArrayList<Integer> ids) {
        Bundle args = new Bundle();
        args.putBoolean(ArgKeys.SELECT, true);
        args.putString("title", getString(R.string.sdk_invite_dialog_title));
        args.putBoolean(ArgKeys.GLOBAL_SEARCH, false);
        args.putInt(ArgKeys.UID, VKAccountManager.getCurrent().getUid());
        args.putIntegerArrayList("com.vkontakte.android.sdk.extra_ids", ids);
        Intent intent = new Intent(this, SDKFriendPickerActivity.class);
        intent.putExtra("args", args);
        startActivityForResult(intent, 42);
    }

    private void startChatFragment(UserProfile profile) {
        Bundle args = new Bundle();
        args.putInt("id", profile.uid);
        args.putCharSequence("title", profile.fullName);
        if (profile.uid < 2000000000) {
            args.putCharSequence("photo", profile.photo);
        }
        ChatFragment chatFragment = new ChatFragment();
        chatFragment.setArguments(args);
        getFragmentManager().beginTransaction().replace(16908290, chatFragment).commit();
        if (!this.mInviteSent) {
            showInviteDialog();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showInviteDialog() {
        SDKInviteDialog dialog = SDKInviteDialog.newInstance(this.mMessage, this.mLink, this.mPhoto);
        dialog.show(getFragmentManager(), (String) null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showResendDialog() {
        DialogInterface.OnClickListener l = new DialogInterface.OnClickListener() { // from class: com.vkontakte.android.sdk.SDKInviteActivity.1
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int which) {
                if (which == -1) {
                    SDKInviteActivity.this.showInviteDialog();
                }
                dialogInterface.cancel();
            }
        };
        new AlertDialog.Builder(this).setTitle(R.string.error).setMessage(R.string.sdk_invite_error_message).setPositiveButton(R.string.ok, l).setNegativeButton(R.string.cancel, l).show();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showExitDialog(final int mid, final int uid) {
        DialogInterface.OnClickListener l = new DialogInterface.OnClickListener() { // from class: com.vkontakte.android.sdk.SDKInviteActivity.2
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int which) {
                dialogInterface.cancel();
                if (which == -2) {
                    Intent result = new Intent();
                    result.putExtra("com.vkontakte.android.sdk.extra_mid", mid);
                    result.putExtra("com.vkontakte.android.sdk.extra_user_id", uid);
                    SDKInviteActivity.this.setResult(-1, result);
                    SDKInviteActivity.this.finish();
                }
            }
        };
        new AlertDialog.Builder(this).setTitle(R.string.sdk_invite_success_title).setMessage(R.string.sdk_invite_success_message).setNegativeButton(R.string.sdk_invite_success_negative, l).show();
    }

    private void sendInvite(CharSequence text, CharSequence photo, CharSequence link) {
        final int uid = this.mSelectedProfile.uid;
        new SDKAppSendRequest(uid, text.toString() + '\n' + link.toString(), photo.toString(), this.mAppId).setCallback(new Callback<Integer>() { // from class: com.vkontakte.android.sdk.SDKInviteActivity.3
            @Override // com.vkontakte.android.api.Callback
            public void success(Integer mid) {
                SDKInviteActivity.this.mInviteSent = true;
                SDKInviteActivity.this.showExitDialog(mid.intValue(), uid);
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                SDKInviteActivity.this.showResendDialog();
            }
        }).wrapProgress(this).exec((Context) this);
    }

    @Override // com.vkontakte.android.sdk.SDKInviteDialog.Listener
    public void onInviteSent(CharSequence message, CharSequence photoAttachment, CharSequence link) {
        sendInvite(message, photoAttachment, link);
    }

    @Override // com.vkontakte.android.sdk.SDKInviteDialog.Listener
    public void onInviteCanceled() {
        startFriendPickFragment(this.mIds);
    }
}
