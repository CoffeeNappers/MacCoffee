package com.vkontakte.android.api.docs;

import com.vkontakte.android.api.ResultlessAPIRequest;
import com.vkontakte.android.audio.contentprovider.AudioContentProviderConstants;
/* loaded from: classes2.dex */
public class DocsDelete extends ResultlessAPIRequest {
    public DocsDelete(int oid, int did) {
        super("docs.delete");
        param(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_OID, oid).param("owner_id", oid);
        param("did", did).param("doc_id", did);
    }
}
