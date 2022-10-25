.class Lcom/vkontakte/android/AudioMessagePlayerService$DownloadRunnable;
.super Ljava/lang/Object;
.source "AudioMessagePlayerService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/AudioMessagePlayerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DownloadRunnable"
.end annotation


# instance fields
.field private final audioMessageUrl:Ljava/lang/String;

.field private final did:I

.field private final oid:I

.field private final outputFile:Ljava/io/File;

.field final synthetic this$0:Lcom/vkontakte/android/AudioMessagePlayerService;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/AudioMessagePlayerService;Ljava/lang/String;Ljava/io/File;II)V
    .locals 0
    .param p2, "audioMessageUrl"    # Ljava/lang/String;
    .param p3, "outputFile"    # Ljava/io/File;
    .param p4, "oid"    # I
    .param p5, "did"    # I

    .prologue
    .line 629
    iput-object p1, p0, Lcom/vkontakte/android/AudioMessagePlayerService$DownloadRunnable;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 630
    iput-object p2, p0, Lcom/vkontakte/android/AudioMessagePlayerService$DownloadRunnable;->audioMessageUrl:Ljava/lang/String;

    .line 631
    iput-object p3, p0, Lcom/vkontakte/android/AudioMessagePlayerService$DownloadRunnable;->outputFile:Ljava/io/File;

    .line 632
    iput p4, p0, Lcom/vkontakte/android/AudioMessagePlayerService$DownloadRunnable;->oid:I

    .line 633
    iput p5, p0, Lcom/vkontakte/android/AudioMessagePlayerService$DownloadRunnable;->did:I

    .line 634
    return-void
.end method


