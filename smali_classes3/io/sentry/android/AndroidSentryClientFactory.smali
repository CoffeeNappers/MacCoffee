.class public Lio/sentry/android/AndroidSentryClientFactory;
.super Lio/sentry/DefaultSentryClientFactory;
.source "AndroidSentryClientFactory.java"


# static fields
.field private static final DEFAULT_BUFFER_DIR:Ljava/lang/String; = "sentry-buffered-events"

.field public static final TAG:Ljava/lang/String;


# instance fields
.field private ctx:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 27
    const-class v0, Lio/sentry/android/AndroidSentryClientFactory;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lio/sentry/android/AndroidSentryClientFactory;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 40
    invoke-direct {p0}, Lio/sentry/DefaultSentryClientFactory;-><init>()V

    .line 41
    sget-object v0, Lio/sentry/android/AndroidSentryClientFactory;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "Construction of Android Sentry."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lio/sentry/android/AndroidSentryClientFactory;->ctx:Landroid/content/Context;

    .line 44
    return-void
.end method

.method private checkPermission(Ljava/lang/String;)Z
    .locals 2
    .param p1, "permission"    # Ljava/lang/String;

    .prologue
    .line 99
    iget-object v1, p0, Lio/sentry/android/AndroidSentryClientFactory;->ctx:Landroid/content/Context;

    invoke-virtual {v1, p1}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result v0

    .line 100
    .local v0, "res":I
    if-nez v0, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method public createSentryClient(Lio/sentry/dsn/Dsn;)Lio/sentry/SentryClient;
    .locals 6
    .param p1, "dsn"    # Lio/sentry/dsn/Dsn;

    .prologue
    .line 48
    const-string/jumbo v3, "android.permission.INTERNET"

    invoke-direct {p0, v3}, Lio/sentry/android/AndroidSentryClientFactory;->checkPermission(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 49
    sget-object v3, Lio/sentry/android/AndroidSentryClientFactory;->TAG:Ljava/lang/String;

    const-string/jumbo v4, "android.permission.INTERNET is required to connect to the Sentry server, please add it to your AndroidManifest.xml"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    :cond_0
    sget-object v3, Lio/sentry/android/AndroidSentryClientFactory;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Sentry init with ctx=\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lio/sentry/android/AndroidSentryClientFactory;->ctx:Landroid/content/Context;

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "\' and dsn=\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    invoke-virtual {p1}, Lio/sentry/dsn/Dsn;->getProtocol()Ljava/lang/String;

    move-result-object v1

    .line 56
    .local v1, "protocol":Ljava/lang/String;
    const-string/jumbo v3, "http"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    const-string/jumbo v3, "https"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 57
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Only \'http\' or \'https\' connections are supported in Sentry Android, but received: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 61
    :cond_1
    const-string/jumbo v3, "async"

    invoke-static {v3, p1}, Lio/sentry/config/Lookup;->lookup(Ljava/lang/String;Lio/sentry/dsn/Dsn;)Ljava/lang/String;

    move-result-object v0

    .line 62
    .local v0, "async":Ljava/lang/String;
    if-eqz v0, :cond_2

    const-string/jumbo v3, "false"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 63
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v4, "Sentry Android cannot use synchronous connections, remove \'async=false\' from your DSN."

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 67
    :cond_2
    invoke-super {p0, p1}, Lio/sentry/DefaultSentryClientFactory;->createSentryClient(Lio/sentry/dsn/Dsn;)Lio/sentry/SentryClient;

    move-result-object v2

    .line 68
    .local v2, "sentryClient":Lio/sentry/SentryClient;
    new-instance v3, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;

    iget-object v4, p0, Lio/sentry/android/AndroidSentryClientFactory;->ctx:Landroid/content/Context;

    invoke-direct {v3, v4}, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v3}, Lio/sentry/SentryClient;->addBuilderHelper(Lio/sentry/event/helper/EventBuilderHelper;)V

    .line 69
    invoke-static {}, Lio/sentry/SentryUncaughtExceptionHandler;->setup()V

    .line 70
    return-object v2
.end method

.method protected getBuffer(Lio/sentry/dsn/Dsn;)Lio/sentry/buffer/Buffer;
    .locals 5
    .param p1, "dsn"    # Lio/sentry/dsn/Dsn;

    .prologue
    .line 76
    const-string/jumbo v2, "buffer.dir"

    invoke-static {v2, p1}, Lio/sentry/config/Lookup;->lookup(Ljava/lang/String;Lio/sentry/dsn/Dsn;)Ljava/lang/String;

    move-result-object v1

    .line 77
    .local v1, "bufferDirOpt":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 78
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 83
    .local v0, "bufferDir":Ljava/io/File;
    :goto_0
    sget-object v2, Lio/sentry/android/AndroidSentryClientFactory;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Using buffer dir: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 84
    new-instance v2, Lio/sentry/buffer/DiskBuffer;

    invoke-virtual {p0, p1}, Lio/sentry/android/AndroidSentryClientFactory;->getBufferSize(Lio/sentry/dsn/Dsn;)I

    move-result v3

    invoke-direct {v2, v0, v3}, Lio/sentry/buffer/DiskBuffer;-><init>(Ljava/io/File;I)V

    return-object v2

    .line 80
    .end local v0    # "bufferDir":Ljava/io/File;
    :cond_0
    new-instance v0, Ljava/io/File;

    iget-object v2, p0, Lio/sentry/android/AndroidSentryClientFactory;->ctx:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "sentry-buffered-events"

    invoke-direct {v0, v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .restart local v0    # "bufferDir":Ljava/io/File;
    goto :goto_0
.end method

.method protected getContextManager(Lio/sentry/dsn/Dsn;)Lio/sentry/context/ContextManager;
    .locals 1
    .param p1, "dsn"    # Lio/sentry/dsn/Dsn;

    .prologue
    .line 89
    new-instance v0, Lio/sentry/context/SingletonContextManager;

    invoke-direct {v0}, Lio/sentry/context/SingletonContextManager;-><init>()V

    return-object v0
.end method
