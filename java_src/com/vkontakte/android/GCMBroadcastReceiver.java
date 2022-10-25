package com.vkontakte.android;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.text.Html;
import android.text.Spanned;
import android.text.TextUtils;
import com.facebook.appevents.AppEventsConstants;
import com.facebook.internal.NativeProtocol;
import com.facebook.share.internal.ShareConstants;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.vk.core.util.RxUtil;
import com.vk.imageloader.VKImageLoader;
import com.vk.webapp.ReportAppInputData;
import com.vkontakte.android.NotificationUtils;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.friends.FriendsGetCommonCount;
import com.vkontakte.android.api.wall.WallGetById;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.attachments.GiftAttachment;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.data.Games;
import com.vkontakte.android.data.LikeInfo;
import com.vkontakte.android.data.Messages;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.UserNotification;
import com.vkontakte.android.fragments.AuthCheckFragment;
import com.vkontakte.android.fragments.SignupPhoneFragment;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.stickers.Stickers;
import com.vkontakte.android.utils.L;
import com.vkontakte.android.utils.XSRFTokenUtil;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import io.fabric.sdk.android.services.settings.SettingsJsonConstants;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Set;
import org.json.JSONArray;
/* loaded from: classes2.dex */
public class GCMBroadcastReceiver extends BroadcastReceiver {
    public static final int ID_FRIEND_ACCEPTED_NOTIFICATION = 511;
    public static final int ID_FRIEND_FOUND_NOTIFICATION = 503;
    public static final int ID_FRIEND_NOTIFICATION = 501;
    public static final int ID_GAME_INSTALL_NOTIFICATION = 505;
    public static final int ID_GAME_NOTIFICATION = 504;
    public static final int ID_GIFT_NOTIFICATION = 506;
    public static final int ID_GROUP_ACCEPTED_NOTIFICATION = 512;
    public static final int ID_GROUP_INVITE_NOTIFICATION = 510;
    public static final int ID_LIKE_NOTIFICATION = 507;
    public static final int ID_MONEY_TRANSFER_NOTIFICATION = 600;
    public static final int ID_OPEN_URL_NOTIFICATION_FIRST = 520;
    public static final int ID_POST_PUBLISHED_NOTIFICATION = 513;
    public static final int ID_REPLY_NOTIFICATION = 502;
    public static final int ID_REPOST_NOTIFICATION = 509;
    public static final int ID_SHOW_MESSAGE_NOTIFICATION_FIRST = 580;
    public static final int ID_SUBSCRIBED_POST_NOTIFICATION = 508;
    public static final int ID_UPCOMING_EVENT_NOTIFICATION = 514;
    public static final int ID_VALIDATE_ACTION_NOTIFICATION_FIRST = 560;
    public static final int ID_VALIDATE_DEVICE_NOTIFICATION_FIRST = 540;
    public static final int ID_WALL_POST_NOTIFICATION = 507;
    private static int openUrlNotificationLast = 0;
    private static int validateDeviceNotificationLast = 0;
    private static int validateActionNotificationLast = 0;
    private static int showMessageNotificationLast = 0;

    public static void notify(Context ctx, int id, Notification ntf, boolean noSound) {
        if (noSound) {
            ntf.defaults = 0;
        }
        ((NotificationManager) ctx.getSystemService("notification")).notify(id, ntf);
    }

