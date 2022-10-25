.class public final Lcom/vkontakte/android/audio/player/SavedTracks;
.super Ljava/lang/Object;
.source "SavedTracks.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/audio/player/SavedTracks$SaveTracksTask;,
        Lcom/vkontakte/android/audio/player/SavedTracks$LoadTracksTask;,
        Lcom/vkontakte/android/audio/player/SavedTracks$MyDownloadTaskListener;,
        Lcom/vkontakte/android/audio/player/SavedTracks$LoadedTracks;,
        Lcom/vkontakte/android/audio/player/SavedTracks$OnLoadedListener;,
        Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;,
        Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;
    }
.end annotation


# static fields
.field private static final EXECUTOR:Ljava/util/concurrent/ThreadPoolExecutor;

.field static final LOG_PREFIX:Ljava/lang/String; = "SavedTracks"


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mDownloadTasks:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/vkontakte/android/audio/player/DownloadTaskBase;",
            ">;"
        }
    .end annotation
.end field

.field private final mListeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;",
            ">;"
        }
    .end annotation
.end field

.field private mLoadTracksTask:Lcom/vkontakte/android/audio/player/SavedTracks$LoadTracksTask;

.field private final mLostMidsSet:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mMidsSet:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mSaveTracksTask:Lcom/vkontakte/android/audio/player/SavedTracks$SaveTracksTask;

.field private final mTracksList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/audio/player/SavedTrack;",
            ">;"
        }
    .end annotation
.end field

.field private mTracksLocked:Z

.field private final mWakeLockEx:Lcom/vkontakte/android/audio/utils/WakeLockEx;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v2, 0x1

    .line 37
    new-instance v1, Ljava/util/concurrent/ThreadPoolExecutor;

    const-wide/16 v4, 0x0

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v7, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v7}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    move v3, v2

    invoke-direct/range {v1 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    sput-object v1, Lcom/vkontakte/android/audio/player/SavedTracks;->EXECUTOR:Ljava/util/concurrent/ThreadPoolExecutor;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/vkontakte/android/audio/player/SavedTracks$OnLoadedListener;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "onLoadedListener"    # Lcom/vkontakte/android/audio/player/SavedTracks$OnLoadedListener;

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mContext:Landroid/content/Context;

    .line 51
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mListeners:Ljava/util/Set;

    .line 52
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mTracksList:Ljava/util/ArrayList;

    .line 53
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mMidsSet:Ljava/util/Set;

    .line 54
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mLostMidsSet:Ljava/util/Set;

    .line 55
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mDownloadTasks:Ljava/util/Map;

    .line 56
    new-instance v0, Lcom/vkontakte/android/audio/utils/WakeLockEx;

    const-class v1, Lcom/vkontakte/android/audio/player/SavedTracks;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/vkontakte/android/audio/utils/WakeLockEx;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mWakeLockEx:Lcom/vkontakte/android/audio/utils/WakeLockEx;

    .line 57
    new-instance v0, Lcom/vkontakte/android/audio/player/SavedTracks$LoadTracksTask;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p2, p1, v1}, Lcom/vkontakte/android/audio/player/SavedTracks$LoadTracksTask;-><init>(Lcom/vkontakte/android/audio/player/SavedTracks;Lcom/vkontakte/android/audio/player/SavedTracks$OnLoadedListener;Landroid/content/Context;Lcom/vkontakte/android/audio/player/SavedTracks$1;)V

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mLoadTracksTask:Lcom/vkontakte/android/audio/player/SavedTracks$LoadTracksTask;

    .line 58
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mLoadTracksTask:Lcom/vkontakte/android/audio/player/SavedTracks$LoadTracksTask;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/audio/player/SavedTracks$LoadTracksTask;->executeQuick([Ljava/lang/Object;)V

    .line 59
    return-void
.end method

.method static synthetic access$1000(Lcom/vkontakte/android/audio/player/SavedTracks;)Ljava/util/Set;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/SavedTracks;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mMidsSet:Ljava/util/Set;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/vkontakte/android/audio/player/SavedTracks;)Ljava/util/Set;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/SavedTracks;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mLostMidsSet:Ljava/util/Set;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/vkontakte/android/audio/player/SavedTracks;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/SavedTracks;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$1300(Landroid/content/Context;)Ljava/util/HashSet;
    .locals 1
    .param p0, "x0"    # Landroid/content/Context;

    .prologue
    .line 33
    invoke-static {p0}, Lcom/vkontakte/android/audio/player/SavedTracks;->getFiles(Landroid/content/Context;)Ljava/util/HashSet;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1402(Lcom/vkontakte/android/audio/player/SavedTracks;Lcom/vkontakte/android/audio/player/SavedTracks$SaveTracksTask;)Lcom/vkontakte/android/audio/player/SavedTracks$SaveTracksTask;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/SavedTracks;
    .param p1, "x1"    # Lcom/vkontakte/android/audio/player/SavedTracks$SaveTracksTask;

    .prologue
    .line 33
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mSaveTracksTask:Lcom/vkontakte/android/audio/player/SavedTracks$SaveTracksTask;

    return-object p1
