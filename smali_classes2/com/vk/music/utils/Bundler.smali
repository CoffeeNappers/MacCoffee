.class public final Lcom/vk/music/utils/Bundler;
.super Ljava/lang/Object;
.source "Bundler.java"


# instance fields
.field private final bundle:Landroid/os/Bundle;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iput-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    return-void
.end method


# virtual methods
.method public put(Ljava/lang/String;B)Landroid/os/Bundle;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "val"    # B

    .prologue
    .line 18
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putByte(Ljava/lang/String;B)V

    .line 19
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    return-object v0
.end method

.method public put(Ljava/lang/String;C)Landroid/os/Bundle;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "val"    # C

    .prologue
    .line 23
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putChar(Ljava/lang/String;C)V

    .line 24
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    return-object v0
.end method

.method public put(Ljava/lang/String;D)Landroid/os/Bundle;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "val"    # D

    .prologue
    .line 48
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2, p3}, Landroid/os/Bundle;->putDouble(Ljava/lang/String;D)V

    .line 49
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    return-object v0
.end method

.method public put(Ljava/lang/String;F)Landroid/os/Bundle;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "val"    # F

    .prologue
    .line 43
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    .line 44
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    return-object v0
.end method

.method public put(Ljava/lang/String;I)Landroid/os/Bundle;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "val"    # I

    .prologue
    .line 38
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 39
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    return-object v0
.end method

.method public put(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/os/Bundle;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "val"    # Landroid/os/Parcelable;

    .prologue
    .line 118
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 119
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    return-object v0
.end method

.method public put(Ljava/lang/String;Landroid/util/SparseArray;)Landroid/os/Bundle;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/util/SparseArray",
            "<+",
            "Landroid/os/Parcelable;",
            ">;)",
            "Landroid/os/Bundle;"
        }
    .end annotation

    .prologue
    .line 133
    .local p2, "val":Landroid/util/SparseArray;, "Landroid/util/SparseArray<+Landroid/os/Parcelable;>;"
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putSparseParcelableArray(Ljava/lang/String;Landroid/util/SparseArray;)V

    .line 134
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    return-object v0
.end method

.method public put(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/os/Bundle;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "val"    # Ljava/lang/CharSequence;

    .prologue
    .line 88
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 89
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    return-object v0
.end method

.method public put(Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "val"    # Ljava/lang/String;

    .prologue
    .line 103
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    return-object v0
.end method

.method public put(Ljava/lang/String;S)Landroid/os/Bundle;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "val"    # S

    .prologue
    .line 33
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putShort(Ljava/lang/String;S)V

    .line 34
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    return-object v0
.end method

.method public put(Ljava/lang/String;Z)Landroid/os/Bundle;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "val"    # Z

    .prologue
    .line 28
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 29
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    return-object v0
.end method

.method public put(Ljava/lang/String;[B)Landroid/os/Bundle;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "val"    # [B

    .prologue
    .line 53
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putByteArray(Ljava/lang/String;[B)V

    .line 54
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    return-object v0
.end method

.method public put(Ljava/lang/String;[C)Landroid/os/Bundle;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "val"    # [C

    .prologue
    .line 58
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putCharArray(Ljava/lang/String;[C)V

    .line 59
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    return-object v0
.end method

.method public put(Ljava/lang/String;[D)Landroid/os/Bundle;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "val"    # [D

    .prologue
    .line 83
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putDoubleArray(Ljava/lang/String;[D)V

    .line 84
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    return-object v0
.end method

.method public put(Ljava/lang/String;[F)Landroid/os/Bundle;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "val"    # [F

    .prologue
    .line 78
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putFloatArray(Ljava/lang/String;[F)V

    .line 79
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    return-object v0
.end method

.method public put(Ljava/lang/String;[I)Landroid/os/Bundle;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "val"    # [I

    .prologue
    .line 73
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    .line 74
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    return-object v0
.end method

.method public put(Ljava/lang/String;[Landroid/os/Parcelable;)Landroid/os/Bundle;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "val"    # [Landroid/os/Parcelable;

    .prologue
    .line 123
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putParcelableArray(Ljava/lang/String;[Landroid/os/Parcelable;)V

    .line 124
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    return-object v0
.end method

.method public put(Ljava/lang/String;[Ljava/lang/CharSequence;)Landroid/os/Bundle;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "val"    # [Ljava/lang/CharSequence;

    .prologue
    .line 93
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putCharSequenceArray(Ljava/lang/String;[Ljava/lang/CharSequence;)V

    .line 94
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    return-object v0
.end method

.method public put(Ljava/lang/String;[Ljava/lang/String;)Landroid/os/Bundle;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "val"    # [Ljava/lang/String;

    .prologue
    .line 108
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    .line 109
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    return-object v0
.end method

.method public put(Ljava/lang/String;[S)Landroid/os/Bundle;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "val"    # [S

    .prologue
    .line 68
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putShortArray(Ljava/lang/String;[S)V

    .line 69
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    return-object v0
.end method

.method public put(Ljava/lang/String;[Z)Landroid/os/Bundle;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "val"    # [Z

    .prologue
    .line 63
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putBooleanArray(Ljava/lang/String;[Z)V

    .line 64
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    return-object v0
.end method

.method public putCharSequenceArrayList(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/os/Bundle;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/CharSequence;",
            ">;)",
            "Landroid/os/Bundle;"
        }
    .end annotation

    .prologue
    .line 98
    .local p2, "val":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/CharSequence;>;"
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putCharSequenceArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 99
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    return-object v0
.end method

.method public putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/os/Bundle;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<+",
            "Landroid/os/Parcelable;",
            ">;)",
            "Landroid/os/Bundle;"
        }
    .end annotation

    .prologue
    .line 128
    .local p2, "val":Ljava/util/ArrayList;, "Ljava/util/ArrayList<+Landroid/os/Parcelable;>;"
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 129
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    return-object v0
.end method

.method public putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/os/Bundle;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/os/Bundle;"
        }
    .end annotation

    .prologue
    .line 113
    .local p2, "val":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 114
    iget-object v0, p0, Lcom/vk/music/utils/Bundler;->bundle:Landroid/os/Bundle;

    return-object v0
.end method
