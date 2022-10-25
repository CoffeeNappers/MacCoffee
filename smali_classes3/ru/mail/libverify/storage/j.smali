.class final Lru/mail/libverify/storage/j;
.super Ljava/lang/Object;


# static fields
.field private static a:I

.field private static b:I


# instance fields
.field private c:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput v0, Lru/mail/libverify/storage/j;->a:I

    const/4 v0, 0x1

    sput v0, Lru/mail/libverify/storage/j;->b:I

    return-void
.end method

.method constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget v0, Lru/mail/libverify/storage/j;->a:I

    iput v0, p0, Lru/mail/libverify/storage/j;->c:I

    invoke-static {p1}, Lru/mail/libverify/storage/j;->a(Landroid/content/Context;)I

    move-result v0

    iput v0, p0, Lru/mail/libverify/storage/j;->c:I

    return-void
.end method

.method private static a(Landroid/content/Context;)I
    .locals 4
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    :try_start_0
    new-instance v0, Ljava/io/File;

    invoke-static {p0}, Lru/mail/libverify/utils/m;->b(Landroid/content/Context;)Ljava/io/File;

    move-result-object v1

    const-string/jumbo v2, "VERIFY_INSTALLATION_FLAGS"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    sget v0, Lru/mail/libverify/storage/j;->a:I
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return v0

    :cond_0
    const/4 v2, 0x0

    :try_start_1
    new-instance v1, Ljava/io/RandomAccessFile;

    const-string/jumbo v3, "r"

    invoke-direct {v1, v0, v3}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->readInt()I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    move-result v0

    :try_start_3
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->close()V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string/jumbo v1, "InstallationFlags"

    const-string/jumbo v2, "failed to read installation flags file"

    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    invoke-static {v1, v2, v3}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    sget v0, Lru/mail/libverify/storage/j;->a:I

    goto :goto_0

    :catchall_0
    move-exception v0

    move-object v1, v2

    :goto_1
    if-eqz v1, :cond_1

    :try_start_4
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->close()V

    :cond_1
    throw v0
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_0

    :catchall_1
    move-exception v0

    goto :goto_1
.end method


# virtual methods
.method final a(Landroid/content/Context;Z)V
    .locals 5
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-virtual {p0}, Lru/mail/libverify/storage/j;->a()Z

    move-result v0

    if-eq p2, v0, :cond_0

    if-eqz p2, :cond_1

    iget v0, p0, Lru/mail/libverify/storage/j;->c:I

    sget v1, Lru/mail/libverify/storage/j;->b:I

    or-int/2addr v0, v1

    iput v0, p0, Lru/mail/libverify/storage/j;->c:I

    :goto_0
    const-string/jumbo v0, "InstallationFlags"

    const-string/jumbo v1, "no encryption option set to value %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 v2, 0x0

    :try_start_0
    new-instance v0, Ljava/io/File;

    invoke-static {p1}, Lru/mail/libverify/utils/m;->b(Landroid/content/Context;)Ljava/io/File;

    move-result-object v1

    const-string/jumbo v3, "VERIFY_INSTALLATION_FLAGS"

    invoke-direct {v0, v1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance v1, Ljava/io/RandomAccessFile;

    const-string/jumbo v3, "rw"

    invoke-direct {v1, v0, v3}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    iget v0, p0, Lru/mail/libverify/storage/j;->c:I

    invoke-virtual {v1, v0}, Ljava/io/RandomAccessFile;->writeInt(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->close()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    :cond_0
    :goto_1
    return-void

    :cond_1
    iget v0, p0, Lru/mail/libverify/storage/j;->c:I

    sget v1, Lru/mail/libverify/storage/j;->b:I

    xor-int/lit8 v1, v1, -0x1

    and-int/2addr v0, v1

    iput v0, p0, Lru/mail/libverify/storage/j;->c:I

    goto :goto_0

    :catchall_0
    move-exception v0

    move-object v1, v2

    :goto_2
    if-eqz v1, :cond_2

    :try_start_3
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->close()V

    :cond_2
    throw v0
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_0

    :catch_0
    move-exception v0

    const-string/jumbo v1, "InstallationFlags"

    const-string/jumbo v2, "failed to save installation flags file"

    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    invoke-static {v1, v2, v3}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    :catchall_1
    move-exception v0

    goto :goto_2
.end method

.method final a()Z
    .locals 2

    iget v0, p0, Lru/mail/libverify/storage/j;->c:I

    sget v1, Lru/mail/libverify/storage/j;->b:I

    and-int/2addr v0, v1

    sget v1, Lru/mail/libverify/storage/j;->b:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
