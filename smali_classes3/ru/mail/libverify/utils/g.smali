.class abstract Lru/mail/libverify/utils/g;
.super Ljava/lang/Object;


# direct methods
.method private static a(IIIII)I
    .locals 3

    xor-int/lit8 v0, p0, -0x1

    and-int/2addr v0, p2

    and-int v1, p0, p1

    or-int/2addr v0, v1

    add-int/2addr v0, p4

    shl-int v1, v0, p3

    rsub-int/lit8 v2, p3, 0x20

    ushr-int/2addr v0, v2

    or-int/2addr v0, v1

    add-int/2addr v0, p0

    return v0
.end method

.method static a([BI[I[I[I[B)V
    .locals 8

    const/16 v6, 0x40

    const/4 v5, 0x1

    const/4 v0, 0x0

    new-array v3, v6, [B

    aget v1, p4, v0

    ushr-int/lit8 v1, v1, 0x3

    and-int/lit8 v1, v1, 0x3f

    aget v2, p4, v0

    shl-int/lit8 v4, p1, 0x3

    add-int/2addr v2, v4

    aput v2, p4, v0

    shl-int/lit8 v4, p1, 0x3

    if-ge v2, v4, :cond_0

    aget v2, p4, v5

    add-int/lit8 v2, v2, 0x1

    aput v2, p4, v5

    :cond_0
    aget v2, p4, v5

    ushr-int/lit8 v4, p1, 0x1d

    add-int/2addr v2, v4

    aput v2, p4, v5

    rsub-int/lit8 v2, v1, 0x40

    if-lt p1, v2, :cond_1

    invoke-static {p0, v0, p5, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    invoke-static {p5, p2, p3}, Lru/mail/libverify/utils/g;->a([B[I[I)V

    move v1, v2

    :goto_0
    add-int/lit8 v2, v1, 0x3f

    if-ge v2, p1, :cond_2

    invoke-static {p0, v1, v3, v0, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    invoke-static {v3, p2, p3}, Lru/mail/libverify/utils/g;->a([B[I[I)V

    add-int/lit8 v1, v1, 0x40

    goto :goto_0

    :cond_1
    move v7, v1

    move v1, v0

    move v0, v7

    :cond_2
    sub-int v2, p1, v1

    invoke-static {p0, v1, p5, v0, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-void
.end method

.method private static a([B[I[I)V
    .locals 11

    const/16 v10, 0x9

    const/4 v9, 0x7

    const/4 v8, 0x6

    const/4 v7, 0x5

    const/4 v6, 0x4

    const/4 v1, 0x0

    const/4 v0, -0x1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    aget-byte v2, p0, v0

    and-int/lit16 v2, v2, 0xff

    add-int/lit8 v0, v0, 0x1

    aget-byte v3, p0, v0

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x8

    or-int/2addr v2, v3

    add-int/lit8 v0, v0, 0x1

    aget-byte v3, p0, v0

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x10

    or-int/2addr v2, v3

    add-int/lit8 v0, v0, 0x1

    aget-byte v3, p0, v0

    shl-int/lit8 v3, v3, 0x18

    or-int/2addr v2, v3

    aput v2, p1, v1

    add-int/lit8 v1, v1, 0x1

    const/16 v2, 0x10

    if-lt v1, v2, :cond_0

    const/4 v0, 0x1

    aget v0, p2, v0

    const/4 v1, 0x2

    aget v1, p2, v1

    const/4 v2, 0x3

    aget v2, p2, v2

    const/4 v3, 0x0

    aget v3, p2, v3

    const/4 v4, 0x0

    aget v4, p1, v4

    add-int/2addr v3, v4

    const v4, -0x28955b88

    add-int/2addr v3, v4

    invoke-static {v0, v1, v2, v9, v3}, Lru/mail/libverify/utils/g;->a(IIIII)I

    move-result v3

    const/16 v4, 0xc

    const/4 v5, 0x1

    aget v5, p1, v5

    add-int/2addr v2, v5

    const v5, -0x173848aa

    add-int/2addr v2, v5

    invoke-static {v3, v0, v1, v4, v2}, Lru/mail/libverify/utils/g;->a(IIIII)I

    move-result v2

    const/16 v4, 0x11

    const/4 v5, 0x2

    aget v5, p1, v5

    add-int/2addr v1, v5

    const v5, 0x242070db

    add-int/2addr v1, v5

    invoke-static {v2, v3, v0, v4, v1}, Lru/mail/libverify/utils/g;->a(IIIII)I

    move-result v1

    const/16 v4, 0x16

    const/4 v5, 0x3

    aget v5, p1, v5

    add-int/2addr v0, v5

    const v5, -0x3e423112

    add-int/2addr v0, v5

    invoke-static {v1, v2, v3, v4, v0}, Lru/mail/libverify/utils/g;->a(IIIII)I

    move-result v0

    aget v4, p1, v6

    add-int/2addr v3, v4

    const v4, -0xa83f051

    add-int/2addr v3, v4

    invoke-static {v0, v1, v2, v9, v3}, Lru/mail/libverify/utils/g;->a(IIIII)I

    move-result v3

    const/16 v4, 0xc

    aget v5, p1, v7

    add-int/2addr v2, v5

    const v5, 0x4787c62a

    add-int/2addr v2, v5

    invoke-static {v3, v0, v1, v4, v2}, Lru/mail/libverify/utils/g;->a(IIIII)I

    move-result v2

    const/16 v4, 0x11

    aget v5, p1, v8

    add-int/2addr v1, v5

    const v5, -0x57cfb9ed

    add-int/2addr v1, v5

    invoke-static {v2, v3, v0, v4, v1}, Lru/mail/libverify/utils/g;->a(IIIII)I

    move-result v1

    const/16 v4, 0x16

    aget v5, p1, v9

    add-int/2addr v0, v5

    const v5, -0x2b96aff

    add-int/2addr v0, v5

    invoke-static {v1, v2, v3, v4, v0}, Lru/mail/libverify/utils/g;->a(IIIII)I

    move-result v0

    const/16 v4, 0x8

    aget v4, p1, v4

    add-int/2addr v3, v4

    const v4, 0x698098d8

    add-int/2addr v3, v4

    invoke-static {v0, v1, v2, v9, v3}, Lru/mail/libverify/utils/g;->a(IIIII)I

    move-result v3

    const/16 v4, 0xc

    aget v5, p1, v10

    add-int/2addr v2, v5

    const v5, -0x74bb0851

    add-int/2addr v2, v5

    invoke-static {v3, v0, v1, v4, v2}, Lru/mail/libverify/utils/g;->a(IIIII)I

    move-result v2

    const/16 v4, 0x11

    const/16 v5, 0xa

    aget v5, p1, v5

    add-int/2addr v1, v5

    const v5, -0xa44f

    add-int/2addr v1, v5

    invoke-static {v2, v3, v0, v4, v1}, Lru/mail/libverify/utils/g;->a(IIIII)I

    move-result v1

    const/16 v4, 0x16

    const/16 v5, 0xb

    aget v5, p1, v5

    add-int/2addr v0, v5

    const v5, -0x76a32842

    add-int/2addr v0, v5

    invoke-static {v1, v2, v3, v4, v0}, Lru/mail/libverify/utils/g;->a(IIIII)I

    move-result v0

    const/16 v4, 0xc

    aget v4, p1, v4

    add-int/2addr v3, v4

    const v4, 0x6b901122

    add-int/2addr v3, v4

    invoke-static {v0, v1, v2, v9, v3}, Lru/mail/libverify/utils/g;->a(IIIII)I

    move-result v3

    const/16 v4, 0xc

    const/16 v5, 0xd

    aget v5, p1, v5

    add-int/2addr v2, v5

    const v5, -0x2678e6d

    add-int/2addr v2, v5

    invoke-static {v3, v0, v1, v4, v2}, Lru/mail/libverify/utils/g;->a(IIIII)I

    move-result v2

    const/16 v4, 0x11

    const/16 v5, 0xe

    aget v5, p1, v5

    add-int/2addr v1, v5

    const v5, -0x5986bc72

    add-int/2addr v1, v5

    invoke-static {v2, v3, v0, v4, v1}, Lru/mail/libverify/utils/g;->a(IIIII)I

    move-result v1

    const/16 v4, 0x16

    const/16 v5, 0xf

    aget v5, p1, v5

    add-int/2addr v0, v5

    const v5, 0x49b40821

    add-int/2addr v0, v5

    invoke-static {v1, v2, v3, v4, v0}, Lru/mail/libverify/utils/g;->a(IIIII)I

    move-result v0

    const/4 v4, 0x1

    aget v4, p1, v4

    add-int/2addr v3, v4

    const v4, -0x9e1da9e

    add-int/2addr v3, v4

    invoke-static {v0, v1, v2, v7, v3}, Lru/mail/libverify/utils/g;->b(IIIII)I

    move-result v3

    aget v4, p1, v8

    add-int/2addr v2, v4

    const v4, -0x3fbf4cc0

    add-int/2addr v2, v4

    invoke-static {v3, v0, v1, v10, v2}, Lru/mail/libverify/utils/g;->b(IIIII)I

    move-result v2

    const/16 v4, 0xe

    const/16 v5, 0xb

    aget v5, p1, v5

    add-int/2addr v1, v5

    const v5, 0x265e5a51

    add-int/2addr v1, v5

    invoke-static {v2, v3, v0, v4, v1}, Lru/mail/libverify/utils/g;->b(IIIII)I

    move-result v1

    const/16 v4, 0x14

    const/4 v5, 0x0

    aget v5, p1, v5

    add-int/2addr v0, v5

    const v5, -0x16493856

    add-int/2addr v0, v5

    invoke-static {v1, v2, v3, v4, v0}, Lru/mail/libverify/utils/g;->b(IIIII)I

    move-result v0

    aget v4, p1, v7

    add-int/2addr v3, v4

    const v4, -0x29d0efa3

    add-int/2addr v3, v4

    invoke-static {v0, v1, v2, v7, v3}, Lru/mail/libverify/utils/g;->b(IIIII)I

    move-result v3

    const/16 v4, 0xa

    aget v4, p1, v4

    add-int/2addr v2, v4

    const v4, 0x2441453

    add-int/2addr v2, v4

    invoke-static {v3, v0, v1, v10, v2}, Lru/mail/libverify/utils/g;->b(IIIII)I

    move-result v2

    const/16 v4, 0xe

    const/16 v5, 0xf

    aget v5, p1, v5

    add-int/2addr v1, v5

    const v5, -0x275e197f

    add-int/2addr v1, v5

    invoke-static {v2, v3, v0, v4, v1}, Lru/mail/libverify/utils/g;->b(IIIII)I

    move-result v1

    const/16 v4, 0x14

    aget v5, p1, v6

    add-int/2addr v0, v5

    const v5, -0x182c0438

    add-int/2addr v0, v5

    invoke-static {v1, v2, v3, v4, v0}, Lru/mail/libverify/utils/g;->b(IIIII)I

    move-result v0

    aget v4, p1, v10

    add-int/2addr v3, v4

    const v4, 0x21e1cde6

    add-int/2addr v3, v4

    invoke-static {v0, v1, v2, v7, v3}, Lru/mail/libverify/utils/g;->b(IIIII)I

    move-result v3

    const/16 v4, 0xe

    aget v4, p1, v4

    add-int/2addr v2, v4

    const v4, -0x3cc8f82a

    add-int/2addr v2, v4

    invoke-static {v3, v0, v1, v10, v2}, Lru/mail/libverify/utils/g;->b(IIIII)I

    move-result v2

    const/16 v4, 0xe

    const/4 v5, 0x3

    aget v5, p1, v5

    add-int/2addr v1, v5

    const v5, -0xb2af279

    add-int/2addr v1, v5

    invoke-static {v2, v3, v0, v4, v1}, Lru/mail/libverify/utils/g;->b(IIIII)I

    move-result v1

    const/16 v4, 0x14

    const/16 v5, 0x8

    aget v5, p1, v5

    add-int/2addr v0, v5

    const v5, 0x455a14ed

    add-int/2addr v0, v5

    invoke-static {v1, v2, v3, v4, v0}, Lru/mail/libverify/utils/g;->b(IIIII)I

    move-result v0

    const/16 v4, 0xd

    aget v4, p1, v4

    add-int/2addr v3, v4

    const v4, -0x561c16fb

    add-int/2addr v3, v4

    invoke-static {v0, v1, v2, v7, v3}, Lru/mail/libverify/utils/g;->b(IIIII)I

    move-result v3

    const/4 v4, 0x2

    aget v4, p1, v4

    add-int/2addr v2, v4

    const v4, -0x3105c08

    add-int/2addr v2, v4

    invoke-static {v3, v0, v1, v10, v2}, Lru/mail/libverify/utils/g;->b(IIIII)I

    move-result v2

    const/16 v4, 0xe

    aget v5, p1, v9

    add-int/2addr v1, v5

    const v5, 0x676f02d9

    add-int/2addr v1, v5

    invoke-static {v2, v3, v0, v4, v1}, Lru/mail/libverify/utils/g;->b(IIIII)I

    move-result v1

    const/16 v4, 0x14

    const/16 v5, 0xc

    aget v5, p1, v5

    add-int/2addr v0, v5

    const v5, -0x72d5b376

    add-int/2addr v0, v5

    invoke-static {v1, v2, v3, v4, v0}, Lru/mail/libverify/utils/g;->b(IIIII)I

    move-result v0

    aget v4, p1, v7

    add-int/2addr v3, v4

    const v4, -0x5c6be

    add-int/2addr v3, v4

    invoke-static {v0, v1, v2, v6, v3}, Lru/mail/libverify/utils/g;->c(IIIII)I

    move-result v3

    const/16 v4, 0xb

    const/16 v5, 0x8

    aget v5, p1, v5

    add-int/2addr v2, v5

    const v5, -0x788e097f

    add-int/2addr v2, v5

    invoke-static {v3, v0, v1, v4, v2}, Lru/mail/libverify/utils/g;->c(IIIII)I

    move-result v2

    const/16 v4, 0x10

    const/16 v5, 0xb

    aget v5, p1, v5

    add-int/2addr v1, v5

    const v5, 0x6d9d6122

    add-int/2addr v1, v5

    invoke-static {v2, v3, v0, v4, v1}, Lru/mail/libverify/utils/g;->c(IIIII)I

    move-result v1

    const/16 v4, 0x17

    const/16 v5, 0xe

    aget v5, p1, v5

    add-int/2addr v0, v5

    const v5, -0x21ac7f4

    add-int/2addr v0, v5

    invoke-static {v1, v2, v3, v4, v0}, Lru/mail/libverify/utils/g;->c(IIIII)I

    move-result v0

    const/4 v4, 0x1

    aget v4, p1, v4

    add-int/2addr v3, v4

    const v4, -0x5b4115bc

    add-int/2addr v3, v4

    invoke-static {v0, v1, v2, v6, v3}, Lru/mail/libverify/utils/g;->c(IIIII)I

    move-result v3

    const/16 v4, 0xb

    aget v5, p1, v6

    add-int/2addr v2, v5

    const v5, 0x4bdecfa9    # 2.9204306E7f

    add-int/2addr v2, v5

    invoke-static {v3, v0, v1, v4, v2}, Lru/mail/libverify/utils/g;->c(IIIII)I

    move-result v2

    const/16 v4, 0x10

    aget v5, p1, v9

    add-int/2addr v1, v5

    const v5, -0x944b4a0

    add-int/2addr v1, v5

    invoke-static {v2, v3, v0, v4, v1}, Lru/mail/libverify/utils/g;->c(IIIII)I

    move-result v1

    const/16 v4, 0x17

    const/16 v5, 0xa

    aget v5, p1, v5

    add-int/2addr v0, v5

    const v5, -0x41404390

    add-int/2addr v0, v5

    invoke-static {v1, v2, v3, v4, v0}, Lru/mail/libverify/utils/g;->c(IIIII)I

    move-result v0

    const/16 v4, 0xd

    aget v4, p1, v4

    add-int/2addr v3, v4

    const v4, 0x289b7ec6

    add-int/2addr v3, v4

    invoke-static {v0, v1, v2, v6, v3}, Lru/mail/libverify/utils/g;->c(IIIII)I

    move-result v3

    const/16 v4, 0xb

    const/4 v5, 0x0

    aget v5, p1, v5

    add-int/2addr v2, v5

    const v5, -0x155ed806

    add-int/2addr v2, v5

    invoke-static {v3, v0, v1, v4, v2}, Lru/mail/libverify/utils/g;->c(IIIII)I

    move-result v2

    const/16 v4, 0x10

    const/4 v5, 0x3

    aget v5, p1, v5

    add-int/2addr v1, v5

    const v5, -0x2b10cf7b

    add-int/2addr v1, v5

    invoke-static {v2, v3, v0, v4, v1}, Lru/mail/libverify/utils/g;->c(IIIII)I

    move-result v1

    const/16 v4, 0x17

    aget v5, p1, v8

    add-int/2addr v0, v5

    const v5, 0x4881d05    # 3.2000097E-36f

    add-int/2addr v0, v5

    invoke-static {v1, v2, v3, v4, v0}, Lru/mail/libverify/utils/g;->c(IIIII)I

    move-result v0

    aget v4, p1, v10

    add-int/2addr v3, v4

    const v4, -0x262b2fc7

    add-int/2addr v3, v4

    invoke-static {v0, v1, v2, v6, v3}, Lru/mail/libverify/utils/g;->c(IIIII)I

    move-result v3

    const/16 v4, 0xb

    const/16 v5, 0xc

    aget v5, p1, v5

    add-int/2addr v2, v5

    const v5, -0x1924661b

    add-int/2addr v2, v5

    invoke-static {v3, v0, v1, v4, v2}, Lru/mail/libverify/utils/g;->c(IIIII)I

    move-result v2

    const/16 v4, 0x10

    const/16 v5, 0xf

    aget v5, p1, v5

    add-int/2addr v1, v5

    const v5, 0x1fa27cf8

    add-int/2addr v1, v5

    invoke-static {v2, v3, v0, v4, v1}, Lru/mail/libverify/utils/g;->c(IIIII)I

    move-result v1

    const/16 v4, 0x17

    const/4 v5, 0x2

    aget v5, p1, v5

    add-int/2addr v0, v5

    const v5, -0x3b53a99b

    add-int/2addr v0, v5

    invoke-static {v1, v2, v3, v4, v0}, Lru/mail/libverify/utils/g;->c(IIIII)I

    move-result v0

    const/4 v4, 0x0

    aget v4, p1, v4

    add-int/2addr v3, v4

    const v4, -0xbd6ddbc

    add-int/2addr v3, v4

    invoke-static {v0, v1, v2, v8, v3}, Lru/mail/libverify/utils/g;->d(IIIII)I

    move-result v3

    const/16 v4, 0xa

    aget v5, p1, v9

    add-int/2addr v2, v5

    const v5, 0x432aff97

    add-int/2addr v2, v5

    invoke-static {v3, v0, v1, v4, v2}, Lru/mail/libverify/utils/g;->d(IIIII)I

    move-result v2

    const/16 v4, 0xf

    const/16 v5, 0xe

    aget v5, p1, v5

    add-int/2addr v1, v5

    const v5, -0x546bdc59

    add-int/2addr v1, v5

    invoke-static {v2, v3, v0, v4, v1}, Lru/mail/libverify/utils/g;->d(IIIII)I

    move-result v1

    const/16 v4, 0x15

    aget v5, p1, v7

    add-int/2addr v0, v5

    const v5, -0x36c5fc7

    add-int/2addr v0, v5

    invoke-static {v1, v2, v3, v4, v0}, Lru/mail/libverify/utils/g;->d(IIIII)I

    move-result v0

    const/16 v4, 0xc

    aget v4, p1, v4

    add-int/2addr v3, v4

    const v4, 0x655b59c3

    add-int/2addr v3, v4

    invoke-static {v0, v1, v2, v8, v3}, Lru/mail/libverify/utils/g;->d(IIIII)I

    move-result v3

    const/16 v4, 0xa

    const/4 v5, 0x3

    aget v5, p1, v5

    add-int/2addr v2, v5

    const v5, -0x70f3336e

    add-int/2addr v2, v5

    invoke-static {v3, v0, v1, v4, v2}, Lru/mail/libverify/utils/g;->d(IIIII)I

    move-result v2

    const/16 v4, 0xf

    const/16 v5, 0xa

    aget v5, p1, v5

    add-int/2addr v1, v5

    const v5, -0x100b83

    add-int/2addr v1, v5

    invoke-static {v2, v3, v0, v4, v1}, Lru/mail/libverify/utils/g;->d(IIIII)I

    move-result v1

    const/16 v4, 0x15

    const/4 v5, 0x1

    aget v5, p1, v5

    add-int/2addr v0, v5

    const v5, -0x7a7ba22f

    add-int/2addr v0, v5

    invoke-static {v1, v2, v3, v4, v0}, Lru/mail/libverify/utils/g;->d(IIIII)I

    move-result v0

    const/16 v4, 0x8

    aget v4, p1, v4

    add-int/2addr v3, v4

    const v4, 0x6fa87e4f

    add-int/2addr v3, v4

    invoke-static {v0, v1, v2, v8, v3}, Lru/mail/libverify/utils/g;->d(IIIII)I

    move-result v3

    const/16 v4, 0xa

    const/16 v5, 0xf

    aget v5, p1, v5

    add-int/2addr v2, v5

    const v5, -0x1d31920

    add-int/2addr v2, v5

    invoke-static {v3, v0, v1, v4, v2}, Lru/mail/libverify/utils/g;->d(IIIII)I

    move-result v2

    const/16 v4, 0xf

    aget v5, p1, v8

    add-int/2addr v1, v5

    const v5, -0x5cfebcec

    add-int/2addr v1, v5

    invoke-static {v2, v3, v0, v4, v1}, Lru/mail/libverify/utils/g;->d(IIIII)I

    move-result v1

    const/16 v4, 0x15

    const/16 v5, 0xd

    aget v5, p1, v5

    add-int/2addr v0, v5

    const v5, 0x4e0811a1    # 5.707142E8f

    add-int/2addr v0, v5

    invoke-static {v1, v2, v3, v4, v0}, Lru/mail/libverify/utils/g;->d(IIIII)I

    move-result v0

    aget v4, p1, v6

    add-int/2addr v3, v4

    const v4, -0x8ac817e

    add-int/2addr v3, v4

    invoke-static {v0, v1, v2, v8, v3}, Lru/mail/libverify/utils/g;->d(IIIII)I

    move-result v3

    const/16 v4, 0xa

    const/16 v5, 0xb

    aget v5, p1, v5

    add-int/2addr v2, v5

    const v5, -0x42c50dcb

    add-int/2addr v2, v5

    invoke-static {v3, v0, v1, v4, v2}, Lru/mail/libverify/utils/g;->d(IIIII)I

    move-result v2

    const/16 v4, 0xf

    const/4 v5, 0x2

    aget v5, p1, v5

    add-int/2addr v1, v5

    const v5, 0x2ad7d2bb

    add-int/2addr v1, v5

    invoke-static {v2, v3, v0, v4, v1}, Lru/mail/libverify/utils/g;->d(IIIII)I

    move-result v1

    const/16 v4, 0x15

    aget v5, p1, v10

    add-int/2addr v0, v5

    const v5, -0x14792c6f

    add-int/2addr v0, v5

    invoke-static {v1, v2, v3, v4, v0}, Lru/mail/libverify/utils/g;->d(IIIII)I

    move-result v0

    const/4 v4, 0x0

    aget v5, p2, v4

    add-int/2addr v3, v5

    aput v3, p2, v4

    const/4 v3, 0x1

    aget v4, p2, v3

    add-int/2addr v0, v4

    aput v0, p2, v3

    const/4 v0, 0x2

    aget v3, p2, v0

    add-int/2addr v1, v3

    aput v1, p2, v0

    const/4 v0, 0x3

    aget v1, p2, v0

    add-int/2addr v1, v2

    aput v1, p2, v0

    return-void
.end method

.method static a([B[II)[B
    .locals 4

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    if-ge v0, p2, :cond_0

    add-int/lit8 v2, v0, 0x1

    aget v3, p1, v1

    int-to-byte v3, v3

    aput-byte v3, p0, v0

    add-int/lit8 v0, v2, 0x1

    aget v3, p1, v1

    ushr-int/lit8 v3, v3, 0x8

    int-to-byte v3, v3

    aput-byte v3, p0, v2

    add-int/lit8 v2, v0, 0x1

    aget v3, p1, v1

    ushr-int/lit8 v3, v3, 0x10

    int-to-byte v3, v3

    aput-byte v3, p0, v0

    add-int/lit8 v0, v2, 0x1

    aget v3, p1, v1

    ushr-int/lit8 v3, v3, 0x18

    int-to-byte v3, v3

    aput-byte v3, p0, v2

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method private static b(IIIII)I
    .locals 3

    xor-int/lit8 v0, p2, -0x1

    and-int/2addr v0, p1

    and-int v1, p0, p2

    or-int/2addr v0, v1

    add-int/2addr v0, p4

    shl-int v1, v0, p3

    rsub-int/lit8 v2, p3, 0x20

    ushr-int/2addr v0, v2

    or-int/2addr v0, v1

    add-int/2addr v0, p0

    return v0
.end method

.method private static c(IIIII)I
    .locals 3

    xor-int v0, p0, p1

    xor-int/2addr v0, p2

    add-int/2addr v0, p4

    shl-int v1, v0, p3

    rsub-int/lit8 v2, p3, 0x20

    ushr-int/2addr v0, v2

    or-int/2addr v0, v1

    add-int/2addr v0, p0

    return v0
.end method

.method private static d(IIIII)I
    .locals 3

    xor-int/lit8 v0, p2, -0x1

    or-int/2addr v0, p0

    xor-int/2addr v0, p1

    add-int/2addr v0, p4

    shl-int v1, v0, p3

    rsub-int/lit8 v2, p3, 0x20

    ushr-int/2addr v0, v2

    or-int/2addr v0, v1

    add-int/2addr v0, p0

    return v0
.end method
