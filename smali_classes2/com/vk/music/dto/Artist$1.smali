.class final Lcom/vk/music/dto/Artist$1;
.super Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;
.source "Artist.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/dto/Artist;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/utils/Serializer$CreatorAdapter",
        "<",
        "Lcom/vk/music/dto/Artist;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 54
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vk/music/dto/Artist;
    .locals 2
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 57
    new-instance v0, Lcom/vk/music/dto/Artist;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/vk/music/dto/Artist;-><init>(Lcom/vkontakte/android/utils/Serializer;Lcom/vk/music/dto/Artist$1;)V

    return-object v0
.end method

.method public bridge synthetic createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 54
    invoke-virtual {p0, p1}, Lcom/vk/music/dto/Artist$1;->createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vk/music/dto/Artist;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/vk/music/dto/Artist;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 62
    new-array v0, p1, [Lcom/vk/music/dto/Artist;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 54
    invoke-virtual {p0, p1}, Lcom/vk/music/dto/Artist$1;->newArray(I)[Lcom/vk/music/dto/Artist;

    move-result-object v0

    return-object v0
.end method
