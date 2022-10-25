package com.my.target.core.ui.views;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.ViewFlipper;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.my.target.Tracer;
import com.my.target.core.engines.h;
import com.my.target.core.models.banners.j;
import com.my.target.core.utils.b;
import com.my.target.core.utils.l;
import com.my.target.nativeads.views.StarsRatingView;
import com.vkontakte.android.data.UserNotification;
import com.vkontakte.android.ui.SearchViewWrapper;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
@SuppressLint({"ViewConstructor"})
/* loaded from: classes2.dex */
public class StandardNative320x50View extends RelativeLayout {
    private final BorderedTextView a;
    private final TextView b;
    private final TextView c;
    private final TextView d;
    private final LinearLayout e;
    private final Button f;
    private final StarsRatingView g;
    private final CacheImageView h;
    private final RelativeLayout i;
    private final RelativeLayout j;
    private final ViewFlipper k;
    private final l l;
    private final int m;
    private final FrameLayout n;
    private final Runnable o;
    private final Runnable p;
    private final View.OnClickListener q;
    private final Runnable r;
    private a s;
    private h t;
    private String u;
    private j v;
    private int w;
    private int x;
    private com.my.target.core.models.j y;

    /* loaded from: classes2.dex */
    public interface a {
        void a(int i);

        void h();
    }

    public void setBanner(j jVar, int i) {
        RelativeLayout.LayoutParams layoutParams;
        this.x = i;
        this.u = jVar.getId();
        this.v = jVar;
        if ("store".equalsIgnoreCase(jVar.getNavigationType())) {
            this.d.setVisibility(8);
            this.g.setVisibility(0);
            this.c.setVisibility(0);
        } else {
            this.d.setVisibility(0);
            this.g.setVisibility(8);
            this.c.setVisibility(8);
        }
        removeCallbacks(this.p);
        removeCallbacks(this.o);
        this.b.setText(jVar.b());
        this.d.setText(jVar.e());
        this.g.setRating(jVar.g());
        this.c.setText(String.valueOf(jVar.h()));
        this.f.setText(TextUtils.isEmpty(jVar.getCtaText()) ? "➜" : jVar.getCtaText());
        if (!TextUtils.isEmpty(jVar.getAgeRestrictions())) {
            this.a.setVisibility(0);
            this.a.setText(jVar.getAgeRestrictions());
        } else {
            this.a.setVisibility(8);
        }
        if (jVar.f() != null && jVar.f().getData() != null) {
            Bitmap data = jVar.f().getData();
            this.h.setImageBitmap(data);
            int width = data.getWidth();
            int height = data.getHeight();
            String type = jVar.getType();
            if ("teaser".equals(type)) {
                this.f.setVisibility(0);
                this.k.setVisibility(0);
                if (width != 0 && height != 0) {
                    layoutParams = new RelativeLayout.LayoutParams((int) (this.m / (height / width)), this.m);
                } else {
                    layoutParams = new RelativeLayout.LayoutParams(-2, this.m);
                }
                this.h.setPadding(this.l.a(2), this.l.a(2), this.l.a(2), this.l.a(2));
                this.h.setLayoutParams(layoutParams);
                this.n.setLayoutParams(layoutParams);
                layoutParams.addRule(9, -1);
                layoutParams.addRule(15, -1);
                this.h.setLayoutParams(layoutParams);
            } else if (UserNotification.LAYOUT_NEWSFEED_BANNER.equals(type)) {
                int i2 = height != 0 ? (this.m * width) / height : -2;
                this.f.setVisibility(8);
                this.k.setVisibility(8);
                RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(i2, this.m);
                layoutParams2.addRule(14);
                this.h.setLayoutParams(layoutParams2);
                this.n.setLayoutParams(layoutParams2);
            }
        }
        if (!TextUtils.isEmpty(this.a.getText())) {
            post(this.o);
        }
        if (i == 0) {
            post(this.r);
        } else {
            a(i);
        }
    }

    public void setEngineListener(a aVar) {
        this.s = aVar;
    }

    public void setMyTargetClickListener(h hVar) {
        this.t = hVar;
    }

