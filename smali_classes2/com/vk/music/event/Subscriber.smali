.class public interface abstract Lcom/vk/music/event/Subscriber;
.super Ljava/lang/Object;
.source "Subscriber.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/vk/music/event/Event;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract onEvent(Lcom/vk/music/event/Event;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation
.end method
