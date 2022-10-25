package com.vkontakte.android;

import android.app.Activity;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.media.SoundPool;
import android.net.Uri;
import android.os.Build;
import android.os.IBinder;
import android.preference.PreferenceManager;
import android.provider.Settings;
import android.support.annotation.Keep;
import android.support.annotation.Nullable;
import android.support.v4.app.NotificationCompat;
import android.support.v4.app.RemoteInput;
import android.text.TextUtils;
import android.util.SparseArray;
import com.facebook.GraphRequest;
import com.facebook.internal.NativeProtocol;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vk.core.network.Network;
import com.vk.core.util.RxUtil;
import com.vk.imageloader.AvatarDataSource;
import com.vk.imageloader.VKImageLoader;
import com.vk.media.camera.CameraUtilsEffects;
import com.vkontakte.android.NotificationUtils;
import com.vkontakte.android.api.APIController;
import com.vkontakte.android.api.APIUtils;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.account.AccountGetPingUrl;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.attachments.GiftAttachment;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.auth.VKAuth;
import com.vkontakte.android.background.WorkerThread;
import com.vkontakte.android.cache.AddMessageAction;
import com.vkontakte.android.cache.Cache;
import com.vkontakte.android.cache.DeleteMessageAction;
import com.vkontakte.android.cache.MessagesAction;
import com.vkontakte.android.cache.ModifyMessageFlagsAction;
import com.vkontakte.android.cache.UpdateMessageAction;
import com.vkontakte.android.data.Analytics;
import com.vkontakte.android.data.BenchmarkTracker;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.data.Messages;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.orm.ConversationInfo;
import com.vkontakte.android.fragments.AuthCheckFragment;
import com.vkontakte.android.fragments.gifts.ProfileGiftsFragment;
import com.vkontakte.android.fragments.messages.ChatFragment;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.utils.L;
import com.vkontakte.android.utils.Utils;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.Set;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.Semaphore;
import java.util.concurrent.TimeUnit;
import okhttp3.Interceptor;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;
/* loaded from: classes2.dex */
public class LongPollService extends Service implements Runnable {
    public static final String ACTION_CHAT_CHANGED = "com.vkontakte.android.CHAT_CHANGED";
    public static final String ACTION_COMMUNITY_MESSAGES_BLOCK_CHANGED = "com.vkontakte.android.COMMUNITY_MESSAGES_BLOCK_CHANGED";
    public static final String ACTION_COUNTERS_UPDATED = "com.vkontakte.android.COUNTERS_UPDATED";
    public static final String ACTION_DIALOG_CHANGED = "com.vkontakte.android.DIALOG_CHANGED";
    public static final String ACTION_MESSAGE_DELETED = "com.vkontakte.android.MESSAGE_DELETED";
    public static final String ACTION_MESSAGE_RSTATE_CHANGED = "com.vkontakte.android.MESSAGE_RSTATE_CHANGED";
    public static final String ACTION_MUTE_CHANGED = "com.vkontakte.android.MUTE_CHANGED";
    public static final String ACTION_NEW_MESSAGE = "com.vkontakte.android.NEW_MESSAGE";
    public static final String ACTION_REFRESH_DIALOGS_LIST = "com.vkontakte.android.REFRESH_DIALOGS";
    public static final String ACTION_STATE_CHANGED = "com.vkontakte.android.STATE_CHANGED";
    public static final String ACTION_TYPING = "com.vkontakte.android.TYPING";
    public static final String ACTION_UPDATE_MESSAGE = "com.vkontakte.android.UPDATE_MESSAGE";
    public static final String ACTION_USER_PRESENCE = "com.vkontakte.android.USER_PRESENCE";
    public static final String ACTION_VOIP_HANGUP = "com.vkontakte.android.VOIP_HANGUP";
    private static final int EVENT_CHAT_CHANGED = 51;
    private static final int EVENT_CHAT_TYPING = 62;
    private static final int EVENT_FRIEND_OFFLINE = 9;
    private static final int EVENT_FRIEND_ONLINE = 8;
    private static final int EVENT_MSG_ADD = 4;
    private static final int EVENT_MSG_ADD_EXTENDED = 101;
    private static final int EVENT_MSG_DELETE = 0;
    private static final int EVENT_MSG_FLAG_ADD = 2;
    private static final int EVENT_MSG_FLAG_CLEAR = 3;
    private static final int EVENT_MSG_FLAG_REPLACE = 1;
    private static final int EVENT_MSG_IN_READ_UPTO = 6;
    private static final int EVENT_MSG_OUT_READ_UPTO = 7;
    private static final int EVENT_MSG_UPDATE = 5;
    private static final int EVENT_NOTIFY_SETTINGS = 114;
    private static final int EVENT_UPDATE_COUNTER = 80;
    private static final int EVENT_USER_TYPING = 61;
    private static final int EVENT_VOIP_HANGUP = 112;
    private static final int EVENT_VOIP_INCOMING = 110;
    private static final int EVENT_VOIP_REPLIED = 111;
    public static final String EXTRA_MESSAGE = "message";
    public static final String EXTRA_MSG_ID = "msg_id";
    public static final String EXTRA_PEER_ID = "peer_id";
    public static final String EXTRA_READ_STATE = "read_state";
    public static final int INTRO_IMPORT_FRIENDS = 1;
    public static final int INTRO_SUGGEST_GROUPS = 2;
    public static final int MSG_CHAT = 16;
    public static final int MSG_DELETED = 128;
    public static final int MSG_FIXED = 256;
    public static final int MSG_FRIENDS = 32;
    public static final int MSG_IMPORTANT = 8;
    public static final int MSG_MEDIA = 512;
    public static final int MSG_OUTBOX = 2;
    public static final int MSG_REPLIED = 4;
    public static final int MSG_SPAM = 64;
    public static final int MSG_UNREAD = 1;
    public static final int NOTIFY_ID_MESSAGE = 10;
    public static final int ONLINE_TYPE_ANDROID = 4;
    public static final int ONLINE_TYPE_DEFAULT = 7;
    public static final int ONLINE_TYPE_IPAD = 3;
    public static final int ONLINE_TYPE_IPHONE = 2;
    public static final int ONLINE_TYPE_MOBILE = 1;
    public static final int ONLINE_TYPE_WINDOWS8 = 6;
    public static final int ONLINE_TYPE_WINPHONE = 5;
    public static final String PERMISSION = "com.vkontakte.android.permission.ACCESS_DATA";
    public static final int STATE_CONNECTED = 3;
    public static final int STATE_CONNECTING = 2;
    public static final int STATE_UPDATING = 1;
    public static final int STATE_WAITING = 0;
    private static final String VERSION = "1";
    private static Timer broadcastStateTimer;
    private static int notificationSoundID;
    private static SoundPool notificationSoundPool;
    private String key;
    Thread lpThread;
    Timer onlineTimer;
    private String server;
    Timer stopDelayTimer;
    private int ts;
    public static final boolean DEBUG = PreferenceManager.getDefaultSharedPreferences(VKApplication.context).getBoolean("__dbg_longpoll", false);
    public static final int[] MOBILE_ONLINE_TYPES = {1, 2, 3, 4, 5};
    public static boolean longPollRunning = false;
    public static boolean needReloadDialogs = false;
    public static boolean longPollActive = false;
    public static boolean updating = false;
    public static boolean connected = false;
    static int numNewMessages = 0;
    public static int prevNumNewMessages = 0;
    static int numFriendSuggestions = 0;
    static int numFriendRequests = 0;
    static int numPhotosMarks = 0;
    static int numVideosMarks = 0;
    static int numAppRequests = 0;
    static int numNotifications = 0;
    static int numGroupInvitations = 0;
    static Notification notification1 = null;
    public static Semaphore addOwnMessage = new Semaphore(1, true);
    public static Semaphore addMessage = new Semaphore(1, true);
    public static UserProfile lastMessageProfile = null;
    public static UserProfile realLastProfile = null;
    public static ArrayList<Message> sendingMessages = new ArrayList<>();
    public static ArrayList<Message> pendingReceivedMessages = new ArrayList<>();
    private boolean started = false;
    private boolean needResendOnline = false;
    private boolean newSystem = false;
    private boolean initClient = false;
    private boolean needStop = false;
    private HashMap<Long, Long> typings = new HashMap<>();
    private WorkerThread typingCancelThread = new WorkerThread("Typing");
    private Semaphore typingLock = new Semaphore(1, true);

    public static int getState() {
        if (Global.longPoll == null) {
            return 0;
        }
        if (connected) {
            return 3;
        }
        if (updating) {
            return 1;
        }
        return NetworkStateReceiver.isConnected() ? 2 : 0;
    }

    public static void setNumPhotosMarks(int value) {
        numPhotosMarks = clampCounter(value);
    }

    public static void setNumVideosMarks(int value) {
        numVideosMarks = clampCounter(value);
    }

    public static void setNumAppRequests(int value) {
        numAppRequests = clampCounter(value);
    }

    public static void setNumNewMessages(int value) {
        numNewMessages = clampCounter(value);
    }

    public static int getNumNewMessages() {
        return numNewMessages;
    }

    public static int getNumPhotosMarks() {
        return numPhotosMarks;
    }

    public static int getNumVideosMarks() {
        return numVideosMarks;
    }

    public static int getNumAppRequests() {
        return numAppRequests;
    }

    public static int getNumGroupInvitations() {
        return numGroupInvitations;
    }

    public static void setNumGroupInvitations(int value) {
        numGroupInvitations = clampCounter(value);
    }

    public static int getNumNotifications() {
        return numNotifications;
    }

    public static void resetNotifications() {
        numNotifications = 0;
        notifyCountersChanged();
    }

    public static int getNumFriendRequests() {
        return numFriendRequests;
    }

    public static void setNumFriendRequests(int value) {
        numFriendRequests = clampCounter(value);
    }

    public static int getNumFriendSuggestions() {
        return numFriendSuggestions;
    }

    public static void setNumFriendSuggestions(int value) {
        numFriendSuggestions = clampCounter(value);
    }

    static int clampCounter(int value) {
        return Math.max(0, value);
    }

