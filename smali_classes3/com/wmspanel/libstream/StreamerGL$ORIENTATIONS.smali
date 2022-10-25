.class public Lcom/wmspanel/libstream/StreamerGL$ORIENTATIONS;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/wmspanel/libstream/StreamerGL;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ORIENTATIONS"
.end annotation


# static fields
.field public static HORIZON:I

.field public static LANDSCAPE:I

.field public static PORTRAIT:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 20
    const/4 v0, 0x0

    sput v0, Lcom/wmspanel/libstream/StreamerGL$ORIENTATIONS;->LANDSCAPE:I

    .line 21
    const/4 v0, 0x1

    sput v0, Lcom/wmspanel/libstream/StreamerGL$ORIENTATIONS;->PORTRAIT:I

    .line 22
    const/4 v0, 0x2

    sput v0, Lcom/wmspanel/libstream/StreamerGL$ORIENTATIONS;->HORIZON:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
