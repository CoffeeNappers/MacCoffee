.class Lcom/vk/camera/camera1/FocusOverlayManager$MainHandler;
.super Landroid/os/Handler;
.source "FocusOverlayManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/camera/camera1/FocusOverlayManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MainHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/camera/camera1/FocusOverlayManager;


# direct methods
.method public constructor <init>(Lcom/vk/camera/camera1/FocusOverlayManager;Landroid/os/Looper;)V
    .locals 0
    .param p2, "looper"    # Landroid/os/Looper;

    .prologue
    .line 78
    iput-object p1, p0, Lcom/vk/camera/camera1/FocusOverlayManager$MainHandler;->this$0:Lcom/vk/camera/camera1/FocusOverlayManager;

    .line 79
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 80
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 84
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 90
    :goto_0
    return-void

    .line 86
    :pswitch_0
    iget-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager$MainHandler;->this$0:Lcom/vk/camera/camera1/FocusOverlayManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/FocusOverlayManager;->access$000(Lcom/vk/camera/camera1/FocusOverlayManager;)V

    goto :goto_0

    .line 84
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
