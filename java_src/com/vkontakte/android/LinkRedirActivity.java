package com.vkontakte.android;

import android.app.Activity;
import android.app.PendingIntent;
import android.app.ProgressDialog;
import android.content.ComponentName;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.ResolveInfo;
import android.database.Cursor;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcelable;
import android.preference.PreferenceManager;
import android.support.annotation.Nullable;
import android.support.v4.app.RemoteInput;
import android.text.TextUtils;
import android.widget.Toast;
import com.facebook.appevents.AppEventsConstants;
import com.facebook.common.util.UriUtil;
import com.google.android.exoplayer2.text.ttml.TtmlNode;
import com.google.android.exoplayer2.util.MimeTypes;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.vk.analytics.Analytics;
import com.vk.core.network.Network;
import com.vk.media.camera.CameraUtilsEffects;
import com.vk.music.fragment.MusicFragment;
import com.vk.music.fragment.PlaylistFragment;
import com.vk.music.fragment.PlaylistsFragment;
import com.vk.music.fragment.SearchFragment;
import com.vk.stories.CreateAndEditStoryActivity;
import com.vk.stories.StoryViewActivity;
import com.vkontakte.android.PhotoViewer;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.activities.LogoutReceiver;
import com.vkontakte.android.activities.VideoPlayerActivity;
import com.vkontakte.android.api.APIUtils;
import com.vkontakte.android.api.BoardTopic;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.PhotoAlbum;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.api.audio.AudioGetById;
import com.vkontakte.android.api.board.BoardGetTopics;
import com.vkontakte.android.api.gifts.GiftsGet;
import com.vkontakte.android.api.gifts.GiftsResolveLink;
import com.vkontakte.android.api.newsfeed.NewsfeedGetPromotionLists;
import com.vkontakte.android.api.photos.PhotosGetAlbums;
import com.vkontakte.android.api.store.GetStockItemByName;
import com.vkontakte.android.api.video.VideoGetById;
import com.vkontakte.android.api.wall.WallGetById;
import com.vkontakte.android.audio.AudioFacade;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.contentprovider.AudioContentProviderConstants;
import com.vkontakte.android.audio.player.PlayerRefer;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.ApiApplication;
import com.vkontakte.android.data.CatalogInfo;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.data.GameGenre;
import com.vkontakte.android.data.Games;
import com.vkontakte.android.data.Messages;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.UserNotification;
import com.vkontakte.android.data.orm.StickerStockItem;
import com.vkontakte.android.fragments.AuthCheckFragment;
import com.vkontakte.android.fragments.GamesFragment;
import com.vkontakte.android.fragments.MaterialPreferenceFragment;
import com.vkontakte.android.fragments.NewsFragment;
import com.vkontakte.android.fragments.NewsSearchFragment;
import com.vkontakte.android.fragments.PostViewFragment;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.fragments.SettingsAccountFragment;
import com.vkontakte.android.fragments.SettingsGeneralFragment;
import com.vkontakte.android.fragments.SettingsListFragment;
import com.vkontakte.android.fragments.SettingsNotificationsFragment;
import com.vkontakte.android.fragments.WebViewFragment;
import com.vkontakte.android.fragments.WikiViewFragment;
import com.vkontakte.android.fragments.discussions.BoardTopicViewFragment;
import com.vkontakte.android.fragments.discussions.BoardTopicsFragment;
import com.vkontakte.android.fragments.documents.DocumentsFragmentBuilder;
import com.vkontakte.android.fragments.fave.FaveFragment;
import com.vkontakte.android.fragments.feedback.FeedbackFragment;
import com.vkontakte.android.fragments.friends.FriendRequestsFragment;
import com.vkontakte.android.fragments.friends.FriendsFragment;
import com.vkontakte.android.fragments.gifts.BirthdaysFragment;
import com.vkontakte.android.fragments.gifts.GiftsCatalogFragment;
import com.vkontakte.android.fragments.gifts.ProfileGiftsFragment;
import com.vkontakte.android.fragments.groups.GroupsFragment;
import com.vkontakte.android.fragments.market.GoodFragment;
import com.vkontakte.android.fragments.market.MarketFragment;
import com.vkontakte.android.fragments.messages.ChatFragment;
import com.vkontakte.android.fragments.messages.DialogsFragment;
import com.vkontakte.android.fragments.money.SubscriptionFragment;
import com.vkontakte.android.fragments.news.NewPostFragment;
import com.vkontakte.android.fragments.photos.PhotoAlbumListFragment;
import com.vkontakte.android.fragments.photos.PhotoListFragment;
import com.vkontakte.android.fragments.search.ExtendedSearchFragment;
import com.vkontakte.android.fragments.stickers.StickerManagerFragment;
import com.vkontakte.android.fragments.stickers.StickerStoreFragment;
import com.vkontakte.android.fragments.stickers.StickersDetailsFragment;
import com.vkontakte.android.fragments.videos.VideosFragment;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.navigation.Navigate;
import com.vkontakte.android.ui.ActivityResulter;
import com.vkontakte.android.ui.ResulterProvider;
import com.vkontakte.android.utils.L;
import com.vkontakte.android.utils.XSRFTokenUtil;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import io.fabric.sdk.android.services.settings.SettingsJsonConstants;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class LinkRedirActivity extends Activity implements ResulterProvider {
    private static final List<String> NOT_DOMAINS = Arrays.asList("/settings", "/edit");
    private boolean forceInternal = false;
    private LogoutReceiver logoutReceiver = null;
    private List<ActivityResulter> mResulters;
    private boolean otherApp;

    public static Intent createIntentForNotification(Context ctx) {
        return new Intent(ctx, LinkRedirActivity.class).putExtra("lastUserId", VKAccountManager.getCurrent().getUid());
    }

    public static boolean isVKHost(Uri uri) {
        String valueOf = String.valueOf(uri.getHost());
        char c = 65535;
        switch (valueOf.hashCode()) {
            case -1953179799:
                if (valueOf.equals("m.vk.com")) {
                    c = 3;
                    break;
                }
                break;
            case -816441656:
                if (valueOf.equals("vk.com")) {
                    c = 1;
                    break;
                }
                break;
            case 112210801:
                if (valueOf.equals("vk.me")) {
                    c = 4;
                    break;
                }
                break;
            case 284098262:
                if (valueOf.equals("new.vk.com")) {
                    c = 2;
                    break;
                }
                break;
            case 1126518102:
                if (valueOf.equals("vkontakte.ru")) {
                    c = 0;
                    break;
                }
                break;
        }
        switch (c) {
            case 0:
            case 1:
            case 2:
            case 3:
            case 4:
                return true;
            default:
                return false;
        }
    }

    public static void openLink(Context ctx, String link, @Nullable String copyLink, @Nullable String screenTitle, int ownerId, int appId, boolean isHtml5App, int orientation) {
        if (isHtml5App) {
            Games.openHtml5Game(ctx, null, link, copyLink, screenTitle, appId, orientation, "direct", "activity");
        } else {
            new WebViewFragment.Builder(link).setUrlToCopy(copyLink).setScreenTitle(screenTitle).setAppReport(appId != 0).setOwnerId(ownerId).setAppId(appId).setTheme(R.style.WhiteTheme).openInternally().go(ctx);
        }
    }

    @Override // android.app.Activity
    public void onCreate(Bundle b) {
        int id;
        int id2;
        Log.i("LinkRedir", "OnCreate!");
        super.onCreate(b);
        this.logoutReceiver = LogoutReceiver.register(this);
        if (getIntent() == null) {
            finish();
        } else if (getIntent().getIntExtra("lastUserId", VKAccountManager.getCurrent().getUid()) != VKAccountManager.getCurrent().getUid()) {
            finish();
            startActivity(new Intent(getApplicationContext(), MainActivity.class));
        } else if (getIntent().getCategories() != null && getIntent().getCategories().contains("android.intent.category.NOTIFICATION_PREFERENCES")) {
            Navigate.to(SettingsNotificationsFragment.class, new Bundle(), this);
            finish();
        } else {
            Uri data = getIntent().getData();
            if (getIntent().getData() == null) {
                showError();
                finish();
                return;
            }
            String url = data.toString();
            if ("android.intent.action.SEND".equals(getIntent().getAction())) {
                openPlainText(url);
            } else if (isVKContent(data)) {
                try {
                    Cursor cursor = getContentResolver().query(getIntent().getData(), new String[]{"data1"}, null, null, null);
                    cursor.moveToFirst();
                    int uid = cursor.getInt(cursor.getColumnIndex("data1"));
                    String ctype = getIntent().getType();
                    if ("vnd.android.cursor.item/vnd.com.vkontakte.android.profile".equals(ctype)) {
                        new ProfileFragment.Builder(uid).go(this);
                        finish();
                    } else if ("vnd.android.cursor.item/vnd.com.vkontakte.android.sendmsg".equals(ctype)) {
                        openChat(uid, null, null);
                    }
                } catch (Exception e) {
                    finish();
                }
            } else {
                if (isVKLink(data)) {
                    url = data.toString().split("\\?", 2)[1];
                    this.forceInternal = "internal".equals(data.getHost());
                    if (this.forceInternal && !XSRFTokenUtil.verifyToken(getIntent().getStringExtra(AuthCheckFragment.KEY_TOKEN), url)) {
                        finish();
                        return;
                    }
                } else if (isVKScheme(data)) {
                    if ("profile".equals(data.getHost())) {
                        new ProfileFragment.Builder(safeParseInt(data.getPathSegments().get(0))).go(this);
                        finish();
                        return;
                    } else if (FirebaseAnalytics.Event.SEARCH.equals(data.getHost())) {
                        String dt = data.toString();
                        String q = dt.split(CameraUtilsEffects.FILE_DELIM, 4)[3];
                        Bundle args = new Bundle();
                        args.putString("q", q);
                        Navigate.to(NewsSearchFragment.class, args, this);
                        finish();
                        return;
                    } else if ("chat".equals(data.getHost())) {
                        int uid2 = safeParseInt(data.getQueryParameter("peer"));
                        ChatFragment.Builder builder = new ChatFragment.Builder(uid2, data.getQueryParameter("title"));
                        if (uid2 < 2000000000) {
                            builder.setPhoto(data.getQueryParameter("photo"));
                        }
                        Intent intent = builder.intent(VKApplication.context);
                        if (AppStateTracker.getCurrentActivity() != null && !AppStateTracker.isInBackground()) {
                            AppStateTracker.getCurrentActivity().startActivity(intent);
                        } else {
                            startActivity(intent);
                        }
                        finish();
                        return;
                    } else if ("reply".equals(data.getHost())) {
                        Bundle x = RemoteInput.getResultsFromIntent(getIntent());
                        String hash = data.getQueryParameter(SettingsJsonConstants.ICON_HASH_KEY);
                        String rhash = getSharedPreferences(null, 0).getString("msg_reply_hash", "");
                        if (rhash.equals(hash)) {
                            int peer = safeParseInt(data.getQueryParameter("peer"));
                            String text = x.get("voice_reply") + "";
                            if (peer != 0) {
                                Messages.send(peer, text, new ArrayList(), null, 0);
                            }
                        }
                        finish();
                        return;
                    } else if ("app".equals(data.getHost())) {
                        String pkg = data.getQueryParameter("pkg");
                        Games.openInstallableGame(pkg, new Bundle(), this, safeParseInt(data.getQueryParameter("id")), "push", "push");
                        finish();
                        return;
                    } else if (UserNotification.LAYOUT_NEWSFEED_NEW_POST.equals(data.getHost())) {
                        NewPostFragment.Builder builder2 = new NewPostFragment.Builder();
                        builder2.uid(VKAccountManager.getCurrent().getUid());
                        builder2.attachText(data.getQueryParameter("text"));
                        builder2.attachCamera("camera".equals(data.getQueryParameter("attach")));
                        builder2.send(true);
                        builder2.go(this);
                        finish();
                        return;
                    } else if ("new_story".equals(data.getHost())) {
                        startActivity(new Intent(this, CreateAndEditStoryActivity.class));
                        finish();
                        return;
                    } else if ("settings".equals(data.getHost())) {
                        if ("general".equals(data.getLastPathSegment())) {
                            Navigate.to(SettingsGeneralFragment.class, null, this);
                        } else {
                            Navigate.to(SettingsListFragment.class, null, this);
                        }
                        finish();
                        return;
                    }
                } else {
                    this.otherApp = true;
                }
                if (!url.startsWith("http://") && !url.startsWith("https://") && !url.startsWith("vkontakte://") && !url.startsWith("vk://")) {
                    url = "http://" + url;
                }
                final Uri uri = Uri.parse(url);
                if (getIntent().getBooleanExtra("force_browser", false)) {
                    openBrowser(uri);
                    finish();
                } else if (TextUtils.equals("/share.php", uri.getPath()) && !TextUtils.isEmpty(uri.getQueryParameter("url"))) {
                    openPlainText(uri.getQueryParameter("url"));
                } else if ("android.intent.action.VIEW".equals(getIntent().getAction()) && !TextUtils.isEmpty(uri.getQueryParameter("_fm"))) {
                    openBrowser(uri);
                    finish();
                } else if ("vk.me".equals(uri.getHost())) {
                    String path = uri.getPath();
                    final String ref = uri.getQueryParameter("ref");
                    final String refSource = uri.getQueryParameter("ref_source");
                    if (path.matches("^/id[0-9]+$")) {
                        Pattern ptn = Pattern.compile("/id([-0-9]+)");
                        Matcher m = ptn.matcher(url);
                        m.find();
                        openChat(safeParseInt(m.group(1)), ref, refSource);
                    } else if (path.matches("^/(club|public|event)[0-9]+$")) {
                        Pattern ptn2 = Pattern.compile("/(?:club|public|event)([-0-9]+)");
                        Matcher m2 = ptn2.matcher(url);
                        m2.find();
                        openChat(-safeParseInt(m2.group(1)), ref, refSource);
                    } else if (path.matches("/[A-Za-z0-9\\._]+") && !NOT_DOMAINS.contains(path)) {
                        Pattern ptn3 = Pattern.compile("/([A-Za-z0-9\\._]+)");
                        Matcher m3 = ptn3.matcher(path);
                        m3.find();
                        String scrName = m3.group(1);
                        new VKAPIRequest("execute.resolveScreenName").param("screen_name", scrName).setCallback(new Callback<JSONObject>() { // from class: com.vkontakte.android.LinkRedirActivity.1
                            @Override // com.vkontakte.android.api.Callback
                            public void success(JSONObject o) {
                                try {
                                    JSONObject r = o.optJSONObject(ServerKeys.RESPONSE);
                                    if (r == null || !r.has(ServerKeys.TYPE)) {
                                        LinkRedirActivity.this.openBrowser(uri);
                                        LinkRedirActivity.this.finish();
                                    } else {
                                        String type = r.getString(ServerKeys.TYPE);
                                        if (ProfileGiftsFragment.Extra.User.equals(type)) {
                                            LinkRedirActivity.this.openChat(r.getInt("object_id"), ref, refSource);
                                        } else if ("group".equals(type)) {
                                            LinkRedirActivity.this.openChat(-r.getInt("object_id"), ref, refSource);
                                        } else {
                                            LinkRedirActivity.this.openBrowser(uri);
                                            LinkRedirActivity.this.finish();
                                        }
                                    }
                                } catch (Exception x2) {
                                    Log.w("vk", x2);
                                }
                            }

                            @Override // com.vkontakte.android.api.Callback
                            public void fail(VKAPIRequest.VKErrorResponse error) {
                                LinkRedirActivity.this.openBrowser(uri);
                                LinkRedirActivity.this.finish();
                            }
                        }).wrapProgress(this).exec();
                    } else {
                        openBrowser(uri);
                        finish();
                    }
                } else {
                    if (isVKHost(uri) || isVKScheme(uri)) {
                        String path2 = uri.getPath();
                        boolean notDomain = false;
                        String pathQuery = uri.getQueryParameter("z");
                        if (TextUtils.isEmpty(pathQuery)) {
                            pathQuery = uri.getQueryParameter("w");
                        }
                        if (!TextUtils.isEmpty(pathQuery)) {
                            path2 = CameraUtilsEffects.FILE_DELIM + pathQuery.split("\\/")[0];
                            url = uri.getScheme() + "://vk.com" + path2;
                            notDomain = true;
                        }
                        if (path2.equals("/away") || path2.equals("/away.php")) {
                            openBrowser(uri);
                            finish();
                            return;
                        } else if ("/apps".equals(path2)) {
                            int appId = parseInt(path2.substring("/app".length(), path2.length()));
                            if (appId == 0) {
                                appId = parseInt(uri.getQueryParameter("game_id"));
                            }
                            if (appId == 0) {
                                appId = parseInt(uri.getQueryParameter("games_id"));
                            }
                            int genreId = parseInt(uri.getQueryParameter(ServerKeys.TYPE));
                            if (genreId == 0) {
                                genreId = parseInt(uri.getQueryParameter("genre_id"));
                            }
                            boolean isFromPush = (uri.getQueryParameter("from_notification") != null) | getIntent().getBooleanExtra("from_notification", false);
                            String vs = isFromPush ? "push" : "direct";
                            if (genreId != 0) {
                                GameGenre gameGenre = new GameGenre(genreId, null);
                                CatalogInfo catalogInfo = new CatalogInfo(gameGenre);
                                GameCardActivity.openApp(this, vs, "push", catalogInfo);
                            } else if (appId != 0) {
                                GameCardActivity.openApp(this, vs, "push", appId);
                            } else {
                                Navigate.to(GamesFragment.class, GamesFragment.createArgs(isFromPush ? "push" : "direct"), this);
                            }
                            setResult(-1);
                            finish();
                            return;
                        } else if (path2.equals("/settings") && "account".equals(uri.getQueryParameter("act"))) {
                            Bundle bundle = new Bundle();
                            String toBeHighlighted = uri.getQueryParameter("highlight");
                            if (toBeHighlighted != null) {
                                bundle.putString(MaterialPreferenceFragment.HIGHLIGHT_PREFERENCE_KEY, toBeHighlighted);
                            }
                            Navigate.to(SettingsAccountFragment.class, bundle, this);
                            setResult(-1);
                            finish();
                            return;
                        } else if (path2.equals("/friends")) {
                            Bundle args2 = new Bundle();
                            if ("requests".equals(uri.getQueryParameter(ServerKeys.SECTION))) {
                                args2.putBoolean("menu_clear_all", true);
                                Navigate.to(FriendRequestsFragment.class, args2, this);
                                setResult(-1);
                                finish();
                                return;
                            }
                            if (uri.getQueryParameter("id") != null && (id2 = safeParseInt(uri.getQueryParameter("id"))) > 0) {
                                args2.putInt(ArgKeys.UID, id2);
                            }
                            Navigate.to(FriendsFragment.class, args2, this);
                            setResult(-1);
                            finish();
                            return;
                        } else if (path2.equals("/stickers/settings")) {
                            StickerManagerFragment.start(this);
                            setResult(-1);
                            finish();
                            return;
                        } else if (path2.equals("/groups")) {
                            Bundle args3 = new Bundle();
                            if (uri.getQueryParameter("id") != null && (id = safeParseInt(uri.getQueryParameter("id"))) > 0) {
                                args3.putInt(ArgKeys.UID, id);
                            }
                            if ("events".equals(uri.getQueryParameter("tab"))) {
                                args3.putInt("tab", 1);
                            }
                            if ("admin".equals(uri.getQueryParameter("tab"))) {
                                args3.putBoolean("admin_only", true);
                            }
                            Navigate.to(GroupsFragment.class, args3, this);
                            setResult(-1);
                            finish();
                            return;
                        } else {
                            if (path2.equals("/search")) {
                                Uri fixedUri = Uri.parse(data.toString().replaceAll("c\\[([a-z]+)\\]=", "c_$1="));
                                if ("people".equals(fixedUri.getQueryParameter("c_section"))) {
                                    Bundle args4 = new Bundle();
                                    if (!TextUtils.isEmpty(fixedUri.getQueryParameter("c_q"))) {
                                        args4.putString("q", fixedUri.getQueryParameter("c_q"));
                                    }
                                    Navigate.to(ExtendedSearchFragment.class, args4, this);
                                    setResult(-1);
                                    finish();
                                    return;
                                } else if ("communities".equals(fixedUri.getQueryParameter(ServerKeys.SECTION)) || "communities".equals(fixedUri.getQueryParameter("c_section"))) {
                                    Navigate.to(GroupsFragment.class, new Bundle(), this);
                                    setResult(-1);
                                    finish();
                                    return;
                                } else if ("statuses".equals(fixedUri.getQueryParameter(ServerKeys.SECTION)) || "statuses".equals(fixedUri.getQueryParameter("c_section"))) {
                                    Bundle args5 = new Bundle();
                                    if (!TextUtils.isEmpty(fixedUri.getQueryParameter("c_q"))) {
                                        args5.putString("q", fixedUri.getQueryParameter("c_q"));
                                    }
                                    Navigate.to(NewsSearchFragment.class, args5, this);
                                    setResult(-1);
                                    finish();
                                    return;
                                } else if (MimeTypes.BASE_TYPE_AUDIO.equals(fixedUri.getQueryParameter(ServerKeys.SECTION)) || MimeTypes.BASE_TYPE_AUDIO.equals(fixedUri.getQueryParameter("c_section"))) {
                                    SearchFragment.Builder builder3 = new SearchFragment.Builder();
                                    if (!TextUtils.isEmpty(fixedUri.getQueryParameter("c_q"))) {
                                        builder3.openResults(true);
                                        builder3.query(fixedUri.getQueryParameter("c_q"));
                                    }
                                    builder3.go(this);
                                    setResult(-1);
                                    finish();
                                    return;
                                } else if ("video".equals(fixedUri.getQueryParameter(ServerKeys.SECTION)) || "video".equals(fixedUri.getQueryParameter("c_section"))) {
                                    Navigate.to(VideosFragment.class, new Bundle(), this);
                                    setResult(-1);
                                    finish();
                                    return;
                                }
                            }
                            if (path2.equals("/fave")) {
                                Bundle args6 = new Bundle();
                                if ("likes_posts".equals(data.getQueryParameter(ServerKeys.SECTION))) {
                                    args6.putInt("tab", 3);
                                }
                                if ("likes_photo".equals(data.getQueryParameter(ServerKeys.SECTION))) {
                                    args6.putInt("tab", 1);
                                }
                                if ("likes_video".equals(data.getQueryParameter(ServerKeys.SECTION))) {
                                    args6.putInt("tab", 0);
                                }
                                if ("links".equals(data.getQueryParameter(ServerKeys.SECTION))) {
                                    args6.putInt("tab", 4);
                                }
                                Navigate.to(FaveFragment.class, args6, this);
                                setResult(-1);
                                finish();
                                return;
                            } else if (path2.equals("/mail")) {
                                Navigate.to(DialogsFragment.class, new Bundle(), this);
                                finish();
                                return;
                            } else if (path2.equals("/feed")) {
                                String section = uri.getQueryParameter(ServerKeys.SECTION);
                                if ("notifications".equals(section)) {
                                    Navigate.to(FeedbackFragment.class, new Bundle(), this);
                                } else if (FirebaseAnalytics.Event.SEARCH.equals(section)) {
                                    Bundle args7 = new Bundle();
                                    if (!TextUtils.isEmpty(uri.getQueryParameter("q"))) {
                                        args7.putString("q", uri.getQueryParameter("q"));
                                    }
                                    Navigate.to(NewsSearchFragment.class, args7, this);
                                } else if ("recommended".equals(section)) {
                                    Bundle args8 = new Bundle();
                                    args8.putInt("list_id", -1);
                                    Navigate.to(NewsFragment.class, args8, this);
                                } else if ("friends".equals(section)) {
                                    Bundle args9 = new Bundle();
                                    args9.putInt("list_id", -2);
                                    Navigate.to(NewsFragment.class, args9, this);
                                } else if ("groups".equals(section)) {
                                    Bundle args10 = new Bundle();
                                    args10.putInt("list_id", -3);
                                    Navigate.to(NewsFragment.class, args10, this);
                                } else if (ArgKeys.LIST.equals(section)) {
                                    Bundle args11 = new Bundle();
                                    args11.putInt("list_id", safeParseInt(uri.getQueryParameter(ArgKeys.LIST)));
                                    Navigate.to(NewsFragment.class, args11, this);
                                } else if (section != null && section.length() > 0) {
                                    openPromoFeed(section);
                                    return;
                                } else {
                                    Navigate.to(NewsFragment.class, new Bundle(), this);
                                }
                                setResult(-1);
                                finish();
                                return;
                            } else {
                                if (path2.matches("/feed/[a-zA-Z0-_9]+")) {
                                    Pattern ptn4 = Pattern.compile("/feed/([a-zA-Z0-_9]+)");
                                    Matcher m4 = ptn4.matcher(path2);
                                    if (m4.find()) {
                                        openPromoFeed(m4.group(1));
                                        return;
                                    }
                                }
                                if (path2.equals("/support")) {
                                    if (VKAccountManager.getCurrent().isReal()) {
                                        new WebViewFragment.Builder(VKAccountManager.getCurrent().getSupportUrl()).openInternally().go(this);
                                    }
                                    setResult(-1);
                                    finish();
                                    return;
                                } else if (path2.matches("/stickers/[a-zA-Z0-_9]+")) {
                                    overridePendingTransition(0, 0);
                                    Pattern ptn5 = Pattern.compile("/stickers/([a-zA-Z0-_9]+)");
                                    Matcher m5 = ptn5.matcher(path2);
                                    if (m5.find()) {
                                        new GetStockItemByName(m5.group(1)).setCallback(new Callback<StickerStockItem>() { // from class: com.vkontakte.android.LinkRedirActivity.2
                                            @Override // com.vkontakte.android.api.Callback
                                            public void success(StickerStockItem result) {
                                                result.referrer = "link";
                                                StickersDetailsFragment.show(result, LinkRedirActivity.this);
                                                LinkRedirActivity.this.finish();
                                            }

                                            @Override // com.vkontakte.android.api.Callback
                                            public void fail(VKAPIRequest.VKErrorResponse error) {
                                                LinkRedirActivity.this.finish();
                                                LinkRedirActivity.this.openBrowser(uri);
                                            }
                                        }).wrapProgress(this).exec();
                                        return;
                                    }
                                    return;
                                } else if (path2.equals("/stickers")) {
                                    overridePendingTransition(0, 0);
                                    StickerStoreFragment.start(this);
                                    finish();
                                    return;
                                } else if ("settings".equals(uri.getHost())) {
                                    if ("/general".equals(path2)) {
                                        Navigate.to(SettingsGeneralFragment.class, null, this);
                                    } else {
                                        Navigate.to(SettingsListFragment.class, null, this);
                                    }
                                    finish();
                                    return;
                                } else if (path2.matches("/settings") && "music_subscription".equals(uri.getQueryParameter("act"))) {
                                    new SubscriptionFragment.Builder(1).go(this);
                                    setResult(-1);
                                    finish();
                                    return;
                                } else if (path2.matches("^/ru/.+$")) {
                                    Pattern ptn6 = Pattern.compile("/ru/(.+)");
                                    Matcher matcher = ptn6.matcher(path2);
                                    matcher.find();
                                    new WikiViewFragment.Builder().setTitle(matcher.group(1)).go(this);
                                    setResult(-1);
                                    finish();
                                    return;
                                } else {
                                    if (path2.matches("^/[a-zA-Z0-9\\._]+/[^/]+$")) {
                                        Pattern ptn7 = Pattern.compile("/([a-zA-Z0-9\\._]+)/(.+)");
                                        Matcher matcher2 = ptn7.matcher(path2);
                                        matcher2.find();
                                        final String domain = matcher2.group(1);
                                        final String query = "#" + Uri.decode(matcher2.group(2));
                                        if (!"dev".equals(domain)) {
                                            new VKAPIRequest("execute.resolveScreenName").param("screen_name", domain).setCallback(new Callback<JSONObject>() { // from class: com.vkontakte.android.LinkRedirActivity.3
                                                @Override // com.vkontakte.android.api.Callback
                                                public void success(JSONObject o) {
                                                    try {
                                                        JSONObject r = o.optJSONObject(ServerKeys.RESPONSE);
                                                        if (r == null || !r.has(ServerKeys.TYPE)) {
                                                            LinkRedirActivity.this.openBrowser(uri);
                                                            LinkRedirActivity.this.finish();
                                                        } else {
                                                            String type = r.getString(ServerKeys.TYPE);
                                                            if (!ProfileGiftsFragment.Extra.User.equals(type) && !"group".equals(type)) {
                                                                LinkRedirActivity.this.openBrowser(uri);
                                                                LinkRedirActivity.this.finish();
                                                            } else {
                                                                Bundle args12 = new Bundle();
                                                                args12.putString("q", query);
                                                                args12.putString("domain", domain);
                                                                Navigate.to(NewsSearchFragment.class, args12, LinkRedirActivity.this);
                                                                LinkRedirActivity.this.setResult(-1);
                                                                LinkRedirActivity.this.finish();
                                                            }
                                                        }
                                                    } catch (Exception x2) {
                                                        Log.w("vk", x2);
                                                    }
                                                }

                                                @Override // com.vkontakte.android.api.Callback
                                                public void fail(VKAPIRequest.VKErrorResponse error) {
                                                    LinkRedirActivity.this.openBrowser(uri);
                                                    LinkRedirActivity.this.finish();
                                                }
                                            }).wrapProgress(this).exec();
                                            return;
                                        }
                                    }
                                    if (uri.getQueryParameter("q") != null && path2.matches("/wall[-0-9]+")) {
                                        Pattern ptn8 = Pattern.compile("/wall([-0-9]+)");
                                        Matcher m6 = ptn8.matcher(path2);
                                        m6.find();
                                        int uid3 = safeParseInt(m6.group(1));
                                        String query2 = uri.getQueryParameter("q");
                                        Bundle args12 = new Bundle();
                                        args12.putString("q", query2);
                                        args12.putInt("owner", uid3);
                                        Navigate.to(NewsSearchFragment.class, args12, this);
                                        setResult(-1);
                                        finish();
                                        return;
                                    } else if (path2.matches("/app[-0-9]+") || path2.matches("/app[-0-9]+_[-0-9]+")) {
                                        if (path2.matches("/app[-0-9]+")) {
                                            Matcher m7 = Pattern.compile("/(app[-0-9]+)").matcher(path2);
                                            m7.find();
                                            resolveScreenName(m7.group(1), uri, 0);
                                            return;
                                        }
                                        Matcher m8 = Pattern.compile("/(app[-0-9]+)_([-0-9]+)").matcher(path2);
                                        m8.find();
                                        resolveScreenName(m8.group(1), uri, parseInt(m8.group(2)));
                                        return;
                                    } else if (path2.matches("/tag[0-9]+")) {
                                        finish();
                                        Pattern ptn9 = Pattern.compile("/tag([0-9]+)");
                                        Matcher m9 = ptn9.matcher(url);
                                        m9.find();
                                        new PhotosGetAlbums(safeParseInt(m9.group(1)), true).setCallback(new Callback<PhotosGetAlbums.Result>() { // from class: com.vkontakte.android.LinkRedirActivity.4
                                            @Override // com.vkontakte.android.api.Callback
                                            public void success(PhotosGetAlbums.Result r) {
                                                r.albums.addAll(r.system);
                                                Iterator<PhotoAlbum> it = r.albums.iterator();
                                                while (it.hasNext()) {
                                                    PhotoAlbum a = it.next();
                                                    if (a.id == -9000) {
                                                        new PhotoListFragment.Builder(a).go(LinkRedirActivity.this);
                                                    }
                                                }
                                                LinkRedirActivity.this.setResult(-1);
                                                LinkRedirActivity.this.finish();
                                            }

                                            @Override // com.vkontakte.android.api.Callback
                                            public void fail(VKAPIRequest.VKErrorResponse error) {
                                                LinkRedirActivity.this.finish();
                                            }
                                        }).wrapProgress(this).exec((Context) this);
                                        return;
                                    } else if (path2.matches("/(photos|albums)[-0-9]+")) {
                                        setResult(-1);
                                        finish();
                                        Pattern ptn10 = Pattern.compile("/(?:photos|albums)([-0-9]+)");
                                        Matcher m10 = ptn10.matcher(url);
                                        m10.find();
                                        int uid4 = safeParseInt(m10.group(1));
                                        Bundle args13 = new Bundle();
                                        args13.putInt(ArgKeys.UID, uid4);
                                        args13.putCharSequence("title", getResources().getString(R.string.albums));
                                        Navigate.to(PhotoAlbumListFragment.class, args13, this);
                                        return;
                                    } else if (path2.matches("/(videos)[-0-9]+")) {
                                        setResult(-1);
                                        finish();
                                        Pattern ptn11 = Pattern.compile("/(?:videos)([-0-9]+)");
                                        Matcher m11 = ptn11.matcher(url);
                                        m11.find();
                                        int uid5 = safeParseInt(m11.group(1));
                                        Bundle args14 = new Bundle();
                                        args14.putInt(ArgKeys.UID, uid5);
                                        Navigate.to(VideosFragment.class, args14, this);
                                        return;
                                    } else if (path2.matches("/(id|wall)[-0-9]+")) {
                                        setResult(-1);
                                        finish();
                                        Pattern ptn12 = Pattern.compile("/(?:id|wall)([-0-9]+)");
                                        Matcher m12 = ptn12.matcher(url);
                                        m12.find();
                                        new ProfileFragment.Builder(safeParseInt(m12.group(1))).go(this);
                                        return;
                                    } else if (path2.matches("/write[-0-9]+")) {
                                        Pattern ptn13 = Pattern.compile("/write([-0-9]+)");
                                        Matcher m13 = ptn13.matcher(url);
                                        m13.find();
                                        openChat(safeParseInt(m13.group(1)), null, null);
                                        return;
                                    } else if (path2.equals("/im")) {
                                        String s = uri.getQueryParameter("sel");
                                        int uid6 = 0;
                                        int addValue = 0;
                                        try {
                                            if (s.startsWith("c")) {
                                                s = s.substring(1);
                                                addValue = 2000000000;
                                            }
                                            if (!TextUtils.isEmpty(s)) {
                                                uid6 = Integer.parseInt(s);
                                            }
                                            uid6 += addValue;
                                        } catch (Exception e2) {
                                        }
                                        if (uid6 == 0) {
                                            Navigate.to(DialogsFragment.class, new Bundle(), this);
                                            finish();
                                            return;
                                        }
                                        openChat(uid6, null, null);
                                        return;
                                    } else if (path2.matches("/docs[-0-9]*")) {
                                        Pattern ptn14 = Pattern.compile("/docs([-0-9]*)");
                                        Matcher m14 = ptn14.matcher(url);
                                        m14.find();
                                        new DocumentsFragmentBuilder().setOwnerId(safeParseInt(m14.group(1))).go(this);
                                        setResult(-1);
                                        finish();
                                        return;
                                    } else if (path2.matches("/(club|event|public)[0-9]+")) {
                                        setResult(-1);
                                        finish();
                                        Pattern ptn15 = Pattern.compile("/(?:club|event|public)([0-9]+)");
                                        Matcher m15 = ptn15.matcher(url);
                                        m15.find();
                                        new ProfileFragment.Builder(-safeParseInt(m15.group(1))).go(this);
                                        return;
                                    } else if (path2.matches("/board[0-9]+")) {
                                        setResult(-1);
                                        finish();
                                        Pattern ptn16 = Pattern.compile("/board([0-9]+)");
                                        Matcher m16 = ptn16.matcher(url);
                                        m16.find();
                                        new BoardTopicsFragment.Builder(safeParseInt(m16.group(1))).go(this);
                                        return;
                                    } else if (path2.matches("/album[-0-9]+_[-0-9]+")) {
                                        overridePendingTransition(0, 0);
                                        Pattern ptn17 = Pattern.compile("/album([-0-9]+)_([-0-9]+)");
                                        Matcher m17 = ptn17.matcher(url);
                                        m17.find();
                                        int oid = safeParseInt(m17.group(1));
                                        int _aid = safeParseInt(m17.group(2));
                                        if (AppEventsConstants.EVENT_PARAM_VALUE_NO.equals(m17.group(2))) {
                                            _aid = -6;
                                        } else if ("00".equals(m17.group(2))) {
                                            _aid = -7;
                                        } else if ("000".equals(m17.group(2))) {
                                            _aid = -15;
                                        }
                                        final int aid = _aid;
                                        new VKAPIRequest("execute.getPhotoAlbum").param("owner_id", oid).param("album_id", aid).setCallback(new Callback<JSONObject>() { // from class: com.vkontakte.android.LinkRedirActivity.5
                                            @Override // com.vkontakte.android.api.Callback
                                            public void success(JSONObject o) {
                                                try {
                                                    JSONArray ja = APIUtils.unwrapArray(o, ServerKeys.RESPONSE).array;
                                                    PhotoAlbum a = null;
                                                    int i = 0;
                                                    while (true) {
                                                        if (i >= ja.length()) {
                                                            break;
                                                        } else if (ja.getJSONObject(i).getInt("id") != aid) {
                                                            i++;
                                                        } else {
                                                            a = new PhotoAlbum(ja.getJSONObject(i));
                                                            break;
                                                        }
                                                    }
                                                    if (a == null) {
                                                        LinkRedirActivity.this.showErrorMessage(R.string.access_error);
                                                        LinkRedirActivity.this.finish();
                                                        return;
                                                    }
                                                    LinkRedirActivity.this.setResult(-1);
                                                    LinkRedirActivity.this.finish();
                                                    new PhotoListFragment.Builder(a).go(LinkRedirActivity.this);
                                                } catch (Exception x2) {
                                                    Log.w("vk", x2);
                                                    LinkRedirActivity.this.finish();
                                                    LinkRedirActivity.this.openBrowser(uri);
                                                }
                                            }

                                            @Override // com.vkontakte.android.api.Callback
                                            public void fail(VKAPIRequest.VKErrorResponse error) {
                                                LinkRedirActivity.this.finish();
                                                LinkRedirActivity.this.openBrowser(uri);
                                            }
                                        }).wrapProgress(this).exec((Context) this);
                                        return;
                                    } else if (path2.equals("/pages") && uri.getQueryParameter(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_OID) != null && uri.getQueryParameter(TtmlNode.TAG_P) != null) {
                                        int oid2 = safeParseInt(uri.getQueryParameter(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_OID));
                                        String title = uri.getQueryParameter(TtmlNode.TAG_P).replace('_', ' ');
                                        new WikiViewFragment.Builder().setTitle(title).setOid(oid2).go(this);
                                        setResult(-1);
                                        finish();
                                        return;
                                    } else if (path2.matches("/video[-0-9]+_[0-9]+")) {
                                        Pattern ptn18 = Pattern.compile("/video([-0-9]+)_([0-9]+)");
                                        Matcher m18 = ptn18.matcher(url);
                                        m18.find();
                                        int oid3 = safeParseInt(m18.group(1));
                                        int vid = safeParseInt(m18.group(2));
                                        long timestamp = TimeUtils.getVideoTimestampMs(uri.getQueryParameter("t"));
                                        VideoGetById video = new VideoGetById(oid3, vid, null);
                                        video.setSeekTo(timestamp);
                                        video.setCallback(new Callback<VideoFile>() { // from class: com.vkontakte.android.LinkRedirActivity.6
                                            @Override // com.vkontakte.android.api.Callback
                                            public void success(VideoFile video2) {
                                                LinkRedirActivity.this.setResult(-1);
                                                LinkRedirActivity.this.finish();
                                                if (uri.getQueryParameter("reply") != null) {
                                                    new PostViewFragment.Builder(video2.convertToPost()).setComment(LinkRedirActivity.this.safeParseInt(uri.getQueryParameter("reply"))).go(LinkRedirActivity.this);
                                                    return;
                                                }
                                                Intent intent2 = new Intent(LinkRedirActivity.this, VideoPlayerActivity.class);
                                                intent2.putExtra(UriUtil.LOCAL_FILE_SCHEME, video2);
                                                LinkRedirActivity.this.startActivity(intent2);
                                            }

                                            @Override // com.vkontakte.android.api.Callback
                                            public void fail(VKAPIRequest.VKErrorResponse error) {
                                                LinkRedirActivity.this.finish();
                                                LinkRedirActivity.this.openBrowser(uri);
                                            }
                                        }).wrapProgress(this).exec();
                                        return;
                                    } else if (path2.matches("/topic[-0-9]+_[0-9]+")) {
                                        overridePendingTransition(0, 0);
                                        Pattern ptn19 = Pattern.compile("/topic([-0-9]+)_([0-9]+)");
                                        Matcher m19 = ptn19.matcher(url);
                                        m19.find();
                                        final int oid4 = -safeParseInt(m19.group(1));
                                        final int tid = safeParseInt(m19.group(2));
                                        new BoardGetTopics(oid4, tid).setCallback(new Callback<BoardGetTopics.Result>() { // from class: com.vkontakte.android.LinkRedirActivity.7
                                            @Override // com.vkontakte.android.api.Callback
                                            public void success(BoardGetTopics.Result res) {
                                                boolean z = false;
                                                LinkRedirActivity.this.setResult(-1);
                                                LinkRedirActivity.this.finish();
                                                BoardTopic topic = (BoardTopic) res.topics.get(0);
                                                BoardTopicViewFragment.Builder builder4 = new BoardTopicViewFragment.Builder(tid, oid4, topic.title);
                                                if ((topic.flags & 1) > 0) {
                                                    z = true;
                                                }
                                                builder4.setIsClosed(z).go(LinkRedirActivity.this);
                                            }

                                            @Override // com.vkontakte.android.api.Callback
                                            public void fail(VKAPIRequest.VKErrorResponse error) {
                                                LinkRedirActivity.this.finish();
                                                LinkRedirActivity.this.openBrowser(uri);
                                            }
                                        }).wrapProgress(this).exec();
                                        return;
                                    } else if (path2.matches("/page[-0-9]+_[0-9]+")) {
                                        Pattern ptn20 = Pattern.compile("/page([-0-9]+)_([0-9]+)");
                                        Matcher m20 = ptn20.matcher(url);
                                        m20.find();
                                        int oid5 = safeParseInt(m20.group(1));
                                        int pid = safeParseInt(m20.group(2));
                                        new WikiViewFragment.Builder().setOid(oid5).setPid(pid).go(this);
                                        setResult(-1);
                                        finish();
                                        return;
                                    } else if (path2.matches("/note[-0-9]+_[0-9]+")) {
                                        Pattern ptn21 = Pattern.compile("/note([-0-9]+)_([0-9]+)");
                                        Matcher m21 = ptn21.matcher(url);
                                        m21.find();
                                        new WikiViewFragment.Builder().setOid(safeParseInt(m21.group(1))).setNid(safeParseInt(m21.group(2))).go(this);
                                        setResult(-1);
                                        finish();
                                        return;
                                    } else if (path2.matches("/photo[-_0-9]+")) {
                                        try {
                                            Activity.class.getMethod("overridePendingTransition", Integer.TYPE, Integer.TYPE).invoke(this, 0, 0);
                                        } catch (Exception e3) {
                                        }
                                        Pattern ptn22 = Pattern.compile("/photo([-_0-9]+)");
                                        Matcher m22 = ptn22.matcher(url);
                                        m22.find();
                                        new VKAPIRequest("photos.getById").param("photos", m22.group(1)).param("extended", 1).param(ServerKeys.PHOTO_SIZES, 1).setCallback(new Callback<JSONObject>() { // from class: com.vkontakte.android.LinkRedirActivity.8
                                            @Override // com.vkontakte.android.api.Callback
                                            public void success(JSONObject o) {
                                                try {
                                                    JSONObject jp = o.getJSONArray(ServerKeys.RESPONSE).getJSONObject(0);
                                                    LinkRedirActivity.this.setResult(-1);
                                                    Photo photo = new Photo(jp);
                                                    if (uri.getQueryParameter("reply") != null) {
                                                        ArrayList<Integer> userIds = new ArrayList<>();
                                                        userIds.add(Integer.valueOf(photo.userID));
                                                        ArrayList<UserProfile> users = Friends.getUsersBlocking(userIds);
                                                        if (users.size() > 0) {
                                                            LinkRedirActivity.this.setResult(-1);
                                                            LinkRedirActivity.this.finish();
                                                            photo.user = users.get(0);
                                                            new PostViewFragment.Builder(new NewsEntry(photo)).setComment(LinkRedirActivity.this.safeParseInt(uri.getQueryParameter("reply"))).go(LinkRedirActivity.this);
                                                        } else {
                                                            LinkRedirActivity.this.finish();
                                                            LinkRedirActivity.this.openBrowser(uri);
                                                        }
                                                    } else {
                                                        PhotoViewer viewer = new PhotoViewer(LinkRedirActivity.this, Collections.singletonList(photo), 0, new PhotoViewer.PhotoViewerCallback() { // from class: com.vkontakte.android.LinkRedirActivity.8.1
                                                            @Override // com.vkontakte.android.PhotoViewer.PhotoViewerCallback
                                                            public void getPhotoBounds(int index, Rect outRect, Rect outClip) {
                                                            }

                                                            @Override // com.vkontakte.android.PhotoViewer.PhotoViewerCallback
                                                            public boolean isMoreAvailable() {
                                                                return false;
                                                            }

                                                            @Override // com.vkontakte.android.PhotoViewer.PhotoViewerCallback
                                                            public void loadMore() {
                                                            }

                                                            @Override // com.vkontakte.android.PhotoViewer.PhotoViewerCallback
                                                            public void onDismissed() {
                                                                LinkRedirActivity.this.setResult(-1);
                                                                LinkRedirActivity.this.finish();
                                                            }
                                                        });
                                                        viewer.setTitle(LinkRedirActivity.this.getString(R.string.photo));
                                                        viewer.show();
                                                    }
                                                } catch (Exception e4) {
                                                    LinkRedirActivity.this.showError();
                                                }
                                            }

                                            @Override // com.vkontakte.android.api.Callback
                                            public void fail(VKAPIRequest.VKErrorResponse error) {
                                                LinkRedirActivity.this.finish();
                                                LinkRedirActivity.this.openBrowser(uri);
                                            }
                                        }).wrapProgress(this).exec((Context) this);
                                        return;
                                    } else if (path2.matches("/wall[-0-9]+_[0-9]+")) {
                                        overridePendingTransition(0, 0);
                                        Pattern ptn23 = Pattern.compile("wall([-0-9]+_[0-9]+)");
                                        Matcher m23 = ptn23.matcher(url);
                                        m23.find();
                                        new WallGetById(new String[]{m23.group(1)}).setCallback(new SimpleCallback<NewsEntry[]>(this) { // from class: com.vkontakte.android.LinkRedirActivity.9
                                            @Override // com.vkontakte.android.api.Callback
                                            public void success(NewsEntry[] news) {
                                                LinkRedirActivity.this.setResult(-1);
                                                LinkRedirActivity.this.finish();
                                                if (news.length == 0) {
                                                    LinkRedirActivity.this.showErrorMessage(R.string.post_not_found);
                                                    return;
                                                }
                                                PostViewFragment.Builder builder4 = new PostViewFragment.Builder(news[0]);
                                                if (uri.getQueryParameter("reply") != null) {
                                                    builder4.setComment(LinkRedirActivity.this.safeParseInt(uri.getQueryParameter("reply")));
                                                }
                                                builder4.go(LinkRedirActivity.this);
                                            }

                                            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
                                            public void fail(VKAPIRequest.VKErrorResponse err) {
                                                LinkRedirActivity.this.finish();
                                                if (err.getCodeValue() != -1) {
                                                    LinkRedirActivity.this.openBrowser(uri);
                                                } else {
                                                    super.fail(err);
                                                }
                                            }
                                        }).wrapProgress(this).exec();
                                        return;
                                    } else if (path2.matches("/story[-0-9]+_[0-9]+")) {
                                        Pattern ptn24 = Pattern.compile("story([-0-9]+_[0-9]+)");
                                        Matcher m24 = ptn24.matcher(url);
                                        m24.find();
                                        String post = m24.group(1);
                                        String accessKey = uri.getQueryParameter("access_key");
                                        if (!TextUtils.isEmpty(accessKey)) {
                                            post = post + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + accessKey;
                                        }
                                        Intent intent2 = new Intent(this, StoryViewActivity.class);
                                        intent2.putExtra(StoryViewActivity.INTENT_OPEN_STORY, post);
                                        startActivity(intent2);
                                        setResult(-1);
                                        finish();
                                        return;
                                    } else if (path2.matches("/mask[-0-9]+_[0-9]+")) {
                                        Pattern ptn25 = Pattern.compile("mask([-0-9]+_[0-9]+)");
                                        Matcher m25 = ptn25.matcher(url);
                                        m25.find();
                                        String mask = m25.group(1);
                                        String accessKey2 = uri.getQueryParameter("access_key");
                                        if (!TextUtils.isEmpty(accessKey2)) {
                                            mask = mask + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + accessKey2;
                                        }
                                        Intent intent3 = new Intent(this, CreateAndEditStoryActivity.class);
                                        intent3.putExtra(CreateAndEditStoryActivity.INTENT_OPEN_MASK, mask);
                                        startActivity(intent3);
                                        setResult(-1);
                                        finish();
                                        return;
                                    } else if (path2.equals("/audio")) {
                                        overridePendingTransition(0, 0);
                                        MusicFragment.Builder builder4 = new MusicFragment.Builder();
                                        if ("recoms".equals(uri.getQueryParameter(ServerKeys.SECTION))) {
                                            builder4.sectionRecommended();
                                        }
                                        builder4.go(this);
                                        setResult(-1);
                                        finish();
                                        return;
                                    } else if (path2.matches("/audio_playlist[-0-9]+_[0-9]+")) {
                                        overridePendingTransition(0, 0);
                                        Pattern ptn26 = Pattern.compile("/audio_playlist([-0-9]+)_([0-9]+)");
                                        Matcher m26 = ptn26.matcher(url);
                                        m26.find();
                                        String accessKey3 = null;
                                        String z = uri.getQueryParameter("z");
                                        if (z != null) {
                                            String[] zz = z.split(CameraUtilsEffects.FILE_DELIM);
                                            if (zz.length > 1) {
                                                accessKey3 = zz[1];
                                            }
                                        }
                                        openAudioPage(Integer.parseInt(m26.group(1)), Integer.parseInt(m26.group(2)), accessKey3);
                                        setResult(-1);
                                        finish();
                                        return;
                                    } else if (path2.matches("/audio_playlist[-0-9]+_[0-9]+_[0-9a-zA-Z]+")) {
                                        overridePendingTransition(0, 0);
                                        Pattern ptn27 = Pattern.compile("/audio_playlist([-0-9]+)_([0-9]+)_([0-9a-zA-Z]+)");
                                        Matcher m27 = ptn27.matcher(url);
                                        m27.find();
                                        openAudioPage(Integer.parseInt(m27.group(1)), Integer.parseInt(m27.group(2)), m27.group(3));
                                        setResult(-1);
                                        finish();
                                        return;
                                    } else if (path2.matches("/audios[-0-9]+")) {
                                        String albumId = uri.getQueryParameter("album_id");
                                        overridePendingTransition(0, 0);
                                        Pattern ptn28 = Pattern.compile("audios([-0-9]+)");
                                        Matcher m28 = ptn28.matcher(url);
                                        m28.find();
                                        if ("playlists".equals(uri.getQueryParameter(ServerKeys.SECTION))) {
                                            new PlaylistsFragment.Builder().ownerId(Integer.parseInt(m28.group(1))).go(this);
                                            setResult(-1);
                                            finish();
                                            return;
                                        }
                                        openAudioPage(Integer.parseInt(m28.group(1)), TextUtils.isEmpty(albumId) ? -1 : Integer.parseInt(albumId), null);
                                        return;
                                    } else if (path2.matches("/audio[-0-9]+_[0-9]+")) {
                                        overridePendingTransition(0, 0);
                                        Pattern ptn29 = Pattern.compile("audio([-0-9]+_[0-9]+)");
                                        Matcher m29 = ptn29.matcher(url);
                                        m29.find();
                                        new AudioGetById(Collections.singletonList(m29.group(1))).setCallback(new Callback<ArrayList<MusicTrack>>() { // from class: com.vkontakte.android.LinkRedirActivity.10
                                            @Override // com.vkontakte.android.api.Callback
                                            public void success(ArrayList<MusicTrack> res) {
                                                LinkRedirActivity.this.setResult(-1);
                                                LinkRedirActivity.this.finish();
                                                if (res.size() == 0) {
                                                    LinkRedirActivity.this.showErrorMessage(R.string.post_not_found);
                                                    return;
                                                }
                                                MusicTrack af = res.get(0);
                                                AudioFacade.playTrack(af, PlayerRefer.none, true);
                                                AudioFacade.showPlayer();
                                            }

                                            @Override // com.vkontakte.android.api.Callback
                                            public void fail(VKAPIRequest.VKErrorResponse err) {
                                                LinkRedirActivity.this.finish();
                                                LinkRedirActivity.this.openBrowser(uri);
                                            }
                                        }).wrapProgress(this).exec();
                                        return;
                                    } else if (path2.equals("/gifts")) {
                                        overridePendingTransition(0, 0);
                                        GiftsCatalogFragment.start(this, null);
                                        setResult(-1);
                                        finish();
                                        return;
                                    } else {
                                        if (path2.matches("/product[0-9]+_[0-9]+") || path2.matches("/product-[0-9]+_[0-9]+")) {
                                            int ownerId = 0;
                                            int productId = 0;
                                            Matcher m30 = Pattern.compile("/product([0-9]+)_([0-9]+)").matcher(path2);
                                            if (m30.find()) {
                                                ownerId = Integer.parseInt(m30.group(1));
                                                productId = Integer.parseInt(m30.group(2));
                                            }
                                            Matcher m31 = Pattern.compile("/product(-[0-9]+)_([0-9]+)").matcher(path2);
                                            if (m31.find()) {
                                                ownerId = Integer.parseInt(m31.group(1));
                                                productId = Integer.parseInt(m31.group(2));
                                            }
                                            if (ownerId != 0 && productId != 0) {
                                                new GoodFragment.Builder(GoodFragment.Builder.Source.link, ownerId, productId).go(this);
                                                setResult(-1);
                                                finish();
                                                return;
                                            }
                                        }
                                        if (path2.matches("/market[0-9]+") || path2.matches("/market[-0-9]+")) {
                                            String section2 = uri.getQueryParameter(ServerKeys.SECTION);
                                            Matcher m32 = Pattern.compile("/market([0-9]+)").matcher(path2);
                                            int ownerId2 = 0;
                                            if (m32.find()) {
                                                ownerId2 = Integer.parseInt(m32.group(1));
                                            }
                                            Matcher m33 = Pattern.compile("/market([-0-9]+)").matcher(path2);
                                            if (m33.find()) {
                                                ownerId2 = Integer.parseInt(m33.group(1));
                                            }
                                            if (ownerId2 != 0) {
                                                MarketFragment.Builder builder5 = new MarketFragment.Builder(ownerId2);
                                                if (!TextUtils.isEmpty(section2) && section2.startsWith("album_")) {
                                                    String albumIdStr = section2.substring("album_".length());
                                                    if (TextUtils.isDigitsOnly(albumIdStr)) {
                                                        builder5.setAlbum(Integer.parseInt(albumIdStr));
                                                    }
                                                }
                                                builder5.go(this);
                                                setResult(-1);
                                                finish();
                                                return;
                                            }
                                        }
                                        if (path2.matches("/gifts[0-9]+")) {
                                            overridePendingTransition(0, 0);
                                            Pattern ptn30 = Pattern.compile("/gifts([0-9]+)");
                                            Matcher m34 = ptn30.matcher(path2);
                                            if (m34.find()) {
                                                if ("send".equals(uri.getQueryParameter("act"))) {
                                                    final ProgressDialog progress = new ProgressDialog(this);
                                                    progress.setMessage(getString(R.string.loading));
                                                    progress.setCancelable(false);
                                                    progress.show();
                                                    Friends.getUsers(Arrays.asList(Integer.valueOf(safeParseInt(m34.group(1)))), new Friends.GetUsersCallback() { // from class: com.vkontakte.android.LinkRedirActivity.11
                                                        @Override // com.vkontakte.android.data.Friends.GetUsersCallback
                                                        public void onUsersLoaded(final ArrayList<UserProfile> users) {
                                                            LinkRedirActivity.this.runOnUiThread(new Runnable() { // from class: com.vkontakte.android.LinkRedirActivity.11.1
                                                                @Override // java.lang.Runnable
                                                                public void run() {
                                                                    ViewUtils.dismissDialogSafety(progress);
                                                                    if (users.size() <= 0) {
                                                                        LinkRedirActivity.this.showError();
                                                                    } else {
                                                                        GiftsCatalogFragment.start(LinkRedirActivity.this, (UserProfile) users.get(0));
                                                                    }
                                                                    LinkRedirActivity.this.setResult(-1);
                                                                    LinkRedirActivity.this.finish();
                                                                }
                                                            });
                                                        }
                                                    });
                                                    return;
                                                }
                                                new GiftsResolveLink(m34.group(1)).setCallback(new Callback<GiftsGet.UserProfile>() { // from class: com.vkontakte.android.LinkRedirActivity.12
                                                    @Override // com.vkontakte.android.api.Callback
                                                    public void success(GiftsGet.UserProfile result) {
                                                        if (!result.can_see_gifts) {
                                                            new VKAlertDialog.Builder(LinkRedirActivity.this).setMessage(R.string.gifts_privacy_error).setOnCancelListener(new DialogInterface.OnCancelListener() { // from class: com.vkontakte.android.LinkRedirActivity.12.2
                                                                @Override // android.content.DialogInterface.OnCancelListener
                                                                public void onCancel(DialogInterface dialog) {
                                                                    LinkRedirActivity.this.setResult(-1);
                                                                    LinkRedirActivity.this.finish();
                                                                }
                                                            }).setPositiveButton(R.string.ok, new DialogInterface.OnClickListener() { // from class: com.vkontakte.android.LinkRedirActivity.12.1
                                                                @Override // android.content.DialogInterface.OnClickListener
                                                                public void onClick(DialogInterface dialog, int which) {
                                                                    dialog.cancel();
                                                                }
                                                            }).show();
                                                            return;
                                                        }
                                                        Bundle args15 = new Bundle();
                                                        args15.putParcelable(ProfileGiftsFragment.Extra.User, result);
                                                        args15.putCharSequence("title", LinkRedirActivity.this.getResources().getString(R.string.gifts_of_placeholder, result.first_name_gen));
                                                        Navigate.to(ProfileGiftsFragment.class, args15, LinkRedirActivity.this);
                                                        LinkRedirActivity.this.setResult(-1);
                                                        LinkRedirActivity.this.finish();
                                                    }

                                                    @Override // com.vkontakte.android.api.Callback
                                                    public void fail(VKAPIRequest.VKErrorResponse error) {
                                                        LinkRedirActivity.this.finish();
                                                        LinkRedirActivity.this.openBrowser(uri);
                                                    }
                                                }).wrapProgress(this).exec();
                                                return;
                                            }
                                            return;
                                        } else if (path2.equals("/calendar") && notDomain) {
                                            Navigate.to(BirthdaysFragment.class, new Bundle(), this);
                                            setResult(-1);
                                            finish();
                                            return;
                                        } else if (path2.matches("/[A-Za-z0-9\\._]+") && !notDomain && !NOT_DOMAINS.contains(path2)) {
                                            try {
                                                Activity.class.getMethod("overridePendingTransition", Integer.TYPE, Integer.TYPE).invoke(this, 0, 0);
                                            } catch (Exception e4) {
                                            }
                                            Pattern ptn31 = Pattern.compile("/([A-Za-z0-9\\._]+)");
                                            Matcher m35 = ptn31.matcher(path2);
                                            m35.find();
                                            resolveScreenName(m35.group(1), uri, 0);
                                            return;
                                        }
                                    }
                                }
                            }
                        }
                    }
                    if (isNotVKAuthority(uri) && !isNoBrowser()) {
                        openView(uri);
                    } else {
                        openBrowser(uri);
                    }
                    if (!isNoBrowser()) {
                        setResult(-1);
                    }
                    finish();
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void openBrowser(Uri uri) {
        Uri uri2;
        if (!isNoBrowser()) {
            if (this.forceInternal) {
                Intent intent = new Intent(this, ValidationActivity.class);
                intent.putExtra("url", uri.toString());
                if (getIntent().hasExtra("device_token")) {
                    intent.putExtra("device_token", getIntent().getStringExtra("device_token"));
                }
                startActivity(intent);
                return;
            }
            L.e("vk", "unrecognized link: " + uri);
            if (isVKScheme(uri)) {
                if ("m.vk.com".equals(uri.getAuthority())) {
                    uri = uri.buildUpon().scheme(UriUtil.HTTP_SCHEME).build();
                } else {
                    return;
                }
            }
            Uri orig = uri;
            if (isNotVKAuthority(uri)) {
                uri2 = makeAwayUri(orig);
            } else {
                uri2 = uri.buildUpon().scheme(UriUtil.HTTPS_SCHEME).build();
            }
            boolean unsupportedLink = false;
            if (this.otherApp && ("new.vk.com".equals(orig.getHost()) || "vk.com".equals(orig.getHost()) || "m.vk.com".equals(orig.getHost()) || "vkontakte.ru".equals(orig.getHost()))) {
                unsupportedLink = true;
            }
            List<ResolveInfo> resolveInfo = getPackageManager().queryIntentActivities(new Intent("android.intent.action.VIEW", uri2), 0);
            if (resolveInfo != null && resolveInfo.size() <= 2) {
                boolean foundSelf = false;
                Intent intent2 = new Intent("android.intent.action.VIEW", uri2);
                for (ResolveInfo info : resolveInfo) {
                    if (!BuildConfig.APPLICATION_ID.equals(info.activityInfo.packageName)) {
                        intent2.setClassName(info.activityInfo.packageName, info.activityInfo.name);
                        addCustomTabsExtras(intent2);
                        startActivity(intent2);
                        return;
                    }
                    foundSelf = true;
                }
                if (resolveInfo.size() == 1 && foundSelf) {
                    if (!tryToOpenInBrowser(uri2)) {
                        showError();
                        return;
                    }
                    return;
                }
            }
            Intent intent3 = new Intent("android.intent.action.VIEW", uri2);
            if (unsupportedLink) {
                ResolveInfo info2 = getResolveInfoVkQwe();
                intent3.setComponent(new ComponentName(info2.activityInfo.packageName, info2.activityInfo.name));
            }
            addCustomTabsExtras(intent3);
            startActivity(intent3);
        }
    }

    public boolean tryToOpenInBrowser(Uri uri) {
        ResolveInfo info = getResolveInfoVkQwe();
        if (info != null) {
            Intent intent = new Intent("android.intent.action.VIEW", uri);
            intent.setComponent(new ComponentName(info.activityInfo.packageName, info.activityInfo.name));
            addCustomTabsExtras(intent);
            startActivity(intent);
            return true;
        }
        return false;
    }

    private void openPromoFeed(final String key) {
        new NewsfeedGetPromotionLists().setCallback(new SimpleCallback<ArrayList<NewsfeedGetPromotionLists.Item>>() { // from class: com.vkontakte.android.LinkRedirActivity.13
            @Override // com.vkontakte.android.api.Callback
            public void success(ArrayList<NewsfeedGetPromotionLists.Item> result) {
                int visible = 0;
                Bundle args = new Bundle();
                Iterator<NewsfeedGetPromotionLists.Item> it = result.iterator();
                while (it.hasNext()) {
                    NewsfeedGetPromotionLists.Item item = it.next();
                    if (TextUtils.equals(key, item.id)) {
                        args.putString("feed_id", key);
                        args.putInt("list_id", (-10) - visible);
                    }
                    if (!item.hidden) {
                        visible++;
                    }
                }
                LinkRedirActivity.this.setResult(-1);
                Navigate.to(NewsFragment.class, args, LinkRedirActivity.this);
                LinkRedirActivity.this.finish();
            }

            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                super.fail(error);
                LinkRedirActivity.this.setResult(0);
                Navigate.to(NewsFragment.class, new Bundle(), LinkRedirActivity.this);
                LinkRedirActivity.this.finish();
            }
        }).wrapProgress(this).exec((Context) this);
    }

    private ResolveInfo getResolveInfoVkQwe() {
        List<ResolveInfo> resolveInfo = getPackageManager().queryIntentActivities(new Intent("android.intent.action.VIEW", Uri.parse("http://vk.qwe")), 0);
        if (resolveInfo == null || resolveInfo.isEmpty()) {
            return null;
        }
        return resolveInfo.get(0);
    }

    public static Intent addCustomTabsExtras(Intent intent) {
        if (PreferenceManager.getDefaultSharedPreferences(VKApplication.context).getBoolean("useChromeCustomTabs", true)) {
            Random rand = new Random();
            char[] randomDomain = new char[rand.nextInt(10) + 10];
            for (int i = 0; i < randomDomain.length; i++) {
                randomDomain[i] = (char) (rand.nextInt(26) + 97);
            }
            ComponentName defBrowser = new Intent("android.intent.action.VIEW", Uri.parse("http://" + new String(randomDomain) + CameraUtilsEffects.FILE_DELIM)).resolveActivity(VKApplication.context.getPackageManager());
            String destination = intent.getDataString();
            if ((intent.getData().getAuthority().toLowerCase().endsWith(".vk.com") || intent.getData().getAuthority().equalsIgnoreCase("vk.com")) && intent.getData().getPath().startsWith("/away") && intent.getData().getQueryParameter("to") != null) {
                destination = intent.getData().getQueryParameter("to");
            }
            ComponentName target = new Intent("android.intent.action.VIEW", Uri.parse(destination)).resolveActivity(VKApplication.context.getPackageManager());
            if (target == null || target.equals(defBrowser)) {
                intent.putExtra("android.support.customtabs.extra.SESSION", (Parcelable) null);
                intent.putExtra("android.support.customtabs.extra.TOOLBAR_COLOR", VKApplication.context.getResources().getColor(R.color.brand_primary));
                intent.putExtra("android.support.customtabs.extra.TITLE_VISIBILITY", 1);
                Intent share = new Intent(VKApplication.context, LinkRedirActivity.class);
                share.setAction("android.intent.action.SEND");
                BitmapDrawable icon = (BitmapDrawable) VKApplication.context.getResources().getDrawable(R.drawable.abc_ic_menu_share_mtrl_alpha);
                Bundle btnBundle = new Bundle();
                btnBundle.putParcelable("android.support.customtabs.customaction.ICON", icon.getBitmap());
                btnBundle.putParcelable("android.support.customtabs.customaction.PENDING_INTENT", PendingIntent.getActivity(VKApplication.context, 0, share, 0));
                btnBundle.putString("android.support.customtabs.customaction.DESCRIPTION", VKApplication.context.getString(R.string.sys_share_link));
                intent.putExtra("android.support.customtabs.extra.ACTION_BUTTON_BUNDLE", btnBundle);
            }
        }
        return intent;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int safeParseInt(String s) {
        try {
            return Integer.parseInt(s);
        } catch (Exception e) {
            return 0;
        }
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        this.logoutReceiver.unregister();
        super.onDestroy();
    }

    @Override // android.app.Activity
    protected void onResume() {
        super.onResume();
        AppStateTracker.onActivityResumed(this);
    }

    @Override // android.app.Activity
    protected void onPause() {
        super.onPause();
        AppStateTracker.onActivityPaused();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void openChat(final int uid, final String ref, final String refSource) {
        final ProgressDialog progress = new ProgressDialog(this);
        progress.setMessage(getString(R.string.loading));
        progress.setCancelable(false);
        progress.show();
        if (uid < 2000000000) {
            ArrayList<Integer> al = new ArrayList<>();
            al.add(Integer.valueOf(uid));
            Friends.getUsers(al, new Friends.GetUsersCallback() { // from class: com.vkontakte.android.LinkRedirActivity.14
                @Override // com.vkontakte.android.data.Friends.GetUsersCallback
                public void onUsersLoaded(final ArrayList<UserProfile> users) {
                    LinkRedirActivity.this.runOnUiThread(new Runnable() { // from class: com.vkontakte.android.LinkRedirActivity.14.1
                        @Override // java.lang.Runnable
                        public void run() {
                            if (users.size() == 0) {
                                LinkRedirActivity.this.showErrorMessage(R.string.err_text);
                            } else {
                                UserProfile p = (UserProfile) users.get(0);
                                new ChatFragment.Builder(p.uid, p.fullName).setPhoto(p.photo).setRef(ref).setRefSource(refSource).go(LinkRedirActivity.this);
                            }
                            ViewUtils.dismissDialogSafety(progress);
                            LinkRedirActivity.this.setResult(-1);
                            LinkRedirActivity.this.finish();
                        }
                    });
                }
            });
            return;
        }
        Messages.getChatUsers(uid - 2000000000, new Messages.GetChatUsersCallback() { // from class: com.vkontakte.android.LinkRedirActivity.15
            @Override // com.vkontakte.android.data.Messages.GetChatUsersCallback
            public void onUsersLoaded(ArrayList<ChatUser> users, final String title, String photo) {
                LinkRedirActivity.this.runOnUiThread(new Runnable() { // from class: com.vkontakte.android.LinkRedirActivity.15.1
                    @Override // java.lang.Runnable
                    public void run() {
                        ViewUtils.dismissDialogSafety(progress);
                        new ChatFragment.Builder(uid, title).setRef(ref).setRefSource(refSource).go(LinkRedirActivity.this);
                        LinkRedirActivity.this.setResult(-1);
                        LinkRedirActivity.this.finish();
                    }
                });
            }
        });
    }

    @Override // android.app.Activity
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (this.mResulters != null) {
            for (ActivityResulter resulter : this.mResulters) {
                resulter.onActivityResult(requestCode, resultCode, data);
            }
        }
    }

    @Override // com.vkontakte.android.ui.ResulterProvider
    public void registerActivityResult(ActivityResulter result) {
        if (this.mResulters == null) {
            this.mResulters = new ArrayList();
        }
        this.mResulters.add(result);
    }

    @Override // com.vkontakte.android.ui.ResulterProvider
    public void unregisterActivityResult(ActivityResulter result) {
        if (this.mResulters != null) {
            this.mResulters.remove(result);
        }
    }

    public static int parseInt(@Nullable String param) {
        if (param == null) {
            return 0;
        }
        try {
            return Integer.parseInt(param);
        } catch (Exception e) {
            return 0;
        }
    }

    private void openAudioPage(int uid, int albumId, String accessKey) {
        if (albumId >= 0) {
            new PlaylistFragment.Builder(uid, albumId).accessKey(accessKey).go(this);
        } else {
            new MusicFragment.Builder().ownerId(uid).go(this);
        }
        setResult(-1);
        finish();
    }

    private void resolveScreenName(String scrName, final Uri uri, final int ownerId) {
        VKAPIRequest request = new VKAPIRequest("execute.resolveScreenName").param("screen_name", scrName).param("owner_id", ownerId).param("func_v", 3).setCallback(new Callback<JSONObject>() { // from class: com.vkontakte.android.LinkRedirActivity.16
            @Override // com.vkontakte.android.api.Callback
            public void success(JSONObject o) {
                try {
                    JSONObject r = o.optJSONObject(ServerKeys.RESPONSE);
                    if (r == null || !r.has(ServerKeys.TYPE)) {
                        LinkRedirActivity.this.openBrowser(uri);
                        LinkRedirActivity.this.finish();
                        return;
                    }
                    String type = r.getString(ServerKeys.TYPE);
                    if (ProfileGiftsFragment.Extra.User.equals(type)) {
                        new ProfileFragment.Builder(r.getInt("object_id")).go(LinkRedirActivity.this);
                        LinkRedirActivity.this.setResult(-1);
                        LinkRedirActivity.this.finish();
                    } else if ("group".equals(type)) {
                        new ProfileFragment.Builder(-r.getInt("object_id")).go(LinkRedirActivity.this);
                        LinkRedirActivity.this.setResult(-1);
                        LinkRedirActivity.this.finish();
                    } else if (!MimeTypes.BASE_TYPE_APPLICATION.equals(type)) {
                        LinkRedirActivity.this.openBrowser(uri);
                        LinkRedirActivity.this.finish();
                    } else {
                        if (r.has("object")) {
                            ApiApplication app = new ApiApplication(r.getJSONObject("object"));
                            if (app.isInCatalog && !app.isHtml5App) {
                                GameCardActivity.openApp(LinkRedirActivity.this, "direct", "activity", app);
                            } else if (r.has("embedded_uri") && r.getJSONObject("embedded_uri").has("screen_title")) {
                                JSONObject embUri = r.getJSONObject("embedded_uri");
                                String title = embUri.getString("screen_title");
                                String origUrl = embUri.getString("original_url");
                                String viewUrl = embUri.getString(ServerKeys.VIEW_URL);
                                int orientation = app.screenOrientation;
                                LinkRedirActivity.this.openApplication(app.id, ownerId, uri.toString(), app.isHtml5App, title, origUrl, viewUrl, orientation);
                            }
                        } else {
                            LinkRedirActivity.openLink(LinkRedirActivity.this, uri.toString(), null, null, 0, 0, false, 0);
                        }
                        LinkRedirActivity.this.finish();
                    }
                } catch (Exception x) {
                    Log.w("vk", x);
                }
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                LinkRedirActivity.this.openBrowser(uri);
                LinkRedirActivity.this.finish();
            }
        });
        if (!isFinishing()) {
            request.wrapProgress(this);
        }
        request.exec();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void openApplication(int appId, int ownerId, String sourceUri, boolean isHtml5App, String title, String origUrl, String viewUrl, int orientation) {
        String hashParams = getParams(sourceUri, "#");
        String queryParams = getParams(sourceUri, "?");
        if (queryParams != null) {
            viewUrl = viewUrl + (viewUrl.contains("?") ? "&" : "?") + queryParams;
            origUrl = origUrl + (origUrl.contains("?") ? "&" : "?") + queryParams;
        } else if (hashParams != null) {
            viewUrl = viewUrl + (viewUrl.contains("#") ? "&" : "#") + hashParams;
            origUrl = origUrl + (origUrl.contains("#") ? "&" : "#") + hashParams;
        }
        openLink(this, viewUrl, origUrl, title, ownerId, appId, isHtml5App, orientation);
    }

    private void openPlainText(String url) {
        Intent intent = new Intent(this, SendActivity.class);
        intent.putExtra("android.intent.extra.TEXT", url);
        intent.putExtra("_internal", true);
        intent.setType("text/plain");
        startActivity(intent);
        finish();
    }

    private void openView(Uri uri) {
        try {
            startActivity(addCustomTabsExtras(new Intent("android.intent.action.VIEW", makeAwayUri(uri))));
        } catch (Exception e) {
            Analytics.logException(e);
            L.e(e, new Object[0]);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showError() {
        showErrorMessage(R.string.error);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showErrorMessage(final int resId) {
        runOnUiThread(new Runnable() { // from class: com.vkontakte.android.LinkRedirActivity.17
            @Override // java.lang.Runnable
            public void run() {
                Toast.makeText(LinkRedirActivity.this.getApplicationContext(), resId, 0).show();
            }
        });
    }

    private String getParams(String sourceUri, String type) {
        int index = sourceUri.indexOf(type);
        if (index == -1) {
            return null;
        }
        return sourceUri.substring(index + 1);
    }

    private boolean isNoBrowser() {
        return getIntent().getBooleanExtra("no_browser", false);
    }

    public static boolean isVKScheme(Uri uri) {
        String scheme = uri.getScheme();
        return "vkontakte".equals(scheme) || "vk".equals(scheme);
    }

    private boolean isVKLink(Uri uri) {
        return "vklink".equals(uri.getScheme());
    }

    private boolean isVKContent(Uri uri) {
        return UriUtil.LOCAL_CONTENT_SCHEME.equals(uri.getScheme());
    }

    private boolean isNotVKAuthority(Uri uri) {
        String authority = uri.getAuthority();
        return !"new.vk.com".equals(authority) && !"vk.com".equals(authority) && !"m.vk.com".equals(authority) && !"vkontakte.ru".equals(authority);
    }

    private Uri makeAwayUri(Uri uri) {
        if (!Network.getInstance().proxy().isEnable()) {
            Uri.Builder builder = new Uri.Builder().scheme(UriUtil.HTTPS_SCHEME).authority("m.vk.com").path("/away").appendQueryParameter("to", uri.toString()).appendQueryParameter("utf", AppEventsConstants.EVENT_PARAM_VALUE_YES);
            return builder.build();
        }
        return uri;
    }
}
