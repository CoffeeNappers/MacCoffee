.class public Lcom/wmspanel/libstream/Streamer$Size;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/wmspanel/libstream/Streamer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Size"
.end annotation


# instance fields
.field public height:I

.field public width:I


# direct methods
.method public constructor <init>(II)V
    .locals 0
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    iput p1, p0, Lcom/wmspanel/libstream/Streamer$Size;->width:I

    .line 90
    iput p2, p0, Lcom/wmspanel/libstream/Streamer$Size;->height:I

    .line 91
    return-void
.end method


# virtual methods
.method public getRatio()D
    .locals 4

    .prologue
    .line 94
    iget v0, p0, Lcom/wmspanel/libstream/Streamer$Size;->width:I

    int-to-double v0, v0

    iget v2, p0, Lcom/wmspanel/libstream/Streamer$Size;->height:I

    int-to-double v2, v2

    div-double/2addr v0, v2

    return-wide v0
.end method

.method public getVerticalRatio()D
    .locals 4

    .prologue
    .line 98
    iget v0, p0, Lcom/wmspanel/libstream/Streamer$Size;->height:I

    int-to-double v0, v0

    iget v2, p0, Lcom/wmspanel/libstream/Streamer$Size;->width:I

    int-to-double v2, v2

    div-double/2addr v0, v2

    return-wide v0
.end method
