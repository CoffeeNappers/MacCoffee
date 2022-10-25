.class public Lcom/vk/stories/StoriesController;
.super Ljava/lang/Object;
.source "StoriesController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/stories/StoriesController$StoryUpload;,
        Lcom/vk/stories/StoriesController$SourceType;
    }
.end annotation


# static fields
.field public static final EVENT_STORIES_LIST_INVALIDATED:I = 0x65

.field public static final EVENT_STORY_MARKED_AS_SEEN:I = 0x64

.field public static final EVENT_STORY_UPLOAD_DONE:I = 0x66

.field public static final EVENT_STORY_UPLOAD_FAILED:I = 0x68

.field public static final EVENT_STORY_UPLOAD_PROGRESS:I = 0x67

.field public static final EVENT_STORY_UPLOAD_VIDEO_COMPRESS_FINISHED:I = 0x69

.field private static final KEY_CACHED_STORIES:Ljava/lang/String; = "stories"

.field private static final markedAsSeen:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final markedAsSeenRequestsInProgress:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final storiesInstance:Lcom/vk/attachpicker/util/Prefs;

.field private static final storiesNotificationsCenter:Lcom/vk/attachpicker/events/NotificationCenter;

.field private static final storiesUploadQueue:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/vk/stories/StoriesController$StoryUpload;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 69
    new-instance v0, Lcom/vk/attachpicker/events/NotificationCenter;

    invoke-direct {v0}, Lcom/vk/attachpicker/events/NotificationCenter;-><init>()V

    sput-object v0, Lcom/vk/stories/StoriesController;->storiesNotificationsCenter:Lcom/vk/attachpicker/events/NotificationCenter;

    .line 70
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/vk/stories/StoriesController;->markedAsSeen:Ljava/util/HashSet;

    .line 71
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/vk/stories/StoriesController;->markedAsSeenRequestsInProgress:Ljava/util/HashSet;

    .line 72
    new-instance v0, Lcom/vk/attachpicker/util/Prefs;

    const-string/jumbo v1, "stories_default"

    invoke-direct {v0, v1}, Lcom/vk/attachpicker/util/Prefs;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/vk/stories/StoriesController;->storiesInstance:Lcom/vk/attachpicker/util/Prefs;

    .line 73
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    sput-object v0, Lcom/vk/stories/StoriesController;->storiesUploadQueue:Ljava/util/LinkedList;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Lcom/vk/attachpicker/events/NotificationCenter;
    .locals 1

    .prologue
    .line 44
    sget-object v0, Lcom/vk/stories/StoriesController;->storiesNotificationsCenter:Lcom/vk/attachpicker/events/NotificationCenter;

    return-object v0
.end method

