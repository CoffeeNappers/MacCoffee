package com.my.target.core.ui.views.chrome;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.drawable.ClipDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.LayerDrawable;
import android.net.Uri;
import android.support.v4.view.ViewCompat;
import android.text.TextUtils;
import android.util.Base64;
import android.util.TypedValue;
import android.view.View;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.my.target.core.utils.l;
import com.vk.media.camera.CameraUtils;
import java.net.URI;
import java.net.URISyntaxException;
/* loaded from: classes2.dex */
public class CustomWebView extends LinearLayout {
    public static final int a = l.a();
    public static final int b = l.a();
    private final l c;
    private final ImageButton d;
    private final LinearLayout e;
    private final TextView f;
    private final TextView g;
    private final FrameLayout h;
    private final View i;
    private final FrameLayout j;
    private final ImageButton k;
    private a l;
    private final RelativeLayout m;
    private final WebView n;
    private final ProgressBar o;
    private WebViewClient p;
    private WebChromeClient q;
    private View.OnClickListener r;
    private View.OnClickListener s;

    /* loaded from: classes2.dex */
    public interface a {
        void onWebViewClosed();
    }

    public CustomWebView(Context context) {
        super(context);
        this.p = new WebViewClient() { // from class: com.my.target.core.ui.views.chrome.CustomWebView.1
            @Override // android.webkit.WebViewClient
            public final boolean shouldOverrideUrlLoading(WebView webView, String str) {
                webView.loadUrl(str);
                CustomWebView.this.f.setText(CustomWebView.b(str));
                return true;
            }
        };
        this.q = new WebChromeClient() { // from class: com.my.target.core.ui.views.chrome.CustomWebView.2
            @Override // android.webkit.WebChromeClient
            public final void onReceivedTitle(WebView webView, String str) {
                super.onReceivedTitle(webView, str);
                CustomWebView.this.g.setText(webView.getTitle());
                CustomWebView.this.g.setVisibility(0);
            }

            @Override // android.webkit.WebChromeClient
            public final void onProgressChanged(WebView webView, int i) {
                if (i < 100 && CustomWebView.this.o.getVisibility() == 8) {
                    CustomWebView.this.o.setVisibility(0);
                    CustomWebView.this.i.setVisibility(8);
                }
                CustomWebView.this.o.setProgress(i);
                if (i >= 100) {
                    CustomWebView.this.o.setVisibility(8);
                    CustomWebView.this.i.setVisibility(0);
                }
            }
        };
        this.r = new View.OnClickListener() { // from class: com.my.target.core.ui.views.chrome.CustomWebView.3
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                if (CustomWebView.this.l != null) {
                    CustomWebView.this.l.onWebViewClosed();
                }
            }
        };
        this.s = new View.OnClickListener() { // from class: com.my.target.core.ui.views.chrome.CustomWebView.4
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                String url = CustomWebView.this.n.getUrl();
                if (!TextUtils.isEmpty(url)) {
                    Intent intent = new Intent("android.intent.action.VIEW", Uri.parse(url));
                    if (!(CustomWebView.this.getContext() instanceof Activity)) {
                        intent.addFlags(268435456);
                    }
                    CustomWebView.this.getContext().startActivity(intent);
                }
            }
        };
        this.m = new RelativeLayout(context);
        this.n = new WebView(context);
        this.d = new ImageButton(context);
        this.e = new LinearLayout(context);
        this.f = new TextView(context);
        this.g = new TextView(context);
        this.h = new FrameLayout(context);
        this.j = new FrameLayout(context);
        this.k = new ImageButton(context);
        this.o = new ProgressBar(context, null, 16842872);
        this.i = new View(context);
        this.c = new l(context);
    }

    public final void a() {
        setOrientation(1);
        setGravity(16);
        TypedValue typedValue = new TypedValue();
        int complexToDimensionPixelSize = getContext().getTheme().resolveAttribute(16843499, typedValue, true) ? TypedValue.complexToDimensionPixelSize(typedValue.data, getResources().getDisplayMetrics()) : this.c.a(50);
        this.m.setLayoutParams(new LinearLayout.LayoutParams(-1, complexToDimensionPixelSize));
        this.h.setLayoutParams(new LinearLayout.LayoutParams(complexToDimensionPixelSize, complexToDimensionPixelSize));
        this.h.setId(a);
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, -1);
        layoutParams.gravity = 17;
        this.d.setLayoutParams(layoutParams);
        ImageButton imageButton = this.d;
        int i = complexToDimensionPixelSize / 4;
        int a2 = this.c.a(2);
        Bitmap createBitmap = Bitmap.createBitmap(i, i, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(createBitmap);
        Paint paint = new Paint();
        paint.setStrokeWidth(a2);
        paint.setAntiAlias(true);
        paint.setColor(-7829368);
        paint.setStrokeCap(Paint.Cap.BUTT);
        paint.setStyle(Paint.Style.STROKE);
        canvas.drawLine(0.0f, 0.0f, i, i, paint);
        canvas.drawLine(0.0f, i, i, 0.0f, paint);
        imageButton.setImageBitmap(createBitmap);
        this.d.setOnClickListener(this.r);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(complexToDimensionPixelSize, complexToDimensionPixelSize);
        if (l.c(18)) {
            layoutParams2.addRule(21);
        } else {
            layoutParams2.addRule(11);
        }
        this.j.setLayoutParams(layoutParams2);
        this.j.setId(b);
        FrameLayout.LayoutParams layoutParams3 = new FrameLayout.LayoutParams(-1, -1);
        layoutParams3.gravity = 17;
        this.k.setLayoutParams(layoutParams3);
        ImageButton imageButton2 = this.k;
        Context context = getContext();
        byte[] decode = Base64.decode("iVBORw0KGgoAAAANSUhEUgAAAGAAAABgCAQAAABIkb+zAAAAAmJLR0QAAKqNIzIAAAAJcEhZcwAACxMAAAsTAQCanBgAAAAHdElNRQfgAR0KGztQKbC4AAAA8UlEQVR42u2aQQ6EMAzE6IhH8wR+DfeVoCAySRfs82plQ0FNxTQBAAAAAMBXab0frFut4NIeBFTLX4lo4+ufJ+i1z8BI1//sHvz9HSCAAAIIIIAAAiqZo/bl0Vzdi7GECCCAAAJGDlg392wtr77/eEBufXeC/PreBGXoOxOUo+9LUJa+K0F5+p4EZeo7EpSrH5+gbP3oBOXrxyaoQj8yQTX6cQmq0o9KUJ1+TML89A+Ozot+1VznSkxkBBBAAAEEEEAAAQQQ4J8HeqPH3f3+UDMxS4iAgDXt5cVf7iruvVJx/Tuv0aWN//k9AAAAAAB8lx0xVUXCRDTw+wAAAABJRU5ErkJggg==", 0);
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inDensity = CameraUtils.Settings.LOW_WIDTH;
        options.inTargetDensity = context.getResources().getDisplayMetrics().densityDpi;
        imageButton2.setImageBitmap(BitmapFactory.decodeByteArray(decode, 0, decode.length, options));
        this.k.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        this.k.setOnClickListener(this.s);
        l.a(this.d, 0, -3355444);
        l.a(this.k, 0, -3355444);
        RelativeLayout.LayoutParams layoutParams4 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams4.addRule(15, -1);
        layoutParams4.addRule(1, a);
        layoutParams4.addRule(0, b);
        this.e.setLayoutParams(layoutParams4);
        this.e.setOrientation(1);
        this.e.setPadding(this.c.a(4), this.c.a(4), this.c.a(4), this.c.a(4));
        LinearLayout.LayoutParams layoutParams5 = new LinearLayout.LayoutParams(-2, 0);
        layoutParams5.weight = 1.0f;
        this.g.setVisibility(8);
        this.g.setLayoutParams(layoutParams5);
        this.g.setTextColor(ViewCompat.MEASURED_STATE_MASK);
        this.g.setTextSize(2, 18.0f);
        this.g.setSingleLine();
        this.g.setEllipsize(TextUtils.TruncateAt.MIDDLE);
        LinearLayout.LayoutParams layoutParams6 = new LinearLayout.LayoutParams(-2, 0);
        layoutParams6.weight = 1.0f;
        this.f.setLayoutParams(layoutParams6);
        this.f.setSingleLine();
        this.f.setTextSize(2, 12.0f);
        this.f.setEllipsize(TextUtils.TruncateAt.MIDDLE);
        this.n.setLayoutParams(new LinearLayout.LayoutParams(-1, -1));
        this.n.getSettings().setJavaScriptEnabled(true);
        this.n.getSettings().setLoadWithOverviewMode(true);
        this.n.getSettings().setUseWideViewPort(true);
        this.n.getSettings().setBuiltInZoomControls(true);
        if (l.c(11)) {
            this.n.getSettings().setDisplayZoomControls(false);
        }
        this.n.setWebViewClient(this.p);
        this.n.setWebChromeClient(this.q);
        ClipDrawable clipDrawable = new ClipDrawable(new ColorDrawable(-16537100), 3, 1);
        ColorDrawable colorDrawable = new ColorDrawable(-1968642);
        LayerDrawable layerDrawable = (LayerDrawable) this.o.getProgressDrawable();
        layerDrawable.setDrawableByLayerId(16908288, colorDrawable);
        layerDrawable.setDrawableByLayerId(16908301, clipDrawable);
        this.o.setProgressDrawable(layerDrawable);
        this.o.setLayoutParams(new LinearLayout.LayoutParams(-1, this.c.a(2)));
        this.o.setProgress(0);
        this.e.addView(this.g);
        this.e.addView(this.f);
        this.h.addView(this.d);
        this.j.addView(this.k);
        this.m.addView(this.h);
        this.m.addView(this.e);
        this.m.addView(this.j);
        addView(this.m);
        this.i.setBackgroundColor(-5592406);
        RelativeLayout.LayoutParams layoutParams7 = new RelativeLayout.LayoutParams(-1, 1);
        this.i.setVisibility(8);
        this.i.setLayoutParams(layoutParams7);
        addView(this.o);
        addView(this.i);
        addView(this.n);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static String b(String str) {
        try {
            URI uri = new URI(str);
            return uri.getScheme() + "://" + uri.getHost();
        } catch (URISyntaxException e) {
            e.printStackTrace();
            return str;
        }
    }

    public void setListener(a aVar) {
        this.l = aVar;
    }

    public final boolean b() {
        return this.n.canGoBack();
    }

    public final void c() {
        this.n.goBack();
    }

    public final void d() {
        if (this.n != null) {
            this.n.setWebChromeClient(null);
            this.n.setWebViewClient(null);
            this.n.destroy();
        }
    }

    public void setUrl(String str) {
        this.n.loadUrl(str);
        this.f.setText(b(str));
    }
}
