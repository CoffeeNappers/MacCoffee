.class Lcom/wmspanel/libstream/StreamRecorder$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/wmspanel/libstream/StreamRecorder;->setRecordState(Lcom/wmspanel/libstream/Streamer$RECORD_STATE;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic dw:Lcom/wmspanel/libstream/StreamRecorder;


# direct methods
.method constructor <init>(Lcom/wmspanel/libstream/StreamRecorder;)V
    .locals 0

    .prologue
    .line 230
    iput-object p1, p0, Lcom/wmspanel/libstream/StreamRecorder$2;->dw:Lcom/wmspanel/libstream/StreamRecorder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 233
    iget-object v0, p0, Lcom/wmspanel/libstream/StreamRecorder$2;->dw:Lcom/wmspanel/libstream/StreamRecorder;

    invoke-static {v0}, Lcom/wmspanel/libstream/StreamRecorder;->access$1000(Lcom/wmspanel/libstream/StreamRecorder;)Lcom/wmspanel/libstream/Streamer$Listener;

    move-result-object v0

    iget-object v1, p0, Lcom/wmspanel/libstream/StreamRecorder$2;->dw:Lcom/wmspanel/libstream/StreamRecorder;

    invoke-static {v1}, Lcom/wmspanel/libstream/StreamRecorder;->access$900(Lcom/wmspanel/libstream/StreamRecorder;)Lcom/wmspanel/libstream/Streamer$RECORD_STATE;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/wmspanel/libstream/Streamer$Listener;->onRecordStateChanged(Lcom/wmspanel/libstream/Streamer$RECORD_STATE;)V

    .line 234
    return-void
.end method
