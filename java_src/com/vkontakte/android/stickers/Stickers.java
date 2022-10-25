package com.vkontakte.android.stickers;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.database.sqlite.SQLiteException;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.util.Log;
import com.facebook.share.internal.ShareConstants;
import com.vk.analytics.Analytics;
import com.vkontakte.android.NetworkStateReceiver;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.APIUtils;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.JSONArrayWithCount;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.models.PaymentType;
import com.vkontakte.android.api.store.StoreHasNewItems;
import com.vkontakte.android.api.store.StoreMarkAsViewed;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.PurchasesManager;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.orm.StickerStockItem;
import com.vkontakte.android.data.orm.StickersDictionaryItem;
import com.vkontakte.android.functions.F1;
import com.vkontakte.android.functions.F2;
import com.vkontakte.android.orm.EntityManager;
import com.vkontakte.android.orm.Order;
import com.vkontakte.android.orm.Query;
import io.reactivex.Observable;
import io.reactivex.functions.Consumer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes3.dex */
public class Stickers {
    public static final String ACTION_STICKERS_DOWNLOAD_PROGRESS = "com.vkontakte.android.STICKERS_DOWNLOAD_PROGRESS";
    public static final String ACTION_STICKERS_NUM_NEW_ITEMS = "com.vkontakte.android.STICKERS_NUM_NEW_ITEMS";
    public static final String ACTION_STICKERS_NUM_UPDATES = "com.vkontakte.android.STICKERS_NUM_UPDATES";
    public static final String ACTION_STICKERS_RECENT = "com.vkontakte.android.STICKERS_UPDATED_RECENTS";
    public static final String ACTION_STICKERS_RELOADED = "com.vkontakte.android.STICKERS_RELOADED";
    public static final String ACTION_STICKERS_UPDATED = "com.vkontakte.android.STICKERS_UPDATED";
    public static final String EXTRA_ITEM = "item";
    public static final String PREFS_SUGGESTS_ENABLED = "suggests_enabled";
    private static final String PREF_AUTO_SUGGEST_LAST_LOADED_TIMESPAMP = "auto_suggest_last_loaded";
    private static final String PREF_NUM_GLOBAL_PROMOTIONS = "num_global_promotions";
    private static final String PREF_NUM_NEW_ITEMS = "num_new_items";
    private static final String PREF_RECENT_STICKERS = "base_url";
    private static final String PREF_STICKERS_HASH = "stickers_hash";
    private static final int RECENTS_MAX_SIZE = 32;
    private static final String SHARED_PREFERENCE = "stickers";
    private static final long STICKERS_UPDATE_REQUEST_MIN_PERIOD_MS = 10000;
    private static final List<?> STUB_LIST = Collections.emptyList();
    private static volatile Stickers sInstance;
    private long lastStickerUpdateRequest;
    private final Context mContext;
    private volatile Data mData;
    private final EntityManager mManager;
    private final SharedPreferences mPrefs;
    private volatile StickersAutoSuggestDictionary mStickersAutoSuggestDictionary;
    private boolean mSuggestsEnabled;
    private final Handler mUIHandler = new Handler(Looper.getMainLooper());
    private final Object mWriteLock = new Object();
    private int mNumNewItems = -1;
    private int mNumGlobalPromotions = -1;

    private Stickers(Context context) {
        this.mContext = context.getApplicationContext();
        this.mManager = new EntityManager(this.mContext);
        this.mPrefs = this.mContext.getSharedPreferences(SHARED_PREFERENCE, 0);
        this.mSuggestsEnabled = this.mPrefs.getBoolean(PREFS_SUGGESTS_ENABLED, true);
        initCache();
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [com.vkontakte.android.stickers.Stickers$1] */
    private void initCache() {
        new Thread() { // from class: com.vkontakte.android.stickers.Stickers.1
            {
                Stickers.this = this;
            }

            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                List<StickerStockItem> items;
                synchronized (Stickers.this.mWriteLock) {
                    Data data = new Data();
                    try {
                        items = Stickers.this.mManager.createQuery(StickerStockItem.class).orderBy("user_order", Order.ASC).load();
                    } catch (Exception e) {
                        items = null;
                    }
                    if (items != null) {
                        for (StickerStockItem item : items) {
                            data.add(item);
                        }
                    }
                    data.fillRecents(Stickers.this.mPrefs.getString(Stickers.PREF_RECENT_STICKERS, ""));
                    Stickers.this.mData = data;
                    Stickers.this.mStickersAutoSuggestDictionary = StickersAutoSuggestDictionary.createInstance();
                    Stickers.this.reload();
                }
                Stickers.this.broadcastReloaded();
            }
        }.start();
    }

