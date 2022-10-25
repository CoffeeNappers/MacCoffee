.class final Lcom/vk/music/dto/Section$1;
.super Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;
.source "Section.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/dto/Section;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/utils/Serializer$CreatorAdapter",
        "<",
        "Lcom/vk/music/dto/Section;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 165
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vk/music/dto/Section;
    .locals 2
    .param p1, "in"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 168
    new-instance v0, Lcom/vk/music/dto/Section;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/vk/music/dto/Section;-><init>(Lcom/vkontakte/android/utils/Serializer;Lcom/vk/music/dto/Section$1;)V

    return-object v0
.end method

.method public bridge synthetic createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 165
    invoke-virtual {p0, p1}, Lcom/vk/music/dto/Section$1;->createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vk/music/dto/Section;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/vk/music/dto/Section;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 172
    new-array v0, p1, [Lcom/vk/music/dto/Section;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 165
    invoke-virtual {p0, p1}, Lcom/vk/music/dto/Section$1;->newArray(I)[Lcom/vk/music/dto/Section;

    move-result-object v0

    return-object v0
.end method
