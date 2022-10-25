.class Lcom/vk/camera/camera1/Camera1View$OnOrientationChange;
.super Landroid/view/OrientationEventListener;
.source "Camera1View.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/camera/camera1/Camera1View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "OnOrientationChange"
.end annotation


# instance fields
.field private isEnabled:Z

.field final synthetic this$0:Lcom/vk/camera/camera1/Camera1View;


# direct methods
.method public constructor <init>(Lcom/vk/camera/camera1/Camera1View;Landroid/content/Context;)V
    .locals 1
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 653
    iput-object p1, p0, Lcom/vk/camera/camera1/Camera1View$OnOrientationChange;->this$0:Lcom/vk/camera/camera1/Camera1View;

    .line 654
    invoke-direct {p0, p2}, Landroid/view/OrientationEventListener;-><init>(Landroid/content/Context;)V

    .line 651
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/camera/camera1/Camera1View$OnOrientationChange;->isEnabled:Z

    .line 655
    invoke-virtual {p0}, Lcom/vk/camera/camera1/Camera1View$OnOrientationChange;->disable()V

    .line 656
    return-void
.end method


# virtual methods
.method public disable()V
    .locals 1

    .prologue
    .line 692
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/camera/camera1/Camera1View$OnOrientationChange;->isEnabled:Z

    .line 693
    invoke-super {p0}, Landroid/view/OrientationEventListener;->disable()V

    .line 694
    return-void
.end method

.method public enable()V
    .locals 1

    .prologue
    .line 686
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/camera/camera1/Camera1View$OnOrientationChange;->isEnabled:Z

    .line 687
    invoke-super {p0}, Landroid/view/OrientationEventListener;->enable()V

    .line 688
    return-void
.end method

.method isEnabled()Z
    .locals 1

    .prologue
    .line 697
    iget-boolean v0, p0, Lcom/vk/camera/camera1/Camera1View$OnOrientationChange;->isEnabled:Z

    return v0
.end method

.method public onOrientationChanged(I)V
    .locals 5
    .param p1, "orientation"    # I

    .prologue
    .line 660
    iget-object v3, p0, Lcom/vk/camera/camera1/Camera1View$OnOrientationChange;->this$0:Lcom/vk/camera/camera1/Camera1View;

    invoke-static {v3}, Lcom/vk/camera/camera1/Camera1View;->access$200(Lcom/vk/camera/camera1/Camera1View;)Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    move-result-object v3

    if-eqz v3, :cond_2

    const/4 v3, -0x1

    if-eq p1, v3, :cond_2

    .line 661
    iget-object v3, p0, Lcom/vk/camera/camera1/Camera1View$OnOrientationChange;->this$0:Lcom/vk/camera/camera1/Camera1View;

    invoke-static {v3}, Lcom/vk/camera/camera1/Camera1View;->access$300(Lcom/vk/camera/camera1/Camera1View;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 662
    iget-object v3, p0, Lcom/vk/camera/camera1/Camera1View$OnOrientationChange;->this$0:Lcom/vk/camera/camera1/Camera1View;

    invoke-static {v3}, Lcom/vk/camera/camera1/Camera1View;->access$400(Lcom/vk/camera/camera1/Camera1View;)I

    move-result p1

    .line 665
    :cond_0
    iget-object v3, p0, Lcom/vk/camera/camera1/Camera1View$OnOrientationChange;->this$0:Lcom/vk/camera/camera1/Camera1View;

    invoke-static {v3}, Lcom/vk/camera/camera1/Camera1View;->access$500(Lcom/vk/camera/camera1/Camera1View;)I

    move-result v3

    invoke-static {p1, v3}, Lcom/vk/camera/camera1/CameraUtils;->getCameraPictureRotation(II)I

    move-result v2

    .line 667
    .local v2, "newOutputOrientation":I
    iget-object v3, p0, Lcom/vk/camera/camera1/Camera1View$OnOrientationChange;->this$0:Lcom/vk/camera/camera1/Camera1View;

    invoke-static {v3}, Lcom/vk/camera/camera1/Camera1View;->access$600(Lcom/vk/camera/camera1/Camera1View;)I

    move-result v3

    if-eq v2, v3, :cond_2

    .line 668
    iget-object v3, p0, Lcom/vk/camera/camera1/Camera1View$OnOrientationChange;->this$0:Lcom/vk/camera/camera1/Camera1View;

    invoke-static {v3, v2}, Lcom/vk/camera/camera1/Camera1View;->access$700(Lcom/vk/camera/camera1/Camera1View;I)V

    .line 671
    :try_start_0
    invoke-static {}, Lcom/vk/camera/camera1/CameraHolder;->instance()Lcom/vk/camera/camera1/CameraHolder;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vk/camera/camera1/CameraHolder;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    .line 672
    .local v0, "cameraParameters":Landroid/hardware/Camera$Parameters;
    if-eqz v0, :cond_1

    .line 673
    iget-object v3, p0, Lcom/vk/camera/camera1/Camera1View$OnOrientationChange;->this$0:Lcom/vk/camera/camera1/Camera1View;

    invoke-static {v3}, Lcom/vk/camera/camera1/Camera1View;->access$600(Lcom/vk/camera/camera1/Camera1View;)I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/hardware/Camera$Parameters;->setRotation(I)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 678
    .end local v0    # "cameraParameters":Landroid/hardware/Camera$Parameters;
    :cond_1
    :goto_0
    iget-object v3, p0, Lcom/vk/camera/camera1/Camera1View$OnOrientationChange;->this$0:Lcom/vk/camera/camera1/Camera1View;

    invoke-static {v3}, Lcom/vk/camera/camera1/Camera1View;->access$800(Lcom/vk/camera/camera1/Camera1View;)V

    .line 679
    iget-object v3, p0, Lcom/vk/camera/camera1/Camera1View$OnOrientationChange;->this$0:Lcom/vk/camera/camera1/Camera1View;

    iget-object v4, p0, Lcom/vk/camera/camera1/Camera1View$OnOrientationChange;->this$0:Lcom/vk/camera/camera1/Camera1View;

    invoke-static {v4}, Lcom/vk/camera/camera1/Camera1View;->access$600(Lcom/vk/camera/camera1/Camera1View;)I

    move-result v4

    invoke-static {v3, v4}, Lcom/vk/camera/camera1/Camera1View;->access$902(Lcom/vk/camera/camera1/Camera1View;I)I

    .line 682
    .end local v2    # "newOutputOrientation":I
    :cond_2
    return-void

    .line 675
    .restart local v2    # "newOutputOrientation":I
    :catch_0
    move-exception v1

    .line 676
    .local v1, "e":Ljava/lang/Throwable;
    const-string/jumbo v3, "Camera"

    const-string/jumbo v4, ""

    invoke-static {v3, v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method