.method public static banUser(ILandroid/content/Context;Lcom/vkontakte/android/api/Callback;)V
    .locals 3
    .param p0, "userId"    # I
    .param p1, "progressContext"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/content/Context;",
            "Lcom/vkontakte/android/api/Callback",
            "<",
            "Lcom/vk/stories/model/GetStoriesResponse;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 102
    .local p2, "callback":Lcom/vkontakte/android/api/Callback;, "Lcom/vkontakte/android/api/Callback<Lcom/vk/stories/model/GetStoriesResponse;>;"
    new-instance v1, Lcom/vkontakte/android/api/stories/StoriesAddBan;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/api/stories/StoriesAddBan;-><init>(I)V

    new-instance v2, Lcom/vk/stories/StoriesController$1;

    invoke-direct {v2, p2}, Lcom/vk/stories/StoriesController$1;-><init>(Lcom/vkontakte/android/api/Callback;)V

    .line 103
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/stories/StoriesAddBan;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 120
    .local v0, "req":Lcom/vkontakte/android/api/VKAPIRequest;, "Lcom/vkontakte/android/api/VKAPIRequest<Lcom/vk/stories/model/GetStoriesResponse;>;"
    if-eqz p1, :cond_0

    .line 121
    invoke-virtual {v0, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 123
    :cond_0
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/os/Looper;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 124
    return-void
.end method

.method public static cancelUpload(Lcom/vk/stories/model/StoryEntry;)V
    .locals 2
    .param p0, "storyEntry"    # Lcom/vk/stories/model/StoryEntry;

    .prologue
    .line 355
    if-nez p0, :cond_1

    .line 364
    :cond_0
    :goto_0
    return-void

    .line 358
    :cond_1
    iget v1, p0, Lcom/vk/stories/model/StoryEntry;->id:I

    invoke-static {v1}, Lcom/vk/stories/StoriesController;->findStoryUploadByStoryId(I)Lcom/vk/stories/StoriesController$StoryUpload;

    move-result-object v0

    .line 359
    .local v0, "su":Lcom/vk/stories/StoriesController$StoryUpload;
    if-eqz v0, :cond_0

    .line 360
    invoke-virtual {v0}, Lcom/vk/stories/StoriesController$StoryUpload;->uploadTaskId()I

    move-result v1

    invoke-static {v1}, Lcom/vkontakte/android/upload/Upload;->cancel(I)V

    .line 361
    sget-object v1, Lcom/vk/stories/StoriesController;->storiesUploadQueue:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 362
    invoke-static {}, Lcom/vk/stories/StoriesController;->reloadStoriesFromCache()V

    goto :goto_0
.end method

.method public static clear()V
    .locals 1

    .prologue
    .line 227
    sget-object v0, Lcom/vk/stories/StoriesController;->storiesUploadQueue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    .line 228
    sget-object v0, Lcom/vk/stories/StoriesController;->storiesInstance:Lcom/vk/attachpicker/util/Prefs;

    invoke-virtual {v0}, Lcom/vk/attachpicker/util/Prefs;->clear()V

    .line 229
    return-void
.end method

.method public static deleteStory(Lcom/vk/stories/model/StoryEntry;Lcom/vkontakte/android/api/Callback;)V
    .locals 4
    .param p0, "se"    # Lcom/vk/stories/model/StoryEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/stories/model/StoryEntry;",
            "Lcom/vkontakte/android/api/Callback",
            "<",
            "Lcom/vk/stories/model/GetStoriesResponse;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 169
    .local p1, "callback":Lcom/vkontakte/android/api/Callback;, "Lcom/vkontakte/android/api/Callback<Lcom/vk/stories/model/GetStoriesResponse;>;"
    if-nez p0, :cond_0

    .line 191
    :goto_0
    return-void

    .line 172
    :cond_0
    new-instance v0, Lcom/vkontakte/android/api/stories/StoriesDelete;

    iget v1, p0, Lcom/vk/stories/model/StoryEntry;->ownerId:I

    iget v2, p0, Lcom/vk/stories/model/StoryEntry;->id:I

    int-to-long v2, v2

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/api/stories/StoriesDelete;-><init>(IJ)V

    new-instance v1, Lcom/vk/stories/StoriesController$3;

    invoke-direct {v1, p1}, Lcom/vk/stories/StoriesController$3;-><init>(Lcom/vkontakte/android/api/Callback;)V

    .line 173
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/stories/StoriesDelete;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 190
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/os/Looper;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method

.method private static findStoryUploadByStoryId(I)Lcom/vk/stories/StoriesController$StoryUpload;
    .locals 3
    .param p0, "id"    # I

    .prologue
    .line 335
    sget-object v1, Lcom/vk/stories/StoriesController;->storiesUploadQueue:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/stories/StoriesController$StoryUpload;

    .line 336
    .local v0, "su":Lcom/vk/stories/StoriesController$StoryUpload;
    invoke-static {v0}, Lcom/vk/stories/StoriesController$StoryUpload;->access$200(Lcom/vk/stories/StoriesController$StoryUpload;)I

    move-result v2

    if-ne v2, p0, :cond_0

    .line 340
    .end local v0    # "su":Lcom/vk/stories/StoriesController$StoryUpload;
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static findStoryUploadByUploadId(I)Lcom/vk/stories/StoriesController$StoryUpload;
    .locals 3
    .param p0, "id"    # I

    .prologue
    .line 326
    sget-object v1, Lcom/vk/stories/StoriesController;->storiesUploadQueue:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/stories/StoriesController$StoryUpload;

    .line 327
    .local v0, "su":Lcom/vk/stories/StoriesController$StoryUpload;
    invoke-static {v0}, Lcom/vk/stories/StoriesController$StoryUpload;->access$100(Lcom/vk/stories/StoriesController$StoryUpload;)I

    move-result v2

    if-ne v2, p0, :cond_0

    .line 331
    .end local v0    # "su":Lcom/vk/stories/StoriesController$StoryUpload;
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static getCachedStories()Lcom/vk/stories/model/GetStoriesResponse;
    .locals 5

    .prologue
    .line 154
    :try_start_0
    sget-object v3, Lcom/vk/stories/StoriesController;->storiesInstance:Lcom/vk/attachpicker/util/Prefs;

    const-string/jumbo v4, "stories"

    invoke-virtual {v3, v4}, Lcom/vk/attachpicker/util/Prefs;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 155
    .local v2, "storiesJson":Ljava/lang/String;
    new-instance v1, Lcom/vk/stories/model/GetStoriesResponse;

    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v3}, Lcom/vk/stories/model/GetStoriesResponse;-><init>(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 158
    :goto_0
    return-object v1

    .line 157
    :catch_0
    move-exception v0

    .line 158
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static getUploadState(Lcom/vk/stories/model/StoryEntry;)Lcom/vk/stories/StoriesController$StoryUpload;
    .locals 1
    .param p0, "storyEntry"    # Lcom/vk/stories/model/StoryEntry;

    .prologue
    .line 351
    iget v0, p0, Lcom/vk/stories/model/StoryEntry;->id:I

    invoke-static {v0}, Lcom/vk/stories/StoriesController;->findStoryUploadByStoryId(I)Lcom/vk/stories/StoriesController$StoryUpload;

    move-result-object v0

    return-object v0
.end method

.method public static isCurrentlyUploading(Lcom/vk/stories/model/StoryEntry;)Z
    .locals 2
    .param p0, "storyEntry"    # Lcom/vk/stories/model/StoryEntry;

    .prologue
    const/4 v0, 0x0

    .line 344
    if-nez p0, :cond_1

    .line 347
    :cond_0
    :goto_0
    return v0

    :cond_1
    iget v1, p0, Lcom/vk/stories/model/StoryEntry;->id:I

    invoke-static {v1}, Lcom/vk/stories/StoriesController;->findStoryUploadByStoryId(I)Lcom/vk/stories/StoriesController$StoryUpload;

    move-result-object v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method static synthetic lambda$markAsSeen$0(Ljava/lang/String;Lcom/vk/stories/model/StoryEntry;Ljava/lang/Object;)V
    .locals 2
    .param p0, "stringId"    # Ljava/lang/String;
    .param p1, "storyEntry"    # Lcom/vk/stories/model/StoryEntry;
    .param p2, "o"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 94
    sget-object v0, Lcom/vk/stories/StoriesController;->markedAsSeen:Ljava/util/HashSet;

    invoke-virtual {v0, p0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 95
    sget-object v0, Lcom/vk/stories/StoriesController;->markedAsSeenRequestsInProgress:Ljava/util/HashSet;

    invoke-virtual {v0, p0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 96
    sget-object v0, Lcom/vk/stories/StoriesController;->storiesNotificationsCenter:Lcom/vk/attachpicker/events/NotificationCenter;

    const/16 v1, 0x64

    invoke-virtual {v0, v1, p1}, Lcom/vk/attachpicker/events/NotificationCenter;->fireEvent(ILjava/lang/Object;)V

    .line 97
    return-void
.end method

.method static synthetic lambda$markAsSeen$1(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1
    .param p0, "stringId"    # Ljava/lang/String;
    .param p1, "throwable"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 98
    sget-object v0, Lcom/vk/stories/StoriesController;->markedAsSeenRequestsInProgress:Ljava/util/HashSet;

    invoke-virtual {v0, p0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method static synthetic lambda$markStoryInJsonAsSeen$3(Lorg/json/JSONObject;Lcom/vk/stories/model/StoryEntry;)Ljava/lang/Object;
    .locals 8
    .param p0, "r"    # Lorg/json/JSONObject;
    .param p1, "storyEntry"    # Lcom/vk/stories/model/StoryEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 237
    :try_start_0
    const-string/jumbo v5, "items"

    invoke-virtual {p0, v5}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 238
    .local v0, "allStories":Lorg/json/JSONArray;
    if-eqz v0, :cond_0

    .line 239
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v1, v5, :cond_0

    .line 240
    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v4

    .line 241
    .local v4, "userStories":Lorg/json/JSONArray;
    if-eqz v4, :cond_2

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-lez v5, :cond_2

    .line 242
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_1
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v2, v5, :cond_2

    .line 243
    invoke-virtual {v4, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    .line 244
    .local v3, "jo":Lorg/json/JSONObject;
    if-eqz v3, :cond_1

    const-string/jumbo v5, "id"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v5

    iget v6, p1, Lcom/vk/stories/model/StoryEntry;->id:I

    if-ne v5, v6, :cond_1

    const-string/jumbo v5, "owner_id"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v5

    iget v6, p1, Lcom/vk/stories/model/StoryEntry;->ownerId:I

    if-ne v5, v6, :cond_1

    .line 245
    const-string/jumbo v5, "seen"

    const/4 v6, 0x1

    invoke-virtual {v3, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 246
    invoke-static {p0}, Lcom/vk/stories/StoriesController;->setCachedStories(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 256
    .end local v0    # "allStories":Lorg/json/JSONArray;
    .end local v1    # "i":I
    .end local v2    # "j":I
    .end local v3    # "jo":Lorg/json/JSONObject;
    .end local v4    # "userStories":Lorg/json/JSONArray;
    :cond_0
    :goto_2
    return-object v7

    .line 242
    .restart local v0    # "allStories":Lorg/json/JSONArray;
    .restart local v1    # "i":I
    .restart local v2    # "j":I
    .restart local v3    # "jo":Lorg/json/JSONObject;
    .restart local v4    # "userStories":Lorg/json/JSONArray;
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 239
    .end local v2    # "j":I
    .end local v3    # "jo":Lorg/json/JSONObject;
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 253
    .end local v0    # "allStories":Lorg/json/JSONArray;
    .end local v1    # "i":I
    .end local v4    # "userStories":Lorg/json/JSONArray;
    :catch_0
    move-exception v5

    goto :goto_2
.end method

.method static synthetic lambda$reloadStoriesFromCache$2()Lcom/vk/stories/model/GetStoriesResponse;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 212
    sget-object v1, Lcom/vk/stories/StoriesController;->storiesInstance:Lcom/vk/attachpicker/util/Prefs;

    const-string/jumbo v2, "stories"

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/util/Prefs;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 213
    .local v0, "storiesJson":Ljava/lang/String;
    new-instance v1, Lcom/vk/stories/model/GetStoriesResponse;

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v2}, Lcom/vk/stories/model/GetStoriesResponse;-><init>(Lorg/json/JSONObject;)V

    return-object v1
.end method

.method public static loadNewStories()V
    .locals 2

    .prologue
    .line 194
    new-instance v0, Lcom/vkontakte/android/api/stories/StoriesGet;

    invoke-direct {v0}, Lcom/vkontakte/android/api/stories/StoriesGet;-><init>()V

    new-instance v1, Lcom/vk/stories/StoriesController$4;

    invoke-direct {v1}, Lcom/vk/stories/StoriesController$4;-><init>()V

    .line 195
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/stories/StoriesGet;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 207
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/os/Looper;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 208
    return-void
.end method

.method public static markAsSeen(Lcom/vk/stories/model/StoryEntry;Lcom/vk/stories/StoriesController$SourceType;)V
    .locals 7
    .param p0, "storyEntry"    # Lcom/vk/stories/model/StoryEntry;
    .param p1, "sourceType"    # Lcom/vk/stories/StoriesController$SourceType;

    .prologue
    .line 80
    if-eqz p0, :cond_0

    iget-boolean v0, p0, Lcom/vk/stories/model/StoryEntry;->local:Z

    if-eqz v0, :cond_1

    .line 99
    :cond_0
    :goto_0
    return-void

    .line 84
    :cond_1
    invoke-virtual {p0}, Lcom/vk/stories/model/StoryEntry;->stringId()Ljava/lang/String;

    move-result-object v6

    .line 85
    .local v6, "stringId":Ljava/lang/String;
    sget-object v0, Lcom/vk/stories/StoriesController;->markedAsSeen:Ljava/util/HashSet;

    invoke-virtual {v0, v6}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/vk/stories/StoriesController;->markedAsSeenRequestsInProgress:Ljava/util/HashSet;

    invoke-virtual {v0, v6}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 89
    sget-object v0, Lcom/vk/stories/StoriesController;->markedAsSeenRequestsInProgress:Ljava/util/HashSet;

    invoke-virtual {v0, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 90
    new-instance v0, Lcom/vkontakte/android/api/stories/StoriesMarkAsSeen;

    iget v1, p0, Lcom/vk/stories/model/StoryEntry;->ownerId:I

    iget v2, p0, Lcom/vk/stories/model/StoryEntry;->id:I

    int-to-long v2, v2

    iget-object v4, p0, Lcom/vk/stories/model/StoryEntry;->accessKey:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/vk/stories/StoriesController$SourceType;->getText()Ljava/lang/String;

    move-result-object v5

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/api/stories/StoriesMarkAsSeen;-><init>(IJLjava/lang/String;Ljava/lang/String;)V

    .line 91
    invoke-virtual {v0}, Lcom/vkontakte/android/api/stories/StoriesMarkAsSeen;->toObservable()Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {v6, p0}, Lcom/vk/stories/StoriesController$$Lambda$1;->lambdaFactory$(Ljava/lang/String;Lcom/vk/stories/model/StoryEntry;)Lio/reactivex/functions/Consumer;

    move-result-object v1

    invoke-static {v6}, Lcom/vk/stories/StoriesController$$Lambda$2;->lambdaFactory$(Ljava/lang/String;)Lio/reactivex/functions/Consumer;

    move-result-object v2

    .line 92
    invoke-virtual {v0, v1, v2}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    goto :goto_0
.end method

.method public static markStoryInJsonAsSeen(Lorg/json/JSONObject;Lcom/vk/stories/model/StoryEntry;)V
    .locals 1
    .param p0, "r"    # Lorg/json/JSONObject;
    .param p1, "storyEntry"    # Lcom/vk/stories/model/StoryEntry;

    .prologue
    .line 232
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 258
    :cond_0
    :goto_0
    return-void

    .line 235
    :cond_1
    invoke-static {p0, p1}, Lcom/vk/stories/StoriesController$$Lambda$4;->lambdaFactory$(Lorg/json/JSONObject;Lcom/vk/stories/model/StoryEntry;)Ljava/util/concurrent/Callable;

    move-result-object v0

    invoke-static {v0}, Lbolts/Task;->call(Ljava/util/concurrent/Callable;)Lbolts/Task;

    goto :goto_0
.end method

.method public static notificationCenter()Lcom/vk/attachpicker/events/NotificationCenter;
    .locals 1

    .prologue
    .line 76
    sget-object v0, Lcom/vk/stories/StoriesController;->storiesNotificationsCenter:Lcom/vk/attachpicker/events/NotificationCenter;

    return-object v0
.end method

.method public static onUploadDone(ILjava/lang/Object;)V
    .locals 3
    .param p0, "id"    # I
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 284
    if-eqz p1, :cond_0

    instance-of v1, p1, Lcom/vk/stories/model/StoryEntry;

    if-eqz v1, :cond_0

    .line 285
    invoke-static {p0}, Lcom/vk/stories/StoriesController;->findStoryUploadByUploadId(I)Lcom/vk/stories/StoriesController$StoryUpload;

    move-result-object v0

    .line 286
    .local v0, "us":Lcom/vk/stories/StoriesController$StoryUpload;
    if-eqz v0, :cond_0

    .line 287
    check-cast p1, Lcom/vk/stories/model/StoryEntry;

    .end local p1    # "o":Ljava/lang/Object;
    invoke-virtual {v0, p1}, Lcom/vk/stories/StoriesController$StoryUpload;->resultStory(Lcom/vk/stories/model/StoryEntry;)V

    .line 289
    sget-object v1, Lcom/vk/stories/StoriesController;->storiesNotificationsCenter:Lcom/vk/attachpicker/events/NotificationCenter;

    const/16 v2, 0x66

    invoke-virtual {v1, v2, v0}, Lcom/vk/attachpicker/events/NotificationCenter;->fireEvent(ILjava/lang/Object;)V

    .line 292
    sget-object v1, Lcom/vk/stories/StoriesController;->storiesUploadQueue:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 294
    invoke-static {}, Lcom/vk/stories/StoriesController;->loadNewStories()V

    .line 297
    .end local v0    # "us":Lcom/vk/stories/StoriesController$StoryUpload;
    :cond_0
    return-void
.end method

.method public static onUploadFailed(I)V
    .locals 3
    .param p0, "id"    # I

    .prologue
    .line 309
    invoke-static {p0}, Lcom/vk/stories/StoriesController;->findStoryUploadByUploadId(I)Lcom/vk/stories/StoriesController$StoryUpload;

    move-result-object v0

    .line 310
    .local v0, "us":Lcom/vk/stories/StoriesController$StoryUpload;
    if-eqz v0, :cond_0

    .line 311
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vk/stories/StoriesController$StoryUpload;->uploadFailed(Z)V

    .line 312
    sget-object v1, Lcom/vk/stories/StoriesController;->storiesNotificationsCenter:Lcom/vk/attachpicker/events/NotificationCenter;

    const/16 v2, 0x68

    invoke-virtual {v1, v2, v0}, Lcom/vk/attachpicker/events/NotificationCenter;->fireEvent(ILjava/lang/Object;)V

    .line 313
    invoke-static {}, Lcom/vk/stories/StoriesController;->reloadStoriesFromCache()V

    .line 315
    :cond_0
    return-void
.end method

.method public static onUploadProgress(IIIZ)V
    .locals 4
    .param p0, "id"    # I
    .param p1, "loaded"    # I
    .param p2, "total"    # I
    .param p3, "indeterminate"    # Z

    .prologue
    .line 300
    invoke-static {p0}, Lcom/vk/stories/StoriesController;->findStoryUploadByUploadId(I)Lcom/vk/stories/StoriesController$StoryUpload;

    move-result-object v1

    .line 301
    .local v1, "us":Lcom/vk/stories/StoriesController$StoryUpload;
    if-eqz v1, :cond_0

    if-lez p2, :cond_0

    .line 302
    int-to-float v2, p1

    int-to-float v3, p2

    div-float v0, v2, v3

    .line 303
    .local v0, "p":F
    invoke-virtual {v1, v0}, Lcom/vk/stories/StoriesController$StoryUpload;->storyUploadProgress(F)V

    .line 304
    sget-object v2, Lcom/vk/stories/StoriesController;->storiesNotificationsCenter:Lcom/vk/attachpicker/events/NotificationCenter;

    const/16 v3, 0x67

    invoke-virtual {v2, v3, v1}, Lcom/vk/attachpicker/events/NotificationCenter;->fireEvent(ILjava/lang/Object;)V

    .line 306
    .end local v0    # "p":F
    :cond_0
    return-void
.end method

.method public static onVideoUploadTaskCompressFinish(ILjava/io/File;)V
    .locals 3
    .param p0, "id"    # I
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 318
    invoke-static {p0}, Lcom/vk/stories/StoriesController;->findStoryUploadByUploadId(I)Lcom/vk/stories/StoriesController$StoryUpload;

    move-result-object v0

    .line 319
    .local v0, "us":Lcom/vk/stories/StoriesController$StoryUpload;
    if-eqz v0, :cond_0

    .line 320
    invoke-virtual {v0, p1}, Lcom/vk/stories/StoriesController$StoryUpload;->fullFile(Ljava/io/File;)V

    .line 321
    sget-object v1, Lcom/vk/stories/StoriesController;->storiesNotificationsCenter:Lcom/vk/attachpicker/events/NotificationCenter;

    const/16 v2, 0x69

    invoke-virtual {v1, v2, v0}, Lcom/vk/attachpicker/events/NotificationCenter;->fireEvent(ILjava/lang/Object;)V

    .line 323
    :cond_0
    return-void
.end method

.method public static postProcessDisplayStoryList(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/stories/model/StoriesContainer;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/stories/model/StoriesContainer;",
            ">;"
        }
    .end annotation

    .prologue
    .local p0, "stories":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/stories/model/StoriesContainer;>;"
    const/4 v5, 0x0

    .line 261
    if-nez p0, :cond_0

    .line 262
    new-instance p0, Ljava/util/ArrayList;

    .end local p0    # "stories":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/stories/model/StoriesContainer;>;"
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 266
    .restart local p0    # "stories":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/stories/model/StoriesContainer;>;"
    :cond_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_1

    invoke-virtual {p0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vk/stories/model/StoriesContainer;

    invoke-virtual {v4}, Lcom/vk/stories/model/StoriesContainer;->myStory()Z

    move-result v4

    if-eqz v4, :cond_2

    :cond_1
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-nez v4, :cond_3

    sget-object v4, Lcom/vk/stories/StoriesController;->storiesUploadQueue:Ljava/util/LinkedList;

    invoke-virtual {v4}, Ljava/util/LinkedList;->size()I

    move-result v4

    if-lez v4, :cond_3

    .line 267
    :cond_2
    new-instance v3, Lcom/vkontakte/android/UserProfile;

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/vkontakte/android/UserProfile;-><init>(Lcom/vkontakte/android/auth/VKAccount;)V

    .line 268
    .local v3, "up":Lcom/vkontakte/android/UserProfile;
    new-instance v1, Lcom/vk/stories/model/StoriesContainer;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {v1, v3, v4}, Lcom/vk/stories/model/StoriesContainer;-><init>(Lcom/vkontakte/android/UserProfile;Ljava/util/ArrayList;)V

    .line 269
    .local v1, "sc":Lcom/vk/stories/model/StoriesContainer;
    invoke-virtual {p0, v5, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 273
    .end local v1    # "sc":Lcom/vk/stories/model/StoriesContainer;
    .end local v3    # "up":Lcom/vkontakte/android/UserProfile;
    :cond_3
    sget-object v4, Lcom/vk/stories/StoriesController;->storiesUploadQueue:Ljava/util/LinkedList;

    invoke-virtual {v4}, Ljava/util/LinkedList;->size()I

    move-result v4

    if-lez v4, :cond_4

    .line 274
    invoke-virtual {p0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/stories/model/StoriesContainer;

    .line 275
    .local v0, "myStories":Lcom/vk/stories/model/StoriesContainer;
    sget-object v4, Lcom/vk/stories/StoriesController;->storiesUploadQueue:Ljava/util/LinkedList;

    invoke-virtual {v4}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vk/stories/StoriesController$StoryUpload;

    .line 276
    .local v2, "su":Lcom/vk/stories/StoriesController$StoryUpload;
    iget-object v5, v0, Lcom/vk/stories/model/StoriesContainer;->storyEntries:Ljava/util/ArrayList;

    new-instance v6, Lcom/vk/stories/model/StoryEntry;

    invoke-direct {v6, v2}, Lcom/vk/stories/model/StoryEntry;-><init>(Lcom/vk/stories/StoriesController$StoryUpload;)V

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 280
    .end local v0    # "myStories":Lcom/vk/stories/model/StoriesContainer;
    .end local v2    # "su":Lcom/vk/stories/StoriesController$StoryUpload;
    :cond_4
    return-object p0
.end method

.method public static reloadStoriesFromCache()V
    .locals 3

    .prologue
    .line 211
    invoke-static {}, Lcom/vk/stories/StoriesController$$Lambda$3;->lambdaFactory$()Ljava/util/concurrent/Callable;

    move-result-object v0

    invoke-static {v0}, Lbolts/Task;->call(Ljava/util/concurrent/Callable;)Lbolts/Task;

    move-result-object v0

    new-instance v1, Lcom/vk/stories/StoriesController$5;

    invoke-direct {v1}, Lcom/vk/stories/StoriesController$5;-><init>()V

    sget-object v2, Lbolts/Task;->UI_THREAD_EXECUTOR:Ljava/util/concurrent/Executor;

    .line 214
    invoke-virtual {v0, v1, v2}, Lbolts/Task;->onSuccess(Lbolts/Continuation;Ljava/util/concurrent/Executor;)Lbolts/Task;

    .line 224
    return-void
.end method

.method public static retryUpload(Lcom/vk/stories/model/StoryEntry;)V
    .locals 3
    .param p0, "storyEntry"    # Lcom/vk/stories/model/StoryEntry;

    .prologue
    .line 367
    if-nez p0, :cond_1

    .line 377
    :cond_0
    :goto_0
    return-void

    .line 370
    :cond_1
    iget v1, p0, Lcom/vk/stories/model/StoryEntry;->id:I

    invoke-static {v1}, Lcom/vk/stories/StoriesController;->findStoryUploadByStoryId(I)Lcom/vk/stories/StoriesController$StoryUpload;

    move-result-object v0

    .line 371
    .local v0, "su":Lcom/vk/stories/StoriesController$StoryUpload;
    if-eqz v0, :cond_0

    .line 372
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vk/stories/StoriesController$StoryUpload;->uploadFailed(Z)V

    .line 373
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vk/stories/StoriesController$StoryUpload;->storyUploadProgress(F)V

    .line 374
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v0}, Lcom/vk/stories/StoriesController$StoryUpload;->uploadTaskId()I

    move-result v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/upload/Upload;->retry(Landroid/content/Context;I)V

    .line 375
    invoke-static {}, Lcom/vk/stories/StoriesController;->reloadStoriesFromCache()V

    goto :goto_0
.end method

.method public static setCachedStories(Lorg/json/JSONObject;)V
    .locals 3
    .param p0, "jsonObject"    # Lorg/json/JSONObject;

    .prologue
    .line 163
    if-eqz p0, :cond_0

    .line 164
    sget-object v0, Lcom/vk/stories/StoriesController;->storiesInstance:Lcom/vk/attachpicker/util/Prefs;

    invoke-virtual {v0}, Lcom/vk/attachpicker/util/Prefs;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "stories"

    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 166
    :cond_0
    return-void
.end method

.method public static startStoryUpload(Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;Lcom/vk/stories/model/StoryUploadParams;)V
    .locals 4
    .param p0, "parameters"    # Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;
    .param p1, "storyUploadParams"    # Lcom/vk/stories/model/StoryUploadParams;

    .prologue
    .line 391
    new-instance v1, Lcom/vkontakte/android/upload/VideoStoryUploadTask;

    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-direct {v1, v2, p1, p0}, Lcom/vkontakte/android/upload/VideoStoryUploadTask;-><init>(Landroid/content/Context;Lcom/vk/stories/model/StoryUploadParams;Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;)V

    .line 392
    .local v1, "task":Lcom/vkontakte/android/upload/VideoStoryUploadTask;
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v2, v1}, Lcom/vkontakte/android/upload/Upload;->start(Landroid/content/Context;Lcom/vkontakte/android/upload/UploadTask;)V

    .line 394
    invoke-virtual {p1}, Lcom/vk/stories/model/StoryUploadParams;->isAddToNews()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 395
    invoke-virtual {p0}, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->previewFile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v1}, Lcom/vkontakte/android/upload/VideoStoryUploadTask;->getID()I

    move-result v3

    invoke-static {v2, v3}, Lcom/vk/stories/StoriesController$StoryUpload;->videoStoryUpload(Ljava/io/File;I)Lcom/vk/stories/StoriesController$StoryUpload;

    move-result-object v0

    .line 396
    .local v0, "storyUpload":Lcom/vk/stories/StoriesController$StoryUpload;
    sget-object v2, Lcom/vk/stories/StoriesController;->storiesUploadQueue:Ljava/util/LinkedList;

    invoke-virtual {v2, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 397
    invoke-static {}, Lcom/vk/stories/StoriesController;->reloadStoriesFromCache()V

    .line 399
    .end local v0    # "storyUpload":Lcom/vk/stories/StoriesController$StoryUpload;
    :cond_0
    return-void
.end method

.method public static startStoryUpload(Ljava/io/File;Lcom/vk/stories/model/StoryUploadParams;)V
    .locals 4
    .param p0, "file"    # Ljava/io/File;
    .param p1, "params"    # Lcom/vk/stories/model/StoryUploadParams;

    .prologue
    .line 380
    new-instance v1, Lcom/vkontakte/android/upload/PhotoStoryUploadTask;

    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3, p1}, Lcom/vkontakte/android/upload/PhotoStoryUploadTask;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/vk/stories/model/StoryUploadParams;)V

    .line 381
    .local v1, "task":Lcom/vkontakte/android/upload/PhotoStoryUploadTask;
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v2, v1}, Lcom/vkontakte/android/upload/Upload;->start(Landroid/content/Context;Lcom/vkontakte/android/upload/UploadTask;)V

    .line 383
    invoke-virtual {p1}, Lcom/vk/stories/model/StoryUploadParams;->isAddToNews()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 384
    invoke-virtual {v1}, Lcom/vkontakte/android/upload/PhotoStoryUploadTask;->getID()I

    move-result v2

    invoke-static {p0, v2}, Lcom/vk/stories/StoriesController$StoryUpload;->photoStoryUpload(Ljava/io/File;I)Lcom/vk/stories/StoriesController$StoryUpload;

    move-result-object v0

    .line 385
    .local v0, "storyUpload":Lcom/vk/stories/StoriesController$StoryUpload;
    sget-object v2, Lcom/vk/stories/StoriesController;->storiesUploadQueue:Ljava/util/LinkedList;

    invoke-virtual {v2, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 386
    invoke-static {}, Lcom/vk/stories/StoriesController;->reloadStoriesFromCache()V

    .line 388
    .end local v0    # "storyUpload":Lcom/vk/stories/StoriesController$StoryUpload;
    :cond_0
    return-void
.end method

.method public static unbanUser(ILandroid/content/Context;Lcom/vkontakte/android/api/Callback;)V
    .locals 3
    .param p0, "userId"    # I
    .param p1, "progressContext"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/content/Context;",
            "Lcom/vkontakte/android/api/Callback",
            "<",
            "Lcom/vk/stories/model/GetStoriesResponse;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 127
    .local p2, "callback":Lcom/vkontakte/android/api/Callback;, "Lcom/vkontakte/android/api/Callback<Lcom/vk/stories/model/GetStoriesResponse;>;"
    new-instance v1, Lcom/vkontakte/android/api/stories/StoriesDeleteBan;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/api/stories/StoriesDeleteBan;-><init>(I)V

    new-instance v2, Lcom/vk/stories/StoriesController$2;

    invoke-direct {v2, p2}, Lcom/vk/stories/StoriesController$2;-><init>(Lcom/vkontakte/android/api/Callback;)V

    .line 128
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/stories/StoriesDeleteBan;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 145
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/os/Looper;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 146
    .local v0, "req":Lcom/vkontakte/android/api/VKAPIRequest;, "Lcom/vkontakte/android/api/VKAPIRequest<Lcom/vk/stories/model/GetStoriesResponse;>;"
    if-eqz p1, :cond_0

    .line 147
    invoke-virtual {v0, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 149
    :cond_0
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/os/Looper;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 150
    return-void
.end method
