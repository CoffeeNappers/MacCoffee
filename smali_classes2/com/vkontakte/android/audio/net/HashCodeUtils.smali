.class public final Lcom/vkontakte/android/audio/net/HashCodeUtils;
.super Ljava/lang/Object;
.source "HashCodeUtils.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    return-void
.end method

.method public static add(IB)I
    .locals 1
    .param p0, "hashCode"    # I
    .param p1, "value"    # B

    .prologue
    .line 23
    invoke-static {p0, p1}, Lcom/vkontakte/android/audio/net/HashCodeUtils;->add(II)I

    move-result v0

    return v0
.end method

.method public static add(IC)I
    .locals 1
    .param p0, "hashCode"    # I
    .param p1, "value"    # C

    .prologue
    .line 27
    invoke-static {p0, p1}, Lcom/vkontakte/android/audio/net/HashCodeUtils;->add(II)I

    move-result v0

    return v0
.end method

.method public static add(ID)I
    .locals 3
    .param p0, "hashCode"    # I
    .param p1, "value"    # D

    .prologue
    .line 39
    invoke-static {p1, p2}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v0

    invoke-static {p0, v0, v1}, Lcom/vkontakte/android/audio/net/HashCodeUtils;->add(IJ)I

    move-result v0

    return v0
.end method

.method public static add(IF)I
    .locals 1
    .param p0, "hashCode"    # I
    .param p1, "value"    # F

    .prologue
    .line 35
    invoke-static {p1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v0

    invoke-static {p0, v0}, Lcom/vkontakte/android/audio/net/HashCodeUtils;->add(II)I

    move-result v0

    return v0
.end method

.method public static add(II)I
    .locals 1
    .param p0, "hashCode"    # I
    .param p1, "value"    # I

    .prologue
    .line 15
    mul-int/lit8 v0, p0, 0x25

    add-int/2addr v0, p1

    return v0
.end method

.method public static add(IJ)I
    .locals 3
    .param p0, "hashCode"    # I
    .param p1, "value"    # J

    .prologue
    .line 19
    const/16 v0, 0x20

    ushr-long v0, p1, v0

    xor-long/2addr v0, p1

    long-to-int v0, v0

    invoke-static {p0, v0}, Lcom/vkontakte/android/audio/net/HashCodeUtils;->add(II)I

    move-result v0

    return v0
.end method

.method public static add(ILjava/lang/Object;)I
    .locals 1
    .param p0, "hashCode"    # I
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 43
    if-nez p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-static {p0, v0}, Lcom/vkontakte/android/audio/net/HashCodeUtils;->add(II)I

    move-result v0

    return v0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    goto :goto_0
.end method

.method public static add(ILjava/util/Collection;)I
    .locals 3
    .param p0, "hashCode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Collection",
            "<*>;)I"
        }
    .end annotation

    .prologue
    .line 47
    .local p1, "collection":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    if-nez p1, :cond_1

    .line 48
    const/4 v1, 0x0

    invoke-static {p0, v1}, Lcom/vkontakte/android/audio/net/HashCodeUtils;->add(II)I

    move-result p0

    .line 53
    .end local p0    # "hashCode":I
    :cond_0
    return p0

    .line 50
    .restart local p0    # "hashCode":I
    :cond_1
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 51
    .local v0, "object":Ljava/lang/Object;
    invoke-static {p0, v0}, Lcom/vkontakte/android/audio/net/HashCodeUtils;->add(ILjava/lang/Object;)I

    move-result p0

    goto :goto_0
.end method

.method public static add(IS)I
    .locals 1
    .param p0, "hashCode"    # I
    .param p1, "value"    # S

    .prologue
    .line 31
    invoke-static {p0, p1}, Lcom/vkontakte/android/audio/net/HashCodeUtils;->add(II)I

    move-result v0

    return v0
.end method

.method public static add(IZ)I
    .locals 2
    .param p0, "hashCode"    # I
    .param p1, "value"    # Z

    .prologue
    .line 11
    mul-int/lit8 v1, p0, 0x25

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    add-int/2addr v0, v1

    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method