    public void broadcastReloaded() {
        this.mContext.sendBroadcast(new Intent(ACTION_STICKERS_RELOADED), "com.vkontakte.android.permission.ACCESS_DATA");
    }

    public static Stickers get(Context context) {
        Stickers localInstance = sInstance;
        if (localInstance == null) {
            synchronized (Stickers.class) {
                try {
                    localInstance = sInstance;
                    if (localInstance == null) {
                        Stickers localInstance2 = new Stickers(context);
                        try {
                            sInstance = localInstance2;
                            localInstance = localInstance2;
                        } catch (Throwable th) {
                            th = th;
                            throw th;
                        }
                    }
                } catch (Throwable th2) {
                    th = th2;
                }
            }
        }
        return localInstance;
    }

    public static Stickers get() {
        return get(VKApplication.context);
    }

    public void checkServerUpdates() {
        Consumer<? super Throwable> consumer;
        if (SystemClock.elapsedRealtime() - this.lastStickerUpdateRequest > STICKERS_UPDATE_REQUEST_MIN_PERIOD_MS) {
            this.lastStickerUpdateRequest = SystemClock.elapsedRealtime();
            Observable<StoreHasNewItems.Response> observable = new StoreHasNewItems().toObservable();
            Consumer<? super StoreHasNewItems.Response> lambdaFactory$ = Stickers$$Lambda$1.lambdaFactory$(this);
            consumer = Stickers$$Lambda$2.instance;
            observable.subscribe(lambdaFactory$, consumer);
        }
    }

    public /* synthetic */ void lambda$checkServerUpdates$1(StoreHasNewItems.Response o) throws Exception {
        setNewItems(o.storeNewItems);
        setGlobalPromotions(o.globalPromotion);
        String storedHash = getStickersHash();
        if (!TextUtils.isEmpty(o.stickersVersionHash) && !o.stickersVersionHash.equals(storedHash)) {
            reload(Stickers$$Lambda$7.lambdaFactory$(this, o));
        }
    }

    public /* synthetic */ void lambda$null$0(StoreHasNewItems.Response o) {
        setStickersHash(o.stickersVersionHash);
    }

    public static /* synthetic */ void lambda$checkServerUpdates$2(Throwable ignoredThrowable) throws Exception {
    }

    public List<StickerStockItem> getPromotedStickers() {
        return (this.mData == null || this.mData.promotedStickers == null) ? STUB_LIST : this.mData.promotedStickers;
    }

    public List<StickerStockItem> getActivatedStickers() {
        return (this.mData == null || this.mData.activatedStickers == null) ? STUB_LIST : this.mData.activatedStickers;
    }

    public StickersDictionaryItem getAutoSuggestStickersFor(String str) {
        if (this.mStickersAutoSuggestDictionary == null || !this.mSuggestsEnabled || !NetworkStateReceiver.isConnected()) {
            return null;
        }
        StickersDictionaryItem item = this.mStickersAutoSuggestDictionary.getAutoSuggestStickersFor(str);
        if (item != null && item.user_stickers != null && item.user_stickers.length > 0) {
            int[] sortedUserStickers = new int[item.user_stickers.length];
            int k = 0;
            List<RecentSticker> recentStickers = getRecent();
            for (int i = 0; i < recentStickers.size(); i++) {
                for (int j = 0; j < item.user_stickers.length; j++) {
                    if (item.user_stickers[j] == recentStickers.get(i).mId) {
                        sortedUserStickers[k] = item.user_stickers[j];
                        k++;
                        item.user_stickers[j] = 0;
                    }
                }
            }
            for (int i2 = 0; i2 < item.user_stickers.length; i2++) {
                if (item.user_stickers[i2] != 0) {
                    sortedUserStickers[k] = item.user_stickers[i2];
                    k++;
                }
            }
            item.user_stickers = sortedUserStickers;
            return item;
        }
        return item;
    }

