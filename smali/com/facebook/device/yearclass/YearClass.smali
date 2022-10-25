.class public Lcom/facebook/device/yearclass/YearClass;
.super Ljava/lang/Object;
.source "YearClass.java"


# static fields
.field public static final CLASS_2008:I = 0x7d8

.field public static final CLASS_2009:I = 0x7d9

.field public static final CLASS_2010:I = 0x7da

.field public static final CLASS_2011:I = 0x7db

.field public static final CLASS_2012:I = 0x7dc

.field public static final CLASS_2013:I = 0x7dd

.field public static final CLASS_2014:I = 0x7de

.field public static final CLASS_2015:I = 0x7df

.field public static final CLASS_UNKNOWN:I = -0x1

.field private static final MB:J = 0x100000L

.field private static final MHZ_IN_KHZ:I = 0x3e8

.field private static volatile mYearCategory:Ljava/lang/Integer;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static categorizeByYear2014Method(Landroid/content/Context;)I
    .locals 5
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 93
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 94
    .local v1, "componentYears":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-static {}, Lcom/facebook/device/yearclass/YearClass;->getNumCoresYear()I

    move-result v2

    invoke-static {v1, v2}, Lcom/facebook/device/yearclass/YearClass;->conditionallyAdd(Ljava/util/ArrayList;I)V

    .line 95
    invoke-static {}, Lcom/facebook/device/yearclass/YearClass;->getClockSpeedYear()I

    move-result v2

    invoke-static {v1, v2}, Lcom/facebook/device/yearclass/YearClass;->conditionallyAdd(Ljava/util/ArrayList;I)V

    .line 96
    invoke-static {p0}, Lcom/facebook/device/yearclass/YearClass;->getRamYear(Landroid/content/Context;)I

    move-result v2

    invoke-static {v1, v2}, Lcom/facebook/device/yearclass/YearClass;->conditionallyAdd(Ljava/util/ArrayList;I)V

    .line 97
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 98
    const/4 v2, -0x1

    .line 106
    :goto_0
    return v2

    .line 99
    :cond_0
    invoke-static {v1}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 100
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    and-int/lit8 v2, v2, 0x1

    const/4 v3, 0x1

    if-ne v2, v3, :cond_1

    .line 101
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    goto :goto_0

    .line 103
    :cond_1
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    add-int/lit8 v0, v2, -0x1

    .line 105
    .local v0, "baseIndex":I
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    add-int/lit8 v2, v0, 0x1

    .line 106
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    sub-int v2, v4, v2

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v2, v3

    goto :goto_0
.end method

.method private static categorizeByYear2016Method(Landroid/content/Context;)I
    .locals 6
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    const/16 v3, 0x7dd

    const/16 v2, 0x7dc

    .line 64
    invoke-static {p0}, Lcom/facebook/device/yearclass/DeviceInfo;->getTotalMemory(Landroid/content/Context;)J

    move-result-wide v0

    .line 65
    .local v0, "totalRam":J
    const-wide/16 v4, -0x1

    cmp-long v4, v0, v4

    if-nez v4, :cond_1

    .line 66
    invoke-static {p0}, Lcom/facebook/device/yearclass/YearClass;->categorizeByYear2014Method(Landroid/content/Context;)I

    move-result v2

    .line 81
    :cond_0
    :goto_0
    return v2

    .line 69
    :cond_1
    const-wide/32 v4, 0x30000000

    cmp-long v4, v0, v4

    if-gtz v4, :cond_3

    .line 70
    invoke-static {}, Lcom/facebook/device/yearclass/DeviceInfo;->getNumberOfCPUCores()I

    move-result v2

    const/4 v3, 0x1

    if-gt v2, v3, :cond_2

    const/16 v2, 0x7d9

    goto :goto_0

    :cond_2
    const/16 v2, 0x7da

    goto :goto_0

    .line 72
    :cond_3
    const-wide/32 v4, 0x40000000

    cmp-long v4, v0, v4

    if-gtz v4, :cond_4

    .line 73
    invoke-static {}, Lcom/facebook/device/yearclass/DeviceInfo;->getCPUMaxFreqKHz()I

    move-result v3

    const v4, 0x13d620

    if-ge v3, v4, :cond_0

    const/16 v2, 0x7db

    goto :goto_0

    .line 75
    :cond_4
    const-wide/32 v4, 0x60000000

    cmp-long v4, v0, v4

    if-gtz v4, :cond_5

    .line 76
    invoke-static {}, Lcom/facebook/device/yearclass/DeviceInfo;->getCPUMaxFreqKHz()I

    move-result v4

    const v5, 0x1b7740

    if-lt v4, v5, :cond_0

    move v2, v3

    goto :goto_0

    .line 78
    :cond_5
    const-wide v4, 0x80000000L

    cmp-long v2, v0, v4

    if-gtz v2, :cond_6

    move v2, v3

    .line 79
    goto :goto_0

    .line 81
    :cond_6
    const-wide v2, 0xc0000000L

    cmp-long v2, v0, v2

    if-gtz v2, :cond_7

    const/16 v2, 0x7de

    goto :goto_0

    :cond_7
    const/16 v2, 0x7df

    goto :goto_0
.end method

.method private static conditionallyAdd(Ljava/util/ArrayList;I)V
    .locals 1
    .param p1, "value"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 52
    .local p0, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    .line 53
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 55
    :cond_0
    return-void
