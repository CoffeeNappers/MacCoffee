.class Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;
.super Ljava/lang/Thread;
.source "DownloadThread.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$MyResponseHandler;,
        Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$Result;
    }
.end annotation


# static fields
.field private static final THREADS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private count:J

.field public exception:Ljava/lang/Exception;

.field public finished:Z

.field private final mCheckLastModified:Z

.field private final mContext:Landroid/content/Context;

.field private final mConverter:Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileConverter;

.field private final mFile:Ljava/io/File;

.field private notModified:Z

.field private progress:I

.field private progressHashCode:I

.field public final request:Lokhttp3/Request;

.field private totalCount:J

.field private waitCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 26
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->THREADS:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;ZLcom/vkontakte/android/audio/http/downloadfile/DownloadFileConverter;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "file"    # Ljava/io/File;
    .param p4, "checkLastModified"    # Z
    .param p5, "converter"    # Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileConverter;

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 43
    if-nez p1, :cond_1

    const/4 v0, 0x0

    :goto_0
    iput-object v0, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->mContext:Landroid/content/Context;

    .line 44
    new-instance v0, Lokhttp3/Request$Builder;

    invoke-direct {v0}, Lokhttp3/Request$Builder;-><init>()V

    invoke-virtual {v0, p2}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Request$Builder;->get()Lokhttp3/Request$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->request:Lokhttp3/Request;

    .line 45
    iput-object p3, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->mFile:Ljava/io/File;

    .line 46
    iput-boolean p4, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->mCheckLastModified:Z

    .line 47
    if-nez p5, :cond_0

    new-instance p5, Lcom/vkontakte/android/audio/http/downloadfile/DefaultDownloadFileConverter;

    .end local p5    # "converter":Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileConverter;
    invoke-direct {p5}, Lcom/vkontakte/android/audio/http/downloadfile/DefaultDownloadFileConverter;-><init>()V

    :cond_0
    iput-object p5, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->mConverter:Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileConverter;

    .line 48
    return-void

    .line 43
    .restart local p5    # "converter":Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileConverter;
    :cond_1
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    goto :goto_0
.end method

.method static synthetic access$000(Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;

    .prologue
    .line 24
    iget-boolean v0, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->mCheckLastModified:Z

    return v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->isCancelled()Z

    move-result v0

    return v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;JJ)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;
    .param p1, "x1"    # J
    .param p3, "x2"    # J

    .prologue
    .line 24
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->notifyProgress(JJ)Z

    move-result v0

    return v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;)Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileConverter;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->mConverter:Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileConverter;

    return-object v0
.end method

.method public static execute(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileListener;Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileConverter;)Z
    .locals 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "file"    # Ljava/io/File;
    .param p3, "listener"    # Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileListener;
    .param p4, "converter"    # Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileConverter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 97
    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    move-object v5, p4

    invoke-static/range {v0 .. v5}, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->execute(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;ZLcom/vkontakte/android/audio/http/downloadfile/DownloadFileListener;Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileConverter;)Z

    move-result v0

    return v0
.end method

