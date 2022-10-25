.class Lcom/wmspanel/libstream/e;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/wmspanel/libstream/e$a;
    }
.end annotation


# static fields
.field static final V:[I

.field static final W:[I


# instance fields
.field R:[B

.field S:I

.field T:I

.field U:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 372
    const/16 v0, 0x8

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/wmspanel/libstream/e;->V:[I

    .line 383
    const/16 v0, 0x9

    new-array v0, v0, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/wmspanel/libstream/e;->W:[I

    return-void

    .line 372
    nop

    :array_0
    .array-data 4
        0xff
        0x7f
        0x3f
        0x1f
        0xf
        0x7
        0x3
        0x1
    .end array-data

    .line 383
    :array_1
    .array-data 4
        0x0
        0x80
        0xc0
        0xe0
        0xf0
        0xf8
        0xfc
        0xfe
        0xff
    .end array-data
.end method

.method constructor <init>([BI)V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 341
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 336
    iput v0, p0, Lcom/wmspanel/libstream/e;->T:I

    .line 337
    iput v0, p0, Lcom/wmspanel/libstream/e;->U:I

    .line 342
    iput-object p1, p0, Lcom/wmspanel/libstream/e;->R:[B

    .line 343
    iput p2, p0, Lcom/wmspanel/libstream/e;->S:I

    .line 344
    return-void
.end method


# virtual methods
.method A()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/wmspanel/libstream/e$a;
        }
    .end annotation

    .prologue
    .line 398
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/e;->c(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 399
    new-instance v0, Lcom/wmspanel/libstream/e$a;

    invoke-direct {v0}, Lcom/wmspanel/libstream/e$a;-><init>()V

    throw v0

    .line 402
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/e;->R:[B

    iget v1, p0, Lcom/wmspanel/libstream/e;->T:I

    aget-byte v0, v0, v1

    .line 404
    iget v1, p0, Lcom/wmspanel/libstream/e;->U:I

    if-eqz v1, :cond_1

    .line 405
    sget-object v1, Lcom/wmspanel/libstream/e;->V:[I

    iget v2, p0, Lcom/wmspanel/libstream/e;->U:I

    aget v1, v1, v2

    and-int/2addr v0, v1

    iget v1, p0, Lcom/wmspanel/libstream/e;->U:I

    shl-int/2addr v0, v1

    .line 406
    iget-object v1, p0, Lcom/wmspanel/libstream/e;->R:[B

    iget v2, p0, Lcom/wmspanel/libstream/e;->T:I

    add-int/lit8 v2, v2, 0x1

    aget-byte v1, v1, v2

    sget-object v2, Lcom/wmspanel/libstream/e;->W:[I

    iget v3, p0, Lcom/wmspanel/libstream/e;->U:I

    aget v2, v2, v3

    and-int/2addr v1, v2

    iget v2, p0, Lcom/wmspanel/libstream/e;->U:I

    rsub-int/lit8 v2, v2, 0x8

    shr-int/2addr v1, v2

    .line 407
    iget v2, p0, Lcom/wmspanel/libstream/e;->T:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/wmspanel/libstream/e;->T:I

    .line 408
    or-int/2addr v0, v1

    .line 413
    :goto_0
    return v0

    .line 410
    :cond_1
    iget v1, p0, Lcom/wmspanel/libstream/e;->T:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/wmspanel/libstream/e;->T:I

    goto :goto_0
.end method

.method B()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/wmspanel/libstream/e$a;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 447
    invoke-virtual {p0, v2}, Lcom/wmspanel/libstream/e;->c(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 448
    new-instance v0, Lcom/wmspanel/libstream/e$a;

    invoke-direct {v0}, Lcom/wmspanel/libstream/e$a;-><init>()V

    throw v0

    .line 451
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/e;->R:[B

    iget v1, p0, Lcom/wmspanel/libstream/e;->T:I

    aget-byte v0, v0, v1

    .line 452
    iget v1, p0, Lcom/wmspanel/libstream/e;->U:I

    rsub-int/lit8 v1, v1, 0x7

    shr-int/2addr v0, v1

    and-int/lit8 v0, v0, 0x1

    .line 453
    invoke-virtual {p0, v2}, Lcom/wmspanel/libstream/e;->b(I)V

    .line 454
    return v0
.end method

.method C()I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/wmspanel/libstream/e$a;
        }
    .end annotation

    .prologue
    const/16 v3, 0x1f

    const/4 v0, 0x0

    .line 460
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->B()I

    move-result v1

    move v2, v0

    .line 461
    :goto_0
    if-nez v1, :cond_0

    if-gt v2, v3, :cond_0

    .line 462
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->B()I

    move-result v1

    .line 461
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 465
    :cond_0
    if-eqz v1, :cond_1

    if-le v2, v3, :cond_2

    .line 466
    :cond_1
    new-instance v0, Lcom/wmspanel/libstream/e$a;

    invoke-direct {v0}, Lcom/wmspanel/libstream/e$a;-><init>()V

    throw v0

    :cond_2
    move v1, v2

    .line 472
    :goto_1
    const/16 v3, 0x8

    if-lt v1, v3, :cond_3

    .line 473
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->A()I

    move-result v3

    .line 474
    add-int/lit8 v4, v1, -0x8

    shl-int/2addr v3, v4

    add-int/2addr v3, v0

    .line 472
    add-int/lit8 v0, v1, -0x8

    move v1, v0

    move v0, v3

    goto :goto_1

    .line 477
    :cond_3
    if-lez v1, :cond_4

    .line 478
    invoke-virtual {p0, v1}, Lcom/wmspanel/libstream/e;->d(I)I

    move-result v1

    .line 479
    add-int/2addr v0, v1

    .line 482
    :cond_4
    const/4 v1, 0x1

    shl-int/2addr v1, v2

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, -0x1

    .line 483
    return v0
.end method

.method D()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/wmspanel/libstream/e$a;
        }
    .end annotation

    .prologue
    .line 489
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->C()I

    move-result v0

    .line 491
    if-nez v0, :cond_0

    .line 492
    const/4 v0, 0x0

    .line 503
    :goto_0
    return v0

    .line 496
    :cond_0
    div-int/lit8 v1, v0, 0x2

    .line 498
    and-int/lit8 v0, v0, 0x1

    if-nez v0, :cond_1

    .line 499
    neg-int v0, v1

    .line 500
    goto :goto_0

    .line 502
    :cond_1
    add-int/lit8 v0, v1, 0x1

    .line 503
    goto :goto_0
.end method

.method b(I)V
    .locals 2

    .prologue
    .line 347
    iget v0, p0, Lcom/wmspanel/libstream/e;->T:I

    div-int/lit8 v1, p1, 0x8

    add-int/2addr v0, v1

    iput v0, p0, Lcom/wmspanel/libstream/e;->T:I

    .line 348
    iget v0, p0, Lcom/wmspanel/libstream/e;->U:I

    rem-int/lit8 v1, p1, 0x8

    add-int/2addr v0, v1

    iput v0, p0, Lcom/wmspanel/libstream/e;->U:I

    .line 350
    iget v0, p0, Lcom/wmspanel/libstream/e;->T:I

    iget v1, p0, Lcom/wmspanel/libstream/e;->U:I

    div-int/lit8 v1, v1, 0x8

    add-int/2addr v0, v1

    iput v0, p0, Lcom/wmspanel/libstream/e;->T:I

    .line 351
    iget v0, p0, Lcom/wmspanel/libstream/e;->U:I

    rem-int/lit8 v0, v0, 0x8

    iput v0, p0, Lcom/wmspanel/libstream/e;->U:I

    .line 352
    return-void
.end method

.method c(I)Z
    .locals 5

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 355
    if-gtz p1, :cond_1

    .line 368
    :cond_0
    :goto_0
    return v1

    .line 357
    :cond_1
    iget v2, p0, Lcom/wmspanel/libstream/e;->T:I

    div-int/lit8 v3, p1, 0x8

    add-int/2addr v2, v3

    .line 358
    iget v3, p0, Lcom/wmspanel/libstream/e;->U:I

    rem-int/lit8 v4, p1, 0x8

    add-int/2addr v3, v4

    .line 360
    div-int/lit8 v4, v3, 0x8

    add-int/2addr v2, v4

    .line 361
    rem-int/lit8 v3, v3, 0x8

    .line 363
    iget v3, p0, Lcom/wmspanel/libstream/e;->S:I

    if-gt v2, v3, :cond_0

    .line 365
    iget v3, p0, Lcom/wmspanel/libstream/e;->S:I

    if-ge v2, v3, :cond_2

    move v1, v0

    .line 366
    goto :goto_0

    .line 368
    :cond_2
    iget v2, p0, Lcom/wmspanel/libstream/e;->U:I

    if-nez v2, :cond_3

    :goto_1
    move v1, v0

    goto :goto_0

    :cond_3
    move v0, v1

    goto :goto_1
.end method

.method d(I)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/wmspanel/libstream/e$a;
        }
    .end annotation

    .prologue
    .line 419
    invoke-virtual {p0, p1}, Lcom/wmspanel/libstream/e;->c(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 420
    new-instance v0, Lcom/wmspanel/libstream/e$a;

    invoke-direct {v0}, Lcom/wmspanel/libstream/e$a;-><init>()V

    throw v0

    .line 423
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/e;->R:[B

    iget v1, p0, Lcom/wmspanel/libstream/e;->T:I

    aget-byte v0, v0, v1

    .line 425
    iget v1, p0, Lcom/wmspanel/libstream/e;->U:I

    if-eqz v1, :cond_2

    .line 426
    iget v1, p0, Lcom/wmspanel/libstream/e;->U:I

    rsub-int/lit8 v1, v1, 0x8

    if-le p1, v1, :cond_1

    .line 427
    iget v1, p0, Lcom/wmspanel/libstream/e;->U:I

    rsub-int/lit8 v1, v1, 0x8

    sub-int v1, p1, v1

    .line 429
    sget-object v2, Lcom/wmspanel/libstream/e;->V:[I

    iget v3, p0, Lcom/wmspanel/libstream/e;->U:I

    aget v2, v2, v3

    and-int/2addr v0, v2

    shl-int/2addr v0, v1

    .line 430
    iget-object v2, p0, Lcom/wmspanel/libstream/e;->R:[B

    iget v3, p0, Lcom/wmspanel/libstream/e;->T:I

    add-int/lit8 v3, v3, 0x1

    aget-byte v2, v2, v3

    sget-object v3, Lcom/wmspanel/libstream/e;->W:[I

    aget v3, v3, v1

    and-int/2addr v2, v3

    rsub-int/lit8 v1, v1, 0x8

    shr-int v1, v2, v1

    .line 432
    add-int/2addr v0, v1

    .line 433
    invoke-virtual {p0, p1}, Lcom/wmspanel/libstream/e;->b(I)V

    .line 443
    :goto_0
    return v0

    .line 435
    :cond_1
    sget-object v1, Lcom/wmspanel/libstream/e;->V:[I

    iget v2, p0, Lcom/wmspanel/libstream/e;->U:I

    aget v1, v1, v2

    and-int/2addr v0, v1

    sget-object v1, Lcom/wmspanel/libstream/e;->W:[I

    iget v2, p0, Lcom/wmspanel/libstream/e;->U:I

    add-int/2addr v2, p1

    aget v1, v1, v2

    and-int/2addr v0, v1

    iget v1, p0, Lcom/wmspanel/libstream/e;->U:I

    rsub-int/lit8 v1, v1, 0x8

    sub-int/2addr v1, p1

    shr-int/2addr v0, v1

    .line 437
    invoke-virtual {p0, p1}, Lcom/wmspanel/libstream/e;->b(I)V

    goto :goto_0

    .line 440
    :cond_2
    sget-object v1, Lcom/wmspanel/libstream/e;->W:[I

    aget v1, v1, p1

    and-int/2addr v0, v1

    rsub-int/lit8 v1, p1, 0x8

    shr-int/2addr v0, v1

    .line 441
    invoke-virtual {p0, p1}, Lcom/wmspanel/libstream/e;->b(I)V

    goto :goto_0
.end method

.method skip(I)V
    .locals 1
    .param p1, "skip"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/wmspanel/libstream/e$a;
        }
    .end annotation

    .prologue
    .line 507
    invoke-virtual {p0, p1}, Lcom/wmspanel/libstream/e;->c(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 508
    new-instance v0, Lcom/wmspanel/libstream/e$a;

    invoke-direct {v0}, Lcom/wmspanel/libstream/e$a;-><init>()V

    throw v0

    .line 510
    :cond_0
    invoke-virtual {p0, p1}, Lcom/wmspanel/libstream/e;->b(I)V

    .line 511
    return-void
.end method
