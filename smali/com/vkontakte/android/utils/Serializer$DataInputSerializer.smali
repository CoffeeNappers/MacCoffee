.class Lcom/vkontakte/android/utils/Serializer$DataInputSerializer;
.super Lcom/vkontakte/android/utils/Serializer;
.source "Serializer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/utils/Serializer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DataInputSerializer"
.end annotation


# static fields
.field static final ERROR_TEXT:Ljava/lang/String; = "Don\'t use DataInput for write values"


# instance fields
.field final dataInput:Ljava/io/DataInput;


# direct methods
.method constructor <init>(Ljava/io/DataInput;)V
    .locals 0
    .param p1, "dataInput"    # Ljava/io/DataInput;

    .prologue
    .line 620
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer;-><init>()V

    .line 621
    iput-object p1, p0, Lcom/vkontakte/android/utils/Serializer$DataInputSerializer;->dataInput:Ljava/io/DataInput;

    .line 622
    return-void
.end method


# virtual methods
.method public readBundle(Ljava/lang/ClassLoader;)Landroid/os/Bundle;
    .locals 1
    .param p1, "loader"    # Ljava/lang/ClassLoader;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 745
    invoke-virtual {p0}, Lcom/vkontakte/android/utils/Serializer$DataInputSerializer;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/utils/Serializer;->access$200(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method public readByte()B
    .locals 2

    .prologue
    .line 676
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/utils/Serializer$DataInputSerializer;->dataInput:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readByte()B
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 677
    :catch_0
    move-exception v0

    .line 678
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public readChar()C
    .locals 2

    .prologue
    .line 685
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/utils/Serializer$DataInputSerializer;->dataInput:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readChar()C
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 686
    :catch_0
    move-exception v0

    .line 687
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public readDouble()D
    .locals 4

    .prologue
    .line 712
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/utils/Serializer$DataInputSerializer;->dataInput:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readDouble()D
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v2

    return-wide v2

    .line 713
    :catch_0
    move-exception v0

    .line 714
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public readFloat()F
    .locals 2

    .prologue
    .line 721
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/utils/Serializer$DataInputSerializer;->dataInput:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readFloat()F
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 722
    :catch_0
    move-exception v0

    .line 723
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public readInt()I
    .locals 2

    .prologue
    .line 694
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/utils/Serializer$DataInputSerializer;->dataInput:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readInt()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 695
    :catch_0
    move-exception v0

    .line 696
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public readJavaSerializable()Ljava/io/Serializable;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/io/Serializable;",
            ">()TT;"
        }
    .end annotation

    .prologue
    .line 751
    :try_start_0
    iget-object v3, p0, Lcom/vkontakte/android/utils/Serializer$DataInputSerializer;->dataInput:Ljava/io/DataInput;

    invoke-interface {v3}, Ljava/io/DataInput;->readInt()I

    move-result v2

    .line 752
    .local v2, "len":I
    if-gez v2, :cond_0

    .line 753
    const/4 v3, 0x0

    .line 757
    :goto_0
    return-object v3

    .line 755
    :cond_0
    new-array v0, v2, [B

    .line 756
    .local v0, "bytes":[B
    iget-object v3, p0, Lcom/vkontakte/android/utils/Serializer$DataInputSerializer;->dataInput:Ljava/io/DataInput;

    invoke-interface {v3, v0}, Ljava/io/DataInput;->readFully([B)V

    .line 757
    invoke-static {v0}, Lcom/vkontakte/android/utils/Serializer;->access$300([B)Ljava/io/Serializable;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    goto :goto_0

    .line 759
    .end local v0    # "bytes":[B
    .end local v2    # "len":I
    :catch_0
    move-exception v1

    .line 760
    .local v1, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method public readLong()J
    .locals 4

    .prologue
    .line 703
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/utils/Serializer$DataInputSerializer;->dataInput:Ljava/io/DataInput;

    invoke-interface {v1}, Ljava/io/DataInput;->readLong()J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v2

    return-wide v2

    .line 704
    :catch_0
    move-exception v0

    .line 705
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public readString()Ljava/lang/String;
    .locals 3
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 731
    :try_start_0
    iget-object v2, p0, Lcom/vkontakte/android/utils/Serializer$DataInputSerializer;->dataInput:Ljava/io/DataInput;

    invoke-interface {v2}, Ljava/io/DataInput;->readInt()I

    move-result v1

    .line 732
    .local v1, "len":I
    if-gez v1, :cond_0

    .line 733
    const/4 v2, 0x0

    .line 735
    :goto_0
    return-object v2

    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/utils/Serializer$DataInputSerializer;->dataInput:Ljava/io/DataInput;

    invoke-interface {v2}, Ljava/io/DataInput;->readUTF()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_0

    .line 737
    .end local v1    # "len":I
    :catch_0
    move-exception v0

    .line 738
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public writeBundle(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "v"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 663
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "Don\'t use DataInput for write values"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public writeByte(B)V
    .locals 2
    .param p1, "v"    # B

    .prologue
    .line 628
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "Don\'t use DataInput for write values"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public writeChar(C)V
    .locals 2
    .param p1, "v"    # C

    .prologue
    .line 633
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "Don\'t use DataInput for write values"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public writeDouble(D)V
    .locals 2
    .param p1, "v"    # D

    .prologue
    .line 653
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "Don\'t use DataInput for write values"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public writeFloat(F)V
    .locals 2
    .param p1, "v"    # F

    .prologue
    .line 648
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "Don\'t use DataInput for write values"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public writeInt(I)V
    .locals 2
    .param p1, "v"    # I

    .prologue
    .line 638
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "Don\'t use DataInput for write values"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public writeJavaSerializable(Ljava/io/Serializable;)V
    .locals 2
    .param p1, "v"    # Ljava/io/Serializable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 668
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "Don\'t use DataInput for write values"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public writeLong(J)V
    .locals 2
    .param p1, "v"    # J

    .prologue
    .line 643
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "Don\'t use DataInput for write values"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public writeString(Ljava/lang/String;)V
    .locals 2
    .param p1, "v"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 658
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "Don\'t use DataInput for write values"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
