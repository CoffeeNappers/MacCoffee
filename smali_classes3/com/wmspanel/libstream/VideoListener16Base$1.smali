.class Lcom/wmspanel/libstream/VideoListener16Base$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/hardware/Camera$ErrorCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/wmspanel/libstream/VideoListener16Base;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/wmspanel/libstream/VideoListener16Base;


# direct methods
.method constructor <init>(Lcom/wmspanel/libstream/VideoListener16Base;)V
    .locals 0
    .param p1, "this$0"    # Lcom/wmspanel/libstream/VideoListener16Base;

    .prologue
    .line 158
    iput-object p1, p0, Lcom/wmspanel/libstream/VideoListener16Base$1;->this$0:Lcom/wmspanel/libstream/VideoListener16Base;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(ILandroid/hardware/Camera;)V
    .locals 3
    .param p1, "error"    # I
    .param p2, "camera"    # Landroid/hardware/Camera;

    .prologue
    .line 161
    const-string/jumbo v0, "VideoListener16Base"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "OnError, error="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16Base$1;->this$0:Lcom/wmspanel/libstream/VideoListener16Base;

    sget-object v1, Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;->FAILED:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-virtual {v0, v1}, Lcom/wmspanel/libstream/VideoListener16Base;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 163
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener16Base$1;->this$0:Lcom/wmspanel/libstream/VideoListener16Base;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/VideoListener16Base;->release()V

    .line 164
    return-void
.end method
