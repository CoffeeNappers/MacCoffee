.class Lcom/vkontakte/android/utils/Serializer$DataOutputSerializer;
.super Lcom/vkontakte/android/utils/Serializer;
.source "Serializer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/utils/Serializer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DataOutputSerializer"
.end annotation


# static fields
.field static final ERROR_TEXT:Ljava/lang/String; = "Don\'t use DataOutput for read values"


# instance fields
.field final dataOutput:Ljava/io/DataOutput;


# direct methods
.method constructor <init>(Ljava/io/DataOutput;)V
    .locals 0
    .param p1, "dataOutput"    # Ljava/io/DataOutput;

    .prologue
    .line 470
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer;-><init>()V

    .line 471
    iput-object p1, p0, Lcom/vkontakte/android/utils/Serializer$DataOutputSerializer;->dataOutput:Ljava/io/DataOutput;

    .line 472
    return-void
.end method


# virtual methods
.method public readBundle(Ljava/lang/ClassLoader;)Landroid/os/Bundle;
    .locals 2
    .param p1, "loader"    # Ljava/lang/ClassLoader;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 605
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "Don\'t use DataOutput for read values"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public readByte()B
    .locals 2

    .prologue
    .line 568
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "Don\'t use DataOutput for read values"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public readChar()C
    .locals 2

    .prologue
    .line 573
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "Don\'t use DataOutput for read values"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public readDouble()D
    .locals 2

    .prologue
    .line 588
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "Don\'t use DataOutput for read values"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public readFloat()F
    .locals 2

    .prologue
    .line 593
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "Don\'t use DataOutput for read values"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public readInt()I
    .locals 2

    .prologue
    .line 578
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "Don\'t use DataOutput for read values"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public readJavaSerializable()Ljava/io/Serializable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/io/Serializable;",
            ">()TT;"
        }
    .end annotation

    .prologue
    .line 610
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "Don\'t use DataOutput for read values"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public readLong()J
    .locals 2

    .prologue
    .line 583
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "Don\'t use DataOutput for read values"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public readString()Ljava/lang/String;
    .locals 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 599
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "Don\'t use DataOutput for read values"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public writeBundle(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "v"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 546
    invoke-static {p1}, Lcom/vkontakte/android/utils/Serializer;->access$000(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/utils/Serializer$DataOutputSerializer;->writeString(Ljava/lang/String;)V

    .line 547
    return-void
.end method

.method public writeByte(B)V
    .locals 2
    .param p1, "v"    # B

    .prologue
    .line 479
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/utils/Serializer$DataOutputSerializer;->dataOutput:Ljava/io/DataOutput;

    invoke-interface {v1, p1}, Ljava/io/DataOutput;->writeByte(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 483
    return-void

    .line 480
    :catch_0
    move-exception v0

    .line 481
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public writeChar(C)V
    .locals 2
    .param p1, "v"    # C

    .prologue
    .line 488
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/utils/Serializer$DataOutputSerializer;->dataOutput:Ljava/io/DataOutput;

    invoke-interface {v1, p1}, Ljava/io/DataOutput;->writeChar(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 492
    return-void

    .line 489
    :catch_0
    move-exception v0

    .line 490
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public writeDouble(D)V
    .locals 3
    .param p1, "v"    # D

    .prologue
    .line 524
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/utils/Serializer$DataOutputSerializer;->dataOutput:Ljava/io/DataOutput;

    invoke-interface {v1, p1, p2}, Ljava/io/DataOutput;->writeDouble(D)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 528
    return-void

    .line 525
    :catch_0
    move-exception v0

    .line 526
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public writeFloat(F)V
    .locals 2
    .param p1, "v"    # F

    .prologue
    .line 515
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/utils/Serializer$DataOutputSerializer;->dataOutput:Ljava/io/DataOutput;

    invoke-interface {v1, p1}, Ljava/io/DataOutput;->writeFloat(F)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 519
    return-void

    .line 516
    :catch_0
    move-exception v0

    .line 517
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public writeInt(I)V
    .locals 2
    .param p1, "v"    # I

    .prologue
    .line 497
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/utils/Serializer$DataOutputSerializer;->dataOutput:Ljava/io/DataOutput;

    invoke-interface {v1, p1}, Ljava/io/DataOutput;->writeInt(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 501
    return-void

    .line 498
    :catch_0
    move-exception v0

    .line 499
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public writeJavaSerializable(Ljava/io/Serializable;)V
    .locals 4
    .param p1, "v"    # Ljava/io/Serializable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 552
    :try_start_0
    invoke-static {p1}, Lcom/vkontakte/android/utils/Serializer;->access$100(Ljava/io/Serializable;)[B

    move-result-object v0

    .line 553
    .local v0, "bytes":[B
    if-nez v0, :cond_0

    .line 554
    iget-object v2, p0, Lcom/vkontakte/android/utils/Serializer$DataOutputSerializer;->dataOutput:Ljava/io/DataOutput;

    const/4 v3, -0x1

    invoke-interface {v2, v3}, Ljava/io/DataOutput;->writeInt(I)V

    .line 562
    :goto_0
    return-void

    .line 556
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/utils/Serializer$DataOutputSerializer;->dataOutput:Ljava/io/DataOutput;

    array-length v3, v0

    invoke-interface {v2, v3}, Ljava/io/DataOutput;->writeInt(I)V

    .line 557
    iget-object v2, p0, Lcom/vkontakte/android/utils/Serializer$DataOutputSerializer;->dataOutput:Ljava/io/DataOutput;

    invoke-interface {v2, v0}, Ljava/io/DataOutput;->write([B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 559
    .end local v0    # "bytes":[B
    :catch_0
    move-exception v1

    .line 560
    .local v1, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public writeLong(J)V
    .locals 3
    .param p1, "v"    # J

    .prologue
    .line 506
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/utils/Serializer$DataOutputSerializer;->dataOutput:Ljava/io/DataOutput;

    invoke-interface {v1, p1, p2}, Ljava/io/DataOutput;->writeLong(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 510
    return-void

    .line 507
    :catch_0
    move-exception v0

    .line 508
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public writeString(Ljava/lang/String;)V
    .locals 3
    .param p1, "v"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 533
    if-nez p1, :cond_0

    .line 534
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/utils/Serializer$DataOutputSerializer;->dataOutput:Ljava/io/DataOutput;

    const/4 v2, -0x1

    invoke-interface {v1, v2}, Ljava/io/DataOutput;->writeInt(I)V

    .line 542
    :goto_0
    return-void

    .line 536
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/utils/Serializer$DataOutputSerializer;->dataOutput:Ljava/io/DataOutput;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-interface {v1, v2}, Ljava/io/DataOutput;->writeInt(I)V

    .line 537
    iget-object v1, p0, Lcom/vkontakte/android/utils/Serializer$DataOutputSerializer;->dataOutput:Ljava/io/DataOutput;

    invoke-interface {v1, p1}, Ljava/io/DataOutput;->writeUTF(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 539
    :catch_0
    move-exception v0

    .line 540
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