    public void reloadAutoSuggestDictionaryIfNeeded(boolean force) {
        boolean exprired = System.currentTimeMillis() - this.mPrefs.getLong(PREF_AUTO_SUGGEST_LAST_LOADED_TIMESPAMP, 0L) > 43200000;
        Log.v("Stickers", "reloadAutoSuggestDictionaryIfNeeded force = " + force + ", expired = " + exprired);
        if (exprired || force) {
            new GetAutoSuggestDictionaryRequest().setCallback(new Callback<JSONObject>() { // from class: com.vkontakte.android.stickers.Stickers.2
                {
                    Stickers.this = this;
                }

                @Override // com.vkontakte.android.api.Callback
                public void success(JSONObject result) {
                    synchronized (Stickers.this.mWriteLock) {
                        Stickers.this.mStickersAutoSuggestDictionary.initializeWithJsonAndSave(result);
                        SharedPreferences.Editor editor = Stickers.this.mPrefs.edit();
                        editor.putLong(Stickers.PREF_AUTO_SUGGEST_LAST_LOADED_TIMESPAMP, System.currentTimeMillis());
                        editor.commit();
                    }
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                }
            }).exec();
        }
    }

    public void reload() {
        reload(null);
    }

    public void reload(@Nullable final Runnable runAfter) {
        if (VKAccountManager.getCurrent().isReal()) {
            new GetInfo(this).setCallback(new Callback<Data>() { // from class: com.vkontakte.android.stickers.Stickers.3
                {
                    Stickers.this = this;
                }

                @Override // com.vkontakte.android.api.Callback
                public void success(Data result) {
                    boolean areEqual;
                    try {
                        synchronized (Stickers.this.mWriteLock) {
                            areEqual = Stickers.this.compareStickersData(Stickers.this.mData, result);
                            Stickers.this.mData = result;
                            Stickers.this.mManager.beginTransaction();
                            try {
                                Stickers.this.mManager.save((Collection) Stickers.this.mData.allStickers.values());
                                SharedPreferences.Editor editor = Stickers.this.mPrefs.edit();
                                editor.putString(Stickers.PREF_RECENT_STICKERS, Stickers.this.mData.serializeRecents());
                                editor.putBoolean("readFromCompat", false);
                                editor.commit();
                                Stickers.this.mManager.commit();
                            } catch (Throwable th) {
                                Stickers.this.mManager.rollback();
                            }
                        }
                        if (runAfter != null) {
                            Stickers.this.mUIHandler.post(runAfter);
                        }
                        Stickers.this.broadcastReloaded();
                        if (!areEqual) {
                            Stickers.this.reloadAutoSuggestDictionaryIfNeeded(true);
                        }
                    } catch (SQLiteException e) {
                        Analytics.logException(e);
                        Log.e("Stickers", "Cannot reload stickers", e);
                    }
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    if (error.getCodeValue() == -1) {
                        Stickers.this.reload(runAfter);
                    }
                }
            }).exec();
        }
    }

    public boolean compareStickersData(Data oldData, Data newData) {
        if (oldData == null || newData == null) {
            return false;
        }
        if (oldData.activatedStickers.size() != newData.activatedStickers.size()) {
            return false;
        }
        for (int i = 0; i < oldData.activatedStickers.size(); i++) {
            if (oldData.activatedStickers.get(i).id != newData.activatedStickers.get(i).id) {
                return false;
            }
        }
        return true;
    }

    public void purchase(StickerStockItem item) {
        synchronized (this.mWriteLock) {
            int[] idsToUpdate = null;
            this.mData.allStickers.put(Integer.valueOf(item.id), item);
            if (item.active) {
                item.order = 0;
                idsToUpdate = new int[this.mData.activatedStickers.size()];
                this.mData.activatedStickers.add(0, item);
                for (int i = 1; i < this.mData.activatedStickers.size(); i++) {
                    idsToUpdate[i - 1] = this.mData.activatedStickers.get(i).id;
                }
            }
            this.mData.promotedStickers.remove(item);
            this.mManager.beginTransaction();
            this.mManager.save((EntityManager) item);
            this.mManager.createQuery(StickerStockItem.class).where("id").in(idsToUpdate).rawUpdate("user_order", "`user_order` + 1");
            this.mManager.commit();
        }
        broadcastUpdate(item);
        reloadAutoSuggestDictionaryIfNeeded(true);
    }

