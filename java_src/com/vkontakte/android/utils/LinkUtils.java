package com.vkontakte.android.utils;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.text.TextUtils;
import android.view.ViewGroup;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Toast;
import com.vkontakte.android.LinkRedirActivity;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
/* loaded from: classes3.dex */
public class LinkUtils {
    public static final String MARKET = "play.google.com";

    public static void processLink(Context ctx, String url, String target) {
        if (!TextUtils.isEmpty(url)) {
            String valueOf = String.valueOf(target);
            char c = 65535;
            switch (valueOf.hashCode()) {
                case -1820761141:
                    if (valueOf.equals("external")) {
                        c = 0;
                        break;
                    }
                    break;
                case -1544407700:
                    if (valueOf.equals("internal_hidden")) {
                        c = 3;
                        break;
                    }
                    break;
                case 570410685:
                    if (valueOf.equals("internal")) {
                        c = 1;
                        break;
                    }
                    break;
            }
            switch (c) {
                case 0:
                    processExternalLink(ctx, url);
                    return;
                case 1:
                    processInternalLink(ctx, url);
                    return;
                default:
                    processInternalHiddenLink(ctx, url);
                    return;
            }
        }
    }

    public static void processExternalLink(Context ctx, String link) {
        Intent intent;
        if (link != null && link.startsWith("tel:") && !link.startsWith("tel://")) {
            intent = new Intent("android.intent.action.DIAL", Uri.parse(link));
        } else {
            intent = new Intent("android.intent.action.VIEW", Uri.parse(link));
        }
        try {
            ctx.startActivity(intent);
        } catch (Exception e) {
            L.e(e, new Object[0]);
        }
    }

    public static void processInternalLink(Context ctx, String link) {
        Intent intent = new Intent("android.intent.action.VIEW", Uri.parse(link));
        Uri uri = Uri.parse(link);
        if (LinkRedirActivity.isVKHost(uri)) {
            intent.setComponent(new ComponentName(ctx, LinkRedirActivity.class));
        } else if ("android.intent.action.VIEW".equals(intent.getAction())) {
            LinkRedirActivity.addCustomTabsExtras(intent);
        }
        try {
            ctx.startActivity(intent);
        } catch (Exception e) {
            L.e(e, new Object[0]);
        }
    }

    public static void processWebViewLink(Context ctx, WebView view, String url, ProgressDialog progress) {
        Uri uri = Uri.parse(url);
        if (MARKET.equals(uri.getHost())) {
            try {
                ctx.startActivity(new Intent("android.intent.action.VIEW", uri).setPackage("com.android.vending"));
            } catch (Exception e) {
                L.e("open link error", e);
                Toast.makeText(ctx, (int) R.string.error, 0).show();
            }
        } else {
            processInternalLink(ctx, url);
        }
        view.destroy();
        ViewUtils.dismissDialogSafety(progress);
        ((ViewGroup) Utils.castToActivity(ctx).getWindow().getDecorView()).removeView(view);
    }

    public static void processInternalHiddenLink(final Context ctx, String link) {
        Activity act = Utils.castToActivity(ctx);
        if (act != null) {
            final ProgressDialog progress = new ProgressDialog(ctx);
            progress.setMessage(ctx.getString(R.string.loading));
            progress.setCancelable(false);
            progress.show();
            WebView wv = new WebView(ctx);
            wv.setVisibility(8);
            wv.setWebViewClient(new WebViewClient() { // from class: com.vkontakte.android.utils.LinkUtils.1
                @Override // android.webkit.WebViewClient
                public void onPageFinished(WebView view, String url) {
                    LinkUtils.processWebViewLink(ctx, view, url, progress);
                }

                @Override // android.webkit.WebViewClient
                public boolean shouldOverrideUrlLoading(WebView view, String url) {
                    Uri uri = Uri.parse(url);
                    if ((!com.facebook.common.util.UriUtil.HTTP_SCHEME.equals(uri.getScheme()) && !com.facebook.common.util.UriUtil.HTTPS_SCHEME.equals(uri.getScheme())) || LinkUtils.MARKET.equals(uri.getHost())) {
                        LinkUtils.processWebViewLink(ctx, view, url, progress);
                        return true;
                    }
                    return false;
                }

                @Override // android.webkit.WebViewClient
                public void onReceivedError(WebView view, int errorCode, String description, String failingUrl) {
                    Toast.makeText(ctx, (int) R.string.err_text, 0).show();
                    view.destroy();
                    ViewUtils.dismissDialogSafety(progress);
                    ((ViewGroup) Utils.castToActivity(ctx).getWindow().getDecorView()).removeView(view);
                }
            });
            wv.postDelayed(LinkUtils$$Lambda$1.lambdaFactory$(wv, progress, ctx), 10000L);
            ((ViewGroup) act.getWindow().getDecorView()).addView(wv);
            wv.getSettings().setJavaScriptEnabled(true);
            wv.loadUrl(link);
        }
    }

    public static /* synthetic */ void lambda$processInternalHiddenLink$0(WebView wv, ProgressDialog progress, Context ctx) {
        if (wv.getParent() != null) {
            wv.destroy();
            ((ViewGroup) wv.getParent()).removeView(wv);
            ViewUtils.dismissDialogSafety(progress);
            Toast.makeText(ctx, (int) R.string.err_text, 0).show();
        }
    }
}
