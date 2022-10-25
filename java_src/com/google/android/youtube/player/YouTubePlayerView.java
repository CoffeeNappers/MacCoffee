package com.google.android.youtube.player;

import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.os.Build;
import android.os.Bundle;
import android.support.v4.view.ViewCompat;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import com.google.android.youtube.player.YouTubePlayer;
import com.google.android.youtube.player.internal.aa;
import com.google.android.youtube.player.internal.ab;
import com.google.android.youtube.player.internal.n;
import com.google.android.youtube.player.internal.s;
import com.google.android.youtube.player.internal.t;
import com.google.android.youtube.player.internal.w;
import com.google.android.youtube.player.internal.y;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;
/* loaded from: classes2.dex */
public final class YouTubePlayerView extends ViewGroup implements YouTubePlayer.Provider {
    private final a a;
    private final Set<View> b;
    private final b c;
    private com.google.android.youtube.player.internal.b d;
    private s e;
    private View f;
    private n g;
    private YouTubePlayer.Provider h;
    private Bundle i;
    private YouTubePlayer.OnInitializedListener j;
    private boolean k;
    private boolean l;

    /* loaded from: classes2.dex */
    private final class a implements ViewTreeObserver.OnGlobalFocusChangeListener {
        private a() {
        }

        /* synthetic */ a(YouTubePlayerView youTubePlayerView, byte b) {
            this();
        }

