.class Lcom/wmspanel/libstream/k;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field static final TAG:Ljava/lang/String; = "Rtmp"


# instance fields
.field aq:I

.field ck:I

.field cl:I

.field cm:I

.field cn:B

.field co:I


# direct methods
.method constructor <init>(B)V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput v1, p0, Lcom/wmspanel/libstream/k;->ck:I

    .line 19
    iput v1, p0, Lcom/wmspanel/libstream/k;->aq:I

    .line 20
    iput v1, p0, Lcom/wmspanel/libstream/k;->cl:I

    .line 21
    const/4 v0, -0x1

    iput v0, p0, Lcom/wmspanel/libstream/k;->cm:I

    .line 23
    iput v1, p0, Lcom/wmspanel/libstream/k;->co:I

    .line 26
    iput-byte p1, p0, Lcom/wmspanel/libstream/k;->cn:B

    .line 27
    return-void
.end method


# virtual methods
.method f([BII)I
    .locals 7

    .prologue
    const/4 v2, 0x0

    const/16 v3, 0x8

    const/4 v1, 0x4

    const/4 v4, 0x1

    const v6, 0xffffff

    .line 40
    iget v0, p0, Lcom/wmspanel/libstream/k;->cm:I

    const/4 v5, -0x1

    if-ne v0, v5, :cond_1

    .line 41
    iput v2, p0, Lcom/wmspanel/libstream/k;->cm:I

    .line 42
    iput p3, p0, Lcom/wmspanel/libstream/k;->aq:I

    iput p3, p0, Lcom/wmspanel/libstream/k;->ck:I

    .line 43
    iput p2, p0, Lcom/wmspanel/libstream/k;->cl:I

    .line 66
    :goto_0
    iget-byte v0, p0, Lcom/wmspanel/libstream/k;->cn:B

    if-ne v0, v3, :cond_5

    .line 67
    const/4 v0, 0x6

    .line 74
    :goto_1
    iget v5, p0, Lcom/wmspanel/libstream/k;->cm:I

    shl-int/lit8 v5, v5, 0x6

    or-int/2addr v0, v5

    int-to-byte v0, v0

    aput-byte v0, p1, v2

    .line 79
    iget v0, p0, Lcom/wmspanel/libstream/k;->cm:I

    packed-switch v0, :pswitch_data_0

    .line 131
    iget v0, p0, Lcom/wmspanel/libstream/k;->aq:I

    if-lt v0, v6, :cond_a

    .line 132
    iget v0, p0, Lcom/wmspanel/libstream/k;->ck:I

    invoke-static {p1, v1, v0}, Lcom/wmspanel/libstream/j;->e([BII)V

    .line 133
    const/4 v1, 0x5

    .line 137
    :cond_0
    :goto_2
    return v1

    .line 44
    :cond_1
    iget v0, p0, Lcom/wmspanel/libstream/k;->ck:I

    if-ge p3, v0, :cond_2

    .line 45
    iput v2, p0, Lcom/wmspanel/libstream/k;->cm:I

    .line 46
    iput p3, p0, Lcom/wmspanel/libstream/k;->aq:I

    iput p3, p0, Lcom/wmspanel/libstream/k;->ck:I

    .line 47
    iput p2, p0, Lcom/wmspanel/libstream/k;->cl:I

    goto :goto_0

    .line 48
    :cond_2
    iget v0, p0, Lcom/wmspanel/libstream/k;->cl:I

    if-eq v0, p2, :cond_3

    .line 49
    iput v4, p0, Lcom/wmspanel/libstream/k;->cm:I

    .line 50
    iget v0, p0, Lcom/wmspanel/libstream/k;->ck:I

    sub-int v0, p3, v0

    iput v0, p0, Lcom/wmspanel/libstream/k;->aq:I

    .line 51
    iput p3, p0, Lcom/wmspanel/libstream/k;->ck:I

    .line 52
    iput p2, p0, Lcom/wmspanel/libstream/k;->cl:I

    goto :goto_0

    .line 54
    :cond_3
    iget v0, p0, Lcom/wmspanel/libstream/k;->ck:I

    sub-int v0, p3, v0

    iget v5, p0, Lcom/wmspanel/libstream/k;->aq:I

    if-ne v0, v5, :cond_4

    .line 55
    const/4 v0, 0x3

    iput v0, p0, Lcom/wmspanel/libstream/k;->cm:I

    .line 56
    iput p3, p0, Lcom/wmspanel/libstream/k;->ck:I

    goto :goto_0

    .line 58
    :cond_4
    const/4 v0, 0x2

    iput v0, p0, Lcom/wmspanel/libstream/k;->cm:I

    .line 59
    iget v0, p0, Lcom/wmspanel/libstream/k;->ck:I

    sub-int v0, p3, v0

    iput v0, p0, Lcom/wmspanel/libstream/k;->aq:I

    .line 60
    iput p3, p0, Lcom/wmspanel/libstream/k;->ck:I

    goto :goto_0

    .line 68
    :cond_5
    iget-byte v0, p0, Lcom/wmspanel/libstream/k;->cn:B

    const/16 v5, 0x9

    if-ne v0, v5, :cond_6

    .line 69
    const/4 v0, 0x5

    goto :goto_1

    .line 70
    :cond_6
    iget-byte v0, p0, Lcom/wmspanel/libstream/k;->cn:B

    const/16 v5, 0x12

    if-ne v0, v5, :cond_c

    move v0, v1

    .line 71
    goto :goto_1

    .line 81
    :pswitch_0
    iget v0, p0, Lcom/wmspanel/libstream/k;->ck:I

    if-lt v0, v6, :cond_7

    .line 82
    invoke-static {p1, v4, v6}, Lcom/wmspanel/libstream/j;->c([BII)V

    .line 87
    :goto_3
    iget v0, p0, Lcom/wmspanel/libstream/k;->cl:I

    invoke-static {p1, v1, v0}, Lcom/wmspanel/libstream/j;->c([BII)V

    .line 88
    const/4 v0, 0x7

    iget-byte v1, p0, Lcom/wmspanel/libstream/k;->cn:B

    aput-byte v1, p1, v0

    .line 90
    iget v0, p0, Lcom/wmspanel/libstream/k;->co:I

    invoke-static {p1, v3, v0}, Lcom/wmspanel/libstream/j;->d([BII)V

    .line 91
    const/16 v1, 0xc

    .line 93
    iget v0, p0, Lcom/wmspanel/libstream/k;->ck:I

    if-lt v0, v6, :cond_0

    .line 94
    const/16 v0, 0xc

    iget v1, p0, Lcom/wmspanel/libstream/k;->ck:I

    invoke-static {p1, v0, v1}, Lcom/wmspanel/libstream/j;->e([BII)V

    .line 95
    const/16 v1, 0x10

    goto :goto_2

    .line 84
    :cond_7
    iget v0, p0, Lcom/wmspanel/libstream/k;->ck:I

    invoke-static {p1, v4, v0}, Lcom/wmspanel/libstream/j;->c([BII)V

    goto :goto_3

    .line 99
    :pswitch_1
    iget v0, p0, Lcom/wmspanel/libstream/k;->aq:I

    if-lt v0, v6, :cond_8

    .line 100
    invoke-static {p1, v4, v6}, Lcom/wmspanel/libstream/j;->c([BII)V

    .line 105
    :goto_4
    iget v0, p0, Lcom/wmspanel/libstream/k;->cl:I

    invoke-static {p1, v1, v0}, Lcom/wmspanel/libstream/j;->c([BII)V

    .line 106
    const/4 v0, 0x7

    iget-byte v1, p0, Lcom/wmspanel/libstream/k;->cn:B

    aput-byte v1, p1, v0

    .line 110
    iget v0, p0, Lcom/wmspanel/libstream/k;->aq:I

    if-lt v0, v6, :cond_b

    .line 111
    iget v0, p0, Lcom/wmspanel/libstream/k;->aq:I

    invoke-static {p1, v3, v0}, Lcom/wmspanel/libstream/j;->e([BII)V

    .line 112
    const/16 v1, 0xc

    goto/16 :goto_2

    .line 102
    :cond_8
    iget v0, p0, Lcom/wmspanel/libstream/k;->aq:I

    invoke-static {p1, v4, v0}, Lcom/wmspanel/libstream/j;->c([BII)V

    goto :goto_4

    .line 116
    :pswitch_2
    iget v0, p0, Lcom/wmspanel/libstream/k;->aq:I

    if-lt v0, v6, :cond_9

    .line 117
    invoke-static {p1, v4, v6}, Lcom/wmspanel/libstream/j;->c([BII)V

    .line 124
    :goto_5
    iget v0, p0, Lcom/wmspanel/libstream/k;->aq:I

    if-lt v0, v6, :cond_0

    .line 125
    iget v0, p0, Lcom/wmspanel/libstream/k;->ck:I

    invoke-static {p1, v1, v0}, Lcom/wmspanel/libstream/j;->e([BII)V

    move v1, v3

    .line 126
    goto/16 :goto_2

    .line 119
    :cond_9
    iget v0, p0, Lcom/wmspanel/libstream/k;->aq:I

    invoke-static {p1, v4, v0}, Lcom/wmspanel/libstream/j;->c([BII)V

    goto :goto_5

    :cond_a
    move v1, v4

    goto/16 :goto_2

    :cond_b
    move v1, v3

    goto/16 :goto_2

    :cond_c
    move v0, v2

    goto/16 :goto_1

    .line 79
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method l(I)V
    .locals 0

    .prologue
    .line 30
    iput p1, p0, Lcom/wmspanel/libstream/k;->co:I

    .line 31
    return-void
.end method
