.class public Lcom/vk/music/event/MusicEventBus;
.super Ljava/lang/Object;
.source "MusicEventBus.java"


# static fields
.field private static final subscribersMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<+",
            "Lcom/vk/music/event/Event;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/vk/music/event/Subscriber",
            "<+",
            "Lcom/vk/music/event/Event;",
            ">;>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 15
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/vk/music/event/MusicEventBus;->subscribersMap:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static post(Lcom/vk/music/event/Event;)V
    .locals 4
    .param p0    # Lcom/vk/music/event/Event;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/vk/music/event/Event;",
            ">(TT;)V"
        }
    .end annotation

    .prologue
    .line 37
    .local p0, "event":Lcom/vk/music/event/Event;, "TT;"
    sget-object v2, Lcom/vk/music/event/MusicEventBus;->subscribersMap:Ljava/util/Map;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 38
    .local v1, "subscribers":Ljava/util/List;, "Ljava/util/List<Lcom/vk/music/event/Subscriber<+Lcom/vk/music/event/Event;>;>;"
    if-eqz v1, :cond_0

    .line 39
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/music/event/Subscriber;

    .line 40
    .local v0, "subscriber":Lcom/vk/music/event/Subscriber;
    invoke-interface {v0, p0}, Lcom/vk/music/event/Subscriber;->onEvent(Lcom/vk/music/event/Event;)V

    goto :goto_0

    .line 43
    .end local v0    # "subscriber":Lcom/vk/music/event/Subscriber;
    :cond_0
    return-void
.end method

.method public static subscribe(Ljava/lang/Class;Lcom/vk/music/event/Subscriber;)V
    .locals 2
    .param p0    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lcom/vk/music/event/Subscriber;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/vk/music/event/Event;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Lcom/vk/music/event/Subscriber",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 18
    .local p0, "eventType":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p1, "subscriber":Lcom/vk/music/event/Subscriber;, "Lcom/vk/music/event/Subscriber<TT;>;"
    sget-object v1, Lcom/vk/music/event/MusicEventBus;->subscribersMap:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 19
    .local v0, "subscribers":Ljava/util/List;, "Ljava/util/List<Lcom/vk/music/event/Subscriber<+Lcom/vk/music/event/Event;>;>;"
    if-nez v0, :cond_0

    .line 20
    new-instance v0, Ljava/util/LinkedList;

    .end local v0    # "subscribers":Ljava/util/List;, "Ljava/util/List<Lcom/vk/music/event/Subscriber<+Lcom/vk/music/event/Event;>;>;"
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 21
    .restart local v0    # "subscribers":Ljava/util/List;, "Ljava/util/List<Lcom/vk/music/event/Subscriber<+Lcom/vk/music/event/Event;>;>;"
    sget-object v1, Lcom/vk/music/event/MusicEventBus;->subscribersMap:Ljava/util/Map;

    invoke-interface {v1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    :cond_0
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 24
    return-void
.end method

.method public static unsubscribe(Ljava/lang/Class;Lcom/vk/music/event/Subscriber;)V
    .locals 2
    .param p0    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lcom/vk/music/event/Subscriber;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/vk/music/event/Event;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Lcom/vk/music/event/Subscriber",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 27
    .local p0, "eventType":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p1, "subscriber":Lcom/vk/music/event/Subscriber;, "Lcom/vk/music/event/Subscriber<TT;>;"
    sget-object v1, Lcom/vk/music/event/MusicEventBus;->subscribersMap:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 28
    .local v0, "subscribers":Ljava/util/List;, "Ljava/util/List<Lcom/vk/music/event/Subscriber<+Lcom/vk/music/event/Event;>;>;"
    if-eqz v0, :cond_0

    .line 29
    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 30
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 31
    sget-object v1, Lcom/vk/music/event/MusicEventBus;->subscribersMap:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    :cond_0
    return-void
.end method
