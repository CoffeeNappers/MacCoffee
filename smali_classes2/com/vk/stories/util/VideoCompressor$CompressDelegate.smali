.class public interface abstract Lcom/vk/stories/util/VideoCompressor$CompressDelegate;
.super Ljava/lang/Object;
.source "VideoCompressor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/stories/util/VideoCompressor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "CompressDelegate"
.end annotation


# virtual methods
.method public abstract onBytes(I)V
.end method

.method public abstract onCancel()V
.end method

.method public abstract onError(Ljava/lang/Exception;)V
.end method

.method public abstract onFinish(JLjava/io/File;)V
.end method

.method public abstract onProgress(I)V
.end method
