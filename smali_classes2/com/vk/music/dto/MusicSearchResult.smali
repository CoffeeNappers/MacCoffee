.class public Lcom/vk/music/dto/MusicSearchResult;
.super Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;
.source "MusicSearchResult.java"


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vk/music/dto/MusicSearchResult;",
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
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation
.end field

.field private local:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 76
    new-instance v0, Lcom/vk/music/dto/MusicSearchResult$1;

    invoke-direct {v0}, Lcom/vk/music/dto/MusicSearchResult$1;-><init>()V

    sput-object v0, Lcom/vk/music/dto/MusicSearchResult;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method private constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 38
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 39
    sget-object v0, Lcom/vkontakte/android/audio/MusicTrack;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->createTypedArrayList(Lcom/vkontakte/android/utils/Serializer$Creator;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/dto/MusicSearchResult;->local:Ljava/util/List;

    .line 40
    sget-object v0, Lcom/vkontakte/android/audio/MusicTrack;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->createTypedArrayList(Lcom/vkontakte/android/utils/Serializer$Creator;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/dto/MusicSearchResult;->global:Ljava/util/List;

    .line 41
    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/utils/Serializer;Lcom/vk/music/dto/MusicSearchResult$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/utils/Serializer;
    .param p2, "x1"    # Lcom/vk/music/dto/MusicSearchResult$1;

    .prologue
    .line 17
    invoke-direct {p0, p1}, Lcom/vk/music/dto/MusicSearchResult;-><init>(Lcom/vkontakte/android/utils/Serializer;)V

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
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 22
    .local p1, "musicTracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 23
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/MusicTrack;

    .line 24
    .local v0, "musicTrack":Lcom/vkontakte/android/audio/MusicTrack;
    iget v2, v0, Lcom/vkontakte/android/audio/MusicTrack;->oid:I

    invoke-static {v2}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 25
    iget-object v2, p0, Lcom/vk/music/dto/MusicSearchResult;->local:Ljava/util/List;

    if-nez v2, :cond_0

    .line 26
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/vk/music/dto/MusicSearchResult;->local:Ljava/util/List;

    .line 28
    :cond_0
    iget-object v2, p0, Lcom/vk/music/dto/MusicSearchResult;->local:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 30
    :cond_1
    iget-object v2, p0, Lcom/vk/music/dto/MusicSearchResult;->global:Ljava/util/List;

    if-nez v2, :cond_2

    .line 31
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/vk/music/dto/MusicSearchResult;->global:Ljava/util/List;

    .line 33
    :cond_2
    iget-object v2, p0, Lcom/vk/music/dto/MusicSearchResult;->global:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 36
    .end local v0    # "musicTrack":Lcom/vkontakte/android/audio/MusicTrack;
    :cond_3
    return-void
.end method


# virtual methods
.method public fill(Lcom/vk/music/dto/MusicSearchResult;)V
    .locals 2
    .param p1, "result"    # Lcom/vk/music/dto/MusicSearchResult;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 58
    iget-object v0, p1, Lcom/vk/music/dto/MusicSearchResult;->local:Ljava/util/List;

    if-eqz v0, :cond_1

    .line 59
    iget-object v0, p0, Lcom/vk/music/dto/MusicSearchResult;->local:Ljava/util/List;

    if-nez v0, :cond_0

    .line 60
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/music/dto/MusicSearchResult;->local:Ljava/util/List;

    .line 62
    :cond_0
    iget-object v0, p0, Lcom/vk/music/dto/MusicSearchResult;->local:Ljava/util/List;

    iget-object v1, p1, Lcom/vk/music/dto/MusicSearchResult;->local:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 64
    :cond_1
    iget-object v0, p1, Lcom/vk/music/dto/MusicSearchResult;->global:Ljava/util/List;

    if-eqz v0, :cond_3

    .line 65
    iget-object v0, p0, Lcom/vk/music/dto/MusicSearchResult;->global:Ljava/util/List;

    if-nez v0, :cond_2

    .line 66
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/music/dto/MusicSearchResult;->global:Ljava/util/List;

    .line 68
    :cond_2
    iget-object v0, p0, Lcom/vk/music/dto/MusicSearchResult;->global:Ljava/util/List;

    iget-object v1, p1, Lcom/vk/music/dto/MusicSearchResult;->global:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 70
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
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation

    .prologue
    .line 48
    iget-object v0, p0, Lcom/vk/music/dto/MusicSearchResult;->global:Ljava/util/List;

    return-object v0
.end method

.method public getLocal()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation

    .prologue
    .line 44
    iget-object v0, p0, Lcom/vk/music/dto/MusicSearchResult;->local:Ljava/util/List;

    return-object v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lcom/vk/music/dto/MusicSearchResult;->local:Ljava/util/List;

    invoke-static {v0}, Lcom/vk/core/util/CollectionUtils;->isEmpty(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/music/dto/MusicSearchResult;->global:Ljava/util/List;

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
    .line 53
    iget-object v0, p0, Lcom/vk/music/dto/MusicSearchResult;->local:Ljava/util/List;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeTypedList(Ljava/util/List;)V

    .line 54
    iget-object v0, p0, Lcom/vk/music/dto/MusicSearchResult;->global:Ljava/util/List;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeTypedList(Ljava/util/List;)V

    .line 55
    return-void
.end method
