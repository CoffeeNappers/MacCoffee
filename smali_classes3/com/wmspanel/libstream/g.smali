.class Lcom/wmspanel/libstream/g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/wmspanel/libstream/c;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a([BII)[B
    .locals 5

    .prologue
    const/4 v0, 0x0

    .line 83
    array-length v1, p1

    new-array v1, v1, [B

    .line 85
    mul-int v2, p2, p3

    .line 87
    invoke-static {p1, v0, v1, v0, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 88
    :goto_0
    mul-int v3, p2, p3

    div-int/lit8 v3, v3, 0x2

    if-ge v0, v3, :cond_0

    .line 90
    add-int v3, v2, v0

    add-int v4, v2, v0

    add-int/lit8 v4, v4, 0x1

    aget-byte v4, p1, v4

    aput-byte v4, v1, v3

    .line 91
    add-int v3, v2, v0

    add-int/lit8 v3, v3, 0x1

    add-int v4, v2, v0

    aget-byte v4, p1, v4

    aput-byte v4, v1, v3

    .line 88
    add-int/lit8 v0, v0, 0x2

    goto :goto_0

    .line 94
    :cond_0
    return-object v1
.end method
