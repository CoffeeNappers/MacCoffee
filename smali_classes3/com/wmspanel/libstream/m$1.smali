.class synthetic Lcom/wmspanel/libstream/m$1;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/wmspanel/libstream/m;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic bA:[I

.field static final synthetic cM:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 175
    invoke-static {}, Lcom/wmspanel/libstream/BufferItem$a;->values()[Lcom/wmspanel/libstream/BufferItem$a;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/wmspanel/libstream/m$1;->bA:[I

    :try_start_0
    sget-object v0, Lcom/wmspanel/libstream/m$1;->bA:[I

    sget-object v1, Lcom/wmspanel/libstream/BufferItem$a;->B:Lcom/wmspanel/libstream/BufferItem$a;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/BufferItem$a;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_b

    :goto_0
    :try_start_1
    sget-object v0, Lcom/wmspanel/libstream/m$1;->bA:[I

    sget-object v1, Lcom/wmspanel/libstream/BufferItem$a;->C:Lcom/wmspanel/libstream/BufferItem$a;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/BufferItem$a;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_a

    .line 120
    :goto_1
    invoke-static {}, Lcom/wmspanel/libstream/m$a;->values()[Lcom/wmspanel/libstream/m$a;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/wmspanel/libstream/m$1;->cM:[I

    :try_start_2
    sget-object v0, Lcom/wmspanel/libstream/m$1;->cM:[I

    sget-object v1, Lcom/wmspanel/libstream/m$a;->cQ:Lcom/wmspanel/libstream/m$a;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/m$a;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_9

    :goto_2
    :try_start_3
    sget-object v0, Lcom/wmspanel/libstream/m$1;->cM:[I

    sget-object v1, Lcom/wmspanel/libstream/m$a;->cW:Lcom/wmspanel/libstream/m$a;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/m$a;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_8

    :goto_3
    :try_start_4
    sget-object v0, Lcom/wmspanel/libstream/m$1;->cM:[I

    sget-object v1, Lcom/wmspanel/libstream/m$a;->cX:Lcom/wmspanel/libstream/m$a;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/m$a;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_7

    :goto_4
    :try_start_5
    sget-object v0, Lcom/wmspanel/libstream/m$1;->cM:[I

    sget-object v1, Lcom/wmspanel/libstream/m$a;->cO:Lcom/wmspanel/libstream/m$a;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/m$a;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_6

    :goto_5
    :try_start_6
    sget-object v0, Lcom/wmspanel/libstream/m$1;->cM:[I

    sget-object v1, Lcom/wmspanel/libstream/m$a;->cP:Lcom/wmspanel/libstream/m$a;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/m$a;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_5

    :goto_6
    :try_start_7
    sget-object v0, Lcom/wmspanel/libstream/m$1;->cM:[I

    sget-object v1, Lcom/wmspanel/libstream/m$a;->cR:Lcom/wmspanel/libstream/m$a;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/m$a;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_4

    :goto_7
    :try_start_8
    sget-object v0, Lcom/wmspanel/libstream/m$1;->cM:[I

    sget-object v1, Lcom/wmspanel/libstream/m$a;->cS:Lcom/wmspanel/libstream/m$a;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/m$a;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_3

    :goto_8
    :try_start_9
    sget-object v0, Lcom/wmspanel/libstream/m$1;->cM:[I

    sget-object v1, Lcom/wmspanel/libstream/m$a;->cT:Lcom/wmspanel/libstream/m$a;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/m$a;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_9} :catch_2

    :goto_9
    :try_start_a
    sget-object v0, Lcom/wmspanel/libstream/m$1;->cM:[I

    sget-object v1, Lcom/wmspanel/libstream/m$a;->cU:Lcom/wmspanel/libstream/m$a;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/m$a;->ordinal()I

    move-result v1

    const/16 v2, 0x9

    aput v2, v0, v1
    :try_end_a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_a .. :try_end_a} :catch_1

    :goto_a
    :try_start_b
    sget-object v0, Lcom/wmspanel/libstream/m$1;->cM:[I

    sget-object v1, Lcom/wmspanel/libstream/m$a;->cV:Lcom/wmspanel/libstream/m$a;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/m$a;->ordinal()I

    move-result v1

    const/16 v2, 0xa

    aput v2, v0, v1
    :try_end_b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_b .. :try_end_b} :catch_0

    :goto_b
    return-void

    :catch_0
    move-exception v0

    goto :goto_b

    :catch_1
    move-exception v0

    goto :goto_a

    :catch_2
    move-exception v0

    goto :goto_9

    :catch_3
    move-exception v0

    goto :goto_8

    :catch_4
    move-exception v0

    goto :goto_7

    :catch_5
    move-exception v0

    goto :goto_6

    :catch_6
    move-exception v0

    goto :goto_5

    :catch_7
    move-exception v0

    goto :goto_4

    :catch_8
    move-exception v0

    goto :goto_3

    :catch_9
    move-exception v0

    goto :goto_2

    .line 175
    :catch_a
    move-exception v0

    goto/16 :goto_1

    :catch_b
    move-exception v0

    goto/16 :goto_0
.end method
