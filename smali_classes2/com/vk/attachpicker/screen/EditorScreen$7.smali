.class Lcom/vk/attachpicker/screen/EditorScreen$7;
.super Lcom/vk/attachpicker/util/AsyncTask;
.source "EditorScreen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/attachpicker/screen/EditorScreen;->renderAndFinish(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vk/attachpicker/util/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field progressDialog:Landroid/app/Dialog;

.field final synthetic this$0:Lcom/vk/attachpicker/screen/EditorScreen;

.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$bitmapRenderer:Lcom/vkontakte/android/functions/F0;


# direct methods
.method constructor <init>(Lcom/vk/attachpicker/screen/EditorScreen;Landroid/app/Activity;Lcom/vkontakte/android/functions/F0;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/attachpicker/screen/EditorScreen;

    .prologue
    .line 607
    iput-object p1, p0, Lcom/vk/attachpicker/screen/EditorScreen$7;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    iput-object p2, p0, Lcom/vk/attachpicker/screen/EditorScreen$7;->val$activity:Landroid/app/Activity;

    iput-object p3, p0, Lcom/vk/attachpicker/screen/EditorScreen$7;->val$bitmapRenderer:Lcom/vkontakte/android/functions/F0;

    invoke-direct {p0}, Lcom/vk/attachpicker/util/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Landroid/graphics/Bitmap;
    .locals 10
    .param p1, "args"    # [Ljava/lang/Void;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    const-wide/16 v8, 0x1f4

    .line 620
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 621
    .local v2, "start":J
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen$7;->val$bitmapRenderer:Lcom/vkontakte/android/functions/F0;

    invoke-interface {v1}, Lcom/vkontakte/android/functions/F0;->f()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 622
    .local v0, "croppedBitmap":Landroid/graphics/Bitmap;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 624
    .local v4, "stop":J
    sub-long v6, v4, v2

    cmp-long v1, v6, v8

    if-gez v1, :cond_0

    .line 625
    sub-long v6, v8, v4

    add-long/2addr v6, v2

    invoke-static {v6, v7}, Ljava/lang/Thread;->sleep(J)V

    .line 628
    :cond_0
    return-object v0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 607
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/vk/attachpicker/screen/EditorScreen$7;->doInBackground([Ljava/lang/Void;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Landroid/graphics/Bitmap;)V
    .locals 3
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 633
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$7;->progressDialog:Landroid/app/Dialog;

    invoke-static {v0}, Lcom/vk/attachpicker/widget/LoadingDialog;->dismissLoadingDialog(Landroid/app/Dialog;)V

    .line 634
    if-eqz p1, :cond_0

    .line 635
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$7;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    new-instance v1, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;

    invoke-direct {v1, p1}, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/screen/EditorScreen;->showScreen(Lcom/vk/core/simplescreen/BaseScreen;)V

    .line 639
    :goto_0
    return-void

    .line 637
    :cond_0
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$7;->val$activity:Landroid/app/Activity;

    const v1, 0x7f0804df

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 607
    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/vk/attachpicker/screen/EditorScreen$7;->onPostExecute(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 2

    .prologue
    .line 614
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$7;->val$activity:Landroid/app/Activity;

    const v1, 0x7f0804de

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/attachpicker/widget/LoadingDialog;->getInstance(Landroid/content/Context;Ljava/lang/Integer;)Landroid/app/ProgressDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$7;->progressDialog:Landroid/app/Dialog;

    .line 615
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$7;->progressDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 616
    return-void
.end method
