.class Lcom/wmspanel/libstream/h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/wmspanel/libstream/c;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a([BII)[B
    .locals 7

    .prologue
    const/4 v0, 0x0

    .line 63
    array-length v1, p1

    new-array v1, v1, [B

    .line 65
    mul-int v2, p2, p3

    .line 66
    div-int/lit8 v3, v2, 0x4

    .line 68
    invoke-static {p1, v0, v1, v0, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 70
    :goto_0
    if-ge v0, v3, :cond_0

    .line 71
    add-int v4, v2, v0

    mul-int/lit8 v5, v0, 0x2

    add-int/2addr v5, v2

    aget-byte v5, p1, v5

    aput-byte v5, v1, v4

    .line 72
    add-int v4, v2, v3

    add-int/2addr v4, v0

    add-int/lit8 v5, v2, 0x1

    mul-int/lit8 v6, v0, 0x2

    add-int/2addr v5, v6

    aget-byte v5, p1, v5

    aput-byte v5, v1, v4

    .line 70
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 75
    :cond_0
    return-object v1
.end method
