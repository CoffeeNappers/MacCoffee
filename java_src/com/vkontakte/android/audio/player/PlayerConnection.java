package com.vkontakte.android.audio.player;

import android.content.Intent;
import com.vkontakte.android.audio.utils.BoundServiceConnection;
/* loaded from: classes2.dex */
public class PlayerConnection extends BoundServiceConnection<PlayerService> {
    private boolean mDisconnectNeeded;
    private final PlayerConnectionListener mListener;

    public PlayerConnection(PlayerConnectionListener listener) {
        super(listener);
        this.mListener = listener;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.audio.utils.BoundServiceConnection
    public void finalize() throws Throwable {
        super.finalize();
    }

    @Override // com.vkontakte.android.audio.utils.BoundServiceConnection
    protected Intent createStartIntent() {
        return new Intent(getContext(), PlayerService.class);
    }

    @Override // com.vkontakte.android.audio.utils.BoundServiceConnection
    protected Intent createBindIntent() {
        return new Intent(getContext(), PlayerService.class);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.audio.utils.BoundServiceConnection
    public void onConnect() {
        super.onConnect();
        this.mDisconnectNeeded = true;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.audio.utils.BoundServiceConnection
    public void onConnected() {
        super.onConnected();
        if (this.mListener != null) {
            getPlayer().registerListener(this.mListener);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.audio.utils.BoundServiceConnection
    public void onDisconnect() {
        Player player;
        if (this.mListener != null && (player = getPlayer()) != null) {
            player.unregisterListener(this.mListener);
        }
        super.onDisconnect();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.audio.utils.BoundServiceConnection
    public void onDisconnected() {
        this.mDisconnectNeeded = false;
        super.onDisconnected();
    }

    public Player getPlayer() {
        PlayerService service = getService();
        if (service == null) {
            return null;
        }
        return service.getPlayer();
    }

    public SavedTracks getSavedTracks() {
        PlayerService service = getService();
        if (service == null) {
            return null;
        }
        return service.getSavedTracks();
    }
}
