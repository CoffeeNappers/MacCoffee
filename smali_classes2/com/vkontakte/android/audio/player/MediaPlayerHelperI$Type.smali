.class public final enum Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;
.super Ljava/lang/Enum;
.source "MediaPlayerHelperI.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;

.field public static final enum exoPlayer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;

.field public static final enum exoPlayerCached:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;

.field public static final enum mediaPlayer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;


# instance fields
.field private final urlCreatorFile:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$UrlCreator;

.field private final urlCreatorHttp:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$UrlCreator;

.field public final useLocalhostForCache:Z


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .prologue
    const/4 v10, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x1

    .line 32
    new-instance v0, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;

    const-string/jumbo v1, "mediaPlayer"

    sget-object v4, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->URL_CREATOR_LOCAL_HOST_CACHE:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$UrlCreator;

    sget-object v5, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->URL_CREATOR_LOCAL_HOST_CACHE:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$UrlCreator;

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;-><init>(Ljava/lang/String;IZLcom/vkontakte/android/audio/player/MediaPlayerHelperI$UrlCreator;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$UrlCreator;)V

    sput-object v0, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;->mediaPlayer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;

    .line 33
    new-instance v4, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;

    const-string/jumbo v5, "exoPlayer"

    sget-object v8, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->URL_CREATOR_LOCAL_HOST_CACHE:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$UrlCreator;

    sget-object v9, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->URL_CREATOR_LOCAL_HOST_CACHE:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$UrlCreator;

    move v6, v3

    move v7, v3

    invoke-direct/range {v4 .. v9}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;-><init>(Ljava/lang/String;IZLcom/vkontakte/android/audio/player/MediaPlayerHelperI$UrlCreator;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$UrlCreator;)V

    sput-object v4, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;->exoPlayer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;

    .line 34
    new-instance v4, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;

    const-string/jumbo v5, "exoPlayerCached"

    sget-object v8, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->URL_CREATOR_EXO_PLAYER_CACHE_HTTP:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$UrlCreator;

    sget-object v9, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;->URL_CREATOR_EXO_PLAYER_CACHE_FILE:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$UrlCreator;

    move v6, v10

    move v7, v2

    invoke-direct/range {v4 .. v9}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;-><init>(Ljava/lang/String;IZLcom/vkontakte/android/audio/player/MediaPlayerHelperI$UrlCreator;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$UrlCreator;)V

    sput-object v4, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;->exoPlayerCached:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;

    .line 31
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;

    sget-object v1, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;->mediaPlayer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;

    aput-object v1, v0, v2

    sget-object v1, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;->exoPlayer:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;

    aput-object v1, v0, v3

    sget-object v1, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;->exoPlayerCached:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;

    aput-object v1, v0, v10

    sput-object v0, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;->$VALUES:[Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IZLcom/vkontakte/android/audio/player/MediaPlayerHelperI$UrlCreator;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$UrlCreator;)V
    .locals 0
    .param p3, "useLocalhostForCache"    # Z
    .param p4, "urlCreatorHttp"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$UrlCreator;
    .param p5, "urlCreatorFile"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$UrlCreator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$UrlCreator;",
            "Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$UrlCreator;",
            ")V"
        }
    .end annotation

    .prologue
    .line 40
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 41
    iput-boolean p3, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;->useLocalhostForCache:Z

    .line 42
    iput-object p4, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;->urlCreatorHttp:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$UrlCreator;

    .line 43
    iput-object p5, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;->urlCreatorFile:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$UrlCreator;

    .line 44
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 31
    const-class v0, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;

    return-object v0
.end method

.method public static values()[Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;
    .locals 1

    .prologue
    .line 31
    sget-object v0, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;->$VALUES:[Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;

    invoke-virtual {v0}, [Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;

    return-object v0
.end method


# virtual methods
.method public createFileUrl(Lcom/vkontakte/android/audio/MusicTrack;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "track"    # Lcom/vkontakte/android/audio/MusicTrack;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 51
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;->urlCreatorFile:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$UrlCreator;

    if-nez p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-interface {v1, v0, p2}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$UrlCreator;->createUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    invoke-virtual {p1}, Lcom/vkontakte/android/audio/MusicTrack;->getMid()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public createHttpUrl(Lcom/vkontakte/android/audio/MusicTrack;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "track"    # Lcom/vkontakte/android/audio/MusicTrack;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 47
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Type;->urlCreatorHttp:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$UrlCreator;

    if-nez p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-interface {v1, v0, p2}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$UrlCreator;->createUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    invoke-virtual {p1}, Lcom/vkontakte/android/audio/MusicTrack;->getMid()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
