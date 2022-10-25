package com.vkontakte.android.fragments;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.Rect;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.JavascriptInterface;
import android.webkit.JsResult;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.ShareActionProvider;
import com.google.android.exoplayer2.text.ttml.TtmlNode;
import com.vk.sharing.Sharing;
import com.vkontakte.android.Log;
import com.vkontakte.android.Photo;
import com.vkontakte.android.PhotoViewer;
import com.vkontakte.android.R;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.pages.NotesGetById;
import com.vkontakte.android.api.pages.PagesGetHTML;
import com.vkontakte.android.audio.AudioFacade;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.contentprovider.AudioContentProviderConstants;
import com.vkontakte.android.audio.player.PlayerRefer;
import com.vkontakte.android.data.Analytics;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.navigation.Navigator;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import me.grishka.appkit.api.APIRequest;
import me.grishka.appkit.utils.V;
import me.zhanghai.android.materialprogressbar.MaterialProgressBar;
/* loaded from: classes2.dex */
public class WikiViewFragment extends me.grishka.appkit.fragments.LoaderFragment implements BackListener {
    private Bundle curMeta;
    private boolean injectedScript = false;
    private ShareActionProvider shareActionProvider;
    private MaterialProgressBar toolbarProgress;
    private WebView webView;

    /* loaded from: classes2.dex */
    public static class Builder extends Navigator {
        public Builder() {
            super(WikiViewFragment.class);
        }

        public Builder setTitle(String title) {
            this.args.putString("title", title);
            return this;
        }

        public Builder setOid(int oid) {
            this.args.putInt(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_OID, oid);
            return this;
        }

        public Builder setPid(int pid) {
            this.args.putInt("pid", pid);
            return this;
        }

        public Builder setNid(int nid) {
            this.args.putInt("nid", nid);
            return this;
        }

        public Builder setSite(boolean site) {
            this.args.putBoolean("site", site);
            return this;
        }

        public Builder setSection(String section) {
            this.args.putString(ServerKeys.SECTION, section);
            return this;
        }

        public Builder setRefer(String refer) {
            this.args.putString("refer", refer);
            return this;
        }
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity activity) {
        setLayout(R.layout.loader_fragment_progress);
        super.onAttach(activity);
        setHasOptionsMenu(true);
        loadData();
        if (getArguments() != null) {
            String refer = getArguments().getString("refer");
            if (!TextUtils.isEmpty(refer)) {
                if (getArguments().getBoolean("site", false)) {
                    Analytics.track("open_layer").addParam("ref", refer).commit();
                } else {
                    Analytics.track("open_wiki").addParam("ref", refer).commit();
                }
            }
        }
    }