    public void setActive(StickerStockItem item, boolean activate) {
        synchronized (this.mWriteLock) {
            item.active = activate;
            this.mData.allStickers.put(Integer.valueOf(item.id), item);
            if (activate) {
                item.order = this.mData.activatedStickers.size();
                this.mData.activatedStickers.add(item.order, item);
            } else {
                item.order = 0;
                this.mData.activatedStickers.remove(item);
            }
            this.mManager.beginTransaction();
            this.mManager.createQuery(StickerStockItem.class).where("id").isEqualTo(Integer.valueOf(item.id)).update("active", Boolean.valueOf(activate), "user_order", Integer.valueOf(item.order));
            this.mManager.commit();
        }
        broadcastUpdate(item);
        resetLastLoadedTimestampForDeferredReload();
    }

    public void swap(int newPosition, int oldPosition) {
        int start;
        int end;
        boolean movedToTop = newPosition < oldPosition;
        if (movedToTop) {
            start = newPosition + 1;
            end = oldPosition + 1;
        } else {
            start = oldPosition;
            end = newPosition;
        }
        synchronized (this.mWriteLock) {
            StickerStockItem item = this.mData.activatedStickers.remove(oldPosition);
            this.mData.activatedStickers.add(newPosition, item);
            item.order = newPosition;
            int[] idsToUpdate = new int[end - start];
            for (int i = 0; i < idsToUpdate.length; i++) {
                int location = i + start;
                StickerStockItem entry = this.mData.activatedStickers.get(location);
                entry.order = location;
                idsToUpdate[i] = entry.id;
            }
            this.mManager.beginTransaction();
            this.mManager.createQuery(StickerStockItem.class).where("id").isEqualTo(Integer.valueOf(item.id)).update("user_order", Integer.valueOf(item.order));
            Query in = this.mManager.createQuery(StickerStockItem.class).where("id").in(idsToUpdate);
            Object[] objArr = new Object[2];
            objArr[0] = "user_order";
            objArr[1] = movedToTop ? "`user_order` + 1" : "`user_order` - 1";
            in.rawUpdate(objArr);
            this.mManager.commit();
            broadcastReloaded();
        }
        resetLastLoadedTimestampForDeferredReload();
    }

    private void resetLastLoadedTimestampForDeferredReload() {
        SharedPreferences.Editor editor = this.mPrefs.edit();
        editor.putLong(PREF_AUTO_SUGGEST_LAST_LOADED_TIMESPAMP, 0L);
        editor.commit();
    }

    public void clearAll() {
        synchronized (this.mWriteLock) {
            if (this.mData != null) {
                this.mData.clearAll();
            }
            if (this.mStickersAutoSuggestDictionary != null) {
                try {
                    this.mStickersAutoSuggestDictionary.clearAndSave();
                } catch (Exception e) {
                    Log.e("Stickers", e.getMessage());
                }
            }
            resetLastLoadedTimestampForDeferredReload();
            synchronized (this.mWriteLock) {
                this.mManager.beginTransaction();
                try {
                    int count = this.mManager.createQuery(StickerStockItem.class).delete();
                    this.mManager.commit();
                    Log.d("STICKERS", "DELETED " + count + " rows");
                } catch (Throwable th) {
                    this.mManager.rollback();
                }
            }
            broadcastReloaded();
        }
    }

    public int getNewItems() {
        if (this.mNumNewItems == -1) {
            this.mNumNewItems = this.mPrefs.getInt(PREF_NUM_NEW_ITEMS, 0);
        }
        return this.mNumNewItems;
    }

    public int getGlobalPromotions() {
        if (this.mNumGlobalPromotions == -1) {
            this.mNumGlobalPromotions = this.mPrefs.getInt(PREF_NUM_GLOBAL_PROMOTIONS, 0);
        }
        return this.mNumGlobalPromotions;
    }

    public String getStickersHash() {
        String string;
        synchronized (this.mWriteLock) {
            string = this.mPrefs.getString(PREF_STICKERS_HASH, "");
        }
        return string;
    }

    public void setNewItems(int numNewItems) {
        if (numNewItems != this.mNumNewItems) {
            synchronized (this.mWriteLock) {
                this.mNumNewItems = numNewItems;
                this.mPrefs.edit().putInt(PREF_NUM_NEW_ITEMS, this.mNumNewItems).commit();
                broadcastNumNewItems();
            }
        }
    }

