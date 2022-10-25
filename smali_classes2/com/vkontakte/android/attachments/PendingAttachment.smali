.class public interface abstract Lcom/vkontakte/android/attachments/PendingAttachment;
.super Ljava/lang/Object;
.source "PendingAttachment.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<A::",
        "Landroid/os/Parcelable;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract createUploadTask(Landroid/content/Context;)Lcom/vkontakte/android/upload/UploadTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Lcom/vkontakte/android/upload/UploadTask",
            "<TA;>;"
        }
    .end annotation
.end method

.method public abstract getUploadId()I
.end method

.method public abstract getUrl()Ljava/lang/String;
.end method

.method public abstract setId(I)V
.end method
