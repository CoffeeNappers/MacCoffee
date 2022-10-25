.class Lcom/wmspanel/libstream/VideoLetterboxCalc;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "VideoLetterboxCalc"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static calculateLetterboxing(Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;Lcom/wmspanel/libstream/Streamer$Size;)V
    .locals 14
    .param p0, "info"    # Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;
    .param p1, "streamSize"    # Lcom/wmspanel/libstream/Streamer$Size;

    .prologue
    const-wide v12, 0x3f847ae147ae147bL    # 0.01

    const/high16 v8, 0x3f800000    # 1.0f

    .line 9
    iget v0, p1, Lcom/wmspanel/libstream/Streamer$Size;->width:I

    int-to-double v0, v0

    iget v2, p1, Lcom/wmspanel/libstream/Streamer$Size;->height:I

    int-to-double v2, v2

    div-double/2addr v0, v2

    .line 10
    iget-object v2, p0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->videoSize:Lcom/wmspanel/libstream/Streamer$Size;

    iget v2, v2, Lcom/wmspanel/libstream/Streamer$Size;->width:I

    int-to-double v2, v2

    iget-object v4, p0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->videoSize:Lcom/wmspanel/libstream/Streamer$Size;

    iget v4, v4, Lcom/wmspanel/libstream/Streamer$Size;->height:I

    int-to-double v4, v4

    div-double/2addr v2, v4

    .line 11
    div-double v4, v0, v2

    const-wide/high16 v6, 0x3ff0000000000000L    # 1.0

    sub-double/2addr v4, v6

    .line 13
    iput v8, p0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale_letterbox:F

    .line 14
    iput v8, p0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale:F

    .line 15
    iput v8, p0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale_landscape_pillarbox:F

    .line 16
    iput v8, p0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale_landscape_letterbox:F

    .line 17
    iput v8, p0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale_horizon:F

    .line 23
    invoke-static {v4, v5}, Ljava/lang/Math;->abs(D)D

    move-result-wide v6

    cmpg-double v6, v6, v12

    if-gez v6, :cond_1

    .line 26
    iget v0, p1, Lcom/wmspanel/libstream/Streamer$Size;->width:I

    int-to-float v0, v0

    .line 27
    iget v1, p1, Lcom/wmspanel/libstream/Streamer$Size;->height:I

    int-to-float v1, v1

    .line 29
    div-float v2, v0, v1

    .line 32
    div-float v2, v1, v0

    .line 35
    mul-float/2addr v1, v2

    .line 38
    div-float v0, v1, v0

    .line 41
    iput v0, p0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale:F

    .line 156
    :goto_0
    iget v0, p1, Lcom/wmspanel/libstream/Streamer$Size;->width:I

    int-to-float v0, v0

    .line 157
    iget v1, p1, Lcom/wmspanel/libstream/Streamer$Size;->height:I

    int-to-float v1, v1

    .line 159
    invoke-static {v4, v5}, Ljava/lang/Math;->abs(D)D

    move-result-wide v2

    cmpg-double v2, v2, v12

    if-gez v2, :cond_0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    .line 161
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->videoSize:Lcom/wmspanel/libstream/Streamer$Size;

    iget v0, v0, Lcom/wmspanel/libstream/Streamer$Size;->width:I

    int-to-float v0, v0

    .line 162
    iget-object v1, p0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->videoSize:Lcom/wmspanel/libstream/Streamer$Size;

    iget v1, v1, Lcom/wmspanel/libstream/Streamer$Size;->height:I

    int-to-float v1, v1

    .line 164
    div-float v2, v1, v0

    .line 167
    mul-float/2addr v1, v2

    .line 170
    div-float/2addr v0, v1

    .line 173
    iput v0, p0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale_horizon:F

    .line 176
    :cond_0
    return-void

    .line 47
    :cond_1
    iget v6, p1, Lcom/wmspanel/libstream/Streamer$Size;->width:I

    int-to-float v6, v6

    .line 48
    iget v7, p1, Lcom/wmspanel/libstream/Streamer$Size;->height:I

    int-to-float v7, v7

    .line 50
    iget-object v8, p0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->videoSize:Lcom/wmspanel/libstream/Streamer$Size;

    iget v8, v8, Lcom/wmspanel/libstream/Streamer$Size;->width:I

    int-to-float v8, v8

    .line 51
    iget-object v9, p0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->videoSize:Lcom/wmspanel/libstream/Streamer$Size;

    iget v9, v9, Lcom/wmspanel/libstream/Streamer$Size;->height:I

    int-to-float v9, v9

    .line 53
    div-float v10, v6, v7

    .line 57
    div-float v10, v8, v9

    .line 61
    cmpl-float v10, v6, v7

    if-lez v10, :cond_3

    .line 64
    div-float v10, v7, v8

    .line 67
    mul-float/2addr v10, v9

    .line 70
    div-float/2addr v10, v6

    .line 73
    iput v10, p0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale:F

    .line 77
    cmpg-double v0, v2, v0

    if-gez v0, :cond_2

    .line 79
    div-float v0, v7, v9

    .line 82
    mul-float/2addr v0, v8

    .line 85
    div-float/2addr v0, v6

    .line 88
    iput v0, p0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale_landscape_pillarbox:F

    goto :goto_0

    .line 93
    :cond_2
    div-float v0, v6, v8

    .line 96
    mul-float/2addr v0, v9

    .line 99
    div-float/2addr v0, v7

    .line 102
    iput v0, p0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale_landscape_letterbox:F

    goto :goto_0

    .line 107
    :cond_3
    div-float v0, v6, v8

    .line 110
    mul-float/2addr v0, v9

    .line 113
    div-float/2addr v0, v7

    .line 116
    iput v0, p0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale_landscape_letterbox:F

    .line 120
    div-float v0, v6, v7

    div-float v1, v9, v8

    cmpl-float v0, v0, v1

    if-lez v0, :cond_4

    .line 123
    div-float v0, v7, v8

    .line 126
    mul-float/2addr v0, v9

    .line 129
    div-float/2addr v0, v6

    .line 132
    iput v0, p0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale:F

    goto :goto_0

    .line 138
    :cond_4
    div-float v0, v6, v9

    .line 141
    mul-float/2addr v0, v8

    .line 144
    div-float/2addr v0, v7

    .line 147
    iput v0, p0, Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;->scale_letterbox:F

    goto :goto_0
.end method
