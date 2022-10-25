package com.danikula.videocache.sourcestorage;

import com.danikula.videocache.SourceInfo;
/* loaded from: classes.dex */
public class NoSourceInfoStorage implements SourceInfoStorage {
    @Override // com.danikula.videocache.sourcestorage.SourceInfoStorage
    public SourceInfo get(String url) {
        return null;
    }

    @Override // com.danikula.videocache.sourcestorage.SourceInfoStorage
    public void put(String url, SourceInfo sourceInfo) {
    }

    @Override // com.danikula.videocache.sourcestorage.SourceInfoStorage
    public void release() {
    }
}
