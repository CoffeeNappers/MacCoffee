.class public final Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Builder;
.super Ljava/lang/Object;
.source "AudioGetPlaylists.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/audio/AudioGetPlaylists;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field count:I

.field filter:Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;

.field offset:I

.field final ownerId:I


# direct methods
.method public constructor <init>(I)V
    .locals 0
    .param p1, "ownerId"    # I

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput p1, p0, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Builder;->ownerId:I

    .line 57
    return-void
.end method


# virtual methods
.method public build()Lcom/vkontakte/android/api/audio/AudioGetPlaylists;
    .locals 2

    .prologue
    .line 75
    iget-object v0, p0, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Builder;->filter:Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;

    if-nez v0, :cond_0

    .line 76
    sget-object v0, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;->all:Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;

    iput-object v0, p0, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Builder;->filter:Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;

    .line 79
    :cond_0
    new-instance v0, Lcom/vkontakte/android/api/audio/AudioGetPlaylists;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/api/audio/AudioGetPlaylists;-><init>(Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Builder;Lcom/vkontakte/android/api/audio/AudioGetPlaylists$1;)V

    return-object v0
.end method

.method public count(I)Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Builder;
    .locals 0
    .param p1, "val"    # I

    .prologue
    .line 70
    iput p1, p0, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Builder;->count:I

    .line 71
    return-object p0
.end method

.method public filter(Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;)Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Builder;
    .locals 0
    .param p1, "val"    # Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;

    .prologue
    .line 60
    iput-object p1, p0, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Builder;->filter:Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;

    .line 61
    return-object p0
.end method

.method public offset(I)Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Builder;
    .locals 0
    .param p1, "val"    # I

    .prologue
    .line 65
    iput p1, p0, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Builder;->offset:I

    .line 66
    return-object p0
.end method
