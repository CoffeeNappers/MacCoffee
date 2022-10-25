.class public interface abstract Lcom/vk/lists/PaginateHelper$PagedDataProviderWithOffset;
.super Ljava/lang/Object;
.source "PaginateHelper.java"

# interfaces
.implements Lcom/vk/lists/PaginateHelper$PagedDataProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/lists/PaginateHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "PagedDataProviderWithOffset"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/vk/lists/PaginateHelper$PagedDataProvider",
        "<TT;>;"
    }
.end annotation


# virtual methods
.method public abstract loadNext(ILcom/vk/lists/PaginateHelper;)Lio/reactivex/Observable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/vk/lists/PaginateHelper;",
            ")",
            "Lio/reactivex/Observable",
            "<TT;>;"
        }
    .end annotation
.end method
