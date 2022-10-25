.class final Lcom/vk/music/fragment/menu/Action$1;
.super Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;
.source "Action.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/fragment/menu/Action;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/utils/Serializer$CreatorAdapter",
        "<",
        "Lcom/vk/music/fragment/menu/Action;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 40
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vk/music/fragment/menu/Action;
    .locals 2
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 43
    new-instance v0, Lcom/vk/music/fragment/menu/Action;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/vk/music/fragment/menu/Action;-><init>(Lcom/vkontakte/android/utils/Serializer;Lcom/vk/music/fragment/menu/Action$1;)V

    return-object v0
.end method

.method public bridge synthetic createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 40
    invoke-virtual {p0, p1}, Lcom/vk/music/fragment/menu/Action$1;->createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vk/music/fragment/menu/Action;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/vk/music/fragment/menu/Action;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 48
    new-array v0, p1, [Lcom/vk/music/fragment/menu/Action;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 40
    invoke-virtual {p0, p1}, Lcom/vk/music/fragment/menu/Action$1;->newArray(I)[Lcom/vk/music/fragment/menu/Action;

    move-result-object v0

    return-object v0
.end method
