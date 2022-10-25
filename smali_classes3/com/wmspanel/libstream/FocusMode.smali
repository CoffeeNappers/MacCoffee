.class public Lcom/wmspanel/libstream/FocusMode;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public antibandingMode:I

.field public antibandingMode16:Ljava/lang/String;

.field public awbMode:I

.field public awbMode16:Ljava/lang/String;

.field public exposureCompensation:I

.field public focusDistance:F

.field public focusMode:I

.field public focusMode16:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    const-string/jumbo v0, "continuous-video"

    iput-object v0, p0, Lcom/wmspanel/libstream/FocusMode;->focusMode16:Ljava/lang/String;

    .line 21
    const-string/jumbo v0, "auto"

    iput-object v0, p0, Lcom/wmspanel/libstream/FocusMode;->awbMode16:Ljava/lang/String;

    .line 22
    const-string/jumbo v0, "off"

    iput-object v0, p0, Lcom/wmspanel/libstream/FocusMode;->antibandingMode16:Ljava/lang/String;

    .line 24
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    .line 25
    const/4 v0, 0x3

    iput v0, p0, Lcom/wmspanel/libstream/FocusMode;->focusMode:I

    .line 26
    const/4 v0, 0x1

    iput v0, p0, Lcom/wmspanel/libstream/FocusMode;->awbMode:I

    .line 27
    const/4 v0, 0x0

    iput v0, p0, Lcom/wmspanel/libstream/FocusMode;->antibandingMode:I

    .line 29
    :cond_0
    return-void
.end method
