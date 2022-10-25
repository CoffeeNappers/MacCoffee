package com.vkontakte.android;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Build;
import android.preference.PreferenceManager;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import com.facebook.GraphRequest;
import com.facebook.appevents.AppEventsConstants;
import com.facebook.messenger.MessengerUtils;
import com.google.android.gms.auth.api.proxy.AuthApiStatusCodes;
import com.google.android.gms.safetynet.SafetyNetStatusCodes;
import com.my.tracker.MyTracker;
import com.my.tracker.MyTrackerParams;
import com.vk.imageloader.ImageNetworkFailHandler;
import com.vkontakte.android.api.APIController;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.execute.GetWallInfo;
import com.vkontakte.android.auth.VKAccount;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.cache.Cache;
import com.vkontakte.android.data.Analytics;
import com.vkontakte.android.data.BenchmarkTracker;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.data.Groups;
import com.vkontakte.android.data.Messages;
import com.vkontakte.android.data.PersistentAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.UserNotification;
import com.vkontakte.android.utils.L;
import com.vkontakte.android.utils.Utils;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class NetworkStateReceiver extends BroadcastReceiver {
    public static final String ACTION_GROUPS_UPDATED = "com.vkontakte.android.GROUPS_UPDATED";
    private static final String LAST_GET_NOTIFY = "last_get_notify";
    private static final String LAST_GET_NOTIFY_APP = "last_get_notify_app";
    public static final int TIME_DELAY = 7200;
    public static boolean isConnected = false;
    public static boolean userInfoUpdated = false;
    private static int tries = 5;
    private static final int[] sl = {1500, AuthApiStatusCodes.AUTH_API_INVALID_CREDENTIALS, 6000, SafetyNetStatusCodes.SAFE_BROWSING_UNSUPPORTED_THREAT_TYPES, 24000};
    private static String currentNetworkType = null;
    private static final String[] highSpeedTypes = {"3g", "lte", "wifi", "ethernet"};
    private static final List<String> FORCED_SYSTEM_APPS = Arrays.asList(BuildConfig.APPLICATION_ID, "com.instagram.android", "com.facebook.katana", MessengerUtils.PACKAGE_NAME);
    private static final ConnectivityManager cm = (ConnectivityManager) VKApplication.context.getSystemService("connectivity");

    static /* synthetic */ int access$210() {
        int i = tries;
        tries = i - 1;
        return i;
    }

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        if ("android.intent.action.TIME_SET".equals(intent.getAction())) {
            updateUserInfo(context);
        } else if ("android.net.conn.CONNECTIVITY_CHANGE".equals(intent.getAction())) {
            boolean _isConnected = !intent.getBooleanExtra("noConnectivity", false) && isConnected();
            if (_isConnected) {
                ImageNetworkFailHandler.onNetworkConnected();
            }
            currentNetworkType = Utils.getNetworkType();
            if (APIController.API_DEBUG) {
                Log.i("vk", "!!!!!!!!!! NETWORK CHANGED to " + currentNetworkType);
            }
            LongPollService.doBroadcastStateChanged();
            if (isConnected != _isConnected) {
                isConnected = _isConnected;
                if (isConnected) {
                    if (Global.longPoll == null && AppStateTracker.getCurrentActivity() != null) {
                        Intent lintent = new Intent(VKApplication.context, LongPollService.class);
                        VKApplication.context.startService(lintent);
                    }
                    Log.i("vk", "Before update info");
                    updateInfo(context);
                    ArrayList<Message> resend = Cache.getResendableMessages();
                    Log.i("vk", "Before resend " + resend);
                    Iterator<Message> it = resend.iterator();
                    while (it.hasNext()) {
                        Message m = it.next();
                        Message msg = Messages.send(m);
                        Messages.add(msg, null, null);
                        Intent b = new Intent(LongPollService.ACTION_MESSAGE_DELETED);
                        b.putExtra(LongPollService.EXTRA_MSG_ID, m.id);
                        context.sendBroadcast(b, "com.vkontakte.android.permission.ACCESS_DATA");
                        Intent b2 = new Intent(LongPollService.ACTION_NEW_MESSAGE);
                        b2.putExtra("peer_id", msg.peer);
                        b2.putExtra("message", msg);
                        context.sendBroadcast(b2, "com.vkontakte.android.permission.ACCESS_DATA");
                    }
                    if (context.getSharedPreferences(null, 0).contains("pending_msg_notification")) {
                        GCMBroadcastReceiver.updateStateAndShowNotification(context.getSharedPreferences(null, 0).getInt("pending_msg_notification", 0));
                    }
                    new Thread(NetworkStateReceiver$$Lambda$1.lambdaFactory$(this)).start();
                }
            }
        } else if ("android.intent.action.TIME_SET".equals(intent.getAction()) || "android.intent.action.TIMEZONE_CHANGED".equals(intent.getAction())) {
            TimeUtils.resyncOffset();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onReceive$0() {
        while (true) {
            try {
                final PersistentAPIRequest preq = Cache.getApiRequest();
                Log.d("vk", "Got api req: " + preq);
                if (preq != null) {
                    final VKAPIRequest<JSONObject> req = new VKAPIRequest<>(preq.method);
                    if (preq.args != null) {
                        Iterator<String> ks = preq.args.keys();
                        while (ks.hasNext()) {
                            String k = ks.next();
                            req.params.put(k, preq.args.getString(k));
                        }
                    }
                    req.setCallback(new Callback<JSONObject>() { // from class: com.vkontakte.android.NetworkStateReceiver.1
                        @Override // com.vkontakte.android.api.Callback
                        public void success(JSONObject r) {
                            String m = req.params.get("method");
                            if ("friends.add".equals(m)) {
                                int uid = Integer.parseInt(req.params.get("user_id"));
                                ArrayList uids = new ArrayList();
                                uids.add(Integer.valueOf(uid));
                                ArrayList p = Friends.getUsersBlocking(uids);
                                Friends.addLocally(p.get(0));
                            }
                            Cache.deleteApiRequest(preq.id);
                            if (preq.callback != null) {
                                try {
                                    preq.callback.invoke(null, r, preq.userdata);
                                } catch (Exception x) {
                                    Log.w("vk", x);
                                }
                            }
                        }

                        @Override // com.vkontakte.android.api.Callback
                        public void fail(VKAPIRequest.VKErrorResponse error) {
                            int errorCode = error.getCodeValue();
                            if (errorCode != 1 && errorCode != 6 && errorCode != 10 && errorCode > 0) {
                                Cache.deleteApiRequest(preq.id);
                            }
                        }
                    });
                    req.execSync();
                } else {
                    return;
                }
            } catch (Exception x) {
                Log.w("vk", x);
                return;
            }
        }
    }

    public static void updateInfo(Context context) {
        if (!userInfoUpdated) {
            Log.v("vk", "about to update user info...");
            if (!VKAccountManager.getCurrent().isReal()) {
                Log.v("vk", "not logged in.");
                return;
            }
            if (!Global.inited) {
                DisplayMetrics metrics = context.getResources().getDisplayMetrics();
                Global.displayDensity = metrics.density;
                Global.inited = true;
            }
            if (VKAccountManager.getCurrent().isReal()) {
                updateUserInfo(context);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void updateUserInfo(final Context context) {
        if (VKAccountManager.getCurrent().isReal()) {
            new GetWallInfo().setCallback(new Callback<GetWallInfo.Result>() { // from class: com.vkontakte.android.NetworkStateReceiver.2
                @Override // com.vkontakte.android.api.Callback
                public void success(GetWallInfo.Result r) {
                    int i = 2;
                    NetworkStateReceiver.userInfoUpdated = true;
                    SharedPreferences prefs = context.getSharedPreferences(null, 0);
                    TimeUtils.setServerTime(r.time);
                    prefs.edit().putInt("time_diff", 0).apply();
                    VKAccountManager.updateCurrent(r);
                    MyTrackerParams customParams = MyTracker.getTrackerParams();
                    VKAccount currentAccount = VKAccountManager.getCurrent();
                    customParams.setVKId(String.valueOf(currentAccount.getUid()));
                    if (!TextUtils.isEmpty(r.bdate)) {
                        String[] parts = r.bdate.split("\\.");
                        if (parts.length == 3) {
                            customParams.setAge(TimeUtils.getAge(Integer.parseInt(parts[0]), Integer.parseInt(parts[1]), Integer.parseInt(parts[2])));
                        }
                    }
                    if (!r.vkAccount.isFemale()) {
                        i = 1;
                    }
                    customParams.setGender(i);
                    SharedPreferences defPrefs = PreferenceManager.getDefaultSharedPreferences(context);
                    VKApplication.setMyTrackLocationEnable(defPrefs.getBoolean("mytrackerLocationCrapEnabled", true));
                    NetworkStateReceiver.updateFriendlist(context);
                    Analytics.sendVideoViewedSegments();
                    Analytics.sendDailyStatistic(context);
                    BenchmarkTracker.getInstance().updateProfileConfig(currentAccount);
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse err) {
                    try {
                        Thread.sleep(NetworkStateReceiver.sl[5 - NetworkStateReceiver.tries]);
                    } catch (Exception x) {
                        L.e(x, new Object[0]);
                    }
                    NetworkStateReceiver.access$210();
                    if (NetworkStateReceiver.tries > 0) {
                        NetworkStateReceiver.updateUserInfo(context);
                    } else {
                        int unused = NetworkStateReceiver.tries = 5;
                    }
                }
            }).exec();
        }
    }

    public static void getNotifications(final Context context) {
        boolean isSystemApp = true;
        int last = context.getSharedPreferences(null, 0).getInt(LAST_GET_NOTIFY, 0);
        if ((System.currentTimeMillis() / 1000) - last >= 3600 && VKAccountManager.getCurrent().isReal()) {
            try {
                if ((context.getPackageManager().getPackageInfo(context.getPackageName(), 0).applicationInfo.flags & 1) != 1) {
                    isSystemApp = false;
                }
                new VKAPIRequest("internal.getNotifications").param("device", Build.MODEL).param("vendor", Build.MANUFACTURER).param("system", isSystemApp ? AppEventsConstants.EVENT_PARAM_VALUE_YES : AppEventsConstants.EVENT_PARAM_VALUE_NO).param("os", Build.VERSION.SDK_INT + "," + Build.VERSION.RELEASE).param("app_version", context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionCode).param("locale", System.getProperty("user.language")).param("ads_device_id", Analytics.getDeviceID()).setCallback(new Callback<JSONObject>() { // from class: com.vkontakte.android.NetworkStateReceiver.3
                    @Override // com.vkontakte.android.api.Callback
                    public void success(JSONObject o) {
                        context.getSharedPreferences(null, 0).edit().putInt(NetworkStateReceiver.LAST_GET_NOTIFY, (int) (System.currentTimeMillis() / 1000)).apply();
                        try {
                            JSONArray a = o.getJSONArray(ServerKeys.RESPONSE);
                            if (a.length() > 0) {
                                JSONObject nt = a.getJSONObject(a.length() - 1);
                                Intent intent = new Intent(context, NotificationActivity.class);
                                Iterator<String> keys = nt.keys();
                                while (keys.hasNext()) {
                                    String key = keys.next();
                                    intent.putExtra(key, nt.getString(key));
                                }
                                intent.addFlags(268435456);
                                context.startActivity(intent);
                            }
                        } catch (Exception x) {
                            Log.w("vk", x);
                        }
                    }

                    @Override // com.vkontakte.android.api.Callback
                    public void fail(VKAPIRequest.VKErrorResponse error) {
                    }
                }).exec();
            } catch (Exception x) {
                L.e(x, new Object[0]);
            }
        }
    }

    public static void getAppNotifications(final Context context) {
        boolean isSystemApp = true;
        int last = context.getSharedPreferences(null, 0).getInt("last_get_notify_app", 0);
        if ((System.currentTimeMillis() / 1000) - last >= 7200 && VKAccountManager.getCurrent().isReal()) {
            try {
                if ((context.getPackageManager().getPackageInfo(context.getPackageName(), 0).applicationInfo.flags & 1) != 1) {
                    isSystemApp = false;
                }
                new VKAPIRequest("internal.getUserNotifications").param("device", Build.MODEL).param("vendor", Build.MANUFACTURER).param("system", isSystemApp ? AppEventsConstants.EVENT_PARAM_VALUE_YES : AppEventsConstants.EVENT_PARAM_VALUE_NO).param("os", Build.VERSION.SDK_INT + "," + Build.VERSION.RELEASE).param("app_version", context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionCode).param("locale", System.getProperty("user.language")).param("ads_device_id", Analytics.getDeviceID()).param(GraphRequest.FIELDS_PARAM, "photo_100,photo_50").param("extended", 1).param(ServerKeys.PHOTO_SIZES, 1).param("connection_type", Utils.getConnectionType()).param("connection_subtype", Utils.getConnectionSubtype()).param("user_options", Utils.getUserOptions()).setCallback(new Callback<JSONObject>() { // from class: com.vkontakte.android.NetworkStateReceiver.4
                    @Override // com.vkontakte.android.api.Callback
                    public void success(JSONObject o) {
                        context.getSharedPreferences(null, 0).edit().putInt("last_get_notify_app", (int) (System.currentTimeMillis() / 1000)).commit();
                        try {
                            List<UserNotification> notifications = UserNotification.parse(o.optJSONObject(ServerKeys.RESPONSE));
                            if (notifications != null) {
                                UserNotification userNotification = null;
                                for (UserNotification notification : notifications) {
                                    if (UserNotification.TYPE_ALERT.equals(notification.type)) {
                                        userNotification = notification;
                                    }
                                }
                                if (userNotification != null) {
                                    Intent intent = new Intent(context, NotificationActivity.class);
                                    intent.putExtra(NotificationActivity.USER_NOTIFICATION, userNotification);
                                    intent.addFlags(268435456);
                                    context.startActivity(intent);
                                }
                            }
                        } catch (Exception x) {
                            Log.w("vk", x);
                        }
                    }

                    @Override // com.vkontakte.android.api.Callback
                    public void fail(VKAPIRequest.VKErrorResponse error) {
                    }
                }).exec();
            } catch (Exception x) {
                L.e(x, new Object[0]);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void updateFriendlist(Context context) {
        if (VKAccountManager.getCurrent().isReal()) {
            Friends.reload(true);
            Groups.reload(true);
        }
    }

    public static boolean isConnected() {
        NetworkInfo info = cm.getActiveNetworkInfo();
        return info != null && info.isConnected();
    }

    public static boolean isHighSpeed() {
        String[] strArr;
        if (currentNetworkType == null) {
            currentNetworkType = Utils.getNetworkType();
        }
        for (String s : highSpeedTypes) {
            if (s.equals(currentNetworkType)) {
                return true;
            }
        }
        return false;
    }
}
