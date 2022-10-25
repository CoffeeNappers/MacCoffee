.class public Lcom/vkontakte/android/stickers/Stickers;
.super Ljava/lang/Object;
.source "Stickers.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/stickers/Stickers$RecentSticker;,
        Lcom/vkontakte/android/stickers/Stickers$GetInfo;,
        Lcom/vkontakte/android/stickers/Stickers$GetAutoSuggestDictionaryRequest;,
        Lcom/vkontakte/android/stickers/Stickers$Data;
    }
.end annotation


# static fields
.field public static final ACTION_STICKERS_DOWNLOAD_PROGRESS:Ljava/lang/String; = "com.vkontakte.android.STICKERS_DOWNLOAD_PROGRESS"

.field public static final ACTION_STICKERS_NUM_NEW_ITEMS:Ljava/lang/String; = "com.vkontakte.android.STICKERS_NUM_NEW_ITEMS"

.field public static final ACTION_STICKERS_NUM_UPDATES:Ljava/lang/String; = "com.vkontakte.android.STICKERS_NUM_UPDATES"

.field public static final ACTION_STICKERS_RECENT:Ljava/lang/String; = "com.vkontakte.android.STICKERS_UPDATED_RECENTS"

.field public static final ACTION_STICKERS_RELOADED:Ljava/lang/String; = "com.vkontakte.android.STICKERS_RELOADED"

.field public static final ACTION_STICKERS_UPDATED:Ljava/lang/String; = "com.vkontakte.android.STICKERS_UPDATED"

.field public static final EXTRA_ITEM:Ljava/lang/String; = "item"

.field public static final PREFS_SUGGESTS_ENABLED:Ljava/lang/String; = "suggests_enabled"

.field private static final PREF_AUTO_SUGGEST_LAST_LOADED_TIMESPAMP:Ljava/lang/String; = "auto_suggest_last_loaded"

.field private static final PREF_NUM_GLOBAL_PROMOTIONS:Ljava/lang/String; = "num_global_promotions"

.field private static final PREF_NUM_NEW_ITEMS:Ljava/lang/String; = "num_new_items"

.field private static final PREF_RECENT_STICKERS:Ljava/lang/String; = "base_url"

.field private static final PREF_STICKERS_HASH:Ljava/lang/String; = "stickers_hash"

.field private static final RECENTS_MAX_SIZE:I = 0x20

.field private static final SHARED_PREFERENCE:Ljava/lang/String; = "stickers"

.field private static final STICKERS_UPDATE_REQUEST_MIN_PERIOD_MS:J = 0x2710L

.field private static final STUB_LIST:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<*>;"
        }
    .end annotation
.end field

.field private static volatile sInstance:Lcom/vkontakte/android/stickers/Stickers;


# instance fields
.field private lastStickerUpdateRequest:J

.field private final mContext:Landroid/content/Context;

.field private volatile mData:Lcom/vkontakte/android/stickers/Stickers$Data;

.field private final mManager:Lcom/vkontakte/android/orm/EntityManager;

.field private mNumGlobalPromotions:I

.field private mNumNewItems:I

.field private final mPrefs:Landroid/content/SharedPreferences;

.field private volatile mStickersAutoSuggestDictionary:Lcom/vkontakte/android/stickers/StickersAutoSuggestDictionary;

.field private mSuggestsEnabled:Z

.field private final mUIHandler:Landroid/os/Handler;

.field private final mWriteLock:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 66
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/stickers/Stickers;->STUB_LIST:Ljava/util/List;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, -0x1

    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mUIHandler:Landroid/os/Handler;

    .line 79
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mWriteLock:Ljava/lang/Object;

    .line 82
    iput v2, p0, Lcom/vkontakte/android/stickers/Stickers;->mNumNewItems:I

    .line 83
    iput v2, p0, Lcom/vkontakte/android/stickers/Stickers;->mNumGlobalPromotions:I

    .line 91
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mContext:Landroid/content/Context;

    .line 92
    new-instance v0, Lcom/vkontakte/android/orm/EntityManager;

    iget-object v1, p0, Lcom/vkontakte/android/stickers/Stickers;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/orm/EntityManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mManager:Lcom/vkontakte/android/orm/EntityManager;

    .line 93
    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mContext:Landroid/content/Context;

    const-string/jumbo v1, "stickers"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mPrefs:Landroid/content/SharedPreferences;

    .line 94
    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mPrefs:Landroid/content/SharedPreferences;

    const-string/jumbo v1, "suggests_enabled"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mSuggestsEnabled:Z

    .line 95
    invoke-direct {p0}, Lcom/vkontakte/android/stickers/Stickers;->initCache()V

    .line 96
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/stickers/Stickers;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/stickers/Stickers;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mWriteLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/stickers/Stickers;)Lcom/vkontakte/android/orm/EntityManager;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/stickers/Stickers;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mManager:Lcom/vkontakte/android/orm/EntityManager;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/stickers/Stickers;)Landroid/content/SharedPreferences;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/stickers/Stickers;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mPrefs:Landroid/content/SharedPreferences;

    return-object v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/stickers/Stickers;)Lcom/vkontakte/android/stickers/Stickers$Data;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/stickers/Stickers;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mData:Lcom/vkontakte/android/stickers/Stickers$Data;

    return-object v0
.end method

.method static synthetic access$402(Lcom/vkontakte/android/stickers/Stickers;Lcom/vkontakte/android/stickers/Stickers$Data;)Lcom/vkontakte/android/stickers/Stickers$Data;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/stickers/Stickers;
    .param p1, "x1"    # Lcom/vkontakte/android/stickers/Stickers$Data;

    .prologue
    .line 54
    iput-object p1, p0, Lcom/vkontakte/android/stickers/Stickers;->mData:Lcom/vkontakte/android/stickers/Stickers$Data;

    return-object p1
.end method

.method static synthetic access$500(Lcom/vkontakte/android/stickers/Stickers;)Lcom/vkontakte/android/stickers/StickersAutoSuggestDictionary;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/stickers/Stickers;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mStickersAutoSuggestDictionary:Lcom/vkontakte/android/stickers/StickersAutoSuggestDictionary;

    return-object v0
.end method

.method static synthetic access$502(Lcom/vkontakte/android/stickers/Stickers;Lcom/vkontakte/android/stickers/StickersAutoSuggestDictionary;)Lcom/vkontakte/android/stickers/StickersAutoSuggestDictionary;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/stickers/Stickers;
    .param p1, "x1"    # Lcom/vkontakte/android/stickers/StickersAutoSuggestDictionary;

    .prologue
    .line 54
    iput-object p1, p0, Lcom/vkontakte/android/stickers/Stickers;->mStickersAutoSuggestDictionary:Lcom/vkontakte/android/stickers/StickersAutoSuggestDictionary;

    return-object p1
.end method

