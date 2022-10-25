.class final Lcom/vk/imageloader/VKImageLoader$4;
.super Ljava/lang/Object;
.source "VKImageLoader.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/imageloader/VKImageLoader;->getBitmap(Landroid/net/Uri;IIILcom/vk/imageloader/VKImageRequestWrapper;Lcom/vk/imageloader/VKImageRequestProgress;Lcom/facebook/imagepipeline/request/Postprocessor;)Lio/reactivex/Observable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$height:I

.field final synthetic val$postprocessor:Lcom/facebook/imagepipeline/request/Postprocessor;

.field final synthetic val$requestProgress:Lcom/vk/imageloader/VKImageRequestProgress;

.field final synthetic val$rotation:I

.field final synthetic val$uri:Landroid/net/Uri;

.field final synthetic val$width:I

.field final synthetic val$wrapper:Lcom/vk/imageloader/VKImageRequestWrapper;


# direct methods
.method constructor <init>(Landroid/net/Uri;IIILcom/vk/imageloader/VKImageRequestWrapper;Lcom/vk/imageloader/VKImageRequestProgress;Lcom/facebook/imagepipeline/request/Postprocessor;)V
    .locals 0

    .prologue
    .line 226
    iput-object p1, p0, Lcom/vk/imageloader/VKImageLoader$4;->val$uri:Landroid/net/Uri;

    iput p2, p0, Lcom/vk/imageloader/VKImageLoader$4;->val$width:I

    iput p3, p0, Lcom/vk/imageloader/VKImageLoader$4;->val$height:I

    iput p4, p0, Lcom/vk/imageloader/VKImageLoader$4;->val$rotation:I

    iput-object p5, p0, Lcom/vk/imageloader/VKImageLoader$4;->val$wrapper:Lcom/vk/imageloader/VKImageRequestWrapper;

    iput-object p6, p0, Lcom/vk/imageloader/VKImageLoader$4;->val$requestProgress:Lcom/vk/imageloader/VKImageRequestProgress;

    iput-object p7, p0, Lcom/vk/imageloader/VKImageLoader$4;->val$postprocessor:Lcom/facebook/imagepipeline/request/Postprocessor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()Landroid/graphics/Bitmap;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 229
    iget-object v0, p0, Lcom/vk/imageloader/VKImageLoader$4;->val$uri:Landroid/net/Uri;

    iget v1, p0, Lcom/vk/imageloader/VKImageLoader$4;->val$width:I

    iget v2, p0, Lcom/vk/imageloader/VKImageLoader$4;->val$height:I

    iget v3, p0, Lcom/vk/imageloader/VKImageLoader$4;->val$rotation:I

    iget-object v4, p0, Lcom/vk/imageloader/VKImageLoader$4;->val$wrapper:Lcom/vk/imageloader/VKImageRequestWrapper;

    iget-object v5, p0, Lcom/vk/imageloader/VKImageLoader$4;->val$requestProgress:Lcom/vk/imageloader/VKImageRequestProgress;

    iget-object v6, p0, Lcom/vk/imageloader/VKImageLoader$4;->val$postprocessor:Lcom/facebook/imagepipeline/request/Postprocessor;

    invoke-static/range {v0 .. v6}, Lcom/vk/imageloader/VKImageLoader;->access$000(Landroid/net/Uri;IIILcom/vk/imageloader/VKImageRequestWrapper;Lcom/vk/imageloader/VKImageRequestProgress;Lcom/facebook/imagepipeline/request/Postprocessor;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 226
    invoke-virtual {p0}, Lcom/vk/imageloader/VKImageLoader$4;->call()Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method
