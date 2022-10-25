.class Lcom/vk/media/camera/CameraSource$SizePair;
.super Ljava/lang/Object;
.source "CameraSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/media/camera/CameraSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SizePair"
.end annotation


# instance fields
.field private mPicture:Lcom/vk/media/utils/MediaUtils$Size;

.field private mPreview:Lcom/vk/media/utils/MediaUtils$Size;


# direct methods
.method public constructor <init>(Landroid/hardware/Camera$Size;Landroid/hardware/Camera$Size;)V
    .locals 3
    .param p1, "previewSize"    # Landroid/hardware/Camera$Size;
    .param p2, "pictureSize"    # Landroid/hardware/Camera$Size;

    .prologue
    .line 130
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 131
    new-instance v0, Lcom/vk/media/utils/MediaUtils$Size;

    iget v1, p1, Landroid/hardware/Camera$Size;->width:I

    iget v2, p1, Landroid/hardware/Camera$Size;->height:I

    invoke-direct {v0, v1, v2}, Lcom/vk/media/utils/MediaUtils$Size;-><init>(II)V

    iput-object v0, p0, Lcom/vk/media/camera/CameraSource$SizePair;->mPreview:Lcom/vk/media/utils/MediaUtils$Size;

    .line 132
    if-eqz p2, :cond_0

    .line 133
    new-instance v0, Lcom/vk/media/utils/MediaUtils$Size;

    iget v1, p2, Landroid/hardware/Camera$Size;->width:I

    iget v2, p2, Landroid/hardware/Camera$Size;->height:I

    invoke-direct {v0, v1, v2}, Lcom/vk/media/utils/MediaUtils$Size;-><init>(II)V

    iput-object v0, p0, Lcom/vk/media/camera/CameraSource$SizePair;->mPicture:Lcom/vk/media/utils/MediaUtils$Size;

    .line 135
    :cond_0
    return-void
.end method


# virtual methods
.method public pictureSize()Lcom/vk/media/utils/MediaUtils$Size;
    .locals 1

    .prologue
    .line 143
    iget-object v0, p0, Lcom/vk/media/camera/CameraSource$SizePair;->mPicture:Lcom/vk/media/utils/MediaUtils$Size;

    return-object v0
.end method

.method public previewSize()Lcom/vk/media/utils/MediaUtils$Size;
    .locals 1

    .prologue
    .line 138
    iget-object v0, p0, Lcom/vk/media/camera/CameraSource$SizePair;->mPreview:Lcom/vk/media/utils/MediaUtils$Size;

    return-object v0
.end method
