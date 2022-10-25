.class public interface abstract Lcom/vk/lists/PaginateHelper$PagedDataProvider;
.super Ljava/lang/Object;
.source "PaginateHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/lists/PaginateHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "PagedDataProvider"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract onNewData(Lio/reactivex/Observable;Lcom/vk/lists/PaginateHelper;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observable",
            "<TT;>;",
            "Lcom/vk/lists/PaginateHelper;",
            ")V"
        }
    .end annotation
.end method

.method public abstract reload(Lcom/vk/lists/PaginateHelper;)Lio/reactivex/Observable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/lists/PaginateHelper;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation
.end method
