.class public interface abstract Lcom/vk/medianative/FFMpegVideoCompressor$Callback;
.super Ljava/lang/Object;
.source "FFMpegVideoCompressor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/medianative/FFMpegVideoCompressor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Callback"
.end annotation


# virtual methods
.method public abstract onBytes(I)V
.end method

.method public abstract onProgress(I)V
.end method

.method public abstract onVideoInfo(IIIIDI)V
.end method