.end method

.method static synthetic access$1500(Lcom/vkontakte/android/audio/player/SavedTracks;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/SavedTracks;

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/SavedTracks;->notifySaveFinished()V

    return-void
.end method

.method static synthetic access$200(Lcom/vkontakte/android/audio/player/SavedTracks;[Lcom/vkontakte/android/audio/player/SavedTrack;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/SavedTracks;
    .param p1, "x1"    # [Lcom/vkontakte/android/audio/player/SavedTrack;

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lcom/vkontakte/android/audio/player/SavedTracks;->saveTracks([Lcom/vkontakte/android/audio/player/SavedTrack;)V

    return-void
.end method

.method static synthetic access$300(Lcom/vkontakte/android/audio/player/SavedTracks;[Lcom/vkontakte/android/audio/player/SavedTrack;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/SavedTracks;
    .param p1, "x1"    # [Lcom/vkontakte/android/audio/player/SavedTrack;

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lcom/vkontakte/android/audio/player/SavedTracks;->removeTracks([Lcom/vkontakte/android/audio/player/SavedTrack;)V

    return-void
.end method

.method static synthetic access$400(Lcom/vkontakte/android/audio/player/SavedTracks;Ljava/lang/String;)Lcom/vkontakte/android/audio/player/DownloadTaskBase;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/SavedTracks;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lcom/vkontakte/android/audio/player/SavedTracks;->removeTask(Ljava/lang/String;)Lcom/vkontakte/android/audio/player/DownloadTaskBase;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Lcom/vkontakte/android/audio/player/SavedTracks;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/SavedTracks;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mDownloadTasks:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$600(Lcom/vkontakte/android/audio/player/SavedTracks;)Lcom/vkontakte/android/audio/utils/WakeLockEx;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/SavedTracks;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mWakeLockEx:Lcom/vkontakte/android/audio/utils/WakeLockEx;

    return-object v0
.end method

.method static synthetic access$700(Lcom/vkontakte/android/audio/player/SavedTracks;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/SavedTracks;

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/SavedTracks;->notifyDownloadFinished()V

    return-void
.end method

.method static synthetic access$802(Lcom/vkontakte/android/audio/player/SavedTracks;Lcom/vkontakte/android/audio/player/SavedTracks$LoadTracksTask;)Lcom/vkontakte/android/audio/player/SavedTracks$LoadTracksTask;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/SavedTracks;
    .param p1, "x1"    # Lcom/vkontakte/android/audio/player/SavedTracks$LoadTracksTask;

    .prologue
    .line 33
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mLoadTracksTask:Lcom/vkontakte/android/audio/player/SavedTracks$LoadTracksTask;

    return-object p1
.end method

.method static synthetic access$900(Lcom/vkontakte/android/audio/player/SavedTracks;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/player/SavedTracks;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mTracksList:Ljava/util/ArrayList;

    return-object v0
.end method

.method private checkTracksLock()V
    .locals 2

    .prologue
    .line 323
    iget-boolean v0, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mTracksLocked:Z

    if-eqz v0, :cond_0

    .line 324
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "Cannot change saved tracks list"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 325
    :cond_0
    return-void
.end method

.method private getCurrentDownloadTask()Lcom/vkontakte/android/audio/player/DownloadTaskBase;
    .locals 1

    .prologue
    .line 312
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mDownloadTasks:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mDownloadTasks:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;

    goto :goto_0
.end method

.method public static getDownloadDirectories(Landroid/content/Context;)Ljava/util/List;
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .prologue
    .line 62
    sget-object v3, Landroid/os/Environment;->DIRECTORY_MUSIC:Ljava/lang/String;

    invoke-static {p0, v3}, Lcom/vkontakte/android/audio/utils/Utils;->getExternalFilesDirs(Landroid/content/Context;Ljava/lang/String;)[Ljava/io/File;

    move-result-object v1

    .line 63
    .local v1, "dirs":[Ljava/io/File;
    if-nez v1, :cond_1

    .line 64
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 72
    :cond_0
    return-object v2

    .line 66
    :cond_1
    new-instance v2, Ljava/util/ArrayList;

    array-length v3, v1

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 67
    .local v2, "list":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    array-length v4, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v4, :cond_0

    aget-object v0, v1, v3

    .line 68
    .local v0, "dir":Ljava/io/File;
    if-eqz v0, :cond_2

    .line 69
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 67
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method private static getFiles(Landroid/content/Context;)Ljava/util/HashSet;
    .locals 6
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/HashSet",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .prologue
    .line 76
    invoke-static {}, Lcom/vkontakte/android/audio/player/SavedTracks$$Lambda$1;->lambdaFactory$()Ljava/io/FilenameFilter;

    move-result-object v2

    .line 77
    .local v2, "filter":Ljava/io/FilenameFilter;
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 78
    .local v1, "files":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/io/File;>;"
    invoke-static {p0}, Lcom/vkontakte/android/audio/player/SavedTracks;->getDownloadDirectories(Landroid/content/Context;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    .line 79
    .local v0, "dir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 80
    invoke-virtual {v0, v2}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object v3

    .line 81
    .local v3, "fs":[Ljava/io/File;
    if-eqz v3, :cond_0

    .line 82
    invoke-static {v1, v3}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    goto :goto_0

    .line 86
    .end local v0    # "dir":Ljava/io/File;
    .end local v3    # "fs":[Ljava/io/File;
    :cond_1
    return-object v1
.end method

.method private isFileLost(Ljava/lang/String;)Z
    .locals 1
    .param p1, "mid"    # Ljava/lang/String;

    .prologue
    .line 217
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mLostMidsSet:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method static synthetic lambda$getFiles$0(Ljava/io/File;Ljava/lang/String;)Z
    .locals 1
    .param p0, "dir"    # Ljava/io/File;
    .param p1, "filename"    # Ljava/lang/String;

    .prologue
    .line 76
    const-string/jumbo v0, ".tmp"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private notifyDownloadFinished()V
    .locals 4

    .prologue
    .line 306
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mDownloadTasks:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    .line 307
    .local v0, "completed":Z
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mListeners:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;

    .line 308
    .local v1, "listener":Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;
    invoke-interface {v1, v0}, Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;->onDownloadFinished(Z)V

    goto :goto_0

    .line 309
    .end local v1    # "listener":Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;
    :cond_0
    return-void
.end method

.method private notifyDownloadStarted()V
    .locals 3

    .prologue
    .line 301
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mListeners:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;

    .line 302
    .local v0, "listener":Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;
    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;->onDownloadStarted()V

    goto :goto_0

    .line 303
    .end local v0    # "listener":Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;
    :cond_0
    return-void
.end method

.method private notifySaveFinished()V
    .locals 3

    .prologue
    .line 296
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mListeners:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;

    .line 297
    .local v0, "listener":Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;
    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;->onSavedTracksSaved()V

    goto :goto_0

    .line 298
    .end local v0    # "listener":Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;
    :cond_0
    return-void
.end method

.method private notifyTracksChanged()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 286
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mTracksLocked:Z

    .line 288
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mListeners:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;

    .line 289
    .local v0, "listener":Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;
    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;->onSavedTracksChanged()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 291
    .end local v0    # "listener":Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;
    :catchall_0
    move-exception v1

    iput-boolean v3, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mTracksLocked:Z

    throw v1

    :cond_0
    iput-boolean v3, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mTracksLocked:Z

    .line 293
    return-void
.end method

.method private removeTask(Ljava/lang/String;)Lcom/vkontakte/android/audio/player/DownloadTaskBase;
    .locals 1
    .param p1, "uuid"    # Ljava/lang/String;

    .prologue
    .line 282
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mDownloadTasks:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;

    return-object v0
.end method

.method private removeTrackInternal(Ljava/lang/String;)Z
    .locals 4
    .param p1, "mid"    # Ljava/lang/String;

    .prologue
    .line 328
    const/4 v1, 0x0

    .line 329
    .local v1, "modified":Z
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mTracksList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/audio/player/SavedTrack;>;"
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 330
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/audio/player/SavedTrack;

    .line 331
    .local v2, "track":Lcom/vkontakte/android/audio/player/SavedTrack;
    invoke-virtual {v2}, Lcom/vkontakte/android/audio/player/SavedTrack;->getMid()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 332
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 333
    const/4 v1, 0x1

    .line 337
    .end local v2    # "track":Lcom/vkontakte/android/audio/player/SavedTrack;
    :cond_1
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mMidsSet:Ljava/util/Set;

    invoke-interface {v3, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 338
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mLostMidsSet:Ljava/util/Set;

    invoke-interface {v3, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 339
    return v1
.end method

.method private varargs removeTracks([Lcom/vkontakte/android/audio/player/SavedTrack;)V
    .locals 5
    .param p1, "tracks"    # [Lcom/vkontakte/android/audio/player/SavedTrack;

    .prologue
    .line 150
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/SavedTracks;->checkTracksLock()V

    .line 152
    const/4 v0, 0x0

    .line 154
    .local v0, "modified":Z
    array-length v3, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v1, p1, v2

    .line 155
    .local v1, "track":Lcom/vkontakte/android/audio/player/SavedTrack;
    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/SavedTrack;->getMid()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/vkontakte/android/audio/player/SavedTracks;->removeTrackInternal(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 156
    const/4 v0, 0x1

    .line 154
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 159
    .end local v1    # "track":Lcom/vkontakte/android/audio/player/SavedTrack;
    :cond_1
    if-eqz v0, :cond_2

    .line 160
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/SavedTracks;->saveTracks()V

    .line 161
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/SavedTracks;->notifyTracksChanged()V

    .line 163
    :cond_2
    return-void
.end method

.method private saveTracks()V
    .locals 2

    .prologue
    .line 316
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mSaveTracksTask:Lcom/vkontakte/android/audio/player/SavedTracks$SaveTracksTask;

    if-eqz v0, :cond_0

    .line 317
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mSaveTracksTask:Lcom/vkontakte/android/audio/player/SavedTracks$SaveTracksTask;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/audio/player/SavedTracks$SaveTracksTask;->cancel(Z)Z

    .line 318
    :cond_0
    new-instance v0, Lcom/vkontakte/android/audio/player/SavedTracks$SaveTracksTask;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/audio/player/SavedTracks$SaveTracksTask;-><init>(Lcom/vkontakte/android/audio/player/SavedTracks;)V

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mSaveTracksTask:Lcom/vkontakte/android/audio/player/SavedTracks$SaveTracksTask;

    .line 319
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mSaveTracksTask:Lcom/vkontakte/android/audio/player/SavedTracks$SaveTracksTask;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/audio/player/SavedTracks$SaveTracksTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 320
    return-void
.end method

.method private varargs saveTracks([Lcom/vkontakte/android/audio/player/SavedTrack;)V
    .locals 6
    .param p1, "tracks"    # [Lcom/vkontakte/android/audio/player/SavedTrack;

    .prologue
    const/4 v2, 0x0

    .line 343
    array-length v3, p1

    move v1, v2

    :goto_0
    if-ge v1, v3, :cond_1

    aget-object v0, p1, v1

    .line 344
    .local v0, "track":Lcom/vkontakte/android/audio/player/SavedTrack;
    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/SavedTrack;->getMid()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/audio/player/SavedTracks;->isDownloaded(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 345
    iget-object v4, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mTracksList:Ljava/util/ArrayList;

    invoke-virtual {v4, v2, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 346
    iget-object v4, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mMidsSet:Ljava/util/Set;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/SavedTrack;->getMid()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 343
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 350
    .end local v0    # "track":Lcom/vkontakte/android/audio/player/SavedTrack;
    :cond_1
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/SavedTracks;->saveTracks()V

    .line 351
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/SavedTracks;->notifyTracksChanged()V

    .line 352
    return-void
.end method

.method private startDownloadTask(Lcom/vkontakte/android/audio/player/DownloadTaskBase;)V
    .locals 2
    .param p1, "task"    # Lcom/vkontakte/android/audio/player/DownloadTaskBase;

    .prologue
    .line 275
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mDownloadTasks:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->getUuid()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 276
    sget-object v0, Lcom/vkontakte/android/audio/player/SavedTracks;->EXECUTOR:Ljava/util/concurrent/ThreadPoolExecutor;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {p1, v0, v1}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 277
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mWakeLockEx:Lcom/vkontakte/android/audio/utils/WakeLockEx;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/utils/WakeLockEx;->acquire()V

    .line 278
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/SavedTracks;->notifyDownloadStarted()V

    .line 279
    return-void
.end method


# virtual methods
.method cancelDownload(Ljava/lang/String;)Z
    .locals 2
    .param p1, "uuid"    # Ljava/lang/String;

    .prologue
    .line 246
    invoke-direct {p0, p1}, Lcom/vkontakte/android/audio/player/SavedTracks;->removeTask(Ljava/lang/String;)Lcom/vkontakte/android/audio/player/DownloadTaskBase;

    move-result-object v0

    .line 247
    .local v0, "task":Lcom/vkontakte/android/audio/player/DownloadTaskBase;
    if-eqz v0, :cond_0

    .line 248
    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->cancelAndRemoveNotification()V

    .line 250
    :cond_0
    if-eqz v0, :cond_1

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method cancelDownloads()V
    .locals 3

    .prologue
    .line 144
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mDownloadTasks:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;

    .line 145
    .local v0, "task":Lcom/vkontakte/android/audio/player/DownloadTaskBase;
    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->cancelAndRemoveNotification()V

    goto :goto_0

    .line 146
    .end local v0    # "task":Lcom/vkontakte/android/audio/player/DownloadTaskBase;
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mDownloadTasks:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 147
    return-void
.end method

.method checkFileLost(Ljava/io/File;)Z
    .locals 6
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 221
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_1

    const/4 v0, 0x1

    .line 222
    .local v0, "lost":Z
    :goto_0
    const/4 v1, 0x0

    .line 223
    .local v1, "modified":Z
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mTracksList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/audio/player/SavedTrack;

    .line 224
    .local v2, "track":Lcom/vkontakte/android/audio/player/SavedTrack;
    iget-object v4, v2, Lcom/vkontakte/android/audio/player/SavedTrack;->file:Ljava/io/File;

    invoke-virtual {v4, p1}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 225
    if-eqz v0, :cond_2

    .line 226
    iget-object v4, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mLostMidsSet:Ljava/util/Set;

    invoke-virtual {v2}, Lcom/vkontakte/android/audio/player/SavedTrack;->getMid()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 227
    const/4 v1, 0x1

    goto :goto_1

    .line 221
    .end local v0    # "lost":Z
    .end local v1    # "modified":Z
    .end local v2    # "track":Lcom/vkontakte/android/audio/player/SavedTrack;
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 228
    .restart local v0    # "lost":Z
    .restart local v1    # "modified":Z
    .restart local v2    # "track":Lcom/vkontakte/android/audio/player/SavedTrack;
    :cond_2
    iget-object v4, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mLostMidsSet:Ljava/util/Set;

    invoke-virtual {v2}, Lcom/vkontakte/android/audio/player/SavedTrack;->getMid()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 229
    const/4 v1, 0x1

    goto :goto_1

    .line 233
    .end local v2    # "track":Lcom/vkontakte/android/audio/player/SavedTrack;
    :cond_3
    if-eqz v1, :cond_4

    .line 234
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/SavedTracks;->saveTracks()V

    .line 235
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/SavedTracks;->notifyTracksChanged()V

    .line 237
    :cond_4
    return v0
.end method

.method clearTracks()V
    .locals 1

    .prologue
    .line 183
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/SavedTracks;->checkTracksLock()V

    .line 185
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mTracksList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 187
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mMidsSet:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 188
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/SavedTracks;->saveTracks()V

    .line 189
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/SavedTracks;->notifyTracksChanged()V

    .line 190
    return-void
.end method

.method public downloadTrack(Lcom/vkontakte/android/audio/MusicTrack;Z)V
    .locals 1
    .param p1, "track"    # Lcom/vkontakte/android/audio/MusicTrack;
    .param p2, "showNotification"    # Z

    .prologue
    .line 140
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/audio/player/SavedTracks;->downloadTracks(Ljava/util/Collection;Z)V

    .line 141
    return-void
.end method

.method public downloadTracks(Ljava/util/Collection;Z)V
    .locals 6
    .param p2, "showNotification"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 119
    .local p1, "tracks":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/vkontakte/android/audio/MusicTrack;>;"
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->isMusicRestricted()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 137
    :cond_0
    :goto_0
    return-void

    .line 122
    :cond_1
    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 123
    .local v1, "tracksToDownload":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/vkontakte/android/audio/MusicTrack;>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/MusicTrack;

    .line 124
    .local v0, "track":Lcom/vkontakte/android/audio/MusicTrack;
    invoke-virtual {v0}, Lcom/vkontakte/android/audio/MusicTrack;->getRestrictionType()I

    move-result v3

    if-nez v3, :cond_2

    .line 127
    sget-object v3, Lcom/vkontakte/android/audio/player/SavedTracks$1;->$SwitchMap$com$vkontakte$android$audio$player$SavedTracks$DownloadState:[I

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/MusicTrack;->getMid()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/audio/player/SavedTracks;->getDownloadState(Ljava/lang/String;)Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    goto :goto_1

    .line 129
    :pswitch_0
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mLostMidsSet:Ljava/util/Set;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/MusicTrack;->getMid()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 131
    :pswitch_1
    invoke-interface {v1, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 134
    .end local v0    # "track":Lcom/vkontakte/android/audio/MusicTrack;
    :cond_3
    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 135
    new-instance v2, Lcom/vkontakte/android/audio/player/DownloadTaskTracks;

    iget-object v3, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mContext:Landroid/content/Context;

    new-instance v4, Lcom/vkontakte/android/audio/player/SavedTracks$MyDownloadTaskListener;

    const/4 v5, 0x0

    invoke-direct {v4, p0, v5}, Lcom/vkontakte/android/audio/player/SavedTracks$MyDownloadTaskListener;-><init>(Lcom/vkontakte/android/audio/player/SavedTracks;Lcom/vkontakte/android/audio/player/SavedTracks$1;)V

    invoke-direct {v2, v3, v4, v1, p2}, Lcom/vkontakte/android/audio/player/DownloadTaskTracks;-><init>(Landroid/content/Context;Lcom/vkontakte/android/audio/player/DownloadTaskBase$DownloadTaskListener;Ljava/util/Collection;Z)V

    invoke-direct {p0, v2}, Lcom/vkontakte/android/audio/player/SavedTracks;->startDownloadTask(Lcom/vkontakte/android/audio/player/DownloadTaskBase;)V

    goto :goto_0

    .line 127
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public getDownloadState(Ljava/lang/String;)Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;
    .locals 1
    .param p1, "mid"    # Ljava/lang/String;

    .prologue
    .line 205
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/audio/player/SavedTracks;->isDownloaded(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 206
    invoke-direct {p0, p1}, Lcom/vkontakte/android/audio/player/SavedTracks;->isFileLost(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 207
    sget-object v0, Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;->DOWNLOADED_LOST:Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;

    .line 213
    :goto_0
    return-object v0

    .line 209
    :cond_0
    sget-object v0, Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;->DOWNLOADED:Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;

    goto :goto_0

    .line 210
    :cond_1
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/audio/player/SavedTracks;->isDownloading(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 211
    sget-object v0, Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;->DOWNLOADING:Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;

    goto :goto_0

    .line 213
    :cond_2
    sget-object v0, Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;->NONE:Lcom/vkontakte/android/audio/player/SavedTracks$DownloadState;

    goto :goto_0
.end method

.method public getTrack(Ljava/lang/String;)Lcom/vkontakte/android/audio/player/SavedTrack;
    .locals 3
    .param p1, "mid"    # Ljava/lang/String;

    .prologue
    .line 104
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mTracksList:Ljava/util/ArrayList;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mMidsSet:Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 105
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mTracksList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/player/SavedTrack;

    .line 106
    .local v0, "track":Lcom/vkontakte/android/audio/player/SavedTrack;
    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/SavedTrack;->getMid()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 111
    .end local v0    # "track":Lcom/vkontakte/android/audio/player/SavedTrack;
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method getTrackFile(Ljava/lang/String;)Ljava/io/File;
    .locals 2
    .param p1, "mid"    # Ljava/lang/String;

    .prologue
    .line 270
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/audio/player/SavedTracks;->getTrack(Ljava/lang/String;)Lcom/vkontakte/android/audio/player/SavedTrack;

    move-result-object v0

    .line 271
    .local v0, "track":Lcom/vkontakte/android/audio/player/SavedTrack;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    return-object v1

    :cond_0
    iget-object v1, v0, Lcom/vkontakte/android/audio/player/SavedTrack;->file:Ljava/io/File;

    goto :goto_0
.end method

.method public getTracks()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/player/SavedTrack;",
            ">;"
        }
    .end annotation

    .prologue
    .line 115
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mTracksList:Ljava/util/ArrayList;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method hasTasks()Z
    .locals 1

    .prologue
    .line 266
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mDownloadTasks:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isDownloaded(Ljava/lang/String;)Z
    .locals 1
    .param p1, "mid"    # Ljava/lang/String;

    .prologue
    .line 201
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mMidsSet:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isDownloading(Ljava/lang/String;)Z
    .locals 3
    .param p1, "mid"    # Ljava/lang/String;

    .prologue
    .line 193
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mDownloadTasks:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;

    .line 194
    .local v0, "task":Lcom/vkontakte/android/audio/player/DownloadTaskBase;
    invoke-virtual {v0, p1}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->hasTrack(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 195
    const/4 v1, 0x1

    .line 197
    .end local v0    # "task":Lcom/vkontakte/android/audio/player/DownloadTaskBase;
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method pauseDownload()V
    .locals 1

    .prologue
    .line 254
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/SavedTracks;->getCurrentDownloadTask()Lcom/vkontakte/android/audio/player/DownloadTaskBase;

    move-result-object v0

    .line 255
    .local v0, "task":Lcom/vkontakte/android/audio/player/DownloadTaskBase;
    if-eqz v0, :cond_0

    .line 256
    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->pause()V

    .line 257
    :cond_0
    return-void
.end method

.method registerListener(Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;

    .prologue
    .line 241
    if-eqz p1, :cond_0

    .line 242
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mListeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 243
    :cond_0
    return-void
.end method

.method release()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 90
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mListeners:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->clear()V

    .line 91
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mDownloadTasks:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/player/DownloadTaskBase;

    .line 92
    .local v0, "task":Lcom/vkontakte/android/audio/player/DownloadTaskBase;
    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->removeListener()V

    .line 93
    invoke-virtual {v0, v3}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->cancel(Z)Z

    goto :goto_0

    .line 95
    .end local v0    # "task":Lcom/vkontakte/android/audio/player/DownloadTaskBase;
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mDownloadTasks:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 96
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mLoadTracksTask:Lcom/vkontakte/android/audio/player/SavedTracks$LoadTracksTask;

    if-eqz v1, :cond_1

    .line 97
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mLoadTracksTask:Lcom/vkontakte/android/audio/player/SavedTracks$LoadTracksTask;

    invoke-virtual {v1, v3}, Lcom/vkontakte/android/audio/player/SavedTracks$LoadTracksTask;->cancel(Z)Z

    .line 98
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mLoadTracksTask:Lcom/vkontakte/android/audio/player/SavedTracks$LoadTracksTask;

    .line 100
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/SavedTracks;->mWakeLockEx:Lcom/vkontakte/android/audio/utils/WakeLockEx;

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/utils/WakeLockEx;->releaseSafety()V

    .line 101
    return-void
.end method

.method public varargs removeTracks([Ljava/lang/String;)V
    .locals 5
    .param p1, "mids"    # [Ljava/lang/String;

    .prologue
    .line 166
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/SavedTracks;->checkTracksLock()V

    .line 168
    const/4 v1, 0x0

    .line 170
    .local v1, "modified":Z
    array-length v3, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v0, p1, v2

    .line 171
    .local v0, "mid":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/vkontakte/android/audio/player/SavedTracks;->removeTrackInternal(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 172
    const/4 v1, 0x1

    .line 170
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 176
    .end local v0    # "mid":Ljava/lang/String;
    :cond_1
    if-eqz v1, :cond_2

    .line 177
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/SavedTracks;->saveTracks()V

    .line 178
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/SavedTracks;->notifyTracksChanged()V

    .line 180
    :cond_2
    return-void
.end method

.method resumeDownload()V
    .locals 1

    .prologue
    .line 260
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/SavedTracks;->getCurrentDownloadTask()Lcom/vkontakte/android/audio/player/DownloadTaskBase;

    move-result-object v0

    .line 261
    .local v0, "task":Lcom/vkontakte/android/audio/player/DownloadTaskBase;
    if-eqz v0, :cond_0

    .line 262
    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->resume()V

    .line 263
    :cond_0
    return-void
.end method