# virtual methods
.method public run()V
    .locals 13

    .prologue
    .line 640
    :try_start_0
    iget-object v10, p0, Lcom/vkontakte/android/AudioMessagePlayerService$DownloadRunnable;->audioMessageUrl:Ljava/lang/String;

    invoke-static {v10}, Landroid/webkit/URLUtil;->isNetworkUrl(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_2

    .line 641
    new-instance v9, Ljava/net/URL;

    iget-object v10, p0, Lcom/vkontakte/android/AudioMessagePlayerService$DownloadRunnable;->audioMessageUrl:Ljava/lang/String;

    invoke-direct {v9, v10}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 642
    .local v9, "url":Ljava/net/URL;
    invoke-virtual {v9}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    .line 643
    .local v1, "connection":Ljava/net/URLConnection;
    invoke-virtual {v1}, Ljava/net/URLConnection;->connect()V

    .line 644
    new-instance v6, Ljava/io/BufferedInputStream;

    invoke-virtual {v1}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v10

    invoke-direct {v6, v10}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 652
    .end local v1    # "connection":Ljava/net/URLConnection;
    .end local v9    # "url":Ljava/net/URL;
    .local v6, "input":Ljava/io/InputStream;
    :goto_0
    iget-object v10, p0, Lcom/vkontakte/android/AudioMessagePlayerService$DownloadRunnable;->outputFile:Ljava/io/File;

    invoke-virtual {v10}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v4

    .line 653
    .local v4, "dir":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v10

    if-nez v10, :cond_0

    .line 654
    invoke-virtual {v4}, Ljava/io/File;->mkdirs()Z

    .line 657
    :cond_0
    new-instance v7, Ljava/io/FileOutputStream;

    iget-object v10, p0, Lcom/vkontakte/android/AudioMessagePlayerService$DownloadRunnable;->outputFile:Ljava/io/File;

    const/4 v11, 0x0

    invoke-direct {v7, v10, v11}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    .line 659
    .local v7, "output":Ljava/io/OutputStream;
    const/16 v10, 0x2000

    new-array v3, v10, [B

    .line 661
    .local v3, "data":[B
    :goto_1
    invoke-virtual {v6, v3}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .local v2, "count":I
    const/4 v10, -0x1

    if-eq v2, v10, :cond_3

    .line 662
    const/4 v10, 0x0

    invoke-virtual {v7, v3, v10, v2}, Ljava/io/OutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 672
    .end local v2    # "count":I
    .end local v3    # "data":[B
    .end local v4    # "dir":Ljava/io/File;
    .end local v6    # "input":Ljava/io/InputStream;
    .end local v7    # "output":Ljava/io/OutputStream;
    :catch_0
    move-exception v5

    .line 673
    .local v5, "e":Ljava/io/IOException;
    const-string/jumbo v10, "AudioMessagePlayerService"

    const-string/jumbo v11, "Download file error"

    invoke-static {v10, v11, v5}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 674
    iget-object v10, p0, Lcom/vkontakte/android/AudioMessagePlayerService$DownloadRunnable;->outputFile:Ljava/io/File;

    invoke-virtual {v10}, Ljava/io/File;->delete()Z

    .line 675
    iget-object v10, p0, Lcom/vkontakte/android/AudioMessagePlayerService$DownloadRunnable;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-virtual {v10}, Lcom/vkontakte/android/AudioMessagePlayerService;->getApplicationContext()Landroid/content/Context;

    move-result-object v10

    invoke-static {v10}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$2700(Landroid/content/Context;)V

    .line 676
    iget-object v10, p0, Lcom/vkontakte/android/AudioMessagePlayerService$DownloadRunnable;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v10}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$500(Lcom/vkontakte/android/AudioMessagePlayerService;)V

    .line 678
    .end local v5    # "e":Ljava/io/IOException;
    :cond_1
    :goto_2
    return-void

    .line 646
    :cond_2
    :try_start_1
    invoke-static {}, Lcom/vk/core/network/Network;->getDefaultClient()Lokhttp3/OkHttpClient;

    move-result-object v10

    new-instance v11, Lokhttp3/Request$Builder;

    invoke-direct {v11}, Lokhttp3/Request$Builder;-><init>()V

    iget-object v12, p0, Lcom/vkontakte/android/AudioMessagePlayerService$DownloadRunnable;->audioMessageUrl:Ljava/lang/String;

    .line 647
    invoke-virtual {v11, v12}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v11

    invoke-virtual {v11}, Lokhttp3/Request$Builder;->get()Lokhttp3/Request$Builder;

    move-result-object v11

    invoke-virtual {v11}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v11

    .line 646
    invoke-virtual {v10, v11}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v10

    .line 647
    invoke-interface {v10}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v8

    .line 648
    .local v8, "response":Lokhttp3/Response;
    invoke-virtual {v8}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v0

    .line 649
    .local v0, "body":Lokhttp3/ResponseBody;
    invoke-virtual {v0}, Lokhttp3/ResponseBody;->byteStream()Ljava/io/InputStream;

    move-result-object v6

    .restart local v6    # "input":Ljava/io/InputStream;
    goto :goto_0

    .line 665
    .end local v0    # "body":Lokhttp3/ResponseBody;
    .end local v8    # "response":Lokhttp3/Response;
    .restart local v2    # "count":I
    .restart local v3    # "data":[B
    .restart local v4    # "dir":Ljava/io/File;
    .restart local v7    # "output":Ljava/io/OutputStream;
    :cond_3
    invoke-virtual {v7}, Ljava/io/OutputStream;->flush()V

    .line 666
    invoke-virtual {v7}, Ljava/io/OutputStream;->close()V

    .line 667
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V

    .line 669
    iget-object v10, p0, Lcom/vkontakte/android/AudioMessagePlayerService$DownloadRunnable;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v10}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$2400(Lcom/vkontakte/android/AudioMessagePlayerService;)I

    move-result v10

    iget v11, p0, Lcom/vkontakte/android/AudioMessagePlayerService$DownloadRunnable;->oid:I

    if-ne v10, v11, :cond_1

    iget-object v10, p0, Lcom/vkontakte/android/AudioMessagePlayerService$DownloadRunnable;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v10}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$2500(Lcom/vkontakte/android/AudioMessagePlayerService;)I

    move-result v10

    iget v11, p0, Lcom/vkontakte/android/AudioMessagePlayerService$DownloadRunnable;->did:I

    if-ne v10, v11, :cond_1

    .line 670
    iget-object v10, p0, Lcom/vkontakte/android/AudioMessagePlayerService$DownloadRunnable;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    iget-object v11, p0, Lcom/vkontakte/android/AudioMessagePlayerService$DownloadRunnable;->outputFile:Ljava/io/File;

    invoke-static {v10, v11}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$2600(Lcom/vkontakte/android/AudioMessagePlayerService;Ljava/io/File;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2
.end method
