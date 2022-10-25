.class public interface abstract Lcom/vk/music/view/adapter/ItemViewHolder$Binder;
.super Ljava/lang/Object;
.source "ItemViewHolder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/view/adapter/ItemViewHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Binder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Item:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract onBind(Lcom/vk/music/view/adapter/ViewRefs;Ljava/lang/Object;I)V
    .param p1    # Lcom/vk/music/view/adapter/ViewRefs;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/music/view/adapter/ViewRefs;",
            "TItem;I)V"
        }
    .end annotation
.end method

.method public abstract onCreate(Landroid/view/View;)Lcom/vk/music/view/adapter/ViewRefs;
    .param p1    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method
