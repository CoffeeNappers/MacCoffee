.class final Lcom/vkontakte/android/attachments/AudioPlaylistAttachment$1;
.super Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;
.source "AudioPlaylistAttachment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/attachments/AudioPlaylistAttachment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/utils/Serializer$CreatorAdapter",
        "<",
        "Lcom/vkontakte/android/attachments/AudioPlaylistAttachment;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vkontakte/android/attachments/AudioPlaylistAttachment;
    .locals 2
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 35
    const-class v1, Lcom/vk/music/dto/Playlist;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->readSerializable(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Serializable;

    move-result-object v0

    check-cast v0, Lcom/vk/music/dto/Playlist;

    .line 36
    .local v0, "playlist":Lcom/vk/music/dto/Playlist;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    return-object v1

    :cond_0
    new-instance v1, Lcom/vkontakte/android/attachments/AudioPlaylistAttachment;

    invoke-direct {v1, v0}, Lcom/vkontakte/android/attachments/AudioPlaylistAttachment;-><init>(Lcom/vk/music/dto/Playlist;)V

    goto :goto_0
.end method

.method public bridge synthetic createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 32
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/AudioPlaylistAttachment$1;->createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vkontakte/android/attachments/AudioPlaylistAttachment;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/vkontakte/android/attachments/AudioPlaylistAttachment;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 40
    new-array v0, p1, [Lcom/vkontakte/android/attachments/AudioPlaylistAttachment;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 32
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/AudioPlaylistAttachment$1;->newArray(I)[Lcom/vkontakte/android/attachments/AudioPlaylistAttachment;

    move-result-object v0

    return-object v0
.end method
