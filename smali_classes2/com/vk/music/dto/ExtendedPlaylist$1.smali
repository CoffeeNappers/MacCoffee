.class final Lcom/vk/music/dto/ExtendedPlaylist$1;
.super Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;
.source "ExtendedPlaylist.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/dto/ExtendedPlaylist;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/utils/Serializer$CreatorAdapter",
        "<",
        "Lcom/vk/music/dto/ExtendedPlaylist;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vk/music/dto/ExtendedPlaylist;
    .locals 1
    .param p1, "in"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 36
    new-instance v0, Lcom/vk/music/dto/ExtendedPlaylist;

    invoke-direct {v0, p1}, Lcom/vk/music/dto/ExtendedPlaylist;-><init>(Lcom/vkontakte/android/utils/Serializer;)V

    return-object v0
.end method

.method public bridge synthetic createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 33
    invoke-virtual {p0, p1}, Lcom/vk/music/dto/ExtendedPlaylist$1;->createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vk/music/dto/ExtendedPlaylist;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/vk/music/dto/ExtendedPlaylist;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 40
    new-array v0, p1, [Lcom/vk/music/dto/ExtendedPlaylist;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 33
    invoke-virtual {p0, p1}, Lcom/vk/music/dto/ExtendedPlaylist$1;->newArray(I)[Lcom/vk/music/dto/ExtendedPlaylist;

    move-result-object v0

    return-object v0
.end method
