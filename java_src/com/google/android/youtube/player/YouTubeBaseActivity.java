package com.google.android.youtube.player;

import android.app.Activity;
import android.os.Bundle;
import com.google.android.youtube.player.YouTubePlayer;
import com.google.android.youtube.player.YouTubePlayerView;
/* loaded from: classes2.dex */
public class YouTubeBaseActivity extends Activity {
    private a a;
    private YouTubePlayerView b;
    private int c;
    private Bundle d;

    /* loaded from: classes2.dex */
    private final class a implements YouTubePlayerView.b {
        private a() {
        }

        /* synthetic */ a(YouTubeBaseActivity youTubeBaseActivity, byte b) {
            this();
        }

        @Override // com.google.android.youtube.player.YouTubePlayerView.b
        public final void a(YouTubePlayerView youTubePlayerView) {
            if (YouTubeBaseActivity.this.b != null && YouTubeBaseActivity.this.b != youTubePlayerView) {
                YouTubeBaseActivity.this.b.c(true);
            }
            YouTubeBaseActivity.this.b = youTubePlayerView;
            if (YouTubeBaseActivity.this.c > 0) {
                youTubePlayerView.a();
            }
            if (YouTubeBaseActivity.this.c >= 2) {
                youTubePlayerView.b();
            }
        }

        @Override // com.google.android.youtube.player.YouTubePlayerView.b
        public final void a(YouTubePlayerView youTubePlayerView, String str, YouTubePlayer.OnInitializedListener onInitializedListener) {
            youTubePlayerView.a(YouTubeBaseActivity.this, youTubePlayerView, str, onInitializedListener, YouTubeBaseActivity.this.d);
            YouTubeBaseActivity.this.d = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final YouTubePlayerView.b a() {
        return this.a;
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.a = new a(this, (byte) 0);
        this.d = bundle != null ? bundle.getBundle("YouTubeBaseActivity.KEY_PLAYER_VIEW_STATE") : null;
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        if (this.b != null) {
            this.b.b(isFinishing());
        }
        super.onDestroy();
    }

    @Override // android.app.Activity
    protected void onPause() {
        this.c = 1;
        if (this.b != null) {
            this.b.c();
        }
        super.onPause();
    }

    @Override // android.app.Activity
    protected void onResume() {
        super.onResume();
        this.c = 2;
        if (this.b != null) {
            this.b.b();
        }
    }

    @Override // android.app.Activity
    protected void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putBundle("YouTubeBaseActivity.KEY_PLAYER_VIEW_STATE", this.b != null ? this.b.e() : this.d);
    }

    @Override // android.app.Activity
    protected void onStart() {
        super.onStart();
        this.c = 1;
        if (this.b != null) {
            this.b.a();
        }
    }

    @Override // android.app.Activity
    protected void onStop() {
        this.c = 0;
        if (this.b != null) {
            this.b.d();
        }
        super.onStop();
    }
}
