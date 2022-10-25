.class Lcom/vk/imageloader/view/VKZoomableImageView$1;
.super Ljava/lang/Object;
.source "VKZoomableImageView.java"

# interfaces
.implements Lcom/vk/imageloader/OnLoadCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/imageloader/view/VKZoomableImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/imageloader/view/VKZoomableImageView;


# direct methods
.method constructor <init>(Lcom/vk/imageloader/view/VKZoomableImageView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/imageloader/view/VKZoomableImageView;

    .prologue
    .line 30
    iput-object p1, p0, Lcom/vk/imageloader/view/VKZoomableImageView$1;->this$0:Lcom/vk/imageloader/view/VKZoomableImageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure()V
    .locals 0

    .prologue
    .line 38
    return-void
.end method

.method public onSuccess(II)V
    .locals 1
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 33
    iget-object v0, p0, Lcom/vk/imageloader/view/VKZoomableImageView$1;->this$0:Lcom/vk/imageloader/view/VKZoomableImageView;

    invoke-virtual {v0, p1, p2}, Lcom/vk/imageloader/view/VKZoomableImageView;->update(II)V

    .line 34
    return-void
.end method
