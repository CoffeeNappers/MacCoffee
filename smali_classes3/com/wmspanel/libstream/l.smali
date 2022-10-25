.class Lcom/wmspanel/libstream/l;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "RtspBuilder"


# instance fields
.field private R:[B


# direct methods
.method private constructor <init>([B)V
    .locals 1

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    const/4 v0, 0x0

    invoke-static {p1, v0}, Ljava/util/Arrays;->fill([BB)V

    .line 12
    iput-object p1, p0, Lcom/wmspanel/libstream/l;->R:[B

    .line 13
    return-void
.end method

.method public static e([B)Lcom/wmspanel/libstream/l;
    .locals 1

    .prologue
    .line 16
    new-instance v0, Lcom/wmspanel/libstream/l;

    invoke-direct {v0, p0}, Lcom/wmspanel/libstream/l;-><init>([B)V

    return-object v0
.end method


# virtual methods
.method public a(B)Lcom/wmspanel/libstream/l;
    .locals 4

    .prologue
    .line 28
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/4 v1, 0x4

    aget-byte v2, v0, v1

    and-int/lit8 v3, p1, 0x3

    shl-int/lit8 v3, v3, 0x6

    or-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 29
    return-object p0
.end method

.method public a(II)Lcom/wmspanel/libstream/l;
    .locals 3

    .prologue
    .line 20
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/4 v1, 0x0

    const/16 v2, 0x24

    aput-byte v2, v0, v1

    .line 21
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/4 v1, 0x1

    and-int/lit16 v2, p1, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 22
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/4 v1, 0x2

    shr-int/lit8 v2, p2, 0x8

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 23
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/4 v1, 0x3

    and-int/lit16 v2, p2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 24
    return-object p0
.end method

.method public a(BZZ)V
    .locals 3

    .prologue
    const/16 v2, 0x11

    .line 92
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    and-int/lit8 v1, p1, 0x1f

    int-to-byte v1, v1

    aput-byte v1, v0, v2

    .line 93
    if-eqz p2, :cond_1

    .line 94
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    aget-byte v1, v0, v2

    or-int/lit16 v1, v1, 0x80

    int-to-byte v1, v1

    aput-byte v1, v0, v2

    .line 98
    :cond_0
    :goto_0
    return-void

    .line 95
    :cond_1
    if-eqz p3, :cond_0

    .line 96
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    aget-byte v1, v0, v2

    or-int/lit8 v1, v1, 0x40

    int-to-byte v1, v1

    aput-byte v1, v0, v2

    goto :goto_0
.end method

.method public a(S)V
    .locals 3

    .prologue
    const/16 v2, 0x10

    .line 80
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/4 v1, 0x0

    aput-byte v1, v0, v2

    .line 81
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/16 v1, 0x11

    aput-byte v2, v0, v1

    .line 82
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/16 v1, 0x12

    shr-int/lit8 v2, p1, 0x5

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 83
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/16 v1, 0x13

    shl-int/lit8 v2, p1, 0x3

    and-int/lit16 v2, v2, 0xf8

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 84
    return-void
.end method

.method public b(B)Lcom/wmspanel/libstream/l;
    .locals 4

    .prologue
    .line 33
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/4 v1, 0x4

    aget-byte v2, v0, v1

    and-int/lit8 v3, p1, 0x1

    shl-int/lit8 v3, v3, 0x5

    or-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 34
    return-object p0
.end method

.method public b(J)V
    .locals 7

    .prologue
    const/16 v6, 0x10

    const-wide/16 v4, 0xff

    .line 123
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/16 v1, 0xc

    const/16 v2, 0x38

    shr-long v2, p1, v2

    and-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 124
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/16 v1, 0xd

    const/16 v2, 0x30

    shr-long v2, p1, v2

    and-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 125
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/16 v1, 0xe

    const/16 v2, 0x28

    shr-long v2, p1, v2

    and-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 126
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/16 v1, 0xf

    const/16 v2, 0x20

    shr-long v2, p1, v2

    and-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 128
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/16 v1, 0x18

    shr-long v2, p1, v1

    and-long/2addr v2, v4

    long-to-int v1, v2

    int-to-byte v1, v1

    aput-byte v1, v0, v6

    .line 129
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/16 v1, 0x11

    shr-long v2, p1, v6

    and-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 130
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/16 v1, 0x12

    const/16 v2, 0x8

    shr-long v2, p1, v2

    and-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 131
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/16 v1, 0x13

    and-long v2, p1, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 132
    return-void
.end method

.method public c(B)Lcom/wmspanel/libstream/l;
    .locals 4

    .prologue
    .line 38
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/4 v1, 0x4

    aget-byte v2, v0, v1

    and-int/lit8 v3, p1, 0x1

    shl-int/lit8 v3, v3, 0x4

    or-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 39
    return-object p0
.end method

.method public c(J)V
    .locals 7

    .prologue
    const-wide/16 v4, 0xff

    .line 135
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/16 v1, 0x14

    const/16 v2, 0x18

    shr-long v2, p1, v2

    and-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 136
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/16 v1, 0x15

    const/16 v2, 0x10

    shr-long v2, p1, v2

    and-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 137
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/16 v1, 0x16

    const/16 v2, 0x8

    shr-long v2, p1, v2

    and-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 138
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/16 v1, 0x17

    and-long v2, p1, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 139
    return-void
.end method

.method public d(B)Lcom/wmspanel/libstream/l;
    .locals 4

    .prologue
    .line 43
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/4 v1, 0x4

    aget-byte v2, v0, v1

    and-int/lit8 v3, p1, 0xf

    or-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 44
    return-object p0
.end method

.method public e(B)Lcom/wmspanel/libstream/l;
    .locals 4

    .prologue
    .line 48
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/4 v1, 0x5

    aget-byte v2, v0, v1

    and-int/lit8 v3, p1, 0x1

    shl-int/lit8 v3, v3, 0x7

    or-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 49
    return-object p0
.end method

.method public f(B)Lcom/wmspanel/libstream/l;
    .locals 4

    .prologue
    .line 53
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/4 v1, 0x5

    aget-byte v2, v0, v1

    and-int/lit8 v3, p1, 0x7f

    or-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 54
    return-object p0
.end method

.method public g(B)V
    .locals 4

    .prologue
    const/16 v3, 0x10

    .line 87
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/16 v1, 0x1c

    aput-byte v1, v0, v3

    .line 88
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    aget-byte v1, v0, v3

    and-int/lit8 v2, p1, 0x3

    shl-int/lit8 v2, v2, 0x5

    or-int/2addr v1, v2

    int-to-byte v1, v1

    aput-byte v1, v0, v3

    .line 89
    return-void
.end method

.method public h(B)V
    .locals 4

    .prologue
    .line 102
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/4 v1, 0x4

    aget-byte v2, v0, v1

    and-int/lit8 v3, p1, 0x1f

    or-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 103
    return-void
.end method

.method public i(B)V
    .locals 4

    .prologue
    .line 106
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/4 v1, 0x5

    aget-byte v2, v0, v1

    and-int/lit16 v3, p1, 0xff

    or-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 107
    return-void
.end method

.method public m(I)Lcom/wmspanel/libstream/l;
    .locals 3

    .prologue
    .line 58
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/4 v1, 0x6

    shr-int/lit8 v2, p1, 0x8

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 59
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/4 v1, 0x7

    and-int/lit16 v2, p1, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 60
    return-object p0
.end method

.method public n(I)Lcom/wmspanel/libstream/l;
    .locals 3

    .prologue
    .line 64
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/16 v1, 0x8

    shr-int/lit8 v2, p1, 0x18

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 65
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/16 v1, 0x9

    shr-int/lit8 v2, p1, 0x10

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 66
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/16 v1, 0xa

    shr-int/lit8 v2, p1, 0x8

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 67
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/16 v1, 0xb

    and-int/lit16 v2, p1, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 68
    return-object p0
.end method

.method public o(I)Lcom/wmspanel/libstream/l;
    .locals 3

    .prologue
    .line 72
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/16 v1, 0xc

    shr-int/lit8 v2, p1, 0x18

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 73
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/16 v1, 0xd

    shr-int/lit8 v2, p1, 0x10

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 74
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/16 v1, 0xe

    shr-int/lit8 v2, p1, 0x8

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 75
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/16 v1, 0xf

    and-int/lit16 v2, p1, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 76
    return-object p0
.end method

.method public p(I)V
    .locals 4

    .prologue
    .line 110
    div-int/lit8 v0, p1, 0x4

    add-int/lit8 v0, v0, -0x1

    .line 111
    iget-object v1, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/4 v2, 0x6

    shr-int/lit8 v3, v0, 0x8

    and-int/lit16 v3, v3, 0xff

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    .line 112
    iget-object v1, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/4 v2, 0x7

    and-int/lit16 v0, v0, 0xff

    int-to-byte v0, v0

    aput-byte v0, v1, v2

    .line 113
    return-void
.end method

.method public q(I)V
    .locals 3

    .prologue
    .line 116
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/16 v1, 0x8

    shr-int/lit8 v2, p1, 0x18

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 117
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/16 v1, 0x9

    shr-int/lit8 v2, p1, 0x10

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 118
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/16 v1, 0xa

    shr-int/lit8 v2, p1, 0x8

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 119
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/16 v1, 0xb

    and-int/lit16 v2, p1, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 120
    return-void
.end method

.method public r(I)V
    .locals 3

    .prologue
    .line 142
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/16 v1, 0x18

    shr-int/lit8 v2, p1, 0x18

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 143
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/16 v1, 0x19

    shr-int/lit8 v2, p1, 0x10

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 144
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/16 v1, 0x1a

    shr-int/lit8 v2, p1, 0x8

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 145
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/16 v1, 0x1b

    and-int/lit16 v2, p1, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 146
    return-void
.end method

.method public s(I)V
    .locals 3

    .prologue
    .line 149
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/16 v1, 0x1c

    shr-int/lit8 v2, p1, 0x18

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 150
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/16 v1, 0x1d

    shr-int/lit8 v2, p1, 0x10

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 151
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/16 v1, 0x1e

    shr-int/lit8 v2, p1, 0x8

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 152
    iget-object v0, p0, Lcom/wmspanel/libstream/l;->R:[B

    const/16 v1, 0x1f

    and-int/lit16 v2, p1, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 153
    return-void
.end method