    public void setGlobalPromotions(int value) {
        if (value != this.mNumGlobalPromotions) {
            synchronized (this.mWriteLock) {
                this.mNumGlobalPromotions = value;
                this.mPrefs.edit().putInt(PREF_NUM_GLOBAL_PROMOTIONS, this.mNumGlobalPromotions).commit();
                broadcastNumUpdates();
            }
        }
    }

    public void setStickersHash(String value) {
        synchronized (this.mWriteLock) {
            this.mPrefs.edit().putString(PREF_STICKERS_HASH, value).apply();
        }
    }

    public void markNewItemsAsViewed() {
        Consumer<? super Throwable> consumer;
        if (getNewItems() > 0) {
            Observable<Boolean> observable = StoreMarkAsViewed.markNewItemsAsViewed().toObservable();
            Consumer<? super Boolean> lambdaFactory$ = Stickers$$Lambda$3.lambdaFactory$(this);
            consumer = Stickers$$Lambda$4.instance;
            observable.subscribe(lambdaFactory$, consumer);
        }
    }

    public static /* synthetic */ void lambda$markNewItemsAsViewed$4(Throwable throwable) throws Exception {
    }

    public /* synthetic */ void lambda$markNewItemsAsViewed$3(Object o) throws Exception {
        setNewItems(0);
    }

    public void markGlobalPromotionsAsViewed() {
        Consumer<? super Throwable> consumer;
        if (getGlobalPromotions() > 0) {
            Observable<Boolean> observable = StoreMarkAsViewed.markGlobalPromotionAsViewed().toObservable();
            Consumer<? super Boolean> lambdaFactory$ = Stickers$$Lambda$5.lambdaFactory$(this);
            consumer = Stickers$$Lambda$6.instance;
            observable.subscribe(lambdaFactory$, consumer);
        }
    }

    public static /* synthetic */ void lambda$markGlobalPromotionsAsViewed$6(Throwable throwable) throws Exception {
    }

    public /* synthetic */ void lambda$markGlobalPromotionsAsViewed$5(Object o) throws Exception {
        setGlobalPromotions(0);
    }

    public void addRecent(int id, int stockItemId) {
        this.mData.addRecent(id, stockItemId);
        broadcastRecent();
    }

    public List<RecentSticker> getRecent() {
        return this.mData == null ? STUB_LIST : this.mData.recentStickers;
    }

    public <Source> void fillLocalInfo(Collection<Source> source, F1<? extends StickerStockItem, Source> projection) {
        Map<String, StickerStockItem> googlePlayProducts = null;
        int[] downloaded = getDownloadedPacks();
        for (Source entry : source) {
            StickerStockItem stickerStockItem = projection.f(entry);
            if (stickerStockItem != null) {
                stickerStockItem.compatMode = false;
                stickerStockItem.downloaded = stickerStockItem.compatMode || Arrays.binarySearch(downloaded, stickerStockItem.id) >= 0;
                if (stickerStockItem.can_purchase && stickerStockItem.payment_type == PaymentType.Inapp) {
                    if (googlePlayProducts == null) {
                        googlePlayProducts = new HashMap<>();
                    }
                    googlePlayProducts.put(stickerStockItem.merchant_product_id, stickerStockItem);
                }
            }
        }
        if (googlePlayProducts != null) {
            PurchasesManager.getGooglePlayPrices(googlePlayProducts, new F2<Void, StickerStockItem, String>() { // from class: com.vkontakte.android.stickers.Stickers.4
                {
                    Stickers.this = this;
                }

                @Override // com.vkontakte.android.functions.F2
                public Void f(StickerStockItem item, String s) {
                    item.price_str = s;
                    return null;
                }
            });
        }
    }

    @Nullable
    public StickerStockItem getById(int id) {
        if (this.mData == null || this.mData.allStickers == null) {
            return null;
        }
        return this.mData.allStickers.get(Integer.valueOf(id));
    }

    @Nullable
    public StickerStockItem getByStickerId(int stickerId) {
        if (this.mData == null || this.mData.allStickersByStickerId == null) {
            return null;
        }
        return this.mData.allStickersByStickerId.get(Integer.valueOf(stickerId));
    }

