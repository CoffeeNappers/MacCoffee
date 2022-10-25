.class public interface abstract Lcom/vk/music/view/adapter/IdResolver;
.super Ljava/lang/Object;
.source "IdResolver.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Item:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract resolve(Ljava/lang/Object;)J
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TItem;)J"
        }
    .end annotation
.end method
