.class Lcom/vk/attachpicker/screen/TrimScreen$5;
.super Lcom/vk/attachpicker/util/AsyncTask;
.source "TrimScreen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/attachpicker/screen/TrimScreen;->onSaveClicked()V
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
.field private dialog:Landroid/app/Dialog;

.field final synthetic this$0:Lcom/vk/attachpicker/screen/TrimScreen;

.field final synthetic val$a:Landroid/app/Activity;

.field final synthetic val$file:Ljava/io/File;

.field final synthetic val$finalEndPosition:I

.field final synthetic val$finalStartPosition:I


# direct methods
.method constructor <init>(Lcom/vk/attachpicker/screen/TrimScreen;Landroid/app/Activity;Ljava/io/File;II)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/attachpicker/screen/TrimScreen;

    .prologue
    .line 430
    iput-object p1, p0, Lcom/vk/attachpicker/screen/TrimScreen$5;->this$0:Lcom/vk/attachpicker/screen/TrimScreen;

    iput-object p2, p0, Lcom/vk/attachpicker/screen/TrimScreen$5;->val$a:Landroid/app/Activity;

    iput-object p3, p0, Lcom/vk/attachpicker/screen/TrimScreen$5;->val$file:Ljava/io/File;

    iput p4, p0, Lcom/vk/attachpicker/screen/TrimScreen$5;->val$finalStartPosition:I

    iput p5, p0, Lcom/vk/attachpicker/screen/TrimScreen$5;->val$finalEndPosition:I

    invoke-direct {p0}, Lcom/vk/attachpicker/util/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/io/File;
    .locals 7
    .param p1, "args"    # [Ljava/lang/Void;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 443
    invoke-static {}, Lcom/vk/core/util/FileUtils;->getTempTrimVideoFile()Ljava/io/File;

    move-result-object v1

    .line 445
    .local v1, "dst":Ljava/io/File;
    :try_start_0
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen$5;->val$file:Ljava/io/File;

    iget v2, p0, Lcom/vk/attachpicker/screen/TrimScreen$5;->val$finalStartPosition:I

    int-to-long v2, v2

    iget v4, p0, Lcom/vk/attachpicker/screen/TrimScreen$5;->val$finalEndPosition:I

    int-to-long v4, v4

    invoke-static/range {v0 .. v5}, Lcom/vk/attachpicker/videotrim/VideoTrimmer;->trimVideo(Ljava/io/File;Ljava/io/File;JJ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 450
    .end local v1    # "dst":Ljava/io/File;
    :goto_0
    return-object v1

    .line 447
    .restart local v1    # "dst":Ljava/io/File;
    :catch_0
    move-exception v6

    .line 448
    .local v6, "e":Ljava/lang/Exception;
    const-string/jumbo v0, "tmp"

    const-string/jumbo v2, ""

    invoke-static {v0, v2, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 449
    invoke-static {v1}, Lcom/vk/core/util/FileUtils;->deleteFile(Ljava/io/File;)Z

    .line 450
    const/4 v1, 0x0

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
    .line 430
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/vk/attachpicker/screen/TrimScreen$5;->doInBackground([Ljava/lang/Void;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Ljava/io/File;)V
    .locals 3
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 456
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen$5;->dialog:Landroid/app/Dialog;

    invoke-static {v0}, Lcom/vk/attachpicker/widget/LoadingDialog;->dismissLoadingDialog(Landroid/app/Dialog;)V

    .line 457
    if-nez p1, :cond_0

    .line 458
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen$5;->val$a:Landroid/app/Activity;

    const v1, 0x7f0804f2

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 462
    :goto_0
    return-void

    .line 460
    :cond_0
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen$5;->val$a:Landroid/app/Activity;

    check-cast v0, Lcom/vk/attachpicker/AttachResulter;

    invoke-static {p1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1

    invoke-static {v1}, Lcom/vk/attachpicker/SelectionContext;->packSingleVideo(Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/vk/attachpicker/AttachResulter;->setResultAndFinish(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 430
    check-cast p1, Ljava/io/File;

    invoke-virtual {p0, p1}, Lcom/vk/attachpicker/screen/TrimScreen$5;->onPostExecute(Ljava/io/File;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 2

    .prologue
    .line 436
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen$5;->val$a:Landroid/app/Activity;

    const v1, 0x7f0804f3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/attachpicker/widget/LoadingDialog;->getInstance(Landroid/content/Context;Ljava/lang/Integer;)Landroid/app/ProgressDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen$5;->dialog:Landroid/app/Dialog;

    .line 437
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen$5;->dialog:Landroid/app/Dialog;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 438
    iget-object v0, p0, Lcom/vk/attachpicker/screen/TrimScreen$5;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 439
    return-void
.end method
