package com.vkontakte.android.data;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ArgbEvaluator;
import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.content.LocalBroadcastManager;
import android.widget.Toast;
import com.facebook.share.internal.ShareConstants;
import com.vkontakte.android.Log;
import com.vkontakte.android.LongPollService;
import com.vkontakte.android.R;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.apps.AppsDeleteRequest;
import com.vkontakte.android.api.apps.AppsMarkRequestAsRead;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.fragments.HtmlGameFragment;
import com.vkontakte.android.ui.drawables.RequestBgDrawable;
import com.vkontakte.android.utils.L;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class Games {
    public static final String ACTION_DELETE_REQUEST = "com.vkontakte.android.games.DELETE_REQUEST";
    public static final String ACTION_DELETE_REQUEST_ALL = "com.vkontakte.android.games.DELETE_REQUEST_ALL";
    public static final String ACTION_RELOAD_INSTALLED = "com.vkontakte.android.games.RELOAD_INSTALLED";
    public static final String ACTION_RELOAD_REQUESTS = "com.vkontakte.android.games.RELOAD_REQUESTS";
    private static final String KEY_REQUEST = "com.vkontakte.android.games.REQUEST_KEY";

    public static void markRequestsAsRead(Context context, ArrayList<GameRequest> requests) {
        if (requests != null) {
            List<Integer> requestIdsToBeMarkedAsRead = new ArrayList<>();
            int markedReadRequestsCount = 0;
            Iterator<GameRequest> it = requests.iterator();
            while (it.hasNext()) {
                GameRequest request = it.next();
                if (request.unread && request.fromIds != null) {
                    if (request.type == 2) {
                        markedReadRequestsCount++;
                    }
                    for (int i = 0; i < request.fromIds.length; i++) {
                        requestIdsToBeMarkedAsRead.add(Integer.valueOf(request.fromIds[i]));
                    }
                }
            }
            if (requestIdsToBeMarkedAsRead.size() > 0) {
                new AppsMarkRequestAsRead(requestIdsToBeMarkedAsRead).persist(null, null).exec(context);
            }
            decreaseAppsCounterBy(markedReadRequestsCount);
        }
    }

    public static void deleteRequest(Context context, @Nullable GameRequest request) {
        if (request != null) {
            Intent intent = new Intent(ACTION_DELETE_REQUEST);
            intent.putExtra(KEY_REQUEST, request);
            LocalBroadcastManager.getInstance(context).sendBroadcastSync(intent);
            if (request.fromIds != null) {
                new AppsDeleteRequest(request.fromIds).setCallback(new SimpleCallback<Boolean>() { // from class: com.vkontakte.android.data.Games.1
                    @Override // com.vkontakte.android.api.Callback
                    public void success(Boolean result) {
                        Games.decreaseAppsCounter();
                    }
                }).persist(null, null).exec(context);
            }
        }
    }

    public static void deleteRequestAll(Context context, @Nullable GameRequest request) {
        if (request != null) {
            Intent intent = new Intent(ACTION_DELETE_REQUEST_ALL);
            intent.putExtra(KEY_REQUEST, request);
            LocalBroadcastManager.getInstance(context).sendBroadcastSync(intent);
            if (request.fromIds != null) {
                new AppsDeleteRequest(request.fromIds).setCallback(new SimpleCallback<Boolean>() { // from class: com.vkontakte.android.data.Games.2
                    @Override // com.vkontakte.android.api.Callback
                    public void success(Boolean result) {
                        Games.nullAppsCounter();
                    }
                }).persist(null, null).exec(context);
            }
        }
    }

    public static GameRequest getRequestFromIntent(Intent intent) {
        return (GameRequest) intent.getParcelableExtra(KEY_REQUEST);
    }

    public static void open(ApiApplication app, Bundle extras, Activity act, @NonNull String vs, @NonNull String cs) {
        if (app.isHtml5App) {
            openHtml5Game(app, extras, act, vs, cs);
        } else {
            openInstallableGame(app.packageName, extras, act, app.id, vs, cs);
        }
    }

    public static void openHtml5Game(final ApiApplication app, final Bundle extras, final Context context, @NonNull final String vs, @NonNull final String cs) {
        if (app.isHtml5App) {
            VKAPIRequest request = new VKAPIRequest("apps.getEmbeddedUrl").setCallback(new Callback<JSONObject>() { // from class: com.vkontakte.android.data.Games.3
                @Override // com.vkontakte.android.api.Callback
                public void success(JSONObject result) {
                    try {
                        JSONObject response = result.getJSONObject(ServerKeys.RESPONSE);
                        String title = response.getString("screen_title");
                        String origUrl = response.getString("original_url");
                        String viewUrl = response.getString(ServerKeys.VIEW_URL);
                        Games.openHtml5Game(context, extras, viewUrl, origUrl, title, app.id, app.screenOrientation, vs, cs);
                    } catch (JSONException e) {
                        L.e("vk", "get embedded url failure", e);
                    }
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    if (error.getCode() == 15) {
                        Toast.makeText(context, (int) R.string.err_access, 0).show();
                    } else {
                        Toast.makeText(context, (int) R.string.error, 0).show();
                    }
                }
            }).param("app_id", app.id);
            request.wrapProgress(context);
            request.exec();
        }
    }

    public static void openHtml5Game(Context ctx, @Nullable Bundle extras, String link, @Nullable String copyLink, @Nullable String screenTitle, int appId, int orientation, @NonNull String vs, @NonNull String cs) {
        Analytics.track("games_action").addParam("visit_source", vs).addParam("click_source", cs).addParam(ShareConstants.WEB_DIALOG_PARAM_ACTION_TYPE, "html5_game_launch").addParam("game_id", appId + "").addParam("request_name", (extras == null || !extras.containsKey("name")) ? null : extras.getString("name")).sendNow();
        if (extras != null && extras.containsKey("key")) {
            String requestKey = extras.getString("key");
            Uri uri = Uri.parse(link);
            link = uri.buildUpon().appendQueryParameter("request_key", requestKey).toString();
        }
        new HtmlGameFragment.Builder(link, 0, appId).setScreenTitle(screenTitle).setUrlToCopy(copyLink).setOrienation(orientation).go(ctx);
    }

    public static boolean isAppInstalledOnDevice(String pkg, Context ctx) {
        try {
            return ctx.getPackageManager().getPackageInfo(pkg, 128) != null;
        } catch (PackageManager.NameNotFoundException e) {
            return false;
        }
    }

    public static void openInstallableGame(String pkg, Bundle extras, Activity act, int id, @NonNull String vs, @NonNull String cs) {
        String action;
        if (pkg == null || pkg.length() == 0) {
            Toast.makeText(act, "No platform_id, can't start app!", 0).show();
            return;
        }
        try {
            PackageManager mgr = act.getPackageManager();
            PackageInfo info = null;
            try {
                info = mgr.getPackageInfo(pkg, 128);
            } catch (PackageManager.NameNotFoundException e) {
            }
            if (info != null) {
                Intent launcherIntent = mgr.getLaunchIntentForPackage(pkg);
                if (launcherIntent == null) {
                    Toast.makeText(act, "Package " + pkg + " has no launchable activities", 0).show();
                    return;
                }
                if (extras != null) {
                    launcherIntent.putExtras(extras);
                }
                launcherIntent.putExtra("auth_user_id", VKAccountManager.getCurrent().getUid());
                act.startActivity(launcherIntent);
                action = "game_launch";
            } else {
                String utm = Uri.encode("utm_source=vk&utm_campaign=" + cs);
                try {
                    act.startActivity(new Intent("android.intent.action.VIEW", Uri.parse("market://details?id=" + pkg + "&referrer=" + utm)));
                } catch (ActivityNotFoundException e2) {
                    act.startActivity(new Intent("android.intent.action.VIEW", Uri.parse("http://play.google.com/store/apps/details?id=" + pkg + "&referrer=" + utm)));
                }
                action = "game_install";
            }
            Analytics.track("games_action").addParam("visit_source", vs).addParam("click_source", cs).addParam(ShareConstants.WEB_DIALOG_PARAM_ACTION_TYPE, action).addParam("game_id", id + "").addParam("request_name", (extras == null || !extras.containsKey("name")) ? null : extras.getString("name")).sendNow();
        } catch (Exception x) {
            Log.w("vk", x);
            Toast.makeText(act, (int) R.string.error, 0).show();
        }
    }

    static void decreaseAppsCounter() {
        decreaseAppsCounterBy(1);
    }

    static void decreaseAppsCounterBy(int num) {
        if (num > 0) {
            LongPollService.setNumAppRequests(LongPollService.getNumAppRequests() - num);
            LongPollService.notifyCountersChanged();
        }
    }

    static void nullAppsCounter() {
        LongPollService.setNumAppRequests(0);
        LongPollService.notifyCountersChanged();
    }

    public static void fadeDrawables(ArrayList<WeakReference<RequestBgDrawable>> drawablesList) {
        final ArrayList<RequestBgDrawable> drawables = new ArrayList<>();
        Iterator<WeakReference<RequestBgDrawable>> iterator = drawablesList.iterator();
        while (iterator.hasNext()) {
            WeakReference<RequestBgDrawable> reference = iterator.next();
            RequestBgDrawable drawable = reference.get();
            if (drawable == null) {
                iterator.remove();
            } else {
                drawables.add(drawable);
            }
        }
        List<Animator> animators = new ArrayList<>();
        Iterator<RequestBgDrawable> it = drawables.iterator();
        while (it.hasNext()) {
            RequestBgDrawable drawable2 = it.next();
            ValueAnimator animator = ObjectAnimator.ofInt(drawable2, "currentColor", drawable2.getCurrentColor(), -1);
            animator.setEvaluator(new ArgbEvaluator());
            animators.add(animator);
        }
        AnimatorSet animatorSet = new AnimatorSet();
        animatorSet.setDuration(400L);
        animatorSet.playTogether(animators);
        animatorSet.addListener(new AnimatorListenerAdapter() { // from class: com.vkontakte.android.data.Games.4
            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                Iterator it2 = drawables.iterator();
                while (it2.hasNext()) {
                    RequestBgDrawable drawable3 = (RequestBgDrawable) it2.next();
                    drawable3.setCanceled();
                }
            }

            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationCancel(Animator animation) {
                Iterator it2 = drawables.iterator();
                while (it2.hasNext()) {
                    RequestBgDrawable drawable3 = (RequestBgDrawable) it2.next();
                    drawable3.setCanceled();
                }
            }
        });
        animatorSet.start();
    }
}
