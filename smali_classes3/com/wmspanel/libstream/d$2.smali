.class Lcom/wmspanel/libstream/d$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/wmspanel/libstream/d;->a(ILcom/wmspanel/libstream/Streamer$CONNECTION_STATE;Lcom/wmspanel/libstream/Streamer$STATUS;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic N:Lcom/wmspanel/libstream/d;

.field final synthetic O:I

.field final synthetic P:Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;

.field final synthetic Q:Lcom/wmspanel/libstream/Streamer$STATUS;


# direct methods
.method constructor <init>(Lcom/wmspanel/libstream/d;ILcom/wmspanel/libstream/Streamer$CONNECTION_STATE;Lcom/wmspanel/libstream/Streamer$STATUS;)V
    .locals 0

    .prologue
    .line 464
    iput-object p1, p0, Lcom/wmspanel/libstream/d$2;->N:Lcom/wmspanel/libstream/d;

    iput p2, p0, Lcom/wmspanel/libstream/d$2;->O:I

    iput-object p3, p0, Lcom/wmspanel/libstream/d$2;->P:Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;

    iput-object p4, p0, Lcom/wmspanel/libstream/d$2;->Q:Lcom/wmspanel/libstream/Streamer$STATUS;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 467
    iget-object v0, p0, Lcom/wmspanel/libstream/d$2;->N:Lcom/wmspanel/libstream/d;

    invoke-static {v0}, Lcom/wmspanel/libstream/d;->e(Lcom/wmspanel/libstream/d;)Lcom/wmspanel/libstream/Streamer$Listener;

    move-result-object v0

    iget v1, p0, Lcom/wmspanel/libstream/d$2;->O:I

    iget-object v2, p0, Lcom/wmspanel/libstream/d$2;->P:Lcom/wmspanel/libstream/Streamer$CONNECTION_STATE;

    iget-object v3, p0, Lcom/wmspanel/libstream/d$2;->Q:Lcom/wmspanel/libstream/Streamer$STATUS;

    invoke-interface {v0, v1, v2, v3}, Lcom/wmspanel/libstream/Streamer$Listener;->onConnectionStateChanged(ILcom/wmspanel/libstream/Streamer$CONNECTION_STATE;Lcom/wmspanel/libstream/Streamer$STATUS;)V

    .line 468
    return-void
.end method
