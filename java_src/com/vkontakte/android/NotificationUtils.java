package com.vkontakte.android;

import android.app.Notification;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Build;
import android.preference.PreferenceManager;
import android.provider.Settings;
import android.support.annotation.Nullable;
import com.vkontakte.android.api.account.AccountSetSilenceMode;
import com.vkontakte.android.data.LikeInfo;
import com.vkontakte.android.data.UserNotification;
import com.vkontakte.android.data.orm.ConversationInfo;
import java.io.File;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class NotificationUtils {
    private static boolean isFlyme = new File("/system/framework/flyme-framework.jar").exists();

    /* loaded from: classes2.dex */
    public enum Type {
        PrivateMessages("PrivateMessages"),
        ChatMessages("ChatMessages"),
        FriendRequests("FriendRequests"),
        FoundFriends("FoundFriends"),
        Replies("Replies"),
        Comments("Comments"),
        Mentions("Mentions"),
        Likes("Likes"),
        Reposts("Reposts"),
        Posts("Posts"),
        GroupInvites("GroupInvites"),
        UpcomingEvents("UpcomingEvents"),
        PhotoTags("PhotoTags"),
        VideoTags("VideoTags"),
        Games("Games"),
        Gifts("Gifts"),
        BDays("BDays"),
        Default("__"),
        LiveBroadcasts("LiveBroadcasts");
        
        private final String key;

        Type(String key) {
            this.key = key;
        }

        @Override // java.lang.Enum
        public String toString() {
            return this.key;
        }
    }

    public static void syncNotificationSettings(Context ctx, @Nullable ArrayList<ConversationInfo> conversationsInfo) {
        Set<Integer> ids = new HashSet<>();
        if (conversationsInfo != null) {
            Iterator<ConversationInfo> it = conversationsInfo.iterator();
            while (it.hasNext()) {
                ids.add(Integer.valueOf(it.next().peer_id));
            }
        }
        SharedPreferences preferences = ctx.getSharedPreferences("notify", 0);
        Map<String, ?> map = preferences.getAll();
        for (String key : map.keySet()) {
            if (key.matches("dnd[0-9]+")) {
                if (!ids.contains(Integer.valueOf(Integer.parseInt(key.substring(3, key.length()))))) {
                    preferences.edit().remove(key).apply();
                }
            } else if (key.matches("mute[0-9]+") && !ids.contains(Integer.valueOf(Integer.parseInt(key.substring(4, key.length()))))) {
                preferences.edit().remove(key).apply();
            }
        }
        if (conversationsInfo != null) {
            Iterator<ConversationInfo> it2 = conversationsInfo.iterator();
            while (it2.hasNext()) {
                ConversationInfo info = it2.next();
                preferences.edit().putInt("dnd" + info.peer_id, info.disabled_until >= 0 ? info.disabled_until : Integer.MAX_VALUE).putBoolean("mute" + info.peer_id, info.mute).apply();
            }
        }
        VKApplication.context.sendBroadcast(new Intent(LongPollService.ACTION_MUTE_CHANGED), "com.vkontakte.android.permission.ACCESS_DATA");
    }

    public static void setEnableDialogNotification(Context ctx, int id, boolean enable) {
        SharedPreferences.Editor editor = ctx.getSharedPreferences("notify", 0).edit();
        editor.putInt("dnd" + id, enable ? 0 : Integer.MAX_VALUE).apply();
        editor.putBoolean("mute" + id, !enable).apply();
        if (enable) {
            new AccountSetSilenceMode(id, 0, false).persist(null, null).exec();
        } else {
            new AccountSetSilenceMode(id, Integer.MAX_VALUE).persist(null, null).exec();
        }
    }

    public static boolean areNotificationsEnabled(Context context, Type type) {
        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(context);
        return prefs.getBoolean("notifications" + type.key, true);
    }

    public static boolean arePeerNotificationsEnabled(Context context, int peer) {
        SharedPreferences nprefs = context.getSharedPreferences("notify", 0);
        return nprefs.getInt(new StringBuilder().append("dnd").append(peer).toString(), 0) <= ((int) (System.currentTimeMillis() / 1000)) && !nprefs.getBoolean(new StringBuilder().append("mute").append(peer).toString(), false);
    }

    public static void applySettings(Context context, Notification ntf, Type type, boolean isAlert) {
        String ext;
        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(context);
        if (Build.VERSION.SDK_INT >= 21) {
            ntf.color = context.getResources().getColor(R.color.brand_primary);
        }
        if (isFlyme) {
            try {
                Field fld = ntf.getClass().getDeclaredField("mFlymeNotification");
                fld.setAccessible(true);
                Object ext2 = fld.get(ntf);
                Field internalApp = ext2.getClass().getDeclaredField("internalApp");
                internalApp.setAccessible(true);
                internalApp.setInt(ext2, 1);
            } catch (Exception x) {
                Log.w("vk", x);
            }
        }
        if (isAlert) {
            if (prefs.getBoolean("notifyAdvanced" + type.key, false)) {
                ext = type.key;
            } else {
                ext = "";
            }
            if (prefs.getString("notifyRingtone" + ext, Settings.System.DEFAULT_NOTIFICATION_URI.toString()).length() > 0) {
                ntf.sound = Uri.parse(prefs.getString("notifyRingtone" + ext, Settings.System.DEFAULT_NOTIFICATION_URI.toString()));
            }
            if (prefs.getBoolean("notifyVibrate" + ext, true)) {
                ntf.defaults |= 2;
            }
            if (prefs.getBoolean("notifyLED" + ext, true)) {
                ntf.flags |= 1;
                ntf.ledARGB = prefs.getInt("notifyLedColor", -1);
                ntf.ledOnMS = 1000;
                ntf.ledOffMS = 1000;
            }
            if (Build.VERSION.SDK_INT >= 21) {
                ntf.category = "social";
                if (prefs.getBoolean("notifyHeadsUp" + ext, false)) {
                    ntf.priority = 2;
                }
            }
        }
    }

    public static boolean isSoundEnabled(Context context, Type type) {
        String ext;
        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(context);
        if (prefs.getBoolean("notifyAdvanced" + type.key, false)) {
            ext = type.key;
        } else {
            ext = "";
        }
        return prefs.getString(new StringBuilder().append("notifyRingtone").append(ext).toString(), Settings.System.DEFAULT_NOTIFICATION_URI.toString()).length() > 0;
    }

    public static String getNotificationSettings(Context context) {
        JSONObject obj = new JSONObject();
        try {
            obj.put("sdk_open", "on");
            obj.put(UserNotification.LAYOUT_NEWSFEED_NEW_POST, "on");
            obj.put("friend_accepted", "on");
            obj.put("wall_publish", "on");
            obj.put("group_accepted", "on");
            obj.put("money_transfer", "on");
            obj.put("msg", areNotificationsEnabled(context, Type.PrivateMessages) ? "on" : "off");
            obj.put("chat", areNotificationsEnabled(context, Type.ChatMessages) ? "on" : "off");
            obj.put(LikeInfo.DATA_FRIEND, areNotificationsEnabled(context, Type.FriendRequests) ? "on" : "off");
            obj.put("friend_found", areNotificationsEnabled(context, Type.FoundFriends) ? "on" : "off");
            obj.put("reply", areNotificationsEnabled(context, Type.Replies) ? "on" : "off");
            obj.put("comment", areNotificationsEnabled(context, Type.Comments) ? "on" : "off");
            obj.put("mention", areNotificationsEnabled(context, Type.Mentions) ? "on" : "off");
            obj.put("like", areNotificationsEnabled(context, Type.Likes) ? "on" : "off");
            obj.put("repost", areNotificationsEnabled(context, Type.Reposts) ? "on" : "off");
            obj.put("wall_post", areNotificationsEnabled(context, Type.Posts) ? "on" : "off");
            obj.put("group_invite", areNotificationsEnabled(context, Type.GroupInvites) ? "on" : "off");
            obj.put("event_soon", areNotificationsEnabled(context, Type.UpcomingEvents) ? "on" : "off");
            obj.put("tag_photo", areNotificationsEnabled(context, Type.PhotoTags) ? "on" : "off");
            obj.put("tag_video", areNotificationsEnabled(context, Type.VideoTags) ? "on" : "off");
            obj.put("app_request", areNotificationsEnabled(context, Type.Games) ? "on" : "off");
            obj.put("gift", areNotificationsEnabled(context, Type.Gifts) ? "on" : "off");
            obj.put("birthday", areNotificationsEnabled(context, Type.BDays) ? "on" : "off");
            obj.put("live", areNotificationsEnabled(context, Type.LiveBroadcasts) ? "on" : "off");
        } catch (JSONException e) {
        }
        return obj.toString();
    }
}