.method static synthetic access$600(Lcom/vkontakte/android/stickers/Stickers;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/stickers/Stickers;

    .prologue
    .line 54
    invoke-direct {p0}, Lcom/vkontakte/android/stickers/Stickers;->broadcastReloaded()V

    return-void
.end method

.method static synthetic access$700(Lcom/vkontakte/android/stickers/Stickers;Lcom/vkontakte/android/stickers/Stickers$Data;Lcom/vkontakte/android/stickers/Stickers$Data;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/stickers/Stickers;
    .param p1, "x1"    # Lcom/vkontakte/android/stickers/Stickers$Data;
    .param p2, "x2"    # Lcom/vkontakte/android/stickers/Stickers$Data;

    .prologue
    .line 54
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/stickers/Stickers;->compareStickersData(Lcom/vkontakte/android/stickers/Stickers$Data;Lcom/vkontakte/android/stickers/Stickers$Data;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$800(Lcom/vkontakte/android/stickers/Stickers;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/stickers/Stickers;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mUIHandler:Landroid/os/Handler;

    return-object v0
.end method

.method private broadcastNumNewItems()V
    .locals 3

    .prologue
    .line 616
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.vkontakte.android.STICKERS_NUM_NEW_ITEMS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 617
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/vkontakte/android/stickers/Stickers;->mContext:Landroid/content/Context;

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 618
    return-void
.end method

.method private broadcastNumUpdates()V
    .locals 3

    .prologue
    .line 611
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.vkontakte.android.STICKERS_NUM_UPDATES"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 612
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/vkontakte/android/stickers/Stickers;->mContext:Landroid/content/Context;

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 613
    return-void
.end method

.method private broadcastRecent()V
    .locals 3

    .prologue
    .line 606
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.vkontakte.android.STICKERS_UPDATED_RECENTS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 607
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/vkontakte/android/stickers/Stickers;->mContext:Landroid/content/Context;

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 608
    return-void
.end method

.method private broadcastReloaded()V
    .locals 3

    .prologue
    .line 129
    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mContext:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "com.vkontakte.android.STICKERS_RELOADED"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 130
    return-void
.end method

.method private broadcastUpdate(Lcom/vkontakte/android/data/orm/StickerStockItem;)V
    .locals 3
    .param p1, "item"    # Lcom/vkontakte/android/data/orm/StickerStockItem;

    .prologue
    .line 600
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.vkontakte.android.STICKERS_UPDATED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 601
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "item"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 602
    iget-object v1, p0, Lcom/vkontakte/android/stickers/Stickers;->mContext:Landroid/content/Context;

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 603
    return-void
.end method

.method private compareStickersData(Lcom/vkontakte/android/stickers/Stickers$Data;Lcom/vkontakte/android/stickers/Stickers$Data;)Z
    .locals 4
    .param p1, "oldData"    # Lcom/vkontakte/android/stickers/Stickers$Data;
    .param p2, "newData"    # Lcom/vkontakte/android/stickers/Stickers$Data;

    .prologue
    const/4 v2, 0x0

    .line 309
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    :cond_0
    move v1, v2

    .line 322
    :goto_0
    return v1

    .line 312
    :cond_1
    iget-object v1, p1, Lcom/vkontakte/android/stickers/Stickers$Data;->activatedStickers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    iget-object v3, p2, Lcom/vkontakte/android/stickers/Stickers$Data;->activatedStickers:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-eq v1, v3, :cond_2

    move v1, v2

    .line 313
    goto :goto_0

    .line 316
    :cond_2
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p1, Lcom/vkontakte/android/stickers/Stickers$Data;->activatedStickers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_4

    .line 317
    iget-object v1, p1, Lcom/vkontakte/android/stickers/Stickers$Data;->activatedStickers:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/data/orm/StickerStockItem;

    iget v3, v1, Lcom/vkontakte/android/data/orm/StickerStockItem;->id:I

    iget-object v1, p2, Lcom/vkontakte/android/stickers/Stickers$Data;->activatedStickers:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/data/orm/StickerStockItem;

    iget v1, v1, Lcom/vkontakte/android/data/orm/StickerStockItem;->id:I

    if-eq v3, v1, :cond_3

    move v1, v2

    .line 318
    goto :goto_0

    .line 316
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 322
    :cond_4
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public static get()Lcom/vkontakte/android/stickers/Stickers;
    .locals 1

    .prologue
    .line 146
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/vkontakte/android/stickers/Stickers;->get(Landroid/content/Context;)Lcom/vkontakte/android/stickers/Stickers;

    move-result-object v0

    return-object v0
.end method

.method public static get(Landroid/content/Context;)Lcom/vkontakte/android/stickers/Stickers;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 133
    sget-object v0, Lcom/vkontakte/android/stickers/Stickers;->sInstance:Lcom/vkontakte/android/stickers/Stickers;

    .line 134
    .local v0, "localInstance":Lcom/vkontakte/android/stickers/Stickers;
    if-nez v0, :cond_1

    .line 135
    const-class v3, Lcom/vkontakte/android/stickers/Stickers;

    monitor-enter v3

    .line 136
    :try_start_0
    sget-object v0, Lcom/vkontakte/android/stickers/Stickers;->sInstance:Lcom/vkontakte/android/stickers/Stickers;

    .line 137
    if-nez v0, :cond_0

    .line 138
    new-instance v1, Lcom/vkontakte/android/stickers/Stickers;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/stickers/Stickers;-><init>(Landroid/content/Context;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .end local v0    # "localInstance":Lcom/vkontakte/android/stickers/Stickers;
    .local v1, "localInstance":Lcom/vkontakte/android/stickers/Stickers;
    :try_start_1
    sput-object v1, Lcom/vkontakte/android/stickers/Stickers;->sInstance:Lcom/vkontakte/android/stickers/Stickers;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-object v0, v1

    .line 140
    .end local v1    # "localInstance":Lcom/vkontakte/android/stickers/Stickers;
    .restart local v0    # "localInstance":Lcom/vkontakte/android/stickers/Stickers;
    :cond_0
    :try_start_2
    monitor-exit v3

    .line 142
    :cond_1
    return-object v0

    .line 140
    :catchall_0
    move-exception v2

    :goto_0
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2

    .end local v0    # "localInstance":Lcom/vkontakte/android/stickers/Stickers;
    .restart local v1    # "localInstance":Lcom/vkontakte/android/stickers/Stickers;
    :catchall_1
    move-exception v2

    move-object v0, v1

    .end local v1    # "localInstance":Lcom/vkontakte/android/stickers/Stickers;
    .restart local v0    # "localInstance":Lcom/vkontakte/android/stickers/Stickers;
    goto :goto_0
.end method

.method private getDownloadedPacks()[I
    .locals 7

    .prologue
    .line 579
    const/4 v0, 0x0

    .line 581
    .local v0, "cursor":Landroid/database/Cursor;
    :try_start_0
    iget-object v3, p0, Lcom/vkontakte/android/stickers/Stickers;->mManager:Lcom/vkontakte/android/orm/EntityManager;

    const-class v4, Lcom/vkontakte/android/data/orm/StickerStockItem;

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/orm/EntityManager;->createQuery(Ljava/lang/Class;)Lcom/vkontakte/android/orm/Query;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string/jumbo v6, "id"

    aput-object v6, v4, v5

    .line 582
    invoke-virtual {v3, v4}, Lcom/vkontakte/android/orm/Query;->fields([Ljava/lang/String;)Lcom/vkontakte/android/orm/Query;

    move-result-object v3

    const-string/jumbo v4, "downloaded"

    .line 583
    invoke-virtual {v3, v4}, Lcom/vkontakte/android/orm/Query;->where(Ljava/lang/String;)Lcom/vkontakte/android/orm/Query;

    move-result-object v3

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/orm/Query;->isEqualTo(Ljava/lang/Object;)Lcom/vkontakte/android/orm/Query;

    move-result-object v3

    const-string/jumbo v4, "id"

    sget-object v5, Lcom/vkontakte/android/orm/Order;->ASC:Lcom/vkontakte/android/orm/Order;

    .line 584
    invoke-virtual {v3, v4, v5}, Lcom/vkontakte/android/orm/Query;->orderBy(Ljava/lang/String;Lcom/vkontakte/android/orm/Order;)Lcom/vkontakte/android/orm/Query;

    move-result-object v3

    .line 585
    invoke-virtual {v3}, Lcom/vkontakte/android/orm/Query;->loadCursor()Landroid/database/Cursor;

    move-result-object v0

    .line 586
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 587
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v3

    new-array v2, v3, [I

    .line 588
    .local v2, "result":[I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, v2

    if-ge v1, v3, :cond_1

    .line 589
    const/4 v3, 0x0

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    aput v3, v2, v1

    .line 588
    add-int/lit8 v1, v1, 0x1

    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 593
    .end local v1    # "i":I
    .end local v2    # "result":[I
    :catchall_0
    move-exception v3

    if-eqz v0, :cond_0

    .line 594
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_0
    throw v3

    .line 593
    .restart local v1    # "i":I
    .restart local v2    # "result":[I
    :cond_1
    if-eqz v0, :cond_2

    .line 594
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_2
    return-object v2
.end method

.method private initCache()V
    .locals 1

    .prologue
    .line 99
    new-instance v0, Lcom/vkontakte/android/stickers/Stickers$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/stickers/Stickers$1;-><init>(Lcom/vkontakte/android/stickers/Stickers;)V

    .line 125
    invoke-virtual {v0}, Lcom/vkontakte/android/stickers/Stickers$1;->start()V

    .line 126
    return-void
.end method

.method static synthetic lambda$checkServerUpdates$2(Ljava/lang/Throwable;)V
    .locals 0
    .param p0, "ignoredThrowable"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 162
    return-void
.end method

.method static synthetic lambda$markGlobalPromotionsAsViewed$6(Ljava/lang/Throwable;)V
    .locals 0
    .param p0, "throwable"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 520
    return-void
.end method

.method static synthetic lambda$markNewItemsAsViewed$4(Ljava/lang/Throwable;)V
    .locals 0
    .param p0, "throwable"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 512
    return-void
.end method

.method private resetLastLoadedTimestampForDeferredReload()V
    .locals 4

    .prologue
    .line 424
    iget-object v1, p0, Lcom/vkontakte/android/stickers/Stickers;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 426
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string/jumbo v1, "auto_suggest_last_loaded"

    const-wide/16 v2, 0x0

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 427
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 428
    return-void
.end method


# virtual methods
.method public addRecent(II)V
    .locals 1
    .param p1, "id"    # I
    .param p2, "stockItemId"    # I

    .prologue
    .line 525
    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mData:Lcom/vkontakte/android/stickers/Stickers$Data;

    invoke-virtual {v0, p1, p2}, Lcom/vkontakte/android/stickers/Stickers$Data;->addRecent(II)V

    .line 526
    invoke-direct {p0}, Lcom/vkontakte/android/stickers/Stickers;->broadcastRecent()V

    .line 527
    return-void
.end method

.method public checkServerUpdates()V
    .locals 4

    .prologue
    .line 150
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/vkontakte/android/stickers/Stickers;->lastStickerUpdateRequest:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x2710

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 151
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/vkontakte/android/stickers/Stickers;->lastStickerUpdateRequest:J

    .line 152
    new-instance v0, Lcom/vkontakte/android/api/store/StoreHasNewItems;

    invoke-direct {v0}, Lcom/vkontakte/android/api/store/StoreHasNewItems;-><init>()V

    .line 153
    invoke-virtual {v0}, Lcom/vkontakte/android/api/store/StoreHasNewItems;->toObservable()Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {p0}, Lcom/vkontakte/android/stickers/Stickers$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/stickers/Stickers;)Lio/reactivex/functions/Consumer;

    move-result-object v1

    invoke-static {}, Lcom/vkontakte/android/stickers/Stickers$$Lambda$2;->lambdaFactory$()Lio/reactivex/functions/Consumer;

    move-result-object v2

    .line 154
    invoke-virtual {v0, v1, v2}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    .line 164
    :cond_0
    return-void
.end method

.method public clearAll()V
    .locals 7

    .prologue
    .line 432
    iget-object v3, p0, Lcom/vkontakte/android/stickers/Stickers;->mWriteLock:Ljava/lang/Object;

    monitor-enter v3

    .line 433
    :try_start_0
    iget-object v2, p0, Lcom/vkontakte/android/stickers/Stickers;->mData:Lcom/vkontakte/android/stickers/Stickers$Data;

    if-eqz v2, :cond_0

    .line 434
    iget-object v2, p0, Lcom/vkontakte/android/stickers/Stickers;->mData:Lcom/vkontakte/android/stickers/Stickers$Data;

    invoke-virtual {v2}, Lcom/vkontakte/android/stickers/Stickers$Data;->clearAll()V

    .line 437
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/stickers/Stickers;->mStickersAutoSuggestDictionary:Lcom/vkontakte/android/stickers/StickersAutoSuggestDictionary;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_1

    .line 439
    :try_start_1
    iget-object v2, p0, Lcom/vkontakte/android/stickers/Stickers;->mStickersAutoSuggestDictionary:Lcom/vkontakte/android/stickers/StickersAutoSuggestDictionary;

    invoke-virtual {v2}, Lcom/vkontakte/android/stickers/StickersAutoSuggestDictionary;->clearAndSave()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 446
    :cond_1
    :goto_0
    :try_start_2
    invoke-direct {p0}, Lcom/vkontakte/android/stickers/Stickers;->resetLastLoadedTimestampForDeferredReload()V

    .line 448
    iget-object v4, p0, Lcom/vkontakte/android/stickers/Stickers;->mWriteLock:Ljava/lang/Object;

    monitor-enter v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 449
    :try_start_3
    iget-object v2, p0, Lcom/vkontakte/android/stickers/Stickers;->mManager:Lcom/vkontakte/android/orm/EntityManager;

    invoke-virtual {v2}, Lcom/vkontakte/android/orm/EntityManager;->beginTransaction()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 451
    :try_start_4
    iget-object v2, p0, Lcom/vkontakte/android/stickers/Stickers;->mManager:Lcom/vkontakte/android/orm/EntityManager;

    const-class v5, Lcom/vkontakte/android/data/orm/StickerStockItem;

    invoke-virtual {v2, v5}, Lcom/vkontakte/android/orm/EntityManager;->createQuery(Ljava/lang/Class;)Lcom/vkontakte/android/orm/Query;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/orm/Query;->delete()I

    move-result v0

    .line 452
    .local v0, "count":I
    iget-object v2, p0, Lcom/vkontakte/android/stickers/Stickers;->mManager:Lcom/vkontakte/android/orm/EntityManager;

    invoke-virtual {v2}, Lcom/vkontakte/android/orm/EntityManager;->commit()V

    .line 453
    const-string/jumbo v2, "STICKERS"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "DELETED "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " rows"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 457
    .end local v0    # "count":I
    :goto_1
    :try_start_5
    monitor-exit v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 458
    :try_start_6
    invoke-direct {p0}, Lcom/vkontakte/android/stickers/Stickers;->broadcastReloaded()V

    .line 459
    monitor-exit v3

    .line 460
    return-void

    .line 441
    :catch_0
    move-exception v1

    .line 442
    .local v1, "e":Ljava/lang/Exception;
    const-string/jumbo v2, "Stickers"

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 459
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    throw v2

    .line 454
    :catch_1
    move-exception v1

    .line 455
    .local v1, "e":Ljava/lang/Throwable;
    :try_start_7
    iget-object v2, p0, Lcom/vkontakte/android/stickers/Stickers;->mManager:Lcom/vkontakte/android/orm/EntityManager;

    invoke-virtual {v2}, Lcom/vkontakte/android/orm/EntityManager;->rollback()V

    goto :goto_1

    .line 457
    .end local v1    # "e":Ljava/lang/Throwable;
    :catchall_1
    move-exception v2

    monitor-exit v4
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    :try_start_8
    throw v2
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0
.end method

.method public fillLocalInfo(Ljava/util/Collection;Lcom/vkontakte/android/functions/F1;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Source:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Collection",
            "<TSource;>;",
            "Lcom/vkontakte/android/functions/F1",
            "<+",
            "Lcom/vkontakte/android/data/orm/StickerStockItem;",
            "TSource;>;)V"
        }
    .end annotation

    .prologue
    .local p1, "source":Ljava/util/Collection;, "Ljava/util/Collection<TSource;>;"
    .local p2, "projection":Lcom/vkontakte/android/functions/F1;, "Lcom/vkontakte/android/functions/F1<+Lcom/vkontakte/android/data/orm/StickerStockItem;TSource;>;"
    const/4 v5, 0x0

    .line 540
    const/4 v2, 0x0

    .line 541
    .local v2, "googlePlayProducts":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/vkontakte/android/data/orm/StickerStockItem;>;"
    invoke-direct {p0}, Lcom/vkontakte/android/stickers/Stickers;->getDownloadedPacks()[I

    move-result-object v0

    .line 542
    .local v0, "downloaded":[I
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_0
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 543
    .local v1, "entry":Ljava/lang/Object;, "TSource;"
    invoke-interface {p2, v1}, Lcom/vkontakte/android/functions/F1;->f(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/data/orm/StickerStockItem;

    .line 544
    .local v3, "stickerStockItem":Lcom/vkontakte/android/data/orm/StickerStockItem;
    if-eqz v3, :cond_0

    .line 545
    iput-boolean v5, v3, Lcom/vkontakte/android/data/orm/StickerStockItem;->compatMode:Z

    .line 546
    iget-boolean v4, v3, Lcom/vkontakte/android/data/orm/StickerStockItem;->compatMode:Z

    if-nez v4, :cond_1

    iget v4, v3, Lcom/vkontakte/android/data/orm/StickerStockItem;->id:I

    invoke-static {v0, v4}, Ljava/util/Arrays;->binarySearch([II)I

    move-result v4

    if-ltz v4, :cond_3

    :cond_1
    const/4 v4, 0x1

    :goto_1
    iput-boolean v4, v3, Lcom/vkontakte/android/data/orm/StickerStockItem;->downloaded:Z

    .line 548
    iget-boolean v4, v3, Lcom/vkontakte/android/data/orm/StickerStockItem;->can_purchase:Z

    if-eqz v4, :cond_0

    iget-object v4, v3, Lcom/vkontakte/android/data/orm/StickerStockItem;->payment_type:Lcom/vkontakte/android/api/models/PaymentType;

    sget-object v7, Lcom/vkontakte/android/api/models/PaymentType;->Inapp:Lcom/vkontakte/android/api/models/PaymentType;

    if-ne v4, v7, :cond_0

    .line 549
    if-nez v2, :cond_2

    .line 550
    new-instance v2, Ljava/util/HashMap;

    .end local v2    # "googlePlayProducts":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/vkontakte/android/data/orm/StickerStockItem;>;"
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 552
    .restart local v2    # "googlePlayProducts":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/vkontakte/android/data/orm/StickerStockItem;>;"
    :cond_2
    iget-object v4, v3, Lcom/vkontakte/android/data/orm/StickerStockItem;->merchant_product_id:Ljava/lang/String;

    invoke-interface {v2, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_3
    move v4, v5

    .line 546
    goto :goto_1

    .line 557
    .end local v1    # "entry":Ljava/lang/Object;, "TSource;"
    .end local v3    # "stickerStockItem":Lcom/vkontakte/android/data/orm/StickerStockItem;
    :cond_4
    if-eqz v2, :cond_5

    .line 558
    new-instance v4, Lcom/vkontakte/android/stickers/Stickers$4;

    invoke-direct {v4, p0}, Lcom/vkontakte/android/stickers/Stickers$4;-><init>(Lcom/vkontakte/android/stickers/Stickers;)V

    invoke-static {v2, v4}, Lcom/vkontakte/android/data/PurchasesManager;->getGooglePlayPrices(Ljava/util/Map;Lcom/vkontakte/android/functions/F2;)V

    .line 566
    :cond_5
    return-void
.end method

.method public getActivatedStickers()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/data/orm/StickerStockItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 174
    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mData:Lcom/vkontakte/android/stickers/Stickers$Data;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mData:Lcom/vkontakte/android/stickers/Stickers$Data;

    iget-object v0, v0, Lcom/vkontakte/android/stickers/Stickers$Data;->activatedStickers:Ljava/util/List;

    if-nez v0, :cond_1

    .line 175
    :cond_0
    sget-object v0, Lcom/vkontakte/android/stickers/Stickers;->STUB_LIST:Ljava/util/List;

    .line 177
    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mData:Lcom/vkontakte/android/stickers/Stickers$Data;

    iget-object v0, v0, Lcom/vkontakte/android/stickers/Stickers$Data;->activatedStickers:Ljava/util/List;

    goto :goto_0
.end method

.method public getAutoSuggestStickersFor(Ljava/lang/String;)Lcom/vkontakte/android/data/orm/StickersDictionaryItem;
    .locals 8
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 181
    iget-object v6, p0, Lcom/vkontakte/android/stickers/Stickers;->mStickersAutoSuggestDictionary:Lcom/vkontakte/android/stickers/StickersAutoSuggestDictionary;

    if-eqz v6, :cond_0

    iget-boolean v6, p0, Lcom/vkontakte/android/stickers/Stickers;->mSuggestsEnabled:Z

    if-eqz v6, :cond_0

    .line 183
    invoke-static {}, Lcom/vkontakte/android/NetworkStateReceiver;->isConnected()Z

    move-result v6

    if-nez v6, :cond_2

    .line 185
    :cond_0
    const/4 v1, 0x0

    .line 219
    :cond_1
    :goto_0
    return-object v1

    .line 188
    :cond_2
    iget-object v6, p0, Lcom/vkontakte/android/stickers/Stickers;->mStickersAutoSuggestDictionary:Lcom/vkontakte/android/stickers/StickersAutoSuggestDictionary;

    invoke-virtual {v6, p1}, Lcom/vkontakte/android/stickers/StickersAutoSuggestDictionary;->getAutoSuggestStickersFor(Ljava/lang/String;)Lcom/vkontakte/android/data/orm/StickersDictionaryItem;

    move-result-object v1

    .line 190
    .local v1, "item":Lcom/vkontakte/android/data/orm/StickersDictionaryItem;
    if-eqz v1, :cond_1

    iget-object v6, v1, Lcom/vkontakte/android/data/orm/StickersDictionaryItem;->user_stickers:[I

    if-eqz v6, :cond_1

    iget-object v6, v1, Lcom/vkontakte/android/data/orm/StickersDictionaryItem;->user_stickers:[I

    array-length v6, v6

    if-lez v6, :cond_1

    .line 193
    iget-object v6, v1, Lcom/vkontakte/android/data/orm/StickersDictionaryItem;->user_stickers:[I

    array-length v6, v6

    new-array v5, v6, [I

    .line 194
    .local v5, "sortedUserStickers":[I
    const/4 v3, 0x0

    .line 195
    .local v3, "k":I
    invoke-virtual {p0}, Lcom/vkontakte/android/stickers/Stickers;->getRecent()Ljava/util/List;

    move-result-object v4

    .line 196
    .local v4, "recentStickers":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/stickers/Stickers$RecentSticker;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v6

    if-ge v0, v6, :cond_5

    .line 197
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_2
    iget-object v6, v1, Lcom/vkontakte/android/data/orm/StickersDictionaryItem;->user_stickers:[I

    array-length v6, v6

    if-ge v2, v6, :cond_4

    .line 198
    iget-object v6, v1, Lcom/vkontakte/android/data/orm/StickersDictionaryItem;->user_stickers:[I

    aget v7, v6, v2

    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vkontakte/android/stickers/Stickers$RecentSticker;

    iget v6, v6, Lcom/vkontakte/android/stickers/Stickers$RecentSticker;->mId:I

    if-ne v7, v6, :cond_3

    .line 199
    iget-object v6, v1, Lcom/vkontakte/android/data/orm/StickersDictionaryItem;->user_stickers:[I

    aget v6, v6, v2

    aput v6, v5, v3

    .line 200
    add-int/lit8 v3, v3, 0x1

    .line 201
    iget-object v6, v1, Lcom/vkontakte/android/data/orm/StickersDictionaryItem;->user_stickers:[I

    const/4 v7, 0x0

    aput v7, v6, v2

    .line 197
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 196
    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 206
    .end local v2    # "j":I
    :cond_5
    const/4 v0, 0x0

    :goto_3
    iget-object v6, v1, Lcom/vkontakte/android/data/orm/StickersDictionaryItem;->user_stickers:[I

    array-length v6, v6

    if-ge v0, v6, :cond_7

    .line 207
    iget-object v6, v1, Lcom/vkontakte/android/data/orm/StickersDictionaryItem;->user_stickers:[I

    aget v6, v6, v0

    if-eqz v6, :cond_6

    .line 208
    iget-object v6, v1, Lcom/vkontakte/android/data/orm/StickersDictionaryItem;->user_stickers:[I

    aget v6, v6, v0

    aput v6, v5, v3

    .line 209
    add-int/lit8 v3, v3, 0x1

    .line 206
    :cond_6
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 215
    :cond_7
    iput-object v5, v1, Lcom/vkontakte/android/data/orm/StickersDictionaryItem;->user_stickers:[I

    goto :goto_0
.end method

.method public getById(I)Lcom/vkontakte/android/data/orm/StickerStockItem;
    .locals 2
    .param p1, "id"    # I
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 570
    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mData:Lcom/vkontakte/android/stickers/Stickers$Data;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mData:Lcom/vkontakte/android/stickers/Stickers$Data;

    iget-object v0, v0, Lcom/vkontakte/android/stickers/Stickers$Data;->allStickers:Ljava/util/Map;

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mData:Lcom/vkontakte/android/stickers/Stickers$Data;

    iget-object v0, v0, Lcom/vkontakte/android/stickers/Stickers$Data;->allStickers:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/orm/StickerStockItem;

    goto :goto_0
.end method

.method public getByStickerId(I)Lcom/vkontakte/android/data/orm/StickerStockItem;
    .locals 2
    .param p1, "stickerId"    # I
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 575
    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mData:Lcom/vkontakte/android/stickers/Stickers$Data;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mData:Lcom/vkontakte/android/stickers/Stickers$Data;

    iget-object v0, v0, Lcom/vkontakte/android/stickers/Stickers$Data;->allStickersByStickerId:Ljava/util/Map;

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mData:Lcom/vkontakte/android/stickers/Stickers$Data;

    iget-object v0, v0, Lcom/vkontakte/android/stickers/Stickers$Data;->allStickersByStickerId:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/orm/StickerStockItem;

    goto :goto_0
.end method

.method public getGlobalPromotions()I
    .locals 3

    .prologue
    .line 470
    iget v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mNumGlobalPromotions:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 471
    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mPrefs:Landroid/content/SharedPreferences;

    const-string/jumbo v1, "num_global_promotions"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mNumGlobalPromotions:I

    .line 473
    :cond_0
    iget v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mNumGlobalPromotions:I

    return v0
.end method

.method public getNewItems()I
    .locals 3

    .prologue
    .line 463
    iget v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mNumNewItems:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 464
    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mPrefs:Landroid/content/SharedPreferences;

    const-string/jumbo v1, "num_new_items"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mNumNewItems:I

    .line 466
    :cond_0
    iget v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mNumNewItems:I

    return v0
.end method

.method public getPromotedStickers()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/data/orm/StickerStockItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 167
    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mData:Lcom/vkontakte/android/stickers/Stickers$Data;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mData:Lcom/vkontakte/android/stickers/Stickers$Data;

    iget-object v0, v0, Lcom/vkontakte/android/stickers/Stickers$Data;->promotedStickers:Ljava/util/List;

    if-nez v0, :cond_1

    .line 168
    :cond_0
    sget-object v0, Lcom/vkontakte/android/stickers/Stickers;->STUB_LIST:Ljava/util/List;

    .line 170
    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mData:Lcom/vkontakte/android/stickers/Stickers$Data;

    iget-object v0, v0, Lcom/vkontakte/android/stickers/Stickers$Data;->promotedStickers:Ljava/util/List;

    goto :goto_0
.end method

.method public getRecent()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/stickers/Stickers$RecentSticker;",
            ">;"
        }
    .end annotation

    .prologue
    .line 530
    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mData:Lcom/vkontakte/android/stickers/Stickers$Data;

    if-nez v0, :cond_0

    sget-object v0, Lcom/vkontakte/android/stickers/Stickers;->STUB_LIST:Ljava/util/List;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mData:Lcom/vkontakte/android/stickers/Stickers$Data;

    iget-object v0, v0, Lcom/vkontakte/android/stickers/Stickers$Data;->recentStickers:Ljava/util/List;

    goto :goto_0
.end method

.method public getStickersHash()Ljava/lang/String;
    .locals 4

    .prologue
    .line 477
    iget-object v1, p0, Lcom/vkontakte/android/stickers/Stickers;->mWriteLock:Ljava/lang/Object;

    monitor-enter v1

    .line 478
    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mPrefs:Landroid/content/SharedPreferences;

    const-string/jumbo v2, "stickers_hash"

    const-string/jumbo v3, ""

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    monitor-exit v1

    return-object v0

    .line 479
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public isSuggestsEnabled()Z
    .locals 1

    .prologue
    .line 633
    iget-boolean v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mSuggestsEnabled:Z

    return v0
.end method

.method synthetic lambda$checkServerUpdates$1(Lcom/vkontakte/android/api/store/StoreHasNewItems$Response;)V
    .locals 2
    .param p1, "o"    # Lcom/vkontakte/android/api/store/StoreHasNewItems$Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 155
    iget v1, p1, Lcom/vkontakte/android/api/store/StoreHasNewItems$Response;->storeNewItems:I

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/stickers/Stickers;->setNewItems(I)V

    .line 156
    iget v1, p1, Lcom/vkontakte/android/api/store/StoreHasNewItems$Response;->globalPromotion:I

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/stickers/Stickers;->setGlobalPromotions(I)V

    .line 157
    invoke-virtual {p0}, Lcom/vkontakte/android/stickers/Stickers;->getStickersHash()Ljava/lang/String;

    move-result-object v0

    .line 159
    .local v0, "storedHash":Ljava/lang/String;
    iget-object v1, p1, Lcom/vkontakte/android/api/store/StoreHasNewItems$Response;->stickersVersionHash:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p1, Lcom/vkontakte/android/api/store/StoreHasNewItems$Response;->stickersVersionHash:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 160
    invoke-static {p0, p1}, Lcom/vkontakte/android/stickers/Stickers$$Lambda$7;->lambdaFactory$(Lcom/vkontakte/android/stickers/Stickers;Lcom/vkontakte/android/api/store/StoreHasNewItems$Response;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/stickers/Stickers;->reload(Ljava/lang/Runnable;)V

    .line 162
    :cond_0
    return-void
.end method

.method synthetic lambda$markGlobalPromotionsAsViewed$5(Ljava/lang/Object;)V
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 520
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/stickers/Stickers;->setGlobalPromotions(I)V

    return-void
.end method

.method synthetic lambda$markNewItemsAsViewed$3(Ljava/lang/Object;)V
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 512
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/stickers/Stickers;->setNewItems(I)V

    return-void
.end method

.method synthetic lambda$null$0(Lcom/vkontakte/android/api/store/StoreHasNewItems$Response;)V
    .locals 1
    .param p1, "o"    # Lcom/vkontakte/android/api/store/StoreHasNewItems$Response;

    .prologue
    .line 160
    iget-object v0, p1, Lcom/vkontakte/android/api/store/StoreHasNewItems$Response;->stickersVersionHash:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/stickers/Stickers;->setStickersHash(Ljava/lang/String;)V

    return-void
.end method

.method public markGlobalPromotionsAsViewed()V
    .locals 3

    .prologue
    .line 517
    invoke-virtual {p0}, Lcom/vkontakte/android/stickers/Stickers;->getGlobalPromotions()I

    move-result v0

    if-lez v0, :cond_0

    .line 518
    invoke-static {}, Lcom/vkontakte/android/api/store/StoreMarkAsViewed;->markGlobalPromotionAsViewed()Lcom/vkontakte/android/api/store/StoreMarkAsViewed;

    move-result-object v0

    .line 519
    invoke-virtual {v0}, Lcom/vkontakte/android/api/store/StoreMarkAsViewed;->toObservable()Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {p0}, Lcom/vkontakte/android/stickers/Stickers$$Lambda$5;->lambdaFactory$(Lcom/vkontakte/android/stickers/Stickers;)Lio/reactivex/functions/Consumer;

    move-result-object v1

    invoke-static {}, Lcom/vkontakte/android/stickers/Stickers$$Lambda$6;->lambdaFactory$()Lio/reactivex/functions/Consumer;

    move-result-object v2

    .line 520
    invoke-virtual {v0, v1, v2}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    .line 522
    :cond_0
    return-void
.end method

.method public markNewItemsAsViewed()V
    .locals 3

    .prologue
    .line 509
    invoke-virtual {p0}, Lcom/vkontakte/android/stickers/Stickers;->getNewItems()I

    move-result v0

    if-lez v0, :cond_0

    .line 510
    invoke-static {}, Lcom/vkontakte/android/api/store/StoreMarkAsViewed;->markNewItemsAsViewed()Lcom/vkontakte/android/api/store/StoreMarkAsViewed;

    move-result-object v0

    .line 511
    invoke-virtual {v0}, Lcom/vkontakte/android/api/store/StoreMarkAsViewed;->toObservable()Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {p0}, Lcom/vkontakte/android/stickers/Stickers$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/stickers/Stickers;)Lio/reactivex/functions/Consumer;

    move-result-object v1

    invoke-static {}, Lcom/vkontakte/android/stickers/Stickers$$Lambda$4;->lambdaFactory$()Lio/reactivex/functions/Consumer;

    move-result-object v2

    .line 512
    invoke-virtual {v0, v1, v2}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    .line 514
    :cond_0
    return-void
.end method

.method public purchase(Lcom/vkontakte/android/data/orm/StickerStockItem;)V
    .locals 9
    .param p1, "item"    # Lcom/vkontakte/android/data/orm/StickerStockItem;

    .prologue
    const/4 v8, 0x1

    .line 326
    iget-object v4, p0, Lcom/vkontakte/android/stickers/Stickers;->mWriteLock:Ljava/lang/Object;

    monitor-enter v4

    .line 327
    const/4 v2, 0x0

    .line 328
    .local v2, "idsToUpdate":[I
    :try_start_0
    iget-object v3, p0, Lcom/vkontakte/android/stickers/Stickers;->mData:Lcom/vkontakte/android/stickers/Stickers$Data;

    iget-object v3, v3, Lcom/vkontakte/android/stickers/Stickers$Data;->allStickers:Ljava/util/Map;

    iget v5, p1, Lcom/vkontakte/android/data/orm/StickerStockItem;->id:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v3, v5, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 329
    iget-boolean v3, p1, Lcom/vkontakte/android/data/orm/StickerStockItem;->active:Z

    if-eqz v3, :cond_0

    .line 330
    const/4 v3, 0x0

    iput v3, p1, Lcom/vkontakte/android/data/orm/StickerStockItem;->order:I

    .line 331
    iget-object v3, p0, Lcom/vkontakte/android/stickers/Stickers;->mData:Lcom/vkontakte/android/stickers/Stickers$Data;

    iget-object v3, v3, Lcom/vkontakte/android/stickers/Stickers$Data;->activatedStickers:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    new-array v2, v3, [I

    .line 332
    iget-object v3, p0, Lcom/vkontakte/android/stickers/Stickers;->mData:Lcom/vkontakte/android/stickers/Stickers$Data;

    iget-object v3, v3, Lcom/vkontakte/android/stickers/Stickers$Data;->activatedStickers:Ljava/util/List;

    const/4 v5, 0x0

    invoke-interface {v3, v5, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 333
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_0
    iget-object v3, p0, Lcom/vkontakte/android/stickers/Stickers;->mData:Lcom/vkontakte/android/stickers/Stickers$Data;

    iget-object v3, v3, Lcom/vkontakte/android/stickers/Stickers$Data;->activatedStickers:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v1, v3, :cond_0

    .line 334
    add-int/lit8 v5, v1, -0x1

    iget-object v3, p0, Lcom/vkontakte/android/stickers/Stickers;->mData:Lcom/vkontakte/android/stickers/Stickers$Data;

    iget-object v3, v3, Lcom/vkontakte/android/stickers/Stickers$Data;->activatedStickers:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/data/orm/StickerStockItem;

    iget v3, v3, Lcom/vkontakte/android/data/orm/StickerStockItem;->id:I

    aput v3, v2, v5

    .line 333
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 337
    .end local v1    # "i":I
    :cond_0
    iget-object v3, p0, Lcom/vkontakte/android/stickers/Stickers;->mData:Lcom/vkontakte/android/stickers/Stickers$Data;

    iget-object v3, v3, Lcom/vkontakte/android/stickers/Stickers$Data;->promotedStickers:Ljava/util/List;

    invoke-interface {v3, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 339
    iget-object v3, p0, Lcom/vkontakte/android/stickers/Stickers;->mManager:Lcom/vkontakte/android/orm/EntityManager;

    invoke-virtual {v3}, Lcom/vkontakte/android/orm/EntityManager;->beginTransaction()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 341
    :try_start_1
    iget-object v3, p0, Lcom/vkontakte/android/stickers/Stickers;->mManager:Lcom/vkontakte/android/orm/EntityManager;

    invoke-virtual {v3, p1}, Lcom/vkontakte/android/orm/EntityManager;->save(Ljava/lang/Object;)I

    .line 342
    iget-object v3, p0, Lcom/vkontakte/android/stickers/Stickers;->mManager:Lcom/vkontakte/android/orm/EntityManager;

    const-class v5, Lcom/vkontakte/android/data/orm/StickerStockItem;

    invoke-virtual {v3, v5}, Lcom/vkontakte/android/orm/EntityManager;->createQuery(Ljava/lang/Class;)Lcom/vkontakte/android/orm/Query;

    move-result-object v3

    const-string/jumbo v5, "id"

    invoke-virtual {v3, v5}, Lcom/vkontakte/android/orm/Query;->where(Ljava/lang/String;)Lcom/vkontakte/android/orm/Query;

    move-result-object v3

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v2, v5, v6

    invoke-virtual {v3, v5}, Lcom/vkontakte/android/orm/Query;->in([Ljava/lang/Object;)Lcom/vkontakte/android/orm/Query;

    move-result-object v3

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string/jumbo v7, "user_order"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string/jumbo v7, "`user_order` + 1"

    aput-object v7, v5, v6

    invoke-virtual {v3, v5}, Lcom/vkontakte/android/orm/Query;->rawUpdate([Ljava/lang/Object;)V

    .line 343
    iget-object v3, p0, Lcom/vkontakte/android/stickers/Stickers;->mManager:Lcom/vkontakte/android/orm/EntityManager;

    invoke-virtual {v3}, Lcom/vkontakte/android/orm/EntityManager;->commit()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 347
    :goto_1
    :try_start_2
    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 348
    invoke-direct {p0, p1}, Lcom/vkontakte/android/stickers/Stickers;->broadcastUpdate(Lcom/vkontakte/android/data/orm/StickerStockItem;)V

    .line 350
    invoke-virtual {p0, v8}, Lcom/vkontakte/android/stickers/Stickers;->reloadAutoSuggestDictionaryIfNeeded(Z)V

    .line 351
    return-void

    .line 344
    :catch_0
    move-exception v0

    .line 345
    .local v0, "e":Ljava/lang/Throwable;
    :try_start_3
    iget-object v3, p0, Lcom/vkontakte/android/stickers/Stickers;->mManager:Lcom/vkontakte/android/orm/EntityManager;

    invoke-virtual {v3}, Lcom/vkontakte/android/orm/EntityManager;->rollback()V

    goto :goto_1

    .line 347
    .end local v0    # "e":Ljava/lang/Throwable;
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v3
.end method

.method public reload()V
    .locals 1

    .prologue
    .line 255
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/stickers/Stickers;->reload(Ljava/lang/Runnable;)V

    .line 256
    return-void
.end method

.method public reload(Ljava/lang/Runnable;)V
    .locals 2
    .param p1, "runAfter"    # Ljava/lang/Runnable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 259
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->isReal()Z

    move-result v0

    if-nez v0, :cond_0

    .line 305
    :goto_0
    return-void

    .line 262
    :cond_0
    new-instance v0, Lcom/vkontakte/android/stickers/Stickers$GetInfo;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/stickers/Stickers$GetInfo;-><init>(Lcom/vkontakte/android/stickers/Stickers;)V

    new-instance v1, Lcom/vkontakte/android/stickers/Stickers$3;

    invoke-direct {v1, p0, p1}, Lcom/vkontakte/android/stickers/Stickers$3;-><init>(Lcom/vkontakte/android/stickers/Stickers;Ljava/lang/Runnable;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/stickers/Stickers$GetInfo;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 304
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method

.method public reloadAutoSuggestDictionaryIfNeeded(Z)V
    .locals 8
    .param p1, "force"    # Z

    .prologue
    .line 224
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-object v1, p0, Lcom/vkontakte/android/stickers/Stickers;->mPrefs:Landroid/content/SharedPreferences;

    const-string/jumbo v4, "auto_suggest_last_loaded"

    const-wide/16 v6, 0x0

    invoke-interface {v1, v4, v6, v7}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    sub-long/2addr v2, v4

    const-wide/32 v4, 0x2932e00

    cmp-long v1, v2, v4

    if-lez v1, :cond_2

    const/4 v0, 0x1

    .line 225
    .local v0, "exprired":Z
    :goto_0
    const-string/jumbo v1, "Stickers"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "reloadAutoSuggestDictionaryIfNeeded force = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ", expired = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 227
    if-nez v0, :cond_0

    if-eqz p1, :cond_1

    .line 229
    :cond_0
    new-instance v1, Lcom/vkontakte/android/stickers/Stickers$GetAutoSuggestDictionaryRequest;

    invoke-direct {v1}, Lcom/vkontakte/android/stickers/Stickers$GetAutoSuggestDictionaryRequest;-><init>()V

    new-instance v2, Lcom/vkontakte/android/stickers/Stickers$2;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/stickers/Stickers$2;-><init>(Lcom/vkontakte/android/stickers/Stickers;)V

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/stickers/Stickers$GetAutoSuggestDictionaryRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 249
    invoke-virtual {v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    .line 251
    :cond_1
    return-void

    .line 224
    .end local v0    # "exprired":Z
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setActive(Lcom/vkontakte/android/data/orm/StickerStockItem;Z)V
    .locals 6
    .param p1, "item"    # Lcom/vkontakte/android/data/orm/StickerStockItem;
    .param p2, "activate"    # Z

    .prologue
    .line 354
    iget-object v2, p0, Lcom/vkontakte/android/stickers/Stickers;->mWriteLock:Ljava/lang/Object;

    monitor-enter v2

    .line 355
    :try_start_0
    iput-boolean p2, p1, Lcom/vkontakte/android/data/orm/StickerStockItem;->active:Z

    .line 357
    iget-object v1, p0, Lcom/vkontakte/android/stickers/Stickers;->mData:Lcom/vkontakte/android/stickers/Stickers$Data;

    iget-object v1, v1, Lcom/vkontakte/android/stickers/Stickers$Data;->allStickers:Ljava/util/Map;

    iget v3, p1, Lcom/vkontakte/android/data/orm/StickerStockItem;->id:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 358
    if-eqz p2, :cond_0

    .line 359
    iget-object v1, p0, Lcom/vkontakte/android/stickers/Stickers;->mData:Lcom/vkontakte/android/stickers/Stickers$Data;

    iget-object v1, v1, Lcom/vkontakte/android/stickers/Stickers$Data;->activatedStickers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    iput v1, p1, Lcom/vkontakte/android/data/orm/StickerStockItem;->order:I

    .line 360
    iget-object v1, p0, Lcom/vkontakte/android/stickers/Stickers;->mData:Lcom/vkontakte/android/stickers/Stickers$Data;

    iget-object v1, v1, Lcom/vkontakte/android/stickers/Stickers$Data;->activatedStickers:Ljava/util/List;

    iget v3, p1, Lcom/vkontakte/android/data/orm/StickerStockItem;->order:I

    invoke-interface {v1, v3, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 366
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/stickers/Stickers;->mManager:Lcom/vkontakte/android/orm/EntityManager;

    invoke-virtual {v1}, Lcom/vkontakte/android/orm/EntityManager;->beginTransaction()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 368
    :try_start_1
    iget-object v1, p0, Lcom/vkontakte/android/stickers/Stickers;->mManager:Lcom/vkontakte/android/orm/EntityManager;

    const-class v3, Lcom/vkontakte/android/data/orm/StickerStockItem;

    invoke-virtual {v1, v3}, Lcom/vkontakte/android/orm/EntityManager;->createQuery(Ljava/lang/Class;)Lcom/vkontakte/android/orm/Query;

    move-result-object v1

    const-string/jumbo v3, "id"

    invoke-virtual {v1, v3}, Lcom/vkontakte/android/orm/Query;->where(Ljava/lang/String;)Lcom/vkontakte/android/orm/Query;

    move-result-object v1

    iget v3, p1, Lcom/vkontakte/android/data/orm/StickerStockItem;->id:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/vkontakte/android/orm/Query;->isEqualTo(Ljava/lang/Object;)Lcom/vkontakte/android/orm/Query;

    move-result-object v1

    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string/jumbo v5, "active"

    aput-object v5, v3, v4

    const/4 v4, 0x1

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x2

    const-string/jumbo v5, "user_order"

    aput-object v5, v3, v4

    const/4 v4, 0x3

    iget v5, p1, Lcom/vkontakte/android/data/orm/StickerStockItem;->order:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v1, v3}, Lcom/vkontakte/android/orm/Query;->update([Ljava/lang/Object;)V

    .line 369
    iget-object v1, p0, Lcom/vkontakte/android/stickers/Stickers;->mManager:Lcom/vkontakte/android/orm/EntityManager;

    invoke-virtual {v1}, Lcom/vkontakte/android/orm/EntityManager;->commit()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 373
    :goto_1
    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 374
    invoke-direct {p0, p1}, Lcom/vkontakte/android/stickers/Stickers;->broadcastUpdate(Lcom/vkontakte/android/data/orm/StickerStockItem;)V

    .line 376
    invoke-direct {p0}, Lcom/vkontakte/android/stickers/Stickers;->resetLastLoadedTimestampForDeferredReload()V

    .line 377
    return-void

    .line 362
    :cond_0
    const/4 v1, 0x0

    :try_start_3
    iput v1, p1, Lcom/vkontakte/android/data/orm/StickerStockItem;->order:I

    .line 363
    iget-object v1, p0, Lcom/vkontakte/android/stickers/Stickers;->mData:Lcom/vkontakte/android/stickers/Stickers$Data;

    iget-object v1, v1, Lcom/vkontakte/android/stickers/Stickers$Data;->activatedStickers:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    .line 373
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1

    .line 370
    :catch_0
    move-exception v0

    .line 371
    .local v0, "e":Ljava/lang/Throwable;
    :try_start_4
    iget-object v1, p0, Lcom/vkontakte/android/stickers/Stickers;->mManager:Lcom/vkontakte/android/orm/EntityManager;

    invoke-virtual {v1}, Lcom/vkontakte/android/orm/EntityManager;->rollback()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1
.end method

.method public setGlobalPromotions(I)V
    .locals 4
    .param p1, "value"    # I

    .prologue
    .line 493
    iget v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mNumGlobalPromotions:I

    if-eq p1, v0, :cond_0

    .line 494
    iget-object v1, p0, Lcom/vkontakte/android/stickers/Stickers;->mWriteLock:Ljava/lang/Object;

    monitor-enter v1

    .line 495
    :try_start_0
    iput p1, p0, Lcom/vkontakte/android/stickers/Stickers;->mNumGlobalPromotions:I

    .line 496
    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v2, "num_global_promotions"

    iget v3, p0, Lcom/vkontakte/android/stickers/Stickers;->mNumGlobalPromotions:I

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 497
    invoke-direct {p0}, Lcom/vkontakte/android/stickers/Stickers;->broadcastNumUpdates()V

    .line 498
    monitor-exit v1

    .line 500
    :cond_0
    return-void

    .line 498
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setNewItems(I)V
    .locals 4
    .param p1, "numNewItems"    # I

    .prologue
    .line 483
    iget v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mNumNewItems:I

    if-eq p1, v0, :cond_0

    .line 484
    iget-object v1, p0, Lcom/vkontakte/android/stickers/Stickers;->mWriteLock:Ljava/lang/Object;

    monitor-enter v1

    .line 485
    :try_start_0
    iput p1, p0, Lcom/vkontakte/android/stickers/Stickers;->mNumNewItems:I

    .line 486
    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v2, "num_new_items"

    iget v3, p0, Lcom/vkontakte/android/stickers/Stickers;->mNumNewItems:I

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 487
    invoke-direct {p0}, Lcom/vkontakte/android/stickers/Stickers;->broadcastNumNewItems()V

    .line 488
    monitor-exit v1

    .line 490
    :cond_0
    return-void

    .line 488
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setStickersHash(Ljava/lang/String;)V
    .locals 3
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 503
    iget-object v1, p0, Lcom/vkontakte/android/stickers/Stickers;->mWriteLock:Ljava/lang/Object;

    monitor-enter v1

    .line 504
    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v2, "stickers_hash"

    invoke-interface {v0, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 505
    monitor-exit v1

    .line 506
    return-void

    .line 505
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setSuggestsEnabled(Z)V
    .locals 2
    .param p1, "suggestsEnabled"    # Z

    .prologue
    .line 621
    iget-boolean v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mSuggestsEnabled:Z

    if-eq p1, v0, :cond_0

    .line 622
    iput-boolean p1, p0, Lcom/vkontakte/android/stickers/Stickers;->mSuggestsEnabled:Z

    .line 624
    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "suggests_enabled"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 626
    if-eqz p1, :cond_0

    .line 627
    invoke-direct {p0}, Lcom/vkontakte/android/stickers/Stickers;->resetLastLoadedTimestampForDeferredReload()V

    .line 630
    :cond_0
    return-void
.end method

.method public swap(II)V
    .locals 16
    .param p1, "newPosition"    # I
    .param p2, "oldPosition"    # I

    .prologue
    .line 380
    move/from16 v0, p1

    move/from16 v1, p2

    if-ge v0, v1, :cond_0

    const/4 v9, 0x1

    .line 383
    .local v9, "movedToTop":Z
    :goto_0
    if-eqz v9, :cond_1

    .line 384
    add-int/lit8 v10, p1, 0x1

    .line 385
    .local v10, "start":I
    add-int/lit8 v3, p2, 0x1

    .line 391
    .local v3, "end":I
    :goto_1
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vkontakte/android/stickers/Stickers;->mWriteLock:Ljava/lang/Object;

    monitor-enter v12

    .line 392
    :try_start_0
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/stickers/Stickers;->mData:Lcom/vkontakte/android/stickers/Stickers$Data;

    iget-object v11, v11, Lcom/vkontakte/android/stickers/Stickers$Data;->activatedStickers:Ljava/util/List;

    move/from16 v0, p2

    invoke-interface {v11, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/vkontakte/android/data/orm/StickerStockItem;

    .line 393
    .local v7, "item":Lcom/vkontakte/android/data/orm/StickerStockItem;
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/stickers/Stickers;->mData:Lcom/vkontakte/android/stickers/Stickers$Data;

    iget-object v11, v11, Lcom/vkontakte/android/stickers/Stickers$Data;->activatedStickers:Ljava/util/List;

    move/from16 v0, p1

    invoke-interface {v11, v0, v7}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 394
    move/from16 v0, p1

    iput v0, v7, Lcom/vkontakte/android/data/orm/StickerStockItem;->order:I

    .line 396
    sub-int v11, v3, v10

    new-array v6, v11, [I

    .line 398
    .local v6, "idsToUpdate":[I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_2
    array-length v11, v6

    if-ge v5, v11, :cond_2

    .line 399
    add-int v8, v5, v10

    .line 400
    .local v8, "location":I
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/stickers/Stickers;->mData:Lcom/vkontakte/android/stickers/Stickers$Data;

    iget-object v11, v11, Lcom/vkontakte/android/stickers/Stickers$Data;->activatedStickers:Ljava/util/List;

    invoke-interface {v11, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/data/orm/StickerStockItem;

    .line 401
    .local v4, "entry":Lcom/vkontakte/android/data/orm/StickerStockItem;
    iput v8, v4, Lcom/vkontakte/android/data/orm/StickerStockItem;->order:I

    .line 402
    iget v11, v4, Lcom/vkontakte/android/data/orm/StickerStockItem;->id:I

    aput v11, v6, v5

    .line 398
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 380
    .end local v3    # "end":I
    .end local v4    # "entry":Lcom/vkontakte/android/data/orm/StickerStockItem;
    .end local v5    # "i":I
    .end local v6    # "idsToUpdate":[I
    .end local v7    # "item":Lcom/vkontakte/android/data/orm/StickerStockItem;
    .end local v8    # "location":I
    .end local v9    # "movedToTop":Z
    .end local v10    # "start":I
    :cond_0
    const/4 v9, 0x0

    goto :goto_0

    .line 387
    .restart local v9    # "movedToTop":Z
    :cond_1
    move/from16 v10, p2

    .line 388
    .restart local v10    # "start":I
    move/from16 v3, p1

    .restart local v3    # "end":I
    goto :goto_1

    .line 405
    .restart local v5    # "i":I
    .restart local v6    # "idsToUpdate":[I
    .restart local v7    # "item":Lcom/vkontakte/android/data/orm/StickerStockItem;
    :cond_2
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/stickers/Stickers;->mManager:Lcom/vkontakte/android/orm/EntityManager;

    invoke-virtual {v11}, Lcom/vkontakte/android/orm/EntityManager;->beginTransaction()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 407
    :try_start_1
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/stickers/Stickers;->mManager:Lcom/vkontakte/android/orm/EntityManager;

    const-class v13, Lcom/vkontakte/android/data/orm/StickerStockItem;

    invoke-virtual {v11, v13}, Lcom/vkontakte/android/orm/EntityManager;->createQuery(Ljava/lang/Class;)Lcom/vkontakte/android/orm/Query;

    move-result-object v11

    const-string/jumbo v13, "id"

    invoke-virtual {v11, v13}, Lcom/vkontakte/android/orm/Query;->where(Ljava/lang/String;)Lcom/vkontakte/android/orm/Query;

    move-result-object v11

    iget v13, v7, Lcom/vkontakte/android/data/orm/StickerStockItem;->id:I

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v11, v13}, Lcom/vkontakte/android/orm/Query;->isEqualTo(Ljava/lang/Object;)Lcom/vkontakte/android/orm/Query;

    move-result-object v11

    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    const-string/jumbo v15, "user_order"

    aput-object v15, v13, v14

    const/4 v14, 0x1

    iget v15, v7, Lcom/vkontakte/android/data/orm/StickerStockItem;->order:I

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v13, v14

    invoke-virtual {v11, v13}, Lcom/vkontakte/android/orm/Query;->update([Ljava/lang/Object;)V

    .line 408
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/stickers/Stickers;->mManager:Lcom/vkontakte/android/orm/EntityManager;

    const-class v13, Lcom/vkontakte/android/data/orm/StickerStockItem;

    invoke-virtual {v11, v13}, Lcom/vkontakte/android/orm/EntityManager;->createQuery(Ljava/lang/Class;)Lcom/vkontakte/android/orm/Query;

    move-result-object v11

    const-string/jumbo v13, "id"

    invoke-virtual {v11, v13}, Lcom/vkontakte/android/orm/Query;->where(Ljava/lang/String;)Lcom/vkontakte/android/orm/Query;

    move-result-object v11

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    aput-object v6, v13, v14

    invoke-virtual {v11, v13}, Lcom/vkontakte/android/orm/Query;->in([Ljava/lang/Object;)Lcom/vkontakte/android/orm/Query;

    move-result-object v13

    const/4 v11, 0x2

    new-array v14, v11, [Ljava/lang/Object;

    const/4 v11, 0x0

    const-string/jumbo v15, "user_order"

    aput-object v15, v14, v11

    const/4 v15, 0x1

    if-eqz v9, :cond_3

    const-string/jumbo v11, "`user_order` + 1"

    :goto_3
    aput-object v11, v14, v15

    invoke-virtual {v13, v14}, Lcom/vkontakte/android/orm/Query;->rawUpdate([Ljava/lang/Object;)V

    .line 409
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/stickers/Stickers;->mManager:Lcom/vkontakte/android/orm/EntityManager;

    invoke-virtual {v11}, Lcom/vkontakte/android/orm/EntityManager;->commit()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 413
    :try_start_2
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/stickers/Stickers;->broadcastReloaded()V

    .line 415
    :goto_4
    monitor-exit v12
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 417
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/stickers/Stickers;->resetLastLoadedTimestampForDeferredReload()V

    .line 418
    return-void

    .line 408
    :cond_3
    :try_start_3
    const-string/jumbo v11, "`user_order` - 1"
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_3

    .line 410
    :catch_0
    move-exception v2

    .line 411
    .local v2, "e":Ljava/lang/Throwable;
    :try_start_4
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/stickers/Stickers;->mManager:Lcom/vkontakte/android/orm/EntityManager;

    invoke-virtual {v11}, Lcom/vkontakte/android/orm/EntityManager;->rollback()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 413
    :try_start_5
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/stickers/Stickers;->broadcastReloaded()V

    goto :goto_4

    .line 415
    .end local v2    # "e":Ljava/lang/Throwable;
    .end local v5    # "i":I
    .end local v6    # "idsToUpdate":[I
    .end local v7    # "item":Lcom/vkontakte/android/data/orm/StickerStockItem;
    :catchall_0
    move-exception v11

    monitor-exit v12
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    throw v11

    .line 413
    .restart local v5    # "i":I
    .restart local v6    # "idsToUpdate":[I
    .restart local v7    # "item":Lcom/vkontakte/android/data/orm/StickerStockItem;
    :catchall_1
    move-exception v11

    :try_start_6
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/stickers/Stickers;->broadcastReloaded()V

    throw v11
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0
.end method
