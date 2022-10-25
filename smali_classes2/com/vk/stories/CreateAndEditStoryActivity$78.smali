.class Lcom/vk/stories/CreateAndEditStoryActivity$78;
.super Landroid/os/AsyncTask;
.source "CreateAndEditStoryActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->onReady([B)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

.field final synthetic val$jpegData:[B


# direct methods
.method constructor <init>(Lcom/vk/stories/CreateAndEditStoryActivity;[B)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 2294
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$78;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    iput-object p2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$78;->val$jpegData:[B

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Landroid/graphics/Bitmap;
    .locals 4
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 2298
    :try_start_0
    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$78;->val$jpegData:[B

    invoke-static {}, Lcom/vk/camera/camera1/CameraHolder;->instance()Lcom/vk/camera/camera1/CameraHolder;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vk/camera/camera1/CameraHolder;->currentCameraFrontal()Z

    move-result v3

    invoke-static {v2, v3}, Lcom/vk/attachpicker/util/BitmapUtils;->processCameraBitmap([BZ)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 2304
    :goto_0
    return-object v2

    .line 2299
    :catch_0
    move-exception v0

    .line 2300
    .local v0, "t":Ljava/lang/Throwable;
    sget-object v2, Lcom/vk/core/util/GcTrigger;->DEFAULT:Lcom/vk/core/util/GcTrigger;

    invoke-interface {v2}, Lcom/vk/core/util/GcTrigger;->runGc()V

    .line 2302
    :try_start_1
    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$78;->val$jpegData:[B

    invoke-static {}, Lcom/vk/camera/camera1/CameraHolder;->instance()Lcom/vk/camera/camera1/CameraHolder;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vk/camera/camera1/CameraHolder;->currentCameraFrontal()Z

    move-result v3

    invoke-static {v2, v3}, Lcom/vk/attachpicker/util/BitmapUtils;->processCameraBitmap([BZ)Landroid/graphics/Bitmap;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v2

    goto :goto_0

    .line 2303
    :catch_1
    move-exception v1

    .line 2304
    .local v1, "t1":Ljava/lang/Throwable;
    const/4 v2, 0x0

    goto :goto_0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 2294
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity$78;->doInBackground([Ljava/lang/Void;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Landroid/graphics/Bitmap;)V
    .locals 2
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 2311
    if-eqz p1, :cond_0

    .line 2312
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$78;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$900(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 2313
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$78;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$8600(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 2315
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$78;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$1102(Lcom/vk/stories/CreateAndEditStoryActivity;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 2316
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$78;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$8700(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 2317
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$78;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$8800(Lcom/vk/stories/CreateAndEditStoryActivity;Z)V

    .line 2319
    :cond_0
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 2294
    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity$78;->onPostExecute(Landroid/graphics/Bitmap;)V

    return-void
.end method
