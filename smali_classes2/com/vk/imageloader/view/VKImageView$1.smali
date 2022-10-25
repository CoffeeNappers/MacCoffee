.class Lcom/vk/imageloader/view/VKImageView$1;
.super Lcom/facebook/drawee/controller/BaseControllerListener;
.source "VKImageView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/imageloader/view/VKImageView;->proccessImageRequest(Lcom/facebook/imagepipeline/request/ImageRequestBuilder;Lcom/facebook/imagepipeline/request/ImageRequestBuilder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/drawee/controller/BaseControllerListener",
        "<",
        "Lcom/facebook/imagepipeline/image/ImageInfo;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/imageloader/view/VKImageView;


# direct methods
.method constructor <init>(Lcom/vk/imageloader/view/VKImageView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/imageloader/view/VKImageView;

    .prologue
    .line 221
    iput-object p1, p0, Lcom/vk/imageloader/view/VKImageView$1;->this$0:Lcom/vk/imageloader/view/VKImageView;

    invoke-direct {p0}, Lcom/facebook/drawee/controller/BaseControllerListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "throwable"    # Ljava/lang/Throwable;

    .prologue
    const/4 v1, 0x0

    .line 234
    iget-object v0, p0, Lcom/vk/imageloader/view/VKImageView$1;->this$0:Lcom/vk/imageloader/view/VKImageView;

    invoke-static {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->access$002(Lcom/vk/imageloader/view/VKImageView;I)I

    .line 235
    iget-object v0, p0, Lcom/vk/imageloader/view/VKImageView$1;->this$0:Lcom/vk/imageloader/view/VKImageView;

    invoke-static {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->access$102(Lcom/vk/imageloader/view/VKImageView;I)I

    .line 237
    iget-object v0, p0, Lcom/vk/imageloader/view/VKImageView$1;->this$0:Lcom/vk/imageloader/view/VKImageView;

    invoke-static {v0}, Lcom/vk/imageloader/view/VKImageView;->access$200(Lcom/vk/imageloader/view/VKImageView;)Lcom/vk/imageloader/OnLoadCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 238
    iget-object v0, p0, Lcom/vk/imageloader/view/VKImageView$1;->this$0:Lcom/vk/imageloader/view/VKImageView;

    invoke-static {v0}, Lcom/vk/imageloader/view/VKImageView;->access$200(Lcom/vk/imageloader/view/VKImageView;)Lcom/vk/imageloader/OnLoadCallback;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/imageloader/OnLoadCallback;->onFailure()V

    .line 241
    :cond_0
    iget-object v0, p0, Lcom/vk/imageloader/view/VKImageView$1;->this$0:Lcom/vk/imageloader/view/VKImageView;

    invoke-static {v0}, Lcom/vk/imageloader/view/VKImageView;->access$300(Lcom/vk/imageloader/view/VKImageView;)I

    move-result v0

    const/4 v1, 0x3

    if-ge v0, v1, :cond_1

    .line 242
    iget-object v0, p0, Lcom/vk/imageloader/view/VKImageView$1;->this$0:Lcom/vk/imageloader/view/VKImageView;

    invoke-static {v0}, Lcom/vk/imageloader/view/VKImageView;->access$308(Lcom/vk/imageloader/view/VKImageView;)I

    .line 243
    iget-object v0, p0, Lcom/vk/imageloader/view/VKImageView$1;->this$0:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v0}, Lcom/vk/imageloader/view/VKImageView;->retryImageRequest()V

    .line 247
    :goto_0
    return-void

    .line 245
    :cond_1
    iget-object v0, p0, Lcom/vk/imageloader/view/VKImageView$1;->this$0:Lcom/vk/imageloader/view/VKImageView;

    invoke-static {v0}, Lcom/vk/imageloader/ImageNetworkFailHandler;->onNetworkFail(Lcom/vk/imageloader/view/VKImageView;)V

    goto :goto_0
.end method

.method public onFinalImageSet(Ljava/lang/String;Lcom/facebook/imagepipeline/image/ImageInfo;Landroid/graphics/drawable/Animatable;)V
    .locals 3
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "imageInfo"    # Lcom/facebook/imagepipeline/image/ImageInfo;
    .param p3, "animatable"    # Landroid/graphics/drawable/Animatable;

    .prologue
    .line 224
    iget-object v0, p0, Lcom/vk/imageloader/view/VKImageView$1;->this$0:Lcom/vk/imageloader/view/VKImageView;

    invoke-interface {p2}, Lcom/facebook/imagepipeline/image/ImageInfo;->getWidth()I

    move-result v1

    invoke-static {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->access$002(Lcom/vk/imageloader/view/VKImageView;I)I

    .line 225
    iget-object v0, p0, Lcom/vk/imageloader/view/VKImageView$1;->this$0:Lcom/vk/imageloader/view/VKImageView;

    invoke-interface {p2}, Lcom/facebook/imagepipeline/image/ImageInfo;->getHeight()I

    move-result v1

    invoke-static {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->access$102(Lcom/vk/imageloader/view/VKImageView;I)I

    .line 227
    iget-object v0, p0, Lcom/vk/imageloader/view/VKImageView$1;->this$0:Lcom/vk/imageloader/view/VKImageView;

    invoke-static {v0}, Lcom/vk/imageloader/view/VKImageView;->access$200(Lcom/vk/imageloader/view/VKImageView;)Lcom/vk/imageloader/OnLoadCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 228
    iget-object v0, p0, Lcom/vk/imageloader/view/VKImageView$1;->this$0:Lcom/vk/imageloader/view/VKImageView;

    invoke-static {v0}, Lcom/vk/imageloader/view/VKImageView;->access$200(Lcom/vk/imageloader/view/VKImageView;)Lcom/vk/imageloader/OnLoadCallback;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/imageloader/view/VKImageView$1;->this$0:Lcom/vk/imageloader/view/VKImageView;

    invoke-static {v1}, Lcom/vk/imageloader/view/VKImageView;->access$000(Lcom/vk/imageloader/view/VKImageView;)I

    move-result v1

    iget-object v2, p0, Lcom/vk/imageloader/view/VKImageView$1;->this$0:Lcom/vk/imageloader/view/VKImageView;

    invoke-static {v2}, Lcom/vk/imageloader/view/VKImageView;->access$100(Lcom/vk/imageloader/view/VKImageView;)I

    move-result v2

    invoke-interface {v0, v1, v2}, Lcom/vk/imageloader/OnLoadCallback;->onSuccess(II)V

    .line 230
    :cond_0
    return-void
.end method

.method public bridge synthetic onFinalImageSet(Ljava/lang/String;Ljava/lang/Object;Landroid/graphics/drawable/Animatable;)V
    .locals 0

    .prologue
    .line 221
    check-cast p2, Lcom/facebook/imagepipeline/image/ImageInfo;

    invoke-virtual {p0, p1, p2, p3}, Lcom/vk/imageloader/view/VKImageView$1;->onFinalImageSet(Ljava/lang/String;Lcom/facebook/imagepipeline/image/ImageInfo;Landroid/graphics/drawable/Animatable;)V

    return-void
.end method
