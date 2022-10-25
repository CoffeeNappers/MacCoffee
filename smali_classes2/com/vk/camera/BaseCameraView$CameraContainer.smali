.class Lcom/vk/camera/BaseCameraView$CameraContainer;
.super Landroid/view/ViewGroup;
.source "BaseCameraView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/camera/BaseCameraView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CameraContainer"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/camera/BaseCameraView;


# direct methods
.method public constructor <init>(Lcom/vk/camera/BaseCameraView;Landroid/view/View;)V
    .locals 1
    .param p2, "cameraPreview"    # Landroid/view/View;

    .prologue
    .line 233
    iput-object p1, p0, Lcom/vk/camera/BaseCameraView$CameraContainer;->this$0:Lcom/vk/camera/BaseCameraView;

    .line 234
    invoke-virtual {p1}, Lcom/vk/camera/BaseCameraView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    .line 235
    invoke-virtual {p0, p2}, Lcom/vk/camera/BaseCameraView$CameraContainer;->addView(Landroid/view/View;)V

    .line 236
    return-void
.end method


# virtual methods
.method protected onLayout(ZIIII)V
    .locals 11
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    .line 240
    invoke-virtual {p0}, Lcom/vk/camera/BaseCameraView$CameraContainer;->getChildCount()I

    move-result v8

    if-lez v8, :cond_4

    .line 241
    const/4 v8, 0x0

    invoke-virtual {p0, v8}, Lcom/vk/camera/BaseCameraView$CameraContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 242
    .local v0, "child":Landroid/view/View;
    sub-int v7, p4, p2

    .line 243
    .local v7, "width":I
    sub-int v1, p5, p3

    .line 244
    .local v1, "height":I
    move v3, v7

    .line 245
    .local v3, "previewWidth":I
    move v2, v1

    .line 247
    .local v2, "previewHeight":I
    iget-object v8, p0, Lcom/vk/camera/BaseCameraView$CameraContainer;->this$0:Lcom/vk/camera/BaseCameraView;

    invoke-virtual {v8}, Lcom/vk/camera/BaseCameraView;->isCameraPreviewAvailable()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 248
    iget-object v8, p0, Lcom/vk/camera/BaseCameraView$CameraContainer;->this$0:Lcom/vk/camera/BaseCameraView;

    invoke-virtual {v8}, Lcom/vk/camera/BaseCameraView;->getDisplayOrientation()I

    move-result v8

    const/16 v9, 0x5a

    if-eq v8, v9, :cond_0

    iget-object v8, p0, Lcom/vk/camera/BaseCameraView$CameraContainer;->this$0:Lcom/vk/camera/BaseCameraView;

    .line 249
    invoke-virtual {v8}, Lcom/vk/camera/BaseCameraView;->getDisplayOrientation()I

    move-result v8

    const/16 v9, 0x10e

    if-ne v8, v9, :cond_5

    .line 250
    :cond_0
    iget-object v8, p0, Lcom/vk/camera/BaseCameraView$CameraContainer;->this$0:Lcom/vk/camera/BaseCameraView;

    invoke-virtual {v8}, Lcom/vk/camera/BaseCameraView;->getCameraPreviewHeight()I

    move-result v3

    .line 251
    iget-object v8, p0, Lcom/vk/camera/BaseCameraView$CameraContainer;->this$0:Lcom/vk/camera/BaseCameraView;

    invoke-virtual {v8}, Lcom/vk/camera/BaseCameraView;->getCameraPreviewWidth()I

    move-result v2

    .line 257
    :cond_1
    :goto_0
    mul-int v8, v7, v2

    mul-int v9, v1, v3

    if-le v8, v9, :cond_6

    const/4 v6, 0x1

    .line 260
    .local v6, "useFirstStrategy":Z
    :goto_1
    if-eqz v6, :cond_2

    iget-object v8, p0, Lcom/vk/camera/BaseCameraView$CameraContainer;->this$0:Lcom/vk/camera/BaseCameraView;

    invoke-virtual {v8}, Lcom/vk/camera/BaseCameraView;->useFullBleedPreview()Z

    move-result v8

    if-eqz v8, :cond_3

    :cond_2
    if-nez v6, :cond_7

    iget-object v8, p0, Lcom/vk/camera/BaseCameraView$CameraContainer;->this$0:Lcom/vk/camera/BaseCameraView;

    .line 261
    invoke-virtual {v8}, Lcom/vk/camera/BaseCameraView;->useFullBleedPreview()Z

    move-result v8

    if-eqz v8, :cond_7

    .line 262
    :cond_3
    mul-int v8, v3, v1

    div-int v5, v8, v2

    .line 264
    .local v5, "scaledChildWidth":I
    sub-int v8, v7, v5

    div-int/lit8 v8, v8, 0x2

    const/4 v9, 0x0

    add-int v10, v7, v5

    div-int/lit8 v10, v10, 0x2

    invoke-virtual {v0, v8, v9, v10, v1}, Landroid/view/View;->layout(IIII)V

    .line 272
    .end local v0    # "child":Landroid/view/View;
    .end local v1    # "height":I
    .end local v2    # "previewHeight":I
    .end local v3    # "previewWidth":I
    .end local v5    # "scaledChildWidth":I
    .end local v6    # "useFirstStrategy":Z
    .end local v7    # "width":I
    :cond_4
    :goto_2
    return-void

    .line 253
    .restart local v0    # "child":Landroid/view/View;
    .restart local v1    # "height":I
    .restart local v2    # "previewHeight":I
    .restart local v3    # "previewWidth":I
    .restart local v7    # "width":I
    :cond_5
    iget-object v8, p0, Lcom/vk/camera/BaseCameraView$CameraContainer;->this$0:Lcom/vk/camera/BaseCameraView;

    invoke-virtual {v8}, Lcom/vk/camera/BaseCameraView;->getCameraPreviewWidth()I

    move-result v3

    .line 254
    iget-object v8, p0, Lcom/vk/camera/BaseCameraView$CameraContainer;->this$0:Lcom/vk/camera/BaseCameraView;

    invoke-virtual {v8}, Lcom/vk/camera/BaseCameraView;->getCameraPreviewHeight()I

    move-result v2

    goto :goto_0

    .line 257
    :cond_6
    const/4 v6, 0x0

    goto :goto_1

    .line 267
    .restart local v6    # "useFirstStrategy":Z
    :cond_7
    mul-int v8, v2, v7

    div-int v4, v8, v3

    .line 269
    .local v4, "scaledChildHeight":I
    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual {v0, v8, v9, v7, v4}, Landroid/view/View;->layout(IIII)V

    goto :goto_2
.end method
