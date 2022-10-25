.class public Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;
.super Ljava/lang/Object;
.source "VideoCompressor.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/stories/util/VideoCompressor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "VideoCompressorParameters"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private aspectRatio:F

.field private disableAudio:Z

.field private final inputVideo:Ljava/io/File;

.field private maxSize:I

.field private mirror:Z

.field private overlayFile:Ljava/io/File;

.field private previewFile:Ljava/io/File;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 271
    new-instance v0, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters$1;

    invoke-direct {v0}, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters$1;-><init>()V

    sput-object v0, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 261
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 262
    invoke-virtual {p1}, Landroid/os/Parcel;->readSerializable()Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    iput-object v0, p0, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->inputVideo:Ljava/io/File;

    .line 263
    invoke-virtual {p1}, Landroid/os/Parcel;->readSerializable()Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    iput-object v0, p0, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->overlayFile:Ljava/io/File;

    .line 264
    invoke-virtual {p1}, Landroid/os/Parcel;->readSerializable()Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    iput-object v0, p0, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->previewFile:Ljava/io/File;

    .line 265
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->mirror:Z

    .line 266
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_1

    :goto_1
    iput-boolean v1, p0, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->disableAudio:Z

    .line 267
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->aspectRatio:F

    .line 268
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->maxSize:I

    .line 269
    return-void

    :cond_0
    move v0, v2

    .line 265
    goto :goto_0

    :cond_1
    move v1, v2

    .line 266
    goto :goto_1
.end method

.method public constructor <init>(Ljava/io/File;)V
    .locals 0
    .param p1, "inputVideo"    # Ljava/io/File;

    .prologue
    .line 182
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 183
    iput-object p1, p0, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->inputVideo:Ljava/io/File;

    .line 184
    return-void
.end method

.method static synthetic access$100(Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

    .prologue
    .line 172
    iget-boolean v0, p0, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->disableAudio:Z

    return v0
.end method

.method static synthetic access$200(Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

    .prologue
    .line 172
    iget v0, p0, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->maxSize:I

    return v0
.end method

.method static synthetic access$300(Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;)Ljava/io/File;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

    .prologue
    .line 172
    iget-object v0, p0, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->inputVideo:Ljava/io/File;

    return-object v0
.end method

.method static synthetic access$400(Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

    .prologue
    .line 172
    iget-boolean v0, p0, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->mirror:Z

    return v0
.end method

.method static synthetic access$500(Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;)F
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

    .prologue
    .line 172
    iget v0, p0, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->aspectRatio:F

    return v0
.end method

.method static synthetic access$600(Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;)Ljava/io/File;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

    .prologue
    .line 172
    iget-object v0, p0, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->overlayFile:Ljava/io/File;

    return-object v0
.end method


# virtual methods
.method public aspectRatio()F
    .locals 1

    .prologue
    .line 227
    iget v0, p0, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->aspectRatio:F

    return v0
.end method

.method public aspectRatio(F)Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;
    .locals 0
    .param p1, "aspectRatio"    # F

    .prologue
    .line 231
    iput p1, p0, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->aspectRatio:F

    .line 232
    return-object p0
.end method

.method public describeContents()I
    .locals 1

    .prologue
    .line 247
    const/4 v0, 0x0

    return v0
.end method

.method public disableAudio(Z)Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;
    .locals 0
    .param p1, "disableAudio"    # Z

    .prologue
    .line 222
    iput-boolean p1, p0, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->disableAudio:Z

    .line 223
    return-object p0
.end method

.method public imageFile(Ljava/io/File;)Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;
    .locals 0
    .param p1, "imageFile"    # Ljava/io/File;

    .prologue
    .line 195
    iput-object p1, p0, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->overlayFile:Ljava/io/File;

    .line 196
    return-object p0
.end method

.method public imageFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 191
    iget-object v0, p0, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->overlayFile:Ljava/io/File;

    return-object v0
.end method

.method public inputVideo()Ljava/io/File;
    .locals 1

    .prologue
    .line 187
    iget-object v0, p0, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->inputVideo:Ljava/io/File;

    return-object v0
.end method

.method public isDisableAudio()Z
    .locals 1

    .prologue
    .line 218
    iget-boolean v0, p0, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->disableAudio:Z

    return v0
.end method

.method public maxSize()I
    .locals 1

    .prologue
    .line 236
    iget v0, p0, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->maxSize:I

    return v0
.end method

.method public maxSize(I)Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;
    .locals 0
    .param p1, "maxSize"    # I

    .prologue
    .line 240
    iput p1, p0, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->maxSize:I

    .line 241
    return-object p0
.end method

.method public mirror(Z)Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;
    .locals 0
    .param p1, "mirror"    # Z

    .prologue
    .line 213
    iput-boolean p1, p0, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->mirror:Z

    .line 214
    return-object p0
.end method

.method public mirror()Z
    .locals 1

    .prologue
    .line 209
    iget-boolean v0, p0, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->mirror:Z

    return v0
.end method

.method public previewFile(Ljava/io/File;)Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;
    .locals 0
    .param p1, "previewFile"    # Ljava/io/File;

    .prologue
    .line 204
    iput-object p1, p0, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->previewFile:Ljava/io/File;

    .line 205
    return-object p0
.end method

.method public previewFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 200
    iget-object v0, p0, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->previewFile:Ljava/io/File;

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 3
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 252
    iget-object v0, p0, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->inputVideo:Ljava/io/File;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeSerializable(Ljava/io/Serializable;)V

    .line 253
    iget-object v0, p0, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->overlayFile:Ljava/io/File;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeSerializable(Ljava/io/Serializable;)V

    .line 254
    iget-object v0, p0, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->previewFile:Ljava/io/File;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeSerializable(Ljava/io/Serializable;)V

    .line 255
    iget-boolean v0, p0, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->mirror:Z

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 256
    iget-boolean v0, p0, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->disableAudio:Z

    if-eqz v0, :cond_1

    :goto_1
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeByte(B)V

    .line 257
    iget v0, p0, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->aspectRatio:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 258
    iget v0, p0, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->maxSize:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 259
    return-void

    :cond_0
    move v0, v2

    .line 255
    goto :goto_0

    :cond_1
    move v1, v2

    .line 256
    goto :goto_1
.end method
