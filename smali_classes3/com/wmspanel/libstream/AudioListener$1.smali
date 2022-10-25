.class Lcom/wmspanel/libstream/AudioListener$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/wmspanel/libstream/AudioListener;->setAudioCaptureState(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/wmspanel/libstream/AudioListener;

.field final synthetic val$audioCaptureState:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;


# direct methods
.method constructor <init>(Lcom/wmspanel/libstream/AudioListener;Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V
    .locals 0
    .param p1, "this$0"    # Lcom/wmspanel/libstream/AudioListener;

    .prologue
    .line 65
    iput-object p1, p0, Lcom/wmspanel/libstream/AudioListener$1;->this$0:Lcom/wmspanel/libstream/AudioListener;

    iput-object p2, p0, Lcom/wmspanel/libstream/AudioListener$1;->val$audioCaptureState:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 68
    iget-object v0, p0, Lcom/wmspanel/libstream/AudioListener$1;->this$0:Lcom/wmspanel/libstream/AudioListener;

    invoke-static {v0}, Lcom/wmspanel/libstream/AudioListener;->access$000(Lcom/wmspanel/libstream/AudioListener;)Lcom/wmspanel/libstream/Streamer$Listener;

    move-result-object v0

    iget-object v1, p0, Lcom/wmspanel/libstream/AudioListener$1;->val$audioCaptureState:Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;

    invoke-interface {v0, v1}, Lcom/wmspanel/libstream/Streamer$Listener;->onAudioCaptureStateChanged(Lcom/wmspanel/libstream/Streamer$CAPTURE_STATE;)V

    .line 69
    return-void
.end method
