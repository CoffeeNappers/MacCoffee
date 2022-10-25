.class public final Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Factory;
.super Ljava/lang/Object;
.source "MediaPlayerHelperI.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Factory"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    return-void
.end method

.method public static get(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;Landroid/content/Context;ILcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;)Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;
    .locals 2
    .param p0, "type"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "id"    # I
    .param p3, "listener"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;

    .prologue
    .line 61
    sget-object v0, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$1;->$SwitchMap$com$vkontakte$android$audio$player$MediaPlayerHelperI$Type:[I

    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 67
    new-instance v0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;

    invoke-direct {v0, p1, p2, p3}, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;-><init>(Landroid/content/Context;ILcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;)V

    :goto_0
    return-object v0

    .line 64
    :pswitch_0
    new-instance v1, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;

    sget-object v0, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;->exoPlayer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;

    if-ne p0, v0, :cond_0

    const/4 v0, 0x1

    :goto_1
    invoke-direct {v1, p1, p2, p3, v0}, Lcom/vkontakte/android/audio/player/ExoPlayerHelper;-><init>(Landroid/content/Context;ILcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;Z)V

    move-object v0, v1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    .line 61
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
