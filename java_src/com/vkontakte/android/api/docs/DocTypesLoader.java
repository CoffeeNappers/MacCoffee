package com.vkontakte.android.api.docs;

import android.os.Looper;
import android.support.annotation.NonNull;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.Document;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.VKList;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public abstract class DocTypesLoader implements Callback<VKList<Document>> {
    private static final int DEFAULT_COUNT = 20;
    private final int count;
    volatile VKAPIRequest currentRequest;
    private final int ownerId;
    private final int typeId;
    volatile boolean canLoadMore = true;
    volatile boolean isLoading = false;
    private final ArrayList<Document> documents = new ArrayList<>();

    public abstract void onLoadedNextPage(ArrayList<Document> arrayList, boolean z);

    public DocTypesLoader(@NonNull ArrayList<Document> documents, int typeId, int ownerId) {
        this.documents.addAll(documents);
        this.typeId = typeId;
        this.count = documents.size() > 0 ? documents.size() : 20;
        this.ownerId = ownerId;
    }

    public boolean forceLoadNextPage() {
        if (this.isLoading || !this.canLoadMore) {
            return false;
        }
        this.isLoading = true;
        this.currentRequest = new DocsGet(this.ownerId, this.documents.size(), this.count, this.typeId).setCallback(this).exec(Looper.getMainLooper());
        return true;
    }

    @Override // com.vkontakte.android.api.Callback
    public void success(VKList<Document> result) {
        boolean z = false;
        this.isLoading = false;
        if (result.size() >= this.count) {
            z = true;
        }
        this.canLoadMore = z;
        this.documents.addAll(result);
        onLoadedNextPage(this.documents, this.canLoadMore);
    }

    @Override // com.vkontakte.android.api.Callback
    public void fail(VKAPIRequest.VKErrorResponse error) {
        this.isLoading = false;
        this.canLoadMore = false;
        onLoadedNextPage(this.documents, this.canLoadMore);
    }
}
