package com.google.android.youtube.player;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.ImageView;
import com.google.android.youtube.player.internal.aa;
import com.google.android.youtube.player.internal.ab;
import com.google.android.youtube.player.internal.b;
import com.google.android.youtube.player.internal.t;
/* loaded from: classes2.dex */
public final class YouTubeThumbnailView extends ImageView {
    private b a;
    private com.google.android.youtube.player.internal.a b;

    /* loaded from: classes2.dex */
    public interface OnInitializedListener {
        void onInitializationFailure(YouTubeThumbnailView youTubeThumbnailView, YouTubeInitializationResult youTubeInitializationResult);

        void onInitializationSuccess(YouTubeThumbnailView youTubeThumbnailView, YouTubeThumbnailLoader youTubeThumbnailLoader);
    }

    /* loaded from: classes2.dex */
    private static final class a implements t.a, t.b {
        private YouTubeThumbnailView a;
        private OnInitializedListener b;

        public a(YouTubeThumbnailView youTubeThumbnailView, OnInitializedListener onInitializedListener) {
            this.a = (YouTubeThumbnailView) ab.a(youTubeThumbnailView, "thumbnailView cannot be null");
            this.b = (OnInitializedListener) ab.a(onInitializedListener, "onInitializedlistener cannot be null");
        }

        private void c() {
            if (this.a != null) {
                this.a.a = null;
                this.a = null;
                this.b = null;
            }
        }

        @Override // com.google.android.youtube.player.internal.t.a
        public final void a() {
            if (this.a == null || this.a.a == null) {
                return;
            }
            this.a.b = aa.a().a(this.a.a, this.a);
            this.b.onInitializationSuccess(this.a, this.a.b);
            c();
        }

        @Override // com.google.android.youtube.player.internal.t.b
        public final void a(YouTubeInitializationResult youTubeInitializationResult) {
            this.b.onInitializationFailure(this.a, youTubeInitializationResult);
            c();
        }

        @Override // com.google.android.youtube.player.internal.t.a
        public final void b() {
            c();
        }
    }

    public YouTubeThumbnailView(Context context) {
        this(context, null);
    }

    public YouTubeThumbnailView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public YouTubeThumbnailView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    protected final void finalize() throws Throwable {
        if (this.b != null) {
            this.b.b();
            this.b = null;
        }
        super.finalize();
    }

    public final void initialize(String str, OnInitializedListener onInitializedListener) {
        a aVar = new a(this, onInitializedListener);
        this.a = aa.a().a(getContext(), str, aVar, aVar);
        this.a.e();
    }
}
