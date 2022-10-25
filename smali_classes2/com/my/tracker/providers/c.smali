.class public final Lcom/my/tracker/providers/c;
.super Lcom/my/tracker/providers/a;
.source "DeviceParamsDataProvider.java"


# instance fields
.field private a:Z

.field private b:Ljava/lang/String;

.field private c:Ljava/lang/String;

.field private d:Ljava/lang/String;

.field private e:Ljava/lang/String;

.field private f:Ljava/lang/String;

.field private g:Ljava/lang/String;

.field private h:Ljava/lang/String;

.field private i:Ljava/lang/String;

.field private j:Ljava/lang/String;

.field private k:Ljava/lang/String;

.field private l:Ljava/lang/String;

.field private m:Ljava/lang/String;

.field private n:I

.field private o:I

.field private p:I

.field private q:F

.field private r:Ljava/lang/String;

.field private s:Ljava/lang/String;

.field private t:Ljava/lang/String;

.field private u:Ljava/lang/String;

.field private v:Ljava/lang/String;

.field private w:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 186
    invoke-direct {p0}, Lcom/my/tracker/providers/a;-><init>()V

    .line 54
    iput-boolean v1, p0, Lcom/my/tracker/providers/c;->a:Z

    .line 56
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/my/tracker/providers/c;->b:Ljava/lang/String;

    .line 57
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/my/tracker/providers/c;->c:Ljava/lang/String;

    .line 58
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/my/tracker/providers/c;->d:Ljava/lang/String;

    .line 59
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/my/tracker/providers/c;->e:Ljava/lang/String;

    .line 60
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/my/tracker/providers/c;->f:Ljava/lang/String;

    .line 61
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/my/tracker/providers/c;->g:Ljava/lang/String;

    .line 62
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/my/tracker/providers/c;->h:Ljava/lang/String;

    .line 63
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/my/tracker/providers/c;->i:Ljava/lang/String;

    .line 64
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/my/tracker/providers/c;->j:Ljava/lang/String;

    .line 65
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/my/tracker/providers/c;->k:Ljava/lang/String;

    .line 66
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/my/tracker/providers/c;->l:Ljava/lang/String;

    .line 67
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/my/tracker/providers/c;->m:Ljava/lang/String;

    .line 68
    iput v1, p0, Lcom/my/tracker/providers/c;->n:I

    .line 69
    iput v1, p0, Lcom/my/tracker/providers/c;->o:I

    .line 70
    iput v1, p0, Lcom/my/tracker/providers/c;->p:I

    .line 71
    const/4 v0, 0x0

    iput v0, p0, Lcom/my/tracker/providers/c;->q:F

    .line 72
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/my/tracker/providers/c;->r:Ljava/lang/String;

    .line 73
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/my/tracker/providers/c;->s:Ljava/lang/String;

    .line 74
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/my/tracker/providers/c;->t:Ljava/lang/String;

    .line 75
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/my/tracker/providers/c;->u:Ljava/lang/String;

    .line 76
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/my/tracker/providers/c;->v:Ljava/lang/String;

    .line 77
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/my/tracker/providers/c;->w:Ljava/lang/String;

    .line 187
    return-void
.end method

