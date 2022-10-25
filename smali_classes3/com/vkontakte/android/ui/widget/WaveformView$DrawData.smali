.class Lcom/vkontakte/android/ui/widget/WaveformView$DrawData;
.super Ljava/lang/Object;
.source "WaveformView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/widget/WaveformView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DrawData"
.end annotation


# instance fields
.field maxValue:B

.field waveform:[B


# direct methods
.method public constructor <init>([BB)V
    .locals 0
    .param p1, "waveform"    # [B
    .param p2, "maxValue"    # B

    .prologue
    .line 311
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 312
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/WaveformView$DrawData;->waveform:[B

    .line 313
    iput-byte p2, p0, Lcom/vkontakte/android/ui/widget/WaveformView$DrawData;->maxValue:B

    .line 314
    return-void
.end method
