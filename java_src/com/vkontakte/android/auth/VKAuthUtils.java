package com.vkontakte.android.auth;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.content.ContentResolver;
import android.content.SharedPreferences;
import android.support.annotation.NonNull;
import android.text.TextUtils;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.execute.GetWallInfo;
import com.vkontakte.android.auth.configs.AudioAdConfig;
import com.vkontakte.android.auth.configs.ProfilerConfig;
import com.vkontakte.android.auth.configs.VideoConfig;
import com.vkontakte.android.data.UserNotification;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.utils.L;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class VKAuthUtils {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void sleep(long time) {
        try {
            Thread.sleep(time);
        } catch (Exception e) {
            L.e(e, new Object[0]);
        }
    }

    public static boolean hasSystemAccount() {
        try {
            AccountManager am = AccountManager.get(VKApplication.context);
            Account[] acc = am.getAccountsByType(VKAuth.ACCOUNT_TYPE);
            return acc.length > 0;
        } catch (Exception x) {
            L.e(x, new Object[0]);
            return false;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void removeSystemAccountIfExist() {
        try {
            AccountManager am = AccountManager.get(VKApplication.context);
            Account[] acc = am.getAccountsByType(VKAuth.ACCOUNT_TYPE);
            if (acc.length > 0) {
                am.removeAccount(acc[0], null, null);
            }
        } catch (Exception x) {
            L.e(x, new Object[0]);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean addSystemAccount(String name) {
        try {
            Account account = new Account(name, VKAuth.ACCOUNT_TYPE);
            boolean accountWasAdded = AccountManager.get(VKApplication.context).addAccountExplicitly(account, null, null);
            L.e(Boolean.valueOf(accountWasAdded));
            ContentResolver.setIsSyncable(account, "com.android.contacts", 1);
            return true;
        } catch (Exception x) {
            L.e(x, new Object[0]);
            return false;
        }
    }

    public static int getCurrentSyncOption() {
        try {
            AccountManager am = AccountManager.get(VKApplication.context);
            Account[] accounts = am.getAccountsByType(VKAuth.ACCOUNT_TYPE);
            if (accounts.length == 0) {
                Account account = new Account(VKApplication.context.getSharedPreferences(null, 0).getString("username", ""), VKAuth.ACCOUNT_TYPE);
                am.addAccountExplicitly(account, null, null);
                accounts = new Account[]{account};
            }
            boolean syncEnabled = ContentResolver.getSyncAutomatically(accounts[0], "com.android.contacts");
            SharedPreferences prefs = VKApplication.context.getSharedPreferences(null, 0);
            boolean syncAll = prefs.getBoolean("sync_all", false);
            if (!syncEnabled) {
                return 2;
            }
            return syncAll ? 0 : 1;
        } catch (Exception x) {
            Log.w("vk", x);
            return -1;
        }
    }

    public static VKAccount parse(JSONObject o) throws JSONException {
        JSONObject jp = o.getJSONObject("profile");
        JSONObject info = o.getJSONObject(UserNotification.LAYOUT_NEWSFEED_INFO);
        JSONObject jx = jp.optJSONObject("exports");
        VKAccount vkAccount = new VKAccount();
        vkAccount.name = jp.getString("first_name") + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + jp.getString("last_name");
        vkAccount.first_name_gen = jp.getString("first_name_gen");
        vkAccount.last_name_gen = jp.getString("last_name_gen");
        vkAccount.verified = jp.getInt("verified") == 1;
        vkAccount.photo = jp.getString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50");
        vkAccount.status = jp.optString("status");
        vkAccount.country = jp.has("country") ? jp.getJSONObject("country").getInt("id") : 0;
        vkAccount.isFemale = jp.optInt("sex") == 1;
        vkAccount.intro = info.getInt("intro");
        vkAccount.riseToRecordAvailable = info.optBoolean("raise_to_record_enabled", true);
        vkAccount.communityComments = info.optBoolean("community_comments", false);
        vkAccount.musicIntroWasShowed = info.optBoolean("music_intro", vkAccount.musicIntroWasShowed);
        vkAccount.musicIntroWasShowed = info.optInt("music_intro", vkAccount.musicIntroWasShowed ? 1 : 0) != 0;
        vkAccount.debugAvailable = info.optBoolean("debug_available", false);
        vkAccount.exportTwitterAvail = jx != null && jx.optInt("twitter") == 1;
        vkAccount.exportFacebookAvail = jx != null && jx.optInt("facebook") == 1;
        vkAccount.allowBuyVotes = o.optBoolean("allow_buy_votes");
        vkAccount.supportUrl = info.optString("support_url");
        vkAccount.useVigo = o.optBoolean("use_vigo");
        vkAccount.htmlGamesEnabled = o.optInt("html_games_supported") == 1;
        vkAccount.useWebAppForReportContent = false;
        vkAccount.vigoConnectTimeout = o.optInt("vigo_connect_timeout", 1000);
        vkAccount.vigoReadTimeout = o.optInt("vigo_read_timeout", 1000);
        JSONArray settings = info.getJSONArray("settings");
        if (settings != null) {
            for (int i = 0; i < settings.length(); i++) {
                JSONObject setting = settings.getJSONObject(i);
                String string = setting.getString("name");
                char c = 65535;
                switch (string.hashCode()) {
                    case -1884266413:
                        if (string.equals("stories")) {
                            c = 4;
                            break;
                        }
                        break;
                    case -1713202449:
                        if (string.equals("money_p2p")) {
                            c = 2;
                            break;
                        }
                        break;
                    case -1027706515:
                        if (string.equals("money_clubs_p2p")) {
                            c = 3;
                            break;
                        }
                        break;
                    case -625141890:
                        if (string.equals("gif_autoplay")) {
                            c = 0;
                            break;
                        }
                        break;
                    case -419852797:
                        if (string.equals("vklive_app")) {
                            c = 7;
                            break;
                        }
                        break;
                    case -157093721:
                        if (string.equals("video_autoplay")) {
                            c = 1;
                            break;
                        }
                        break;
                    case 103667463:
                        if (string.equals("masks")) {
                            c = 5;
                            break;
                        }
                        break;
                    case 188508359:
                        if (string.equals("audio_ads")) {
                            c = 6;
                            break;
                        }
                        break;
                    case 886773427:
                        if (string.equals("audio_background_limit")) {
                            c = '\t';
                            break;
                        }
                        break;
                    case 2117771248:
                        if (string.equals("audio_restrictions")) {
                            c = '\b';
                            break;
                        }
                        break;
                }
                switch (c) {
                    case 0:
                        vkAccount.gifAutoPlayAvailable = setting.optBoolean("available", vkAccount.gifAutoPlayAvailable);
                        break;
                    case 1:
                        vkAccount.videoAutoPlayAvailable = setting.optBoolean("available", vkAccount.videoAutoPlayAvailable);
                        break;
                    case 2:
                        vkAccount.moneyTransfersAvailable = setting.optBoolean("available", false);
                        vkAccount.moneyTransfersCanSend = setting.optString("value", "").equals("can_send");
                        break;
                    case 3:
                        vkAccount.moneyTransfersCanSendToCommunities = setting.optBoolean("available", false);
                        break;
                    case 4:
                        vkAccount.storiesAvailable = setting.optBoolean("available", false);
                        break;
                    case 5:
                        vkAccount.masksAvailable = setting.optBoolean("available", false);
                        break;
                    case 6:
                        vkAccount.audioAdAvailable = setting.optBoolean("available", false);
                        break;
                    case 7:
                        vkAccount.vkLiveStreamAvailable = setting.optBoolean("available", false);
                        break;
                    case '\b':
                        vkAccount.isMusicRestricted = setting.optBoolean("available", false);
                        break;
                    case '\t':
                        if (setting.optBoolean("available", false)) {
                            vkAccount.audioBackgroundLimit = setting.optInt("value", 0);
                            break;
                        } else {
                            vkAccount.audioBackgroundLimit = -1;
                            break;
                        }
                }
            }
        }
        JSONObject audio_ads = info.optJSONObject("audio_ads");
        if (audio_ads != null) {
            vkAccount.audioAdConfig = new AudioAdConfig(audio_ads);
        }
        JSONObject video_config = info.optJSONObject("video_player");
        if (video_config != null) {
            vkAccount.videoConfig = new VideoConfig(video_config);
        }
        vkAccount.defaultAudioPlayer = o.optString("defaultAudioPlayer", vkAccount.defaultAudioPlayer);
        JSONArray subscriptions = info.optJSONArray("subscriptions");
        if (subscriptions != null) {
            int i2 = 0;
            while (true) {
                if (i2 < subscriptions.length()) {
                    if (subscriptions.getInt(i2) != 1) {
                        i2++;
                    } else {
                        vkAccount.hasMusicSubscription = true;
                    }
                }
            }
        }
        JSONObject profilerConfig = info.optJSONObject("profiler_settings");
        if (profilerConfig != null) {
            vkAccount.profilerConfig = new ProfilerConfig(profilerConfig);
        }
        JSONObject transfersParams = info.optJSONObject("money_p2p_params");
        if (transfersParams != null) {
            vkAccount.moneyTransfersMinAmount = transfersParams.optInt("min_amount", 0);
            vkAccount.moneyTransfersMaxAmount = transfersParams.optInt("max_amount", 0);
            vkAccount.monetTransfersCurrency = transfersParams.optString("currency");
        }
        return vkAccount;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void updateAccessToken(@NonNull VKAccount account, String accessToken) {
        account.accessToken = accessToken;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void updateSecret(@NonNull VKAccount account, String secret) {
        account.secret = secret;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void updateAccount(@NonNull VKAccount account, @NonNull GetWallInfo.Result result) {
        account.fillUserData(result.vkAccount);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void clearAccountFromSharedPreferences(@NonNull SharedPreferences prefs) {
        prefs.edit().remove(ArgKeys.UID).remove("sid").remove("secret").remove("username").remove("first_name_gen").remove("last_name_gen").remove("verified").remove("userphoto").remove("userstatus").remove("usercountry").remove("usersex").remove("intro").remove("export_twitter_avail").remove("export_facebook_avail").remove("ads_stoplist").remove("allow_buy_votes").remove("support_url").remove("use_vigo").remove("vigo_connect_timeout").remove("vigo_read_timeout").remove("money_transfers_available").remove("money_transfers_can_send").remove("money_transfers_can_send_to_communities").remove("money_transfers_max_amount").remove("money_transfers_min_amount").remove("gif_autoplay_available").remove("video_autoplay_available").remove("default_audio_player").remove("stories_available").remove("audio_ad_available").remove("debug_available").remove("has_music_subscription").remove("audio_ad_config").remove("raise_to_record_enabled").remove("vklive_app").remove("profiler_config").remove("video_player").remove("is_music_restricted").remove("music_intro").remove("audio_background_limit").remove("community_comments").apply();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void saveAccountToSharedPreferences(@NonNull SharedPreferences prefs, @NonNull VKAccount account) {
        SharedPreferences.Editor editor = prefs.edit().putInt(ArgKeys.UID, account.uid).putString("sid", account.accessToken).putString("secret", account.secret).putString("username", account.name).putString("first_name_gen", account.first_name_gen).putString("last_name_gen", account.last_name_gen).putBoolean("verified", account.verified).putString("userphoto", account.photo).putString("userstatus", account.status).putInt("usercountry", account.country).putBoolean("usersex", account.isFemale).putInt("intro", account.intro).putBoolean("export_twitter_avail", account.exportTwitterAvail).putBoolean("export_facebook_avail", account.exportFacebookAvail).putBoolean("allow_buy_votes", account.allowBuyVotes).putString("support_url", account.supportUrl).putBoolean("use_vigo", account.useVigo).putInt("vigo_connect_timeout", account.vigoConnectTimeout).putInt("vigo_read_timeout", account.vigoReadTimeout).putBoolean("money_transfers_available", account.moneyTransfersAvailable).putBoolean("money_transfers_can_send", account.moneyTransfersCanSend).putString("money_transfers_currency", account.monetTransfersCurrency).putBoolean("money_transfers_can_send_to_communities", account.moneyTransfersCanSendToCommunities).putInt("money_transfers_max_amount", account.moneyTransfersMaxAmount).putInt("money_transfers_min_amount", account.moneyTransfersMinAmount).putBoolean("gif_autoplay_available", account.gifAutoPlayAvailable).putBoolean("video_autoplay_available", account.videoAutoPlayAvailable).putString("default_audio_player", account.defaultAudioPlayer).putBoolean("stories_available", account.storiesAvailable).putBoolean("masks_available", account.masksAvailable).putBoolean("audio_ad_available", account.audioAdAvailable).putBoolean("raise_to_record_enabled", account.riseToRecordAvailable).putBoolean("vklive_app", account.vkLiveStreamAvailable).putBoolean("debug_available", account.debugAvailable).putBoolean("has_music_subscription", account.hasMusicSubscription).putBoolean("is_music_restricted", account.isMusicRestricted).putBoolean("music_intro", account.musicIntroWasShowed).putInt("audio_background_limit", account.audioBackgroundLimit).putBoolean("html_games_enabled", account.htmlGamesEnabled).putBoolean("community_comments", account.communityComments).putBoolean("use_web_app_for_report_content", account.useWebAppForReportContent);
        if (account.audioAdConfig != null) {
            String audioAdsConfigStr = account.audioAdConfig.toJSONString();
            if (!TextUtils.isEmpty(audioAdsConfigStr)) {
                editor.putString("audio_ad_config", audioAdsConfigStr);
            }
        }
        if (account.profilerConfig != null) {
            String profilerConfigStr = account.profilerConfig.toJSONString();
            if (!TextUtils.isEmpty(profilerConfigStr)) {
                editor.putString("profiler_config", profilerConfigStr);
            }
        }
        if (account.videoConfig != null) {
            String videoConfigStr = account.videoConfig.toJSONString();
            if (!TextUtils.isEmpty(videoConfigStr)) {
                editor.putString("video_player", videoConfigStr);
            }
        }
        editor.apply();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @NonNull
    public static VKAccount loadAccountFromSharedPreferences(@NonNull SharedPreferences prefs, @NonNull VKAccount account) {
        account.uid = prefs.getInt(ArgKeys.UID, account.uid);
        account.accessToken = prefs.getString("sid", account.accessToken);
        account.secret = prefs.getString("secret", account.secret);
        account.name = prefs.getString("username", account.name);
        account.first_name_gen = prefs.getString("first_name_gen", account.first_name_gen);
        account.last_name_gen = prefs.getString("last_name_gen", account.last_name_gen);
        account.verified = prefs.getBoolean("verified", account.verified);
        account.photo = prefs.getString("userphoto", account.photo);
        account.status = prefs.getString("userstatus", account.status);
        account.country = prefs.getInt("usercountry", account.country);
        account.isFemale = prefs.getBoolean("usersex", account.isFemale);
        account.intro = prefs.getInt("intro", account.intro);
        account.exportTwitterAvail = prefs.getBoolean("export_twitter_avail", account.exportTwitterAvail);
        account.exportFacebookAvail = prefs.getBoolean("export_facebook_avail", account.exportFacebookAvail);
        account.allowBuyVotes = prefs.getBoolean("allow_buy_votes", account.allowBuyVotes);
        account.supportUrl = prefs.getString("support_url", account.supportUrl);
        account.useVigo = prefs.getBoolean("use_vigo", account.useVigo);
        account.vigoConnectTimeout = prefs.getInt("vigo_connect_timeout", account.vigoConnectTimeout);
        account.vigoReadTimeout = prefs.getInt("vigo_read_timeout", account.vigoReadTimeout);
        account.moneyTransfersAvailable = prefs.getBoolean("money_transfers_available", account.moneyTransfersAvailable);
        account.moneyTransfersCanSend = prefs.getBoolean("money_transfers_can_send", account.moneyTransfersCanSend);
        account.monetTransfersCurrency = prefs.getString("money_transfers_currency", account.monetTransfersCurrency);
        account.moneyTransfersCanSendToCommunities = prefs.getBoolean("money_transfers_can_send_to_communities", account.moneyTransfersCanSendToCommunities);
        account.moneyTransfersMaxAmount = prefs.getInt("money_transfers_max_amount", account.moneyTransfersMaxAmount);
        account.moneyTransfersMinAmount = prefs.getInt("money_transfers_min_amount", account.moneyTransfersMinAmount);
        account.gifAutoPlayAvailable = prefs.getBoolean("gif_autoplay_available", account.gifAutoPlayAvailable);
        account.videoAutoPlayAvailable = prefs.getBoolean("video_autoplay_available", account.videoAutoPlayAvailable);
        account.defaultAudioPlayer = prefs.getString("default_audio_player", account.defaultAudioPlayer);
        account.storiesAvailable = prefs.getBoolean("stories_available", account.storiesAvailable);
        account.masksAvailable = prefs.getBoolean("masks_available", account.masksAvailable);
        account.audioAdAvailable = prefs.getBoolean("audio_ad_available", account.audioAdAvailable);
        account.riseToRecordAvailable = prefs.getBoolean("raise_to_record_enabled", account.riseToRecordAvailable);
        account.vkLiveStreamAvailable = prefs.getBoolean("vklive_app", account.vkLiveStreamAvailable);
        account.debugAvailable = prefs.getBoolean("debug_available", account.debugAvailable);
        account.hasMusicSubscription = prefs.getBoolean("has_music_subscription", account.hasMusicSubscription);
        account.isMusicRestricted = prefs.getBoolean("is_music_restricted", account.isMusicRestricted);
        account.musicIntroWasShowed = prefs.getBoolean("music_intro", account.musicIntroWasShowed);
        account.audioBackgroundLimit = prefs.getInt("audio_background_limit", account.audioBackgroundLimit);
        account.audioAdConfig = AudioAdConfig.fromJSONString(prefs.getString("audio_ad_config", ""));
        account.videoConfig = VideoConfig.fromJSONString(prefs.getString("video_player", ""));
        account.htmlGamesEnabled = prefs.getBoolean("html_games_enabled", account.htmlGamesEnabled);
        account.communityComments = prefs.getBoolean("community_comments", account.communityComments);
        account.useWebAppForReportContent = prefs.getBoolean("use_web_app_for_report_content", account.useWebAppForReportContent);
        String profilerConfigStr = prefs.getString("profiler_config", "");
        if (!TextUtils.isEmpty(profilerConfigStr)) {
            try {
                account.profilerConfig = new ProfilerConfig(profilerConfigStr);
            } catch (JSONException e) {
                L.e(e, new Object[0]);
                account.profilerConfig = null;
            }
        }
        return account;
    }
}
