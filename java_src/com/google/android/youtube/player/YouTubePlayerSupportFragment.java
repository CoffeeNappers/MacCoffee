package com.google.android.youtube.player;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.google.android.youtube.player.YouTubePlayer;
import com.google.android.youtube.player.YouTubePlayerView;
import com.google.android.youtube.player.internal.ab;
/* loaded from: classes2.dex */
public class YouTubePlayerSupportFragment extends Fragment implements YouTubePlayer.Provider {
    private final a a = new a(this, (byte) 0);
    private Bundle b;
    private YouTubePlayerView c;
    private String d;
    private YouTubePlayer.OnInitializedListener e;
    private boolean f;

    /* loaded from: classes2.dex */
    private final class a implements YouTubePlayerView.b {
        private a() {
        }

        /* synthetic */ a(YouTubePlayerSupportFragment youTubePlayerSupportFragment, byte b) {
            this();
        }

        @Override // com.google.android.youtube.player.YouTubePlayerView.b
        public final void a(YouTubePlayerView youTubePlayerView) {
        }

        @Override // com.google.android.youtube.player.YouTubePlayerView.b
        public final void a(YouTubePlayerView youTubePlayerView, String str, YouTubePlayer.OnInitializedListener onInitializedListener) {
            YouTubePlayerSupportFragment.this.initialize(str, YouTubePlayerSupportFragment.this.e);
        }
    }

    private void a() {
        if (this.c == null || this.e == null) {
            return;
        }
        this.c.a(this.f);
        this.c.a(getActivity(), this, this.d, this.e, this.b);
        this.b = null;
        this.e = null;
    }

    public static YouTubePlayerSupportFragment newInstance() {
        return new YouTubePlayerSupportFragment();
    }

    @Override // com.google.android.youtube.player.YouTubePlayer.Provider
    public void initialize(String str, YouTubePlayer.OnInitializedListener onInitializedListener) {
        this.d = ab.a(str, (Object) "Developer key cannot be null or empty");
        this.e = onInitializedListener;
        a();
    }

    @Override // android.support.v4.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.b = bundle != null ? bundle.getBundle("YouTubePlayerSupportFragment.KEY_PLAYER_VIEW_STATE") : null;
    }

    @Override // android.support.v4.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        this.c = new YouTubePlayerView(getActivity(), null, 0, this.a);
        a();
        return this.c;
    }

    @Override // android.support.v4.app.Fragment
    public void onDestroy() {
        if (this.c != null) {
            FragmentActivity activity = getActivity();
            this.c.b(activity == null || activity.isFinishing());
        }
        super.onDestroy();
    }

    @Override // android.support.v4.app.Fragment
    public void onDestroyView() {
        this.c.c(getActivity().isFinishing());
        this.c = null;
        super.onDestroyView();
    }

    @Override // android.support.v4.app.Fragment
    public void onPause() {
        this.c.c();
        super.onPause();
    }

    @Override // android.support.v4.app.Fragment
    public void onResume() {
        super.onResume();
        this.c.b();
    }

    @Override // android.support.v4.app.Fragment
    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putBundle("YouTubePlayerSupportFragment.KEY_PLAYER_VIEW_STATE", this.c != null ? this.c.e() : this.b);
    }

    @Override // android.support.v4.app.Fragment
    public void onStart() {
        super.onStart();
        this.c.a();
    }

    @Override // android.support.v4.app.Fragment
    public void onStop() {
        this.c.d();
        super.onStop();
    }
}