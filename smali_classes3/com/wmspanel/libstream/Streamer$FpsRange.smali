.class public Lcom/wmspanel/libstream/Streamer$FpsRange;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/wmspanel/libstream/Streamer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FpsRange"
.end annotation


# instance fields
.field public fpsMax:F

.field public fpsMin:F


# direct methods
.method public constructor <init>(FF)V
    .locals 0
    .param p1, "min"    # F
    .param p2, "max"    # F

    .prologue
    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 107
    iput p1, p0, Lcom/wmspanel/libstream/Streamer$FpsRange;->fpsMin:F

    .line 108
    iput p2, p0, Lcom/wmspanel/libstream/Streamer$FpsRange;->fpsMax:F

    .line 109
    return-void
.end method