    public void setViewSettings(com.my.target.core.models.j jVar, boolean z) {
        this.y = jVar;
        this.b.setTextColor(jVar.j());
        if (jVar.b()) {
            this.b.setTypeface(null, 1);
        } else {
            this.b.setTypeface(null, 0);
        }
        this.a.setTextColor(jVar.l());
        this.a.setBorder(2, jVar.m());
        this.a.setBackgroundColor(jVar.k());
        this.d.setTextColor(jVar.o());
        if (jVar.d()) {
            this.d.setTypeface(null, 1);
        } else {
            this.d.setTypeface(null, 0);
        }
        this.c.setTextColor(jVar.p());
        if (jVar.e()) {
            this.c.setTypeface(null, 1);
        } else {
            this.c.setTypeface(null, 0);
        }
        this.h.setBackgroundColor(jVar.h());
        l.a(this.n, 0, l.d(jVar.i()));
        l.a(this.k, jVar.h(), jVar.i());
        if (z) {
            setBackgroundColor(0);
        } else {
            l.a(this, jVar.h(), jVar.i());
        }
        l.a(this.f, jVar.r(), jVar.s());
        this.f.setTextColor(jVar.t());
        if (!jVar.g()) {
            this.f.setTypeface(null, 0);
        } else {
            this.f.setTypeface(null, 1);
        }
    }

    public StandardNative320x50View(Context context, int i) {
        this(context, i, (byte) 0);
    }

