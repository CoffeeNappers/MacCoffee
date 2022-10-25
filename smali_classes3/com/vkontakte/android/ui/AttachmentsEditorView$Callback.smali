.class public interface abstract Lcom/vkontakte/android/ui/AttachmentsEditorView$Callback;
.super Ljava/lang/Object;
.source "AttachmentsEditorView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/AttachmentsEditorView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Callback"
.end annotation


# virtual methods
.method public abstract onAllUploadsDone()V
.end method

.method public abstract onAttachmentRemoved(Lcom/vkontakte/android/attachments/Attachment;)V
.end method

.method public abstract onUploadFailed()V
.end method
