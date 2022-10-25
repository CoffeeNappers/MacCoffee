.class public Lcom/vkontakte/android/fragments/videos/VideoAddHelper;
.super Ljava/lang/Object;
.source "VideoAddHelper.java"


# static fields
.field public static final ACTION_RELOAD_VIDEO_ALBUMS:Ljava/lang/String; = "com.vkontakte.android.RELOAD_VIDEO_ALBUMS"


# instance fields
.field private context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lcom/vkontakte/android/fragments/videos/VideoAddHelper;->context:Landroid/content/Context;

    .line 39
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/videos/VideoAddHelper;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/videos/VideoAddHelper;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideoAddHelper;->context:Landroid/content/Context;

    return-object v0
.end method


# virtual methods
.method public showAlbumsDialog(ILcom/vkontakte/android/api/VideoFile;)V
    .locals 3
    .param p1, "targetID"    # I
    .param p2, "video"    # Lcom/vkontakte/android/api/VideoFile;

    .prologue
    .line 42
    new-instance v0, Lcom/vkontakte/android/api/video/VideoGetAlbumsByVideo;

    iget v1, p2, Lcom/vkontakte/android/api/VideoFile;->oid:I

    iget v2, p2, Lcom/vkontakte/android/api/VideoFile;->vid:I

    invoke-direct {v0, p1, v1, v2}, Lcom/vkontakte/android/api/video/VideoGetAlbumsByVideo;-><init>(III)V

    new-instance v1, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideoAddHelper;->context:Landroid/content/Context;

    invoke-direct {v1, p0, v2, p2, p1}, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1;-><init>(Lcom/vkontakte/android/fragments/videos/VideoAddHelper;Landroid/content/Context;Lcom/vkontakte/android/api/VideoFile;I)V

    .line 43
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/video/VideoGetAlbumsByVideo;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideoAddHelper;->context:Landroid/content/Context;

    .line 153
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 154
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/os/Looper;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 155
    return-void
.end method