.method public static declared-synchronized execute(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;ZLcom/vkontakte/android/audio/http/downloadfile/DownloadFileListener;Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileConverter;)Z
    .locals 12
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "file"    # Ljava/io/File;
    .param p3, "checkLastModified"    # Z
    .param p4, "listener"    # Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileListener;
    .param p5, "converter"    # Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileConverter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 51
    const-class v11, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;

    monitor-enter v11

    :try_start_0
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    .line 52
    .local v10, "path":Ljava/lang/String;
    sget-object v1, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->THREADS:Ljava/util/Map;

    invoke-interface {v1, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;

    .line 53
    .local v0, "thread":Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;
    if-nez v0, :cond_0

    .line 54
    new-instance v0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;

    .end local v0    # "thread":Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;
    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move-object/from16 v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;ZLcom/vkontakte/android/audio/http/downloadfile/DownloadFileConverter;)V

    .line 55
    .restart local v0    # "thread":Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;
    sget-object v1, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->THREADS:Ljava/util/Map;

    invoke-interface {v1, v10, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    invoke-virtual {v0}, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->start()V

    .line 59
    :cond_0
    iget v1, v0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->waitCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->waitCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    const/4 v8, 0x0

    .line 63
    .local v8, "interrupted":Z
    const/4 v9, 0x0

    .line 64
    .local v9, "lastProgressHashCode":I
    :cond_1
    :try_start_1
    iget-boolean v1, v0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->finished:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    if-nez v1, :cond_7

    .line 66
    if-eqz p4, :cond_3

    if-eqz v9, :cond_2

    :try_start_2
    iget v1, v0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->progressHashCode:I

    if-eq v9, v1, :cond_3

    .line 67
    :cond_2
    iget v9, v0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->progressHashCode:I

    .line 68
    iget-wide v2, v0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->count:J

    iget-wide v4, v0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->totalCount:J

    iget v6, v0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->progress:I

    move-object/from16 v1, p4

    invoke-interface/range {v1 .. v6}, Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileListener;->onProgress(JJI)V

    .line 70
    :cond_3
    const-class v1, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V

    .line 71
    if-eqz p4, :cond_1

    invoke-interface/range {p4 .. p4}, Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileListener;->isCancelled()Z
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    move-result v1

    if-eqz v1, :cond_1

    .line 72
    const/4 v1, 0x0

    .line 80
    if-eqz v8, :cond_4

    .line 81
    :try_start_3
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->interrupt()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 89
    :cond_4
    :try_start_4
    iget v2, v0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->waitCount:I

    add-int/lit8 v2, v2, -0x1

    iput v2, v0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->waitCount:I

    .line 90
    iget v2, v0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->waitCount:I

    if-nez v2, :cond_5

    .line 91
    sget-object v2, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->THREADS:Ljava/util/Map;

    invoke-interface {v2, v10}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :cond_5
    :goto_0
    monitor-exit v11

    return v1

    .line 73
    :catch_0
    move-exception v7

    .line 74
    .local v7, "e":Ljava/lang/InterruptedException;
    const/4 v8, 0x1

    .line 75
    if-eqz p4, :cond_1

    :try_start_5
    invoke-interface/range {p4 .. p4}, Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileListener;->isCancelled()Z
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    move-result v1

    if-eqz v1, :cond_1

    .line 76
    const/4 v1, 0x0

    .line 80
    if-eqz v8, :cond_6

    .line 81
    :try_start_6
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->interrupt()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 89
    :cond_6
    :try_start_7
    iget v2, v0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->waitCount:I

    add-int/lit8 v2, v2, -0x1

    iput v2, v0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->waitCount:I

    .line 90
    iget v2, v0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->waitCount:I

    if-nez v2, :cond_5

    .line 91
    sget-object v2, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->THREADS:Ljava/util/Map;

    invoke-interface {v2, v10}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_0

    .line 51
    .end local v0    # "thread":Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;
    .end local v7    # "e":Ljava/lang/InterruptedException;
    .end local v8    # "interrupted":Z
    .end local v9    # "lastProgressHashCode":I
    .end local v10    # "path":Ljava/lang/String;
    :catchall_0
    move-exception v1

    monitor-exit v11

    throw v1

    .line 80
    .restart local v0    # "thread":Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;
    .restart local v8    # "interrupted":Z
    .restart local v9    # "lastProgressHashCode":I
    .restart local v10    # "path":Ljava/lang/String;
    :cond_7
    if-eqz v8, :cond_8

    .line 81
    :try_start_8
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    .line 84
    :cond_8
    iget-object v1, v0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->exception:Ljava/lang/Exception;

    if-eqz v1, :cond_b

    .line 85
    iget-object v1, v0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->exception:Ljava/lang/Exception;

    throw v1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 89
    :catchall_1
    move-exception v1

    :try_start_9
    iget v2, v0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->waitCount:I

    add-int/lit8 v2, v2, -0x1

    iput v2, v0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->waitCount:I

    .line 90
    iget v2, v0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->waitCount:I

    if-nez v2, :cond_9

    .line 91
    sget-object v2, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->THREADS:Ljava/util/Map;

    invoke-interface {v2, v10}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_9
    throw v1
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 80
    :catchall_2
    move-exception v1

    if-eqz v8, :cond_a

    .line 81
    :try_start_a
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->interrupt()V

    :cond_a
    throw v1

    .line 87
    :cond_b
    iget-boolean v1, v0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->notModified:Z
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    if-nez v1, :cond_c

    const/4 v1, 0x1

    .line 89
    :goto_1
    :try_start_b
    iget v2, v0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->waitCount:I

    add-int/lit8 v2, v2, -0x1

    iput v2, v0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->waitCount:I

    .line 90
    iget v2, v0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->waitCount:I

    if-nez v2, :cond_5

    .line 91
    sget-object v2, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->THREADS:Ljava/util/Map;

    invoke-interface {v2, v10}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    goto :goto_0

    .line 87
    :cond_c
    const/4 v1, 0x0

    goto :goto_1
.end method

.method private isCancelled()Z
    .locals 2

    .prologue
    .line 170
    const-class v1, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;

    monitor-enter v1

    .line 171
    :try_start_0
    iget v0, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->waitCount:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit v1

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 172
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private notifyFinished()V
    .locals 2

    .prologue
    .line 163
    const-class v1, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;

    monitor-enter v1

    .line 164
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->finished:Z

    .line 165
    const-class v0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 166
    monitor-exit v1

    .line 167
    return-void

    .line 166
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private notifyProgress(JJ)Z
    .locals 5
    .param p1, "count"    # J
    .param p3, "totalCount"    # J

    .prologue
    const/4 v0, 0x1

    .line 144
    const-class v1, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;

    monitor-enter v1

    .line 145
    :try_start_0
    invoke-direct {p0}, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->isCancelled()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 146
    const/4 v0, 0x0

    monitor-exit v1

    .line 158
    :goto_0
    return v0

    .line 148
    :cond_0
    const-wide/16 v2, 0x0

    cmp-long v2, p3, v2

    if-lez v2, :cond_1

    cmp-long v2, p1, p3

    if-gtz v2, :cond_1

    .line 149
    iput-wide p1, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->count:J

    .line 150
    iput-wide p3, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->totalCount:J

    .line 151
    const-wide/16 v2, 0x64

    mul-long/2addr v2, p1

    div-long/2addr v2, p3

    long-to-int v2, v2

    iput v2, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->progress:I

    .line 152
    const/4 v2, 0x1

    invoke-static {v2, p1, p2}, Lcom/vkontakte/android/audio/net/HashCodeUtils;->add(IJ)I

    move-result v2

    iput v2, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->progressHashCode:I

    .line 153
    iget v2, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->progressHashCode:I

    invoke-static {v2, p3, p4}, Lcom/vkontakte/android/audio/net/HashCodeUtils;->add(IJ)I

    move-result v2

    iput v2, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->progressHashCode:I

    .line 154
    iget v2, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->progressHashCode:I

    iget v3, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->progress:I

    invoke-static {v2, v3}, Lcom/vkontakte/android/audio/net/HashCodeUtils;->add(II)I

    move-result v2

    iput v2, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->progressHashCode:I

    .line 155
    const-class v2, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;

    invoke-virtual {v2}, Ljava/lang/Object;->notifyAll()V

    .line 158
    :cond_1
    monitor-exit v1

    goto :goto_0

    .line 159
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 103
    :try_start_0
    invoke-direct {p0}, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->isCancelled()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result v3

    if-eqz v3, :cond_0

    .line 139
    invoke-direct {p0}, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->notifyFinished()V

    .line 141
    :goto_0
    return-void

    .line 107
    :cond_0
    :try_start_1
    iget-boolean v3, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->mCheckLastModified:Z

    if-nez v3, :cond_1

    iget-object v3, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->mFile:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->mFile:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    move-result v3

    if-nez v3, :cond_1

    .line 108
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Can\'t delete file "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->mFile:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 135
    :catch_0
    move-exception v0

    .line 136
    .local v0, "e":Ljava/lang/Exception;
    :try_start_2
    iput-object v0, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->exception:Ljava/lang/Exception;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 139
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_1
    invoke-direct {p0}, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->notifyFinished()V

    goto :goto_0

    .line 110
    :cond_1
    :try_start_3
    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->mFile:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->mFile:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ".tmp"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 112
    .local v2, "tempFile":Ljava/io/File;
    :try_start_4
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    move-result v3

    if-nez v3, :cond_2

    .line 113
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Can\'t delete temp file "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 133
    :catchall_0
    move-exception v3

    :try_start_5
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    throw v3
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 139
    .end local v2    # "tempFile":Ljava/io/File;
    :catchall_1
    move-exception v3

    invoke-direct {p0}, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->notifyFinished()V

    throw v3

    .line 115
    .restart local v2    # "tempFile":Ljava/io/File;
    :cond_2
    :try_start_6
    iget-object v3, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->mContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->request:Lokhttp3/Request;

    new-instance v5, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$MyResponseHandler;

    invoke-direct {v5, p0, v2}, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$MyResponseHandler;-><init>(Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;Ljava/io/File;)V

    invoke-static {v3, v4, v5}, Lcom/vkontakte/android/audio/http/HttpExecutor;->execute(Landroid/content/Context;Lokhttp3/Request;Lcom/vkontakte/android/audio/http/HttpResponseHandler;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$Result;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 116
    .local v1, "result":Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$Result;
    if-nez v1, :cond_3

    .line 133
    :try_start_7
    invoke-virtual {v2}, Ljava/io/File;->delete()Z
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 139
    invoke-direct {p0}, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->notifyFinished()V

    goto/16 :goto_0

    .line 119
    :cond_3
    :try_start_8
    iget-boolean v3, v1, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$Result;->notModified:Z

    if-eqz v3, :cond_6

    iget-object v3, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->mFile:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_6

    .line 120
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->notModified:Z

    .line 128
    :cond_4
    iget-wide v4, v1, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$Result;->lastModified:J

    const-wide/16 v6, 0x0

    cmp-long v3, v4, v6

    if-lez v3, :cond_5

    .line 130
    iget-object v3, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->mFile:Ljava/io/File;

    iget-wide v4, v1, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$Result;->lastModified:J

    invoke-virtual {v3, v4, v5}, Ljava/io/File;->setLastModified(J)Z
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 133
    :cond_5
    :try_start_9
    invoke-virtual {v2}, Ljava/io/File;->delete()Z
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    goto/16 :goto_1

    .line 122
    :cond_6
    :try_start_a
    iget-object v3, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->mFile:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_7

    iget-object v3, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->mFile:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    move-result v3

    if-nez v3, :cond_7

    .line 123
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Can\'t delete file "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->mFile:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 124
    :cond_7
    iget-object v3, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->mFile:Ljava/io/File;

    invoke-virtual {v2, v3}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 125
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Can\'t rename mFile "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " to "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->mFile:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0
.end method
