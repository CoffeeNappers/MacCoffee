.class public interface abstract Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder$DeletedCommentViewHolderListener;
.super Ljava/lang/Object;
.source "DeletedCommentViewHolder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "DeletedCommentViewHolderListener"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/vkontakte/android/Comment;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract banUser(Lcom/vkontakte/android/Comment;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation
.end method

.method public abstract canBanUsers()Z
.end method

.method public abstract reportComment(Lcom/vkontakte/android/Comment;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation
.end method

.method public abstract restoreComment(I)V
.end method