        @Override // android.view.ViewTreeObserver.OnGlobalFocusChangeListener
        public final void onGlobalFocusChanged(View view, View view2) {
            if (YouTubePlayerView.this.e == null || !YouTubePlayerView.this.b.contains(view2) || YouTubePlayerView.this.b.contains(view)) {
                return;
            }
            YouTubePlayerView.this.e.g();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public interface b {
        void a(YouTubePlayerView youTubePlayerView);

        void a(YouTubePlayerView youTubePlayerView, String str, YouTubePlayer.OnInitializedListener onInitializedListener);
    }

    public YouTubePlayerView(Context context) {
        this(context, null);
    }

    public YouTubePlayerView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public YouTubePlayerView(Context context, AttributeSet attributeSet, int i) {
        this(context, attributeSet, i, ((YouTubeBaseActivity) context).a());
        if (!(context instanceof YouTubeBaseActivity)) {
            throw new IllegalStateException("A YouTubePlayerView can only be created with an Activity  which extends YouTubeBaseActivity as its context.");
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public YouTubePlayerView(Context context, AttributeSet attributeSet, int i, b bVar) {
        super((Context) ab.a(context, "context cannot be null"), attributeSet, i);
        this.c = (b) ab.a(bVar, "listener cannot be null");
        if (getBackground() == null) {
            setBackgroundColor(ViewCompat.MEASURED_STATE_MASK);
        }
        setClipToPadding(false);
        this.g = new n(context);
        requestTransparentRegion(this.g);
        addView(this.g);
        this.b = new HashSet();
        this.a = new a(this, (byte) 0);
    }

    private void a(View view) {
        if (!(view == this.g || (this.e != null && view == this.f))) {
            throw new UnsupportedOperationException("No views can be added on top of the player");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(YouTubeInitializationResult youTubeInitializationResult) {
        this.e = null;
        this.g.c();
        if (this.j != null) {
            this.j.onInitializationFailure(this.h, youTubeInitializationResult);
            this.j = null;
        }
    }

    static /* synthetic */ void a(YouTubePlayerView youTubePlayerView, Activity activity) {
        try {
            youTubePlayerView.e = new s(youTubePlayerView.d, aa.a().a(activity, youTubePlayerView.d, youTubePlayerView.k));
            youTubePlayerView.f = youTubePlayerView.e.a();
            youTubePlayerView.addView(youTubePlayerView.f);
            youTubePlayerView.removeView(youTubePlayerView.g);
            youTubePlayerView.c.a(youTubePlayerView);
            if (youTubePlayerView.j == null) {
                return;
            }
            boolean z = false;
            if (youTubePlayerView.i != null) {
                z = youTubePlayerView.e.a(youTubePlayerView.i);
                youTubePlayerView.i = null;
            }
            youTubePlayerView.j.onInitializationSuccess(youTubePlayerView.h, youTubePlayerView.e, z);
            youTubePlayerView.j = null;
        } catch (w.a e) {
            y.a("Error creating YouTubePlayerView", e);
            youTubePlayerView.a(YouTubeInitializationResult.INTERNAL_ERROR);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void a() {
        if (this.e != null) {
            this.e.b();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void a(final Activity activity, YouTubePlayer.Provider provider, String str, YouTubePlayer.OnInitializedListener onInitializedListener, Bundle bundle) {
        if (this.e == null && this.j == null) {
            ab.a(activity, "activity cannot be null");
            this.h = (YouTubePlayer.Provider) ab.a(provider, "provider cannot be null");
            this.j = (YouTubePlayer.OnInitializedListener) ab.a(onInitializedListener, "listener cannot be null");
            this.i = bundle;
            this.g.b();
            this.d = aa.a().a(getContext(), str, new t.a() { // from class: com.google.android.youtube.player.YouTubePlayerView.1
                @Override // com.google.android.youtube.player.internal.t.a
                public final void a() {
                    if (YouTubePlayerView.this.d != null) {
                        YouTubePlayerView.a(YouTubePlayerView.this, activity);
                    }
                    YouTubePlayerView.this.d = null;
                }

                @Override // com.google.android.youtube.player.internal.t.a
                public final void b() {
                    if (!YouTubePlayerView.this.l && YouTubePlayerView.this.e != null) {
                        YouTubePlayerView.this.e.f();
                    }
                    YouTubePlayerView.this.g.a();
                    if (YouTubePlayerView.this.indexOfChild(YouTubePlayerView.this.g) < 0) {
                        YouTubePlayerView.this.addView(YouTubePlayerView.this.g);
                        YouTubePlayerView.this.removeView(YouTubePlayerView.this.f);
                    }
                    YouTubePlayerView.this.f = null;
                    YouTubePlayerView.this.e = null;
                    YouTubePlayerView.this.d = null;
                }
            }, new t.b() { // from class: com.google.android.youtube.player.YouTubePlayerView.2
                @Override // com.google.android.youtube.player.internal.t.b
                public final void a(YouTubeInitializationResult youTubeInitializationResult) {
                    YouTubePlayerView.this.a(youTubeInitializationResult);
                    YouTubePlayerView.this.d = null;
                }
            });
            this.d.e();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void a(boolean z) {
        if (!z || Build.VERSION.SDK_INT >= 14) {
            this.k = z;
            return;
        }
        y.a("Could not enable TextureView because API level is lower than 14", new Object[0]);
        this.k = false;
    }

    @Override // android.view.View
    public final void addFocusables(ArrayList<View> arrayList, int i) {
        ArrayList<View> arrayList2 = new ArrayList<>();
        super.addFocusables(arrayList2, i);
        arrayList.addAll(arrayList2);
        this.b.clear();
        this.b.addAll(arrayList2);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void addFocusables(ArrayList<View> arrayList, int i, int i2) {
        ArrayList<View> arrayList2 = new ArrayList<>();
        super.addFocusables(arrayList2, i, i2);
        arrayList.addAll(arrayList2);
        this.b.clear();
        this.b.addAll(arrayList2);
    }

    @Override // android.view.ViewGroup
    public final void addView(View view) {
        a(view);
        super.addView(view);
    }

    @Override // android.view.ViewGroup
    public final void addView(View view, int i) {
        a(view);
        super.addView(view, i);
    }

    @Override // android.view.ViewGroup
    public final void addView(View view, int i, int i2) {
        a(view);
        super.addView(view, i, i2);
    }

    @Override // android.view.ViewGroup
    public final void addView(View view, int i, ViewGroup.LayoutParams layoutParams) {
        a(view);
        super.addView(view, i, layoutParams);
    }

    @Override // android.view.ViewGroup, android.view.ViewManager
    public final void addView(View view, ViewGroup.LayoutParams layoutParams) {
        a(view);
        super.addView(view, layoutParams);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void b() {
        if (this.e != null) {
            this.e.c();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void b(boolean z) {
        if (this.e != null) {
            this.e.b(z);
            c(z);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void c() {
        if (this.e != null) {
            this.e.d();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void c(boolean z) {
        this.l = true;
        if (this.e != null) {
            this.e.a(z);
        }
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void clearChildFocus(View view) {
        if (hasFocusable()) {
            requestFocus();
        } else {
            super.clearChildFocus(view);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void d() {
        if (this.e != null) {
            this.e.e();
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final boolean dispatchKeyEvent(KeyEvent keyEvent) {
        if (this.e != null) {
            if (keyEvent.getAction() == 0) {
                return this.e.a(keyEvent.getKeyCode(), keyEvent) || super.dispatchKeyEvent(keyEvent);
            } else if (keyEvent.getAction() == 1) {
                return this.e.b(keyEvent.getKeyCode(), keyEvent) || super.dispatchKeyEvent(keyEvent);
            }
        }
        return super.dispatchKeyEvent(keyEvent);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final Bundle e() {
        return this.e == null ? this.i : this.e.h();
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void focusableViewAvailable(View view) {
        super.focusableViewAvailable(view);
        this.b.add(view);
    }

    @Override // com.google.android.youtube.player.YouTubePlayer.Provider
    public final void initialize(String str, YouTubePlayer.OnInitializedListener onInitializedListener) {
        ab.a(str, (Object) "Developer key cannot be null or empty");
        this.c.a(this, str, onInitializedListener);
    }

    @Override // android.view.ViewGroup, android.view.View
    protected final void onAttachedToWindow() {
        super.onAttachedToWindow();
        getViewTreeObserver().addOnGlobalFocusChangeListener(this.a);
    }

    @Override // android.view.View
    public final void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        if (this.e != null) {
            this.e.a(configuration);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    protected final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        getViewTreeObserver().removeOnGlobalFocusChangeListener(this.a);
    }

    @Override // android.view.ViewGroup, android.view.View
    protected final void onLayout(boolean z, int i, int i2, int i3, int i4) {
        if (getChildCount() > 0) {
            getChildAt(0).layout(0, 0, i3 - i, i4 - i2);
        }
    }

    @Override // android.view.View
    protected final void onMeasure(int i, int i2) {
        if (getChildCount() <= 0) {
            setMeasuredDimension(0, 0);
            return;
        }
        View childAt = getChildAt(0);
        childAt.measure(i, i2);
        setMeasuredDimension(childAt.getMeasuredWidth(), childAt.getMeasuredHeight());
    }

    @Override // android.view.View
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        super.onTouchEvent(motionEvent);
        return true;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void requestChildFocus(View view, View view2) {
        super.requestChildFocus(view, view2);
        this.b.add(view2);
    }

    @Override // android.view.ViewGroup
    public final void setClipToPadding(boolean z) {
    }

    @Override // android.view.View
    public final void setPadding(int i, int i2, int i3, int i4) {
    }
}