    private int[] getDownloadedPacks() {
        Cursor cursor = null;
        try {
            cursor = this.mManager.createQuery(StickerStockItem.class).fields("id").where("downloaded").isEqualTo(true).orderBy("id", Order.ASC).loadCursor();
            cursor.moveToFirst();
            int[] result = new int[cursor.getCount()];
            int i = 0;
            while (i < result.length) {
                result[i] = cursor.getInt(0);
                i++;
                cursor.moveToNext();
            }
            return result;
        } finally {
            if (cursor != null) {
                cursor.close();
            }
        }
    }

    private void broadcastUpdate(StickerStockItem item) {
        Intent intent = new Intent(ACTION_STICKERS_UPDATED);
        intent.putExtra(EXTRA_ITEM, item);
        this.mContext.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
    }

    private void broadcastRecent() {
        Intent intent = new Intent(ACTION_STICKERS_RECENT);
        this.mContext.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
    }

    private void broadcastNumUpdates() {
        Intent intent = new Intent(ACTION_STICKERS_NUM_UPDATES);
        this.mContext.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
    }

    private void broadcastNumNewItems() {
        Intent intent = new Intent(ACTION_STICKERS_NUM_NEW_ITEMS);
        this.mContext.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
    }

    public void setSuggestsEnabled(boolean suggestsEnabled) {
        if (suggestsEnabled != this.mSuggestsEnabled) {
            this.mSuggestsEnabled = suggestsEnabled;
            this.mPrefs.edit().putBoolean(PREFS_SUGGESTS_ENABLED, suggestsEnabled).apply();
            if (suggestsEnabled) {
                resetLastLoadedTimestampForDeferredReload();
            }
        }
    }

    public boolean isSuggestsEnabled() {
        return this.mSuggestsEnabled;
    }

    /* loaded from: classes3.dex */
    public static class Data {
        List<StickerStockItem> activatedStickers;
        Map<Integer, StickerStockItem> allStickers;
        Map<Integer, StickerStockItem> allStickersByStickerId;
        List<StickerStockItem> promotedStickers;
        List<RecentSticker> recentStickers;
        int updates;

        private Data() {
            this.recentStickers = new ArrayList();
            this.promotedStickers = new ArrayList();
            this.activatedStickers = new ArrayList();
            this.allStickers = new HashMap();
            this.allStickersByStickerId = new HashMap();
        }

        void add(StickerStockItem stickerStockItem) {
            if (stickerStockItem.promoted && !stickerStockItem.purchased) {
                this.promotedStickers.add(stickerStockItem);
            }
            if (stickerStockItem.active && stickerStockItem.purchased) {
                this.activatedStickers.add(stickerStockItem);
            }
            this.allStickers.put(Integer.valueOf(stickerStockItem.id), stickerStockItem);
            if (stickerStockItem.sticker_ids != null) {
                for (int i = 0; i < stickerStockItem.sticker_ids.length; i++) {
                    this.allStickersByStickerId.put(Integer.valueOf(stickerStockItem.sticker_ids[i]), stickerStockItem);
                }
            }
            if (stickerStockItem.disallowed_sticker_ids != null) {
                for (int i2 = 0; i2 < stickerStockItem.disallowed_sticker_ids.length; i2++) {
                    this.allStickersByStickerId.put(Integer.valueOf(stickerStockItem.disallowed_sticker_ids[i2]), stickerStockItem);
                }
            }
        }

        String serializeRecents() {
            StringBuilder sb = new StringBuilder();
            boolean firstTime = true;
            for (RecentSticker sticker : this.recentStickers) {
                if (firstTime) {
                    firstTime = false;
                } else {
                    sb.append(',');
                }
                sb.append(sticker.mStockItem.id);
                sb.append(',');
                sb.append(sticker.mId);
            }
            return sb.toString();
        }

        void fillRecents(String source) {
            if (!TextUtils.isEmpty(source)) {
                String[] array = source.split(",");
                if (array.length >= 2) {
                    for (int i = 0; i < array.length; i += 2) {
                        int stockItemId = Integer.valueOf(array[i]).intValue();
                        int id = Integer.valueOf(array[i + 1]).intValue();
                        StickerStockItem item = this.allStickers.get(Integer.valueOf(stockItemId));
                        if (item != null) {
                            this.recentStickers.add(new RecentSticker(id, item));
                        }
                    }
                }
            }
        }

