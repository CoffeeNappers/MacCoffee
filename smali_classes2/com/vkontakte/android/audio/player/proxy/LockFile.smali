.class public Lcom/vkontakte/android/audio/player/proxy/LockFile;
.super Ljava/lang/Object;
.source "LockFile.java"


# static fields
.field private static final LOCKS:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mPath:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 9
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/vkontakte/android/audio/player/proxy/LockFile;->LOCKS:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .locals 1
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/proxy/LockFile;->mPath:Ljava/lang/String;

    .line 14
    return-void
.end method

.method public static lock(Ljava/io/File;)Lcom/vkontakte/android/audio/player/proxy/LockFile;
    .locals 1
    .param p0, "file"    # Ljava/io/File;

    .prologue
    .line 17
    new-instance v0, Lcom/vkontakte/android/audio/player/proxy/LockFile;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/audio/player/proxy/LockFile;-><init>(Ljava/io/File;)V

    .line 18
    .local v0, "lock":Lcom/vkontakte/android/audio/player/proxy/LockFile;
    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/proxy/LockFile;->lock()V

    .line 20
    return-object v0
.end method


# virtual methods
.method public lock()V
    .locals 3

    .prologue
    .line 24
    const-class v1, Lcom/vkontakte/android/audio/player/proxy/LockFile;

    monitor-enter v1

    .line 25
    :goto_0
    :try_start_0
    sget-object v0, Lcom/vkontakte/android/audio/player/proxy/LockFile;->LOCKS:Ljava/util/Set;

    iget-object v2, p0, Lcom/vkontakte/android/audio/player/proxy/LockFile;->mPath:Ljava/lang/String;

    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-eqz v0, :cond_0

    .line 27
    :try_start_1
    const-class v0, Lcom/vkontakte/android/audio/player/proxy/LockFile;

    invoke-virtual {v0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 28
    :catch_0
    move-exception v0

    goto :goto_0

    .line 32
    :cond_0
    :try_start_2
    sget-object v0, Lcom/vkontakte/android/audio/player/proxy/LockFile;->LOCKS:Ljava/util/Set;

    iget-object v2, p0, Lcom/vkontakte/android/audio/player/proxy/LockFile;->mPath:Ljava/lang/String;

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 33
    monitor-exit v1

    .line 34
    return-void

    .line 33
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0
.end method

.method public unlock()V
    .locals 3

    .prologue
    .line 37
    const-class v1, Lcom/vkontakte/android/audio/player/proxy/LockFile;

    monitor-enter v1

    .line 38
    :try_start_0
    sget-object v0, Lcom/vkontakte/android/audio/player/proxy/LockFile;->LOCKS:Ljava/util/Set;

    iget-object v2, p0, Lcom/vkontakte/android/audio/player/proxy/LockFile;->mPath:Ljava/lang/String;

    invoke-interface {v0, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 39
    const-class v0, Lcom/vkontakte/android/audio/player/proxy/LockFile;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 40
    monitor-exit v1

    .line 41
    return-void

    .line 40
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
