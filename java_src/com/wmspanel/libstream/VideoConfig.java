package com.wmspanel.libstream;

import android.media.MediaCodecInfo;
import com.wmspanel.libstream.Streamer;
/* loaded from: classes3.dex */
public class VideoConfig {
    public int bitRate = 2000000;
    public float fps = 30.0f;
    public int keyFrameInterval = 2;
    public Streamer.Size videoSize = null;
    public MediaCodecInfo.CodecProfileLevel profileLevel = null;
}
