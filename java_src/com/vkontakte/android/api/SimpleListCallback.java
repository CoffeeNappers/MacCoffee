package com.vkontakte.android.api;

import com.vkontakte.android.data.VKList;
import me.grishka.appkit.api.PaginatedList;
import me.grishka.appkit.fragments.BaseRecyclerFragment;
/* loaded from: classes2.dex */
public class SimpleListCallback<S> extends SimpleCallback<VKList<S>> {
    @Override // com.vkontakte.android.api.Callback
    public /* bridge */ /* synthetic */ void success(Object obj) {
        success((VKList) ((VKList) obj));
    }

    public SimpleListCallback(BaseRecyclerFragment<S> fragment) {
        super(fragment);
    }

    public void success(VKList<S> result) {
        ((BaseRecyclerFragment) this.fragment).onDataLoaded((PaginatedList) result);
    }
}
