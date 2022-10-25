.class public Lcom/vk/masks/MasksStorage;
.super Ljava/lang/Object;
.source "MasksStorage.java"


# static fields
.field private static final JSON_KEY_FILES_COUNT:Ljava/lang/String; = "files_count"

.field private static final JSON_KEY_ID:Ljava/lang/String; = "id"

.field private static final KEY_FILES_COUNT_LIST:Ljava/lang/String; = "files_count_list"

.field private static final KEY_MASKS_LIST:Ljava/lang/String; = "masks_list"

.field private static final LIMIT:I = 0x3c

.field private static final diskExecutor:Ljava/util/concurrent/ExecutorService;

.field private static volatile instance:Lcom/vk/masks/MasksStorage;


# instance fields
.field private final diskStorage:Lcom/vk/attachpicker/util/Prefs;

.field private final masksFilesCount:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final masksList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/masks/model/Mask;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 27
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/vk/masks/MasksStorage;->diskExecutor:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method private constructor <init>()V
    .locals 10

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    new-instance v7, Lcom/vk/attachpicker/util/Prefs;

    const-string/jumbo v8, "masks_storage"

    invoke-direct {v7, v8}, Lcom/vk/attachpicker/util/Prefs;-><init>(Ljava/lang/String;)V

    iput-object v7, p0, Lcom/vk/masks/MasksStorage;->diskStorage:Lcom/vk/attachpicker/util/Prefs;

    .line 52
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iput-object v7, p0, Lcom/vk/masks/MasksStorage;->masksList:Ljava/util/ArrayList;

    .line 53
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    iput-object v7, p0, Lcom/vk/masks/MasksStorage;->masksFilesCount:Ljava/util/HashMap;

    .line 55
    iget-object v7, p0, Lcom/vk/masks/MasksStorage;->diskStorage:Lcom/vk/attachpicker/util/Prefs;

    const-string/jumbo v8, "masks_list"

    invoke-virtual {v7, v8}, Lcom/vk/attachpicker/util/Prefs;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 56
    .local v5, "rawMasksList":Ljava/lang/String;
    iget-object v7, p0, Lcom/vk/masks/MasksStorage;->diskStorage:Lcom/vk/attachpicker/util/Prefs;

    const-string/jumbo v8, "files_count_list"

    invoke-virtual {v7, v8}, Lcom/vk/attachpicker/util/Prefs;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 57
    .local v6, "rawPathsList":Ljava/lang/String;
    if-eqz v5, :cond_2

    if-eqz v6, :cond_2

    .line 59
    :try_start_0
    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3, v5}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 60
    .local v3, "jsonMasksList":Lorg/json/JSONArray;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v1, v7, :cond_0

    .line 61
    iget-object v7, p0, Lcom/vk/masks/MasksStorage;->masksList:Ljava/util/ArrayList;

    new-instance v8, Lcom/vk/masks/model/Mask;

    invoke-virtual {v3, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v9

    invoke-direct {v8, v9}, Lcom/vk/masks/model/Mask;-><init>(Lorg/json/JSONObject;)V

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 60
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 64
    :cond_0
    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4, v6}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 65
    .local v4, "jsonPathsList":Lorg/json/JSONArray;
    const/4 v1, 0x0

    :goto_1
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v1, v7, :cond_1

    .line 66
    invoke-virtual {v4, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 67
    .local v2, "jo":Lorg/json/JSONObject;
    iget-object v7, p0, Lcom/vk/masks/MasksStorage;->masksFilesCount:Ljava/util/HashMap;

    const-string/jumbo v8, "id"

    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, "files_count"

    invoke-virtual {v2, v9}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 70
    .end local v2    # "jo":Lorg/json/JSONObject;
    :cond_1
    iget-object v7, p0, Lcom/vk/masks/MasksStorage;->masksList:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    iget-object v8, p0, Lcom/vk/masks/MasksStorage;->masksFilesCount:Ljava/util/HashMap;

    invoke-virtual {v8}, Ljava/util/HashMap;->size()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v8

    if-eq v7, v8, :cond_2

    .line 78
    .end local v1    # "i":I
    .end local v3    # "jsonMasksList":Lorg/json/JSONArray;
    .end local v4    # "jsonPathsList":Lorg/json/JSONArray;
    :cond_2
    :goto_2
    return-void

    .line 73
    :catch_0
    move-exception v0

    .line 74
    .local v0, "e":Ljava/lang/Exception;
    iget-object v7, p0, Lcom/vk/masks/MasksStorage;->diskStorage:Lcom/vk/attachpicker/util/Prefs;

    invoke-virtual {v7}, Lcom/vk/attachpicker/util/Prefs;->clear()V

    .line 75
    invoke-static {v0}, Lcom/crashlytics/android/Crashlytics;->logException(Ljava/lang/Throwable;)V

    goto :goto_2
.end method

.method static synthetic access$000(Lcom/vk/masks/MasksStorage;)Lcom/vk/attachpicker/util/Prefs;
    .locals 1
    .param p0, "x0"    # Lcom/vk/masks/MasksStorage;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/vk/masks/MasksStorage;->diskStorage:Lcom/vk/attachpicker/util/Prefs;

    return-object v0
.end method

.method private deleteMaskInternal(Lcom/vk/masks/model/Mask;)V
    .locals 2
    .param p1, "mask"    # Lcom/vk/masks/model/Mask;

    .prologue
    .line 177
    iget-object v0, p0, Lcom/vk/masks/MasksStorage;->masksList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 178
    iget-object v0, p0, Lcom/vk/masks/MasksStorage;->masksFilesCount:Ljava/util/HashMap;

    invoke-virtual {p1}, Lcom/vk/masks/model/Mask;->getFullId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    sget-object v0, Lcom/vk/masks/MasksStorage;->diskExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/vk/masks/MasksStorage$1;

    invoke-direct {v1, p0, p1}, Lcom/vk/masks/MasksStorage$1;-><init>(Lcom/vk/masks/MasksStorage;Lcom/vk/masks/model/Mask;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 186
    return-void
.end method

.method private dumpToDisk()V
    .locals 4

    .prologue
    .line 189
    iget-object v2, p0, Lcom/vk/masks/MasksStorage;->masksList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    iget-object v3, p0, Lcom/vk/masks/MasksStorage;->masksFilesCount:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->size()I

    move-result v3

    if-eq v2, v3, :cond_0

    .line 192
    :cond_0
    invoke-virtual {p0}, Lcom/vk/masks/MasksStorage;->recentMasks()Lcom/vkontakte/android/data/VKList;

    move-result-object v0

    .line 193
    .local v0, "masksToSave":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/masks/model/Mask;>;"
    new-instance v1, Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    .line 194
    .local v1, "pathsToSave":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    iget-object v2, p0, Lcom/vk/masks/MasksStorage;->masksFilesCount:Ljava/util/HashMap;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 196
    sget-object v2, Lcom/vk/masks/MasksStorage;->diskExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance v3, Lcom/vk/masks/MasksStorage$2;

    invoke-direct {v3, p0, v0, v1}, Lcom/vk/masks/MasksStorage$2;-><init>(Lcom/vk/masks/MasksStorage;Ljava/util/ArrayList;Ljava/util/HashMap;)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 226
    return-void
.end method

.method static declared-synchronized getInstance()Lcom/vk/masks/MasksStorage;
    .locals 3

    .prologue
    .line 36
    const-class v1, Lcom/vk/masks/MasksStorage;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/vk/masks/MasksStorage;->instance:Lcom/vk/masks/MasksStorage;

    if-nez v0, :cond_1

    .line 37
    const-class v2, Lcom/vk/masks/MasksStorage;

    monitor-enter v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 38
    :try_start_1
    sget-object v0, Lcom/vk/masks/MasksStorage;->instance:Lcom/vk/masks/MasksStorage;

    if-nez v0, :cond_0

    .line 39
    new-instance v0, Lcom/vk/masks/MasksStorage;

    invoke-direct {v0}, Lcom/vk/masks/MasksStorage;-><init>()V

    sput-object v0, Lcom/vk/masks/MasksStorage;->instance:Lcom/vk/masks/MasksStorage;

    .line 41
    :cond_0
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 43
    :cond_1
    :try_start_2
    sget-object v0, Lcom/vk/masks/MasksStorage;->instance:Lcom/vk/masks/MasksStorage;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    monitor-exit v1

    return-object v0

    .line 41
    :catchall_0
    move-exception v0

    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 36
    :catchall_1
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 167
    iget-object v0, p0, Lcom/vk/masks/MasksStorage;->masksList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 168
    iget-object v0, p0, Lcom/vk/masks/MasksStorage;->masksFilesCount:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 169
    iget-object v0, p0, Lcom/vk/masks/MasksStorage;->diskStorage:Lcom/vk/attachpicker/util/Prefs;

    invoke-virtual {v0}, Lcom/vk/attachpicker/util/Prefs;->clear()V

    .line 171
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/vk/media/camera/CameraUtilsEffects;->engineDataDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/FileUtils;->doubleTryDeleteFile(Ljava/io/File;)V

    .line 172
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/vk/media/camera/CameraUtilsEffects;->allEffectsDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/FileUtils;->doubleTryDeleteFile(Ljava/io/File;)V

    .line 173
    invoke-static {}, Lcom/vk/masks/MasksPrefs;->instance()Lcom/vk/masks/MasksPrefs;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/masks/MasksPrefs;->clear()V

    .line 174
    return-void
.end method

.method public deleteMask(Lcom/vk/masks/model/Mask;)V
    .locals 0
    .param p1, "mask"    # Lcom/vk/masks/model/Mask;

    .prologue
    .line 162
    invoke-direct {p0, p1}, Lcom/vk/masks/MasksStorage;->deleteMaskInternal(Lcom/vk/masks/model/Mask;)V

    .line 163
    invoke-direct {p0}, Lcom/vk/masks/MasksStorage;->dumpToDisk()V

    .line 164
    return-void
.end method

.method public getMaskFilesCount(Lcom/vk/masks/model/Mask;)I
    .locals 3
    .param p1, "mask"    # Lcom/vk/masks/model/Mask;

    .prologue
    .line 100
    iget-object v1, p0, Lcom/vk/masks/MasksStorage;->masksFilesCount:Ljava/util/HashMap;

    invoke-virtual {p1}, Lcom/vk/masks/model/Mask;->getFullId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 101
    .local v0, "count":Ljava/lang/Integer;
    if-eqz v0, :cond_0

    .line 102
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 104
    :goto_0
    return v1

    :cond_0
    const/4 v1, -0x1

    goto :goto_0
.end method

.method public hasCachedMasks()Z
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lcom/vk/masks/MasksStorage;->masksList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isDownloaded(Lcom/vk/masks/model/Mask;)Z
    .locals 2
    .param p1, "mask"    # Lcom/vk/masks/model/Mask;

    .prologue
    .line 85
    iget-object v0, p0, Lcom/vk/masks/MasksStorage;->masksFilesCount:Ljava/util/HashMap;

    invoke-virtual {p1}, Lcom/vk/masks/model/Mask;->getFullId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isInList(Lcom/vk/masks/model/Mask;)Z
    .locals 3
    .param p1, "mask"    # Lcom/vk/masks/model/Mask;

    .prologue
    .line 89
    const/4 v1, -0x1

    .line 90
    .local v1, "position":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/vk/masks/MasksStorage;->masksList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 91
    iget-object v2, p0, Lcom/vk/masks/MasksStorage;->masksList:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vk/masks/model/Mask;

    invoke-virtual {v2, p1}, Lcom/vk/masks/model/Mask;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 92
    move v1, v0

    .line 96
    :cond_0
    if-ltz v1, :cond_2

    const/4 v2, 0x1

    :goto_1
    return v2

    .line 90
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 96
    :cond_2
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public raiseMask(Lcom/vk/masks/model/Mask;)V
    .locals 4
    .param p1, "mask"    # Lcom/vk/masks/model/Mask;

    .prologue
    .line 144
    iget-object v2, p0, Lcom/vk/masks/MasksStorage;->masksList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x2

    if-ge v2, v3, :cond_0

    .line 159
    :goto_0
    return-void

    .line 148
    :cond_0
    const/4 v1, -0x1

    .line 149
    .local v1, "position":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v2, p0, Lcom/vk/masks/MasksStorage;->masksList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 150
    iget-object v2, p0, Lcom/vk/masks/MasksStorage;->masksList:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vk/masks/model/Mask;

    invoke-virtual {v2, p1}, Lcom/vk/masks/model/Mask;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 151
    move v1, v0

    .line 155
    :cond_1
    if-lez v1, :cond_2

    .line 156
    iget-object v2, p0, Lcom/vk/masks/MasksStorage;->masksList:Ljava/util/ArrayList;

    const/4 v3, 0x0

    invoke-static {v2, v3, v1}, Ljava/util/Collections;->swap(Ljava/util/List;II)V

    .line 158
    :cond_2
    invoke-direct {p0}, Lcom/vk/masks/MasksStorage;->dumpToDisk()V

    goto :goto_0

    .line 149
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public recentMasks()Lcom/vkontakte/android/data/VKList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vk/masks/model/Mask;",
            ">;"
        }
    .end annotation

    .prologue
    .line 109
    new-instance v0, Lcom/vkontakte/android/data/VKList;

    invoke-direct {v0}, Lcom/vkontakte/android/data/VKList;-><init>()V

    .line 110
    .local v0, "masks":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vk/masks/model/Mask;>;"
    iget-object v1, p0, Lcom/vk/masks/MasksStorage;->masksList:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/data/VKList;->addAll(Ljava/util/Collection;)Z

    .line 111
    invoke-virtual {v0}, Lcom/vkontakte/android/data/VKList;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/data/VKList;->setTotal(I)V

    .line 112
    return-object v0
.end method

.method public declared-synchronized saveNewMask(Lcom/vk/masks/model/Mask;I)V
    .locals 3
    .param p1, "mask"    # Lcom/vk/masks/model/Mask;
    .param p2, "filesCount"    # I

    .prologue
    .line 131
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0, p1}, Lcom/vk/masks/MasksStorage;->isInList(Lcom/vk/masks/model/Mask;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 132
    iget-object v0, p0, Lcom/vk/masks/MasksStorage;->masksFilesCount:Ljava/util/HashMap;

    invoke-virtual {p1}, Lcom/vk/masks/model/Mask;->getFullId()Ljava/lang/String;

    move-result-object v1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    :cond_0
    :goto_0
    invoke-direct {p0}, Lcom/vk/masks/MasksStorage;->dumpToDisk()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 141
    monitor-exit p0

    return-void

    .line 134
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/vk/masks/MasksStorage;->masksList:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 135
    iget-object v0, p0, Lcom/vk/masks/MasksStorage;->masksFilesCount:Ljava/util/HashMap;

    invoke-virtual {p1}, Lcom/vk/masks/model/Mask;->getFullId()Ljava/lang/String;

    move-result-object v1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    iget-object v0, p0, Lcom/vk/masks/MasksStorage;->masksList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/16 v1, 0x3c

    if-le v0, v1, :cond_0

    .line 137
    iget-object v0, p0, Lcom/vk/masks/MasksStorage;->masksList:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vk/masks/MasksStorage;->masksList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/masks/model/Mask;

    invoke-direct {p0, v0}, Lcom/vk/masks/MasksStorage;->deleteMaskInternal(Lcom/vk/masks/model/Mask;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 131
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized updateMask(Lcom/vk/masks/model/Mask;)V
    .locals 4
    .param p1, "mask"    # Lcom/vk/masks/model/Mask;

    .prologue
    .line 116
    monitor-enter p0

    const/4 v1, -0x1

    .line 117
    .local v1, "position":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    :try_start_0
    iget-object v2, p0, Lcom/vk/masks/MasksStorage;->masksList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 118
    iget-object v2, p0, Lcom/vk/masks/MasksStorage;->masksList:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vk/masks/model/Mask;

    invoke-virtual {v2, p1}, Lcom/vk/masks/model/Mask;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 119
    move v1, v0

    .line 123
    :cond_0
    if-ltz v1, :cond_1

    .line 124
    iget-object v2, p0, Lcom/vk/masks/MasksStorage;->masksFilesCount:Ljava/util/HashMap;

    invoke-virtual {p1}, Lcom/vk/masks/model/Mask;->getFullId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    iget-object v2, p0, Lcom/vk/masks/MasksStorage;->masksList:Ljava/util/ArrayList;

    invoke-virtual {v2, v1, p1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 126
    invoke-direct {p0}, Lcom/vk/masks/MasksStorage;->dumpToDisk()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 128
    :cond_1
    monitor-exit p0

    return-void

    .line 117
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 116
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method
