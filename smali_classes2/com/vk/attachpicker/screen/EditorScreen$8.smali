.class Lcom/vk/attachpicker/screen/EditorScreen$8;
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
        "Ljava/io/File;",
        ">;"
    }
.end annotation


# instance fields
.field progressDialog:Landroid/app/Dialog;

.field final synthetic this$0:Lcom/vk/attachpicker/screen/EditorScreen;

.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$bitmapRenderer:Lcom/vkontakte/android/functions/F0;

.field final synthetic val$isDefault:Z


# direct methods
.method constructor <init>(Lcom/vk/attachpicker/screen/EditorScreen;Landroid/app/Activity;Lcom/vkontakte/android/functions/F0;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/attachpicker/screen/EditorScreen;

    .prologue
    .line 642
    iput-object p1, p0, Lcom/vk/attachpicker/screen/EditorScreen$8;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    iput-object p2, p0, Lcom/vk/attachpicker/screen/EditorScreen$8;->val$activity:Landroid/app/Activity;

    iput-object p3, p0, Lcom/vk/attachpicker/screen/EditorScreen$8;->val$bitmapRenderer:Lcom/vkontakte/android/functions/F0;

    iput-boolean p4, p0, Lcom/vk/attachpicker/screen/EditorScreen$8;->val$isDefault:Z

    invoke-direct {p0}, Lcom/vk/attachpicker/util/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/io/File;
    .locals 12
    .param p1, "args"    # [Ljava/lang/Void;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    const-wide/16 v10, 0x1f4

    .line 655
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 657
    .local v4, "start":J
    iget-object v8, p0, Lcom/vk/attachpicker/screen/EditorScreen$8;->val$bitmapRenderer:Lcom/vkontakte/android/functions/F0;

    invoke-interface {v8}, Lcom/vkontakte/android/functions/F0;->f()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 659
    .local v0, "croppedBitmap":Landroid/graphics/Bitmap;
    invoke-static {}, Lcom/vk/core/util/FileUtils;->getPhotoFile()Ljava/io/File;

    move-result-object v3

    .line 661
    .local v3, "resultFile":Ljava/io/File;
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 663
    .local v2, "fos":Ljava/io/FileOutputStream;
    :try_start_0
    sget-object v8, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v9, 0x56

    invoke-virtual {v0, v8, v9, v2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 670
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 672
    .local v6, "stop":J
    sub-long v8, v6, v4

    cmp-long v8, v8, v10

    if-gez v8, :cond_0

    .line 673
    sub-long v8, v10, v6

    add-long/2addr v8, v4

    invoke-static {v8, v9}, Ljava/lang/Thread;->sleep(J)V

    .line 676
    :cond_0
    return-object v3

    .line 664
    .end local v6    # "stop":J
    :catch_0
    move-exception v1

    .line 665
    .local v1, "e":Ljava/lang/Exception;
    invoke-static {v2}, Lcom/vk/attachpicker/util/Utils;->closeSilently(Ljava/io/OutputStream;)V

    .line 666
    const/4 v3, 0x0

    .line 667
    const/4 v8, 0x0

    new-array v8, v8, [Ljava/lang/Object;

    invoke-static {v1, v8}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 642
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/vk/attachpicker/screen/EditorScreen$8;->doInBackground([Ljava/lang/Void;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Ljava/io/File;)V
    .locals 3
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 681
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$8;->progressDialog:Landroid/app/Dialog;

    invoke-static {v0}, Lcom/vk/attachpicker/widget/LoadingDialog;->dismissLoadingDialog(Landroid/app/Dialog;)V

    .line 682
    if-eqz p1, :cond_1

    .line 685
    iget-boolean v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$8;->val$isDefault:Z

    if-nez v0, :cond_0

    invoke-static {}, Lcom/vk/attachpicker/Picker;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string/jumbo v1, "saveProcessedImage"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 686
    invoke-static {}, Lcom/vk/attachpicker/Picker;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Lcom/vk/attachpicker/util/CameraUtils;->addMediaToGallery(Landroid/content/Context;Ljava/io/File;Landroid/media/MediaScannerConnection$OnScanCompletedListener;)V

    .line 688
    :cond_0
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$8;->val$activity:Landroid/app/Activity;

    check-cast v0, Lcom/vk/attachpicker/AttachResulter;

    invoke-static {p1}, Lcom/vk/attachpicker/SelectionContext;->packSinglePhoto(Ljava/io/File;)Landroid/content/Intent;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/vk/attachpicker/AttachResulter;->setResultAndFinish(Landroid/content/Intent;)V

    .line 692
    :goto_0
    return-void

    .line 690
    :cond_1
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$8;->val$activity:Landroid/app/Activity;

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
    .line 642
    check-cast p1, Ljava/io/File;

    invoke-virtual {p0, p1}, Lcom/vk/attachpicker/screen/EditorScreen$8;->onPostExecute(Ljava/io/File;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 2

    .prologue
    .line 649
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$8;->val$activity:Landroid/app/Activity;

    const v1, 0x7f0804de

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/attachpicker/widget/LoadingDialog;->getInstance(Landroid/content/Context;Ljava/lang/Integer;)Landroid/app/ProgressDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$8;->progressDialog:Landroid/app/Dialog;

    .line 650
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$8;->progressDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 651
    return-void
.end method
