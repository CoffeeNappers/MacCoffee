.class public final Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;
.super Ljava/lang/Object;
.source "CharsToNameCanonicalizer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$TableInfo;,
        Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;
    }
.end annotation


# static fields
.field private static final DEFAULT_T_SIZE:I = 0x40

.field public static final HASH_MULT:I = 0x21

.field static final MAX_COLL_CHAIN_LENGTH:I = 0x64

.field static final MAX_ENTRIES_FOR_REUSE:I = 0x2ee0

.field private static final MAX_T_SIZE:I = 0x10000


# instance fields
.field private _buckets:[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

.field private _canonicalize:Z

.field private final _flags:I

.field private _hashShared:Z

.field private _indexMask:I

.field private _longestCollisionList:I

.field private _overflows:Ljava/util/BitSet;

.field private final _parent:Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;

.field private final _seed:I

.field private _size:I

.field private _sizeThreshold:I

.field private _symbols:[Ljava/lang/String;

.field private final _tableInfo:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$TableInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(I)V
    .locals 2
    .param p1, "seed"    # I

    .prologue
    const/4 v1, 0x0

    .line 232
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 233
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_parent:Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;

    .line 234
    iput p1, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_seed:I

    .line 237
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_canonicalize:Z

    .line 238
    const/4 v0, -0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_flags:I

    .line 240
    iput-boolean v1, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_hashShared:Z

    .line 241
    iput v1, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_longestCollisionList:I

    .line 243
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/16 v1, 0x40

    invoke-static {v1}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$TableInfo;->createInitial(I)Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$TableInfo;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_tableInfo:Ljava/util/concurrent/atomic/AtomicReference;

    .line 246
    return-void
.end method

.method private constructor <init>(Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;IILcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$TableInfo;)V
    .locals 2
    .param p1, "parent"    # Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;
    .param p2, "flags"    # I
    .param p3, "seed"    # I
    .param p4, "parentState"    # Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$TableInfo;

    .prologue
    .line 253
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 254
    iput-object p1, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_parent:Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;

    .line 255
    iput p3, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_seed:I

    .line 256
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_tableInfo:Ljava/util/concurrent/atomic/AtomicReference;

    .line 257
    iput p2, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_flags:I

    .line 258
    sget-object v1, Lcom/fasterxml/jackson/core/JsonFactory$Feature;->CANONICALIZE_FIELD_NAMES:Lcom/fasterxml/jackson/core/JsonFactory$Feature;

    invoke-virtual {v1, p2}, Lcom/fasterxml/jackson/core/JsonFactory$Feature;->enabledIn(I)Z

    move-result v1

    iput-boolean v1, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_canonicalize:Z

    .line 261
    iget-object v1, p4, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$TableInfo;->symbols:[Ljava/lang/String;

    iput-object v1, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_symbols:[Ljava/lang/String;

    .line 262
    iget-object v1, p4, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$TableInfo;->buckets:[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    iput-object v1, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_buckets:[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    .line 264
    iget v1, p4, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$TableInfo;->size:I

    iput v1, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_size:I

    .line 265
    iget v1, p4, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$TableInfo;->longestCollisionList:I

    iput v1, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_longestCollisionList:I

    .line 268
    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_symbols:[Ljava/lang/String;

    array-length v0, v1

    .line 269
    .local v0, "arrayLen":I
    invoke-static {v0}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_thresholdSize(I)I

    move-result v1

    iput v1, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_sizeThreshold:I

    .line 270
    add-int/lit8 v1, v0, -0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_indexMask:I

    .line 273
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_hashShared:Z

    .line 274
    return-void
.end method

.method private _addSymbol([CIIII)Ljava/lang/String;
    .locals 6
    .param p1, "buffer"    # [C
    .param p2, "start"    # I
    .param p3, "len"    # I
    .param p4, "h"    # I
    .param p5, "index"    # I

    .prologue
    .line 479
    iget-boolean v4, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_hashShared:Z

    if-eqz v4, :cond_2

    .line 480
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->copyArrays()V

    .line 481
    const/4 v4, 0x0

    iput-boolean v4, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_hashShared:Z

    .line 490
    :cond_0
    :goto_0
    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    .line 491
    .local v3, "newSymbol":Ljava/lang/String;
    sget-object v4, Lcom/fasterxml/jackson/core/JsonFactory$Feature;->INTERN_FIELD_NAMES:Lcom/fasterxml/jackson/core/JsonFactory$Feature;

    iget v5, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_flags:I

    invoke-virtual {v4, v5}, Lcom/fasterxml/jackson/core/JsonFactory$Feature;->enabledIn(I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 492
    sget-object v4, Lcom/fasterxml/jackson/core/util/InternCache;->instance:Lcom/fasterxml/jackson/core/util/InternCache;

    invoke-virtual {v4, v3}, Lcom/fasterxml/jackson/core/util/InternCache;->intern(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 494
    :cond_1
    iget v4, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_size:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_size:I

    .line 496
    iget-object v4, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_symbols:[Ljava/lang/String;

    aget-object v4, v4, p5

    if-nez v4, :cond_3

    .line 497
    iget-object v4, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_symbols:[Ljava/lang/String;

    aput-object v3, v4, p5

    .line 511
    :goto_1
    return-object v3

    .line 482
    .end local v3    # "newSymbol":Ljava/lang/String;
    :cond_2
    iget v4, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_size:I

    iget v5, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_sizeThreshold:I

    if-lt v4, v5, :cond_0

    .line 483
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->rehash()V

    .line 487
    invoke-virtual {p0, p1, p2, p3}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->calcHash([CII)I

    move-result v4

    invoke-virtual {p0, v4}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_hashToIndex(I)I

    move-result p5

    goto :goto_0

    .line 499
    .restart local v3    # "newSymbol":Ljava/lang/String;
    :cond_3
    shr-int/lit8 v0, p5, 0x1

    .line 500
    .local v0, "bix":I
    new-instance v2, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    iget-object v4, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_buckets:[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    aget-object v4, v4, v0

    invoke-direct {v2, v3, v4}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;-><init>(Ljava/lang/String;Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;)V

    .line 501
    .local v2, "newB":Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;
    iget v1, v2, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;->length:I

    .line 502
    .local v1, "collLen":I
    const/16 v4, 0x64

    if-le v1, v4, :cond_4

    .line 505
    invoke-direct {p0, v0, v2}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_handleSpillOverflow(ILcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;)V

    goto :goto_1

    .line 507
    :cond_4
    iget-object v4, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_buckets:[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    aput-object v2, v4, v0

    .line 508
    iget v4, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_longestCollisionList:I

    invoke-static {v1, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    iput v4, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_longestCollisionList:I

    goto :goto_1
.end method

.method private _findSymbol2([CIILcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;)Ljava/lang/String;
    .locals 1
    .param p1, "buffer"    # [C
    .param p2, "start"    # I
    .param p3, "len"    # I
    .param p4, "b"    # Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    .prologue
    .line 467
    :goto_0
    if-eqz p4, :cond_1

    .line 468
    invoke-virtual {p4, p1, p2, p3}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;->has([CII)Ljava/lang/String;

    move-result-object v0

    .line 469
    .local v0, "sym":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 474
    .end local v0    # "sym":Ljava/lang/String;
    :goto_1
    return-object v0

    .line 472
    .restart local v0    # "sym":Ljava/lang/String;
    :cond_0
    iget-object p4, p4, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;->next:Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    .line 473
    goto :goto_0

    .line 474
    .end local v0    # "sym":Ljava/lang/String;
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method private _handleSpillOverflow(ILcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;)V
    .locals 3
    .param p1, "bindex"    # I
    .param p2, "newBucket"    # Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    .prologue
    .line 516
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_overflows:Ljava/util/BitSet;

    if-nez v0, :cond_0

    .line 517
    new-instance v0, Ljava/util/BitSet;

    invoke-direct {v0}, Ljava/util/BitSet;-><init>()V

    iput-object v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_overflows:Ljava/util/BitSet;

    .line 518
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_overflows:Ljava/util/BitSet;

    invoke-virtual {v0, p1}, Ljava/util/BitSet;->set(I)V

    .line 532
    :goto_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_symbols:[Ljava/lang/String;

    add-int v1, p1, p1

    iget-object v2, p2, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;->symbol:Ljava/lang/String;

    aput-object v2, v0, v1

    .line 533
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_buckets:[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    const/4 v1, 0x0

    aput-object v1, v0, p1

    .line 535
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_size:I

    iget v1, p2, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;->length:I

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_size:I

    .line 537
    const/4 v0, -0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_longestCollisionList:I

    .line 538
    return-void

    .line 520
    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_overflows:Ljava/util/BitSet;

    invoke-virtual {v0, p1}, Ljava/util/BitSet;->get(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 522
    sget-object v0, Lcom/fasterxml/jackson/core/JsonFactory$Feature;->FAIL_ON_SYMBOL_HASH_OVERFLOW:Lcom/fasterxml/jackson/core/JsonFactory$Feature;

    iget v1, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_flags:I

    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/core/JsonFactory$Feature;->enabledIn(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 523
    const/16 v0, 0x64

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->reportTooManyCollisions(I)V

    .line 526
    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_canonicalize:Z

    goto :goto_0

    .line 528
    :cond_2
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_overflows:Ljava/util/BitSet;

    invoke-virtual {v0, p1}, Ljava/util/BitSet;->set(I)V

    goto :goto_0
.end method

.method private static _thresholdSize(I)I
    .locals 1
    .param p0, "hashAreaSize"    # I

    .prologue
    .line 276
    shr-int/lit8 v0, p0, 0x2

    sub-int v0, p0, v0

    return v0
.end method

.method static synthetic access$000(Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;)I
    .locals 1
    .param p0, "x0"    # Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;

    .prologue
    .line 45
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_size:I

    return v0
.end method

.method static synthetic access$100(Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;)I
    .locals 1
    .param p0, "x0"    # Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;

    .prologue
    .line 45
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_longestCollisionList:I

    return v0
.end method

.method static synthetic access$200(Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;)[Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_symbols:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;)[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;
    .locals 1
    .param p0, "x0"    # Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_buckets:[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    return-object v0
.end method

.method private copyArrays()V
    .locals 3

    .prologue
    .line 593
    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_symbols:[Ljava/lang/String;

    .line 594
    .local v1, "oldSyms":[Ljava/lang/String;
    array-length v2, v1

    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    iput-object v2, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_symbols:[Ljava/lang/String;

    .line 595
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_buckets:[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    .line 596
    .local v0, "oldBuckets":[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;
    array-length v2, v0

    invoke-static {v0, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    iput-object v2, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_buckets:[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    .line 597
    return-void
.end method

.method public static createRoot()Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;
    .locals 6

    .prologue
    .line 293
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 295
    .local v0, "now":J
    long-to-int v3, v0

    const/16 v4, 0x20

    ushr-long v4, v0, v4

    long-to-int v4, v4

    add-int/2addr v3, v4

    or-int/lit8 v2, v3, 0x1

    .line 296
    .local v2, "seed":I
    invoke-static {v2}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->createRoot(I)Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;

    move-result-object v3

    return-object v3
.end method

.method protected static createRoot(I)Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;
    .locals 1
    .param p0, "seed"    # I

    .prologue
    .line 300
    new-instance v0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;

    invoke-direct {v0, p0}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;-><init>(I)V

    return-object v0
.end method

.method private mergeChild(Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$TableInfo;)V
    .locals 3
    .param p1, "childState"    # Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$TableInfo;

    .prologue
    .line 346
    iget v0, p1, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$TableInfo;->size:I

    .line 347
    .local v0, "childCount":I
    iget-object v2, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_tableInfo:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$TableInfo;

    .line 351
    .local v1, "currState":Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$TableInfo;
    iget v2, v1, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$TableInfo;->size:I

    if-ne v0, v2, :cond_0

    .line 363
    :goto_0
    return-void

    .line 358
    :cond_0
    const/16 v2, 0x2ee0

    if-le v0, v2, :cond_1

    .line 360
    const/16 v2, 0x40

    invoke-static {v2}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$TableInfo;->createInitial(I)Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$TableInfo;

    move-result-object p1

    .line 362
    :cond_1
    iget-object v2, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_tableInfo:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2, v1, p1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method private rehash()V
    .locals 18

    .prologue
    .line 607
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_symbols:[Ljava/lang/String;

    array-length v11, v13

    .line 608
    .local v11, "size":I
    add-int v8, v11, v11

    .line 614
    .local v8, "newSize":I
    const/high16 v13, 0x10000

    if-le v8, v13, :cond_1

    .line 617
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput v13, v0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_size:I

    .line 618
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_canonicalize:Z

    .line 620
    const/16 v13, 0x40

    new-array v13, v13, [Ljava/lang/String;

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_symbols:[Ljava/lang/String;

    .line 621
    const/16 v13, 0x20

    new-array v13, v13, [Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_buckets:[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    .line 622
    const/16 v13, 0x3f

    move-object/from16 v0, p0

    iput v13, v0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_indexMask:I

    .line 623
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_hashShared:Z

    .line 682
    :cond_0
    return-void

    .line 627
    :cond_1
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_symbols:[Ljava/lang/String;

    .line 628
    .local v10, "oldSyms":[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_buckets:[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    .line 629
    .local v9, "oldBuckets":[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;
    new-array v13, v8, [Ljava/lang/String;

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_symbols:[Ljava/lang/String;

    .line 630
    shr-int/lit8 v13, v8, 0x1

    new-array v13, v13, [Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_buckets:[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    .line 632
    add-int/lit8 v13, v8, -0x1

    move-object/from16 v0, p0

    iput v13, v0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_indexMask:I

    .line 633
    invoke-static {v8}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_thresholdSize(I)I

    move-result v13

    move-object/from16 v0, p0

    iput v13, v0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_sizeThreshold:I

    .line 635
    const/4 v3, 0x0

    .line 639
    .local v3, "count":I
    const/4 v6, 0x0

    .line 640
    .local v6, "maxColl":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    if-ge v4, v11, :cond_4

    .line 641
    aget-object v12, v10, v4

    .line 642
    .local v12, "symbol":Ljava/lang/String;
    if-eqz v12, :cond_2

    .line 643
    add-int/lit8 v3, v3, 0x1

    .line 644
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->calcHash(Ljava/lang/String;)I

    move-result v13

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_hashToIndex(I)I

    move-result v5

    .line 645
    .local v5, "index":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_symbols:[Ljava/lang/String;

    aget-object v13, v13, v5

    if-nez v13, :cond_3

    .line 646
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_symbols:[Ljava/lang/String;

    aput-object v12, v13, v5

    .line 640
    .end local v5    # "index":I
    :cond_2
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 648
    .restart local v5    # "index":I
    :cond_3
    shr-int/lit8 v2, v5, 0x1

    .line 649
    .local v2, "bix":I
    new-instance v7, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_buckets:[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    aget-object v13, v13, v2

    invoke-direct {v7, v12, v13}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;-><init>(Ljava/lang/String;Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;)V

    .line 650
    .local v7, "newB":Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_buckets:[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    aput-object v7, v13, v2

    .line 651
    iget v13, v7, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;->length:I

    invoke-static {v6, v13}, Ljava/lang/Math;->max(II)I

    move-result v6

    goto :goto_1

    .line 656
    .end local v2    # "bix":I
    .end local v5    # "index":I
    .end local v7    # "newB":Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;
    .end local v12    # "symbol":Ljava/lang/String;
    :cond_4
    shr-int/lit8 v11, v11, 0x1

    .line 657
    const/4 v4, 0x0

    :goto_2
    if-ge v4, v11, :cond_7

    .line 658
    aget-object v1, v9, v4

    .line 659
    .local v1, "b":Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;
    :goto_3
    if-eqz v1, :cond_6

    .line 660
    add-int/lit8 v3, v3, 0x1

    .line 661
    iget-object v12, v1, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;->symbol:Ljava/lang/String;

    .line 662
    .restart local v12    # "symbol":Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->calcHash(Ljava/lang/String;)I

    move-result v13

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_hashToIndex(I)I

    move-result v5

    .line 663
    .restart local v5    # "index":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_symbols:[Ljava/lang/String;

    aget-object v13, v13, v5

    if-nez v13, :cond_5

    .line 664
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_symbols:[Ljava/lang/String;

    aput-object v12, v13, v5

    .line 671
    :goto_4
    iget-object v1, v1, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;->next:Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    .line 672
    goto :goto_3

    .line 666
    :cond_5
    shr-int/lit8 v2, v5, 0x1

    .line 667
    .restart local v2    # "bix":I
    new-instance v7, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_buckets:[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    aget-object v13, v13, v2

    invoke-direct {v7, v12, v13}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;-><init>(Ljava/lang/String;Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;)V

    .line 668
    .restart local v7    # "newB":Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_buckets:[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    aput-object v7, v13, v2

    .line 669
    iget v13, v7, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;->length:I

    invoke-static {v6, v13}, Ljava/lang/Math;->max(II)I

    move-result v6

    goto :goto_4

    .line 657
    .end local v2    # "bix":I
    .end local v5    # "index":I
    .end local v7    # "newB":Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;
    .end local v12    # "symbol":Ljava/lang/String;
    :cond_6
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 674
    .end local v1    # "b":Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;
    :cond_7
    move-object/from16 v0, p0

    iput v6, v0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_longestCollisionList:I

    .line 675
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_overflows:Ljava/util/BitSet;

    .line 677
    move-object/from16 v0, p0

    iget v13, v0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_size:I

    if-eq v3, v13, :cond_0

    .line 678
    new-instance v13, Ljava/lang/IllegalStateException;

    const-string/jumbo v14, "Internal error on SymbolTable.rehash(): had %d entries; now have %d"

    const/4 v15, 0x2

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_size:I

    move/from16 v17, v0

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v15, v16

    const/16 v16, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-static {v14, v15}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v13
.end method


# virtual methods
.method public _hashToIndex(I)I
    .locals 1
    .param p1, "rawHash"    # I

    .prologue
    .line 546
    ushr-int/lit8 v0, p1, 0xf

    add-int/2addr p1, v0

    .line 547
    shl-int/lit8 v0, p1, 0x7

    xor-int/2addr p1, v0

    .line 548
    ushr-int/lit8 v0, p1, 0x3

    add-int/2addr p1, v0

    .line 549
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_indexMask:I

    and-int/2addr v0, p1

    return v0
.end method

.method public bucketCount()I
    .locals 1

    .prologue
    .line 385
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_symbols:[Ljava/lang/String;

    array-length v0, v0

    return v0
.end method

.method public calcHash(Ljava/lang/String;)I
    .locals 5
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 572
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 574
    .local v2, "len":I
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_seed:I

    .line 575
    .local v0, "hash":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 576
    mul-int/lit8 v3, v0, 0x21

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    add-int v0, v3, v4

    .line 575
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 579
    :cond_0
    if-nez v0, :cond_1

    const/4 v0, 0x1

    .end local v0    # "hash":I
    :cond_1
    return v0
.end method

.method public calcHash([CII)I
    .locals 5
    .param p1, "buffer"    # [C
    .param p2, "start"    # I
    .param p3, "len"    # I

    .prologue
    .line 562
    iget v1, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_seed:I

    .line 563
    .local v1, "hash":I
    move v2, p2

    .local v2, "i":I
    add-int v0, p2, p3

    .local v0, "end":I
    :goto_0
    if-ge v2, v0, :cond_0

    .line 564
    mul-int/lit8 v3, v1, 0x21

    aget-char v4, p1, v2

    add-int v1, v3, v4

    .line 563
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 567
    :cond_0
    if-nez v1, :cond_1

    const/4 v1, 0x1

    .end local v1    # "hash":I
    :cond_1
    return v1
.end method

.method public collisionCount()I
    .locals 6

    .prologue
    .line 397
    const/4 v2, 0x0

    .line 399
    .local v2, "count":I
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_buckets:[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    .local v0, "arr$":[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_1

    aget-object v1, v0, v3

    .line 400
    .local v1, "bucket":Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;
    if-eqz v1, :cond_0

    .line 401
    iget v5, v1, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;->length:I

    add-int/2addr v2, v5

    .line 399
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 404
    .end local v1    # "bucket":Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;
    :cond_1
    return v2
.end method

.method public findSymbol([CIII)Ljava/lang/String;
    .locals 9
    .param p1, "buffer"    # [C
    .param p2, "start"    # I
    .param p3, "len"    # I
    .param p4, "h"    # I

    .prologue
    .line 424
    const/4 v0, 0x1

    if-ge p3, v0, :cond_1

    .line 425
    const-string/jumbo v8, ""

    .line 463
    :cond_0
    :goto_0
    return-object v8

    .line 427
    :cond_1
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_canonicalize:Z

    if-nez v0, :cond_2

    .line 428
    new-instance v8, Ljava/lang/String;

    invoke-direct {v8, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    goto :goto_0

    .line 436
    :cond_2
    invoke-virtual {p0, p4}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_hashToIndex(I)I

    move-result v5

    .line 437
    .local v5, "index":I
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_symbols:[Ljava/lang/String;

    aget-object v8, v0, v5

    .line 440
    .local v8, "sym":Ljava/lang/String;
    if-eqz v8, :cond_5

    .line 442
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v0

    if-ne v0, p3, :cond_4

    .line 443
    const/4 v7, 0x0

    .line 444
    .local v7, "i":I
    :cond_3
    invoke-virtual {v8, v7}, Ljava/lang/String;->charAt(I)C

    move-result v0

    add-int v1, p2, v7

    aget-char v1, p1, v1

    if-ne v0, v1, :cond_4

    .line 446
    add-int/lit8 v7, v7, 0x1

    if-ne v7, p3, :cond_3

    goto :goto_0

    .line 451
    .end local v7    # "i":I
    :cond_4
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_buckets:[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    shr-int/lit8 v1, v5, 0x1

    aget-object v6, v0, v1

    .line 452
    .local v6, "b":Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;
    if-eqz v6, :cond_5

    .line 453
    invoke-virtual {v6, p1, p2, p3}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;->has([CII)Ljava/lang/String;

    move-result-object v8

    .line 454
    if-nez v8, :cond_0

    .line 457
    iget-object v0, v6, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;->next:Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_findSymbol2([CIILcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;)Ljava/lang/String;

    move-result-object v8

    .line 458
    if-nez v8, :cond_0

    .end local v6    # "b":Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;
    :cond_5
    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    .line 463
    invoke-direct/range {v0 .. v5}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_addSymbol([CIIII)Ljava/lang/String;

    move-result-object v8

    goto :goto_0
.end method

.method public hashSeed()I
    .locals 1

    .prologue
    .line 387
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_seed:I

    return v0
.end method

.method public makeChild(I)Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;
    .locals 3
    .param p1, "flags"    # I

    .prologue
    .line 315
    new-instance v1, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;

    iget v2, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_seed:I

    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_tableInfo:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$TableInfo;

    invoke-direct {v1, p0, p1, v2, v0}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;-><init>(Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;IILcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$TableInfo;)V

    return-object v1
.end method

.method public maxCollisionLength()I
    .locals 1

    .prologue
    .line 414
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_longestCollisionList:I

    return v0
.end method

.method public maybeDirty()Z
    .locals 1

    .prologue
    .line 386
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_hashShared:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public release()V
    .locals 2

    .prologue
    .line 326
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->maybeDirty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 335
    :cond_0
    :goto_0
    return-void

    .line 329
    :cond_1
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_parent:Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_canonicalize:Z

    if-eqz v0, :cond_0

    .line 330
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_parent:Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;

    new-instance v1, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$TableInfo;

    invoke-direct {v1, p0}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$TableInfo;-><init>(Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;)V

    invoke-direct {v0, v1}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->mergeChild(Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$TableInfo;)V

    .line 333
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_hashShared:Z

    goto :goto_0
.end method

.method protected reportTooManyCollisions(I)V
    .locals 3
    .param p1, "maxLen"    # I

    .prologue
    .line 688
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Longest collision chain in symbol table (of size "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_size:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ") now exceeds maximum, "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " -- suspect a DoS attack based on hash collisions"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 372
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_tableInfo:Ljava/util/concurrent/atomic/AtomicReference;

    if-eqz v0, :cond_0

    .line 373
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_tableInfo:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$TableInfo;

    iget v0, v0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$TableInfo;->size:I

    .line 376
    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_size:I

    goto :goto_0
.end method