    private StandardNative320x50View(Context context, int i, byte b) {
        super(context, null);
        this.o = new Runnable() { // from class: com.my.target.core.ui.views.StandardNative320x50View.1
            @Override // java.lang.Runnable
            public final void run() {
                int width = StandardNative320x50View.this.k.getWidth();
                if (width > 0) {
                    StandardNative320x50View.this.b.setMaxWidth((width - (StandardNative320x50View.this.a.getText().length() * StandardNative320x50View.this.l.a(10))) - StandardNative320x50View.this.l.a(10));
                }
            }
        };
        this.p = new Runnable() { // from class: com.my.target.core.ui.views.StandardNative320x50View.2
            @Override // java.lang.Runnable
            public final void run() {
                if (StandardNative320x50View.this.s != null && StandardNative320x50View.this.k.getDisplayedChild() == StandardNative320x50View.this.k.getChildCount() - 1) {
                    StandardNative320x50View.this.s.h();
                }
                if (StandardNative320x50View.this.k.getChildCount() > 1) {
                    StandardNative320x50View.this.k.showNext();
                    StandardNative320x50View.this.postDelayed(StandardNative320x50View.this.p, 4000L);
                }
            }
        };
        this.q = new View.OnClickListener() { // from class: com.my.target.core.ui.views.StandardNative320x50View.3
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                if (StandardNative320x50View.this.t != null) {
                    StandardNative320x50View.this.t.a(StandardNative320x50View.this.u);
                }
            }
        };
        this.r = new Runnable() { // from class: com.my.target.core.ui.views.StandardNative320x50View.4
            @Override // java.lang.Runnable
            public final void run() {
                int width = (StandardNative320x50View.this.k.getWidth() - StandardNative320x50View.this.k.getPaddingLeft()) - StandardNative320x50View.this.k.getPaddingRight();
                if (StandardNative320x50View.this.s != null) {
                    StandardNative320x50View.this.s.a(width);
                }
                StandardNative320x50View.this.a(width);
            }
        };
        this.w = 3;
        this.m = i;
        this.l = new l(context);
        this.h = new CacheImageView(context);
        this.n = new FrameLayout(context);
        this.k = new ViewFlipper(context);
        this.e = new LinearLayout(context);
        this.f = new Button(context);
        this.b = new TextView(context);
        this.a = new BorderedTextView(context);
        this.g = new StarsRatingView(context);
        this.c = new TextView(context);
        this.d = new TextView(context);
        this.i = new RelativeLayout(context);
        this.j = new RelativeLayout(context);
        this.h.setId(401);
        this.n.setOnClickListener(this.q);
        this.f.setId(403);
        this.f.setPadding(this.l.a(8), this.l.a(8), this.l.a(8), this.l.a(8));
        this.f.setMinimumWidth(this.m);
        this.f.setTextSize(2, 20.0f);
        this.f.setMaxWidth(this.m * 2);
        this.f.setOnClickListener(this.q);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -1);
        layoutParams.addRule(11, -1);
        this.f.setLayoutParams(layoutParams);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams2.addRule(0, 403);
        layoutParams2.addRule(1, 401);
        this.k.setLayoutParams(layoutParams2);
        this.k.setInAnimation(b.a());
        this.k.setOutAnimation(b.b());
        this.k.setOnClickListener(this.q);
        this.e.setOrientation(1);
        this.i.setLayoutParams(new LinearLayout.LayoutParams(-1, this.m / 2));
        this.i.setGravity(16);
        this.b.setId(402);
        this.b.setMaxLines(1);
        this.b.setHorizontallyScrolling(true);
        this.b.setSingleLine(true);
        this.b.setMaxEms(25);
        this.b.setTextSize(2, 16.0f);
        this.b.setEllipsize(TextUtils.TruncateAt.END);
        RelativeLayout.LayoutParams layoutParams3 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams3.rightMargin = this.l.a(4);
        layoutParams3.leftMargin = this.l.a(4);
        layoutParams3.topMargin = this.l.a(2);
        layoutParams3.addRule(15);
        this.b.setLayoutParams(layoutParams3);
        this.a.setId(SearchViewWrapper.CONFIRM_TIMEOUT);
        this.a.setBorder(1, -7829368);
        this.a.setGravity(17);
        this.a.setTextSize(2, 10.0f);
        this.a.setPadding(this.l.a(2), this.l.a(4), 0, 0);
        this.a.setLines(1);
        RelativeLayout.LayoutParams layoutParams4 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams4.addRule(15);
        layoutParams4.topMargin = this.l.a(2);
        layoutParams4.addRule(1, 402);
        this.a.setLayoutParams(layoutParams4);
        this.j.setLayoutParams(new LinearLayout.LayoutParams(-1, this.m / 2));
        this.g.setId(404);
        RelativeLayout.LayoutParams layoutParams5 = new RelativeLayout.LayoutParams(this.l.a(73), this.l.a(12));
        layoutParams5.leftMargin = this.l.a(4);
        layoutParams5.topMargin = this.l.a(4);
        layoutParams5.bottomMargin = this.l.a(2);
        layoutParams5.addRule(15);
        this.g.setLayoutParams(layoutParams5);
        RelativeLayout.LayoutParams layoutParams6 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams6.addRule(1, 404);
        layoutParams6.addRule(15);
        this.c.setLayoutParams(layoutParams6);
        RelativeLayout.LayoutParams layoutParams7 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams7.leftMargin = this.l.a(4);
        this.d.setLayoutParams(layoutParams7);
        new RelativeLayout.LayoutParams(-2, -2).addRule(15);
        this.f.setTransformationMethod(null);
        addView(this.h);
        addView(this.n);
        addView(this.f);
        this.j.addView(this.g);
        this.j.addView(this.c);
        this.j.addView(this.d);
        this.i.addView(this.b);
        this.i.addView(this.a);
        this.e.addView(this.i);
        this.e.addView(this.j);
        this.k.addView(this.e);
        addView(this.k);
    }

    public final void a() {
        this.k.stopFlipping();
        removeCallbacks(this.p);
    }

    public final void a(boolean z) {
        if (z && this.k.getDisplayedChild() != 0) {
            Animation inAnimation = this.k.getInAnimation();
            Animation outAnimation = this.k.getOutAnimation();
            this.k.setInAnimation(null);
            this.k.setOutAnimation(null);
            this.k.setDisplayedChild(0);
            if (inAnimation != null && outAnimation != null) {
                this.k.setInAnimation(inAnimation);
                this.k.setOutAnimation(outAnimation);
            }
        }
        b();
    }

    @Override // android.view.View
    protected void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        removeCallbacks(this.o);
        this.k.setDisplayedChild(0);
        while (this.k.getChildCount() > 2) {
            this.k.removeViewAt(this.k.getChildCount() - 1);
        }
        setBanner(this.v, this.x);
        b();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(int i) {
        LinearLayout linearLayout;
        if (i == 0) {
            if (this.w > 0) {
                this.w--;
                postDelayed(this.r, 100L);
                return;
            }
            Tracer.d("failed to get banner width, unable to draw description and disclaimer properly");
        } else if (this.v == null) {
            Tracer.d("unable to draw description and disclaimer: no current banner");
        } else {
            if (!TextUtils.isEmpty(this.v.c())) {
                Paint paint = new Paint();
                paint.setTextSize(this.l.b(15));
                if (this.y != null && this.y.c()) {
                    paint.setTypeface(Typeface.DEFAULT_BOLD);
                } else {
                    paint.setTypeface(Typeface.DEFAULT);
                }
                linearLayout = null;
                for (String str : a(this.v.c(), i, paint)) {
                    if (linearLayout == null || linearLayout.getChildCount() > 1) {
                        ViewGroup.LayoutParams layoutParams = new ViewGroup.LayoutParams(-1, this.m);
                        linearLayout = new LinearLayout(getContext());
                        linearLayout.setGravity(16);
                        linearLayout.setOrientation(1);
                        linearLayout.setLayoutParams(layoutParams);
                        this.k.addView(linearLayout);
                    }
                    TextView textView = new TextView(getContext());
                    textView.setGravity(16);
                    textView.setLineSpacing(0.0f, 1.2f);
                    textView.setLines(1);
                    if (this.y != null) {
                        textView.setTextColor(this.y.n());
                    }
                    if (this.y != null && this.y.c()) {
                        textView.setTypeface(null, 1);
                    } else {
                        textView.setTypeface(null, 0);
                    }
                    textView.setText(str);
                    linearLayout.addView(textView);
                }
            } else {
                linearLayout = null;
            }
            if (!TextUtils.isEmpty(this.v.d())) {
                Paint paint2 = new Paint();
                paint2.setTextSize(this.l.b(14));
                if (this.y != null && this.y.f()) {
                    paint2.setTypeface(Typeface.DEFAULT_BOLD);
                } else {
                    paint2.setTypeface(Typeface.DEFAULT);
                }
                for (String str2 : a(this.v.d(), i, paint2)) {
                    if (linearLayout == null || linearLayout.getChildCount() > 1) {
                        ViewGroup.LayoutParams layoutParams2 = new ViewGroup.LayoutParams(-1, this.m);
                        linearLayout = new LinearLayout(getContext());
                        linearLayout.setGravity(16);
                        linearLayout.setOrientation(1);
                        linearLayout.setLayoutParams(layoutParams2);
                        this.k.addView(linearLayout);
                    }
                    TextView textView2 = new TextView(getContext());
                    textView2.setGravity(16);
                    textView2.setLineSpacing(0.0f, 1.2f);
                    textView2.setLines(1);
                    if (this.y != null) {
                        textView2.setTextColor(this.y.q());
                    }
                    if (this.y != null && this.y.f()) {
                        textView2.setTypeface(null, 1);
                    } else {
                        textView2.setTypeface(null, 0);
                    }
                    textView2.setText(str2);
                    linearLayout.addView(textView2);
                }
            }
        }
    }

    private static List<String> a(String str, float f, Paint paint) {
        String[] split;
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        for (String str2 : str.split("\\s")) {
            if (paint.measureText(str2) < f) {
                a(f, paint, arrayList, arrayList2, str2);
            } else {
                for (String str3 : b(str2, f, paint)) {
                    a(f, paint, arrayList, arrayList2, str3);
                }
            }
        }
        if (!arrayList2.isEmpty()) {
            arrayList.add(TextUtils.join(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR, arrayList2));
        }
        return arrayList;
    }

    private static List<String> b(String str, float f, Paint paint) {
        if (TextUtils.isEmpty(str) || paint.measureText(str) <= f) {
            return Collections.singletonList(str);
        }
        ArrayList arrayList = new ArrayList();
        int i = 0;
        for (int i2 = 1; i2 <= str.length(); i2++) {
            if (paint.measureText(str.substring(i, i2)) >= f) {
                arrayList.add(str.substring(i, i2 - 1));
                i = i2 - 1;
            }
            if (i2 == str.length()) {
                arrayList.add(str.substring(i, i2));
            }
        }
        return arrayList;
    }

    private static void a(float f, Paint paint, ArrayList<String> arrayList, ArrayList<String> arrayList2, String str) {
        arrayList2.add(str);
        if (paint.measureText(TextUtils.join(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR, arrayList2)) >= f) {
            arrayList2.remove(arrayList2.size() - 1);
            arrayList.add(TextUtils.join(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR, arrayList2));
            arrayList2.clear();
            arrayList2.add(str);
        }
    }

    private void b() {
        removeCallbacks(this.p);
        postDelayed(this.p, 4000L);
    }
}
