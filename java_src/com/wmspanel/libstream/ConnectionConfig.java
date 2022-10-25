package com.wmspanel.libstream;

import com.wmspanel.libstream.Streamer;
/* loaded from: classes3.dex */
public class ConnectionConfig {
    public String password;
    public String uri;
    public String username;
    public Streamer.MODE mode = Streamer.MODE.AUDIO_VIDEO;
    public Streamer.AUTH auth = Streamer.AUTH.DEFAULT;
}
