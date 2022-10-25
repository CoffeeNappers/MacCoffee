package com.vkontakte.android.api.docs;

import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.vkontakte.android.api.ResultlessAPIRequest;
import com.vkontakte.android.audio.contentprovider.AudioContentProviderConstants;
/* loaded from: classes2.dex */
public class DocsAdd extends ResultlessAPIRequest {
    public DocsAdd(int oid, int did, @Nullable String accessKey) {
        super("docs.add");
        param(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_OID, oid).param("owner_id", oid);
        param("did", did).param("doc_id", did);
        if (!TextUtils.isEmpty(accessKey)) {
            param("access_key", accessKey);
        }
    }
}
