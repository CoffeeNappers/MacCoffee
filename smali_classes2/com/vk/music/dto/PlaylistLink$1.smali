.class final Lcom/vk/music/dto/PlaylistLink$1;
.super Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;
.source "PlaylistLink.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/dto/PlaylistLink;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/utils/Serializer$CreatorAdapter",
        "<",
        "Lcom/vk/music/dto/PlaylistLink;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 44
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vk/music/dto/PlaylistLink;
    .locals 1
    .param p1, "in"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 47
    new-instance v0, Lcom/vk/music/dto/PlaylistLink;

    invoke-direct {v0, p1}, Lcom/vk/music/dto/PlaylistLink;-><init>(Lcom/vkontakte/android/utils/Serializer;)V

    return-object v0
.end method

.method public bridge synthetic createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 44
    invoke-virtual {p0, p1}, Lcom/vk/music/dto/PlaylistLink$1;->createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vk/music/dto/PlaylistLink;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/vk/music/dto/PlaylistLink;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 51
    new-array v0, p1, [Lcom/vk/music/dto/PlaylistLink;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 44
    invoke-virtual {p0, p1}, Lcom/vk/music/dto/PlaylistLink$1;->newArray(I)[Lcom/vk/music/dto/PlaylistLink;

    move-result-object v0

    return-object v0
.end method
