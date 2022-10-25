.class public final Lcom/vkontakte/android/api/audio/AudioSearchPlaylists$Builder;
.super Ljava/lang/Object;
.source "AudioSearchPlaylists.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/audio/AudioSearchPlaylists;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field count:I

.field offset:I

.field ownerId:I

.field query:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lcom/vkontakte/android/api/audio/AudioSearchPlaylists;
    .locals 2

    .prologue
    .line 45
    new-instance v0, Lcom/vkontakte/android/api/audio/AudioSearchPlaylists;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/api/audio/AudioSearchPlaylists;-><init>(Lcom/vkontakte/android/api/audio/AudioSearchPlaylists$Builder;Lcom/vkontakte/android/api/audio/AudioSearchPlaylists$1;)V

    return-object v0
.end method

.method public count(I)Lcom/vkontakte/android/api/audio/AudioSearchPlaylists$Builder;
    .locals 0
    .param p1, "val"    # I

    .prologue
    .line 40
    iput p1, p0, Lcom/vkontakte/android/api/audio/AudioSearchPlaylists$Builder;->count:I

    .line 41
    return-object p0
.end method

.method public offset(I)Lcom/vkontakte/android/api/audio/AudioSearchPlaylists$Builder;
    .locals 0
    .param p1, "val"    # I

    .prologue
    .line 35
    iput p1, p0, Lcom/vkontakte/android/api/audio/AudioSearchPlaylists$Builder;->offset:I

    .line 36
    return-object p0
.end method

.method public ownerId(I)Lcom/vkontakte/android/api/audio/AudioSearchPlaylists$Builder;
    .locals 0
    .param p1, "val"    # I

    .prologue
    .line 30
    iput p1, p0, Lcom/vkontakte/android/api/audio/AudioSearchPlaylists$Builder;->ownerId:I

    .line 31
    return-object p0
.end method

.method public query(Ljava/lang/String;)Lcom/vkontakte/android/api/audio/AudioSearchPlaylists$Builder;
    .locals 0
    .param p1, "val"    # Ljava/lang/String;

    .prologue
    .line 25
    iput-object p1, p0, Lcom/vkontakte/android/api/audio/AudioSearchPlaylists$Builder;->query:Ljava/lang/String;

    .line 26
    return-object p0
.end method
