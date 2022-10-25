.class public Lcom/vk/music/dto/PlaylistSearchResult;
.super Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;
.source "PlaylistSearchResult.java"


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vk/music/dto/PlaylistSearchResult;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private global:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vk/music/dto/Playlist;",
            ">;"
        }
    .end annotation
.end field

.field private local:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vk/music/dto/Playlist;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 75
    new-instance v0, Lcom/vk/music/dto/PlaylistSearchResult$1;

    invoke-direct {v0}, Lcom/vk/music/dto/PlaylistSearchResult$1;-><init>()V

    sput-object v0, Lcom/vk/music/dto/PlaylistSearchResult;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method private constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 38
    sget-object v0, Lcom/vk/music/dto/Playlist;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->createTypedArrayList(Lcom/vkontakte/android/utils/Serializer$Creator;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/dto/PlaylistSearchResult;->local:Ljava/util/List;

    .line 39
    sget-object v0, Lcom/vk/music/dto/Playlist;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->createTypedArrayList(Lcom/vkontakte/android/utils/Serializer$Creator;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/dto/PlaylistSearchResult;->global:Ljava/util/List;

    .line 40
    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/utils/Serializer;Lcom/vk/music/dto/PlaylistSearchResult$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/utils/Serializer;
    .param p2, "x1"    # Lcom/vk/music/dto/PlaylistSearchResult$1;

    .prologue
    .line 16
    invoke-direct {p0, p1}, Lcom/vk/music/dto/PlaylistSearchResult;-><init>(Lcom/vkontakte/android/utils/Serializer;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .locals 3
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vk/music/dto/Playlist;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 21
    .local p1, "playlists":Ljava/util/List;, "Ljava/util/List<Lcom/vk/music/dto/Playlist;>;"
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 22
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/music/dto/Playlist;

    .line 23
    .local v0, "playlist":Lcom/vk/music/dto/Playlist;
    iget v2, v0, Lcom/vk/music/dto/Playlist;->ownerId:I

    invoke-static {v2}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 24
    iget-object v2, p0, Lcom/vk/music/dto/PlaylistSearchResult;->local:Ljava/util/List;

    if-nez v2, :cond_0

    .line 25
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/vk/music/dto/PlaylistSearchResult;->local:Ljava/util/List;

    .line 27
    :cond_0
    iget-object v2, p0, Lcom/vk/music/dto/PlaylistSearchResult;->local:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 29
    :cond_1
    iget-object v2, p0, Lcom/vk/music/dto/PlaylistSearchResult;->global:Ljava/util/List;

    if-nez v2, :cond_2

    .line 30
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/vk/music/dto/PlaylistSearchResult;->global:Ljava/util/List;

    .line 32
    :cond_2
    iget-object v2, p0, Lcom/vk/music/dto/PlaylistSearchResult;->global:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 35
    .end local v0    # "playlist":Lcom/vk/music/dto/Playlist;
    :cond_3
    return-void
.end method


# virtual methods
.method public fill(Lcom/vk/music/dto/PlaylistSearchResult;)V
    .locals 2
    .param p1, "result"    # Lcom/vk/music/dto/PlaylistSearchResult;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 57
    iget-object v0, p1, Lcom/vk/music/dto/PlaylistSearchResult;->local:Ljava/util/List;

    if-eqz v0, :cond_1

    .line 58
    iget-object v0, p0, Lcom/vk/music/dto/PlaylistSearchResult;->local:Ljava/util/List;

    if-nez v0, :cond_0

    .line 59
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/music/dto/PlaylistSearchResult;->local:Ljava/util/List;

    .line 61
    :cond_0
    iget-object v0, p0, Lcom/vk/music/dto/PlaylistSearchResult;->local:Ljava/util/List;

    iget-object v1, p1, Lcom/vk/music/dto/PlaylistSearchResult;->local:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 63
    :cond_1
    iget-object v0, p1, Lcom/vk/music/dto/PlaylistSearchResult;->global:Ljava/util/List;

    if-eqz v0, :cond_3

    .line 64
    iget-object v0, p0, Lcom/vk/music/dto/PlaylistSearchResult;->global:Ljava/util/List;

    if-nez v0, :cond_2

    .line 65
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/music/dto/PlaylistSearchResult;->global:Ljava/util/List;

    .line 67
    :cond_2
    iget-object v0, p0, Lcom/vk/music/dto/PlaylistSearchResult;->global:Ljava/util/List;

    iget-object v1, p1, Lcom/vk/music/dto/PlaylistSearchResult;->global:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 69
    :cond_3
    return-void
.end method

.method public getGlobal()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vk/music/dto/Playlist;",
            ">;"
        }
    .end annotation

    .prologue
    .line 47
    iget-object v0, p0, Lcom/vk/music/dto/PlaylistSearchResult;->global:Ljava/util/List;

    return-object v0
.end method

.method public getLocal()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vk/music/dto/Playlist;",
            ">;"
        }
    .end annotation

    .prologue
    .line 43
    iget-object v0, p0, Lcom/vk/music/dto/PlaylistSearchResult;->local:Ljava/util/List;

    return-object v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lcom/vk/music/dto/PlaylistSearchResult;->local:Ljava/util/List;

    invoke-static {v0}, Lcom/vk/core/util/CollectionUtils;->isEmpty(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/music/dto/PlaylistSearchResult;->global:Ljava/util/List;

    invoke-static {v0}, Lcom/vk/core/util/CollectionUtils;->isEmpty(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/vk/music/dto/PlaylistSearchResult;->local:Ljava/util/List;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeTypedList(Ljava/util/List;)V

    .line 53
    iget-object v0, p0, Lcom/vk/music/dto/PlaylistSearchResult;->global:Ljava/util/List;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeTypedList(Ljava/util/List;)V

    .line 54
    return-void
.end method
