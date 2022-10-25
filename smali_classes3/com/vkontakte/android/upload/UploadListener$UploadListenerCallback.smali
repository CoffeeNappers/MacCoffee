.class public interface abstract Lcom/vkontakte/android/upload/UploadListener$UploadListenerCallback;
.super Ljava/lang/Object;
.source "UploadListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/upload/UploadListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "UploadListenerCallback"
.end annotation


# virtual methods
.method public abstract onDone(ILcom/vkontakte/android/attachments/Attachment;)V
.end method

.method public abstract onFailed(ILcom/vkontakte/android/attachments/Attachment;)V
.end method

.method public abstract onProgress(III)V
.end method
