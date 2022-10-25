package com.vkontakte.android.audio.player.exo;

import com.google.android.exoplayer2.upstream.DataSource;
import com.google.android.exoplayer2.upstream.HttpDataSource;
import com.google.android.exoplayer2.upstream.TransferListener;
import okhttp3.CacheControl;
import okhttp3.Call;
/* loaded from: classes2.dex */
public final class AudioOkHttpDataSourceFactory implements HttpDataSource.Factory {
    private final CacheControl cacheControl;
    private final Call.Factory callFactory;
    private final TransferListener<? super DataSource> listener;
    private final String userAgent;

    public AudioOkHttpDataSourceFactory(Call.Factory callFactory, String userAgent, TransferListener<? super DataSource> listener) {
        this(callFactory, userAgent, listener, null);
    }

    private AudioOkHttpDataSourceFactory(Call.Factory callFactory, String userAgent, TransferListener<? super DataSource> listener, CacheControl cacheControl) {
        this.callFactory = callFactory;
        this.userAgent = userAgent;
        this.listener = listener;
        this.cacheControl = cacheControl;
    }

    @Override // com.google.android.exoplayer2.upstream.HttpDataSource.Factory, com.google.android.exoplayer2.upstream.DataSource.Factory
    /* renamed from: createDataSource */
    public AudioOkHttpDataSource mo949createDataSource() {
        return new AudioOkHttpDataSource(this.callFactory, this.userAgent, null, this.listener, this.cacheControl);
    }

    @Override // com.google.android.exoplayer2.upstream.HttpDataSource.Factory
    public void setDefaultRequestProperty(String name, String value) {
    }

    @Override // com.google.android.exoplayer2.upstream.HttpDataSource.Factory
    public void clearDefaultRequestProperty(String name) {
    }

    @Override // com.google.android.exoplayer2.upstream.HttpDataSource.Factory
    public void clearAllDefaultRequestProperties() {
    }
}