        void addRecent(int id, int stockItemId) {
            boolean found = false;
            int i = 0;
            while (true) {
                if (i >= this.recentStickers.size()) {
                    break;
                }
                RecentSticker sticker = this.recentStickers.get(i);
                if (sticker.mId != id || sticker.mStockItem.id != stockItemId) {
                    i++;
                } else {
                    Collections.swap(this.recentStickers, 0, i);
                    found = true;
                    break;
                }
            }
            if (!found) {
                this.recentStickers.add(0, new RecentSticker(id, this.allStickers.get(Integer.valueOf(stockItemId))));
            }
            if (this.recentStickers.size() > 32) {
                this.recentStickers.subList(32, this.recentStickers.size()).clear();
            }
        }

        public void clearAll() {
            if (this.recentStickers != null) {
                this.recentStickers.clear();
            }
            if (this.promotedStickers != null) {
                this.promotedStickers.clear();
            }
            if (this.activatedStickers != null) {
                this.activatedStickers.clear();
            }
            if (this.allStickers != null) {
                this.allStickers.clear();
            }
            if (this.allStickersByStickerId != null) {
                this.allStickersByStickerId.clear();
            }
        }
    }

    /* loaded from: classes3.dex */
    public static class GetAutoSuggestDictionaryRequest extends VKAPIRequest<JSONObject> {
        public GetAutoSuggestDictionaryRequest() {
            super("store.getStickersKeywords");
            setBackground(true);
            param("aliases", 1);
            param("all_products", 1);
        }

        @Override // com.vkontakte.android.api.VKAPIRequest
        /* renamed from: parse */
        public JSONObject mo1093parse(JSONObject source) {
            return source;
        }
    }

    /* loaded from: classes3.dex */
    public static class GetInfo extends VKAPIRequest<Data> {
        final Stickers mStickers;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public GetInfo(Stickers stickers) {
            super("execute.getStickerProducts");
            int i = 1;
            this.mStickers = stickers;
            setBackground(true);
            param(ServerKeys.TYPE, Stickers.SHARED_PREFERENCE);
            param("merchant", "google");
            param(ShareConstants.WEB_DIALOG_PARAM_FILTERS, "purchased,active,promoted,free,new");
            param("func_v", 2);
            param("force_inapp", 0);
            param("no_inapp", PurchasesManager.canUseInApps() ? 0 : i);
        }

        @Override // com.vkontakte.android.api.VKAPIRequest
        /* renamed from: parse */
        public Data mo1093parse(JSONObject source) throws Exception {
            F1 f1;
            Data data = new Data();
            JSONObject response = source.getJSONObject(ServerKeys.RESPONSE);
            JSONArrayWithCount stickers = APIUtils.unwrapArray(response, Stickers.SHARED_PREFERENCE);
            for (int i = 0; i < stickers.array.length(); i++) {
                try {
                    data.add(new StickerStockItem(stickers.array.getJSONObject(i), i));
                } catch (JSONException e) {
                }
            }
            Collection<StickerStockItem> items = data.allStickers.values();
            Stickers stickers2 = this.mStickers;
            f1 = Stickers$GetInfo$$Lambda$1.instance;
            stickers2.fillLocalInfo(items, f1);
            JSONObject recent = response.getJSONObject("recent");
            JSONArray sticker_ids = recent.optJSONArray("sticker_ids");
            if (sticker_ids != null) {
                int len = Math.min(32, sticker_ids.length());
                for (int i2 = 0; i2 < len; i2++) {
                    RecentSticker sticker = RecentSticker.create(sticker_ids.getInt(i2), items);
                    if (sticker != null) {
                        data.recentStickers.add(sticker);
                    }
                }
            }
            data.updates = response.optInt("updates");
            return data;
        }

        public static /* synthetic */ StickerStockItem lambda$parse$0(StickerStockItem item) {
            return item;
        }
    }

    /* loaded from: classes3.dex */
    public static class RecentSticker {
        public final int mId;
        public StickerStockItem mStockItem;

        @Nullable
        public static RecentSticker create(int id, Collection<StickerStockItem> items) {
            int[] iArr;
            for (StickerStockItem item : items) {
                if (item.sticker_ids != null) {
                    for (int sticker_id : item.sticker_ids) {
                        if (id == sticker_id) {
                            return new RecentSticker(id, item);
                        }
                    }
                    continue;
                }
            }
            return null;
        }

        public RecentSticker(int id, @NonNull StickerStockItem item) {
            this.mId = id;
            this.mStockItem = item;
        }
    }
}