    private static void cancel(Context ctx, int id) {
        ((NotificationManager) ctx.getSystemService("notification")).cancel(id);
    }

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent _intent) {
        setResultCode(-1);
        new Thread(GCMBroadcastReceiver$$Lambda$1.lambdaFactory$(this, _intent, context)).start();
    }

    public /* synthetic */ void lambda$onReceive$11(Intent _intent, final Context context) {
        String text;
        Notification ntf;
        NotificationUtils.Type xkey;
        Notification ntf2;
        Notification ntf3;
        Notification ntf4;
        Notification ntf5;
        Notification ntf6;
        try {
            final Bundle extras = _intent.getExtras();
            int currentUid = VKAccountManager.getCurrent().getUid();
            if (currentUid == 1708231 || currentUid == 25719408 || currentUid == 178409700 || currentUid == 4899732 || currentUid == 6492 || currentUid == 62177) {
                Log.i("vk", "!!!onmessage!!!");
                Set<String> keys = extras.keySet();
                for (String k : keys) {
                    Log.i("vk", k + " = " + extras.getString(k));
                }
                Log.i("vk", "===============");
            }
            SharedPreferences sprefs = VKApplication.context.getSharedPreferences(null, 0);
            int pcount = sprefs.getInt("push_counter", 0);
            sprefs.edit().putInt("push_counter", pcount + 1).apply();
            SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(context);
            String ckey = extras.getString("collapse_key");
            final boolean noSound = AppEventsConstants.EVENT_PARAM_VALUE_YES.equals(extras.get("no_sound"));
            if ("update_stickers".equals(ckey)) {
                Stickers.get().reload();
            } else if ("sdk_open".equals(ckey)) {
                String iconUrl = extras.getString("app_icon");
                String pkg = extras.getString(ServerKeys.PLATFORM_ID);
                String id = extras.getString("app_id");
                String appName = extras.getString(NativeProtocol.BRIDGE_ARG_APP_NAME_STRING);
                Bitmap icon = (Bitmap) RxUtil.blockingGetWithNull(VKImageLoader.getCircleBitmap(iconUrl));
                Intent intent = new Intent("android.intent.action.VIEW", Uri.parse("vkontakte://app/?pkg=" + pkg + "&id=" + id));
                intent.setPackage(BuildConfig.APPLICATION_ID);
                PendingIntent contentIntent = PendingIntent.getActivity(context, 0, intent, 268435456);
                Notification ntf7 = new Notification.Builder(context).setSmallIcon(R.drawable.ic_stat_notify_purchase).setContentTitle(appName).setContentText(context.getResources().getString(R.string.game_install_notify)).setTicker(context.getResources().getString(R.string.game_install_notify_ticker, appName)).setLargeIcon(icon).setContentIntent(contentIntent).getNotification();
                ntf7.flags |= 16;
                ntf7.defaults |= 2;
                if (Build.VERSION.SDK_INT >= 21) {
                    ntf7.color = context.getResources().getColor(R.color.brand_primary);
                }
                notify(context, ID_GAME_INSTALL_NOTIFICATION, ntf7, noSound);
            } else {
                if (UserNotification.BUTTON_ACTION_OPEN_URL.equals(ckey)) {
                    String text2 = extras.getString("text");
                    boolean tryInternal = AppEventsConstants.EVENT_PARAM_VALUE_YES.equals(extras.getString("try_internal"));
                    String url = extras.getString("url");
                    Intent intent2 = new Intent("android.intent.action.VIEW", Uri.parse(tryInternal ? "vklink://internal/?" + url : url));
                    intent2.putExtra("from_notification", true);
                    if (tryInternal) {
                        intent2.setPackage(BuildConfig.APPLICATION_ID);
                        intent2.putExtra(AuthCheckFragment.KEY_TOKEN, XSRFTokenUtil.generateToken(url));
                    }
                    PendingIntent contentIntent2 = PendingIntent.getActivity(context, openUrlNotificationLast, intent2, 134217728);
                    Notification.Builder bldr = new Notification.Builder(context).setSmallIcon(R.drawable.ic_stat_notify_logo).setContentTitle(extras.containsKey("title") ? extras.getString("title") : context.getString(R.string.app_name)).setContentText(text2).setTicker(text2).setContentIntent(contentIntent2).setAutoCancel(true).setDefaults(2);
                    if (Build.VERSION.SDK_INT >= 16) {
                        ntf6 = new Notification.BigTextStyle(bldr.setPriority(2)).bigText(text2).build();
                    } else {
                        ntf6 = bldr.getNotification();
                    }
                    if (Build.VERSION.SDK_INT >= 21) {
                        ntf6.color = context.getResources().getColor(R.color.brand_primary);
                    }
                    notify(context, openUrlNotificationLast + ID_OPEN_URL_NOTIFICATION_FIRST, ntf6, noSound);
                    openUrlNotificationLast++;
                    openUrlNotificationLast %= 20;
                }
                if ("validate_device".equals(ckey)) {
                    String text3 = extras.getString("text");
                    Intent intent3 = new Intent("android.intent.action.VIEW", Uri.parse("vklink://internal/?" + extras.getString("url")));
                    intent3.setPackage(BuildConfig.APPLICATION_ID);
                    intent3.putExtra("device_token", extras.getString("device_token"));
                    intent3.putExtra(AuthCheckFragment.KEY_TOKEN, XSRFTokenUtil.generateToken(extras.getString("url")));
                    PendingIntent contentIntent3 = PendingIntent.getActivity(context, validateDeviceNotificationLast, intent3, 134217728);
                    Notification.Builder bldr2 = new Notification.Builder(context).setSmallIcon(R.drawable.ic_stat_notify_logo).setContentTitle(context.getString(R.string.app_name)).setContentText(text3).setTicker(text3).setContentIntent(contentIntent3).setAutoCancel(true).setDefaults(2);
                    if (Build.VERSION.SDK_INT >= 16) {
                        ntf5 = new Notification.BigTextStyle(bldr2.setPriority(2)).bigText(text3).build();
                    } else {
                        ntf5 = bldr2.getNotification();
                    }
                    if (Build.VERSION.SDK_INT >= 21) {
                        ntf5.color = context.getResources().getColor(R.color.brand_primary);
                    }
                    notify(context, validateDeviceNotificationLast + ID_VALIDATE_DEVICE_NOTIFICATION_FIRST, ntf5, noSound);
                    validateDeviceNotificationLast++;
                    validateDeviceNotificationLast %= 20;
                }
                if ("validate_action".equals(ckey)) {
                    String text4 = extras.getString("text");
                    String longText = extras.getString("confirm");
                    if (longText == null) {
                        longText = text4;
                    }
                    String hash = extras.getString("confirm_hash");
                    Intent intent4 = new Intent(VKApplication.context, ConfirmActionBroadcastReceiver.class);
                    intent4.putExtra("confirm_text", longText);
                    intent4.putExtra(SettingsJsonConstants.ICON_HASH_KEY, hash);
                    intent4.putExtra("notification_id", validateActionNotificationLast + ID_VALIDATE_ACTION_NOTIFICATION_FIRST);
                    intent4.putExtra(AuthCheckFragment.KEY_TOKEN, XSRFTokenUtil.generateToken(hash));
                    intent4.setAction(ConfirmActionBroadcastReceiver.ACTION_OPEN_BOX);
                    PendingIntent contentIntent4 = PendingIntent.getBroadcast(context, validateActionNotificationLast, intent4, 134217728);
                    Notification.Builder bldr3 = new Notification.Builder(context).setSmallIcon(R.drawable.ic_stat_notify_logo).setContentTitle(context.getString(R.string.confirm_action_title)).setContentText(text4).setTicker(text4).setContentIntent(contentIntent4).setAutoCancel(true).setDefaults(2);
                    if (Build.VERSION.SDK_INT >= 16) {
                        Intent confirmIntent = new Intent(VKApplication.context, ConfirmActionBroadcastReceiver.class);
                        confirmIntent.putExtra(SettingsJsonConstants.ICON_HASH_KEY, hash);
                        confirmIntent.putExtra("notification_id", validateActionNotificationLast + ID_VALIDATE_ACTION_NOTIFICATION_FIRST);
                        confirmIntent.putExtra(AuthCheckFragment.KEY_TOKEN, XSRFTokenUtil.generateToken(hash));
                        confirmIntent.setAction(ConfirmActionBroadcastReceiver.ACTION_CONFIRM);
                        Intent declineIntent = new Intent(VKApplication.context, ConfirmActionBroadcastReceiver.class);
                        declineIntent.putExtra(SettingsJsonConstants.ICON_HASH_KEY, hash);
                        declineIntent.putExtra("notification_id", validateActionNotificationLast + ID_VALIDATE_ACTION_NOTIFICATION_FIRST);
                        declineIntent.putExtra(AuthCheckFragment.KEY_TOKEN, XSRFTokenUtil.generateToken(hash));
                        declineIntent.setAction(ConfirmActionBroadcastReceiver.ACTION_DECLINE);
                        bldr3.addAction(R.drawable.ic_check_24dp, context.getString(R.string.signup_confirm), PendingIntent.getBroadcast(context, validateActionNotificationLast, confirmIntent, 134217728));
                        bldr3.addAction(R.drawable.ic_temp_close, context.getString(R.string.cancel), PendingIntent.getBroadcast(context, validateActionNotificationLast, declineIntent, 134217728));
                        bldr3.setPriority(2);
                    }
                    if (Build.VERSION.SDK_INT >= 16) {
                        ntf4 = new Notification.BigTextStyle(bldr3).bigText(text4).build();
                    } else {
                        ntf4 = bldr3.getNotification();
                    }
                    if (Build.VERSION.SDK_INT >= 21) {
                        ntf4.color = context.getResources().getColor(R.color.brand_primary);
                    }
                    notify(context, validateActionNotificationLast + ID_VALIDATE_ACTION_NOTIFICATION_FIRST, ntf4, noSound);
                    validateActionNotificationLast++;
                    validateActionNotificationLast %= 20;
                }
                if ("show_message".equals(ckey)) {
                    String text5 = extras.getString("text");
                    String longText2 = extras.getString("message");
                    if (longText2 == null) {
                        longText2 = text5;
                    }
                    Intent intent5 = new Intent(VKApplication.context, ConfirmActionBroadcastReceiver.class);
                    intent5.putExtra("text", longText2);
                    if (extras.containsKey(ServerKeys.BUTTON)) {
                        intent5.putExtra(ServerKeys.BUTTON, extras.getString(ServerKeys.BUTTON));
                    }
                    intent5.putExtra("title", extras.containsKey("title") ? extras.getString("title") : context.getString(R.string.app_name));
                    intent5.putExtra(SettingsJsonConstants.ICON_HASH_KEY, text5);
                    intent5.putExtra(AuthCheckFragment.KEY_TOKEN, XSRFTokenUtil.generateToken(text5));
                    intent5.setAction(ConfirmActionBroadcastReceiver.ACTION_OPEN_NOTIFICATION);
                    PendingIntent contentIntent5 = PendingIntent.getBroadcast(context, validateActionNotificationLast, intent5, 134217728);
                    Notification.Builder bldr4 = new Notification.Builder(context).setSmallIcon(R.drawable.ic_stat_notify_logo).setContentTitle(extras.containsKey("title") ? extras.getString("title") : context.getString(R.string.app_name)).setContentText(text5).setTicker(text5).setContentIntent(contentIntent5).setAutoCancel(true).setDefaults(2);
                    if (Build.VERSION.SDK_INT >= 16) {
                        ntf3 = new Notification.BigTextStyle(bldr4).bigText(Html.fromHtml(longText2)).build();
                    } else {
                        ntf3 = bldr4.getNotification();
                    }
                    if (Build.VERSION.SDK_INT >= 21) {
                        ntf3.color = context.getResources().getColor(R.color.brand_primary);
                    }
                    notify(context, showMessageNotificationLast + ID_SHOW_MESSAGE_NOTIFICATION_FIRST, ntf3, noSound);
                    showMessageNotificationLast++;
                    showMessageNotificationLast %= 20;
                }
                if (prefs.getLong("dnd_end", 0L) > System.currentTimeMillis()) {
                    Log.d("vk", "global dnd is active");
                } else if ("wall_post".equals(ckey)) {
                    if (!NotificationUtils.areNotificationsEnabled(context, NotificationUtils.Type.Posts)) {
                        Log.d("vk", "posts notifications disabled");
                    } else {
                        new WallGetById(new String[]{extras.getString("place").replace(ReportAppInputData.REPORT_TYPE_WALL, "")}).setCallback(new SimpleCallback<NewsEntry[]>() { // from class: com.vkontakte.android.GCMBroadcastReceiver.1
                            {
                                GCMBroadcastReceiver.this = this;
                            }

                            @Override // com.vkontakte.android.api.Callback
                            public void success(NewsEntry[] result) {
                                Notification ntf8;
                                if (result.length >= 1) {
                                    NewsEntry e = result[0];
                                    String text6 = Attachment.appendLocalizedDescription(LinkParser.stripMentions(Global.replaceEmojiModifiers(e.text)), e.attachments);
                                    Intent intent6 = LinkRedirActivity.createIntentForNotification(context);
                                    intent6.setAction("sadfdsavcxbxcbv");
                                    intent6.setData(Uri.parse("vkontakte://vk.com/" + extras.getString("place")));
                                    intent6.addFlags(268435456);
                                    Bitmap photo = (Bitmap) RxUtil.blockingGetWithNull(VKImageLoader.getCircleBitmap(e.userPhotoURL));
                                    Notification.Builder contentText = new Notification.Builder(context).setWhen(e.time * 1000).setContentTitle(e.userName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + context.getString(R.string.commented_post_s)).setContentIntent(PendingIntent.getActivity(context, 0, intent6, 268435456)).setContentText(text6);
                                    if (photo == null) {
                                        photo = Global.getResBitmap(context.getResources(), R.drawable.user_placeholder);
                                    }
                                    Notification.Builder bldr5 = contentText.setLargeIcon(Bitmap.createScaledBitmap(photo, Global.scale(64.0f), Global.scale(64.0f), true)).setSmallIcon(R.drawable.ic_stat_notify_reply);
                                    if (Build.VERSION.SDK_INT >= 16) {
                                        ntf8 = new Notification.BigTextStyle(bldr5).bigText(text6).build();
                                    } else {
                                        ntf8 = bldr5.getNotification();
                                    }
                                    ntf8.flags |= 16;
                                    NotificationUtils.applySettings(context, ntf8, NotificationUtils.Type.Posts, true);
                                    GCMBroadcastReceiver.notify(context, 507, ntf8, noSound);
                                    LongPollService.updateCounters();
                                }
                            }
                        }).exec();
                    }
                } else if (UserNotification.LAYOUT_NEWSFEED_NEW_POST.equals(ckey)) {
                    new WallGetById(new String[]{extras.getString(ServerKeys.FROM_ID) + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + extras.getString(ShareConstants.WEB_DIALOG_RESULT_PARAM_POST_ID)}).setCallback(new SimpleCallback<NewsEntry[]>() { // from class: com.vkontakte.android.GCMBroadcastReceiver.2
                        {
                            GCMBroadcastReceiver.this = this;
                        }

                        @Override // com.vkontakte.android.api.Callback
                        public void success(NewsEntry[] result) {
                            Notification ntf8;
                            if (result.length >= 1) {
                                NewsEntry e = result[0];
                                String text6 = Attachment.appendLocalizedDescription(LinkParser.stripMentions(Global.replaceEmojiModifiers(e.text)), e.attachments);
                                Intent intent6 = LinkRedirActivity.createIntentForNotification(context);
                                intent6.setAction("zmxcnvmxndflsajlksda");
                                intent6.setData(Uri.parse("vkontakte://vk.com/wall" + extras.getString(ServerKeys.FROM_ID) + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + extras.getString(ShareConstants.WEB_DIALOG_RESULT_PARAM_POST_ID)));
                                intent6.addFlags(268435456);
                                Bitmap photo = (Bitmap) RxUtil.blockingGetWithNull(VKImageLoader.getCircleBitmap(e.userPhotoURL));
                                Notification.Builder contentText = new Notification.Builder(context).setWhen(e.time * 1000).setContentTitle(e.userName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + context.getString(R.string.notification_new_post)).setContentIntent(PendingIntent.getActivity(context, 0, intent6, 268435456)).setContentText(text6);
                                if (photo == null) {
                                    photo = Global.getResBitmap(context.getResources(), R.drawable.user_placeholder);
                                }
                                Notification.Builder bldr5 = contentText.setLargeIcon(Bitmap.createScaledBitmap(photo, Global.scale(64.0f), Global.scale(64.0f), true)).setSmallIcon(R.drawable.ic_stat_notify_reply);
                                if (Build.VERSION.SDK_INT >= 16) {
                                    ntf8 = new Notification.BigTextStyle(bldr5).bigText(text6).build();
                                } else {
                                    ntf8 = bldr5.getNotification();
                                }
                                ntf8.flags |= 16;
                                NotificationUtils.applySettings(context, ntf8, NotificationUtils.Type.Default, true);
                                GCMBroadcastReceiver.notify(context, GCMBroadcastReceiver.ID_SUBSCRIBED_POST_NOTIFICATION, ntf8, noSound);
                                LongPollService.updateCounters();
                            }
                        }
                    }).exec();
                } else if (ShareConstants.WEB_DIALOG_RESULT_PARAM_REQUEST_ID.equals(ckey) || "invite".equals(ckey)) {
                    if (!NotificationUtils.areNotificationsEnabled(context, NotificationUtils.Type.Games)) {
                        Log.d("vk", "games notifications disabled");
                        return;
                    }
                    int uid = Integer.parseInt(extras.getString(ServerKeys.FROM_ID));
                    ArrayList<UserProfile> users = Friends.getUsersBlocking(Collections.singletonList(Integer.valueOf(uid)));
                    if (users.size() != 0) {
                        UserProfile user = users.get(0);
                        String fullName = extras.containsKey("from_name") ? extras.getString("from_name") : user.fullName;
                        Intent intent6 = LinkRedirActivity.createIntentForNotification(context);
                        intent6.setAction("fdsafdsafdsafdasfdsafasfdfdsaf");
                        if (extras.containsKey("app_id")) {
                            intent6.setData(Uri.parse("vkontakte://vk.com/apps?from_notification=1&game_id=" + extras.get("app_id")));
                        } else {
                            intent6.setData(Uri.parse("vkontakte://vk.com/apps?from_notification=1"));
                        }
                        intent6.addFlags(268435456);
                        if (ShareConstants.WEB_DIALOG_RESULT_PARAM_REQUEST_ID.equals(ckey)) {
                            if (extras.containsKey("text") && extras.getString("text").trim().length() > 0) {
                                text = extras.getString("text");
                            } else {
                                text = context.getResources().getString(user.f ? R.string.games_notify_request_f : R.string.games_notify_request_m, extras.getString(NativeProtocol.BRIDGE_ARG_APP_NAME_STRING));
                            }
                        } else {
                            text = context.getResources().getString(R.string.games_notify_invite, extras.getString(NativeProtocol.BRIDGE_ARG_APP_NAME_STRING));
                        }
                        Bitmap photo = (Bitmap) RxUtil.blockingGetWithNull(VKImageLoader.getCircleBitmap(user.photo));
                        Notification.Builder autoCancel = new Notification.Builder(context).setContentTitle(fullName).setContentText(text).setContentIntent(PendingIntent.getActivity(context, 0, intent6, 268435456)).setTicker(fullName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + text).setAutoCancel(true);
                        if (photo == null) {
                            photo = Global.getResBitmap(context.getResources(), R.drawable.user_placeholder);
                        }
                        Notification.Builder bldr5 = autoCancel.setLargeIcon(Bitmap.createScaledBitmap(photo, Global.scale(64.0f), Global.scale(64.0f), true)).setSmallIcon(R.drawable.ic_stat_notify_game);
                        if (Build.VERSION.SDK_INT >= 16) {
                            ntf = new Notification.BigTextStyle(bldr5).setBigContentTitle(user.fullName).bigText(text).build();
                        } else {
                            ntf = bldr5.getNotification();
                        }
                        NotificationUtils.applySettings(context, ntf, NotificationUtils.Type.Games, true);
                        if (Build.VERSION.SDK_INT >= 21) {
                            ntf.color = context.getResources().getColor(R.color.brand_primary);
                            ntf.category = "social";
                        }
                        notify(context, ID_GAME_NOTIFICATION, ntf, noSound);
                        LongPollService.updateCounters();
                        context.sendBroadcast(new Intent(Games.ACTION_RELOAD_REQUESTS), "com.vkontakte.android.permission.ACCESS_DATA");
                    }
                } else if ("gift".equals(ckey)) {
                    if (!NotificationUtils.areNotificationsEnabled(context, NotificationUtils.Type.Gifts)) {
                        Log.d("vk", "messages notifications disabled");
                        return;
                    }
                    int uid2 = Integer.parseInt(extras.getString(ServerKeys.FROM_ID));
                    ArrayList<UserProfile> users2 = Friends.getUsersBlocking(Collections.singletonList(Integer.valueOf(uid2)));
                    if (users2.size() != 0) {
                        UserProfile user2 = users2.get(0);
                        Intent intent7 = LinkRedirActivity.createIntentForNotification(context);
                        intent7.setAction("gfhdjsklhdfjsk");
                        intent7.setData(Uri.parse("vkontakte://vk.com/feed?section=notifications"));
                        intent7.addFlags(268435456);
                        String text6 = context.getResources().getString(user2.f ? R.string.new_gift_notification_f : R.string.new_gift_notification_m);
                        Bitmap photo2 = (Bitmap) RxUtil.blockingGetWithNull(VKImageLoader.getCircleBitmap(user2.photo));
                        Notification.Builder ticker = new Notification.Builder(context).setContentTitle(user2.fullName).setContentText(text6).setContentIntent(PendingIntent.getActivity(context, 0, intent7, 268435456)).setTicker(user2.fullName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + text6);
                        if (photo2 == null) {
                            photo2 = Global.getResBitmap(context.getResources(), R.drawable.user_placeholder);
                        }
                        Notification.Builder bldr6 = ticker.setLargeIcon(Bitmap.createScaledBitmap(photo2, Global.scale(64.0f), Global.scale(64.0f), true)).setSmallIcon(R.drawable.ic_stat_notify_birthday);
                        if (Build.VERSION.SDK_INT >= 16) {
                            ntf2 = new Notification.BigTextStyle(bldr6).setBigContentTitle(user2.fullName).bigText(text6).build();
                        } else {
                            ntf2 = bldr6.getNotification();
                        }
                        ntf2.flags |= 16;
                        NotificationUtils.applySettings(context, ntf2, NotificationUtils.Type.Gifts, true);
                        if (Build.VERSION.SDK_INT >= 21) {
                            ntf2.color = context.getResources().getColor(R.color.brand_primary);
                            ntf2.category = "social";
                        }
                        notify(context, ID_GIFT_NOTIFICATION, ntf2, noSound);
                    }
                } else {
                    if (LikeInfo.DATA_FRIEND.equals(ckey)) {
                        if (!NotificationUtils.areNotificationsEnabled(context, NotificationUtils.Type.FriendRequests)) {
                            Log.d("vk", "friend notifications disabled");
                            return;
                        }
                        int cnt = Integer.parseInt(extras.getString("badge"));
                        int uid3 = Integer.parseInt(extras.getString(ArgKeys.UID));
                        Intent intent8 = new Intent("android.intent.action.VIEW", Uri.parse("vkontakte://vk.com/friends?section=requests"));
                        ArrayList<Integer> uids = new ArrayList<>();
                        uids.add(Integer.valueOf(uid3));
                        Friends.getUsers(uids, GCMBroadcastReceiver$$Lambda$3.lambdaFactory$(context, intent8, cnt, noSound));
                    }
                    if ("group_invite".equals(ckey)) {
                        if (!NotificationUtils.areNotificationsEnabled(context, NotificationUtils.Type.GroupInvites)) {
                            Log.d("vk", "group notifications disabled");
                            return;
                        } else {
                            int uid4 = -Integer.parseInt(extras.getString("group_id"));
                            Friends.getUsers(Arrays.asList(Integer.valueOf(uid4), Integer.valueOf(Integer.parseInt(extras.getString(ServerKeys.FROM_ID)))), GCMBroadcastReceiver$$Lambda$4.lambdaFactory$(context, new Intent("android.intent.action.VIEW", Uri.parse("vkontakte://profile/" + uid4)), noSound));
                        }
                    }
                    if ("msg".equals(ckey)) {
                        if (LongPollService.longPollRunning) {
                            Log.i("vk", "LongPoll running, push message discarded");
                            return;
                        }
                        int peer = Integer.parseInt(extras.getString(ArgKeys.UID));
                        if (!prefs.getBoolean(peer > 2000000000 ? "notificationsChatMessages" : "notificationsPrivateMessages", true)) {
                            Log.d("vk", "message notifications disabled");
                            return;
                        }
                        int num = Integer.parseInt(extras.getString("badge"));
                        int mid = Integer.parseInt(extras.getString(LongPollService.EXTRA_MSG_ID));
                        LongPollService.setNumNewMessages(num);
                        updateStateAndShowNotification(mid);
                    }
                    if ("friend_found".equals(ckey)) {
                        if (!NotificationUtils.areNotificationsEnabled(context, NotificationUtils.Type.FoundFriends)) {
                            Log.d("vk", "friend notifications disabled");
                            return;
                        }
                        int uid5 = Integer.parseInt(extras.getString(ArgKeys.UID));
                        String service = extras.getString("service");
                        ArrayList<Integer> uids2 = new ArrayList<>();
                        uids2.add(Integer.valueOf(uid5));
                        Friends.getUsers(uids2, GCMBroadcastReceiver$$Lambda$5.lambdaFactory$(uid5, service, context, noSound));
                    }
                    if ("friend_accepted".equals(ckey)) {
                        int uid6 = Integer.parseInt(extras.getString(ArgKeys.UID));
                        ArrayList<Integer> uids3 = new ArrayList<>();
                        uids3.add(Integer.valueOf(uid6));
                        Friends.getUsers(uids3, GCMBroadcastReceiver$$Lambda$6.lambdaFactory$(uid6, context, noSound));
                        return;
                    }
                    if ("money_transfer".equals(ckey)) {
                        int uid7 = Integer.parseInt(extras.getString("to_id"));
                        ArrayList<Integer> uids4 = new ArrayList<>();
                        uids4.add(Integer.valueOf(uid7));
                        Friends.getUsers(uids4, GCMBroadcastReceiver$$Lambda$7.lambdaFactory$(context, extras, noSound));
                    }
                    if ("group_accepted".equals(ckey)) {
                        int gid = Integer.parseInt(extras.getString("group_id"));
                        ArrayList<Integer> uids5 = new ArrayList<>();
                        uids5.add(Integer.valueOf(-gid));
                        Friends.getUsers(uids5, GCMBroadcastReceiver$$Lambda$8.lambdaFactory$(gid, context, noSound));
                    } else if ("event_soon".equals(ckey)) {
                        if (!NotificationUtils.areNotificationsEnabled(context, NotificationUtils.Type.UpcomingEvents)) {
                            Log.d("vk", "upcoming events notifications disabled");
                            return;
                        }
                        int gid2 = Integer.parseInt(extras.getString("group_id"));
                        int startTime = Integer.parseInt(extras.getString(FirebaseAnalytics.Param.START_DATE));
                        ArrayList<Integer> uids6 = new ArrayList<>();
                        uids6.add(Integer.valueOf(-gid2));
                        Friends.getUsers(uids6, GCMBroadcastReceiver$$Lambda$9.lambdaFactory$(gid2, context, startTime, noSound));
                    } else if ("wall_publish".equals(ckey)) {
                        int gid3 = Integer.parseInt(extras.getString("group_id"));
                        ArrayList<Integer> uids7 = new ArrayList<>();
                        uids7.add(Integer.valueOf(-gid3));
                        Friends.getUsers(uids7, GCMBroadcastReceiver$$Lambda$10.lambdaFactory$(extras, context, noSound));
                    } else if ("like".equals(ckey)) {
                        if (!NotificationUtils.areNotificationsEnabled(context, NotificationUtils.Type.Likes)) {
                            Log.d("vk", "likes notifications disabled");
                            return;
                        }
                        int uid8 = Integer.parseInt(extras.getString(ServerKeys.FROM_ID));
                        extras.getString("object");
                        new Intent("android.intent.action.VIEW", Uri.parse("vkontakte://vk.com/feed?section=notifications")).addFlags(268435456);
                        Friends.getUsers(Collections.singletonList(Integer.valueOf(uid8)), GCMBroadcastReceiver$$Lambda$11.lambdaFactory$(context, extras, noSound), 2);
                    } else if ("repost".equals(ckey)) {
                        if (!NotificationUtils.areNotificationsEnabled(context, NotificationUtils.Type.Reposts)) {
                            Log.d("vk", "reposts notifications disabled");
                            return;
                        }
                        int uid9 = Integer.parseInt(extras.getString(ServerKeys.FROM_ID));
                        new Intent("android.intent.action.VIEW", Uri.parse("vkontakte://vk.com/feed?section=notifications")).addFlags(268435456);
                        Friends.getUsers(Collections.singletonList(Integer.valueOf(uid9)), GCMBroadcastReceiver$$Lambda$12.lambdaFactory$(context, extras, noSound));
                    } else {
                        if ("reply".equals(ckey) || "comment".equals(ckey) || "mention".equals(ckey)) {
                            char c = 65535;
                            switch (ckey.hashCode()) {
                                case 108401386:
                                    if (ckey.equals("reply")) {
                                        c = 0;
                                        break;
                                    }
                                    break;
                                case 950345194:
                                    if (ckey.equals("mention")) {
                                        c = 1;
                                        break;
                                    }
                                    break;
                                case 950398559:
                                    if (ckey.equals("comment")) {
                                        c = 2;
                                        break;
                                    }
                                    break;
                            }
                            switch (c) {
                                case 0:
                                    xkey = NotificationUtils.Type.Replies;
                                    break;
                                case 1:
                                    xkey = NotificationUtils.Type.Mentions;
                                    break;
                                default:
                                    xkey = NotificationUtils.Type.Comments;
                                    break;
                            }
                            if (!NotificationUtils.areNotificationsEnabled(context, xkey)) {
                                Log.d("vk", "reply/mention notifications disabled");
                                return;
                            }
                            String text7 = LinkParser.stripMentions(LinkParser.stripMentions(Global.replaceEmojiModifiers(extras.getString("text")).replace("<br>", " / ")));
                            int uid10 = Integer.parseInt(extras.getString(ServerKeys.FROM_ID));
                            boolean isReply = "reply".equals(extras.getString(ServerKeys.TYPE));
                            boolean isMention = "mention".equals(extras.getString(ServerKeys.TYPE));
                            ArrayList<Integer> al = new ArrayList<>();
                            al.add(Integer.valueOf(uid10));
                            Intent intent9 = new Intent("android.intent.action.VIEW", Uri.parse("vkontakte://vk.com/feed?section=notifications"));
                            intent9.addFlags(268435456);
                            String place = extras.getString("place");
                            int replyID = extras.containsKey("reply_id") ? Integer.parseInt(extras.getString("reply_id")) : 0;
                            Friends.getUsers(al, GCMBroadcastReceiver$$Lambda$13.lambdaFactory$(context, intent9, place, isReply, isMention, replyID, text7, xkey, noSound));
                        }
                        if ("birthday".equals(ckey)) {
                            Intent bdIntent = new Intent(context, BirthdayBroadcastReceiver.class);
                            bdIntent.putExtra("uids", extras.getString("uids"));
                            bdIntent.putExtra("force", true);
                            context.sendBroadcast(bdIntent);
                        }
                    }
                }
            }
        } catch (Exception x) {
            Log.w("vk", "Error processing GCM message", x);
        }
    }

    public static /* synthetic */ void lambda$null$0(Context context, Intent intent, int cnt, boolean noSound, ArrayList users) {
        int commonCount;
        if (users.size() >= 1) {
            UserProfile user = (UserProfile) users.get(0);
            try {
                commonCount = ((Integer) new FriendsGetCommonCount(user.uid).execSyncWithResult()).intValue();
            } catch (Throwable t) {
                t.printStackTrace();
                commonCount = 0;
            }
            PendingIntent pIntent = PendingIntent.getActivity(context, 0, intent, 134217728);
            Intent intentAccept = new Intent(NotificationButtonsReceiver.ACTION_ACCEPT_FRIEND);
            intentAccept.putExtra(ArgKeys.UID, user.uid);
            intentAccept.putExtra(AuthCheckFragment.KEY_TOKEN, XSRFTokenUtil.generateToken(user.uid + ""));
            PendingIntent pIntentAccept = PendingIntent.getBroadcast(context, 1, intentAccept, 1342177280);
            Intent intentDecline = new Intent(NotificationButtonsReceiver.ACTION_DECLINE_FRIEND);
            intentDecline.putExtra(ArgKeys.UID, user.uid);
            intentDecline.putExtra(AuthCheckFragment.KEY_TOKEN, XSRFTokenUtil.generateToken(user.uid + ""));
            PendingIntent pIntentDecline = PendingIntent.getBroadcast(context, 2, intentDecline, 1342177280);
            Bitmap photo = (Bitmap) RxUtil.blockingGetWithNull(VKImageLoader.getCircleBitmap(user.photo));
            String subtitle = context.getResources().getString(R.string.add_friend_notify);
            if (commonCount > 0) {
                subtitle = subtitle + " (" + context.getResources().getQuantityString(R.plurals.friends_mutual, commonCount, Integer.valueOf(commonCount)) + ')';
            }
            Notification.Builder contentIntent = new Notification.Builder(context).setContentTitle(user.fullName).setContentText(subtitle).setContentIntent(pIntent);
            if (photo == null) {
                photo = Global.getResBitmap(context.getResources(), R.drawable.user_placeholder);
            }
            Notification.Builder ntfb = contentIntent.setLargeIcon(Bitmap.createScaledBitmap(photo, Global.scale(64.0f), Global.scale(64.0f), true)).setSmallIcon(R.drawable.ic_stat_notify_request).setNumber(cnt).setTicker(user.fullName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + subtitle);
            if (Build.VERSION.SDK_INT >= 16) {
                ntfb.addAction(R.drawable.ic_check_24dp, context.getResources().getString(R.string.friends_add), pIntentAccept).addAction(R.drawable.ic_temp_close, context.getResources().getString(R.string.friends_decline), pIntentDecline);
                if (commonCount > 0) {
                    ntfb.setStyle(new Notification.BigTextStyle().bigText(subtitle));
                }
            }
            Notification ntf1 = ntfb.getNotification();
            ntf1.flags |= 16;
            NotificationUtils.applySettings(context, ntf1, NotificationUtils.Type.FriendRequests, true);
            notify(context, ID_FRIEND_NOTIFICATION, ntf1, noSound);
            LongPollService.updateCounters();
        }
    }

    public static /* synthetic */ void lambda$null$1(Context context, Intent intent, boolean noSound, ArrayList users) {
        if (users.size() >= 2) {
            UserProfile user = (UserProfile) users.get(0);
            UserProfile inviter = (UserProfile) users.get(1);
            if (user.uid > 0) {
                inviter = user;
                user = inviter;
            }
            PendingIntent pIntent = PendingIntent.getActivity(context, 0, intent, 134217728);
            Intent intentAccept = new Intent(NotificationButtonsReceiver.ACTION_ACCEPT_GROUP);
            intentAccept.putExtra("gid", -user.uid);
            intentAccept.putExtra(AuthCheckFragment.KEY_TOKEN, XSRFTokenUtil.generateToken(user.uid + ""));
            PendingIntent pIntentAccept = PendingIntent.getBroadcast(context, 1, intentAccept, 1342177280);
            Intent intentDecline = new Intent(NotificationButtonsReceiver.ACTION_DECLINE_GROUP);
            intentDecline.putExtra("gid", -user.uid);
            intentDecline.putExtra(AuthCheckFragment.KEY_TOKEN, XSRFTokenUtil.generateToken(user.uid + ""));
            PendingIntent pIntentDecline = PendingIntent.getBroadcast(context, 2, intentDecline, 1342177280);
            Bitmap photo = (Bitmap) RxUtil.blockingGetWithNull(VKImageLoader.getCircleBitmap(user.photo));
            Notification.Builder contentIntent = new Notification.Builder(context).setContentTitle(user.fullName).setContentText(context.getResources().getString(R.string.group_invites_you, inviter.fullName)).setContentIntent(pIntent);
            if (photo == null) {
                photo = Global.getResBitmap(context.getResources(), R.drawable.group_placeholder);
            }
            Notification.Builder ntfb = contentIntent.setLargeIcon(Bitmap.createScaledBitmap(photo, Global.scale(64.0f), Global.scale(64.0f), true)).setSmallIcon(R.drawable.ic_stat_notify_group).setTicker(context.getResources().getString(R.string.group_invite_ticker, inviter.fullName, user.fullName));
            if (Build.VERSION.SDK_INT >= 16) {
                ntfb.addAction(R.drawable.ic_check_24dp, context.getResources().getString(R.string.group_inv_accept), pIntentAccept).addAction(R.drawable.ic_temp_close, context.getResources().getString(R.string.group_inv_decline), pIntentDecline);
            }
            Notification ntf1 = ntfb.getNotification();
            ntf1.flags |= 16;
            NotificationUtils.applySettings(context, ntf1, NotificationUtils.Type.GroupInvites, true);
            notify(context, ID_GROUP_INVITE_NOTIFICATION, ntf1, noSound);
        }
    }

    public static /* synthetic */ void lambda$null$2(int uid, String service, Context context, boolean noSound, ArrayList users) {
        Notification ntf;
        if (users.size() >= 1) {
            Intent intent = new Intent("android.intent.action.VIEW", Uri.parse("vkontakte://profile/" + uid));
            UserProfile user = (UserProfile) users.get(0);
            int serviceStr = 0;
            if ("email".equals(service)) {
                serviceStr = R.string.friend_search_email;
            } else if (SignupPhoneFragment.KEY_PHONE.equals(service)) {
                serviceStr = R.string.friend_search_phone;
            } else if ("twitter".equals(service)) {
                serviceStr = R.string.friend_search_twitter;
            } else if ("facebook".equals(service)) {
                serviceStr = R.string.friend_search_facebook;
            } else if ("odnoklassniki".equals(service)) {
                serviceStr = R.string.friend_search_odnoklassniki;
            } else if ("instagram".equals(service)) {
                serviceStr = R.string.friend_search_instagram;
            } else if ("google".equals(service)) {
                serviceStr = R.string.friend_search_gplus;
            }
            int i = user.f ? R.string.notify_friend_found_f : R.string.notify_friend_found_m;
            Object[] objArr = new Object[2];
            objArr[0] = user.fullName;
            if (serviceStr != 0) {
                service = context.getString(serviceStr);
            }
            objArr[1] = service;
            String text = context.getString(i, objArr);
            PendingIntent pIntent = PendingIntent.getActivity(context, 0, intent, 134217728);
            Intent intentAccept = new Intent(NotificationButtonsReceiver.ACTION_ACCEPT_FRIEND);
            intentAccept.putExtra(ArgKeys.UID, user.uid);
            intentAccept.putExtra("notifyId", ID_FRIEND_FOUND_NOTIFICATION);
            PendingIntent pIntentAccept = PendingIntent.getBroadcast(context, 1, intentAccept, 1342177280);
            Bitmap photo = (Bitmap) RxUtil.blockingGetWithNull(VKImageLoader.getCircleBitmap(user.photo));
            Notification.Builder contentIntent = new Notification.Builder(context).setContentTitle(context.getString(user.f ? R.string.notify_friend_found_title_f : R.string.notify_friend_found_title_m)).setContentText(text).setContentIntent(pIntent);
            if (photo == null) {
                photo = Global.getResBitmap(context.getResources(), R.drawable.user_placeholder);
            }
            Notification.Builder ntfb = contentIntent.setLargeIcon(Bitmap.createScaledBitmap(photo, Global.scale(64.0f), Global.scale(64.0f), true)).setSmallIcon(R.drawable.ic_stat_notify_request).setTicker(text);
            if (Build.VERSION.SDK_INT >= 16) {
                ntfb.addAction(R.drawable.ic_add_24dp, context.getResources().getString(R.string.profile_add_friend), pIntentAccept);
                ntf = new Notification.BigTextStyle(ntfb).bigText(text).build();
            } else {
                ntf = ntfb.getNotification();
            }
            ntf.flags |= 16;
            NotificationUtils.applySettings(context, ntf, NotificationUtils.Type.FoundFriends, true);
            notify(context, ID_FRIEND_FOUND_NOTIFICATION, ntf, noSound);
        }
    }

    public static /* synthetic */ void lambda$null$3(int uid, Context context, boolean noSound, ArrayList users) {
        if (users.size() >= 1) {
            Intent intent = new Intent("android.intent.action.VIEW", Uri.parse("vkontakte://profile/" + uid));
            UserProfile user = (UserProfile) users.get(0);
            PendingIntent pIntent = PendingIntent.getActivity(context, 0, intent, 1073741824);
            String text = context.getResources().getStringArray(user.f ? R.array.ntf_accepted_f : R.array.ntf_accepted_m)[0];
            Bitmap photo = (Bitmap) RxUtil.blockingGetWithNull(VKImageLoader.getCircleBitmap(user.photo));
            Notification.Builder contentIntent = new Notification.Builder(context).setContentTitle(user.fullName).setContentText(text).setContentIntent(pIntent);
            if (photo == null) {
                photo = Global.getResBitmap(context.getResources(), R.drawable.user_placeholder);
            }
            Notification.Builder ntfb = contentIntent.setLargeIcon(Bitmap.createScaledBitmap(photo, Global.scale(64.0f), Global.scale(64.0f), true)).setSmallIcon(R.drawable.ic_stat_notify_request).setTicker(user.fullName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + text);
            Notification ntf = ntfb.getNotification();
            ntf.flags |= 16;
            NotificationUtils.applySettings(context, ntf, NotificationUtils.Type.Default, true);
            notify(context, ID_FRIEND_ACCEPTED_NOTIFICATION, ntf, noSound);
        }
    }

    public static /* synthetic */ void lambda$null$4(Context context, Bundle extras, boolean noSound, ArrayList users) {
        if (users.size() >= 1) {
            UserProfile user = (UserProfile) users.get(0);
            showMoneyTransferNotification(context, extras, user.fullName, user.f, noSound, user.getIsGroup());
        }
    }

    public static /* synthetic */ void lambda$null$5(int gid, Context context, boolean noSound, ArrayList users) {
        if (users.size() >= 1) {
            Intent intent = new Intent("android.intent.action.VIEW", Uri.parse("vkontakte://profile/-" + gid));
            UserProfile user = (UserProfile) users.get(0);
            PendingIntent pIntent = PendingIntent.getActivity(context, 0, intent, 1073741824);
            String text = context.getString(R.string.ntf_group_accepted);
            Bitmap photo = (Bitmap) RxUtil.blockingGetWithNull(VKImageLoader.getCircleBitmap(user.photo));
            Notification.Builder contentIntent = new Notification.Builder(context).setContentTitle(user.fullName).setContentText(text).setContentIntent(pIntent);
            if (photo == null) {
                photo = Global.getResBitmap(context.getResources(), R.drawable.group_placeholder);
            }
            Notification.Builder ntfb = contentIntent.setLargeIcon(Bitmap.createScaledBitmap(photo, Global.scale(64.0f), Global.scale(64.0f), true)).setSmallIcon(R.drawable.ic_stat_notify_group).setTicker(context.getString(R.string.ntf_group_accepted_ticker, user.fullName));
            Notification ntf = ntfb.getNotification();
            ntf.flags |= 16;
            NotificationUtils.applySettings(context, ntf, NotificationUtils.Type.Default, true);
            notify(context, 512, ntf, noSound);
        }
    }

    public static /* synthetic */ void lambda$null$6(int gid, Context context, int startTime, boolean noSound, ArrayList users) {
        if (users.size() >= 1) {
            Intent intent = new Intent("android.intent.action.VIEW", Uri.parse("vkontakte://profile/-" + gid));
            UserProfile user = (UserProfile) users.get(0);
            PendingIntent pIntent = PendingIntent.getActivity(context, 0, intent, 1073741824);
            String text = context.getString(R.string.ntf_upcoming_event, TimeUtils.langDate(startTime));
            Bitmap photo = (Bitmap) RxUtil.blockingGetWithNull(VKImageLoader.getCircleBitmap(user.photo));
            Notification.Builder contentIntent = new Notification.Builder(context).setContentTitle(user.fullName).setContentText(text).setContentIntent(pIntent);
            if (photo == null) {
                photo = Global.getResBitmap(context.getResources(), R.drawable.group_placeholder);
            }
            Notification.Builder ntfb = contentIntent.setLargeIcon(Bitmap.createScaledBitmap(photo, Global.scale(64.0f), Global.scale(64.0f), true)).setSmallIcon(R.drawable.ic_stat_notify_group).setTicker(context.getString(R.string.ntf_upcoming_event_ticker, user.fullName, TimeUtils.langDate(startTime)));
            Notification ntf = ntfb.getNotification();
            ntf.flags |= 16;
            NotificationUtils.applySettings(context, ntf, NotificationUtils.Type.UpcomingEvents, true);
            notify(context, ID_UPCOMING_EVENT_NOTIFICATION, ntf, noSound);
        }
    }

    public static /* synthetic */ void lambda$null$7(Bundle extras, Context context, boolean noSound, ArrayList users) {
        if (users.size() >= 1) {
            Intent intent = new Intent("android.intent.action.VIEW", Uri.parse("vkontakte://vk.com/" + extras.getString("place")));
            UserProfile user = (UserProfile) users.get(0);
            PendingIntent pIntent = PendingIntent.getActivity(context, 0, intent, 1073741824);
            String text = context.getString(R.string.ntf_post_published);
            Bitmap photo = (Bitmap) RxUtil.blockingGetWithNull(VKImageLoader.getCircleBitmap(user.photo));
            Notification.Builder contentIntent = new Notification.Builder(context).setContentTitle(user.fullName).setContentText(text).setContentIntent(pIntent);
            if (photo == null) {
                photo = Global.getResBitmap(context.getResources(), R.drawable.group_placeholder);
            }
            Notification.Builder ntfb = contentIntent.setLargeIcon(Bitmap.createScaledBitmap(photo, Global.scale(64.0f), Global.scale(64.0f), true)).setSmallIcon(R.drawable.ic_stat_notify_reply).setTicker(context.getString(R.string.ntf_post_published_ticker, user.fullName));
            Notification ntf = ntfb.getNotification();
            ntf.flags |= 16;
            NotificationUtils.applySettings(context, ntf, NotificationUtils.Type.Default, true);
            notify(context, 513, ntf, noSound);
        }
    }

    public static /* synthetic */ void lambda$null$8(Context context, Bundle extras, boolean noSound, ArrayList users) {
        if (users.size() != 0) {
            UserProfile user = (UserProfile) users.get(0);
            showLikeNotification(context, extras, user.firstName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + user.lastName, user.photo, noSound);
        }
    }

    public static /* synthetic */ void lambda$null$9(Context context, Bundle extras, boolean noSound, ArrayList users) {
        if (users.size() != 0) {
            UserProfile user = (UserProfile) users.get(0);
            showRepostNotification(context, extras, user, noSound);
        }
    }

    public static /* synthetic */ void lambda$null$10(Context context, Intent intent, String place, boolean isReply, boolean isMention, int replyID, String text, NotificationUtils.Type xkey, boolean noSound, ArrayList users) {
        Notification ntf;
        if (users.size() != 0) {
            UserProfile user = (UserProfile) users.get(0);
            PendingIntent pIntent = PendingIntent.getActivity(context, 0, intent, 134217728);
            String shortTitle = context.getResources().getString(R.string.commented_post_s);
            String longTitle = context.getResources().getString(user.f ? R.string.commented_post_f : R.string.commented_post_m, user.fullName);
            if (place.startsWith("photo")) {
                shortTitle = context.getResources().getString(R.string.commented_photo_s);
                longTitle = context.getResources().getString(user.f ? R.string.commented_photo_f : R.string.commented_photo_m, user.fullName);
            }
            if (place.startsWith("video")) {
                shortTitle = context.getResources().getString(R.string.commented_video_s);
                longTitle = context.getResources().getString(user.f ? R.string.commented_video_f : R.string.commented_video_m, user.fullName);
            }
            if (isReply) {
                longTitle = context.getResources().getString(user.f ? R.string.replied_f : R.string.replied_m, user.fullName);
                shortTitle = context.getResources().getString(R.string.replied_s);
            }
            if (isMention) {
                if (replyID != 0) {
                    longTitle = context.getResources().getString(user.f ? R.string.new_mention_comment_f : R.string.new_mention_comment_m, user.fullName);
                    shortTitle = context.getResources().getString(R.string.new_mention_s);
                } else {
                    if (user.uid < 0) {
                        longTitle = context.getResources().getString(R.string.new_mention_post_c, user.fullName);
                    } else {
                        longTitle = context.getResources().getString(user.f ? R.string.new_mention_post_f : R.string.new_mention_post_m, user.fullName);
                    }
                    shortTitle = context.getResources().getString(R.string.new_mention_s);
                }
            }
            Bitmap photo = (Bitmap) RxUtil.blockingGetWithNull(VKImageLoader.getCircleBitmap(user.photo));
            Notification.Builder ticker = new Notification.Builder(context).setContentTitle(user.fullName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + shortTitle).setContentText(text).setContentIntent(pIntent).setTicker(longTitle);
            if (photo == null) {
                photo = Global.getResBitmap(context.getResources(), R.drawable.user_placeholder);
            }
            Notification.Builder bldr = ticker.setLargeIcon(Bitmap.createScaledBitmap(photo, Global.scale(64.0f), Global.scale(64.0f), true)).setSmallIcon(R.drawable.ic_stat_notify_reply);
            if (Build.VERSION.SDK_INT >= 16) {
                ntf = new Notification.BigTextStyle(bldr).setBigContentTitle(user.fullName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + shortTitle).bigText(text).build();
            } else {
                ntf = bldr.getNotification();
            }
            ntf.flags |= 16;
            NotificationUtils.applySettings(context, ntf, xkey, true);
            notify(context, ID_REPLY_NOTIFICATION, ntf, noSound);
        }
    }

    private static void showMoneyTransferNotification(Context context, Bundle extras, String userName, boolean isFemale, boolean noSound, boolean isGroup) {
        Notification ntf;
        Intent intent = new Intent("android.intent.action.VIEW", Uri.parse("vkontakte://vk.com/feed?section=notifications"));
        intent.addFlags(268435456);
        PendingIntent pIntent = PendingIntent.getActivity(context, 0, intent, 134217728);
        int resId = 0;
        int status = Integer.parseInt(extras.getString("status"));
        if (isGroup) {
            if (status == 2) {
                resId = R.string.money_transfer_push_declined_neutral;
            } else if (status == 1) {
                resId = R.string.money_transfer_push_accepted_neutral;
            }
        } else if (isFemale) {
            if (status == 2) {
                resId = R.string.money_transfer_push_declined_female;
            } else if (status == 1) {
                resId = R.string.money_transfer_push_accepted_female;
            }
        } else if (status == 2) {
            resId = R.string.money_transfer_push_declined_male;
        } else if (status == 1) {
            resId = R.string.money_transfer_push_accepted_male;
        }
        if (resId != 0) {
            MoneyTransfer mt = new MoneyTransfer();
            mt.amount = extras.getString(ServerKeys.AMOUNT);
            mt.currencyId = Integer.parseInt(extras.getString("currency"));
            String text = context.getString(resId, userName, mt.getAmountWithCurrencyShortNameFormatted(context));
            Notification.Builder bldr = new Notification.Builder(context).setSmallIcon(R.drawable.ic_stat_notify_logo).setContentTitle(context.getString(R.string.app_name)).setContentText(text).setTicker(text).setContentIntent(pIntent).setAutoCancel(true).setDefaults(2);
            if (Build.VERSION.SDK_INT >= 16) {
                ntf = new Notification.BigTextStyle(bldr.setPriority(2)).bigText(text).build();
            } else {
                ntf = bldr.getNotification();
            }
            if (Build.VERSION.SDK_INT >= 21) {
                ntf.color = context.getResources().getColor(R.color.brand_primary);
            }
            notify(context, 600, ntf, noSound);
        }
    }

    private static void showLikeNotification(Context context, Bundle extras, String userName, String userPhoto, boolean noSound) {
        SharedPreferences sprefs = VKApplication.context.getSharedPreferences(null, 0);
        String object = extras.getString("object");
        int count = Integer.parseInt(extras.getString("likes_count"));
        Intent intent = new Intent("android.intent.action.VIEW", Uri.parse("vkontakte://vk.com/feed?section=notifications"));
        intent.addFlags(268435456);
        int res = count > 1 ? R.string.like_notification_multi_post : R.string.like_notification_post;
        if (object.matches("photo[0-9-]+_[0-9]+")) {
            res = count > 1 ? R.string.like_notification_multi_photo : R.string.like_notification_photo;
        } else if (object.matches("video[0-9-]+_[0-9]+")) {
            res = count > 1 ? R.string.like_notification_multi_video : R.string.like_notification_video;
        } else if (object.matches("(wall_comment|video_comment|photo_comment)[0-9-]+_[0-9]+")) {
            res = count > 1 ? R.string.like_notification_multi_comment : R.string.like_notification_comment;
        }
        String ntfTextSource = context.getString(res, "<b>" + Global.replaceHTML(userName) + "</b>");
        Spanned ntfText = Html.fromHtml(ntfTextSource);
        PendingIntent pIntent = PendingIntent.getActivity(context, 0, intent, 134217728);
        Notification ntf = null;
        Bitmap photo = null;
        if (userPhoto != null) {
            photo = (Bitmap) RxUtil.blockingGetWithNull(VKImageLoader.getCircleBitmap(userPhoto));
        }
        Notification.Builder bldr = new Notification.Builder(context).setContentTitle(context.getString(R.string.app_name)).setContentText(ntfText).setContentIntent(pIntent).setTicker(ntfText.toString()).setSmallIcon(R.drawable.ic_stat_notify_like);
        if (userPhoto != null) {
            if (photo == null) {
                photo = Global.getResBitmap(context.getResources(), R.drawable.user_placeholder);
            }
            bldr.setLargeIcon(Bitmap.createScaledBitmap(photo, Global.scale(64.0f), Global.scale(64.0f), true));
        }
        if (Build.VERSION.SDK_INT >= 16) {
            try {
                JSONArray a = new JSONArray(sprefs.getString("like_notifications", "[]"));
                if (a.length() == 0) {
                    ntf = new Notification.BigTextStyle(bldr).setBigContentTitle(context.getString(R.string.app_name)).bigText(ntfText).build();
                } else {
                    bldr.setSmallIcon(R.drawable.ic_stat_notify_likes);
                    bldr.setContentText(context.getResources().getQuantityString(R.plurals.like_notification_stacked, a.length() + 1, Integer.valueOf(a.length() + 1)));
                    bldr.setLargeIcon((Bitmap) null);
                    Notification.InboxStyle inbox = new Notification.InboxStyle(bldr);
                    inbox.addLine(ntfText);
                    boolean more = a.length() > 4;
                    int i = 0;
                    while (true) {
                        if (i >= Math.min(a.length(), more ? 3 : 4)) {
                            break;
                        }
                        inbox.addLine(Html.fromHtml(a.getString(a.length() - (i + 1))));
                        i++;
                    }
                    if (more) {
                        inbox.addLine(context.getString(R.string.like_notification_x_more, Integer.valueOf(a.length() - 4)));
                    }
                    ntf = inbox.build();
                }
                a.put(ntfTextSource);
                sprefs.edit().putString("like_notifications", a.toString()).apply();
            } catch (Exception x) {
                L.e(x, new Object[0]);
            }
        } else {
            ntf = bldr.getNotification();
        }
        ntf.flags |= 16;
        NotificationUtils.applySettings(context, ntf, NotificationUtils.Type.Default, true);
        ntf.defaults &= -2;
        ntf.sound = null;
        cancel(context, 507);
        notify(context, 507, ntf, noSound);
    }

    private static void showRepostNotification(Context context, Bundle extras, UserProfile user, boolean noSound) {
        SharedPreferences sprefs = VKApplication.context.getSharedPreferences(null, 0);
        String object = extras.getString("object");
        Intent intent = new Intent("android.intent.action.VIEW", Uri.parse("vkontakte://vk.com/feed?section=notifications"));
        intent.addFlags(268435456);
        int res = user.f ? R.string.repost_notification_post_f : R.string.repost_notification_post_m;
        if (object.matches("photo[0-9-]+_[0-9]+")) {
            res = user.f ? R.string.repost_notification_photo_f : R.string.repost_notification_photo_m;
        } else if (object.matches("video[0-9-]+_[0-9]+")) {
            res = user.f ? R.string.repost_notification_video_f : R.string.repost_notification_video_m;
        } else if (object.matches("(wall_comment|video_comment|photo_comment)[0-9-]+_[0-9]+")) {
            res = user.f ? R.string.repost_notification_comment_f : R.string.repost_notification_comment_m;
        }
        String ntfTextSource = context.getString(res, "<b>" + Global.replaceHTML(user.fullName) + "</b>");
        Spanned ntfText = Html.fromHtml(ntfTextSource);
        PendingIntent pIntent = PendingIntent.getActivity(context, 0, intent, 134217728);
        Notification ntf = null;
        Bitmap photo = null;
        if (user.photo != null) {
            photo = (Bitmap) RxUtil.blockingGetWithNull(VKImageLoader.getCircleBitmap(user.photo));
        }
        Notification.Builder bldr = new Notification.Builder(context).setContentTitle(context.getString(R.string.app_name)).setContentText(ntfText).setContentIntent(pIntent).setTicker(ntfText.toString()).setSmallIcon(R.drawable.ic_stat_notify_repost);
        if (user.photo != null) {
            if (photo == null) {
                photo = Global.getResBitmap(context.getResources(), R.drawable.user_placeholder);
            }
            bldr.setLargeIcon(Bitmap.createScaledBitmap(photo, Global.scale(64.0f), Global.scale(64.0f), true));
        }
        if (Build.VERSION.SDK_INT >= 16) {
            try {
                JSONArray a = new JSONArray(sprefs.getString("repost_notifications", "[]"));
                if (a.length() == 0) {
                    ntf = new Notification.BigTextStyle(bldr).setBigContentTitle(context.getString(R.string.app_name)).bigText(ntfText).build();
                } else {
                    bldr.setSmallIcon(R.drawable.ic_stat_notify_reposts);
                    bldr.setContentText(context.getResources().getQuantityString(R.plurals.like_notification_stacked, a.length() + 1, Integer.valueOf(a.length() + 1)));
                    bldr.setLargeIcon((Bitmap) null);
                    Notification.InboxStyle inbox = new Notification.InboxStyle(bldr);
                    inbox.addLine(ntfText);
                    boolean more = a.length() > 4;
                    int i = 0;
                    while (true) {
                        if (i >= Math.min(a.length(), more ? 3 : 4)) {
                            break;
                        }
                        inbox.addLine(Html.fromHtml(a.getString(a.length() - (i + 1))));
                        i++;
                    }
                    if (more) {
                        inbox.addLine(context.getString(R.string.like_notification_x_more, Integer.valueOf(a.length() - 4)));
                    }
                    ntf = inbox.build();
                }
                a.put(ntfTextSource);
                sprefs.edit().putString("repost_notifications", a.toString()).apply();
            } catch (Exception x) {
                L.e(x, new Object[0]);
            }
        } else {
            ntf = bldr.getNotification();
        }
        ntf.flags |= 16;
        NotificationUtils.applySettings(context, ntf, NotificationUtils.Type.Default, true);
        ntf.defaults &= -2;
        ntf.sound = null;
        cancel(context, ID_REPOST_NOTIFICATION);
        notify(context, ID_REPOST_NOTIFICATION, ntf, noSound);
    }

    public static void updateStateAndShowNotification(int mid) {
        SharedPreferences sprefs = VKApplication.context.getSharedPreferences(null, 0);
        try {
            LongPollService.syncStateWithServer();
            showMessageNotification(mid);
            sprefs.edit().remove("pending_msg_notification").apply();
        } catch (Exception e) {
            sprefs.edit().putInt("pending_msg_notification", mid).apply();
        }
    }

    public static void showMessageNotification(int mid) {
        Message msg = Messages.getById(mid);
        if (msg == null) {
            Log.e("vk", "Error getting message " + mid + " :'(");
            return;
        }
        if (msg.peer < 2000000000) {
            msg.title = null;
        }
        if (!msg.readState) {
            ArrayList<Integer> al = new ArrayList<>();
            al.add(Integer.valueOf(msg.sender));
            Friends.getUsers(al, GCMBroadcastReceiver$$Lambda$2.lambdaFactory$(msg));
        }
    }

    public static /* synthetic */ void lambda$showMessageNotification$12(Message msg, ArrayList users) {
        if (users != null && users.size() != 0) {
            UserProfile user = (UserProfile) users.get(0);
            String notifyText = msg.text;
            if (msg.isServiceMessage && msg.extras.containsKey(NativeProtocol.WEB_DIALOG_ACTION)) {
                notifyText = msg.getServiceMessageText(user, msg.extras.getString("action_user_name_acc"));
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
                    notifyText = VKApplication.context.getResources().getString(user.f ? R.string.new_gift_notification_f : R.string.new_gift_notification_m);
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
            LongPollService.updateNotification(message, msg.title, user.fullName, user.photo, hasMention, msg.peer);
        }
    }
}
