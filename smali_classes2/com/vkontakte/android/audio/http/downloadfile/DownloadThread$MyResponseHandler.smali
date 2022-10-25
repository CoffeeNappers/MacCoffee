.class Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$MyResponseHandler;
.super Ljava/lang/Object;
.source "DownloadThread.java"

# interfaces
.implements Lcom/vkontakte/android/audio/http/HttpResponseHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyResponseHandler"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/audio/http/HttpResponseHandler",
        "<",
        "Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$Result;",
        ">;"
    }
.end annotation


# instance fields
.field private final mTempFile:Ljava/io/File;

.field final synthetic this$0:Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;Ljava/io/File;)V
    .locals 0
    .param p2, "tempFile"    # Ljava/io/File;

    .prologue
    .line 188
    iput-object p1, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$MyResponseHandler;->this$0:Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 189
    iput-object p2, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$MyResponseHandler;->mTempFile:Ljava/io/File;

    .line 190
    return-void
.end method


# virtual methods
.method public handleResponse(Landroid/content/Context;Lokhttp3/Response;)Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$Result;
    .locals 13
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "response"    # Lokhttp3/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 194
    invoke-virtual {p2}, Lokhttp3/Response;->code()I

    move-result v7

    .line 195
    .local v7, "statusCode":I
    const/16 v10, 0xc8

    if-lt v7, v10, :cond_0

    const/16 v10, 0x12c

    if-lt v7, v10, :cond_2

    .line 196
    :cond_0
    iget-object v10, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$MyResponseHandler;->this$0:Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;

    invoke-static {v10}, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->access$000(Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;)Z

    move-result v10

    if-eqz v10, :cond_1

    const/16 v10, 0x130

    if-eq v7, v10, :cond_2

    .line 197
    :cond_1
    new-instance v10, Lcom/vkontakte/android/audio/http/ResponseException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "Invalid status code: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11, v7}, Lcom/vkontakte/android/audio/http/ResponseException;-><init>(Ljava/lang/String;I)V

    throw v10

    .line 200
    :cond_2
    const-wide/16 v4, 0x0

    .line 201
    .local v4, "lastModified":J
    invoke-virtual {p2}, Lokhttp3/Response;->headers()Lokhttp3/Headers;

    move-result-object v10

    const-string/jumbo v11, "Last-Modified"

    invoke-virtual {v10, v11}, Lokhttp3/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 202
    .local v1, "header":Ljava/lang/String;
    if-eqz v1, :cond_3

    .line 204
    :try_start_0
    invoke-static {v1}, Lcom/vkontakte/android/audio/net/HttpUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v10

    invoke-virtual {v10}, Ljava/util/Date;->getTime()J
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v4

    .line 210
    :cond_3
    :goto_0
    const/16 v10, 0x130

    if-ne v7, v10, :cond_4

    .line 211
    new-instance v10, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$Result;

    const/4 v11, 0x1

    const/4 v12, 0x0

    invoke-direct {v10, v11, v4, v5, v12}, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$Result;-><init>(ZJLcom/vkontakte/android/audio/http/downloadfile/DownloadThread$1;)V

    .line 249
    :goto_1
    return-object v10

    .line 205
    :catch_0
    move-exception v0

    .line 206
    .local v0, "e":Ljava/text/ParseException;
    invoke-virtual {v0}, Ljava/text/ParseException;->printStackTrace()V

    goto :goto_0

    .line 213
    .end local v0    # "e":Ljava/text/ParseException;
    :cond_4
    iget-object v10, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$MyResponseHandler;->this$0:Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;

    invoke-static {v10}, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->access$200(Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 214
    const/4 v10, 0x0

    goto :goto_1

    .line 216
    :cond_5
    invoke-virtual {p2}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v10

    invoke-virtual {v10}, Lokhttp3/ResponseBody;->contentLength()J

    move-result-wide v8

    .line 217
    .local v8, "totalCount":J
    invoke-virtual {p2}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v10

    invoke-virtual {v10}, Lokhttp3/ResponseBody;->byteStream()Ljava/io/InputStream;

    move-result-object v2

    .line 219
    .local v2, "input":Ljava/io/InputStream;
    :try_start_1
    new-instance v6, Ljava/io/FileOutputStream;

    iget-object v10, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$MyResponseHandler;->mTempFile:Ljava/io/File;

    invoke-direct {v6, v10}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 221
    .local v6, "output":Ljava/io/OutputStream;
    :try_start_2
    new-instance v3, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$MyResponseHandler$1;

    invoke-direct {v3, p0, v8, v9}, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$MyResponseHandler$1;-><init>(Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$MyResponseHandler;J)V

    .line 236
    .local v3, "listener":Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileConverterListener;
    iget-object v10, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$MyResponseHandler;->this$0:Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;

    invoke-static {v10}, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->access$400(Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;)Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileConverter;

    move-result-object v10

    invoke-interface {v10, v2, v6, v3}, Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileConverter;->convert(Ljava/io/InputStream;Ljava/io/OutputStream;Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileConverterListener;)V

    .line 238
    iget-object v10, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$MyResponseHandler;->this$0:Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;

    invoke-static {v10}, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->access$200(Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v10

    if-eqz v10, :cond_6

    .line 239
    const/4 v10, 0x0

    .line 243
    :try_start_3
    invoke-static {v6}, Lcom/vkontakte/android/audio/utils/Utils;->closeCloseable(Ljava/io/Closeable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 246
    invoke-static {v2}, Lcom/vkontakte/android/audio/utils/Utils;->closeCloseable(Ljava/io/Closeable;)V

    goto :goto_1

    .line 241
    :cond_6
    :try_start_4
    invoke-virtual {v6}, Ljava/io/OutputStream;->flush()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 243
    :try_start_5
    invoke-static {v6}, Lcom/vkontakte/android/audio/utils/Utils;->closeCloseable(Ljava/io/Closeable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 246
    invoke-static {v2}, Lcom/vkontakte/android/audio/utils/Utils;->closeCloseable(Ljava/io/Closeable;)V

    .line 249
    iget-object v10, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$MyResponseHandler;->this$0:Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;

    invoke-static {v10}, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->access$200(Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;)Z

    move-result v10

    if-eqz v10, :cond_7

    const/4 v10, 0x0

    goto :goto_1

    .line 243
    .end local v3    # "listener":Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileConverterListener;
    :catchall_0
    move-exception v10

    :try_start_6
    invoke-static {v6}, Lcom/vkontakte/android/audio/utils/Utils;->closeCloseable(Ljava/io/Closeable;)V

    throw v10
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 246
    .end local v6    # "output":Ljava/io/OutputStream;
    :catchall_1
    move-exception v10

    invoke-static {v2}, Lcom/vkontakte/android/audio/utils/Utils;->closeCloseable(Ljava/io/Closeable;)V

    throw v10

    .line 249
    .restart local v3    # "listener":Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileConverterListener;
    .restart local v6    # "output":Ljava/io/OutputStream;
    :cond_7
    new-instance v10, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$Result;

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-direct {v10, v11, v4, v5, v12}, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$Result;-><init>(ZJLcom/vkontakte/android/audio/http/downloadfile/DownloadThread$1;)V

    goto :goto_1
.end method

.method public bridge synthetic handleResponse(Landroid/content/Context;Lokhttp3/Response;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 185
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$MyResponseHandler;->handleResponse(Landroid/content/Context;Lokhttp3/Response;)Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$Result;

    move-result-object v0

    return-object v0
.end method
