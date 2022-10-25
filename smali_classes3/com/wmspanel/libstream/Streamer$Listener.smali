.class public interface abstract Lcom/wmspanel/libstream/Streamer$Listener;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/wmspanel/libstream/Streamer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Listener"
.end annotation


# virtual methods
.method public abstract getHandler()Landroid/os/Handler;
.end method

.method public abstract onAudioCaptureStateChanged(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V
.end method

.method public abstract onConnectionStateChanged(ILcom/wmspanel/libstream/Streamer$CONNECTION_STATE;Lcom/wmspanel/libstream/Streamer$STATUS;)V
.end method

.method public abstract onRecordStateChanged(Lcom/wmspanel/libstream/Streamer$RECORD_STATE;)V
.end method

.method public abstract onVideoCaptureStateChanged(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V
.end method
