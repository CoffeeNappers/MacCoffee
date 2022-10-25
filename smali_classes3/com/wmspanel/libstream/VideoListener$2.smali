.class Lcom/wmspanel/libstream/VideoListener$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/wmspanel/libstream/VideoListener;->setVideoCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/wmspanel/libstream/VideoListener;

.field final synthetic val$videoCaptureState:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;


# direct methods
.method constructor <init>(Lcom/wmspanel/libstream/VideoListener;Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V
    .locals 0
    .param p1, "this$0"    # Lcom/wmspanel/libstream/VideoListener;

    .prologue
    .line 227
    iput-object p1, p0, Lcom/wmspanel/libstream/VideoListener$2;->this$0:Lcom/wmspanel/libstream/VideoListener;

    iput-object p2, p0, Lcom/wmspanel/libstream/VideoListener$2;->val$videoCaptureState:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 230
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener$2;->this$0:Lcom/wmspanel/libstream/VideoListener;

    iget-object v0, v0, Lcom/wmspanel/libstream/VideoListener;->mListener:Lcom/wmspanel/libstream/Streamer$Listener;

    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListener$2;->val$videoCaptureState:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-interface {v0, v1}, Lcom/wmspanel/libstream/Streamer$Listener;->onVideoCaptureStateChanged(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 231
    return-void
.end method
