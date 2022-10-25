package com.vkontakte.android.fragments;

import android.app.ProgressDialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.os.Parcelable;
import android.support.v4.app.FragmentActivity;
import android.support.v4.view.ViewCompat;
import android.support.v7.widget.PopupMenu;
import android.support.v7.widget.Toolbar;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.ConsoleMessage;
import android.webkit.JavascriptInterface;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.ImageView;
import android.widget.TextView;
import com.facebook.appevents.AppEventsConstants;
import com.facebook.common.util.UriUtil;
import com.facebook.internal.NativeProtocol;
import com.vk.core.util.AndroidBug5497Workaround;
import com.vk.core.util.ToastUtils;
import com.vk.sharing.Sharing;
import com.vk.sharing.SharingService;
import com.vk.sharing.action.Actions;
import com.vk.sharing.attachment.Attachments;
import com.vkontakte.android.FragmentWrapperActivity;
import com.vkontakte.android.LinkRedirActivity;
import com.vkontakte.android.Log;
import com.vkontakte.android.Photo;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.ValidationActivity;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.Order;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.apps.AppsGet;
import com.vkontakte.android.api.apps.AppsGetGameLeaderboard;
import com.vkontakte.android.api.apps.AppsSendRequest;
import com.vkontakte.android.api.orders.OrdersBuyItem;
import com.vkontakte.android.api.photos.PhotosGetById;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.attachments.LinkAttachment;
import com.vkontakte.android.attachments.PhotoAttachment;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.ApiApplication;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.LeaderboardFragment;
import com.vkontakte.android.fragments.news.NewPostFragment;
import com.vkontakte.android.fragments.userlist.SendRequestToGameFragment;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.stickers.Stickers;
import com.vkontakte.android.utils.L;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import me.grishka.appkit.utils.V;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class HtmlGameFragment extends me.grishka.appkit.fragments.LoaderFragment implements PopupMenu.OnMenuItemClickListener, BackListener, LeaderboardFragment.OnDismissedListener {
    private static final String AUTH_HOST = "https://oauth.vk.com";
    public static final int AUTH_RESULT = 13;
    private static final String AUTH_URI_FRM = "/authorize?client_id=%1$s&redirect_uri=blank.html&response_type=token&v=5.40&revoke=1&scope=%2$s&display=android&access_token=%3$s";
    private static final String BRIDGE_NAME = "AndroidBridge";
    private static final String CANCELLED_KEY = "cancel";
    private static final String FAIL_KEY = "fail";
    private static final int MAX_ATTEMPTS_COUNT = 10;
    public static final int SHARE_RESULT = 12;
    private static final String SHARE_TARGET_MESSAGE = "im";
    private static final String SHARE_TARGET_WALL = "wall";
    private static final String SUCCEEDED_KEY = "success";
    private ApiApplication apiApplication;
    private int appId;
    private AndroidBug5497Workaround bug5497Workaround;
    private int ownerId;
    private String screenTitle;
    private TextView textViewTitle;
    private String urlToCopy;
    private String urlToLoad;
    private WebView webView;
    private static String TAG = "HtmlGameFragment";
    private static final File CACHE_PATH = new File(Environment.getExternalStorageDirectory(), ".vkontakte/cache/html");
    private final WebViewClient webViewClient = new WebViewClient() { // from class: com.vkontakte.android.fragments.HtmlGameFragment.1
        @Override // android.webkit.WebViewClient
        public boolean shouldOverrideUrlLoading(WebView view, String url) {
            Uri uri = Uri.parse(url);
            if ("vk".equals(uri.getScheme())) {
                Intent intent = new Intent("android.intent.action.VIEW", Uri.parse(url));
                intent.setComponent(new ComponentName(HtmlGameFragment.this.getActivity(), LinkRedirActivity.class));
                HtmlGameFragment.this.startActivity(intent);
                return true;
            }
            return false;
        }

        @Override // android.webkit.WebViewClient
        public void onReceivedError(WebView view, int errorCode, String description, String failingUrl) {
            HtmlGameFragment.this.onError(new VKAPIRequest.VKErrorResponse(1073741824, description));
        }
    };
    private final WebChromeClient webChromeClient = new WebChromeClient() { // from class: com.vkontakte.android.fragments.HtmlGameFragment.2
        @Override // android.webkit.WebChromeClient
        public void onProgressChanged(WebView view, int newProgress) {
            if (newProgress == 100 && !HtmlGameFragment.this.loaded) {
                HtmlGameFragment.this.dataLoaded();
            }
        }

        @Override // android.webkit.WebChromeClient
        public boolean onConsoleMessage(ConsoleMessage consoleMessage) {
            L.e("WebChromeClient", consoleMessage.message(), Integer.valueOf(consoleMessage.lineNumber()), consoleMessage.sourceId());
            return super.onConsoleMessage(consoleMessage);
        }

        @Override // android.webkit.WebChromeClient
        public void onReceivedTitle(WebView view, String title) {
            if (HtmlGameFragment.this.screenTitle == null) {
                HtmlGameFragment.this.setTitle(title);
            }
        }
    };

    /* loaded from: classes2.dex */
    public static class Builder extends Navigator {
        private static final String KEY_APP_ID = "app_id";
        private static final String KEY_OWNER_ID = "owner_id";
        private static final String KEY_SCREEN_ORIENTATION = "screen_orientation";
        private static final String KEY_SCREEN_TITLE = "screen_title";
        private static final String KEY_URL = "key_url";
        private static final String KEY_URL_TO_COPY = "url_to_copy";

        public Builder(String url, int ownerId, int appId) {
            super(HtmlGameFragment.class);
            this.args.putString(KEY_URL, url);
            this.args.putInt("owner_id", ownerId);
            this.args.putInt("app_id", appId);
            this.args.putBoolean("fullscreen", true);
            this.args.putBoolean(FragmentWrapperActivity.DISABLE_DRAWER_LAYOUT_KEY, true);
        }

        public Builder setUrlToCopy(String urlToCopy) {
            this.args.putString(KEY_URL_TO_COPY, urlToCopy);
            return this;
        }

        public Builder setScreenTitle(String screenTitle) {
            this.args.putString(KEY_SCREEN_TITLE, screenTitle);
            return this;
        }

        public Builder setOrienation(int orientation) {
            this.args.putInt(FragmentWrapperActivity.ORIENTATION_KEY, getAndroidOrientation(orientation));
            return this;
        }

        private static int getAndroidOrientation(int orientation) {
            switch (orientation) {
                case 1:
                    return 0;
                case 2:
                    return 1;
                default:
                    return -1;
            }
        }
    }

    /* loaded from: classes.dex */
    class AndroidBridge {
        AndroidBridge() {
        }

        @JavascriptInterface
        public void callMethod(final String methodName, final String queryParams) {
            HtmlGameFragment.this.webView.post(new Runnable() { // from class: com.vkontakte.android.fragments.HtmlGameFragment.AndroidBridge.1
                @Override // java.lang.Runnable
                public void run() {
                    Log.i(HtmlGameFragment.TAG, "methodName = " + methodName + ", query = " + queryParams);
                    HashMap<String, String> paramsMap = AndroidBridge.this.getUriQueryParamsAsDict(queryParams);
                    String str = methodName;
                    char c = 65535;
                    switch (str.hashCode()) {
                        case -1595758711:
                            if (str.equals("showShareBox")) {
                                c = 0;
                                break;
                            }
                            break;
                        case -1469302421:
                            if (str.equals("showLeaderboardBox")) {
                                c = 5;
                                break;
                            }
                            break;
                        case 94756344:
                            if (str.equals("close")) {
                                c = 6;
                                break;
                            }
                            break;
                        case 382305722:
                            if (str.equals("showOrderBox")) {
                                c = 4;
                                break;
                            }
                            break;
                        case 1631171481:
                            if (str.equals("showRequestBox")) {
                                c = 2;
                                break;
                            }
                            break;
                        case 1752620933:
                            if (str.equals("showInviteBox")) {
                                c = 1;
                                break;
                            }
                            break;
                        case 2050797419:
                            if (str.equals("showSettingsBox")) {
                                c = 3;
                                break;
                            }
                            break;
                    }
                    switch (c) {
                        case 0:
                            String target = paramsMap.get(SharingService.EXTRA_TARGET);
                            String message = paramsMap.get("message");
                            String attachments = paramsMap.get("attachments");
                            if (target == null || target.isEmpty()) {
                                target = "wall";
                            }
                            if (message == null) {
                                message = "";
                            }
                            if (attachments == null) {
                                attachments = "";
                            }
                            HtmlGameFragment.this.prepareAndShowShare(target, message, attachments);
                            return;
                        case 1:
                            HtmlGameFragment.this.doShowInviteBox();
                            return;
                        case 2:
                            String msg = paramsMap.get("message");
                            int uid = Integer.parseInt(paramsMap.get(ArgKeys.UID));
                            String requestKey = paramsMap.get("requestKey");
                            HtmlGameFragment.this.doShowRequestBox(msg, uid, requestKey);
                            return;
                        case 3:
                            String mask = paramsMap.get("mask");
                            if (HtmlGameFragment.this.tryParseLong(mask)) {
                                HtmlGameFragment.this.doShowSettingsBox(mask);
                                return;
                            } else {
                                ToastUtils.showToast("Unexpected format of mask. Mask should be integer: " + mask);
                                return;
                            }
                        case 4:
                            String type = paramsMap.get(ServerKeys.TYPE);
                            String votesStr = paramsMap.get("votes");
                            int votes = 0;
                            if (votesStr != null && !votesStr.isEmpty()) {
                                votes = Integer.parseInt(votesStr);
                            }
                            String offerIdStr = paramsMap.get("offer_id");
                            int offerId = 0;
                            if (offerIdStr != null && !offerIdStr.isEmpty()) {
                                offerId = Integer.parseInt(offerIdStr);
                            }
                            String currencyStr = paramsMap.get("currency");
                            boolean currencyBool = false;
                            if (currencyStr != null && currencyStr.equals(AppEventsConstants.EVENT_PARAM_VALUE_YES)) {
                                currencyBool = true;
                            }
                            String item = paramsMap.get(Stickers.EXTRA_ITEM);
                            HtmlGameFragment.this.processShowOrderBox(type, votes, offerId, currencyBool, item);
                            return;
                        case 5:
                            String pointsOrLevelStr = paramsMap.get("user_result");
                            int currentPointsOrLevel = 0;
                            if (pointsOrLevelStr != null && !pointsOrLevelStr.isEmpty()) {
                                currentPointsOrLevel = Integer.parseInt(pointsOrLevelStr);
                            } else {
                                ToastUtils.showToast("Please, pass 'user_result' to showLeaderboardBox");
                            }
                            HtmlGameFragment.this.doShowLeaderboard(HtmlGameFragment.this.appId, currentPointsOrLevel);
                            return;
                        case 6:
                            HtmlGameFragment.this.doClose();
                            return;
                        default:
                            ToastUtils.showToast("Unknown method passed to callMethod: " + methodName);
                            return;
                    }
                }
            });
        }

        @JavascriptInterface
        public void apiCall(final String methodName, final String arguments, final String callbackId) {
            HtmlGameFragment.this.webView.post(new Runnable() { // from class: com.vkontakte.android.fragments.HtmlGameFragment.AndroidBridge.2
                @Override // java.lang.Runnable
                public void run() {
                    Log.i(HtmlGameFragment.TAG, "Method name = " + methodName + ", arguments = " + arguments + ", callbackId = " + callbackId);
                    if (!HtmlGameFragment.this.tryParseLong(callbackId)) {
                        ToastUtils.showToast("Unexpected format of callbackId. Callback Id should be integer: " + callbackId);
                        return;
                    }
                    VKAPIRequest request = new VKAPIRequest(methodName);
                    request.handleAuthErrorsManually = true;
                    request.unreliable3rdPartyRequest = true;
                    AndroidBridge.this.getUriQueryParamsAsDict(arguments);
                    for (Map.Entry<String, String> entry : AndroidBridge.this.getUriQueryParamsAsDict(arguments).entrySet()) {
                        request.param(entry.getKey(), entry.getValue());
                    }
                    request.setCallback(new Callback() { // from class: com.vkontakte.android.fragments.HtmlGameFragment.AndroidBridge.2.1
                        @Override // com.vkontakte.android.api.Callback
                        public void success(Object result) {
                            String resultStr = result.toString();
                            HtmlGameFragment.this.dispatchApiResponse(callbackId, resultStr);
                        }

                        @Override // com.vkontakte.android.api.Callback
                        public void fail(VKAPIRequest.VKErrorResponse error) {
                            try {
                                JSONObject errorJson = new JSONObject();
                                errorJson.put(NativeProtocol.BRIDGE_ARG_ERROR_CODE, error.getCode());
                                errorJson.put("error_msg", error.message);
                                JSONObject responseJson = new JSONObject();
                                responseJson.put("error", errorJson);
                                String errorStr = responseJson.toString();
                                HtmlGameFragment.this.dispatchApiResponse(callbackId, errorStr);
                            } catch (JSONException exc) {
                                Log.e("HtmlGameFragment", exc.getMessage(), exc);
                            }
                        }
                    }).exec(HtmlGameFragment.this.getContext());
                }
            });
        }

        /* JADX INFO: Access modifiers changed from: private */
        public HashMap<String, String> getUriQueryParamsAsDict(String arguments) {
            HashMap<String, String> result = new HashMap<>();
            Uri uri = Uri.parse("vk://method/?" + arguments);
            for (String paramName : uri.getQueryParameterNames()) {
                String paramValue = uri.getQueryParameter(paramName);
                result.put(paramName, paramValue);
            }
            return result;
        }
    }

    @Override // android.support.v4.widget.SwipeRefreshLayout.OnRefreshListener
    public void onRefresh() {
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.urlToLoad = getArguments().getString("key_url");
        this.ownerId = getArguments().getInt("owner_id");
        this.appId = getArguments().getInt("app_id");
        this.urlToCopy = getArguments().getString("url_to_copy");
        this.screenTitle = getArguments().getString("screen_title");
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment
    protected void doLoadData() {
        this.webView.loadUrl(this.urlToLoad);
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        this.webView.setWebChromeClient(null);
        this.webView.setWebViewClient(null);
        this.webView.destroy();
        this.webView = null;
    }

    @Override // android.app.Fragment
    public void onResume() {
        super.onResume();
        this.webView.onResume();
    }

    @Override // android.app.Fragment
    public void onPause() {
        super.onPause();
        this.webView.onPause();
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment
    public View onCreateContentView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        this.webView = new WebView(getActivity());
        this.webView.setId(R.id.webview);
        WebSettings settings = this.webView.getSettings();
        settings.setAllowFileAccess(true);
        settings.setAppCacheEnabled(true);
        settings.setAppCachePath(CACHE_PATH.getAbsolutePath());
        settings.setDomStorageEnabled(true);
        settings.setCacheMode(-1);
        settings.setLoadWithOverviewMode(true);
        settings.setUseWideViewPort(true);
        settings.setSupportZoom(false);
        if (Build.VERSION.SDK_INT >= 21) {
            settings.setMixedContentMode(2);
        }
        settings.setJavaScriptEnabled(true);
        this.webView.setWebViewClient(this.webViewClient);
        this.webView.setWebChromeClient(this.webChromeClient);
        this.webView.addJavascriptInterface(new AndroidBridge(), BRIDGE_NAME);
        return this.webView;
    }

    @Override // me.grishka.appkit.fragments.ContainerFragment, android.app.DialogFragment, android.app.Fragment
    public void onActivityCreated(Bundle state) {
        super.onActivityCreated(state);
        this.bug5497Workaround = AndroidBug5497Workaround.assist(getActivity());
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        if (this.bug5497Workaround != null) {
            this.bug5497Workaround.destroy();
        }
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        if (!this.loaded) {
            loadData();
        }
        if (this.apiApplication == null) {
            new AppsGet(this.appId).setCallback(new SimpleCallback<ApiApplication>() { // from class: com.vkontakte.android.fragments.HtmlGameFragment.3
                @Override // com.vkontakte.android.api.Callback
                public void success(ApiApplication result) {
                    HtmlGameFragment.this.apiApplication = result;
                }

                @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                }
            }).exec((Context) getActivity());
        }
        setupTheme();
        if (this.screenTitle != null) {
            setTitle(this.screenTitle);
        }
    }

    private void setupTheme() {
        Toolbar toolbar = getToolbar();
        ViewGroup.LayoutParams lp = toolbar.getLayoutParams();
        lp.height = V.dp(32.0f);
        toolbar.setBackgroundColor(ViewCompat.MEASURED_STATE_MASK);
        ViewGroup toolbarContentViewGroup = (ViewGroup) getActivity().getLayoutInflater().inflate(R.layout.htmlgame_toolbar_content, (ViewGroup) null);
        toolbarContentViewGroup.setLayoutParams(new Toolbar.LayoutParams(-1, -1));
        ImageView buttonClose = (ImageView) toolbarContentViewGroup.findViewById(R.id.button_close);
        buttonClose.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.fragments.HtmlGameFragment.4
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                HtmlGameFragment.this.getActivity().finish();
            }
        });
        ImageView buttonMore = (ImageView) toolbarContentViewGroup.findViewById(R.id.button_more);
        buttonMore.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.fragments.HtmlGameFragment.5
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                PopupMenu menu = new PopupMenu(HtmlGameFragment.this.getContext(), view);
                menu.getMenu().add(0, R.id.copy_link, 0, R.string.copy_link);
                menu.setOnMenuItemClickListener(HtmlGameFragment.this);
                menu.show();
            }
        });
        toolbar.setContentInsetsRelative(0, 0);
        toolbar.addView(toolbarContentViewGroup);
        this.textViewTitle = (TextView) toolbarContentViewGroup.findViewById(R.id.tv_title);
    }

    @Override // android.support.v7.widget.PopupMenu.OnMenuItemClickListener
    public boolean onMenuItemClick(MenuItem item) {
        switch (item.getItemId()) {
            case R.id.copy_link /* 2131755023 */:
                String url = this.urlToCopy != null ? this.urlToCopy : this.urlToLoad;
                ClipboardManager clipboard = (ClipboardManager) getActivity().getSystemService("clipboard");
                ClipData clip = ClipData.newPlainText(url, url);
                clipboard.setPrimaryClip(clip);
                return true;
            default:
                return false;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // me.grishka.appkit.fragments.AppKitFragment
    public void setTitle(CharSequence title) {
        if (this.textViewTitle != null) {
            this.textViewTitle.setText(title);
        }
    }

    @Override // android.app.Fragment
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == 3903 && resultCode == -1 && data != null) {
            ArrayList<Integer> uids = new ArrayList<>();
            Iterator it = data.getParcelableArrayListExtra("result").iterator();
            while (it.hasNext()) {
                Parcelable item = (Parcelable) it.next();
                if (item instanceof UserProfile) {
                    uids.add(Integer.valueOf(((UserProfile) item).uid));
                }
            }
            AppsSendRequest.createAppInviteRequest(this.appId, uids).setCallback(new Callback<Boolean>() { // from class: com.vkontakte.android.fragments.HtmlGameFragment.6
                @Override // com.vkontakte.android.api.Callback
                public void success(Boolean result) {
                    HtmlGameFragment.this.dispatchShowInviteBoxResponseToGame("success");
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    HtmlGameFragment.this.dispatchShowInviteBoxResponseToGame(HtmlGameFragment.FAIL_KEY);
                }
            }).wrapProgress(getActivity()).exec((Context) getActivity());
        } else if (requestCode == 3903 && resultCode != -1) {
            dispatchShowInviteBoxResponseToGame(CANCELLED_KEY);
        } else if (requestCode == 1) {
            dispatchShowRequestBoxResponseToGame(resultCode == -1 ? SUCCEEDED_KEY : CANCELLED_KEY);
        } else if (requestCode == 12) {
            dispatchShowShareBoxResponseToGame(resultCode == -1 ? SUCCEEDED_KEY : CANCELLED_KEY);
        } else if (requestCode == 13) {
            if (resultCode == -1) {
                dispatchShowSettingsBoxResponseToGame("success", data.getStringExtra("access_token"));
            } else {
                dispatchShowSettingsBoxResponseToGame(CANCELLED_KEY, "");
            }
        }
    }

    @Override // com.vkontakte.android.fragments.LeaderboardFragment.OnDismissedListener
    public void onLeaderboardDismissed() {
        dispatchShowLeaderboardResponseToGame("success");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dispatchShowLeaderboardResponseToGame(String result) {
        runJavascriptIn(this.webView, "VK.proxy.response('showLeaderboardBox',\"" + result + "\")");
    }

    private void dispatchShowRequestBoxResponseToGame(String result) {
        runJavascriptIn(this.webView, "VK.proxy.response('showRequestBox',\"" + result + "\")");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dispatchShowInviteBoxResponseToGame(String result) {
        runJavascriptIn(this.webView, "VK.proxy.response('showInviteBox',\"" + result + "\")");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dispatchShowShareBoxResponseToGame(String result) {
        runJavascriptIn(this.webView, "VK.proxy.response('showShareBox',\"" + result + "\")");
    }

    private void dispatchShowSettingsBoxResponseToGame(String result, String accessToken) {
        if (accessToken == null || accessToken.isEmpty()) {
            runJavascriptIn(this.webView, "VK.proxy.response('showSettingsBox',\"" + result + "\")");
        } else {
            runJavascriptIn(this.webView, "VK.proxy.response('showSettingsBox',\"" + result + "\", '" + accessToken + "')");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dispatchShowOrderBoxResponseToGame(String result) {
        runJavascriptIn(this.webView, "VK.proxy.response('showOrderBox',\"" + result + "\")");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dispatchApiResponse(String callbackId, String result) {
        runJavascriptIn(this.webView, "VK.proxy.apiResponse(" + callbackId + ", " + result + ")");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void doClose() {
        getActivity().finish();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void doShowRequestBox(String message, int uid, String requestKey) {
        UserProfile up = Friends.get(uid);
        if (this.apiApplication != null && up != null) {
            HtmlGameRequestFragment.showForResult(this.apiApplication, up, message, requestKey, this);
        } else {
            HtmlGameRequestFragment.showForResult(this.appId, uid, message, requestKey, this);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void doShowLeaderboard(final int applicationId, final int currentPointsOrLevel) {
        new AppsGetGameLeaderboard(applicationId).setCallback(new SimpleCallback<AppsGetGameLeaderboard.LeaderboardData>(getActivity()) { // from class: com.vkontakte.android.fragments.HtmlGameFragment.7
            @Override // com.vkontakte.android.api.Callback
            public void success(AppsGetGameLeaderboard.LeaderboardData result) {
                if (result.leaderboard.size() <= 0 || HtmlGameFragment.this.getActivity() == null) {
                    Log.w(HtmlGameFragment.TAG, "No data for leaderboard appId = " + applicationId);
                    HtmlGameFragment.this.dispatchShowLeaderboardResponseToGame(HtmlGameFragment.FAIL_KEY);
                    return;
                }
                result.userLevelOrPointsCurrent = currentPointsOrLevel;
                Bundle b = new Bundle();
                b.putParcelable(LeaderboardFragment.ARG_LEADERBOARD_DATA, result);
                LeaderboardFragment leaderboardFragment = new LeaderboardFragment();
                leaderboardFragment.setArguments(b);
                leaderboardFragment.dismissedListener = HtmlGameFragment.this;
                leaderboardFragment.show(((FragmentActivity) HtmlGameFragment.this.getActivity()).getSupportFragmentManager(), "");
            }

            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                super.fail(error);
                HtmlGameFragment.this.dispatchShowLeaderboardResponseToGame(HtmlGameFragment.FAIL_KEY);
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void doShowSettingsBox(String mask) {
        String accessToken = VKAccountManager.getCurrent().getAccessToken();
        String authUriPart = String.format(AUTH_URI_FRM, Integer.valueOf(this.appId), mask, accessToken);
        String authUri = AUTH_HOST + (authUriPart + "&sig=" + getSig(authUriPart));
        startActivityForResult(new Intent(getActivity(), ValidationActivity.class).putExtra("url", authUri).putExtra(ValidationActivity.KEY_RETURN_RESULT, true).putExtra(ValidationActivity.KEY_REQUIRE_JUST_ACCESS_TOKEN, true), 13);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void processShowOrderBox(String type, int votes, int offerId, boolean currencyBool, String item) {
        char c = 65535;
        switch (type.hashCode()) {
            case 3242771:
                if (type.equals(Stickers.EXTRA_ITEM)) {
                    c = 0;
                    break;
                }
                break;
        }
        switch (c) {
            case 0:
                final ProgressDialog progress = new ProgressDialog(getActivity());
                progress.setCancelable(false);
                progress.setCanceledOnTouchOutside(false);
                progress.setMessage(getString(R.string.loading));
                ViewUtils.showDialogSafety(progress);
                invokeOrderBuyItem(type, item, 0, 0, new Callback<Order>() { // from class: com.vkontakte.android.fragments.HtmlGameFragment.8
                    @Override // com.vkontakte.android.api.Callback
                    public void success(Order result) {
                        ViewUtils.dismissDialogSafety(progress);
                        boolean succeeded = result.status != null && result.status.equals(Order.STATUS_CHARGED);
                        String resultStr = succeeded ? "success" : HtmlGameFragment.FAIL_KEY;
                        HtmlGameFragment.this.dispatchShowOrderBoxResponseToGame(resultStr);
                    }

                    @Override // com.vkontakte.android.api.Callback
                    public void fail(VKAPIRequest.VKErrorResponse error) {
                        Log.e(HtmlGameFragment.TAG, "processShowOrderBox failed: " + error.toString());
                        ViewUtils.dismissDialogSafety(progress);
                        HtmlGameFragment.this.dispatchShowOrderBoxResponseToGame(HtmlGameFragment.FAIL_KEY);
                    }
                });
                return;
            default:
                Log.w(TAG, "Unknown order type " + type);
                dispatchShowOrderBoxResponseToGame(FAIL_KEY);
                return;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void invokeOrderBuyItem(final String type, final String item, int orderId, final int attemtpsCount, final Callback<Order> callback) {
        new OrdersBuyItem(this.appId, type, item, orderId).setCallback(new Callback<Order>() { // from class: com.vkontakte.android.fragments.HtmlGameFragment.9
            @Override // com.vkontakte.android.api.Callback
            public void success(final Order order) {
                if (order.status.equals(Order.STATUS_WAIT)) {
                    if (attemtpsCount > 10) {
                        callback.fail(new VKAPIRequest.VKErrorResponse(1, HtmlGameFragment.this.getResources().getString(R.string.error)));
                        return;
                    } else {
                        ViewUtils.postDelayed(new Runnable() { // from class: com.vkontakte.android.fragments.HtmlGameFragment.9.1
                            @Override // java.lang.Runnable
                            public void run() {
                                HtmlGameFragment.this.invokeOrderBuyItem(type, item, order.orderId, attemtpsCount + 1, callback);
                            }
                        }, 1000L);
                        return;
                    }
                }
                callback.success(order);
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                callback.fail(error);
            }
        }).exec((Context) getActivity());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void prepareAndShowShare(final String target, final String message, String attachments) {
        String[] attSplit = attachments.split(",");
        ArrayList<String> photoAtts = new ArrayList<>();
        String link = "";
        for (int i = 0; i < attSplit.length; i++) {
            attSplit[i] = attSplit[i].trim();
            if (attSplit[i].startsWith("photo")) {
                photoAtts.add(attSplit[i].substring(5));
            }
            if (attSplit[i].startsWith(UriUtil.HTTP_SCHEME)) {
                link = attSplit[i];
            }
        }
        final String foundLink = link;
        if (photoAtts.size() == 0) {
            char c = 65535;
            switch (target.hashCode()) {
                case 3364:
                    if (target.equals(SHARE_TARGET_MESSAGE)) {
                        c = 1;
                        break;
                    }
                    break;
                case 3641802:
                    if (target.equals("wall")) {
                        c = 0;
                        break;
                    }
                    break;
            }
            switch (c) {
                case 0:
                    doShowShareWall(message, null, link);
                    return;
                case 1:
                    doShowShareDialogs(message, null);
                    return;
                default:
                    Log.w("vk", "Unknown share target " + target);
                    dispatchShowShareBoxResponseToGame(FAIL_KEY);
                    return;
            }
        }
        new PhotosGetById(photoAtts).setCallback(new SimpleCallback<ArrayList<Photo>>() { // from class: com.vkontakte.android.fragments.HtmlGameFragment.10
            @Override // com.vkontakte.android.api.Callback
            public void success(ArrayList<Photo> result) {
                if (HtmlGameFragment.this.getActivity() != null) {
                    String str = target;
                    char c2 = 65535;
                    switch (str.hashCode()) {
                        case 3364:
                            if (str.equals(HtmlGameFragment.SHARE_TARGET_MESSAGE)) {
                                c2 = 1;
                                break;
                            }
                            break;
                        case 3641802:
                            if (str.equals("wall")) {
                                c2 = 0;
                                break;
                            }
                            break;
                    }
                    switch (c2) {
                        case 0:
                            HtmlGameFragment.this.doShowShareWall(message, result, foundLink);
                            return;
                        case 1:
                            HtmlGameFragment.this.doShowShareDialogs(message, result.get(0));
                            return;
                        default:
                            Log.w("vk", "Unknown share target " + target);
                            HtmlGameFragment.this.dispatchShowShareBoxResponseToGame(HtmlGameFragment.FAIL_KEY);
                            return;
                    }
                }
            }

            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                super.fail(error);
                HtmlGameFragment.this.dispatchShowShareBoxResponseToGame(HtmlGameFragment.FAIL_KEY);
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void doShowInviteBox() {
        new SendRequestToGameFragment.Builder(this.appId).setDisableSpinner().setMultiSelect().setGlobalSearch(false).setTitle(getString(R.string.games_invite_friends)).forResult(this, GameCardFragment.INVITE_RESULT);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void doShowShareDialogs(String message, Photo photo) {
        Sharing.Builder b = Sharing.from(getActivity());
        if (photo != null) {
            b.withAttachment(Attachments.createInfo(photo, "photos"));
        }
        b.withActions(Actions.createInfoDialogsShareOnly(message)).fullScreen(true).shareForResult(this, 12);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void doShowShareWall(String message, ArrayList<Photo> photos, String link) {
        ArrayList<Attachment> attachments = new ArrayList<>();
        if (photos != null) {
            Iterator<Photo> it = photos.iterator();
            while (it.hasNext()) {
                Photo photo = it.next();
                attachments.add(new PhotoAttachment(photo));
            }
        }
        if (link != null && !link.isEmpty()) {
            attachments.add(new LinkAttachment(link, "", ""));
        }
        NewPostFragment.Builder builder = new NewPostFragment.Builder();
        if (message != null) {
            builder.attachText(message);
        }
        if (attachments.size() > 0) {
            Attachment[] attArray = new Attachment[attachments.size()];
            attachments.toArray(attArray);
            builder.attachAttachments(attArray);
        }
        builder.forbidAttachmentsEdit(true);
        builder.send(true);
        builder.forResult(this, 12);
    }

    private static void runJavascriptIn(WebView wv, String javaScriptCode) {
        if (wv != null) {
            Log.i(TAG, "Executing js code in the webview: " + javaScriptCode);
            wv.loadUrl("javascript:" + javaScriptCode);
        }
    }

    @Override // com.vkontakte.android.fragments.BackListener
    public boolean onBackPressed() {
        if (this.webView == null || !this.webView.canGoBack()) {
            return false;
        }
        this.webView.goBack();
        return true;
    }

    private String getSig(String str) {
        String secret = VKAccountManager.getCurrent().getSecret();
        if (secret == null) {
            return "";
        }
        return VKAPIRequest.md5(str + secret);
    }

    boolean tryParseLong(String value) {
        try {
            Long.parseLong(value);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }
}
