package com.vkontakte.android.audio.player.exo;

import android.content.Context;
import com.google.android.exoplayer2.upstream.DataSource;
import com.google.android.exoplayer2.upstream.TransferListener;
/* loaded from: classes2.dex */
public final class AudioDataSourceFactory implements DataSource.Factory {
    private final DataSource.Factory baseDataSourceFactory;
    private final Context context;
    private final TransferListener<? super DataSource> listener;

    public AudioDataSourceFactory(Context context, TransferListener<? super DataSource> listener, DataSource.Factory baseDataSourceFactory) {
        this.context = context.getApplicationContext();
        this.listener = listener;
        this.baseDataSourceFactory = baseDataSourceFactory;
    }

    @Override // com.google.android.exoplayer2.upstream.DataSource.Factory
    /* renamed from: createDataSource  reason: collision with other method in class */
    public AudioDataSource mo949createDataSource() {
        return new AudioDataSource(this.context, this.listener, this.baseDataSourceFactory.mo949createDataSource());
    }
}
