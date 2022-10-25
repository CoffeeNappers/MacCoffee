package com.vkontakte.android;

import android.app.NotificationManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.friends.FriendsAdd;
import com.vkontakte.android.api.friends.FriendsDelete;
import com.vkontakte.android.api.groups.GroupsJoin;
import com.vkontakte.android.api.groups.GroupsLeave;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.data.Groups;
import com.vkontakte.android.fragments.AuthCheckFragment;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.utils.XSRFTokenUtil;
/* loaded from: classes2.dex */
public class NotificationButtonsReceiver extends BroadcastReceiver {
    public static final String ACTION_ACCEPT_FRIEND = "com.vkontakte.android.ACCEPT_FRIEND";
    public static final String ACTION_ACCEPT_GROUP = "com.vkontakte.android.ACCEPT_GROUP";
    public static final String ACTION_DECLINE_FRIEND = "com.vkontakte.android.DECLINE_FRIEND";
    public static final String ACTION_DECLINE_GROUP = "com.vkontakte.android.DECLINE_GROUP";

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        if (ACTION_ACCEPT_FRIEND.equals(intent.getAction())) {
            NotificationManager nm = (NotificationManager) context.getSystemService("notification");
            nm.cancel(intent.getIntExtra("notifyId", GCMBroadcastReceiver.ID_FRIEND_NOTIFICATION));
            int uid = intent.getIntExtra(ArgKeys.UID, 0);
            if (XSRFTokenUtil.verifyToken(intent.getStringExtra(AuthCheckFragment.KEY_TOKEN), uid + "")) {
                new FriendsAdd(uid, "").setCallback(new SimpleCallback<Integer>(null) { // from class: com.vkontakte.android.NotificationButtonsReceiver.1
                    @Override // com.vkontakte.android.api.Callback
                    public void success(Integer result) {
                        Friends.reload(true);
                    }
                }).persist(null, null).exec();
            } else {
                return;
            }
        }
        if (ACTION_DECLINE_FRIEND.equals(intent.getAction())) {
            NotificationManager nm2 = (NotificationManager) context.getSystemService("notification");
            nm2.cancel(intent.getIntExtra("notifyId", GCMBroadcastReceiver.ID_FRIEND_NOTIFICATION));
            int uid2 = intent.getIntExtra(ArgKeys.UID, 0);
            if (XSRFTokenUtil.verifyToken(intent.getStringExtra(AuthCheckFragment.KEY_TOKEN), uid2 + "")) {
                new FriendsDelete(uid2).setCallback(new SimpleCallback<Integer>(null) { // from class: com.vkontakte.android.NotificationButtonsReceiver.2
                    @Override // com.vkontakte.android.api.Callback
                    public void success(Integer result) {
                        Friends.reload(true);
                    }
                }).persist(null, null).exec();
            } else {
                return;
            }
        }
        if (ACTION_ACCEPT_GROUP.equals(intent.getAction())) {
            NotificationManager nm3 = (NotificationManager) context.getSystemService("notification");
            nm3.cancel(intent.getIntExtra("notifyId", GCMBroadcastReceiver.ID_GROUP_INVITE_NOTIFICATION));
            int uid3 = intent.getIntExtra("gid", 0);
            if (XSRFTokenUtil.verifyToken(intent.getStringExtra(AuthCheckFragment.KEY_TOKEN), (-uid3) + "")) {
                new GroupsJoin(uid3, false).setCallback(new ResultlessCallback(null) { // from class: com.vkontakte.android.NotificationButtonsReceiver.3
                    @Override // com.vkontakte.android.api.ResultlessCallback
                    public void success() {
                        Groups.reload(true);
                    }
                }).persist(null, null).exec();
            } else {
                return;
            }
        }
        if (ACTION_DECLINE_GROUP.equals(intent.getAction())) {
            NotificationManager nm4 = (NotificationManager) context.getSystemService("notification");
            nm4.cancel(intent.getIntExtra("notifyId", GCMBroadcastReceiver.ID_GROUP_INVITE_NOTIFICATION));
            int uid4 = intent.getIntExtra("gid", 0);
            if (XSRFTokenUtil.verifyToken(intent.getStringExtra(AuthCheckFragment.KEY_TOKEN), (-uid4) + "")) {
                new GroupsLeave(uid4).setCallback(new ResultlessCallback(null) { // from class: com.vkontakte.android.NotificationButtonsReceiver.4
                    @Override // com.vkontakte.android.api.ResultlessCallback
                    public void success() {
                        Groups.reload(true);
                    }
                }).persist(null, null).exec();
            }
        }
    }
}
