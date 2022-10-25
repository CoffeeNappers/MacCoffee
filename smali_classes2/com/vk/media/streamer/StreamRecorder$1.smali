.class Lcom/vk/media/streamer/StreamRecorder$1;
.super Ljava/lang/Object;
.source "StreamRecorder.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/media/streamer/StreamRecorder;->setPresentationTime(J)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/media/streamer/StreamRecorder;


# direct methods
.method constructor <init>(Lcom/vk/media/streamer/StreamRecorder;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/media/streamer/StreamRecorder;

    .prologue
    .line 88
    iput-object p1, p0, Lcom/vk/media/streamer/StreamRecorder$1;->this$0:Lcom/vk/media/streamer/StreamRecorder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 91
    iget-object v0, p0, Lcom/vk/media/streamer/StreamRecorder$1;->this$0:Lcom/vk/media/streamer/StreamRecorder;

    invoke-static {v0}, Lcom/vk/media/streamer/StreamRecorder;->access$100(Lcom/vk/media/streamer/StreamRecorder;)Landroid/media/MediaRecorder$OnInfoListener;

    move-result-object v0

    const/4 v1, 0x0

    const/16 v2, 0x320

    iget-object v3, p0, Lcom/vk/media/streamer/StreamRecorder$1;->this$0:Lcom/vk/media/streamer/StreamRecorder;

    invoke-static {v3}, Lcom/vk/media/streamer/StreamRecorder;->access$000(Lcom/vk/media/streamer/StreamRecorder;)I

    move-result v3

    invoke-interface {v0, v1, v2, v3}, Landroid/media/MediaRecorder$OnInfoListener;->onInfo(Landroid/media/MediaRecorder;II)V

    .line 92
    return-void
.end method
