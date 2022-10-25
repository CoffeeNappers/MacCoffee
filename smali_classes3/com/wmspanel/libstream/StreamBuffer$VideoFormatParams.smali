.class public Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/wmspanel/libstream/StreamBuffer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "VideoFormatParams"
.end annotation


# instance fields
.field public pps_buf:[B

.field public pps_len:I

.field public sps_buf:[B

.field public sps_len:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 88
    iput v0, p0, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->sps_len:I

    .line 89
    iput v0, p0, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->pps_len:I

    .line 90
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 94
    if-ne p0, p1, :cond_1

    .line 104
    .end local p1    # "other":Ljava/lang/Object;
    :cond_0
    :goto_0
    return v0

    .line 98
    .restart local p1    # "other":Ljava/lang/Object;
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_3

    :cond_2
    move v0, v1

    .line 99
    goto :goto_0

    .line 102
    :cond_3
    check-cast p1, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;

    .line 104
    .end local p1    # "other":Ljava/lang/Object;
    iget v2, p0, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->sps_len:I

    iget v3, p1, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->sps_len:I

    if-ne v2, v3, :cond_4

    iget-object v2, p0, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->sps_buf:[B

    iget-object v3, p1, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->sps_buf:[B

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v2

    if-eqz v2, :cond_4

    iget v2, p0, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->pps_len:I

    iget v3, p1, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->pps_len:I

    if-ne v2, v3, :cond_4

    iget-object v2, p0, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->pps_buf:[B

    iget-object v3, p1, Lcom/wmspanel/libstream/StreamBuffer$VideoFormatParams;->pps_buf:[B

    .line 105
    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v2

    if-nez v2, :cond_0

    :cond_4
    move v0, v1

    goto :goto_0
.end method
