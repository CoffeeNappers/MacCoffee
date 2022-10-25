.class public interface abstract Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder$CommentViewHolderListener;
.super Ljava/lang/Object;
.source "CommentViewHolder.java"

# interfaces
.implements Lcom/vkontakte/android/attachments/StickerAttachment$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "CommentViewHolderListener"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/vkontakte/android/Comment;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/attachments/StickerAttachment$Callback;"
    }
.end annotation


# virtual methods
.method public abstract likeComment(Lcom/vkontakte/android/Comment;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation
.end method

.method public abstract replyToComment(Lcom/vkontakte/android/Comment;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation
.end method

.method public abstract showCommentActions(Lcom/vkontakte/android/Comment;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation
.end method