    private boolean updateServerInfo() {
        try {
            if (!Global.inited) {
                Global.inited = true;
                VKApplication.context = getApplicationContext();
            }
            this.server = null;
            boolean res = new VKAPIRequest("execute").param(AuthCheckFragment.KEY_CODE, "return {c:API.getCounters(),s:API.messages.getLongPollServer({use_ssl:1}),fo:API.friends.getOnline({online_mobile:1})};").setCallback(new Callback<JSONObject>() { // from class: com.vkontakte.android.LongPollService.1
                @Override // com.vkontakte.android.api.Callback
                public void success(JSONObject r) {
                    try {
                        JSONObject o = r.getJSONObject(ServerKeys.RESPONSE).getJSONObject("s");
                        LongPollService.this.ts = o.getInt("ts");
                        LongPollService.this.key = o.getString("key");
                        LongPollService.this.server = o.getString("server");
                        JSONObject o1 = r.getJSONObject(ServerKeys.RESPONSE).optJSONObject("c");
                        LongPollService.parseCountersInfo(o1);
                        LongPollService.this.setNumUnread(LongPollService.getNumNewMessages());
                        Friends.notifyRequestsChanged(LongPollService.numFriendRequests);
                        JSONObject fo = r.getJSONObject(ServerKeys.RESPONSE).getJSONObject("fo");
                        JSONArray fdo = fo.getJSONArray("online");
                        JSONArray fmo = fo.getJSONArray("online_mobile");
                        ArrayList<Integer> onlines = new ArrayList<>();
                        ArrayList<Integer> mobileOnlines = new ArrayList<>();
                        for (int i = 0; i < fdo.length(); i++) {
                            onlines.add(Integer.valueOf(fdo.getInt(i)));
                        }
                        for (int i2 = 0; i2 < fmo.length(); i2++) {
                            mobileOnlines.add(Integer.valueOf(fmo.getInt(i2)));
                        }
                        Friends.setOnlines(onlines, mobileOnlines);
                    } catch (Exception x) {
                        Log.w("vk", x);
                    }
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                }
            }).execSync();
            syncStateWithServer();
            return res;
        } catch (Exception x) {
            if (DEBUG) {
                Log.w("vk", "error updating longpoll server", x);
            }
            return false;
        }
    }

    static void parseCountersInfo(JSONObject source) {
        numFriendSuggestions = 0;
        numFriendRequests = 0;
        numNotifications = 0;
        numGroupInvitations = 0;
        numNewMessages = 0;
        numAppRequests = 0;
        numPhotosMarks = 0;
        numVideosMarks = 0;
        if (source != null) {
            numFriendSuggestions = source.optInt("friends_suggestions");
            numFriendRequests = source.optInt("friends");
            numNotifications = source.optInt("notifications");
            numGroupInvitations = source.optInt("groups");
            numNewMessages = source.optInt("messages", 0);
            numPhotosMarks = source.optInt("photos", 0);
            numVideosMarks = source.optInt("videos", 0);
            numAppRequests = source.optInt("app_requests", 0);
        }
    }