.method private static a(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 450
    .line 453
    :try_start_0
    const-string/jumbo v1, "open_udid_cache"

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 454
    const/4 v2, 0x0

    invoke-interface {v1, p0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 459
    :goto_0
    return-object v0

    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private c(Landroid/content/Context;)Ljava/lang/String;
    .locals 6

    .prologue
    const/4 v3, 0x0

    .line 326
    .line 328
    const-string/jumbo v0, ""

    .line 1444
    const-string/jumbo v1, "android.permission.GET_ACCOUNTS"

    invoke-virtual {p1, v1}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result v1

    .line 1445
    if-nez v1, :cond_2

    const/4 v1, 0x1

    .line 329
    :goto_0
    if-eqz v1, :cond_0

    .line 330
    invoke-static {p1}, Lcom/my/tracker/providers/c;->d(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 332
    :cond_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_5

    .line 333
    invoke-static {v0, p1}, Lcom/my/tracker/providers/c;->a(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 334
    :goto_1
    if-eqz v1, :cond_3

    .line 338
    :try_start_0
    invoke-static {}, Lcom/my/tracker/utils/e;->a()Lcom/my/tracker/utils/e;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/my/tracker/utils/e;->a(Landroid/content/Context;)Lcom/my/tracker/utils/e;

    move-result-object v0

    .line 339
    invoke-virtual {v0, v1}, Lcom/my/tracker/utils/e;->e(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 367
    :cond_1
    :goto_2
    return-object v1

    .line 1445
    :cond_2
    const/4 v1, 0x0

    goto :goto_0

    .line 340
    :catch_0
    move-exception v0

    .line 342
    const-string/jumbo v2, "PreferencesManager error"

    invoke-static {v2}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 343
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_2

    .line 349
    :cond_3
    :try_start_1
    invoke-static {}, Lcom/my/tracker/utils/e;->a()Lcom/my/tracker/utils/e;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/my/tracker/utils/e;->a(Landroid/content/Context;)Lcom/my/tracker/utils/e;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v2

    .line 350
    :try_start_2
    invoke-virtual {v2}, Lcom/my/tracker/utils/e;->f()Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2

    move-result-object v1

    .line 357
    :goto_3
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 359
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x9

    if-lt v1, v3, :cond_4

    sget-object v1, Landroid/os/Build;->SERIAL:Ljava/lang/String;

    .line 361
    :goto_4
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/my/tracker/providers/c;->d:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/my/tracker/providers/c;->c:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/tracker/utils/a;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 362
    if-eqz v2, :cond_1

    .line 364
    invoke-virtual {v2, v1}, Lcom/my/tracker/utils/e;->e(Ljava/lang/String;)V

    goto :goto_2

    .line 351
    :catch_1
    move-exception v2

    move-object v5, v2

    move-object v2, v3

    move-object v3, v5

    .line 353
    :goto_5
    const-string/jumbo v4, "PreferencesManager error"

    invoke-static {v4}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 354
    invoke-virtual {v3}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_3

    .line 359
    :cond_4
    const-string/jumbo v1, "sdk < 9"

    goto :goto_4

    .line 351
    :catch_2
    move-exception v3

    goto :goto_5

    :cond_5
    move-object v1, v3

    goto :goto_1
.end method

.method private static d(Landroid/content/Context;)Ljava/lang/String;
    .locals 3

    .prologue
    .line 372
    const/4 v0, 0x0

    .line 375
    :try_start_0
    invoke-static {p0}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v1

    const-string/jumbo v2, "com.google"

    invoke-virtual {v1, v2}, Landroid/accounts/AccountManager;->getAccountsByType(Ljava/lang/String;)[Landroid/accounts/Account;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 380
    :goto_0
    if-eqz v0, :cond_0

    array-length v1, v0

    if-lez v1, :cond_0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget-object v0, v0, Landroid/accounts/Account;->name:Ljava/lang/String;

    .line 382
    :goto_1
    return-object v0

    :cond_0
    const-string/jumbo v0, ""

    goto :goto_1

    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private static e(Landroid/content/Context;)Ljava/lang/String;
    .locals 9
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "HardwareIds"
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 391
    :try_start_0
    invoke-static {}, Lcom/my/tracker/utils/e;->a()Lcom/my/tracker/utils/e;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/my/tracker/utils/e;->a(Landroid/content/Context;)Lcom/my/tracker/utils/e;

    move-result-object v2

    .line 392
    invoke-virtual {v2}, Lcom/my/tracker/utils/e;->g()Ljava/lang/String;

    move-result-object v0

    .line 394
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 396
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "retrieving mac "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " from cache"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 438
    :cond_0
    :goto_0
    return-object v0

    .line 401
    :cond_1
    invoke-static {}, Ljava/net/NetworkInterface;->getNetworkInterfaces()Ljava/util/Enumeration;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->list(Ljava/util/Enumeration;)Ljava/util/ArrayList;

    move-result-object v0

    .line 402
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/NetworkInterface;

    .line 404
    invoke-virtual {v0}, Ljava/net/NetworkInterface;->getName()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "wlan0"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 406
    invoke-virtual {v0}, Ljava/net/NetworkInterface;->getHardwareAddress()[B

    move-result-object v3

    .line 407
    if-nez v3, :cond_3

    .line 409
    const-string/jumbo v0, "unable to retrieve mac: getHardwareAddress is null"

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 410
    const-string/jumbo v0, ""

    goto :goto_0

    .line 413
    :cond_3
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 414
    array-length v5, v3

    move v0, v1

    :goto_1
    if-ge v0, v5, :cond_4

    aget-byte v1, v3, v0

    .line 416
    const-string/jumbo v6, "%02X:"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-static {v1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v1

    aput-object v1, v7, v8

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 414
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 419
    :cond_4
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-lez v0, :cond_5

    .line 421
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 423
    :cond_5
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 425
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 427
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "succesfully retreived mac "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 428
    invoke-virtual {v2, v0}, Lcom/my/tracker/utils/e;->f(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 435
    :catch_0
    move-exception v0

    .line 437
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "unable to retreive mac: exception "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 438
    const-string/jumbo v0, ""

    goto/16 :goto_0

    .line 433
    :cond_6
    :try_start_1
    const-string/jumbo v0, "unable to retrieve mac: network interfaces does not contain wlan0"

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 434
    const-string/jumbo v0, ""
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method


# virtual methods
.method public final a(Lcom/my/tracker/builders/a;)V
    .locals 1

    .prologue
    .line 272
    iget-object v0, p0, Lcom/my/tracker/providers/c;->c:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/my/tracker/providers/c;->c:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/my/tracker/builders/a;->b(Ljava/lang/String;)V

    .line 273
    :cond_0
    iget-object v0, p0, Lcom/my/tracker/providers/c;->d:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/my/tracker/providers/c;->d:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/my/tracker/builders/a;->c(Ljava/lang/String;)V

    .line 274
    :cond_1
    iget-object v0, p0, Lcom/my/tracker/providers/c;->v:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/my/tracker/providers/c;->v:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/my/tracker/builders/a;->d(Ljava/lang/String;)V

    .line 275
    :cond_2
    iget-object v0, p0, Lcom/my/tracker/providers/c;->b:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/my/tracker/providers/c;->b:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/my/tracker/builders/a;->e(Ljava/lang/String;)V

    .line 276
    :cond_3
    iget-object v0, p0, Lcom/my/tracker/providers/c;->i:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/my/tracker/providers/c;->i:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/my/tracker/builders/a;->g(Ljava/lang/String;)V

    .line 277
    :cond_4
    iget-object v0, p0, Lcom/my/tracker/providers/c;->e:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/my/tracker/providers/c;->e:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/my/tracker/builders/a;->i(Ljava/lang/String;)V

    .line 278
    :cond_5
    iget-object v0, p0, Lcom/my/tracker/providers/c;->k:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_6

    iget-object v0, p0, Lcom/my/tracker/providers/c;->k:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/my/tracker/builders/a;->j(Ljava/lang/String;)V

    .line 279
    :cond_6
    iget-object v0, p0, Lcom/my/tracker/providers/c;->m:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_7

    iget-object v0, p0, Lcom/my/tracker/providers/c;->m:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/my/tracker/builders/a;->m(Ljava/lang/String;)V

    .line 280
    :cond_7
    iget-object v0, p0, Lcom/my/tracker/providers/c;->j:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_8

    iget-object v0, p0, Lcom/my/tracker/providers/c;->j:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/my/tracker/builders/a;->l(Ljava/lang/String;)V

    .line 281
    :cond_8
    iget-object v0, p0, Lcom/my/tracker/providers/c;->r:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_9

    iget-object v0, p0, Lcom/my/tracker/providers/c;->r:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/my/tracker/builders/a;->n(Ljava/lang/String;)V

    .line 282
    :cond_9
    iget-object v0, p0, Lcom/my/tracker/providers/c;->s:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_a

    iget-object v0, p0, Lcom/my/tracker/providers/c;->s:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/my/tracker/builders/a;->o(Ljava/lang/String;)V

    .line 283
    :cond_a
    iget-object v0, p0, Lcom/my/tracker/providers/c;->t:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_b

    iget-object v0, p0, Lcom/my/tracker/providers/c;->t:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/my/tracker/builders/a;->p(Ljava/lang/String;)V

    .line 284
    :cond_b
    iget-object v0, p0, Lcom/my/tracker/providers/c;->u:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_c

    iget-object v0, p0, Lcom/my/tracker/providers/c;->u:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/my/tracker/builders/a;->k(Ljava/lang/String;)V

    .line 285
    :cond_c
    iget-object v0, p0, Lcom/my/tracker/providers/c;->f:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_d

    iget-object v0, p0, Lcom/my/tracker/providers/c;->f:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/my/tracker/builders/a;->q(Ljava/lang/String;)V

    .line 286
    :cond_d
    iget-object v0, p0, Lcom/my/tracker/providers/c;->h:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_e

    iget-object v0, p0, Lcom/my/tracker/providers/c;->h:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/my/tracker/builders/a;->r(Ljava/lang/String;)V

    .line 287
    :cond_e
    iget-object v0, p0, Lcom/my/tracker/providers/c;->g:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_f

    iget-object v0, p0, Lcom/my/tracker/providers/c;->g:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/my/tracker/builders/a;->s(Ljava/lang/String;)V

    .line 288
    :cond_f
    iget-object v0, p0, Lcom/my/tracker/providers/c;->l:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_10

    iget-object v0, p0, Lcom/my/tracker/providers/c;->l:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/my/tracker/builders/a;->t(Ljava/lang/String;)V

    .line 289
    :cond_10
    iget-object v0, p0, Lcom/my/tracker/providers/c;->w:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_11

    iget-object v0, p0, Lcom/my/tracker/providers/c;->w:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/my/tracker/builders/a;->h(Ljava/lang/String;)V

    .line 290
    :cond_11
    const-string/jumbo v0, "Android"

    invoke-virtual {p1, v0}, Lcom/my/tracker/builders/a;->f(Ljava/lang/String;)V

    .line 291
    iget v0, p0, Lcom/my/tracker/providers/c;->n:I

    invoke-virtual {p1, v0}, Lcom/my/tracker/builders/a;->a(I)V

    .line 292
    iget v0, p0, Lcom/my/tracker/providers/c;->o:I

    invoke-virtual {p1, v0}, Lcom/my/tracker/builders/a;->b(I)V

    .line 293
    iget v0, p0, Lcom/my/tracker/providers/c;->p:I

    invoke-virtual {p1, v0}, Lcom/my/tracker/builders/a;->c(I)V

    .line 294
    iget v0, p0, Lcom/my/tracker/providers/c;->q:F

    invoke-virtual {p1, v0}, Lcom/my/tracker/builders/a;->a(F)V

    .line 295
    return-void
.end method

.method public final b(Landroid/content/Context;)V
    .locals 5

    .prologue
    const/4 v3, 0x3

    const/4 v4, 0x0

    .line 194
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_1

    .line 196
    const-string/jumbo v0, "DeviceParamsDataProvider: You must not call collectData method from main thread"

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 268
    :cond_0
    :goto_0
    return-void

    .line 200
    :cond_1
    iget-boolean v0, p0, Lcom/my/tracker/providers/c;->a:Z

    if-nez v0, :cond_0

    .line 202
    const-string/jumbo v0, "collect application info..."

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 203
    sget-object v0, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    iput-object v0, p0, Lcom/my/tracker/providers/c;->b:Ljava/lang/String;

    .line 204
    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    iput-object v0, p0, Lcom/my/tracker/providers/c;->i:Ljava/lang/String;

    .line 205
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    iput-object v0, p0, Lcom/my/tracker/providers/c;->j:Ljava/lang/String;

    .line 207
    sget-object v0, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    iput-object v0, p0, Lcom/my/tracker/providers/c;->e:Ljava/lang/String;

    .line 208
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/my/tracker/providers/c;->f:Ljava/lang/String;

    .line 209
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/my/tracker/providers/c;->k:Ljava/lang/String;

    .line 210
    invoke-static {p1}, Lcom/my/tracker/providers/c;->e(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/my/tracker/providers/c;->w:Ljava/lang/String;

    .line 213
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iget-object v1, p0, Lcom/my/tracker/providers/c;->f:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 214
    iget-object v1, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    iput-object v1, p0, Lcom/my/tracker/providers/c;->h:Ljava/lang/String;

    .line 215
    iget v0, v0, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/my/tracker/providers/c;->g:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    .line 220
    :goto_1
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 221
    if-eqz v0, :cond_2

    .line 223
    const-string/jumbo v1, "android_id"

    invoke-static {v0, v1}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/my/tracker/providers/c;->d:Ljava/lang/String;

    .line 224
    iget-object v0, p0, Lcom/my/tracker/providers/c;->d:Ljava/lang/String;

    if-nez v0, :cond_2

    .line 226
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/my/tracker/providers/c;->d:Ljava/lang/String;

    .line 229
    :cond_2
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget-object v0, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/my/tracker/providers/c;->l:Ljava/lang/String;

    .line 230
    const-string/jumbo v0, "phone"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 231
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getNetworkOperatorName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/my/tracker/providers/c;->s:Ljava/lang/String;

    .line 232
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getNetworkOperator()Ljava/lang/String;

    move-result-object v1

    .line 233
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_6

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-le v2, v3, :cond_6

    .line 235
    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/my/tracker/providers/c;->r:Ljava/lang/String;

    .line 236
    invoke-virtual {v1, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/my/tracker/providers/c;->m:Ljava/lang/String;

    .line 243
    :goto_2
    :try_start_1
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/my/tracker/providers/c;->c:Ljava/lang/String;

    .line 244
    iget-object v1, p0, Lcom/my/tracker/providers/c;->c:Ljava/lang/String;

    if-nez v1, :cond_3

    const-string/jumbo v1, ""

    iput-object v1, p0, Lcom/my/tracker/providers/c;->c:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_0

    .line 249
    :cond_3
    :goto_3
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSimState()I

    move-result v1

    const/4 v2, 0x5

    if-ne v1, v2, :cond_4

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSimOperator()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/my/tracker/providers/c;->t:Ljava/lang/String;

    .line 1299
    :cond_4
    iget-boolean v0, p0, Lcom/my/tracker/providers/c;->a:Z

    if-nez v0, :cond_5

    .line 1301
    const-string/jumbo v0, "window"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    .line 1302
    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 1304
    new-instance v1, Landroid/graphics/Point;

    invoke-direct {v1}, Landroid/graphics/Point;-><init>()V

    .line 1306
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x11

    if-lt v2, v3, :cond_7

    .line 1308
    invoke-virtual {v0, v1}, Landroid/view/Display;->getRealSize(Landroid/graphics/Point;)V

    .line 1320
    :goto_4
    iget v0, v1, Landroid/graphics/Point;->x:I

    iput v0, p0, Lcom/my/tracker/providers/c;->n:I

    .line 1321
    iget v0, v1, Landroid/graphics/Point;->y:I

    iput v0, p0, Lcom/my/tracker/providers/c;->o:I

    .line 253
    :cond_5
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 254
    iget v1, v0, Landroid/util/DisplayMetrics;->densityDpi:I

    iput v1, p0, Lcom/my/tracker/providers/c;->p:I

    .line 255
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    iput v0, p0, Lcom/my/tracker/providers/c;->q:F

    .line 257
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v0

    .line 258
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v4, v4}, Ljava/util/TimeZone;->getDisplayName(ZI)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/util/TimeZone;->getID()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/my/tracker/providers/c;->u:Ljava/lang/String;

    .line 260
    invoke-direct {p0, p1}, Lcom/my/tracker/providers/c;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/my/tracker/providers/c;->v:Ljava/lang/String;

    .line 266
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/my/tracker/providers/c;->a:Z

    .line 267
    const-string/jumbo v0, "collected"

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 239
    :cond_6
    iput-object v1, p0, Lcom/my/tracker/providers/c;->r:Ljava/lang/String;

    goto/16 :goto_2

    .line 247
    :catch_0
    move-exception v1

    const-string/jumbo v1, "No permissions for access to phone state"

    invoke-static {v1}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    goto/16 :goto_3

    .line 1310
    :cond_7
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xd

    if-lt v2, v3, :cond_8

    .line 1312
    invoke-virtual {v0, v1}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    goto :goto_4

    .line 1316
    :cond_8
    invoke-virtual {v0}, Landroid/view/Display;->getWidth()I

    move-result v2

    iput v2, v1, Landroid/graphics/Point;->x:I

    .line 1317
    invoke-virtual {v0}, Landroid/view/Display;->getHeight()I

    move-result v0

    iput v0, v1, Landroid/graphics/Point;->y:I

    goto :goto_4

    :catch_1
    move-exception v0

    goto/16 :goto_1
.end method