    @Override // android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        if (getArguments().getBoolean("site")) {
            MenuItem item = menu.add(0, R.id.share, 0, R.string.sys_share_link);
            item.setShowAsAction(2);
            item.setIcon(R.drawable.abc_ic_menu_share_mtrl_alpha);
        }
    }

    @Override // android.app.Fragment
    public boolean onOptionsItemSelected(MenuItem item) {
        String url;
        if (item.getItemId() == R.id.share && (url = this.curMeta.getString("url")) != null) {
            Sharing.share(getContext(), url);
            return true;
        }
        return true;
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment
    public void onToolbarNavigationClick() {
        getActivity().finish();
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        getToolbar().setNavigationIcon(R.drawable.ic_ab_back);
        this.toolbarProgress = (MaterialProgressBar) view.findViewById(R.id.horizontal_progress_toolbar);
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment
    public View onCreateContentView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        this.webView = new WebView(getActivity());
        this.webView.getSettings().setJavaScriptEnabled(true);
        this.webView.setWebViewClient(new WebClient());
        this.webView.setWebChromeClient(new WebChrome());
        this.webView.addJavascriptInterface(new WebCallback(), "vknative");
        return this.webView;
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment
    protected void doLoadData() {
        if (getArguments().containsKey("nid")) {
            loadNote(getArguments().getInt(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_OID, 0), getArguments().getInt("nid", 0));
        } else {
            loadPage();
        }
    }

    @Override // android.support.v4.widget.SwipeRefreshLayout.OnRefreshListener
    public void onRefresh() {
        loadData();
    }

    private void loadPage() {
        if (getArguments().getInt(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_OID, 0) == 0) {
            loadPage(getArguments().getString("title"), true);
        } else if (getArguments().getInt("pid", 0) == 0) {
            loadPage(getArguments().getInt(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_OID, 0), getArguments().getString("title"), true);
        } else {
            loadPage(getArguments().getInt(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_OID, 0), getArguments().getInt("pid", 0), true);
        }
    }

    private void loadPage(String title, boolean useHistory) {
        doLoadPage(new PagesGetHTML(title), useHistory);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void loadPage(int oid, String title, boolean useHistory) {
        doLoadPage(new PagesGetHTML(oid, title), useHistory);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void loadPage(int oid, int id, boolean useHistory) {
        doLoadPage(new PagesGetHTML(oid, id, getArguments().getBoolean("site", false)), useHistory);
    }

    private void doLoadPage(PagesGetHTML req, boolean useHistory) {
        req.setCallback(new SimpleCallback<PagesGetHTML.Result>(this) { // from class: com.vkontakte.android.fragments.WikiViewFragment.1
            @Override // com.vkontakte.android.api.Callback
            public void success(PagesGetHTML.Result res) {
                WikiViewFragment.this.curMeta = res.meta;
                WikiViewFragment.this.displayPage(res.url);
                WikiViewFragment.this.setTitle(res.title);
            }
        }).exec((Context) getActivity());
    }

    private void loadNote(int oid, int nid) {
        this.currentRequest = new NotesGetById(oid, nid).setCallback(new SimpleCallback<NotesGetById.Result>() { // from class: com.vkontakte.android.fragments.WikiViewFragment.2
            @Override // com.vkontakte.android.api.Callback
            public void success(NotesGetById.Result res) {
                WikiViewFragment.this.displayPage(res.url);
                WikiViewFragment.this.setTitle(res.title);
            }
        }).exec((Context) getActivity());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void injectScript() {
        Log.i("vk", "Injecting script!");
        this.webView.loadUrl("javascript:{var phts=document.getElementsByClassName('al_photo');var phUrls=[];for(var i=0;i<phts.length;i++){phUrls.push(phts[i].getElementsByTagName('img')[0].attributes['data-src_big'].value);phts[i].setAttribute('data-index', i);phts[i].onclick=function(){window.vknative.openPhotos(phUrls, parseInt(this.attributes['data-index'].value));return false;}}var auds={oids:[], aids:[], durations:[], artists:[], titles:[], urls:[]};var adivs=document.getElementsByClassName('audio_item');for(var i=0;i<adivs.length;i++){auds.oids.push(parseInt(adivs[i].attributes['data-id'].value.split('_')[0]));auds.aids.push(parseInt(adivs[i].attributes['data-id'].value.split('_')[1]));auds.durations.push(parseInt(adivs[i].getElementsByClassName('ai_dur')[0].attributes['data-dur'].value));auds.artists.push(adivs[i].getElementsByClassName('ai_artist')[0].innerText);auds.titles.push(adivs[i].getElementsByClassName('ai_title')[0].innerText);auds.urls.push(adivs[i].getElementsByTagName('input')[0].value);adivs[i].setAttribute('data-index', i);adivs[i].onclick=function(){window.vknative.playAudio(auds.oids, auds.aids, auds.artists, auds.titles, auds.urls, auds.durations, parseInt(this.attributes['data-index'].value));return false;}}void(0);};");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void displayPage(String html) {
        this.injectedScript = false;
        this.webView.loadUrl(html);
    }

    /* loaded from: classes2.dex */
    private class WebClient extends WebViewClient {
        private WebClient() {
        }

        @Override // android.webkit.WebViewClient
        public boolean shouldOverrideUrlLoading(WebView view, String url) {
            Uri uri;
            String url2 = url.replace("file://", "https://vkontakte.ru");
            try {
                uri = Uri.parse(url2);
            } catch (Exception e) {
            }
            if ("vkontakte.ru".equals(uri.getHost()) || "vk.com".equals(uri.getHost()) || "m.vk.com".equals(uri.getHost())) {
                if ("/pages".equals(uri.getPath())) {
                    int oid = Integer.parseInt(uri.getQueryParameter(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_OID));
                    String title = uri.getQueryParameter(TtmlNode.TAG_P).replace('_', ' ');
                    Log.d("vk", "page '" + title + "' " + oid);
                    WikiViewFragment.this.loadPage(oid, title, true);
                } else if (uri.getPath() != null && uri.getPath().matches("/page[-0-9]+_[0-9]+")) {
                    Pattern ptn = Pattern.compile("/page([-0-9]+)_([0-9]+)");
                    Matcher m = ptn.matcher(uri.getPath());
                    m.find();
                    WikiViewFragment.this.loadPage(Integer.parseInt(m.group(1)), Integer.parseInt(m.group(2)), true);
                }
                return true;
            }
            Intent intent = new Intent("android.intent.action.VIEW", Uri.parse("vklink://view/?" + url2));
            WikiViewFragment.this.startActivity(intent);
            return true;
        }

        @Override // android.webkit.WebViewClient
        public void onPageFinished(WebView wv, String url) {
            WikiViewFragment.this.injectScript();
        }
    }

    /* loaded from: classes2.dex */
    private class WebChrome extends WebChromeClient {
        private WebChrome() {
        }

        @Override // android.webkit.WebChromeClient
        public void onProgressChanged(WebView view, int newProgress) {
            WikiViewFragment.this.toolbarProgress.setProgress(newProgress * 100);
            V.setVisibilityAnimated(WikiViewFragment.this.toolbarProgress, newProgress == 100 ? 8 : 0);
            if (newProgress > 0 && !WikiViewFragment.this.loaded) {
                WikiViewFragment.this.dataLoaded();
            }
            if (newProgress >= 50 && !WikiViewFragment.this.injectedScript) {
                WikiViewFragment.this.injectScript();
                WikiViewFragment.this.injectedScript = true;
            }
        }

        @Override // android.webkit.WebChromeClient
        public boolean onJsAlert(WebView view, String url, String message, JsResult result) {
            Log.i("vk", "ALERT -> " + message);
            return true;
        }
    }

    @Override // com.vkontakte.android.fragments.BackListener
    public boolean onBackPressed() {
        if (this.webView.canGoBack()) {
            this.webView.goBack();
            return true;
        }
        return false;
    }

    /* loaded from: classes2.dex */
    private static class HistoryEntry {
        APIRequest req;
        String title;

        private HistoryEntry() {
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class WebCallback {
        private WebCallback() {
        }

        @JavascriptInterface
        public void playAudio(int[] oid, int[] aid, String[] artist, String[] title, String[] url, int[] duration, int index) {
            ArrayList<MusicTrack> list = new ArrayList<>();
            for (int i = 0; i < oid.length; i++) {
                list.add(new MusicTrack(aid[i], oid[i], artist[i], title[i], duration[i], url[i]));
            }
            AudioFacade.playTracks(list, index, PlayerRefer.none, true);
            AudioFacade.showPlayer();
        }

        @JavascriptInterface
        public void openPage(int oid, int pid) {
            WikiViewFragment.this.loadPage(oid, pid, true);
        }

        @JavascriptInterface
        public void openPhotos(String[] urls, int pos) {
            WikiViewFragment.this.getActivity().runOnUiThread(WikiViewFragment$WebCallback$$Lambda$1.lambdaFactory$(this, urls, pos));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$openPhotos$0(String[] urls, int pos) {
            ArrayList<Photo> photos = new ArrayList<>();
            for (String url : urls) {
                Photo p = new Photo();
                Photo.Image im = new Photo.Image();
                im.type = 'x';
                String[] ss = url.split("\\|");
                im.url = ss[0];
                p.sizes.add(im);
                photos.add(p);
            }
            PhotoViewer viewer = new PhotoViewer(WikiViewFragment.this.getActivity(), photos, pos, new PhotoViewer.PhotoViewerCallback() { // from class: com.vkontakte.android.fragments.WikiViewFragment.WebCallback.1
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
                }
            });
            viewer.show();
        }
    }
}
