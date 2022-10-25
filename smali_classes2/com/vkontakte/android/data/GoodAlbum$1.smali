.class final Lcom/vkontakte/android/data/GoodAlbum$1;
.super Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;
.source "GoodAlbum.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/data/GoodAlbum;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/utils/Serializer$CreatorAdapter",
        "<",
        "Lcom/vkontakte/android/data/GoodAlbum;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 51
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vkontakte/android/data/GoodAlbum;
    .locals 1
    .param p1, "in"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 54
    new-instance v0, Lcom/vkontakte/android/data/GoodAlbum;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/data/GoodAlbum;-><init>(Lcom/vkontakte/android/utils/Serializer;)V

    return-object v0
.end method

.method public bridge synthetic createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 51
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/data/GoodAlbum$1;->createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vkontakte/android/data/GoodAlbum;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/vkontakte/android/data/GoodAlbum;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 58
    new-array v0, p1, [Lcom/vkontakte/android/data/GoodAlbum;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 51
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/data/GoodAlbum$1;->newArray(I)[Lcom/vkontakte/android/data/GoodAlbum;

    move-result-object v0

    return-object v0
.end method
