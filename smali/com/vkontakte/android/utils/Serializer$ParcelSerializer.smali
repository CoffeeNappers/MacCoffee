.class Lcom/vkontakte/android/utils/Serializer$ParcelSerializer;
.super Lcom/vkontakte/android/utils/Serializer;
.source "Serializer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/utils/Serializer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ParcelSerializer"
.end annotation


# instance fields
.field final parcel:Landroid/os/Parcel;


# direct methods
.method constructor <init>(Landroid/os/Parcel;)V
    .locals 0
    .param p1, "parcel"    # Landroid/os/Parcel;

    .prologue
    .line 363
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer;-><init>()V

    .line 364
    iput-object p1, p0, Lcom/vkontakte/android/utils/Serializer$ParcelSerializer;->parcel:Landroid/os/Parcel;

    .line 365
    return-void
.end method


# virtual methods
.method public readBundle(Ljava/lang/ClassLoader;)Landroid/os/Bundle;
    .locals 1
    .param p1, "loader"    # Ljava/lang/ClassLoader;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 455
    iget-object v0, p0, Lcom/vkontakte/android/utils/Serializer$ParcelSerializer;->parcel:Landroid/os/Parcel;

    invoke-virtual {v0, p1}, Landroid/os/Parcel;->readBundle(Ljava/lang/ClassLoader;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method public readByte()B
    .locals 1

    .prologue
    .line 418
    iget-object v0, p0, Lcom/vkontakte/android/utils/Serializer$ParcelSerializer;->parcel:Landroid/os/Parcel;

    invoke-virtual {v0}, Landroid/os/Parcel;->readByte()B

    move-result v0

    return v0
.end method

.method public readChar()C
    .locals 1

    .prologue
    .line 423
    iget-object v0, p0, Lcom/vkontakte/android/utils/Serializer$ParcelSerializer;->parcel:Landroid/os/Parcel;

    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    move-result v0

    int-to-char v0, v0

    return v0
.end method

.method public readDouble()D
    .locals 2

    .prologue
    .line 438
    iget-object v0, p0, Lcom/vkontakte/android/utils/Serializer$ParcelSerializer;->parcel:Landroid/os/Parcel;

    invoke-virtual {v0}, Landroid/os/Parcel;->readDouble()D

    move-result-wide v0

    return-wide v0
.end method

.method public readFloat()F
    .locals 1

    .prologue
    .line 443
    iget-object v0, p0, Lcom/vkontakte/android/utils/Serializer$ParcelSerializer;->parcel:Landroid/os/Parcel;

    invoke-virtual {v0}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    return v0
.end method

.method public readInt()I
    .locals 1

    .prologue
    .line 428
    iget-object v0, p0, Lcom/vkontakte/android/utils/Serializer$ParcelSerializer;->parcel:Landroid/os/Parcel;

    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    move-result v0

    return v0
.end method

.method public readJavaSerializable()Ljava/io/Serializable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/io/Serializable;",
            ">()TT;"
        }
    .end annotation

    .prologue
    .line 460
    iget-object v0, p0, Lcom/vkontakte/android/utils/Serializer$ParcelSerializer;->parcel:Landroid/os/Parcel;

    invoke-virtual {v0}, Landroid/os/Parcel;->readSerializable()Ljava/io/Serializable;

    move-result-object v0

    return-object v0
.end method

.method public readLong()J
    .locals 2

    .prologue
    .line 433
    iget-object v0, p0, Lcom/vkontakte/android/utils/Serializer$ParcelSerializer;->parcel:Landroid/os/Parcel;

    invoke-virtual {v0}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    return-wide v0
.end method

.method public readString()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 449
    iget-object v0, p0, Lcom/vkontakte/android/utils/Serializer$ParcelSerializer;->parcel:Landroid/os/Parcel;

    invoke-virtual {v0}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeBundle(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "v"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 406
    iget-object v0, p0, Lcom/vkontakte/android/utils/Serializer$ParcelSerializer;->parcel:Landroid/os/Parcel;

    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeBundle(Landroid/os/Bundle;)V

    .line 407
    return-void
.end method

.method public writeByte(B)V
    .locals 1
    .param p1, "v"    # B

    .prologue
    .line 371
    iget-object v0, p0, Lcom/vkontakte/android/utils/Serializer$ParcelSerializer;->parcel:Landroid/os/Parcel;

    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeByte(B)V

    .line 372
    return-void
.end method

.method public writeChar(C)V
    .locals 1
    .param p1, "v"    # C

    .prologue
    .line 376
    iget-object v0, p0, Lcom/vkontakte/android/utils/Serializer$ParcelSerializer;->parcel:Landroid/os/Parcel;

    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 377
    return-void
.end method

.method public writeDouble(D)V
    .locals 1
    .param p1, "v"    # D

    .prologue
    .line 396
    iget-object v0, p0, Lcom/vkontakte/android/utils/Serializer$ParcelSerializer;->parcel:Landroid/os/Parcel;

    invoke-virtual {v0, p1, p2}, Landroid/os/Parcel;->writeDouble(D)V

    .line 397
    return-void
.end method

.method public writeFloat(F)V
    .locals 1
    .param p1, "v"    # F

    .prologue
    .line 391
    iget-object v0, p0, Lcom/vkontakte/android/utils/Serializer$ParcelSerializer;->parcel:Landroid/os/Parcel;

    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeFloat(F)V

    .line 392
    return-void
.end method

.method public writeInt(I)V
    .locals 1
    .param p1, "v"    # I

    .prologue
    .line 381
    iget-object v0, p0, Lcom/vkontakte/android/utils/Serializer$ParcelSerializer;->parcel:Landroid/os/Parcel;

    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 382
    return-void
.end method

.method public writeJavaSerializable(Ljava/io/Serializable;)V
    .locals 1
    .param p1, "v"    # Ljava/io/Serializable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 411
    iget-object v0, p0, Lcom/vkontakte/android/utils/Serializer$ParcelSerializer;->parcel:Landroid/os/Parcel;

    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeSerializable(Ljava/io/Serializable;)V

    .line 412
    return-void
.end method

.method public writeLong(J)V
    .locals 1
    .param p1, "v"    # J

    .prologue
    .line 386
    iget-object v0, p0, Lcom/vkontakte/android/utils/Serializer$ParcelSerializer;->parcel:Landroid/os/Parcel;

    invoke-virtual {v0, p1, p2}, Landroid/os/Parcel;->writeLong(J)V

    .line 387
    return-void
.end method

.method public writeString(Ljava/lang/String;)V
    .locals 1
    .param p1, "v"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 401
    iget-object v0, p0, Lcom/vkontakte/android/utils/Serializer$ParcelSerializer;->parcel:Landroid/os/Parcel;

    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 402
    return-void
.end method
