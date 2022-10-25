package com.vkontakte.android.api.apps;

import android.os.Looper;
import android.support.annotation.NonNull;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ApiApplication;
import com.vkontakte.android.data.CatalogInfo;
import com.vkontakte.android.data.VKList;
import java.util.ArrayList;
import java.util.Iterator;
/* loaded from: classes2.dex */
public abstract class CatalogLoader implements Callback<VKList<ApiApplication>> {
    private static final int DEFAULT_COUNT = 10;
    private final ArrayList<ApiApplication> applications;
    private boolean bypassHtmlGames;
    private volatile boolean canLoadMore;
    @NonNull
    private final CatalogInfo catalogInfo;
    private final int count;
    private volatile VKAPIRequest currentRequest;
    private volatile boolean isLoading;

    public abstract void onLoadedNextPage(ArrayList<ApiApplication> arrayList, boolean z);

    /* JADX INFO: Access modifiers changed from: protected */
    public CatalogLoader(int titleRes, @NonNull ArrayList<ApiApplication> application, @NonNull CatalogInfo.FilterType filterType) {
        this.canLoadMore = true;
        this.isLoading = false;
        this.applications = new ArrayList<>();
        this.bypassHtmlGames = false;
        this.applications.addAll(application);
        this.catalogInfo = new CatalogInfo(titleRes, filterType);
        this.count = application.size() > 0 ? application.size() : 10;
        processApps(application);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public CatalogLoader(int titleRes, @NonNull ArrayList<ApiApplication> application, @NonNull CatalogInfo.FilterType filterType, String platform) {
        this(titleRes, application, filterType);
        this.catalogInfo.platform = platform;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public CatalogLoader(@NonNull ArrayList<ApiApplication> application, @NonNull CatalogInfo catalogInfo, boolean bypassHtmlGames) {
        this.canLoadMore = true;
        this.isLoading = false;
        this.applications = new ArrayList<>();
        this.bypassHtmlGames = false;
        this.applications.addAll(application);
        this.catalogInfo = catalogInfo;
        this.count = application.size() > 0 ? application.size() : 10;
        this.bypassHtmlGames = bypassHtmlGames;
        processApps(application);
    }

    public void updateApiApplication(ApiApplication apiApplication) {
        int index = this.applications.indexOf(apiApplication);
        if (index >= 0 && index < this.applications.size()) {
            this.applications.set(index, apiApplication);
        }
    }

    public boolean forceLoadNextPage() {
        if (!this.isLoading && this.canLoadMore) {
            this.isLoading = true;
            if (this.catalogInfo.hasGenreId()) {
                this.currentRequest = new AppsGetCatalog(this.catalogInfo.getServerKey(), this.catalogInfo.genre_id, this.applications.size(), this.count, this.catalogInfo.platform).setCallback(this).exec(Looper.getMainLooper());
            } else {
                this.currentRequest = new AppsGetCatalog(this.catalogInfo.getServerKey(), this.applications.size(), this.count, this.catalogInfo.platform).setCallback(this).exec(Looper.getMainLooper());
            }
            return true;
        }
        return false;
    }

    private void processApps(ArrayList<ApiApplication> application) {
        Iterator<ApiApplication> it = application.iterator();
        while (it.hasNext()) {
            ApiApplication apiApplication = it.next();
            apiApplication.catalogInfo = this.catalogInfo;
            if (this.catalogInfo.filterType == CatalogInfo.FilterType.installed) {
                apiApplication.installed = true;
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.vkontakte.android.api.Callback
    public void success(VKList<ApiApplication> result) {
        boolean z = false;
        processApps(result);
        this.isLoading = false;
        if (result.size() >= this.count) {
            z = true;
        }
        this.canLoadMore = z;
        for (int i = 0; i < result.size(); i++) {
            if (!this.bypassHtmlGames || !((ApiApplication) result.get(i)).isHtml5App) {
                this.applications.add(result.get(i));
            }
        }
        onLoadedNextPage(this.applications, this.canLoadMore);
    }

    @Override // com.vkontakte.android.api.Callback
    public void fail(VKAPIRequest.VKErrorResponse error) {
        this.isLoading = false;
        this.canLoadMore = false;
        onLoadedNextPage(this.applications, this.canLoadMore);
    }
}
