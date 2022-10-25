package com.vkontakte.android.auth;

import android.app.NotificationManager;
import android.content.Context;
import android.preference.PreferenceManager;
import com.facebook.appevents.AppEventsConstants;
import com.vk.attachpicker.util.Prefs;
import com.vk.camera.CameraPrefs;
import com.vk.masks.MasksController;
import com.vk.masks.MasksPrefs;
import com.vk.stories.StoriesController;
import com.vkontakte.android.AudioMessagePlayerService;
import com.vkontakte.android.C2DM;
import com.vkontakte.android.Global;
import com.vkontakte.android.GoogleNow;
import com.vkontakte.android.LongPollService;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.execute.GetWallInfo;
import com.vkontakte.android.audio.AudioFacade;
import com.vkontakte.android.cache.Cache;
import com.vkontakte.android.cache.NewsfeedCache;
import com.vkontakte.android.data.Analytics;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.data.Groups;
import com.vkontakte.android.data.Messages;
import com.vkontakte.android.data.Posts;
import com.vkontakte.android.fragments.NewsFragment;
import com.vkontakte.android.stickers.Stickers;
import com.vkontakte.android.utils.L;
import java.io.File;
import ru.mail.libverify.api.VerificationFactory;
/* loaded from: classes2.dex */
public class VKSession {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void updateSession(GetWallInfo.Result result, boolean newAccount) {
        if (newAccount) {
            C2DM.start();
        } else {
            C2DM.checkForUpdate();
        }
        Stickers stickers = Stickers.get();
        if (result.hasNewItemsResponse != null) {
            stickers.setNewItems(result.hasNewItemsResponse.storeNewItems);
            stickers.setGlobalPromotions(result.hasNewItemsResponse.globalPromotion);
            stickers.setStickersHash(result.hasNewItemsResponse.stickersVersionHash);
        }
        if (result.needUpdateGoogleNow) {
            GoogleNow.updateTokenAsync();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void cleanSession(String accessToken, String secret) {
        Context ctx = VKApplication.context;
        L.i("logout");
        LongPollService.logout();
        NewsFragment.onLogout();
        try {
            Messages.updateLock.acquire();
        } catch (Exception x) {
            L.e(x, new Object[0]);
        }
        Messages.updateLock.release();
        StoriesController.clear();
        MasksController.getInstance().clear();
        MasksPrefs.instance().clear();
        CameraPrefs.instance().clear();
        Prefs.storiesPrefs().clear();
        Prefs.pickerPrefs().clear();
        Cache.clear();
        C2DM.stop(accessToken, secret);
        AudioFacade.logout();
        ((NotificationManager) ctx.getSystemService("notification")).cancelAll();
        ctx.getSharedPreferences(null, 0).edit().clear().apply();
        ctx.getSharedPreferences("drafts", 0).edit().clear().apply();
        ctx.getSharedPreferences("news", 0).edit().clear().apply();
        ctx.getSharedPreferences("longpoll", 0).edit().clear().apply();
        ctx.getSharedPreferences("stickers", 0).edit().clear().apply();
        ctx.getSharedPreferences("pending_installs", 0).edit().clear().apply();
        ctx.getSharedPreferences("cookieStore", 0).edit().clear().apply();
        ctx.getSharedPreferences("AudioMessagePlayerService", 0).edit().clear().apply();
        ctx.getSharedPreferences("video_stats", 0).edit().clear().apply();
        ctx.getSharedPreferences("music_search", 0).edit().clear().apply();
        com.vkontakte.android.audio.player.Prefs.getInstance(ctx).clear();
        NewsfeedCache.clear();
        ctx.deleteDatabase("posts.db");
        ctx.deleteDatabase("friends.db");
        ctx.deleteDatabase("dialogs.db");
        ctx.deleteDatabase("chats.db");
        ctx.deleteDatabase("groups.db");
        Friends.reset();
        Messages.reset();
        Groups.reset();
        Analytics.clear(true);
        Global.inited = false;
        Posts.feed.clear();
        Posts.feedFrom = AppEventsConstants.EVENT_PARAM_VALUE_NO;
        Posts.feedItem = 0;
        Posts.feedOffset = 0;
        Posts.feedItemOffset = 0;
        Posts.preloadedFeed.clear();
        Stickers.get().clearAll();
        AudioMessagePlayerService.cleanCache();
        L.getInstance().clear();
        new File(ctx.getCacheDir(), "replies").delete();
        new File(ctx.getCacheDir(), "friends_requests_in").delete();
        new File(ctx.getCacheDir(), "friends_requests_suggest").delete();
        try {
            VerificationFactory.setLocationUsage(ctx, PreferenceManager.getDefaultSharedPreferences(VKApplication.context).getBoolean("mytrackerLocationCrapEnabled", true));
            VerificationFactory.softSignOut(ctx);
        } catch (Exception e) {
            L.e(e, new Object[0]);
        }
    }
}