.end method

.method public static get(Landroid/content/Context;)I
    .locals 2
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 41
    sget-object v0, Lcom/facebook/device/yearclass/YearClass;->mYearCategory:Ljava/lang/Integer;

    if-nez v0, :cond_1

    .line 42
    const-class v1, Lcom/facebook/device/yearclass/YearClass;

    monitor-enter v1

    .line 43
    :try_start_0
    sget-object v0, Lcom/facebook/device/yearclass/YearClass;->mYearCategory:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 44
    invoke-static {p0}, Lcom/facebook/device/yearclass/YearClass;->categorizeByYear2016Method(Landroid/content/Context;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lcom/facebook/device/yearclass/YearClass;->mYearCategory:Ljava/lang/Integer;

    .line 46
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    :cond_1
    sget-object v0, Lcom/facebook/device/yearclass/YearClass;->mYearCategory:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0

    .line 46
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private static getClockSpeedYear()I
    .locals 4

    .prologue
    .line 155
    invoke-static {}, Lcom/facebook/device/yearclass/DeviceInfo;->getCPUMaxFreqKHz()I

    move-result v2

    int-to-long v0, v2

    .line 156
    .local v0, "clockSpeedKHz":J
    const-wide/16 v2, -0x1

    cmp-long v2, v0, v2

    if-nez v2, :cond_0

    const/4 v2, -0x1

    .line 165
    :goto_0
    return v2

    .line 159
    :cond_0
    const-wide/32 v2, 0x80e80

    cmp-long v2, v0, v2

    if-gtz v2, :cond_1

    const/16 v2, 0x7d8

    goto :goto_0

    .line 160
    :cond_1
    const-wide/32 v2, 0x975e0

    cmp-long v2, v0, v2

    if-gtz v2, :cond_2

    const/16 v2, 0x7d9

    goto :goto_0

    .line 161
    :cond_2
    const-wide/32 v2, 0xf9060

    cmp-long v2, v0, v2

    if-gtz v2, :cond_3

    const/16 v2, 0x7da

    goto :goto_0

    .line 162
    :cond_3
    const-wide/32 v2, 0x129da0

    cmp-long v2, v0, v2

    if-gtz v2, :cond_4

    const/16 v2, 0x7db

    goto :goto_0

    .line 163
    :cond_4
    const-wide/32 v2, 0x173180

    cmp-long v2, v0, v2

    if-gtz v2, :cond_5

    const/16 v2, 0x7dc

    goto :goto_0

    .line 164
    :cond_5
    const-wide/32 v2, 0x1ed2a0

    cmp-long v2, v0, v2

    if-gtz v2, :cond_6

    const/16 v2, 0x7dd

    goto :goto_0

    .line 165
    :cond_6
    const/16 v2, 0x7de

    goto :goto_0
.end method

.method private static getNumCoresYear()I
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 127
    invoke-static {}, Lcom/facebook/device/yearclass/DeviceInfo;->getNumberOfCPUCores()I

    move-result v0

    .line 128
    .local v0, "cores":I
    if-ge v0, v1, :cond_0

    const/4 v1, -0x1

    .line 131
    :goto_0
    return v1

    .line 129
    :cond_0
    if-ne v0, v1, :cond_1

    const/16 v1, 0x7d8

    goto :goto_0

    .line 130
    :cond_1
    const/4 v1, 0x3

    if-gt v0, v1, :cond_2

    const/16 v1, 0x7db

    goto :goto_0

    .line 131
    :cond_2
    const/16 v1, 0x7dc

    goto :goto_0
.end method

.method private static getRamYear(Landroid/content/Context;)I
    .locals 4
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 189
    invoke-static {p0}, Lcom/facebook/device/yearclass/DeviceInfo;->getTotalMemory(Landroid/content/Context;)J

    move-result-wide v0

    .line 190
    .local v0, "totalRam":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-gtz v2, :cond_0

    const/4 v2, -0x1

    .line 197
    :goto_0
    return v2

    .line 191
    :cond_0
    const-wide/32 v2, 0xc000000

    cmp-long v2, v0, v2

    if-gtz v2, :cond_1

    const/16 v2, 0x7d8

    goto :goto_0

    .line 192
    :cond_1
    const-wide/32 v2, 0x12200000

    cmp-long v2, v0, v2

    if-gtz v2, :cond_2

    const/16 v2, 0x7d9

    goto :goto_0

    .line 193
    :cond_2
    const-wide/32 v2, 0x20000000

    cmp-long v2, v0, v2

    if-gtz v2, :cond_3

    const/16 v2, 0x7da

    goto :goto_0

    .line 194
    :cond_3
    const-wide/32 v2, 0x40000000

    cmp-long v2, v0, v2

    if-gtz v2, :cond_4

    const/16 v2, 0x7db

    goto :goto_0

    .line 195
    :cond_4
    const-wide/32 v2, 0x60000000

    cmp-long v2, v0, v2

    if-gtz v2, :cond_5

    const/16 v2, 0x7dc

    goto :goto_0

    .line 196
    :cond_5
    const-wide v2, 0x80000000L

    cmp-long v2, v0, v2

    if-gtz v2, :cond_6

    const/16 v2, 0x7dd

    goto :goto_0

    .line 197
    :cond_6
    const/16 v2, 0x7de

    goto :goto_0
.end method
