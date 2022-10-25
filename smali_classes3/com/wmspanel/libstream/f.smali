.class Lcom/wmspanel/libstream/f;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field X:I

.field height:I

.field width:I


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static a([BI)Lcom/wmspanel/libstream/f;
    .locals 4

    .prologue
    const/4 v0, 0x0

    .line 301
    :try_start_0
    new-instance v1, Lcom/wmspanel/libstream/e;

    invoke-direct {v1, p0, p1}, Lcom/wmspanel/libstream/e;-><init>([BI)V

    .line 304
    invoke-virtual {v1}, Lcom/wmspanel/libstream/e;->A()I

    move-result v2

    .line 306
    and-int/lit8 v2, v2, 0x1f

    .line 308
    const/4 v3, 0x7

    if-eq v2, v3, :cond_0

    .line 327
    :goto_0
    return-object v0

    .line 312
    :cond_0
    const/4 v2, 0x1

    add-int/lit8 v3, p1, -0x1

    invoke-static {p0, v2, v3}, Lcom/wmspanel/libstream/f;->b([BII)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 313
    invoke-static {v1}, Lcom/wmspanel/libstream/f;->b(Lcom/wmspanel/libstream/e;)Lcom/wmspanel/libstream/f;

    move-result-object v0

    goto :goto_0

    .line 317
    :cond_1
    add-int/lit8 v1, p1, -0x1

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 318
    const/4 v2, 0x1

    add-int/lit8 v3, p1, -0x1

    invoke-virtual {v1, p0, v2, v3}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 320
    invoke-static {v1}, Lcom/wmspanel/libstream/f;->b(Ljava/nio/ByteBuffer;)V

    .line 322
    new-instance v2, Lcom/wmspanel/libstream/e;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v3

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    invoke-direct {v2, v3, v1}, Lcom/wmspanel/libstream/e;-><init>([BI)V

    .line 323
    invoke-static {v2}, Lcom/wmspanel/libstream/f;->b(Lcom/wmspanel/libstream/e;)Lcom/wmspanel/libstream/f;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_0

    .line 325
    :catch_0
    move-exception v1

    .line 326
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private static a(Lcom/wmspanel/libstream/e;I)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/wmspanel/libstream/e$a;
        }
    .end annotation

    .prologue
    const/16 v1, 0x8

    .line 52
    .line 55
    const/4 v0, 0x0

    move v2, v1

    move v3, v1

    move v1, v0

    move v0, v3

    :goto_0
    if-ge v1, p1, :cond_1

    .line 56
    if-eqz v0, :cond_0

    .line 57
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->D()I

    move-result v0

    .line 58
    add-int/2addr v0, v2

    add-int/lit16 v0, v0, 0x100

    rem-int/lit16 v0, v0, 0x100

    .line 61
    :cond_0
    if-nez v0, :cond_2

    .line 67
    :cond_1
    return-void

    .line 55
    :cond_2
    add-int/lit8 v1, v1, 0x1

    move v2, v0

    goto :goto_0
.end method

.method private static a(Lcom/wmspanel/libstream/e;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/wmspanel/libstream/e$a;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 70
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->C()I

    move-result v2

    .line 71
    const/16 v3, 0x400

    if-le v2, v3, :cond_0

    .line 90
    :goto_0
    return v0

    .line 76
    :cond_0
    const/16 v3, 0x8

    invoke-virtual {p0, v3}, Lcom/wmspanel/libstream/e;->skip(I)V

    .line 78
    :goto_1
    if-gt v0, v2, :cond_1

    .line 80
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->C()I

    .line 83
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->C()I

    .line 86
    invoke-virtual {p0, v1}, Lcom/wmspanel/libstream/e;->skip(I)V

    .line 78
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 89
    :cond_1
    const/16 v0, 0x14

    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/e;->skip(I)V

    move v0, v1

    .line 90
    goto :goto_0
.end method

.method private static b(Lcom/wmspanel/libstream/e;)Lcom/wmspanel/libstream/f;
    .locals 9

    .prologue
    const/4 v6, 0x3

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v5, 0x1

    .line 100
    :try_start_0
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->A()I

    move-result v2

    .line 103
    const/16 v3, 0x10

    invoke-virtual {p0, v3}, Lcom/wmspanel/libstream/e;->skip(I)V

    .line 105
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->C()I

    .line 107
    const/16 v3, 0x64

    if-eq v2, v3, :cond_0

    const/16 v3, 0x6e

    if-eq v2, v3, :cond_0

    const/16 v3, 0x7a

    if-eq v2, v3, :cond_0

    const/16 v3, 0xf4

    if-eq v2, v3, :cond_0

    const/16 v3, 0x2c

    if-eq v2, v3, :cond_0

    const/16 v3, 0x53

    if-eq v2, v3, :cond_0

    const/16 v3, 0x56

    if-eq v2, v3, :cond_0

    const/16 v3, 0x76

    if-eq v2, v3, :cond_0

    const/16 v3, 0x80

    if-eq v2, v3, :cond_0

    const/16 v3, 0x8a

    if-eq v2, v3, :cond_0

    const/16 v3, 0x90

    if-ne v2, v3, :cond_6

    .line 112
    :cond_0
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->C()I

    move-result v4

    .line 113
    if-ne v4, v6, :cond_1

    .line 114
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/wmspanel/libstream/e;->skip(I)V

    .line 117
    :cond_1
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->C()I

    .line 119
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->C()I

    .line 121
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/wmspanel/libstream/e;->skip(I)V

    .line 123
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->B()I

    move-result v2

    .line 125
    if-eqz v2, :cond_6

    move v3, v1

    .line 126
    :goto_0
    if-eq v4, v6, :cond_3

    const/16 v2, 0x8

    :goto_1
    if-ge v3, v2, :cond_6

    .line 127
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->B()I

    move-result v2

    .line 129
    if-eqz v2, :cond_2

    .line 130
    const/4 v2, 0x6

    if-ge v3, v2, :cond_4

    .line 131
    const/16 v2, 0x10

    invoke-static {p0, v2}, Lcom/wmspanel/libstream/f;->a(Lcom/wmspanel/libstream/e;I)V

    .line 126
    :cond_2
    :goto_2
    add-int/lit8 v2, v3, 0x1

    move v3, v2

    goto :goto_0

    :cond_3
    const/16 v2, 0xc

    goto :goto_1

    .line 133
    :cond_4
    const/16 v2, 0x40

    invoke-static {p0, v2}, Lcom/wmspanel/libstream/f;->a(Lcom/wmspanel/libstream/e;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 290
    :catch_0
    move-exception v1

    .line 291
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 294
    :cond_5
    :goto_3
    return-object v0

    .line 140
    :cond_6
    :try_start_1
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->C()I

    .line 142
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->C()I

    move-result v2

    .line 143
    if-nez v2, :cond_13

    .line 144
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->C()I

    .line 163
    :cond_7
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->C()I

    .line 165
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/wmspanel/libstream/e;->skip(I)V

    .line 167
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->C()I

    move-result v6

    .line 169
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->C()I

    move-result v7

    .line 171
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->B()I

    move-result v8

    .line 173
    if-nez v8, :cond_8

    .line 174
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/wmspanel/libstream/e;->skip(I)V

    .line 177
    :cond_8
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/wmspanel/libstream/e;->skip(I)V

    .line 179
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->B()I

    move-result v2

    .line 186
    if-eqz v2, :cond_14

    .line 187
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->C()I

    move-result v4

    .line 188
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->C()I

    move-result v3

    .line 189
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->C()I

    move-result v2

    .line 190
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->C()I

    move-result v1

    move v5, v4

    move v4, v3

    move v3, v2

    move v2, v1

    .line 193
    :goto_4
    new-instance v1, Lcom/wmspanel/libstream/f;

    invoke-direct {v1}, Lcom/wmspanel/libstream/f;-><init>()V

    .line 194
    add-int/lit8 v6, v6, 0x1

    mul-int/lit8 v6, v6, 0x10

    mul-int/lit8 v5, v5, 0x2

    sub-int v5, v6, v5

    mul-int/lit8 v4, v4, 0x2

    sub-int v4, v5, v4

    iput v4, v1, Lcom/wmspanel/libstream/f;->width:I

    .line 195
    rsub-int/lit8 v4, v8, 0x2

    add-int/lit8 v5, v7, 0x1

    mul-int/2addr v4, v5

    mul-int/lit8 v4, v4, 0x10

    mul-int/lit8 v3, v3, 0x2

    sub-int v3, v4, v3

    mul-int/lit8 v2, v2, 0x2

    sub-int v2, v3, v2

    iput v2, v1, Lcom/wmspanel/libstream/f;->height:I

    .line 197
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->B()I

    move-result v2

    .line 199
    if-eqz v2, :cond_12

    .line 202
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->B()I

    move-result v2

    .line 204
    if-eqz v2, :cond_9

    .line 205
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->A()I

    move-result v2

    .line 207
    const/16 v3, 0xff

    .line 208
    if-ne v2, v3, :cond_9

    .line 211
    const/16 v2, 0x20

    invoke-virtual {p0, v2}, Lcom/wmspanel/libstream/e;->skip(I)V

    .line 215
    :cond_9
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->B()I

    move-result v2

    .line 217
    if-eqz v2, :cond_a

    .line 219
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/wmspanel/libstream/e;->skip(I)V

    .line 222
    :cond_a
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->B()I

    move-result v2

    .line 223
    if-eqz v2, :cond_b

    .line 225
    const/4 v2, 0x4

    invoke-virtual {p0, v2}, Lcom/wmspanel/libstream/e;->skip(I)V

    .line 227
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->B()I

    move-result v2

    .line 228
    if-eqz v2, :cond_b

    .line 230
    const/16 v2, 0x18

    invoke-virtual {p0, v2}, Lcom/wmspanel/libstream/e;->skip(I)V

    .line 234
    :cond_b
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->B()I

    move-result v2

    .line 236
    if-eqz v2, :cond_c

    .line 237
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->C()I

    .line 238
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->C()I

    .line 241
    :cond_c
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->B()I

    move-result v2

    .line 243
    if-eqz v2, :cond_d

    .line 245
    const/16 v2, 0x41

    invoke-virtual {p0, v2}, Lcom/wmspanel/libstream/e;->skip(I)V

    .line 248
    :cond_d
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->B()I

    move-result v2

    .line 250
    if-eqz v2, :cond_e

    .line 251
    invoke-static {p0}, Lcom/wmspanel/libstream/f;->a(Lcom/wmspanel/libstream/e;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 256
    :cond_e
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->B()I

    move-result v3

    .line 258
    if-eqz v3, :cond_f

    .line 259
    invoke-static {p0}, Lcom/wmspanel/libstream/f;->a(Lcom/wmspanel/libstream/e;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 264
    :cond_f
    if-nez v2, :cond_10

    if-eqz v3, :cond_11

    .line 266
    :cond_10
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/wmspanel/libstream/e;->skip(I)V

    .line 269
    :cond_11
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/wmspanel/libstream/e;->skip(I)V

    .line 271
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->B()I

    move-result v2

    .line 272
    if-eqz v2, :cond_12

    .line 274
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/wmspanel/libstream/e;->skip(I)V

    .line 276
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->C()I

    .line 277
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->C()I

    .line 279
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->C()I

    .line 281
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->C()I

    .line 283
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->C()I

    move-result v2

    .line 285
    iput v2, v1, Lcom/wmspanel/libstream/f;->X:I

    .line 287
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->C()I

    :cond_12
    move-object v0, v1

    .line 294
    goto/16 :goto_3

    .line 145
    :cond_13
    if-ne v2, v5, :cond_7

    .line 146
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/wmspanel/libstream/e;->skip(I)V

    .line 148
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->D()I

    .line 150
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->D()I

    .line 152
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->C()I

    move-result v3

    .line 154
    const/16 v2, 0x400

    if-gt v3, v2, :cond_5

    move v2, v1

    .line 158
    :goto_5
    if-ge v2, v3, :cond_7

    .line 159
    invoke-virtual {p0}, Lcom/wmspanel/libstream/e;->D()I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 158
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    :cond_14
    move v2, v1

    move v3, v1

    move v4, v1

    move v5, v1

    goto/16 :goto_4
.end method

.method private static b(Ljava/nio/ByteBuffer;)V
    .locals 4

    .prologue
    const/4 v3, 0x3

    .line 28
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    if-ge v0, v3, :cond_1

    .line 41
    :cond_0
    return-void

    .line 32
    :cond_1
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    add-int/lit8 v1, v0, -0x3

    .line 34
    const/4 v0, 0x0

    :goto_0
    if-gt v0, v1, :cond_0

    .line 35
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v2

    if-nez v2, :cond_2

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v2

    if-nez v2, :cond_2

    add-int/lit8 v2, v0, 0x2

    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v2

    if-ne v2, v3, :cond_2

    .line 36
    add-int/lit8 v1, v0, 0x2

    invoke-static {p0, v1}, Lcom/wmspanel/libstream/f;->b(Ljava/nio/ByteBuffer;I)V

    .line 37
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    add-int/lit8 v1, v1, -0x3

    .line 38
    add-int/lit8 v0, v0, 0x2

    .line 34
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private static b(Ljava/nio/ByteBuffer;I)V
    .locals 4

    .prologue
    .line 44
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 45
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    add-int/lit8 v1, p1, 0x1

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    sub-int/2addr v3, p1

    add-int/lit8 v3, v3, -0x1

    invoke-static {v0, v1, v2, p1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 46
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 48
    :cond_0
    return-void
.end method

.method private static b([BII)Z
    .locals 4

    .prologue
    const/4 v3, 0x3

    const/4 v0, 0x1

    .line 12
    if-ge p2, v3, :cond_1

    .line 23
    :cond_0
    :goto_0
    return v0

    .line 16
    :cond_1
    add-int/lit8 v1, p2, -0x3

    .line 18
    :goto_1
    if-gt p1, v1, :cond_0

    .line 19
    aget-byte v2, p0, p1

    if-nez v2, :cond_2

    add-int/lit8 v2, p1, 0x1

    aget-byte v2, p0, v2

    if-nez v2, :cond_2

    add-int/lit8 v2, p1, 0x2

    aget-byte v2, p0, v2

    if-ne v2, v3, :cond_2

    .line 20
    const/4 v0, 0x0

    goto :goto_0

    .line 18
    :cond_2
    add-int/lit8 p1, p1, 0x1

    goto :goto_1
.end method
