package com.vkontakte.android.api.audio;

import android.text.TextUtils;
import com.google.android.exoplayer2.util.MimeTypes;
import com.vkontakte.android.api.ResultlessAPIRequest;
import com.vkontakte.android.audio.MusicTrack;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class AudioSetBroadcast extends ResultlessAPIRequest {
    public AudioSetBroadcast(MusicTrack file, ArrayList<Integer> targets) {
        super("audio.setBroadcast");
        if (file != null) {
            param(MimeTypes.BASE_TYPE_AUDIO, file.oid + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + file.aid);
        }
        param("target_ids", TextUtils.join(",", targets));
    }
}
