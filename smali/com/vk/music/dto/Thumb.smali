.class public final Lcom/vk/music/dto/Thumb;
.super Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;
.source "Thumb.java"


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vk/music/dto/Thumb;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public height:I

.field private urls:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public width:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 107
    new-instance v0, Lcom/vk/music/dto/Thumb$1;

    invoke-direct {v0}, Lcom/vk/music/dto/Thumb$1;-><init>()V

    sput-object v0, Lcom/vk/music/dto/Thumb;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method private constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 5
    .param p1, "in"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 54
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 55
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v2

    iput v2, p0, Lcom/vk/music/dto/Thumb;->width:I

    .line 56
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v2

    iput v2, p0, Lcom/vk/music/dto/Thumb;->height:I

    .line 57
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    .line 58
    .local v0, "count":I
    if-lez v0, :cond_0

    .line 59
    new-instance v2, Landroid/util/SparseArray;

    invoke-direct {v2}, Landroid/util/SparseArray;-><init>()V

    iput-object v2, p0, Lcom/vk/music/dto/Thumb;->urls:Landroid/util/SparseArray;

    .line 60
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 61
    iget-object v2, p0, Lcom/vk/music/dto/Thumb;->urls:Landroid/util/SparseArray;

    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v3

    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 60
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 64
    .end local v1    # "i":I
    :cond_0
    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/utils/Serializer;Lcom/vk/music/dto/Thumb$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/utils/Serializer;
    .param p2, "x1"    # Lcom/vk/music/dto/Thumb$1;

    .prologue
    .line 18
    invoke-direct {p0, p1}, Lcom/vk/music/dto/Thumb;-><init>(Lcom/vkontakte/android/utils/Serializer;)V

    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 8
    .param p1, "jThumb"    # Lorg/json/JSONObject;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 25
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 26
    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .line 28
    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_7

    .line 29
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 30
    .local v3, "key":Ljava/lang/String;
    const-string/jumbo v5, "sizes"

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 31
    iget-object v5, p0, Lcom/vk/music/dto/Thumb;->urls:Landroid/util/SparseArray;

    if-nez v5, :cond_1

    .line 32
    new-instance v5, Landroid/util/SparseArray;

    invoke-direct {v5}, Landroid/util/SparseArray;-><init>()V

    iput-object v5, p0, Lcom/vk/music/dto/Thumb;->urls:Landroid/util/SparseArray;

    .line 34
    :cond_1
    const-string/jumbo v5, "sizes"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 35
    .local v2, "jSizes":Lorg/json/JSONArray;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v0, v5, :cond_0

    .line 36
    invoke-virtual {v2, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    .line 37
    .local v4, "size":Lorg/json/JSONObject;
    if-eqz v4, :cond_2

    .line 38
    iget-object v5, p0, Lcom/vk/music/dto/Thumb;->urls:Landroid/util/SparseArray;

    const-string/jumbo v6, "width"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v6

    const-string/jumbo v7, "src"

    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 35
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 41
    .end local v0    # "i":I
    .end local v2    # "jSizes":Lorg/json/JSONArray;
    .end local v4    # "size":Lorg/json/JSONObject;
    :cond_3
    const-string/jumbo v5, "photo_"

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 42
    iget-object v5, p0, Lcom/vk/music/dto/Thumb;->urls:Landroid/util/SparseArray;

    if-nez v5, :cond_4

    .line 43
    new-instance v5, Landroid/util/SparseArray;

    invoke-direct {v5}, Landroid/util/SparseArray;-><init>()V

    iput-object v5, p0, Lcom/vk/music/dto/Thumb;->urls:Landroid/util/SparseArray;

    .line 45
    :cond_4
    iget-object v5, p0, Lcom/vk/music/dto/Thumb;->urls:Landroid/util/SparseArray;

    const-string/jumbo v6, "photo_"

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v3, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    goto :goto_0

    .line 46
    :cond_5
    const-string/jumbo v5, "width"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 47
    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lcom/vk/music/dto/Thumb;->width:I

    goto/16 :goto_0

    .line 48
    :cond_6
    const-string/jumbo v5, "height"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 49
    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lcom/vk/music/dto/Thumb;->height:I

    goto/16 :goto_0

    .line 52
    .end local v3    # "key":Ljava/lang/String;
    :cond_7
    return-void
.end method


# virtual methods
.method public getForSize(I)Ljava/lang/String;
    .locals 8
    .param p1, "size"    # I
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 82
    iget-object v5, p0, Lcom/vk/music/dto/Thumb;->urls:Landroid/util/SparseArray;

    if-eqz v5, :cond_0

    iget-object v5, p0, Lcom/vk/music/dto/Thumb;->urls:Landroid/util/SparseArray;

    invoke-virtual {v5}, Landroid/util/SparseArray;->size()I

    move-result v0

    .line 83
    .local v0, "count":I
    :goto_0
    if-nez v0, :cond_1

    .line 84
    const/4 v4, 0x0

    .line 104
    :goto_1
    return-object v4

    .end local v0    # "count":I
    :cond_0
    move v0, v4

    .line 82
    goto :goto_0

    .line 87
    .restart local v0    # "count":I
    :cond_1
    const/4 v5, 0x1

    if-ne v0, v5, :cond_2

    .line 88
    iget-object v5, p0, Lcom/vk/music/dto/Thumb;->urls:Landroid/util/SparseArray;

    invoke-virtual {v5, v4}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    goto :goto_1

    .line 92
    :cond_2
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_2
    add-int/lit8 v4, v0, -0x1

    if-ge v3, v4, :cond_5

    .line 93
    iget-object v4, p0, Lcom/vk/music/dto/Thumb;->urls:Landroid/util/SparseArray;

    invoke-virtual {v4, v3}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v4

    sub-int v4, p1, v4

    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v1

    .line 94
    .local v1, "diff1":I
    iget-object v4, p0, Lcom/vk/music/dto/Thumb;->urls:Landroid/util/SparseArray;

    add-int/lit8 v5, v3, 0x1

    invoke-virtual {v4, v5}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v4

    sub-int v4, p1, v4

    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v2

    .line 95
    .local v2, "diff2":I
    if-ge v1, v2, :cond_4

    .line 96
    int-to-float v4, v1

    int-to-float v5, p1

    div-float/2addr v4, v5

    float-to-double v4, v4

    const-wide v6, 0x3fa999999999999aL    # 0.05

    cmpg-double v4, v4, v6

    if-gez v4, :cond_3

    .line 97
    iget-object v4, p0, Lcom/vk/music/dto/Thumb;->urls:Landroid/util/SparseArray;

    invoke-virtual {v4, v3}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    goto :goto_1

    .line 99
    :cond_3
    iget-object v4, p0, Lcom/vk/music/dto/Thumb;->urls:Landroid/util/SparseArray;

    add-int/lit8 v5, v3, 0x1

    invoke-virtual {v4, v5}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    goto :goto_1

    .line 92
    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 104
    .end local v1    # "diff1":I
    .end local v2    # "diff2":I
    :cond_5
    iget-object v4, p0, Lcom/vk/music/dto/Thumb;->urls:Landroid/util/SparseArray;

    add-int/lit8 v5, v0, -0x1

    invoke-virtual {v4, v5}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    goto :goto_1
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 3
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 68
    iget v2, p0, Lcom/vk/music/dto/Thumb;->width:I

    invoke-virtual {p1, v2}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 69
    iget v2, p0, Lcom/vk/music/dto/Thumb;->height:I

    invoke-virtual {p1, v2}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 70
    iget-object v2, p0, Lcom/vk/music/dto/Thumb;->urls:Landroid/util/SparseArray;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/vk/music/dto/Thumb;->urls:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v0

    .line 71
    .local v0, "count":I
    :goto_0
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 72
    if-lez v0, :cond_1

    .line 73
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, v0, :cond_1

    .line 74
    iget-object v2, p0, Lcom/vk/music/dto/Thumb;->urls:Landroid/util/SparseArray;

    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v2

    invoke-virtual {p1, v2}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 75
    iget-object v2, p0, Lcom/vk/music/dto/Thumb;->urls:Landroid/util/SparseArray;

    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p1, v2}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 73
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 70
    .end local v0    # "count":I
    .end local v1    # "i":I
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 78
    .restart local v0    # "count":I
    :cond_1
    return-void
.end method
