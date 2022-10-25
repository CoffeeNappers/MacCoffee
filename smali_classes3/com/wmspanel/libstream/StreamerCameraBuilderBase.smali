.class public abstract Lcom/wmspanel/libstream/StreamerCameraBuilderBase;
.super Lcom/wmspanel/libstream/StreamerBuilder;
.source "SourceFile"


# instance fields
.field protected mCameraApi:Lcom/wmspanel/libstream/Streamer$CAMERA_API;

.field protected mCameraId:Ljava/lang/String;

.field protected mDisplayRotation:I

.field protected mFocusMode:Lcom/wmspanel/libstream/FocusMode;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 6
    invoke-direct {p0}, Lcom/wmspanel/libstream/StreamerBuilder;-><init>()V

    .line 9
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAMERA_API;->CAMERA:Lcom/wmspanel/libstream/Streamer$CAMERA_API;

    iput-object v0, p0, Lcom/wmspanel/libstream/StreamerCameraBuilderBase;->mCameraApi:Lcom/wmspanel/libstream/Streamer$CAMERA_API;

    .line 11
    new-instance v0, Lcom/wmspanel/libstream/FocusMode;

    invoke-direct {v0}, Lcom/wmspanel/libstream/FocusMode;-><init>()V

    iput-object v0, p0, Lcom/wmspanel/libstream/StreamerCameraBuilderBase;->mFocusMode:Lcom/wmspanel/libstream/FocusMode;

    .line 13
    const/4 v0, 0x1

    iput v0, p0, Lcom/wmspanel/libstream/StreamerCameraBuilderBase;->mDisplayRotation:I

    return-void
.end method


# virtual methods
.method public setCamera2(Z)V
    .locals 1
    .param p1, "camera2"    # Z

    .prologue
    .line 20
    if-eqz p1, :cond_0

    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAMERA_API;->CAMERA2:Lcom/wmspanel/libstream/Streamer$CAMERA_API;

    :goto_0
    iput-object v0, p0, Lcom/wmspanel/libstream/StreamerCameraBuilderBase;->mCameraApi:Lcom/wmspanel/libstream/Streamer$CAMERA_API;

    .line 21
    return-void

    .line 20
    :cond_0
    sget-object v0, Lcom/wmspanel/libstream/Streamer$CAMERA_API;->CAMERA:Lcom/wmspanel/libstream/Streamer$CAMERA_API;

    goto :goto_0
.end method

.method public setCameraId(Ljava/lang/String;)V
    .locals 0
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 16
    iput-object p1, p0, Lcom/wmspanel/libstream/StreamerCameraBuilderBase;->mCameraId:Ljava/lang/String;

    .line 17
    return-void
.end method

.method public setDisplayRotation(I)V
    .locals 0
    .param p1, "rotation"    # I

    .prologue
    .line 28
    iput p1, p0, Lcom/wmspanel/libstream/StreamerCameraBuilderBase;->mDisplayRotation:I

    .line 29
    return-void
.end method

.method public setFocusMode(Lcom/wmspanel/libstream/FocusMode;)V
    .locals 0
    .param p1, "mode"    # Lcom/wmspanel/libstream/FocusMode;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 24
    iput-object p1, p0, Lcom/wmspanel/libstream/StreamerCameraBuilderBase;->mFocusMode:Lcom/wmspanel/libstream/FocusMode;

    .line 25
    return-void
.end method
