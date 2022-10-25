.class public Lcom/vkontakte/android/fragments/videos/Videos;
.super Ljava/lang/Object;
.source "Videos.java"


# static fields
.field static final ACTION_ALBUM_CREATED:Ljava/lang/String; = "com.vkontakte.android.VIDEO_ALBUM_CREATED"

.field static final ACTION_UPLOAD_DONE:Ljava/lang/String; = "com.vkontakte.android.UPLOAD_DONE"

.field static final ACTION_VIDEO_ADDED:Ljava/lang/String; = "com.vkontakte.android.VIDEO_ADDED"

.field public static final ACTION_VIDEO_MOVED:Ljava/lang/String; = "com.vkontakte.android.VIDEO_MOVED"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    return-void
.end method

.method static extractAlbum(Landroid/content/Intent;)Lcom/vkontakte/android/api/VideoAlbum;
    .locals 1
    .param p0, "data"    # Landroid/content/Intent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 51
    const-string/jumbo v0, "album"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/VideoAlbum;

    return-object v0
.end method

.method static extractVideo(Landroid/content/Intent;)Lcom/vkontakte/android/api/VideoFile;
    .locals 1
    .param p0, "data"    # Landroid/content/Intent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 47
    const-string/jumbo v0, "video"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/VideoFile;

    return-object v0
.end method

.method static notifyAlbumCreated(Landroid/content/Context;Lcom/vkontakte/android/api/VideoAlbum;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "album"    # Lcom/vkontakte/android/api/VideoAlbum;

    .prologue
    .line 43
    invoke-static {p0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "com.vkontakte.android.VIDEO_ALBUM_CREATED"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, "album"

    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v4/content/LocalBroadcastManager;->sendBroadcast(Landroid/content/Intent;)Z

    .line 44
    return-void
.end method

.method static notifyVideoAdded(Landroid/content/Context;Lcom/vkontakte/android/api/VideoFile;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "video"    # Lcom/vkontakte/android/api/VideoFile;

    .prologue
    .line 29
    invoke-static {p0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "com.vkontakte.android.VIDEO_ADDED"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, "video"

    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v4/content/LocalBroadcastManager;->sendBroadcast(Landroid/content/Intent;)Z

    .line 30
    return-void
.end method

.method static notifyVideoMoved(Landroid/content/Context;Lcom/vkontakte/android/api/VideoFile;ILjava/util/List;Ljava/util/List;)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "video"    # Lcom/vkontakte/android/api/VideoFile;
    .param p2, "targetId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/vkontakte/android/api/VideoFile;",
            "I",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 33
    .local p3, "add":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local p4, "remove":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-static {p0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "com.vkontakte.android.VIDEO_MOVED"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, "video"

    .line 35
    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v2, "target_id"

    .line 36
    invoke-virtual {v1, v2, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v2, "add"

    .line 37
    invoke-static {p3}, Lcom/vkontakte/android/SystemUtils;->asIntArray(Ljava/util/List;)[I

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[I)Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v2, "remove"

    .line 38
    invoke-static {p4}, Lcom/vkontakte/android/SystemUtils;->asIntArray(Ljava/util/List;)[I

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[I)Landroid/content/Intent;

    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Landroid/support/v4/content/LocalBroadcastManager;->sendBroadcast(Landroid/content/Intent;)Z

    .line 40
    return-void
.end method