    public static void syncStateWithServer() {
        if (updating) {
            if (DEBUG) {
                Log.d("vk", "already updating");
                return;
            }
            return;
        }
        int pts = VKApplication.context.getSharedPreferences("longpoll", 0).getInt("pts", 0);
        if (!NetworkStateReceiver.isConnected()) {
            Log.w("vk", "No network, won't update");
            return;
        }
        updating = true;
        try {
            broadcastStateChanged();
            Log.i("vk_longpoll", "Before get long poll history, pts=" + pts);
            if (pts <= 0) {
                Messages.reset();
                Messages.resetCache();
            } else {
                final int[] maxMid = new int[1];
                boolean r = new VKAPIRequest("execute.getMaxMsgIdNew").setCallback(new Callback<JSONObject>() { // from class: com.vkontakte.android.LongPollService.2
                    @Override // com.vkontakte.android.api.Callback
                    public void success(JSONObject o) {
                        try {
                            maxMid[0] = o.getInt(ServerKeys.RESPONSE);
                        } catch (Exception x) {
                            L.e(x, new Object[0]);
                        }
                    }

                    @Override // com.vkontakte.android.api.Callback
                    public void fail(VKAPIRequest.VKErrorResponse error) {
                    }
                }).execSync();
                if (!r) {
                    throw new RuntimeException("Error getting max msg id");
                }
                int localMaxMid = Cache.getMaxMsgId();
                int diff = maxMid[0] - localMaxMid;
                Log.d("vk_longpoll", "Msg diff=" + diff + " [server=" + maxMid[0] + ", client=" + localMaxMid + "]");
                if (diff >= 1000 && VKAccountManager.getCurrent().getUid() != 1708231) {
                    Log.d("vk_longpoll", "Too many new messages, resetting cache");
                    Messages.reset();
                    Messages.resetCache();
                    VKApplication.context.sendBroadcast(new Intent(ACTION_REFRESH_DIALOGS_LIST), "com.vkontakte.android.permission.ACCESS_DATA");
                    return;
                }
                final boolean[] sendNextRequest = {false};
                do {
                    int pts2 = VKApplication.context.getSharedPreferences("longpoll", 0).getInt("pts", 0);
                    Log.i("vk_longpoll", "Get long poll history, old ts=" + pts2);
                    new VKAPIRequest("messages.getLongPollHistory").param("pts", pts2).param(ServerKeys.PHOTO_SIZES, 1).param(GraphRequest.FIELDS_PARAM, "first_name,last_name,photo_100,photo_50").param("msgs_limit", 250).param("events_limit", 5000).setCallback(new Callback<JSONObject>() { // from class: com.vkontakte.android.LongPollService.3
                        @Override // com.vkontakte.android.api.Callback
                        public void success(JSONObject o) {
                            int uid;
                            try {
                                ArrayList<Integer> updatedIds = new ArrayList<>();
                                ArrayList<Integer> markedAsRead = new ArrayList<>();
                                ArrayList<Integer> markedAsUnread = new ArrayList<>();
                                ArrayList<Integer> deleted = new ArrayList<>();
                                JSONObject o2 = o.getJSONObject(ServerKeys.RESPONSE);
                                SparseArray<String> names = new SparseArray<>();
                                SparseArray<String> photos = new SparseArray<>();
                                JSONArray profiles = o2.getJSONArray("profiles");
                                ArrayList<UserProfile> users = new ArrayList<>();
                                for (int i = 0; i < profiles.length(); i++) {
                                    JSONObject jp = profiles.getJSONObject(i);
                                    names.put(jp.getInt("id"), jp.getString("first_name") + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + jp.getString("last_name"));
                                    photos.put(jp.getInt("id"), jp.getString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50"));
                                    UserProfile p = new UserProfile();
                                    p.uid = jp.getInt("id");
                                    p.firstName = jp.getString("first_name");
                                    p.lastName = jp.getString("last_name");
                                    p.fullName = p.firstName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + p.lastName;
                                    p.photo = jp.getString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50");
                                    users.add(p);
                                }
                                JSONArray jchats = o2.optJSONArray("chats");
                                if (jchats != null) {
                                    for (int i2 = 0; i2 < jchats.length(); i2++) {
                                        JSONObject jc = jchats.getJSONObject(i2);
                                        UserProfile c = new UserProfile();
                                        c.uid = 2000000000 + jc.getInt("id");
                                        c.fullName = jc.getString("title");
                                        c.online = jc.getInt("admin_id");
                                        if (jc.has("photo_50")) {
                                            c.photo = jc.getString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50");
                                        } else {
                                            Uri.Builder bldr = new Uri.Builder();
                                            bldr.scheme(AvatarDataSource.CHAT_AVATAR_SCHEME).authority("c");
                                            ArrayList<String> ph = new ArrayList<>();
                                            JSONArray act = jc.getJSONArray("users");
                                            ArrayList<Integer> needUsers = new ArrayList<>();
                                            for (int j = 0; j < Math.min(act.length(), 5); j++) {
                                                needUsers.add(Integer.valueOf(act.getInt(j)));
                                            }
                                            ArrayList<UserProfile> u = Friends.getUsersBlocking(needUsers);
                                            Iterator<UserProfile> it = u.iterator();
                                            while (it.hasNext()) {
                                                UserProfile p2 = it.next();
                                                if (!VKAccountManager.isCurrentUser(p2.uid) && !ph.contains(p2.photo)) {
                                                    ph.add(p2.photo);
                                                    if (ph.size() == 4) {
                                                        break;
                                                    }
                                                }
                                            }
                                            int j2 = 0;
                                            Iterator<String> it2 = ph.iterator();
                                            while (it2.hasNext()) {
                                                String photo = it2.next();
                                                bldr.appendQueryParameter("photo" + j2, photo);
                                                j2++;
                                            }
                                            c.photo = bldr.build().toString();
                                        }
                                        names.put(c.uid, c.fullName);
                                        photos.put(c.uid, c.photo);
                                        if (LongPollService.DEBUG) {
                                            Log.d("vk", "Will update chat " + c);
                                        }
                                        users.add(c);
                                    }
                                }
                                Cache.updatePeers(users, false);
                                JSONArray jmsgs = APIUtils.unwrapArray(o2, "messages").array;
                                SparseArray<Message> msgs = new SparseArray<>();
                                for (int i3 = 0; i3 < jmsgs.length(); i3++) {
                                    JSONObject jm = jmsgs.getJSONObject(i3);
                                    Message msg = new Message(jm, names, photos);
                                    if (!Utils.containsKey(names, msg.peer)) {
                                        throw new RuntimeException("Inconsistent response: peer " + msg.peer + " not found");
                                    }
                                    if (jm.has("push_settings")) {
                                        JSONObject jps = jm.getJSONObject("push_settings");
                                        int dnd = jps.getInt("disabled_until");
                                        if (dnd == -1) {
                                            dnd = Integer.MAX_VALUE;
                                        }
                                        boolean mute = jps.getInt("sound") != 1;
                                        Messages.setDnd(msg.peer, dnd, mute);
                                    }
                                    msgs.put(msg.id, msg);
                                    if (msg.isServiceMessage && msg.extras.containsKey(NativeProtocol.WEB_DIALOG_ACTION)) {
                                        Cache.setNeedUpdateChat(msg.peer - 2000000000);
                                        Intent intent = new Intent(LongPollService.ACTION_CHAT_CHANGED);
                                        intent.putExtra("id", msg.peer - 2000000000);
                                        VKApplication.context.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
                                        if (msg.extras.containsKey("action_mid") && (uid = msg.extras.getInt("action_mid")) != msg.sender) {
                                            String userNameAcc = Friends.getUsersBlocking(Arrays.asList(Integer.valueOf(uid)), 3).get(0).fullName;
                                            msg.putStringExtra("action_user_name_acc", userNameAcc);
                                        }
                                    }
                                }
                                JSONArray events = o2.getJSONArray("history");
                                ArrayList<MessagesAction> actions = new ArrayList<>();
                                for (int i4 = 0; i4 < events.length(); i4++) {
                                    JSONArray event = events.getJSONArray(i4);
                                    int ev = event.getInt(0);
                                    switch (ev) {
                                        case 2:
                                            int flag = event.getInt(2);
                                            int mid = event.getInt(1);
                                            if ((flag & 1) > 0) {
                                                actions.add(new ModifyMessageFlagsAction(mid, 1, 0));
                                                if (markedAsRead.contains(Integer.valueOf(mid))) {
                                                    markedAsRead.remove(Integer.valueOf(mid));
                                                }
                                                markedAsUnread.add(Integer.valueOf(mid));
                                                break;
                                            } else if ((flag & 128) > 0 || (flag & 64) > 0) {
                                                actions.add(new DeleteMessageAction(mid));
                                                deleted.add(Integer.valueOf(mid));
                                                break;
                                            } else {
                                                break;
                                            }
                                        case 3:
                                            int flag2 = event.getInt(2);
                                            int mid2 = event.getInt(1);
                                            if ((flag2 & 1) > 0) {
                                                actions.add(new ModifyMessageFlagsAction(mid2, 1, 1));
                                                if (markedAsUnread.contains(Integer.valueOf(mid2))) {
                                                    markedAsUnread.remove(Integer.valueOf(mid2));
                                                }
                                                markedAsRead.add(Integer.valueOf(mid2));
                                                break;
                                            } else {
                                                break;
                                            }
                                        case 4:
                                            if ((event.getInt(2) & 128) == 0 && (event.getInt(2) & 64) == 0) {
                                                Message msg2 = msgs.get(event.getInt(1));
                                                actions.add(new AddMessageAction(msg2));
                                                if (!updatedIds.contains(Integer.valueOf(msg2.peer))) {
                                                    updatedIds.add(Integer.valueOf(msg2.peer));
                                                    break;
                                                } else {
                                                    break;
                                                }
                                            }
                                            break;
                                        case 5:
                                            if ((event.getInt(2) & 128) == 0 && (event.getInt(2) & 64) == 0) {
                                                Message msg3 = msgs.get(event.getInt(1));
                                                actions.add(new UpdateMessageAction(msg3));
                                                if (!updatedIds.contains(Integer.valueOf(msg3.peer))) {
                                                    updatedIds.add(Integer.valueOf(msg3.peer));
                                                    break;
                                                } else {
                                                    break;
                                                }
                                            }
                                            break;
                                        case 6:
                                        case 7:
                                            actions.add(new ModifyMessageFlagsAction(event.getInt(2), 1, 1, ev == 6, event.getInt(1)));
                                            break;
                                    }
                                }
                                if (actions.size() > 0) {
                                    Messages.applyActions(actions);
                                }
                                int pts3 = o2.getInt("new_pts");
                                if (VKApplication.context.getSharedPreferences("longpoll", 0).getInt("pts", 0) == 0) {
                                    sendNextRequest[0] = false;
                                    return;
                                }
                                if (pts3 > 0) {
                                    VKApplication.context.getSharedPreferences("longpoll", 0).edit().putInt("pts", pts3).commit();
                                }
                                sendNextRequest[0] = o2.optInt("more") == 1;
                                Log.d("vk_longpoll", "More=" + sendNextRequest[0]);
                                Intent intent2 = new Intent(LongPollService.ACTION_REFRESH_DIALOGS_LIST);
                                intent2.putExtra("reload_chats", updatedIds);
                                intent2.putExtra("marked_as_read", markedAsRead);
                                intent2.putExtra("marked_as_unread", markedAsUnread);
                                intent2.putExtra(Group.DEACTIVATION_DELETED, deleted);
                                VKApplication.context.sendBroadcast(intent2, "com.vkontakte.android.permission.ACCESS_DATA");
                            } catch (Exception x) {
                                Log.w("vk_longpoll", "get long poll history failed!", x);
                                throw new RuntimeException("Error getting longpoll history", x);
                            }
                        }

                        @Override // com.vkontakte.android.api.Callback
                        public void fail(VKAPIRequest.VKErrorResponse error) {
                            if (error.getCodeValue() == 6) {
                                try {
                                    Thread.sleep(2000L);
                                } catch (Exception x) {
                                    L.e(x, new Object[0]);
                                }
                                sendNextRequest[0] = true;
                            }
                            if (error.getCodeValue() == -1) {
                                return;
                            }
                            Log.e("vk_longpoll", "GET LONG POLL HISTORY FAILED " + error);
                            throw new RuntimeException("Error getting longpoll history " + error);
                        }
                    }).execSync();
                } while (sendNextRequest[0]);
                Log.i("vk_longpoll", "Get long poll hisrory done.");
            }
            String deviceID = Settings.Secure.getString(VKApplication.context.getContentResolver(), "android_id");
            new VKAPIRequest("account.getPushSettings").param("device_id", deviceID).setCallback(new SimpleCallback<JSONObject>() { // from class: com.vkontakte.android.LongPollService.4
                @Override // com.vkontakte.android.api.Callback
                public void success(JSONObject o) {
                    try {
                        JSONArray array = o.getJSONObject(ServerKeys.RESPONSE).getJSONObject("conversations").getJSONArray(ServerKeys.ITEMS);
                        ArrayList<ConversationInfo> infos = new ArrayList<>(array == null ? 0 : array.length());
                        for (int i = 0; array != null && i < array.length(); i++) {
                            ConversationInfo info = new ConversationInfo(array.getJSONObject(i));
                            infos.add(info);
                        }
                        NotificationUtils.syncNotificationSettings(VKApplication.context, infos);
                    } catch (Exception e) {
                        L.e(e, new Object[0]);
                    }
                }
            }).exec();
            updating = false;
            broadcastStateChanged();
        } finally {
            updating = false;
        }
    }

    public static synchronized void broadcastStateChanged() {
        synchronized (LongPollService.class) {
            if (broadcastStateTimer != null) {
                try {
                    broadcastStateTimer.cancel();
                } catch (Exception x) {
                    L.e(x, new Object[0]);
                }
                broadcastStateTimer = null;
            }
            broadcastStateTimer = new Timer();
            broadcastStateTimer.schedule(new TimerTask() { // from class: com.vkontakte.android.LongPollService.5
                @Override // java.util.TimerTask, java.lang.Runnable
                public void run() {
                    LongPollService.doBroadcastStateChanged();
                    Timer unused = LongPollService.broadcastStateTimer = null;
                }
            }, 200L);
        }
    }

    public static void doBroadcastStateChanged() {
        int state = getState();
        if (DEBUG) {
            Log.i("vk_longpoll", "STATE " + state);
        }
        Intent intent = new Intent(ACTION_STATE_CHANGED);
        intent.putExtra("state", state);
        VKApplication.context.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
    }

    public void setNumUnread(int n) {
        setNumNewMessages(n);
        notifyCountersChanged();
        if (getNumNewMessages() == 0) {
            NotificationManager mgr = (NotificationManager) getSystemService("notification");
            mgr.cancel(10);
        }
    }

    private void start() {
        Log.d("vk_longpoll", "started = " + this.started);
        if (!this.started) {
            Thread thread = new Thread(this);
            this.lpThread = thread;
            thread.start();
            this.started = true;
            broadcastStateChanged();
        }
    }

    private void stop() {
        this.needStop = true;
        if (this.onlineTimer != null) {
            this.onlineTimer.cancel();
        }
        stopSelf();
        Global.longPoll = null;
    }

    public static void updateCounters() {
        if (VKApplication.context.getSharedPreferences(null, 0).contains(ArgKeys.UID)) {
            new VKAPIRequest("execute.getCountersAndInfo").setCallback(new Callback<JSONObject>() { // from class: com.vkontakte.android.LongPollService.6
                @Override // com.vkontakte.android.api.Callback
                public void success(JSONObject o) {
                    try {
                        JSONObject r = o.optJSONObject(ServerKeys.RESPONSE);
                        if (r == null) {
                            r = new JSONObject();
                        }
                        LongPollService.numFriendSuggestions = r.optInt("friends_suggestions", 0);
                        int numReqs = r.optInt("friends", 0);
                        if (numReqs != LongPollService.numFriendRequests) {
                            LongPollService.numFriendRequests = numReqs;
                            Friends.notifyRequestsChanged(LongPollService.numFriendRequests);
                        }
                        LongPollService.numNotifications = r.optInt("notifications", 0);
                        LongPollService.numGroupInvitations = r.optInt("groups", 0);
                        int numMsgs = r.optInt("messages", 0);
                        if (numMsgs != LongPollService.getNumNewMessages()) {
                            LongPollService.needReloadDialogs = true;
                            VKApplication.context.sendBroadcast(new Intent(LongPollService.ACTION_REFRESH_DIALOGS_LIST), "com.vkontakte.android.permission.ACCESS_DATA");
                            LongPollService.setNumNewMessages(numMsgs);
                        }
                        LongPollService.parseCountersInfo(r);
                        LongPollService.notifyCountersChanged();
                        VKAccountManager.editCurrent().setIntro(r.getInt("intro")).commit();
                        VKApplication.context.sendBroadcast(new Intent(LongPollService.ACTION_COUNTERS_UPDATED), "com.vkontakte.android.permission.ACCESS_DATA");
                    } catch (Exception x) {
                        Log.w("vk", x);
                    }
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                }
            }).exec();
        }
    }

    private void processClearFlags(int mid, int uid, int mask) {
        if ((mask & 1) > 0 && !this.newSystem) {
            Intent intent = new Intent(ACTION_MESSAGE_RSTATE_CHANGED);
            intent.putExtra(EXTRA_MSG_ID, mid);
            intent.putExtra(EXTRA_READ_STATE, true);
            sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
            Messages.setReadState(mid, true);
            if (!VKAccountManager.isCurrentUser(uid) && !this.newSystem) {
                setNumUnread(getNumNewMessages() - 1);
            }
        }
        if ((mask & 128) > 0 || (mask & 64) > 0) {
            VKAPIRequest getMsg = new VKAPIRequest(Messages.METHOD_NAME);
            getMsg.param("message_ids", mid).param(ServerKeys.PHOTO_SIZES, 1).param(GraphRequest.FIELDS_PARAM, "first_name,last_name,photo_100,photo_50");
            JSONObject res = APIController.runRequest(getMsg);
            if (res != null && res.has(ServerKeys.RESPONSE)) {
                try {
                    JSONObject jmsg = APIUtils.unwrapArray(res, ServerKeys.RESPONSE).array.getJSONObject(0);
                    Message msg = new Message(jmsg);
                    Intent intent2 = new Intent(ACTION_NEW_MESSAGE);
                    if (msg.extras != null && msg.extras.containsKey("action_mid")) {
                        int actMid = msg.extras.getInt("action_mid", 0);
                        ArrayList<UserProfile> users = Friends.getUsersBlocking(Arrays.asList(Integer.valueOf(actMid)), 3);
                        intent2.putExtra("action_user_name_acc", users.get(0).fullName);
                        msg.putStringExtra("action_user_name_acc", users.get(0).fullName);
                    }
                    ArrayList<Integer> needUsers = new ArrayList<>();
                    needUsers.add(Integer.valueOf(msg.sender));
                    UserProfile senderProfile = Friends.getUsersBlocking(needUsers).get(0);
                    intent2.putExtra("sender_profile", senderProfile);
                    intent2.putExtra("peer_id", msg.peer);
                    intent2.putExtra("message", msg);
                    intent2.putExtra("is_out", msg.out);
                    intent2.putExtra("sender_photo", senderProfile.photo);
                    UserProfile peerProfile = null;
                    if (msg.peer < 2000000000) {
                        ArrayList<UserProfile> pp = Friends.getUsersBlocking(Arrays.asList(Integer.valueOf(msg.peer)));
                        UserProfile peerProfile2 = pp.get(0);
                        peerProfile = peerProfile2;
                        intent2.putExtra("peer_profile", peerProfile);
                    }
                    Messages.add(msg, peerProfile, senderProfile.photo);
                    sendBroadcast(intent2, "com.vkontakte.android.permission.ACCESS_DATA");
                    return;
                } catch (Exception x) {
                    Log.w("vk", x);
                    return;
                }
            }
            Log.w("vk_longpoll", "Error getting full message");
        }
    }

    private void processAddFlags(int mid, int uid, int mask) {
        if ((mask & 1) > 0 && !this.newSystem) {
            Intent intent = new Intent(ACTION_MESSAGE_RSTATE_CHANGED);
            intent.putExtra(EXTRA_MSG_ID, mid);
            intent.putExtra(EXTRA_READ_STATE, false);
            sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
            Messages.setReadState(mid, false);
            if (!VKAccountManager.isCurrentUser(uid) && !this.newSystem) {
                setNumNewMessages(getNumNewMessages() + 1);
                sendBroadcast(new Intent(ACTION_COUNTERS_UPDATED), "com.vkontakte.android.permission.ACCESS_DATA");
            }
        }
        if ((mask & 128) > 0 || (mask & 64) > 0) {
            Intent intent2 = new Intent(ACTION_MESSAGE_DELETED);
            intent2.putExtra(EXTRA_MSG_ID, mid);
            sendBroadcast(intent2, "com.vkontakte.android.permission.ACCESS_DATA");
            Messages.deleteMessageLocally(mid);
        }
    }

    public static void notifyCountersChanged() {
        VKApplication.context.sendBroadcast(new Intent(ACTION_COUNTERS_UPDATED), "com.vkontakte.android.permission.ACCESS_DATA");
    }

    private void processOnlineChange(int uid, int online) {
        Friends.setOnlineStatus(uid, online);
        Intent intent = new Intent(ACTION_USER_PRESENCE);
        intent.putExtra(ArgKeys.UID, uid);
        intent.putExtra("online", online);
        sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
    }

    private void processTyping(int peerID, int userID) {
        long id = peerID;
        if (peerID > 2000000000) {
            id |= userID << 32;
        }
        try {
            this.typingLock.acquire();
        } catch (Exception x) {
            L.e(x, new Object[0]);
        }
        this.typings.put(Long.valueOf(id), Long.valueOf(System.currentTimeMillis()));
        this.typingLock.release();
        this.typingCancelThread.postRunnable(new Runnable() { // from class: com.vkontakte.android.LongPollService.7
            @Override // java.lang.Runnable
            public void run() {
                try {
                    LongPollService.this.typingLock.acquire();
                } catch (Exception x2) {
                    L.e(x2, new Object[0]);
                }
                Iterator<Long> keys = LongPollService.this.typings.keySet().iterator();
                while (keys.hasNext()) {
                    long k = keys.next().longValue();
                    long time = ((Long) LongPollService.this.typings.get(Long.valueOf(k))).longValue();
                    if (System.currentTimeMillis() - time > 7000) {
                        int peerID2 = (int) k;
                        int userID2 = (int) (k >> 32);
                        Intent intent = new Intent(LongPollService.ACTION_TYPING);
                        intent.putExtra(ArgKeys.UID, peerID2);
                        intent.putExtra(ProfileGiftsFragment.Extra.User, userID2);
                        intent.putExtra("stop", true);
                        LongPollService.this.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
                        keys.remove();
                    }
                }
                LongPollService.this.typingLock.release();
            }
        }, 7100L);
        Intent intent = new Intent(ACTION_TYPING);
        intent.putExtra(ArgKeys.UID, peerID);
        intent.putExtra(ProfileGiftsFragment.Extra.User, userID);
        sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
    }

    public List<Integer> getTypings(int peer) {
        if (peer < 2000000000) {
            return (this.typings == null || !this.typings.containsKey(Long.valueOf((long) peer)) || this.typings.get(Long.valueOf((long) peer)) == null || System.currentTimeMillis() - this.typings.get(Long.valueOf((long) peer)).longValue() >= 7000) ? new ArrayList() : Arrays.asList(Integer.valueOf(peer));
        }
        try {
            this.typingLock.acquire();
        } catch (Exception x) {
            L.e(x, new Object[0]);
        }
        Set<Long> keys = this.typings.keySet();
        ArrayList<Integer> result = new ArrayList<>();
        for (Long l : keys) {
            long k = l.longValue();
            long time = this.typings.get(Long.valueOf(k)).longValue();
            int peerID = (int) k;
            int userID = (int) (k >> 32);
            if (peerID == peer && System.currentTimeMillis() - time < 7000) {
                result.add(Integer.valueOf(userID));
            }
        }
        this.typingLock.release();
        return result;
    }

    @Override // java.lang.Runnable
    public void run() {
        Thread.currentThread().setName("LongPoll");
        if (!this.needStop) {
            longPollRunning = true;
            runLongPoll();
            longPollRunning = false;
            longPollActive = false;
        }
        this.lpThread = null;
        this.started = false;
    }

    private byte[] getURL(String url) {
        initClient();
        Request req = new Request.Builder().url(url).header("User-Agent", APIController.USER_AGENT).build();
        try {
            return Network.getInstance().getClient(Network.ClientType.CLIENT_LONGPOLL).newCall(req).execute().body().bytes();
        } catch (Throwable x) {
            L.e(x, new Object[0]);
            return null;
        }
    }

    private void processChatChanged(int chatID) {
        Cache.setNeedUpdateChat(chatID);
        Intent intent = new Intent(ACTION_CHAT_CHANGED);
        intent.putExtra("id", chatID);
        sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
    }

    public static void processFailedMessageAddCallback(JSONObject res, JSONObject data) {
        if (res != null) {
            try {
                if (res.has(ServerKeys.RESPONSE)) {
                    JSONObject jmsg = APIUtils.unwrapArray(res, ServerKeys.RESPONSE).array.getJSONObject(0);
                    Message msg = new Message(jmsg);
                    if (msg.extras.containsKey(NativeProtocol.WEB_DIALOG_ACTION)) {
                        msg.isServiceMessage = true;
                    }
                    if (msg.out && !msg.isServiceMessage && sendingMessages.size() > 0) {
                        pendingReceivedMessages.add(msg);
                        return;
                    }
                    Intent intent = new Intent(ACTION_NEW_MESSAGE);
                    if (msg.extras.containsKey("action_mid")) {
                        int actMid = msg.extras.getInt("action_mid", 0);
                        ArrayList<UserProfile> users = Friends.getUsersBlocking(Arrays.asList(Integer.valueOf(actMid)), 3);
                        intent.putExtra("action_user_name_acc", users.get(0).fullName);
                        msg.putStringExtra("action_user_name_acc", users.get(0).fullName);
                    }
                    if (DEBUG) {
                        Log.i("vk_longpoll", "Message: " + msg);
                    }
                    ArrayList<Integer> needUsers = new ArrayList<>();
                    needUsers.add(Integer.valueOf(msg.sender));
                    UserProfile senderProfile = Friends.getUsersBlocking(needUsers).get(0);
                    intent.putExtra("sender_profile", senderProfile);
                    intent.putExtra("peer_id", msg.peer);
                    intent.putExtra("message", msg);
                    intent.putExtra("is_out", msg.out);
                    intent.putExtra("sender_photo", senderProfile.photo);
                    UserProfile peerProfile = null;
                    if (msg.peer < 2000000000) {
                        ArrayList<UserProfile> pp = Friends.getUsersBlocking(Arrays.asList(Integer.valueOf(msg.peer)));
                        UserProfile peerProfile2 = pp.get(0);
                        peerProfile = peerProfile2;
                        intent.putExtra("peer_profile", peerProfile);
                    }
                    if (msg.out && Cache.containsMessage(msg.id)) {
                        Messages.add(msg, peerProfile, senderProfile.photo);
                        return;
                    }
                    Messages.add(msg, peerProfile, senderProfile.photo);
                    VKApplication.context.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
                    if (msg.extras.containsKey(NativeProtocol.WEB_DIALOG_ACTION)) {
                        Cache.setNeedUpdateChat(msg.peer - 2000000000);
                        Intent intent1 = new Intent(ACTION_CHAT_CHANGED);
                        intent1.putExtra("id", msg.peer - 2000000000);
                        VKApplication.context.sendBroadcast(intent1, "com.vkontakte.android.permission.ACCESS_DATA");
                        if ("chat_title_update".equals(msg.extras.getString(NativeProtocol.WEB_DIALOG_ACTION))) {
                            Cache.updateChat(msg.peer - 2000000000, msg.extras.getString("action_text"), null, null);
                        }
                    }
                }
            } catch (JSONException x) {
                L.e(x, new Object[0]);
            }
        }
    }

    @Keep
    public static void processFailedMessageUpdateCallback(JSONObject res, JSONObject data) {
        if (res != null) {
            try {
                if (res.has(ServerKeys.RESPONSE)) {
                    JSONObject jmsg = APIUtils.unwrapArray(res, ServerKeys.RESPONSE).array.getJSONObject(0);
                    Message msg = new Message(jmsg);
                    if (msg.extras.containsKey(NativeProtocol.WEB_DIALOG_ACTION)) {
                        msg.isServiceMessage = true;
                    }
                    if (msg.out && !msg.isServiceMessage && sendingMessages.size() > 0) {
                        pendingReceivedMessages.add(msg);
                        return;
                    }
                    Intent intent = new Intent(ACTION_UPDATE_MESSAGE);
                    if (msg.extras.containsKey("action_mid")) {
                        int actMid = msg.extras.getInt("action_mid", 0);
                        ArrayList<UserProfile> users = Friends.getUsersBlocking(Arrays.asList(Integer.valueOf(actMid)), 3);
                        intent.putExtra("action_user_name_acc", users.get(0).fullName);
                        msg.putStringExtra("action_user_name_acc", users.get(0).fullName);
                    }
                    if (DEBUG) {
                        Log.i("vk_longpoll", "Message: " + msg);
                    }
                    ArrayList<Integer> needUsers = new ArrayList<>();
                    needUsers.add(Integer.valueOf(msg.sender));
                    UserProfile senderProfile = Friends.getUsersBlocking(needUsers).get(0);
                    intent.putExtra("sender_profile", senderProfile);
                    intent.putExtra("peer_id", msg.peer);
                    intent.putExtra("message", msg);
                    intent.putExtra("is_out", msg.out);
                    intent.putExtra("sender_photo", senderProfile.photo);
                    UserProfile peerProfile = null;
                    if (msg.peer < 2000000000) {
                        ArrayList<UserProfile> pp = Friends.getUsersBlocking(Arrays.asList(Integer.valueOf(msg.peer)));
                        UserProfile peerProfile2 = pp.get(0);
                        peerProfile = peerProfile2;
                        intent.putExtra("peer_profile", peerProfile);
                    }
                    if (Cache.containsMessage(msg.id)) {
                        Messages.add(msg, peerProfile, senderProfile.photo);
                        VKApplication.context.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
                    }
                }
            } catch (JSONException x) {
                L.e(x, new Object[0]);
            }
        }
    }

    private void processMessageAdd(int mid, int peer, int flags, int time, String text, String subject, JSONObject extra, int randomId) {
        int sender;
        Message msg;
        if (DEBUG) {
            Log.i("vk_longpoll", "processMessageAdd: id=" + mid + ", flags=" + flags + ", peer=" + peer + ", time=" + time + ", subject='" + subject + "', text='" + text + "', extra=" + extra + "', randomId=" + randomId);
        }
        boolean isOut = (flags & 2) > 0;
        try {
            try {
                addMessage.acquire();
                addMessage.release();
            } catch (Exception x) {
                L.e(x, new Object[0]);
            }
            if (peer < 2000000000) {
                sender = isOut ? VKAccountManager.getCurrent().getUid() : peer;
            } else {
                sender = extra.getInt(ServerKeys.FROM);
            }
            long typingKey = peer > 2000000000 ? (sender << 32) | peer : sender;
            try {
                this.typingLock.acquire();
            } catch (Exception x2) {
                L.e(x2, new Object[0]);
            }
            if (this.typings.containsKey(Long.valueOf(typingKey))) {
                this.typings.remove(Long.valueOf(typingKey));
                Intent intent = new Intent(ACTION_TYPING);
                intent.putExtra(ArgKeys.UID, peer);
                intent.putExtra(ProfileGiftsFragment.Extra.User, sender);
                intent.putExtra("stop", true);
                sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
            }
            this.typingLock.release();
            if (extra != null && (extra.has("attach1_type") || extra.has(ArgKeys.FWD) || extra.has("geo"))) {
                if (DEBUG) {
                    Log.i("vk_longpoll", "will get message " + mid + " from api");
                }
                VKAPIRequest getMsg = new VKAPIRequest(Messages.METHOD_NAME);
                getMsg.param("message_ids", mid).param(ServerKeys.PHOTO_SIZES, 1).param(GraphRequest.FIELDS_PARAM, "first_name,last_name,photo_100,photo_50");
                try {
                    getMsg.persist(LongPollService.class.getMethod("processFailedMessageAddCallback", JSONObject.class, JSONObject.class), null);
                } catch (Exception x3) {
                    L.e(x3, new Object[0]);
                }
                JSONObject res = APIController.runRequest(getMsg);
                if (res != null && res.has(ServerKeys.RESPONSE)) {
                    JSONObject jmsg = APIUtils.unwrapArray(res, ServerKeys.RESPONSE).array.getJSONObject(0);
                    msg = new Message(jmsg);
                } else {
                    Log.w("vk_longpoll", "Error getting full message");
                    return;
                }
            } else {
                msg = new Message();
                msg.peer = peer;
                msg.sender = sender;
                msg.setText(text);
                msg.randomId = randomId;
                msg.time = time;
                msg.id = mid;
                msg.out = isOut;
                msg.readState = false;
                if (peer > 2000000000) {
                    msg.title = subject;
                }
                if (extra != null && extra.has("source_act")) {
                    String act = extra.getString("source_act");
                    msg.putStringExtra(NativeProtocol.WEB_DIALOG_ACTION, act);
                    if ("chat_invite_user".equals(act) || "chat_kick_user".equals(act)) {
                        int uid = extra.getInt("source_mid");
                        msg.putIntExtra("action_mid", uid);
                    }
                    if (extra.has("source_text")) {
                        msg.putStringExtra("action_text", extra.getString("source_text"));
                    }
                    if (extra.has("source_email")) {
                        msg.putStringExtra("action_email", extra.getString("source_email"));
                    }
                }
            }
            if (msg.extras.containsKey(NativeProtocol.WEB_DIALOG_ACTION)) {
                msg.isServiceMessage = true;
            }
            if (msg.out && !msg.isServiceMessage && sendingMessages.size() > 0) {
                pendingReceivedMessages.add(msg);
                return;
            }
            Intent intent2 = new Intent(ACTION_NEW_MESSAGE);
            if (msg.extras.containsKey("action_mid")) {
                int actMid = msg.extras.getInt("action_mid", 0);
                ArrayList<UserProfile> users = Friends.getUsersBlocking(Arrays.asList(Integer.valueOf(actMid)), 3);
                intent2.putExtra("action_user_name_acc", users.get(0).fullName);
                msg.putStringExtra("action_user_name_acc", users.get(0).fullName);
            }
            if (DEBUG) {
                Log.i("vk_longpoll", "Message: " + msg);
            }
            ArrayList<Integer> needUsers = new ArrayList<>();
            needUsers.add(Integer.valueOf(sender));
            UserProfile senderProfile = Friends.getUsersBlocking(needUsers).get(0);
            if (senderProfile == null) {
                senderProfile = new UserProfile();
                senderProfile.uid = sender;
                String string = VKApplication.context.getString(R.string.loading);
                senderProfile.fullName = string;
                senderProfile.firstName = string;
                senderProfile.lastName = "";
                senderProfile.photo = "http://vk.com/images/camera_100.gif";
            }
            intent2.putExtra("sender_profile", senderProfile);
            intent2.putExtra("peer_id", peer);
            intent2.putExtra("message", msg);
            intent2.putExtra("is_out", isOut);
            intent2.putExtra("sender_photo", senderProfile.photo);
            UserProfile peerProfile = null;
            if (peer < 2000000000) {
                ArrayList<UserProfile> pp = Friends.getUsersBlocking(Arrays.asList(Integer.valueOf(peer)));
                UserProfile peerProfile2 = pp.get(0);
                peerProfile = peerProfile2;
                intent2.putExtra("peer_profile", peerProfile);
            }
            if (isOut && Cache.containsMessage(msg.id)) {
                Messages.add(msg, peerProfile, senderProfile.photo);
                return;
            }
            Messages.add(msg, peerProfile, senderProfile.photo);
            sendBroadcast(intent2, "com.vkontakte.android.permission.ACCESS_DATA");
            if (msg.extras.containsKey(NativeProtocol.WEB_DIALOG_ACTION)) {
                Cache.setNeedUpdateChat(peer - 2000000000);
                Intent intent1 = new Intent(ACTION_CHAT_CHANGED);
                intent1.putExtra("id", msg.peer - 2000000000);
                sendBroadcast(intent1, "com.vkontakte.android.permission.ACCESS_DATA");
                if ("chat_title_update".equals(msg.extras.getString(NativeProtocol.WEB_DIALOG_ACTION))) {
                    Cache.updateChat(peer - 2000000000, msg.extras.getString("action_text"), null, null);
                }
            }
            if (!isOut) {
                if (!this.newSystem) {
                    setNumNewMessages(getNumNewMessages() + 1);
                    sendBroadcast(new Intent(ACTION_COUNTERS_UPDATED), "com.vkontakte.android.permission.ACCESS_DATA");
                }
                Intent intent3 = new Intent(ACTION_TYPING);
                intent3.putExtra(ArgKeys.UID, peer);
                if (peer > 2000000000) {
                    intent3.putExtra(ProfileGiftsFragment.Extra.User, sender);
                }
                intent3.putExtra("stop", true);
                sendBroadcast(intent3, "com.vkontakte.android.permission.ACCESS_DATA");
                realLastProfile = senderProfile;
                String notifyText = msg.text;
                if (msg.isServiceMessage && msg.extras.containsKey(NativeProtocol.WEB_DIALOG_ACTION)) {
                    notifyText = msg.getServiceMessageText(senderProfile, msg.extras.getString("action_user_name_acc"));
                }
                boolean hasDifferentAttachmentsType = msg.attachments.size() > 0 && msg.fwdMessages.size() > 0;
                if (!hasDifferentAttachmentsType && msg.attachments.size() > 1) {
                    for (int i = 1; i < msg.attachments.size(); i++) {
                        hasDifferentAttachmentsType = msg.attachments.get(i).getClass() != msg.attachments.get(i + (-1)).getClass();
                        if (hasDifferentAttachmentsType) {
                            break;
                        }
                    }
                }
                String notifyAdd = null;
                if (hasDifferentAttachmentsType) {
                    notifyAdd = VKApplication.context.getString(R.string.attachments);
                } else if (msg.attachments.size() > 0 && !msg.isServiceMessage) {
                    Attachment att = msg.attachments.get(0);
                    if (att instanceof GiftAttachment) {
                        notifyText = VKApplication.context.getResources().getString(senderProfile.f ? R.string.new_gift_notification_f : R.string.new_gift_notification_m);
                    } else {
                        notifyAdd = Attachment.getLocalizedDescription(msg.attachments);
                    }
                } else if (msg.fwdMessages.size() > 0) {
                    notifyAdd = VKApplication.context.getResources().getQuantityString(R.plurals.num_attach_fwd_message, msg.fwdMessages.size(), Integer.valueOf(msg.fwdMessages.size()));
                }
                if (!TextUtils.isEmpty(notifyAdd)) {
                    if (TextUtils.isEmpty(notifyText)) {
                        notifyText = notifyAdd;
                    } else {
                        notifyText = notifyText + " [" + notifyAdd + "]";
                    }
                }
                boolean hasMention = LinkParser.hasCurrentUserMention(notifyText);
                String message = LinkParser.stripMentions(Global.replaceEmojiModifiers(notifyText));
                updateNotification(message, msg.peer > 2000000000 ? subject : null, senderProfile.fullName, senderProfile.photo, hasMention, msg.peer);
            }
        } catch (Exception x4) {
            Log.w("vk_longpoll", "Error processing message", x4);
        }
    }

    private void processMessageUpdate(int mid, int peer, int flags, int time, String text, String subject, JSONObject extra, int randomId) {
        int sender;
        Message msg;
        if (DEBUG) {
            Log.i("vk_longpoll", "processMessageUpdate: id=" + mid + ", flags=" + flags + ", peer=" + peer + ", time=" + time + ", subject='" + subject + "', text='" + text + "', extra=" + extra + "', randomId=" + randomId);
        }
        boolean isOut = (flags & 2) > 0;
        try {
            try {
                addMessage.acquire();
                addMessage.release();
            } catch (Exception x) {
                L.e(x, new Object[0]);
            }
            if (peer < 2000000000) {
                sender = isOut ? VKAccountManager.getCurrent().getUid() : peer;
            } else {
                sender = extra.getInt(ServerKeys.FROM);
            }
            if (extra != null && (extra.has("attach1_type") || extra.has(ArgKeys.FWD) || extra.has("geo"))) {
                if (DEBUG) {
                    Log.i("vk_longpoll", "will get message " + mid + " from api");
                }
                VKAPIRequest getMsg = new VKAPIRequest(Messages.METHOD_NAME);
                getMsg.param("message_ids", mid).param(ServerKeys.PHOTO_SIZES, 1).param(GraphRequest.FIELDS_PARAM, "first_name,last_name,photo_100,photo_50");
                try {
                    getMsg.persist(LongPollService.class.getMethod("processFailedMessageUpdateCallback", JSONObject.class, JSONObject.class), null);
                } catch (Exception x2) {
                    L.e(x2, new Object[0]);
                }
                JSONObject res = APIController.runRequest(getMsg);
                if (res != null && res.has(ServerKeys.RESPONSE)) {
                    JSONObject jmsg = APIUtils.unwrapArray(res, ServerKeys.RESPONSE).array.getJSONObject(0);
                    msg = new Message(jmsg);
                } else {
                    Log.w("vk_longpoll", "Error getting full message");
                    return;
                }
            } else {
                msg = new Message();
                msg.peer = peer;
                msg.sender = sender;
                msg.setText(text);
                msg.randomId = randomId;
                msg.time = time;
                msg.id = mid;
                msg.out = isOut;
                msg.readState = false;
                if (peer > 2000000000) {
                    msg.title = subject;
                }
                if (extra != null && extra.has("source_act")) {
                    String act = extra.getString("source_act");
                    msg.putStringExtra(NativeProtocol.WEB_DIALOG_ACTION, act);
                    if ("chat_invite_user".equals(act) || "chat_kick_user".equals(act)) {
                        int uid = extra.getInt("source_mid");
                        msg.putIntExtra("action_mid", uid);
                    }
                    if (extra.has("source_text")) {
                        msg.putStringExtra("action_text", extra.getString("source_text"));
                    }
                    if (extra.has("source_email")) {
                        msg.putStringExtra("action_email", extra.getString("source_email"));
                    }
                }
            }
            if (msg.extras.containsKey(NativeProtocol.WEB_DIALOG_ACTION)) {
                msg.isServiceMessage = true;
            }
            if (msg.out && !msg.isServiceMessage && sendingMessages.size() > 0) {
                pendingReceivedMessages.add(msg);
                return;
            }
            Intent intent = new Intent(ACTION_UPDATE_MESSAGE);
            if (msg.extras.containsKey("action_mid")) {
                int actMid = msg.extras.getInt("action_mid", 0);
                ArrayList<UserProfile> users = Friends.getUsersBlocking(Arrays.asList(Integer.valueOf(actMid)), 3);
                intent.putExtra("action_user_name_acc", users.get(0).fullName);
                msg.putStringExtra("action_user_name_acc", users.get(0).fullName);
            }
            if (DEBUG) {
                Log.i("vk_longpoll", "Message: " + msg);
            }
            ArrayList<Integer> needUsers = new ArrayList<>();
            needUsers.add(Integer.valueOf(sender));
            UserProfile senderProfile = Friends.getUsersBlocking(needUsers).get(0);
            if (senderProfile == null) {
                senderProfile = new UserProfile();
                senderProfile.uid = sender;
                String string = VKApplication.context.getString(R.string.loading);
                senderProfile.fullName = string;
                senderProfile.firstName = string;
                senderProfile.lastName = "";
                senderProfile.photo = "http://vk.com/images/camera_100.gif";
            }
            intent.putExtra("sender_profile", senderProfile);
            intent.putExtra("peer_id", peer);
            intent.putExtra("message", msg);
            intent.putExtra("is_out", isOut);
            intent.putExtra("sender_photo", senderProfile.photo);
            UserProfile peerProfile = null;
            if (peer < 2000000000) {
                ArrayList<UserProfile> pp = Friends.getUsersBlocking(Arrays.asList(Integer.valueOf(peer)));
                UserProfile peerProfile2 = pp.get(0);
                peerProfile = peerProfile2;
                intent.putExtra("peer_profile", peerProfile);
            }
            if (Cache.containsMessage(msg.id)) {
                Messages.add(msg, peerProfile, senderProfile.photo);
                sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
            }
        } catch (Exception x3) {
            Log.w("vk_longpoll", "Error processing message", x3);
        }
    }

    private void processReadUpto(int peerID, int msgID, boolean in) {
        if (!in) {
            try {
                addOwnMessage.acquire();
                addOwnMessage.release();
            } catch (Exception x) {
                L.e(x, new Object[0]);
            }
        }
        Messages.setReadStateUpto(peerID, msgID, in);
        sendBroadcast(createActionMessageRSteteChangedIntent(peerID, msgID, in), "com.vkontakte.android.permission.ACCESS_DATA");
    }

    public static Intent createActionMessageRSteteChangedIntent(int peerID, int msgID, boolean in) {
        return new Intent(ACTION_MESSAGE_RSTATE_CHANGED).putExtra(EXTRA_MSG_ID, msgID).putExtra(EXTRA_READ_STATE, true).putExtra("peer_id", peerID).putExtra("in", in).putExtra("le", true);
    }

    private void processUpdateCounter(int counter) {
        if (!this.newSystem) {
            this.newSystem = true;
            getSharedPreferences("longpoll", 0).edit().putBoolean("new_system", true).commit();
        }
        setNumUnread(counter);
    }

    private void processNotifySettings(JSONObject settings) {
        boolean mute = true;
        try {
            int peer = settings.getInt("peer_id");
            if (settings.getInt("sound") == 1) {
                mute = false;
            }
            int dnd = settings.getInt("disabled_until");
            SharedPreferences prefs = getSharedPreferences("notify", 0);
            if (dnd == -1) {
                dnd = Integer.MAX_VALUE;
            }
            prefs.edit().putBoolean("mute" + peer, mute).putInt("dnd" + peer, dnd).apply();
            if (peer > 2000000000) {
                Intent intent = new Intent(ACTION_CHAT_CHANGED);
                intent.putExtra("id", peer - 2000000000);
                VKApplication.context.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
            } else {
                Intent intent2 = new Intent(ACTION_DIALOG_CHANGED);
                intent2.putExtra("id", peer);
                VKApplication.context.sendBroadcast(intent2, "com.vkontakte.android.permission.ACCESS_DATA");
            }
        } catch (Exception x) {
            Log.w("vk", x);
        }
    }

    private void runLongPoll() {
        Log.d("vk_longpoll", "LongPoll starting");
        if (this.onlineTimer == null) {
            startSendingOnline();
        }
        if (!VKAccountManager.getCurrent().isReal()) {
            Log.d("vk_longpoll", "No user, stopping");
            stopSelf();
            return;
        }
        int nAttempts = 0;
        int updateRetries = 0;
        boolean serverUpdateSuccess = false;
        while (!this.needStop) {
            if (this.server == null || this.key == null || !serverUpdateSuccess) {
                connected = false;
                broadcastStateChanged();
                Log.d("vk_longpoll", "no server info, force updating [retries=" + updateRetries + "]");
                serverUpdateSuccess = updateServerInfo();
                Log.d("vk", "success=" + serverUpdateSuccess);
                updateRetries++;
                if (!serverUpdateSuccess && (!NetworkStateReceiver.isConnected() || updateRetries >= 2)) {
                    stopSelf();
                    return;
                }
            } else {
                String url = "https://" + this.server + "?act=a_check&key=" + this.key + "&ts=" + this.ts + "&wait=25&mode=234&version=1";
                if (this.needStop) {
                    Log.d("vk_longpoll", "LongPoll STOPPED");
                    return;
                }
                byte[] rdata = getURL(url);
                if (this.needStop) {
                    Log.d("vk_longpoll", "LongPoll STOPPED");
                    return;
                } else if (rdata == null) {
                    if (connected) {
                        connected = false;
                        broadcastStateChanged();
                    }
                    if (nAttempts >= 6) {
                        if (!NetworkStateReceiver.isConnected()) {
                            Log.i("vk_longpoll", "No network connection, stopping longpoll");
                            stopSelf();
                            return;
                        }
                        serverUpdateSuccess = updateServerInfo();
                        nAttempts = 0;
                        Log.w("vk_longpoll", "6 errors, reloading server info");
                    } else {
                        Log.w("vk_longpoll", "Connection error. Retry in 5 sec");
                        try {
                            Thread.sleep(5000L);
                        } catch (Exception x) {
                            L.e(x, new Object[0]);
                        }
                        nAttempts++;
                    }
                } else {
                    longPollActive = true;
                    try {
                        String resp = Global.replaceHTML(new String(rdata, "UTF-8"));
                        if (DEBUG) {
                            Log.d("vk_longpoll", "Response: " + resp);
                        }
                        JSONObject r = (JSONObject) new JSONTokener(resp).nextValue();
                        if (r.has("failed")) {
                            Log.w("vk_longpoll", "Got 'failed', reloading server info");
                            serverUpdateSuccess = updateServerInfo();
                            if (connected) {
                                connected = false;
                                broadcastStateChanged();
                            }
                        } else {
                            if (this.needResendOnline) {
                                sendOnline();
                            }
                            this.ts = r.getInt("ts");
                            int pts = r.getInt("pts");
                            if (pts > 0) {
                                getSharedPreferences("longpoll", 0).edit().putInt("pts", pts).commit();
                            }
                            JSONArray u = r.getJSONArray("updates");
                            for (int i = 0; i < u.length(); i++) {
                                JSONArray ev = u.getJSONArray(i);
                                int evtype = ev.getInt(0);
                                switch (evtype) {
                                    case 80:
                                        processUpdateCounter(ev.getInt(1));
                                        break;
                                }
                            }
                            for (int i2 = 0; i2 < u.length(); i2++) {
                                JSONArray ev2 = u.getJSONArray(i2);
                                int evtype2 = ev2.getInt(0);
                                switch (evtype2) {
                                    case 2:
                                        processAddFlags(ev2.getInt(1), ev2.getInt(3), ev2.getInt(2));
                                        break;
                                    case 3:
                                        processClearFlags(ev2.getInt(1), ev2.getInt(3), ev2.getInt(2));
                                        break;
                                    case 4:
                                        processMessageAdd(ev2.getInt(1), ev2.getInt(3), ev2.getInt(2), ev2.getInt(4), ev2.getString(6), ev2.getString(5), ev2.optJSONObject(7), ev2.getInt(8));
                                        break;
                                    case 5:
                                        processMessageUpdate(ev2.getInt(1), ev2.getInt(3), ev2.getInt(2), ev2.getInt(4), ev2.getString(6), ev2.getString(5), ev2.optJSONObject(7), ev2.getInt(8));
                                        break;
                                    case 6:
                                        processReadUpto(ev2.getInt(1), ev2.getInt(2), true);
                                        break;
                                    case 7:
                                        processReadUpto(ev2.getInt(1), ev2.getInt(2), false);
                                        break;
                                    case 8:
                                        int onl = 1;
                                        int lpo = ev2.getInt(2) & 255;
                                        if (lpo == 1) {
                                            onl = 2;
                                        }
                                        if (lpo == 4 || lpo == 2 || lpo == 3 || lpo == 5) {
                                            onl = 3;
                                        }
                                        processOnlineChange(-ev2.getInt(1), onl);
                                        break;
                                    case 9:
                                        processOnlineChange(-ev2.getInt(1), 0);
                                        break;
                                    case 61:
                                        processTyping(ev2.getInt(1), ev2.getInt(1));
                                        break;
                                    case 62:
                                        processTyping(2000000000 + ev2.getInt(2), ev2.getInt(1));
                                        break;
                                    case 80:
                                        break;
                                    case 114:
                                        processNotifySettings(ev2.getJSONObject(1));
                                        break;
                                    default:
                                        Log.w("vk_longpoll", "Unknown event " + ev2.toString());
                                        break;
                                }
                            }
                        }
                    } catch (Exception x2) {
                        Log.e("vk_longpoll", "Exception while parsing", x2);
                    }
                }
            }
        }
        Log.d("vk_longpoll", "LongPoll exiting");
        Thread thread = new Thread(this);
        this.lpThread = thread;
        thread.start();
    }

    public static void playNotificationSound(int peer) {
        if (notificationSoundPool == null) {
            notificationSoundPool = new SoundPool(1, 5, 0);
            notificationSoundID = notificationSoundPool.load(VKApplication.context, R.raw.message, 1);
            notificationSoundPool.setOnLoadCompleteListener(new SoundPool.OnLoadCompleteListener() { // from class: com.vkontakte.android.LongPollService.8
                @Override // android.media.SoundPool.OnLoadCompleteListener
                public void onLoadComplete(SoundPool soundPool, int id, int status) {
                    LongPollService.notificationSoundPool.play(id, 0.5f, 0.5f, 0, 0, 1.0f);
                }
            });
            return;
        }
        notificationSoundPool.play(notificationSoundID, 0.5f, 0.5f, 0, 0, 1.0f);
    }

    public static void updateNotification(@Nullable CharSequence text, String chatTitle, String userName, String userPhoto, boolean hasMention, int userId) {
        Context context = VKApplication.context;
        SharedPreferences nprefs = context.getSharedPreferences("notify", 0);
        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(context);
        if (!hasMention && nprefs.getInt("dnd" + userId, 0) > ((int) (System.currentTimeMillis() / 1000))) {
            Log.d("vk", "dnd for peer " + userId + " is active, is " + nprefs.getInt("dnd" + userId, 0));
        } else if (prefs.getLong("dnd_end", 0L) > System.currentTimeMillis()) {
            Log.d("vk", "global dnd is active");
        } else {
            NotificationUtils.Type type = userId < 2000000000 ? NotificationUtils.Type.PrivateMessages : NotificationUtils.Type.ChatMessages;
            if (!NotificationUtils.areNotificationsEnabled(context, type)) {
                Log.d("vk", "message notifications disabled");
            } else if (ChatFragment.activeInstance != null && ChatFragment.activeInstance.getPeerID() == userId) {
                if (!nprefs.getBoolean("mute" + userId, false) && NotificationUtils.isSoundEnabled(context, type)) {
                    playNotificationSound(userId);
                }
            } else {
                try {
                    NotificationManager mNotificationManager = (NotificationManager) context.getSystemService("notification");
                    notifyCountersChanged();
                    if (getNumNewMessages() == 0) {
                        prevNumNewMessages = 0;
                        mNotificationManager.cancel(10);
                        return;
                    }
                    Uri.Builder bldr = new Uri.Builder().scheme("vkontakte").authority("chat").appendQueryParameter("peer", userId + "").appendQueryParameter("title", chatTitle != null ? chatTitle : userName);
                    if (userPhoto != null) {
                        bldr.appendQueryParameter("photo", userPhoto);
                    }
                    Intent notificationIntent = LinkRedirActivity.createIntentForNotification(context);
                    notificationIntent.setData(bldr.build());
                    notificationIntent.addFlags(268435456);
                    PendingIntent contentIntent = PendingIntent.getActivity(context, 0, notificationIntent, 134217728);
                    Intent cancelIntent = new Intent(context, LongPollService.class);
                    cancelIntent.setAction("com.vkontakte.android.CANCEL_NOTIFICATION");
                    PendingIntent pendingCancel = PendingIntent.getService(context, 0, cancelIntent, 134217728);
                    String ticker = (chatTitle != null ? userName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + context.getResources().getString(R.string.notification_in_chat) : userName) + ": " + ((Object) text);
                    String truncatedChatTitle = null;
                    if (chatTitle != null) {
                        truncatedChatTitle = chatTitle.length() > 40 ? chatTitle.substring(0, 40) + "..." : chatTitle;
                    }
                    notification1 = createNotification(text, chatTitle != null ? userName + " (" + truncatedChatTitle + ")" : userName, userName, chatTitle != null ? context.getResources().getString(R.string.notification_in_chat_summary, chatTitle) : MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR, userPhoto, contentIntent, ticker, userId);
                    notification1.flags |= 16;
                    Log.i("vk_longpoll", prevNumNewMessages + "->" + getNumNewMessages());
                    NotificationUtils.applySettings(context, notification1, type, true);
                    prevNumNewMessages = getNumNewMessages();
                    notification1.number = getNumNewMessages();
                    notification1.deleteIntent = pendingCancel;
                    mNotificationManager.cancel(10);
                    mNotificationManager.notify(10, notification1);
                } catch (Exception x) {
                    Log.w("vk", x);
                }
            }
        }
    }

    private static Notification createNotification(CharSequence text, String title, String expandedTitle, String summary, String photoUrl, PendingIntent contentIntent, String tickerText, int peerID) {
        Bitmap photo;
        Context context = VKApplication.context;
        String ticker = tickerText.length() > 50 ? tickerText.substring(0, 50) + "..." : tickerText;
        if (photoUrl != null) {
            photo = (Bitmap) RxUtil.blockingGetWithNull(VKImageLoader.getCircleBitmap(photoUrl));
        } else {
            photo = Global.getResBitmap(context.getResources(), R.drawable.user_placeholder);
        }
        RemoteInput remoteInput = new RemoteInput.Builder("voice_reply").setLabel(context.getString(R.string.reply_to)).build();
        String replyHash = VKAPIRequest.md5(new Random().nextInt() + "");
        context.getSharedPreferences(null, 0).edit().putString("msg_reply_hash", replyHash).commit();
        Intent voiceReplyIntent = new Intent(context, LinkRedirActivity.class);
        voiceReplyIntent.setData(Uri.parse("vkontakte://reply/?peer=" + peerID + "&hash=" + replyHash));
        voiceReplyIntent.addFlags(268435456);
        PendingIntent voiceReply = PendingIntent.getActivity(context, 0, voiceReplyIntent, 134217728);
        NotificationCompat.Action action = new NotificationCompat.Action.Builder(R.drawable.ic_wear_reply, context.getResources().getString(R.string.reply_to), voiceReply).addRemoteInput(remoteInput).build();
        NotificationCompat.WearableExtender extender = new NotificationCompat.WearableExtender().addAction(action);
        if (peerID > 2000000000) {
            extender.addPage(new Notification.Builder(context).setContentText(summary).getNotification());
        }
        NotificationCompat.Builder builder = new NotificationCompat.Builder(context).setSmallIcon(R.drawable.ic_stat_notify).setContentTitle(title).setContentText(text).setNumber(getNumNewMessages()).setLargeIcon(Bitmap.createScaledBitmap(photo, Global.scale(64.0f), Global.scale(64.0f), true)).setContentIntent(contentIntent).setTicker(ticker).extend(extender);
        builder.setCategory("msg");
        if (Build.VERSION.SDK_INT >= 16) {
            new NotificationCompat.BigTextStyle(builder).bigText(text).setBigContentTitle(expandedTitle).setSummaryText(summary).build();
        }
        Notification n = builder.getNotification();
        if (Build.VERSION.SDK_INT >= 21) {
            n.color = context.getResources().getColor(R.color.brand_primary);
        }
        return n;
    }

    public static void playNotification() {
        Notification n = new Notification();
        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(VKApplication.context);
        if (prefs.getLong("dnd_end", 0L) < System.currentTimeMillis()) {
            if (prefs.getBoolean("notifySound", true)) {
                n.sound = Uri.parse(PreferenceManager.getDefaultSharedPreferences(VKApplication.context).getString("notifyRingtone", Settings.System.DEFAULT_NOTIFICATION_URI.toString()));
            }
            if (prefs.getBoolean("notifyVibrate", true)) {
                n.defaults |= 2;
            }
        }
        NotificationManager mNotificationManager = (NotificationManager) VKApplication.context.getSystemService("notification");
        mNotificationManager.notify(11, n);
    }

    public void startSendingOnline() {
        TimerTask tt = new TimerTask() { // from class: com.vkontakte.android.LongPollService.9
            @Override // java.util.TimerTask, java.lang.Runnable
            public void run() {
                LongPollService.this.sendOnline();
            }
        };
        if (this.onlineTimer != null) {
            try {
                this.onlineTimer.cancel();
            } catch (Exception e) {
            }
        }
        this.onlineTimer = new Timer();
        this.onlineTimer.schedule(tt, 10000L, 120000L);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sendOnline() {
        if (longPollRunning && AppStateTracker.getCurrentActivity() != null) {
            Log.i("vk", "Sending online.");
            Analytics.sendGeoData();
            Analytics.viewPostTime.commit();
            new VKAPIRequest("execute").param(AuthCheckFragment.KEY_CODE, String.format("API.account.setOnline({push_count: %d});%s", Integer.valueOf(VKApplication.context.getSharedPreferences(null, 0).getInt("push_counter", 0)), getTrackEventsString())).setCallback(new Callback<JSONObject>() { // from class: com.vkontakte.android.LongPollService.10
                @Override // com.vkontakte.android.api.Callback
                public void success(JSONObject j) {
                    LongPollService.this.needResendOnline = false;
                    VKApplication.context.getSharedPreferences(null, 0).edit().remove("push_counter").commit();
                    Analytics.clear(false);
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    LongPollService.this.needResendOnline = true;
                    if (error.getCode() == 12 && !Analytics.cleanGeoDataEvents()) {
                        Analytics.clear(true);
                    }
                }
            }).execSync();
            new AccountGetPingUrl().setCallback(new Callback<AccountGetPingUrl.Result>() { // from class: com.vkontakte.android.LongPollService.11
                @Override // com.vkontakte.android.api.Callback
                public void success(AccountGetPingUrl.Result result) {
                    LongPollService.this.needResendOnline = false;
                    if (result.isEnabled) {
                        BenchmarkTracker.getInstance().startMFTracking(result.endpointUrl, result.timeInterval);
                    } else {
                        BenchmarkTracker.getInstance().stopAndResetMFTracking();
                    }
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    if (error.getCode() != 3) {
                        LongPollService.this.needResendOnline = true;
                    }
                }
            }).execSync();
            BenchmarkTracker.getInstance().sendBenchmarkData();
        }
    }

    private void sendOffline() {
        if (VKAccountManager.getCurrent().isReal()) {
            Log.i("vk", "Sending offline.");
            new VKAPIRequest("execute").param(AuthCheckFragment.KEY_CODE, "API.account.setOffline();" + getTrackEventsString()).setCallback(new Callback<JSONObject>() { // from class: com.vkontakte.android.LongPollService.12
                @Override // com.vkontakte.android.api.Callback
                public void success(JSONObject j) {
                    Analytics.clear(false);
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                }
            }).exec();
        }
    }

    public static void sendAnalyticsNow() {
        String code = getTrackEventsString();
        if (!TextUtils.isEmpty(code)) {
            new VKAPIRequest("execute").param(AuthCheckFragment.KEY_CODE, code).setCallback(new Callback<JSONObject>() { // from class: com.vkontakte.android.LongPollService.13
                @Override // com.vkontakte.android.api.Callback
                public void success(JSONObject j) {
                    Analytics.clear(false);
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                }
            }).exec();
        }
    }

    private static String getTrackEventsString() {
        ArrayList<JSONObject> events = new ArrayList<>();
        Analytics.getEvents(events);
        ArrayList<JSONObject> adEvents = new ArrayList<>();
        try {
            Iterator<JSONObject> itr = events.iterator();
            while (itr.hasNext()) {
                JSONObject o = itr.next();
                if (o.getString("e").startsWith("ads/")) {
                    String e = ((String) o.remove("e")).split(CameraUtilsEffects.FILE_DELIM)[1];
                    o.put("event_type", e);
                    itr.remove();
                    adEvents.add(o);
                }
            }
        } catch (Exception x) {
            L.e(x, new Object[0]);
        }
        String res = "";
        if (events.size() > 0) {
            res = res + String.format("API.stats.trackEvents({events:\"[%s]\"});", TextUtils.join(",", events).replace("\"", "\\\""));
        }
        return res + (adEvents.size() > 0 ? "API.adsint.registerAdEvents({events: \"[" + TextUtils.join(",", adEvents).replace("\"", "\\\"") + "]\"});" : "");
    }

    @Override // android.app.Service
    public IBinder onBind(Intent arg0) {
        return null;
    }

    @Override // android.app.Service
    public int onStartCommand(Intent intent, int flags, int startId) {
        Log.i("LocalService", "Received start id " + startId + ": " + intent);
        if (intent != null && "com.vkontakte.android.CANCEL_NOTIFICATION".equals(intent.getAction())) {
            notification1 = null;
            return 2;
        }
        return 2;
    }

    public static void onNotificationOpened() {
        notification1 = null;
    }

    @Override // android.app.Service
    public void onCreate() {
        Log.i("vk_longpoll", "Starting LongPoll service.");
        Global.longPoll = this;
        this.typingCancelThread.start();
        this.newSystem = getSharedPreferences("longpoll", 0).getBoolean("new_system", false);
        start();
    }

    @Override // android.app.Service
    public void onDestroy() {
        Log.i("vk_longpoll", "Stopping LongPoll service.");
        sendOffline();
        stop();
    }

    public static void logout() {
        if (Global.longPoll != null) {
            Global.longPoll.sendOffline();
            Global.longPoll.setNumUnread(0);
            Global.longPoll.stop();
        }
        numNewMessages = 0;
        numFriendRequests = 0;
        numGroupInvitations = 0;
        numFriendSuggestions = 0;
    }

    public static void onReauthError() {
        L.d("Reauth error");
        if (VKAuth.logout()) {
            try {
                Activity act = AppStateTracker.getCurrentActivity();
                if (act != null) {
                    Intent intent = new Intent(act, MainActivity.class);
                    intent.addFlags(67108864);
                    act.startActivity(intent);
                }
            } catch (Exception x) {
                L.e(x, new Object[0]);
            }
        }
    }

    public void stopDelayed() {
        if (this.stopDelayTimer == null && !this.needStop) {
            try {
                this.stopDelayTimer = new Timer();
                this.stopDelayTimer.schedule(new TimerTask() { // from class: com.vkontakte.android.LongPollService.14
                    @Override // java.util.TimerTask, java.lang.Runnable
                    public void run() {
                        LongPollService.this.stopDelayTimer = null;
                        LongPollService.this.stopSelf();
                    }
                }, 180000L);
            } catch (Exception x) {
                L.e(x, new Object[0]);
            }
        }
    }

    public void cancelDelayedStop() {
        if (this.stopDelayTimer != null) {
            this.stopDelayTimer.cancel();
            this.stopDelayTimer = null;
            return;
        }
        this.needStop = false;
        if (this.lpThread == null || !this.started) {
            start();
        }
    }

    private void initClient() {
        if (!this.initClient) {
            OkHttpClient.Builder builder = Network.getInstance().getBuilder(Network.ClientType.CLIENT_LONGPOLL);
            builder.connectTimeout(15L, TimeUnit.SECONDS);
            builder.readTimeout(40L, TimeUnit.SECONDS);
            builder.addNetworkInterceptor(new Interceptor() { // from class: com.vkontakte.android.LongPollService.15
                @Override // okhttp3.Interceptor
                public Response intercept(Interceptor.Chain chain) throws IOException {
                    if (!LongPollService.connected) {
                        LongPollService.connected = true;
                        LongPollService.broadcastStateChanged();
                    }
                    Request req = chain.request();
                    return chain.proceed(req);
                }
            });
            Network.getInstance().setBuilder(Network.ClientType.CLIENT_LONGPOLL, builder);
            this.initClient = true;
        }
    }
}
