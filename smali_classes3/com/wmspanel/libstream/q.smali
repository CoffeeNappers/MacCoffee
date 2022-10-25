.class Lcom/wmspanel/libstream/q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/wmspanel/libstream/c;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a([BII)[B
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 21
    array-length v0, p1

    new-array v0, v0, [B

    .line 23
    mul-int v1, p2, p3

    .line 24
    div-int/lit8 v2, v1, 0x4

    .line 26
    invoke-static {p1, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 27
    add-int v3, v1, v2

    invoke-static {p1, v1, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 28
    add-int v3, v1, v2

    invoke-static {p1, v3, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 30
    return-object v0
.end method
