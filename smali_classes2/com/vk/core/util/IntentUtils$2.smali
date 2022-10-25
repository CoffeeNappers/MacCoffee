.class final Lcom/vk/core/util/IntentUtils$2;
.super Lcom/vk/attachpicker/util/AsyncTask;
.source "IntentUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/core/util/IntentUtils;->downloadUri(Landroid/app/Activity;Landroid/net/Uri;Lcom/vk/core/util/IntentUtils$ResolveCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vk/attachpicker/util/AsyncTask",
        "<",
        "Landroid/net/Uri;",
        "Ljava/lang/Float;",
        "Ljava/io/File;",
        ">;"
    }
.end annotation


# instance fields
.field private dialog:Landroid/app/ProgressDialog;

.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$resolveCallback:Lcom/vk/core/util/IntentUtils$ResolveCallback;

.field final synthetic val$selectedUri:Landroid/net/Uri;


# direct methods
.method constructor <init>(Landroid/app/Activity;Lcom/vk/core/util/IntentUtils$ResolveCallback;Landroid/net/Uri;)V
    .locals 0

    .prologue
    .line 233
    iput-object p1, p0, Lcom/vk/core/util/IntentUtils$2;->val$activity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/vk/core/util/IntentUtils$2;->val$resolveCallback:Lcom/vk/core/util/IntentUtils$ResolveCallback;

    iput-object p3, p0, Lcom/vk/core/util/IntentUtils$2;->val$selectedUri:Landroid/net/Uri;

    invoke-direct {p0}, Lcom/vk/attachpicker/util/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Landroid/net/Uri;)Ljava/io/File;
    .locals 14
    .param p1, "args"    # [Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 258
    invoke-static {}, Lcom/vk/core/util/FileUtils;->getTempFile()Ljava/io/File;

    move-result-object v3

    .line 259
    .local v3, "file":Ljava/io/File;
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 260
    .local v4, "fout":Ljava/io/FileOutputStream;
    const/4 v6, 0x0

    .line 263
    .local v6, "in":Ljava/io/InputStream;
    :try_start_0
    iget-object v9, p0, Lcom/vk/core/util/IntentUtils$2;->val$activity:Landroid/app/Activity;

    invoke-virtual {v9}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v9

    iget-object v10, p0, Lcom/vk/core/util/IntentUtils$2;->val$selectedUri:Landroid/net/Uri;

    invoke-virtual {v9, v10}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v6

    .line 265
    const/16 v9, 0x400

    new-array v1, v9, [B

    .line 267
    .local v1, "data":[B
    :goto_0
    const/4 v9, 0x0

    const/16 v10, 0x400

    invoke-virtual {v6, v1, v9, v10}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .local v0, "count":I
    const/4 v9, -0x1

    if-eq v0, v9, :cond_0

    .line 268
    invoke-virtual {p0}, Lcom/vk/core/util/IntentUtils$2;->isCanceled()Z

    move-result v9

    if-eqz v9, :cond_5

    .line 274
    :cond_0
    invoke-static {v3}, Lcom/vk/core/util/IntentUtils;->access$000(Ljava/io/File;)Ljava/lang/String;

    move-result-object v5

    .line 275
    .local v5, "imageMimeType":Ljava/lang/String;
    invoke-static {v3}, Lcom/vk/core/util/IntentUtils;->access$100(Ljava/io/File;)Ljava/lang/String;

    move-result-object v8

    .line 276
    .local v8, "videoMimeType":Ljava/lang/String;
    if-nez v5, :cond_1

    if-eqz v8, :cond_2

    :cond_1
    const/4 v7, 0x1

    .line 278
    .local v7, "success":Z
    :cond_2
    if-eqz v5, :cond_7

    .line 279
    invoke-static {v3, v5}, Lcom/vk/core/util/IntentUtils;->access$200(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v3

    .line 289
    :goto_1
    if-eqz v6, :cond_3

    .line 291
    :try_start_1
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    .line 296
    :cond_3
    :goto_2
    if-eqz v4, :cond_4

    .line 298
    :try_start_2
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    .line 307
    .end local v0    # "count":I
    .end local v1    # "data":[B
    .end local v5    # "imageMimeType":Ljava/lang/String;
    .end local v8    # "videoMimeType":Ljava/lang/String;
    :cond_4
    :goto_3
    if-eqz v7, :cond_b

    if-eqz v3, :cond_b

    invoke-virtual {v3}, Ljava/io/File;->length()J

    move-result-wide v10

    const-wide/16 v12, 0x0

    cmp-long v9, v10, v12

    if-lez v9, :cond_b

    .line 310
    .end local v3    # "file":Ljava/io/File;
    :goto_4
    return-object v3

    .line 271
    .end local v7    # "success":Z
    .restart local v0    # "count":I
    .restart local v1    # "data":[B
    .restart local v3    # "file":Ljava/io/File;
    :cond_5
    const/4 v9, 0x0

    :try_start_3
    invoke-virtual {v4, v1, v9, v0}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 285
    .end local v0    # "count":I
    .end local v1    # "data":[B
    :catch_0
    move-exception v2

    .line 286
    .local v2, "e":Ljava/lang/Throwable;
    :try_start_4
    invoke-static {v3}, Lcom/vk/core/util/FileUtils;->deleteFile(Ljava/io/File;)Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 287
    const/4 v7, 0x0

    .line 289
    .restart local v7    # "success":Z
    if-eqz v6, :cond_6

    .line 291
    :try_start_5
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4

    .line 296
    :cond_6
    :goto_5
    if-eqz v4, :cond_4

    .line 298
    :try_start_6
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1

    goto :goto_3

    .line 299
    :catch_1
    move-exception v9

    goto :goto_3

    .line 280
    .end local v2    # "e":Ljava/lang/Throwable;
    .restart local v0    # "count":I
    .restart local v1    # "data":[B
    .restart local v5    # "imageMimeType":Ljava/lang/String;
    .restart local v8    # "videoMimeType":Ljava/lang/String;
    :cond_7
    if-eqz v8, :cond_8

    .line 281
    :try_start_7
    invoke-static {v3, v8}, Lcom/vk/core/util/IntentUtils;->access$200(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    goto :goto_1

    .line 283
    :cond_8
    new-instance v9, Ljava/io/IOException;

    const-string/jumbo v10, "Not an media"

    invoke-direct {v9, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v9
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 289
    .end local v0    # "count":I
    .end local v1    # "data":[B
    .end local v5    # "imageMimeType":Ljava/lang/String;
    .end local v7    # "success":Z
    .end local v8    # "videoMimeType":Ljava/lang/String;
    :catchall_0
    move-exception v9

    if-eqz v6, :cond_9

    .line 291
    :try_start_8
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_5

    .line 296
    :cond_9
    :goto_6
    if-eqz v4, :cond_a

    .line 298
    :try_start_9
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_6

    .line 301
    :cond_a
    :goto_7
    throw v9

    .line 310
    .restart local v7    # "success":Z
    :cond_b
    const/4 v3, 0x0

    goto :goto_4

    .line 292
    .restart local v0    # "count":I
    .restart local v1    # "data":[B
    .restart local v5    # "imageMimeType":Ljava/lang/String;
    .restart local v8    # "videoMimeType":Ljava/lang/String;
    :catch_2
    move-exception v9

    goto :goto_2

    .line 299
    :catch_3
    move-exception v9

    goto :goto_3

    .line 292
    .end local v0    # "count":I
    .end local v1    # "data":[B
    .end local v5    # "imageMimeType":Ljava/lang/String;
    .end local v8    # "videoMimeType":Ljava/lang/String;
    .restart local v2    # "e":Ljava/lang/Throwable;
    :catch_4
    move-exception v9

    goto :goto_5

    .end local v2    # "e":Ljava/lang/Throwable;
    .end local v7    # "success":Z
    :catch_5
    move-exception v10

    goto :goto_6

    .line 299
    :catch_6
    move-exception v10

    goto :goto_7
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 233
    check-cast p1, [Landroid/net/Uri;

    invoke-virtual {p0, p1}, Lcom/vk/core/util/IntentUtils$2;->doInBackground([Landroid/net/Uri;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method synthetic lambda$onPreExecute$0(Landroid/content/DialogInterface;)V
    .locals 0
    .param p1, "dialog1"    # Landroid/content/DialogInterface;

    .prologue
    .line 240
    invoke-virtual {p0}, Lcom/vk/core/util/IntentUtils$2;->cancel()V

    return-void
.end method

.method protected onPostExecute(Ljava/io/File;)V
    .locals 1
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 246
    iget-object v0, p0, Lcom/vk/core/util/IntentUtils$2;->dialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 248
    if-eqz p1, :cond_0

    .line 249
    iget-object v0, p0, Lcom/vk/core/util/IntentUtils$2;->val$resolveCallback:Lcom/vk/core/util/IntentUtils$ResolveCallback;

    invoke-interface {v0, p1}, Lcom/vk/core/util/IntentUtils$ResolveCallback;->onResolved(Ljava/io/File;)V

    .line 253
    :goto_0
    return-void

    .line 251
    :cond_0
    iget-object v0, p0, Lcom/vk/core/util/IntentUtils$2;->val$resolveCallback:Lcom/vk/core/util/IntentUtils$ResolveCallback;

    invoke-interface {v0}, Lcom/vk/core/util/IntentUtils$ResolveCallback;->onError()V

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 233
    check-cast p1, Ljava/io/File;

    invoke-virtual {p0, p1}, Lcom/vk/core/util/IntentUtils$2;->onPostExecute(Ljava/io/File;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 2

    .prologue
    .line 239
    iget-object v0, p0, Lcom/vk/core/util/IntentUtils$2;->val$activity:Landroid/app/Activity;

    const v1, 0x7f0804d1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/attachpicker/widget/LoadingDialog;->getInstance(Landroid/content/Context;Ljava/lang/Integer;)Landroid/app/ProgressDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/core/util/IntentUtils$2;->dialog:Landroid/app/ProgressDialog;

    .line 240
    iget-object v0, p0, Lcom/vk/core/util/IntentUtils$2;->dialog:Landroid/app/ProgressDialog;

    invoke-static {p0}, Lcom/vk/core/util/IntentUtils$2$$Lambda$1;->lambdaFactory$(Lcom/vk/core/util/IntentUtils$2;)Landroid/content/DialogInterface$OnCancelListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 241
    iget-object v0, p0, Lcom/vk/core/util/IntentUtils$2;->dialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 242
    return-void
.end method
