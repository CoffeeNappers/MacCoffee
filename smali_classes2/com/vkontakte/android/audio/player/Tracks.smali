.class public Lcom/vkontakte/android/audio/player/Tracks;
.super Ljava/lang/Object;
.source "Tracks.java"


# instance fields
.field private final mList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/audio/player/PlayerTrack;",
            ">;"
        }
    .end annotation
.end field

.field private final mMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 19
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {p0, v0}, Lcom/vkontakte/android/audio/player/Tracks;-><init>(Ljava/util/ArrayList;)V

    .line 20
    return-void
.end method

.method private constructor <init>(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/audio/player/PlayerTrack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 22
    .local p1, "tracks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/audio/player/PlayerTrack;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/Tracks;->mList:Ljava/util/ArrayList;

    .line 24
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/Tracks;->mMap:Ljava/util/Map;

    .line 25
    return-void
.end method

.method private clearMap()V
    .locals 1

    .prologue
    .line 166
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Tracks;->mMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 167
    return-void
.end method


# virtual methods
.method public add(Lcom/vkontakte/android/audio/player/PlayerTrack;)V
    .locals 3
    .param p1, "track"    # Lcom/vkontakte/android/audio/player/PlayerTrack;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Tracks;->mList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 41
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Tracks;->mMap:Ljava/util/Map;

    iget-object v1, p1, Lcom/vkontakte/android/audio/player/PlayerTrack;->uuid:Ljava/lang/String;

    iget-object v2, p0, Lcom/vkontakte/android/audio/player/Tracks;->mList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    return-void
.end method

.method public add(Lcom/vkontakte/android/audio/player/PlayerTrack;Ljava/lang/String;)V
    .locals 3
    .param p1, "track"    # Lcom/vkontakte/android/audio/player/PlayerTrack;
    .param p2, "uuid"    # Ljava/lang/String;

    .prologue
    .line 45
    invoke-virtual {p0, p2}, Lcom/vkontakte/android/audio/player/Tracks;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 46
    .local v0, "index":I
    if-ltz v0, :cond_0

    .line 47
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/Tracks;->mList:Ljava/util/ArrayList;

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {v1, v2, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 48
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Tracks;->clearMap()V

    .line 52
    :goto_0
    return-void

    .line 50
    :cond_0
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/audio/player/Tracks;->add(Lcom/vkontakte/android/audio/player/PlayerTrack;)V

    goto :goto_0
.end method

.method public addAll(Ljava/util/Collection;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lcom/vkontakte/android/audio/player/PlayerTrack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 55
    .local p1, "tracks":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/vkontakte/android/audio/player/PlayerTrack;>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/player/PlayerTrack;

    .line 56
    .local v0, "track":Lcom/vkontakte/android/audio/player/PlayerTrack;
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/audio/player/Tracks;->add(Lcom/vkontakte/android/audio/player/PlayerTrack;)V

    goto :goto_0

    .line 57
    .end local v0    # "track":Lcom/vkontakte/android/audio/player/PlayerTrack;
    :cond_0
    return-void
.end method

.method public asList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/player/PlayerTrack;",
            ">;"
        }
    .end annotation

    .prologue
    .line 120
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Tracks;->mList:Ljava/util/ArrayList;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 83
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Tracks;->mList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 84
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Tracks;->clearMap()V

    .line 85
    return-void
.end method

.method public get(I)Lcom/vkontakte/android/audio/player/PlayerTrack;
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 34
    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Tracks;->mList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt p1, v0, :cond_1

    .line 35
    :cond_0
    const/4 v0, 0x0

    .line 36
    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Tracks;->mList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/player/PlayerTrack;

    goto :goto_0
.end method

.method public get(Ljava/lang/String;)Lcom/vkontakte/android/audio/player/PlayerTrack;
    .locals 2
    .param p1, "uuid"    # Ljava/lang/String;

    .prologue
    .line 28
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/audio/player/Tracks;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 30
    .local v0, "index":I
    if-ltz v0, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/Tracks;->mList:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/audio/player/PlayerTrack;

    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getFirst()Lcom/vkontakte/android/audio/player/PlayerTrack;
    .locals 2

    .prologue
    .line 88
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Tracks;->mList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Tracks;->mList:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/player/PlayerTrack;

    goto :goto_0
.end method

.method public getLast()Lcom/vkontakte/android/audio/player/PlayerTrack;
    .locals 2

    .prologue
    .line 92
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Tracks;->mList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Tracks;->mList:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/Tracks;->mList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/player/PlayerTrack;

    goto :goto_0
.end method

.method public getNext(Ljava/lang/String;)Lcom/vkontakte/android/audio/player/PlayerTrack;
    .locals 3
    .param p1, "uuid"    # Ljava/lang/String;

    .prologue
    .line 96
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/audio/player/Tracks;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 97
    .local v0, "index":I
    if-ltz v0, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/Tracks;->mList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_0

    .line 98
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/Tracks;->mList:Ljava/util/ArrayList;

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/audio/player/PlayerTrack;

    .line 100
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getPrev(Ljava/lang/String;)Lcom/vkontakte/android/audio/player/PlayerTrack;
    .locals 3
    .param p1, "uuid"    # Ljava/lang/String;

    .prologue
    .line 104
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/audio/player/Tracks;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 105
    .local v0, "index":I
    if-lez v0, :cond_0

    .line 106
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/Tracks;->mList:Ljava/util/ArrayList;

    add-int/lit8 v2, v0, -0x1

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/audio/player/PlayerTrack;

    .line 108
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public indexOf(Ljava/lang/String;)I
    .locals 5
    .param p1, "uuid"    # Ljava/lang/String;

    .prologue
    .line 150
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/Tracks;->mMap:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 151
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/Tracks;->mList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 152
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/Tracks;->mMap:Ljava/util/Map;

    iget-object v2, p0, Lcom/vkontakte/android/audio/player/Tracks;->mList:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/audio/player/PlayerTrack;

    iget-object v2, v2, Lcom/vkontakte/android/audio/player/PlayerTrack;->uuid:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 155
    .end local v0    # "i":I
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/Tracks;->mMap:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 157
    .local v1, "index":Ljava/lang/Integer;
    if-nez v1, :cond_1

    const/4 v2, -0x1

    :goto_1
    return v2

    :cond_1
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    goto :goto_1
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 116
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Tracks;->mList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public remove(Ljava/lang/String;)Lcom/vkontakte/android/audio/player/PlayerTrack;
    .locals 3
    .param p1, "uuid"    # Ljava/lang/String;

    .prologue
    .line 71
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/audio/player/Tracks;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 72
    .local v0, "index":I
    if-ltz v0, :cond_0

    .line 73
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/Tracks;->mList:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/audio/player/PlayerTrack;

    .line 74
    .local v1, "track":Lcom/vkontakte/android/audio/player/PlayerTrack;
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Tracks;->clearMap()V

    .line 79
    .end local v1    # "track":Lcom/vkontakte/android/audio/player/PlayerTrack;
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public remove(II)V
    .locals 3
    .param p1, "oid"    # I
    .param p2, "aid"    # I

    .prologue
    .line 60
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/Tracks;->mList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 61
    .local v0, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/audio/player/PlayerTrack;>;"
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 62
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/audio/player/PlayerTrack;

    .line 63
    .local v1, "playerTrack":Lcom/vkontakte/android/audio/player/PlayerTrack;
    iget v2, v1, Lcom/vkontakte/android/audio/player/PlayerTrack;->oid:I

    if-ne v2, p1, :cond_0

    iget v2, v1, Lcom/vkontakte/android/audio/player/PlayerTrack;->aid:I

    if-ne v2, p2, :cond_0

    .line 64
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 67
    .end local v1    # "playerTrack":Lcom/vkontakte/android/audio/player/PlayerTrack;
    :cond_1
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Tracks;->clearMap()V

    .line 68
    return-void
.end method

.method public shuffle(Ljava/util/Collection;)Lcom/vkontakte/android/audio/player/Tracks;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/vkontakte/android/audio/player/Tracks;"
        }
    .end annotation

    .prologue
    .line 124
    .local p1, "firstUuids":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    new-instance v4, Ljava/util/ArrayList;

    iget-object v5, p0, Lcom/vkontakte/android/audio/player/Tracks;->mList:Ljava/util/ArrayList;

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 125
    .local v4, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/audio/player/PlayerTrack;>;"
    invoke-static {v4}, Ljava/util/Collections;->shuffle(Ljava/util/List;)V

    .line 126
    if-eqz p1, :cond_2

    .line 127
    const/4 v1, 0x0

    .line 128
    .local v1, "index":I
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_0
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 129
    .local v0, "firstUuid":Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_1
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v3, v5, :cond_0

    .line 130
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/audio/player/PlayerTrack;

    iget-object v5, v5, Lcom/vkontakte/android/audio/player/PlayerTrack;->uuid:Ljava/lang/String;

    invoke-static {v0, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 131
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "index":I
    .local v2, "index":I
    invoke-static {v4, v3, v1}, Ljava/util/Collections;->swap(Ljava/util/List;II)V

    move v1, v2

    .line 132
    .end local v2    # "index":I
    .restart local v1    # "index":I
    goto :goto_0

    .line 129
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 138
    .end local v0    # "firstUuid":Ljava/lang/String;
    .end local v1    # "index":I
    .end local v3    # "j":I
    :cond_2
    new-instance v5, Lcom/vkontakte/android/audio/player/Tracks;

    invoke-direct {v5, v4}, Lcom/vkontakte/android/audio/player/Tracks;-><init>(Ljava/util/ArrayList;)V

    return-object v5
.end method

.method public size()I
    .locals 1

    .prologue
    .line 112
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Tracks;->mList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public swap(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "uuid1"    # Ljava/lang/String;
    .param p2, "uuid2"    # Ljava/lang/String;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Tracks;->mList:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/audio/player/Tracks;->indexOf(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p0, p2}, Lcom/vkontakte/android/audio/player/Tracks;->indexOf(Ljava/lang/String;)I

    move-result v2

    invoke-static {v0, v1, v2}, Ljava/util/Collections;->swap(Ljava/util/List;II)V

    .line 162
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/Tracks;->clearMap()V

    .line 163
    return-void
.end method

.method public updateTracks(Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Lcom/vkontakte/android/audio/player/PlayerTrack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 142
    .local p1, "tracks":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Lcom/vkontakte/android/audio/player/PlayerTrack;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/Tracks;->mList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 143
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/Tracks;->mList:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/audio/player/PlayerTrack;

    invoke-virtual {v2}, Lcom/vkontakte/android/audio/player/PlayerTrack;->getId()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/audio/player/PlayerTrack;

    .line 144
    .local v1, "newTrack":Lcom/vkontakte/android/audio/player/PlayerTrack;
    if-eqz v1, :cond_0

    .line 145
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/Tracks;->mList:Ljava/util/ArrayList;

    invoke-virtual {v2, v0, v1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 142
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 147
    .end local v1    # "newTrack":Lcom/vkontakte/android/audio/player/PlayerTrack;
    :cond_1
    return-void
.end method
