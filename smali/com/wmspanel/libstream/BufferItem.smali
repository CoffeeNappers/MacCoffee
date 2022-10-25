.class Lcom/wmspanel/libstream/BufferItem;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/wmspanel/libstream/BufferItem$BufferFlag;,
        Lcom/wmspanel/libstream/BufferItem$a;
    }
.end annotation


# instance fields
.field private A:I

.field private mFrameId:J

.field private mMessageIndex:J

.field private w:[B

.field private x:J

.field private y:Lcom/wmspanel/libstream/BufferItem$a;

.field private z:[B


# direct methods
.method private constructor <init>(JLcom/wmspanel/libstream/BufferItem$a;I)V
    .locals 3
    .param p1, "frameId"    # J
    .param p3, "type"    # Lcom/wmspanel/libstream/BufferItem$a;
    .param p4, "len"    # I

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-wide p1, p0, Lcom/wmspanel/libstream/BufferItem;->mFrameId:J

    .line 40
    iput-object p3, p0, Lcom/wmspanel/libstream/BufferItem;->y:Lcom/wmspanel/libstream/BufferItem$a;

    .line 41
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/wmspanel/libstream/BufferItem;->mMessageIndex:J

    .line 42
    new-array v0, p4, [B

    iput-object v0, p0, Lcom/wmspanel/libstream/BufferItem;->w:[B

    .line 43
    return-void
.end method

.method static a(JI)Lcom/wmspanel/libstream/BufferItem;
    .locals 2

    .prologue
    .line 46
    new-instance v0, Lcom/wmspanel/libstream/BufferItem;

    sget-object v1, Lcom/wmspanel/libstream/BufferItem$a;->C:Lcom/wmspanel/libstream/BufferItem$a;

    invoke-direct {v0, p0, p1, v1, p2}, Lcom/wmspanel/libstream/BufferItem;-><init>(JLcom/wmspanel/libstream/BufferItem$a;I)V

    return-object v0
.end method

.method static b(JI)Lcom/wmspanel/libstream/BufferItem;
    .locals 2

    .prologue
    .line 50
    new-instance v0, Lcom/wmspanel/libstream/BufferItem;

    sget-object v1, Lcom/wmspanel/libstream/BufferItem$a;->B:Lcom/wmspanel/libstream/BufferItem$a;

    invoke-direct {v0, p0, p1, v1, p2}, Lcom/wmspanel/libstream/BufferItem;-><init>(JLcom/wmspanel/libstream/BufferItem$a;I)V

    return-object v0
.end method


# virtual methods
.method a(J)V
    .locals 1

    .prologue
    .line 79
    iput-wide p1, p0, Lcom/wmspanel/libstream/BufferItem;->mMessageIndex:J

    .line 80
    return-void
.end method

.method c([B)V
    .locals 0

    .prologue
    .line 91
    iput-object p1, p0, Lcom/wmspanel/libstream/BufferItem;->z:[B

    .line 92
    return-void
.end method

.method getData()[B
    .locals 1

    .prologue
    .line 87
    iget-object v0, p0, Lcom/wmspanel/libstream/BufferItem;->w:[B

    return-object v0
.end method

.method getFlags()I
    .locals 1

    .prologue
    .line 59
    iget v0, p0, Lcom/wmspanel/libstream/BufferItem;->A:I

    return v0
.end method

.method getTimestamp()J
    .locals 2

    .prologue
    .line 71
    iget-wide v0, p0, Lcom/wmspanel/libstream/BufferItem;->x:J

    return-wide v0
.end method

.method m()Lcom/wmspanel/libstream/BufferItem$a;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lcom/wmspanel/libstream/BufferItem;->y:Lcom/wmspanel/libstream/BufferItem$a;

    return-object v0
.end method

.method n()J
    .locals 2

    .prologue
    .line 75
    iget-wide v0, p0, Lcom/wmspanel/libstream/BufferItem;->mFrameId:J

    return-wide v0
.end method

.method o()J
    .locals 2

    .prologue
    .line 83
    iget-wide v0, p0, Lcom/wmspanel/libstream/BufferItem;->mMessageIndex:J

    return-wide v0
.end method

.method p()[B
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lcom/wmspanel/libstream/BufferItem;->z:[B

    return-object v0
.end method

.method q()Z
    .locals 4

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 99
    sget-object v2, Lcom/wmspanel/libstream/BufferItem$a;->B:Lcom/wmspanel/libstream/BufferItem$a;

    iget-object v3, p0, Lcom/wmspanel/libstream/BufferItem;->y:Lcom/wmspanel/libstream/BufferItem$a;

    if-eq v2, v3, :cond_0

    .line 100
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "not applicable to audio frame"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 106
    :cond_0
    iget v2, p0, Lcom/wmspanel/libstream/BufferItem;->A:I

    and-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_2

    .line 114
    :cond_1
    :goto_0
    return v0

    .line 109
    :cond_2
    iget-object v2, p0, Lcom/wmspanel/libstream/BufferItem;->w:[B

    aget-byte v2, v2, v1

    shr-int/lit8 v2, v2, 0x5

    and-int/lit8 v2, v2, 0x3

    .line 110
    iget-object v3, p0, Lcom/wmspanel/libstream/BufferItem;->w:[B

    aget-byte v3, v3, v1

    and-int/lit8 v3, v3, 0x1f

    .line 111
    if-eqz v2, :cond_3

    const/4 v2, 0x5

    if-eq v3, v2, :cond_1

    :cond_3
    move v0, v1

    .line 114
    goto :goto_0
.end method

.method setFlags(I)V
    .locals 0
    .param p1, "flags"    # I

    .prologue
    .line 54
    iput p1, p0, Lcom/wmspanel/libstream/BufferItem;->A:I

    .line 55
    return-void
.end method

.method setTimestamp(J)V
    .locals 1
    .param p1, "ts"    # J

    .prologue
    .line 67
    iput-wide p1, p0, Lcom/wmspanel/libstream/BufferItem;->x:J

    .line 68
    return-void
.end method
