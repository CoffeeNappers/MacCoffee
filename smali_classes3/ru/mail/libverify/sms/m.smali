.class public final Lru/mail/libverify/sms/m;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/sms/k;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lru/mail/libverify/sms/m$a;,
        Lru/mail/libverify/sms/m$b;,
        Lru/mail/libverify/sms/m$d;,
        Lru/mail/libverify/sms/m$c;
    }
.end annotation


# static fields
.field static final a:Ljava/util/regex/Pattern;

.field static final b:Ljava/util/regex/Pattern;


# instance fields
.field private c:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lru/mail/libverify/sms/m$c;",
            "Ljava/util/List",
            "<",
            "Lru/mail/libverify/sms/k$f;",
            ">;>;"
        }
    .end annotation
.end field

.field private final d:Landroid/content/ContentResolver;

.field private final e:Lru/mail/libverify/sms/l;

.field private f:J

.field private g:[Ljava/lang/String;

.field private h:Ljava/lang/String;

.field private i:Landroid/support/v4/util/LongSparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/util/LongSparseArray",
            "<",
            "Lru/mail/libverify/sms/m$b;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string/jumbo v0, ".*"

    const/16 v1, 0x20

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lru/mail/libverify/sms/m;->a:Ljava/util/regex/Pattern;

    const-string/jumbo v0, "content://sms/[0-9]+"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lru/mail/libverify/sms/m;->b:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>(Lru/mail/libverify/sms/l;)V
    .locals 6
    .param p1    # Lru/mail/libverify/sms/l;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v1, 0x0

    const/4 v0, 0x1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v2, Ljava/util/LinkedHashMap;

    invoke-direct {v2}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v2, p0, Lru/mail/libverify/sms/m;->c:Ljava/util/Map;

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/String;

    const-string/jumbo v3, "_id"

    aput-object v3, v2, v1

    const-string/jumbo v3, "type"

    aput-object v3, v2, v0

    const/4 v3, 0x2

    const-string/jumbo v4, "address"

    aput-object v4, v2, v3

    const/4 v3, 0x3

    const-string/jumbo v4, "body"

    aput-object v4, v2, v3

    iput-object v2, p0, Lru/mail/libverify/sms/m;->g:[Ljava/lang/String;

    const-string/jumbo v2, "_id ASC"

    iput-object v2, p0, Lru/mail/libverify/sms/m;->h:Ljava/lang/String;

    new-instance v2, Lru/mail/libverify/sms/m$a;

    invoke-direct {v2}, Lru/mail/libverify/sms/m$a;-><init>()V

    iput-object v2, p0, Lru/mail/libverify/sms/m;->i:Landroid/support/v4/util/LongSparseArray;

    iput-object p1, p0, Lru/mail/libverify/sms/m;->e:Lru/mail/libverify/sms/l;

    invoke-interface {p1}, Lru/mail/libverify/sms/l;->b()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    iput-object v2, p0, Lru/mail/libverify/sms/m;->d:Landroid/content/ContentResolver;

    iget-object v2, p0, Lru/mail/libverify/sms/m;->e:Lru/mail/libverify/sms/l;

    invoke-interface {v2}, Lru/mail/libverify/sms/l;->b()Landroid/content/Context;

    move-result-object v2

    const-string/jumbo v3, "android.permission.READ_SMS"

    invoke-static {v2, v3}, Lru/mail/libverify/utils/m;->b(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string/jumbo v2, "SmsManager"

    const-string/jumbo v3, "can\'t init SmsManager without %s"

    new-array v4, v0, [Ljava/lang/Object;

    const-string/jumbo v5, "android.permission.READ_SMS"

    aput-object v5, v4, v1

    invoke-static {v2, v3, v4}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :goto_0
    if-eqz v0, :cond_1

    :goto_1
    return-void

    :cond_0
    move v0, v1

    goto :goto_0

    :cond_1
    invoke-direct {p0}, Lru/mail/libverify/sms/m;->d()V

    invoke-direct {p0}, Lru/mail/libverify/sms/m;->b()V

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/sms/m;->d:Landroid/content/ContentResolver;

    sget-object v1, Lru/mail/libverify/sms/a;->a:Landroid/net/Uri;

    const/4 v2, 0x1

    new-instance v3, Lru/mail/libverify/sms/m$d;

    new-instance v4, Landroid/os/Handler;

    invoke-direct {v4}, Landroid/os/Handler;-><init>()V

    invoke-direct {v3, p0, v4}, Lru/mail/libverify/sms/m$d;-><init>(Lru/mail/libverify/sms/m;Landroid/os/Handler;)V

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    const-string/jumbo v1, "SmsManager"

    const-string/jumbo v2, "start error"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method private a(J)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Ljava/util/List",
            "<",
            "Lru/mail/libverify/sms/b;",
            ">;"
        }
    .end annotation

    const/4 v6, 0x0

    iget-object v0, p0, Lru/mail/libverify/sms/m;->i:Landroid/support/v4/util/LongSparseArray;

    invoke-virtual {v0}, Landroid/support/v4/util/LongSparseArray;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/sms/m;->i:Landroid/support/v4/util/LongSparseArray;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v4/util/LongSparseArray;->keyAt(I)J

    move-result-wide v0

    const-wide/16 v2, 0x1

    sub-long p1, v0, v2

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "_id > "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/sms/m;->d:Landroid/content/ContentResolver;

    sget-object v1, Lru/mail/libverify/sms/a;->a:Landroid/net/Uri;

    iget-object v2, p0, Lru/mail/libverify/sms/m;->g:[Ljava/lang/String;

    const/4 v4, 0x0

    iget-object v5, p0, Lru/mail/libverify/sms/m;->h:Ljava/lang/String;

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    move-object v2, v0

    :goto_0
    if-nez v2, :cond_1

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    :goto_1
    return-object v0

    :catch_0
    move-exception v0

    const-string/jumbo v1, "SmsManager"

    const-string/jumbo v2, "getLastMessages error"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object v2, v6

    goto :goto_0

    :cond_1
    :try_start_1
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    new-instance v3, Lru/mail/libverify/sms/f;

    invoke-direct {v3, v2}, Lru/mail/libverify/sms/f;-><init>(Landroid/database/Cursor;)V

    :cond_2
    :goto_2
    invoke-virtual {v3}, Lru/mail/libverify/sms/f;->a()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {v3}, Lru/mail/libverify/sms/f;->b()Lru/mail/libverify/sms/b;

    move-result-object v4

    iget-object v0, p0, Lru/mail/libverify/sms/m;->i:Landroid/support/v4/util/LongSparseArray;

    iget-wide v6, v4, Lru/mail/libverify/sms/b;->a:J

    invoke-virtual {v0, v6, v7}, Landroid/support/v4/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/sms/m$b;

    iget-object v5, v4, Lru/mail/libverify/sms/b;->b:Lru/mail/libverify/sms/m$b;

    if-eq v0, v5, :cond_2

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-direct {p0, v4}, Lru/mail/libverify/sms/m;->a(Lru/mail/libverify/sms/b;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception v0

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    throw v0

    :cond_3
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    move-object v0, v1

    goto :goto_1
.end method

.method static synthetic a(Lru/mail/libverify/sms/m;)Ljava/util/Map;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/sms/m;->c:Ljava/util/Map;

    return-object v0
.end method

.method private a(Ljava/util/regex/Pattern;Ljava/util/regex/Pattern;Lru/mail/libverify/sms/k$f;)Lru/mail/libverify/sms/e;
    .locals 3

    new-instance v1, Lru/mail/libverify/sms/m$c;

    const/4 v0, 0x0

    invoke-direct {v1, p1, p2, v0}, Lru/mail/libverify/sms/m$c;-><init>(Ljava/util/regex/Pattern;Ljava/util/regex/Pattern;B)V

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/sms/m;->c:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v2, p0, Lru/mail/libverify/sms/m;->c:Ljava/util/Map;

    invoke-interface {v2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    invoke-interface {v0, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    new-instance v0, Lru/mail/libverify/sms/m$2;

    invoke-direct {v0, p0, v1, p3}, Lru/mail/libverify/sms/m$2;-><init>(Lru/mail/libverify/sms/m;Lru/mail/libverify/sms/m$c;Lru/mail/libverify/sms/k$f;)V

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method static synthetic a(Lru/mail/libverify/sms/m;Ljava/util/regex/Pattern;Ljava/util/regex/Pattern;Lru/mail/libverify/sms/k$f;)Lru/mail/libverify/sms/e;
    .locals 1

    invoke-direct {p0, p1, p2, p3}, Lru/mail/libverify/sms/m;->a(Ljava/util/regex/Pattern;Ljava/util/regex/Pattern;Lru/mail/libverify/sms/k$f;)Lru/mail/libverify/sms/e;

    move-result-object v0

    return-object v0
.end method

.method private a(Landroid/net/Uri;)V
    .locals 5

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x2f

    :try_start_0
    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    iget-object v2, p0, Lru/mail/libverify/sms/m;->i:Landroid/support/v4/util/LongSparseArray;

    invoke-virtual {v2, v0, v1}, Landroid/support/v4/util/LongSparseArray;->remove(J)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_1

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string/jumbo v1, "SmsManager"

    const-string/jumbo v2, "untrackMessage"

    new-instance v3, Ljava/lang/Exception;

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-static {v1, v2, v3}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :catch_1
    move-exception v0

    const-string/jumbo v1, "SmsManager"

    const-string/jumbo v2, "untrackMessage"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private a(Lru/mail/libverify/sms/b;)V
    .locals 4

    iget-object v0, p0, Lru/mail/libverify/sms/m;->i:Landroid/support/v4/util/LongSparseArray;

    iget-wide v2, p1, Lru/mail/libverify/sms/b;->a:J

    iget-object v1, p1, Lru/mail/libverify/sms/b;->b:Lru/mail/libverify/sms/m$b;

    invoke-virtual {v0, v2, v3, v1}, Landroid/support/v4/util/LongSparseArray;->put(JLjava/lang/Object;)V

    return-void
.end method

.method static synthetic a(Lru/mail/libverify/sms/m;J)V
    .locals 3

    :goto_0
    iget-object v0, p0, Lru/mail/libverify/sms/m;->i:Landroid/support/v4/util/LongSparseArray;

    invoke-virtual {v0}, Landroid/support/v4/util/LongSparseArray;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/sms/m;->i:Landroid/support/v4/util/LongSparseArray;

    iget-object v1, p0, Lru/mail/libverify/sms/m;->i:Landroid/support/v4/util/LongSparseArray;

    invoke-virtual {v1}, Landroid/support/v4/util/LongSparseArray;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Landroid/support/v4/util/LongSparseArray;->keyAt(I)J

    move-result-wide v0

    cmp-long v0, v0, p1

    if-lez v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/sms/m;->i:Landroid/support/v4/util/LongSparseArray;

    iget-object v1, p0, Lru/mail/libverify/sms/m;->i:Landroid/support/v4/util/LongSparseArray;

    invoke-virtual {v1}, Landroid/support/v4/util/LongSparseArray;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Landroid/support/v4/util/LongSparseArray;->removeAt(I)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method static synthetic a(Lru/mail/libverify/sms/m;Landroid/net/Uri;)V
    .locals 4

    const-string/jumbo v0, "SmsManager"

    const-string/jumbo v1, "Got some message folder change: uri=%s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lru/mail/libverify/sms/m;->e:Lru/mail/libverify/sms/l;

    invoke-interface {v0}, Lru/mail/libverify/sms/l;->a()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lru/mail/libverify/sms/m$3;

    invoke-direct {v1, p0, p1}, Lru/mail/libverify/sms/m$3;-><init>(Lru/mail/libverify/sms/m;Landroid/net/Uri;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method static synthetic a(Lru/mail/libverify/sms/m;Lru/mail/libverify/sms/b;)V
    .locals 2

    invoke-direct {p0, p1}, Lru/mail/libverify/sms/m;->b(Lru/mail/libverify/sms/b;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/sms/k$f;

    invoke-interface {v0, p1}, Lru/mail/libverify/sms/k$f;->a(Lru/mail/libverify/sms/b;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method static synthetic b(Lru/mail/libverify/sms/m;)J
    .locals 2

    iget-wide v0, p0, Lru/mail/libverify/sms/m;->f:J

    return-wide v0
.end method

.method private b(Lru/mail/libverify/sms/b;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lru/mail/libverify/sms/b;",
            ")",
            "Ljava/util/List",
            "<",
            "Lru/mail/libverify/sms/k$f;",
            ">;"
        }
    .end annotation

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iget-object v0, p1, Lru/mail/libverify/sms/b;->c:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p1, Lru/mail/libverify/sms/b;->d:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/sms/m;->c:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lru/mail/libverify/sms/m$c;

    iget-object v4, v1, Lru/mail/libverify/sms/m$c;->b:Ljava/util/regex/Pattern;

    iget-object v5, p1, Lru/mail/libverify/sms/b;->c:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/regex/Matcher;->matches()Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v1, v1, Lru/mail/libverify/sms/m$c;->a:Ljava/util/regex/Pattern;

    iget-object v4, p1, Lru/mail/libverify/sms/b;->d:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v2, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_2
    return-object v2
.end method

.method static synthetic b(Lru/mail/libverify/sms/m;J)Ljava/util/List;
    .locals 1

    invoke-direct {p0, p1, p2}, Lru/mail/libverify/sms/m;->a(J)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method private b(Landroid/net/Uri;)Lru/mail/libverify/sms/b;
    .locals 7

    const/4 v6, 0x0

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/sms/m;->d:Landroid/content/ContentResolver;

    iget-object v2, p0, Lru/mail/libverify/sms/m;->g:[Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    iget-object v5, p0, Lru/mail/libverify/sms/m;->h:Ljava/lang/String;

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    move-object v2, v0

    :goto_0
    if-nez v2, :cond_0

    invoke-direct {p0, p1}, Lru/mail/libverify/sms/m;->a(Landroid/net/Uri;)V

    move-object v0, v6

    :goto_1
    return-object v0

    :catch_0
    move-exception v0

    const-string/jumbo v1, "SmsManager"

    const-string/jumbo v2, "getLastMessages error"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object v2, v6

    goto :goto_0

    :cond_0
    :try_start_1
    new-instance v0, Lru/mail/libverify/sms/f;

    invoke-direct {v0, v2}, Lru/mail/libverify/sms/f;-><init>(Landroid/database/Cursor;)V

    iget-object v1, v0, Lru/mail/libverify/sms/f;->a:Landroid/database/Cursor;

    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lru/mail/libverify/sms/f;->b()Lru/mail/libverify/sms/b;

    move-result-object v1

    iget-object v0, p0, Lru/mail/libverify/sms/m;->i:Landroid/support/v4/util/LongSparseArray;

    iget-wide v4, v1, Lru/mail/libverify/sms/b;->a:J

    invoke-virtual {v0, v4, v5}, Landroid/support/v4/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/sms/m$b;

    iget-object v3, v1, Lru/mail/libverify/sms/b;->b:Lru/mail/libverify/sms/m$b;

    if-eq v0, v3, :cond_2

    invoke-direct {p0, v1}, Lru/mail/libverify/sms/m;->a(Lru/mail/libverify/sms/b;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    move-object v0, v1

    goto :goto_1

    :cond_1
    :try_start_2
    invoke-direct {p0, p1}, Lru/mail/libverify/sms/m;->a(Landroid/net/Uri;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_2
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    :goto_2
    move-object v0, v6

    goto :goto_1

    :catch_1
    move-exception v0

    :try_start_3
    const-string/jumbo v1, "SmsManager"

    const-string/jumbo v3, "getMessage error"

    invoke-static {v1, v3, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    goto :goto_2

    :catchall_0
    move-exception v0

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    throw v0
.end method

.method static synthetic b(Lru/mail/libverify/sms/m;Landroid/net/Uri;)Lru/mail/libverify/sms/b;
    .locals 1

    invoke-direct {p0, p1}, Lru/mail/libverify/sms/m;->b(Landroid/net/Uri;)Lru/mail/libverify/sms/b;

    move-result-object v0

    return-object v0
.end method

.method private b()V
    .locals 7

    const/4 v6, 0x0

    :try_start_0
    const-string/jumbo v5, "_id DESC LIMIT 128"

    iget-object v0, p0, Lru/mail/libverify/sms/m;->d:Landroid/content/ContentResolver;

    sget-object v1, Lru/mail/libverify/sms/a;->a:Landroid/net/Uri;

    iget-object v2, p0, Lru/mail/libverify/sms/m;->g:[Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_1

    if-eqz v1, :cond_0

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_0
    :goto_0
    return-void

    :cond_1
    :try_start_1
    new-instance v0, Lru/mail/libverify/sms/f;

    invoke-direct {v0, v1}, Lru/mail/libverify/sms/f;-><init>(Landroid/database/Cursor;)V

    :goto_1
    invoke-virtual {v0}, Lru/mail/libverify/sms/f;->a()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-virtual {v0}, Lru/mail/libverify/sms/f;->b()Lru/mail/libverify/sms/b;

    move-result-object v2

    invoke-direct {p0, v2}, Lru/mail/libverify/sms/m;->a(Lru/mail/libverify/sms/b;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    :catch_0
    move-exception v0

    :goto_2
    :try_start_2
    const-string/jumbo v2, "SmsManager"

    const-string/jumbo v3, "prefillKnownMessages error"

    invoke-static {v2, v3, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz v1, :cond_0

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    goto :goto_0

    :cond_2
    if-eqz v1, :cond_0

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    goto :goto_0

    :catchall_0
    move-exception v0

    move-object v1, v6

    :goto_3
    if-eqz v1, :cond_3

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_3
    throw v0

    :catchall_1
    move-exception v0

    goto :goto_3

    :catch_1
    move-exception v0

    move-object v1, v6

    goto :goto_2
.end method

.method static synthetic b(Lru/mail/libverify/sms/m;Lru/mail/libverify/sms/b;)V
    .locals 2

    invoke-direct {p0, p1}, Lru/mail/libverify/sms/m;->b(Lru/mail/libverify/sms/b;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    goto :goto_0

    :cond_0
    return-void
.end method

.method private c()J
    .locals 6

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/sms/m;->d:Landroid/content/ContentResolver;

    sget-object v1, Lru/mail/libverify/sms/a;->a:Landroid/net/Uri;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string/jumbo v4, "_id"

    aput-object v4, v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const-string/jumbo v5, "_id DESC LIMIT 1"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    if-eqz v2, :cond_1

    :try_start_1
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string/jumbo v0, "_id"

    invoke-interface {v2, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v2, v0}, Landroid/database/Cursor;->getLong(I)J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-wide v0

    if-eqz v2, :cond_0

    :try_start_2
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    :cond_0
    :goto_0
    return-wide v0

    :cond_1
    if-eqz v2, :cond_2

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    :cond_2
    :goto_1
    const-wide/16 v0, -0x1

    goto :goto_0

    :catchall_0
    move-exception v0

    if-eqz v2, :cond_3

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    :cond_3
    throw v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    move-exception v0

    const-string/jumbo v1, "SmsManager"

    const-string/jumbo v2, "obtainLastSmsId error"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method static synthetic c(Lru/mail/libverify/sms/m;)V
    .locals 0

    invoke-direct {p0}, Lru/mail/libverify/sms/m;->d()V

    return-void
.end method

.method static synthetic c(Lru/mail/libverify/sms/m;Lru/mail/libverify/sms/b;)V
    .locals 2

    invoke-direct {p0, p1}, Lru/mail/libverify/sms/m;->b(Lru/mail/libverify/sms/b;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    goto :goto_0

    :cond_0
    return-void
.end method

.method private d()V
    .locals 2

    invoke-direct {p0}, Lru/mail/libverify/sms/m;->c()J

    move-result-wide v0

    iput-wide v0, p0, Lru/mail/libverify/sms/m;->f:J

    return-void
.end method

.method static synthetic d(Lru/mail/libverify/sms/m;Lru/mail/libverify/sms/b;)V
    .locals 2

    invoke-direct {p0, p1}, Lru/mail/libverify/sms/m;->b(Lru/mail/libverify/sms/b;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public final a()Lru/mail/libverify/sms/i;
    .locals 2

    new-instance v0, Lru/mail/libverify/sms/i;

    new-instance v1, Lru/mail/libverify/sms/m$1;

    invoke-direct {v1, p0}, Lru/mail/libverify/sms/m$1;-><init>(Lru/mail/libverify/sms/m;)V

    invoke-direct {v0, v1}, Lru/mail/libverify/sms/i;-><init>(Lru/mail/libverify/sms/j;)V

    return-object v0
.end method
